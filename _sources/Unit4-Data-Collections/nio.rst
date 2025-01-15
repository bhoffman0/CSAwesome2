


Coding Challenge: SpellChecker 2
------------------------------------

Later on?

2.  Write a method ``checkText`` that takes a String array of words which represents sentence of text and then calls your ``spellcheck`` method to check if each word in that text is spelled correctly. It should count and print out the misspelled words, and return the number of misspelled words. Some helper code is provided in the main method that will split a String of words into a String array, and remove punctuation and convert to lowercase, before calling this method. 

.. activecode:: challenge-6-3-spellchecker2
   :language: java
   :datafile: dictionary.txt
   :autograde: unittest

   Write a spellcheck() method using an enhanced for-each loop that takes a word as a parameter and returns true if it is in the dictionary array. Return false if it is not found. Write a checkText() method that takes a String[] parameter which is a sentence of text and then calls your spellcheck method above to check if each word in that text is spelled correctly using an enhanced for-each loop. It should return a count of the misspelled words. 
   ~~~~
   import java.io.*;
   import java.nio.file.*;
   import java.util.*;

   public class SpellChecker
   {
       // This dictionary includes 10,000 English words read in from the dictionary
       // file
       private String[] dictionary = new String[10000];

       /* Write a spellcheck() method using an enhanced for each loop
        * that takes a word as a parameter and returns true if it is
        * in the dictionary array. Return false if it is not found.
        */

       /* Write a checkText() method that takes a String[] parameter which is a sentence
        * of text in a String array and then calls your spellcheck method above
        * to check if each word in that text is spelled correctly.
        * Use an enhanced for each loop.
        * It should count and print out the misspelled words, and return the count.
        */

       // Do not change "throws IOException" which is needed for reading in the input
       // file
       public static void main(String[] args) throws IOException
       {
           SpellChecker checker = new SpellChecker();
           /* // Uncomment to test your method
           String word = "catz";
           System.out.println(word + " is spelled correctly? " + checker.spellcheck(word));
           System.out.println(word + " is spelled correctly? " + checker.spellcheck("cat"));

           // Testing checkText method
           String text = "Catz are cool aminals!";
           // replace punctuation symbols with empty string
           text = text.replaceAll("\\p{Punct}", "");
           // convert to lowercase
           text = text.toLowerCase();
           // split the text into a String array
           String[] words = text.split(" ");
           // Call your checkText method
           int numErrors = checker.checkText(words);
           System.out.println("There were " + numErrors + " spelling errors in " + text);
           */
       }

       // The constructor reads in the dictionary from a file
       public SpellChecker() throws IOException
       {
           // Let's use java.nio method readAllLines and convert to an array!
           List<String> lines = Files.readAllLines(Paths.get("dictionary.txt"));
           dictionary = lines.toArray(dictionary);

           /* The old java.io.* Scan/File method of reading in files, replaced by java.nio above // create File object
           File dictionaryFile = new File("dictionary.txt");

           //Create Scanner object to read File
           Scanner scan = new Scanner(dictionaryFile);

           // Reading each line of the file
           // and saving it in the array
           int i = 0;
           while(scan.hasNextLine())
           {
               String line = scan.nextLine();
               dictionary[i] = line;
               i++;
           }
           scan.close();
           */
       }
   }

   ====
   // Test for challenge-6-3-spell-checker
   import static org.junit.Assert.*;

   import org.junit.*;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       public RunestoneTests()
       {
           super("SpellChecker");
       }

       @Test
       public void testMain() throws IOException
       {
           String output = getMethodOutput("main");
           String[] lines = output.split("\\s+");
           boolean passed = lines.length >= 2;

           passed =
                   getResults(
                           "2+ lines of output",
                           lines.length + " lines of output",
                           "Expected output",
                           passed);
           assertTrue(passed);
       }

       @Test
       public void test3()
       {
           Object[] args = {"dogz"};
           String output = getMethodOutput("spellcheck", args);
           String expect = "false";

           boolean passed = getResults(expect, output, "spellcheck(\"dogz\")");
           assertTrue(passed);
       }

       @Test
       public void test4()
       {
           Object[] args = {"dog"};
           String output = getMethodOutput("spellcheck", args);
           String expect = "true";

           boolean passed =
                   getResults(
                           expect,
                           output,
                           "spellcheck(\"dog\") (If false, spellcheck may be returning false too"
                               + " soon!)");
           assertTrue(passed);
       }

       @Test
       public void testFor() throws IOException
       {
           String target = "for (int * = #; * ? #; *~)";
           boolean passed = checkCodeNotContains("for loop", target);
           assertTrue(passed);
       }

       @Test
       public void testForEach()
       {
           boolean passed = checkCodeContains("for each loop", "for(String * : dictionary)");
           assertTrue(passed);
       }

       @Test
       public void testSignature()
       {
           boolean passed =
                   checkCodeContains(
                           "Signature public int checkText(String[])",
                           "public int checkText(String[]");
           assertTrue(passed);
       }

       @Test
       public void testCheckText1()
       {
           String[] sentence = {"dogz", "are", "cool", "tuu"};
           Object[] args = {sentence};
           String output = getMethodOutput("checkText", args);
           String expect = "2";
           boolean passed =
                   getResults(
                           expect,
                           output,
                           "number of spelling errors in checkText({\"dogz\","
                               + " \"are\",\"cool\",\"tuu\"})");
           assertTrue(passed);
       }

       @Test
       public void testCheckText2()
       {
           String[] sentence = {"dogs", "are", "cool", "too"};
           Object[] args = {sentence};
           String output = getMethodOutput("checkText", args);
           String expect = "0";
           boolean passed =
                   getResults(
                           expect,
                           output,
                           "number of spelling errors in checkText({\"dogs\","
                               + " \"are\",\"cool\",\"too\"})");
           assertTrue(passed);
       }
   }

