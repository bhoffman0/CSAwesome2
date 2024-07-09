#!/usr/bin/env perl

use warnings;
use strict;
use File::Basename;

# Args: oldfile newfile

# Check that oldfile exists
# Check that newfile doesn't exist
# Warn if oldfile not in the toctree.rst of the directory it's in

# git mv oldfile newfile
# Remove oldfile from the toctree.rst of its dircectory
# Add newfile at the end of the toctree.rst of its new directory

sub tocfile {
  my ($file) = @_;
  return dirname($file) . "/toctree.rst";
}

sub check_in_toctree {
  my ($file) = @_;

  my $base = basename($file);
  my $tocfile = tocfile($file);

  open(my $in, $tocfile) or die "$!: Can't open $tocfile";

  my $in_toc;

  while (<$in>) {

    if (/^\.\. toctree\:/) {
      $in_toc = 1;
    } elsif ($in_toc) {
      if (/^\S/) {
        $in_toc = 0;
      } elsif (/^(\s+)(?!:)(\S+)/) {
        my $name = $2;
        if ($name eq $base) {
          return 1;
        }
      }
    }
  }
  return 0;
}

sub remove_from_toctree {
  my ($file) = @_;

  my $base = basename($file);
  my $tocfile = tocfile($file);

  our @ARGV = ($tocfile);

  $^I = '';

  my $in_toc = 0;

  while (<>) {

    if (/^\.\. toctree\:/) {
      $in_toc = 1;
    } elsif ($in_toc) {

      if (/^\S/) {
        $in_toc = 0;

      } elsif (/^(\s+)(?!:)$base/) {
        next; # skip the file
      }
    }
    print;
  }
}

sub add_to_toctree {
  my ($file) = @_;

  my $base = basename($file);
  my $tocfile = tocfile($file);

  our @ARGV = ($tocfile);

  $^I = '';

  my $in_toc = 0;
  my $in_files = 0;

  while (<>) {

    if (/^\.\. toctree\:/) {
      $in_toc = 1;
    } elsif ($in_toc) {

      if (/^\S/) {
        $in_toc = 0;

      } elsif (/^\s*$/) {
      } elsif (/^\s+:/) {
      } else {
        if (not $in_files) {
          print STDERR "Found start of files at $.: $_";
          print "   $base\n";
        }
        $in_files = 1;
      }
    }
    print;
  }
}

my $oldfile = shift || die "Need file to move";
my $newdir = shift || die "Need directory to move to";

my $newfile = $newdir . "/" . basename($oldfile);

if (not -e $oldfile) {
  die "Can't move $oldfile. Doesn't exist.";
}

if (-e $newfile) {
  die "Can't move to $newfile. Already exists.";
}

if (not check_in_toctree($oldfile)) {
  warn "$oldfile not in TOC";
}

remove_from_toctree($oldfile);
add_to_toctree($newfile);

system("git mv $oldfile $newfile") == 0 or die $!;
system("git add " . tocfile($oldfile)) == 0 or die $!;
system("git add " . tocfile($newfile)) == 0 or die $!;
