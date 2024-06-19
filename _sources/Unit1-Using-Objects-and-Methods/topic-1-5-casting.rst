.. include:: ../common.rst

.. qnum::
   :prefix: 1-5-
   :start: 1

|Time45|

Casting and Ranges of Values
============================

In Java, **type casting** is used to convert values from one type to another. By
**casting** we don't mean something to do with fishing, but it is a similar idea
to casting a bronze, without needing to heat anything to 913 degrees Celsius.
But like molten bronze is reshaped by melting it and pouring it into a mold, our
data is reshaped via a **cast** operator. In Java when you cast you are changing
the "shape" (or type) of the value.

.. figure:: Figures/bronze-casting.jpg
    :width: 300px
    :figclass: align-center

    Figure 1: Bronze casting changes the shape of the metal. 


The **cast operator**, which looks like ``(int)`` and ``(double)`` placed before
any expression (a literal, a number, a variable, or more complex expression in
parentheses) produces a value of the given type by converting the value of the
original expression to the new type.

For example, ``(double) 1 / 3`` will evaluate to a ``double`` value instead of an
``int``. Run this code to find how Java handles division and what casting can do
to the results. Notice what happens when you divide an ``int`` by an ``int`` or
an ``int`` by a ``double`` or an ``int`` cast to a ``double`` divided by an
``int``.

.. activecode:: lcct1
   :language: java
   :autograde: unittest

   What happens when you divide an int by an int or with a double operand or with the type cast (double) on one of the operands?
   ~~~~
   public class OperatorTest
   {
       public static void main(String[] args)
       {
           System.out.println(1 / 3);          // int divided by int
           System.out.println(1.0 / 3);        // double divided by int
           System.out.println(1 / 3.0);        // int divided by double
           System.out.println((double) 1 / 3); // int cast to double, divided by int
       }
   }

   ====
   import static org.junit.Assert.*;

   import org.junit.*;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void testMain() throws IOException
       {
           String output = getMethodOutput("main");
           String expect =
                   "0\n"
                       + "0.3333333333333333\n"
                       + "0.3333333333333333\n"
                       + "0.3333333333333333\n";
           boolean passed =
                   getResults(expect, output, "Expected output from main");
           assertTrue(passed);
       }
   }

When Java divides two ``int``\ s, it produces an ``int`` result by truncating
the actual mathematical result, removing anything after the decimal point. Thus
``9 / 10`` evaluates to ``0``, not ``0.9``. It also does not evaluate to ``1``;
truncating is not the same as rounding!

But in any expression involving a ``double``, the ``double`` is “contagious” and
will cause the value of that expression to also be a ``double``. Thus the
expression ``9.0 / 10`` is evaluated as if it had been written ``9.0 / 10.0`` and
produces the ``double`` value ``0.9``.

Casting an ``int`` to ``double``, as shown in the code above, produces a
``double`` value which will then causes any expression it is part of to produce
a ``double``. This is especially useful when you have ``int`` variables that
you want to do non-integer division with:

.. code-block:: java

   int total; // a variable containing the sum of a bunch of ints
   int count; // the number of ints that went into total

   // Compute the average of the bunch of ints summed into total.
   double average = (double) total / count;

A conversion from ``int`` to ``double`` is called a **widening conversion**
because a ``double`` can represent any ``int`` value but not vice versa; thus a
``double`` is considered a wider data type than an ``int``.

.. note::

   ``int``\ s in Java are always 32-bit signed values which mean they can
   represent values from :math:`-2^{31}` to :math:`2^{31} - 1`, inclusive, while
   the range of consecutive integer values that can be represented by a double
   is from :math:`-2^{53}` to :math:`2^{53}`, inclusive. (A ``double`` can also
   represent much larger values but with limited precision.) You can refer to
   the minimum and maximum ``int`` values with the constants
   ``Integer.MIN_VALUE`` and ``Integer.MAX_VALUE``.

Values of type ``double`` in the range that can be represented by an ``int`` can
be rounded to the nearest ``int`` by adding or subtracting 0.5 and then casting
the result with ``(int)``:

.. code-block:: java

    double number;    // positive value from somewhere
    double negNumber; // negative value from somewhere

    int nearestInt = (int)(number + 0.5);
    int nearestNegInt = (int)(negNumber – 0.5);

For example, if you divide ``7.0 / 4.0`` you get ``1.75``. If you cast that to
an ``int``, it will be truncated to ``1``. However if we want to round a
``double`` rather than truncating it, adding ``0.5`` will produce a number that
is above the next integer value if the decimal part is greater than ``0.5``, as
it is here. Then casting *that* value to an ``int`` will truncate down. So in
this case ``1.75 + 0.5`` gives us ``2.25`` which is then truncated to ``2``. On
the other hand adding ``0.5`` to the result of evaluating ``5.0 / 4.2``, namely
``1.25``, only gets us to ``1.75`` which truncates back to ``1`` which is the
nearest integer to ``1.25``.

.. activecode:: nearestInt
   :language: java
   :autograde: unittest

   Run the code below to see how the formula of adding or subtracting .5 and
   then casting with (int) rounds a positive or negative double number to the
   closest int.

   ~~~~
   public class NearestInt
   {
       public static void main(String[] args)
       {
           double number = 5.0 / 3;
           int nearestInt = (int) (number + 0.5);
           System.out.println("5.0/3 = " + number);
           System.out.println("5/3 truncated: " + (int) number);
           System.out.println("5.0/3 rounded to nearest int: " + nearestInt);
           double negNumber = -number;
           int nearestNegInt = (int) (negNumber - 0.5);
           System.out.println(
                   "-5.0/3 rounded to nearest negative int: " + nearestNegInt);
       }
   }

   ====
   import static org.junit.Assert.*;

   import org.junit.*;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void testMain() throws IOException
       {
           String output = getMethodOutput("main");
           String expect =
                   "5.0/3 = 1.6666666666666667\n"
                       + "5/3 truncated: 1\n"
                       + "5.0/3 rounded to nearest int: 2\n"
                       + "-5.0/3 rounded to nearest negative int: -2\n";

           boolean passed =
                   getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }

.. index::
   pair: double; number of digits


What happens to repeating decimal numbers like 3.333333...?  Java limits the number of digits you can save for any ``double`` number to about 14-15 digits. You should be aware that the accuracy of any calculation on a computer is limited by the fact that computers can only hold a limited number of digits.

For example, int values are stored in 4 bytes of memory. There is an
``Integer.MAX_VALUE`` defined as 2147483647 and an ``Integer.MIN_VALUE`` defined
as -2147483648. If you try to store any number larger or smaller than these
numbers in an int variable, it will result in an **integer overflow** where an
incorrect value could be stored. Try it below.

.. activecode:: overfl
   :language: java
   :autograde: unittest

   Try the code below to see two integer overflows for a positive and negative number. An int cannot hold that many digits! Fix the integer overflow by deleting the last 0 in the numbers to store less digits.
   ~~~~
   public class TestOverflow
   {
       public static void main(String[] args)
       {
           int id = 2147483650; // overflow
           int negative = -2147483650; // overflow
       }
   }
   ====
   import static org.junit.Assert.*;

   import org.junit.*;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void testMain() throws IOException
       {
           String output = getMethodOutput("main");
           String expect = "214748365\n-214748365\n";

           boolean passed =
                   getResults(
                           expect, output, "Fixed Integer Overflow Error", true);
           assertTrue(passed);
       }
   }

.. index::
   pair: double; precision format

Although it's not on the AP exam, you can format long decimal numbers to just show 2 digits after the decimal point with the following code:

.. activecode:: double_precision
   :language: java
   :autograde: unittest

   Run the code below to see how a decimal number can be formatted to show 2 digits after the decimal point.
   ~~~~
   public class TestFormat
   {
       public static void main(String[] args)
       {
           double number = 10 / 3;
           System.out.println(number);
           System.out.println(String.format("%.02f", number));
       }
   }

   ====
   import static org.junit.Assert.*;

   import org.junit.*;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void testMain() throws IOException
       {
           String output = getMethodOutput("main");
           String expect = "3.0\n3.00\n";

           boolean passed =
                   getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }

|Exercise| **Check your understanding**

.. mchoice:: q2_5
   :practice: T
   :answer_a: true
   :answer_b: false
   :correct: b
   :feedback_a: Did you try this out in Active Code?  Does it work that way?
   :feedback_b: Java throws away any values after the decimal point if you do integer division.  It does not round up automatically.

   True or false: Java rounds up automatically when you do integer division.

.. mchoice:: q2_6
   :practice: T
   :answer_a: true
   :answer_b: false
   :correct: b
   :feedback_a: Try casting to int instead of double.  What does that do?
   :feedback_b: Casting results in the type that you cast to. However, if you can't really cast the value to the specified type then you will get an error.

   True or false: casting always results in a double type.

.. mchoice:: q2_7
   :practice: T
   :answer_a: (double) (total / 3);
   :answer_b: total / 3;
   :answer_c: (double) total /  3;
   :correct: c
   :feedback_a: This does integer division before casting the result to double so it loses the fractional part.
   :feedback_b: When you divide an integer by an integer you get an integer result and lose the fractional part.
   :feedback_c: This will convert total to a double value and then divide by 3 to return a double result.

   Which of the following returns the correct average for a total that is the sum of 3 int values?

|Groupwork| Programming Challenge : Average 3 Numbers
------------------------------------------------------

This would be a good project to work together in pairs, and switch drivers (who has control of the keyboard in pair programming) after every line of code. In the code below, type in three made up int grades and then sum and average them. Use casting to report the result as a double. For example, if the grades are 90, 100, and 94, the sum of the three numbers is 90 + 100 + 94 = 284, and the average is the sum 284 divided by 3 which casted to a double is 94.666667. You should use your variables instead of the numbers in your formulas. Follow the pseudocode below.


.. activecode:: challenge1-6-average
   :language: java
   :autograde: unittest
   :practice: T

   Type in three made up int grades and then sum and average them. Use type casting to report the result as a double. If you do this challenge on replit.com (see template and links below), please paste your repl link here to turn it in.
   ~~~~
   public class Challenge1_6
   {
       public static void main(String[] args)
       {
           // 1. Declare 3 int variables called grade1, grade2, grade3
           // and initialize them to 3 values

           // 2. Declare an int variable called sum for the sum of the grades

           // 3. Declare a variable called average for the average of the grades

           // 4. Write a formula to calculate the sum of the 3 grades (add them
           // up).

           // 5. Write a formula to calculate the average of the 3 grades from
           // the sum using division and type casting.

           // 6. Print out the average

       }
   }

   ====
   import static org.junit.Assert.*;

   import org.junit.*;

   import java.io.*;
   import java.util.regex.MatchResult;
   import java.util.regex.Pattern;

   /* Do NOT change Main or CodeTestHelper.java.
   Put the active code exercise in a file like ForLoop.java.
   Put your Junit test in the file RunestoneTests.java.
   Run. Test by changing ForLoop.java (student code).
   */

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void test4() throws IOException
       {
           String actual = getMethodOutput("main");
           String expect = "double value";

           boolean passed = actual.matches("[\\s\\S]*[0-9]+.[0-9]+[\\s\\S]*");

           if (!passed)
           {
               getResults(
                       expect,
                       actual,
                       "Checking that output is a double value",
                       passed);
               assertTrue(passed);
               return;
           }

           String code = getCode();
           String regex = "grade[0-9]=[0-9]+";

           String[] matches =
                   Pattern.compile(regex)
                           .matcher(removeSpaces(code))
                           .results()
                           .map(MatchResult::group)
                           .toArray(String[]::new);

           int[] grades = new int[3];

           String hint = "";

           if (matches.length > 3)
           {
               hint = "\n(Did you declare too many grade variables?)";
           }
           else if (matches.length < 3)
           {
               hint = "\n(Did you declare too few grade variables?)";
           }

           for (int i = 0; i < grades.length && i < matches.length; i++)
           {
               String val = matches[i].substring(matches[i].indexOf("=") + 1);
               grades[i] = Integer.parseInt(val);
           }

           double exp =
                   (double) (grades[0] + grades[1] + grades[2]) / matches.length;

           passed =
                   getResults(
                           "" + exp,
                           actual,
                           "Checking that calculation is correct" + hint);
           assertTrue(passed);
       }

       @Test
       public void test1() throws IOException
       {
           String code = removeSpaces(getCode());

           String expect = "Declared grade1, grade2, grade3, and average";
           String actual = "";
           String hint = "";

           boolean passed = true;

           String regex = "grade[1-3]=[0-9]+";

           String[] matches =
                   Pattern.compile(regex)
                           .matcher(removeSpaces(code))
                           .results()
                           .map(MatchResult::group)
                           .toArray(String[]::new);

           if (matches.length != 3)
           {
               passed = false;
               actual += "Declared " + matches.length + " grade variables\n";
           }

           if (!code.contains("doubleaverage"))
           {
               passed = false;
               actual += "Did not declare average as a double";
           }

           if (!passed)
           {
               hint = "\n(Check spelling and capitalization)";
           }
           else
           {
               actual = expect;
           }

           getResults(
                   expect,
                   actual.trim(),
                   "Checking that variables have been declared properly" + hint,
                   passed);
           assertTrue(passed);
       }

       @Test
       public void test3() throws IOException
       {
           String code = getCode();
           String[] lines = code.split("\n");

           String expect = "(double)";
           String actual = "Cast expression as a double";

           boolean passed = false;

           if (!code.contains("(double)"))
           {
               passed = false;
               actual = "no (double)";
           }

           for (int i = 0; i < lines.length; i++)
           {
               String line = lines[i];

               if (line.contains("(double)"))
               {
                   passed = true;
                   actual = line.trim();
                   break;
               }
           }

           getResults(
                   expect,
                   actual,
                   "Checking that expression was cast as a double",
                   passed);
           assertTrue(passed);
       }

       @Test
       public void test2() throws IOException
       {
           String codeAll = getCode();
           String[] lines = codeAll.split("\n");

           String expect = "grade1 + grade2 + grade3\nsum / 3";
           String actual1 = "", actual2 = "";
           String hint = "";

           boolean passed = false;

           String regex = "grade[1-3]+\\+grade[1-3]+\\+grade[1-3]";

           for (int i = 0; i < lines.length; i++)
           {
               String code = lines[i];
               String noSpaces = removeSpaces(code);

               if (noSpaces.matches("[\\s\\S]*" + regex + "[\\s\\S]*"))
               {
                   passed = true;
                   actual1 = code.trim();
                   break;
               }
           }

           regex = "/3";

           for (int i = 0; i < lines.length; i++)
           {
               String code = lines[i];
               String noSpaces = removeSpaces(code);

               if (noSpaces.matches("[\\s\\S]*" + regex + "[\\s\\S]*"))
               {
                   passed = true;
                   actual2 = code.trim();
                   break;
               }
           }

           String actual = "No such expressions";

           if (actual1.length() > 0 || actual2.length() > 0)
           {
               actual = (actual1 + "\n" + actual2);
           }

           if (!passed)
           {
               hint = "\n(Check spelling and capitalization)";
           }

           getResults(
                   expect,
                   actual,
                   "Checking that grades have been added together and divided by"
                       + " 3"
                           + hint,
                   passed);
           assertTrue(passed);
       }
   }

.. |repl| raw:: html

   <a href="https://replit.com" target="_blank">replit</a>


.. |Scanner| raw:: html

   <a href="https://www.w3schools.com/java/java_user_input.asp" target="_blank">Scanner class</a>

.. |repl template| raw:: html

   <a href="https://firewalledreplit.com/@BerylHoffman/Challenge1-6-Average-Template#Main.java" target="_blank">repl template</a>

Your teacher may suggest that you use a Java IDE like |repl| for this challenge so that you can use input to get these values using the |Scanner|. Here is a |repl template| that you can use to get started if you want to try the challenge with input.


.. |Unicode| raw:: html

   <a href="https://en.wikipedia.org/wiki/List_of_Unicode_characters" target="_blank">Unicode</a>

.. |Chinese character| raw:: html

   <a href="https://unicodelookup.com/#cjk/1" target="_blank">Chinese character</a>

.. |Unicode Lookup| raw:: html

   <a href="https://unicodelookup.com/" target="_blank">Unicode Lookup</a>

.. |emoji| raw:: html

   <a href="http://unicode.org/emoji/charts/full-emoji-list.html" target="_blank">emoji</a>

Bonus Challenge : Unicode
-------------------------------------

If you get done early with the previous challenge, here's something else fun you
can do in Java, although it's not covered in the AP exam.

Java was one of the first programming languages to use |UNICODE| for its
characters rather than ASCII. While ASCII could represent 128 characters which
was plenty for English, Unicode is an international standard that tries to
assign a number (which they like to call a “codepoint”) to every character in
every language. Unicode codepoints are traditionally represented in hex code (a
base 16 code that uses the digits 0-9 and the letters A-F for 10-15), so you
might see things like ``U+1F600``. But they’re just numbers. That last one is
the same as ``128512``.

When Java was released in an 1996, Unicode had been around for five years and
the Unicode people had declared they would only ever need 2\ :sup:`16` or 65,536
code points to represent all the characters used in the world. So Java included
a ``char`` data type that can hold exactly 2\ :sup:`16` values. Then, seven
months later, the Unicode folks, said, “Ooops, that’s not enough”, and extended
their system to its current size of 1,112,064 possible codepoints. (As of
September 2022, 149,186 have actually been used.)

That made ``char`` kind of obsolete. But while not every Unicode codepoint can
be represented in a Java ``char``, you can use an ``int`` to represent a
codepoint and the method ``Character.toString`` to translate an ``int`` into a
``String`` containing the character for that codepoint. (You might see older
Java code that casts numbers to ``char``; for many codepoints that will work but
not on more recently added codepoints including, critically those for Emoji. 😞
So better to use ``Character.toString`` and ignore ``char``.)

Try the following program which prints out an English “A”, a 
|Chinese character|, and an |emoji|. Then look up other characters at this 
|Unicode Lookup| site and change the code to print them out. (Use the Dec column in site
to get the decimal number.) Can you print out letters from 3 different
languages?

.. activecode:: challenge1-6-unicode
   :language: java
   :autograde: unittest

   Can you print out a letter from 3 different languages using this |Unicode
   Lookup| site?

   ~~~~
   public class ChallengeUnicode
   {
       public static void main(String[] args)
       {
           System.out.println(
                   "'A' in ASCII and Unicode: " + Character.toString(65));
           System.out.println("Chinese for 'sun': " + Character.toString(11932));
           System.out.println("A smiley emoji: " + Character.toString(128512));

           // Old style. Doesn't work for all codepoints.
           System.out.println("This also works: " + (char) 65);
           System.out.println("But this doesn't: " + (char) 128512);
       }
   }

   ====
   import static org.junit.Assert.*;

   import org.junit.*;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void testCount()
       {
           String code = getCodeWithoutComments();
           int count = countOccurences(code, "Character.toString");
           boolean passed = count >= 4;
           passed =
                   getResults(
                           "4+",
                           "" + count,
                           "Counting number of Character.toString",
                           passed);
           assertTrue(passed);
       }
   }

Summary
-------------------

- **Type casting** is used to convert value from one type to another.

- The casting operators ``(int)`` and ``(double)`` can be used to create a
  temporary value converted to a different data type.

- Casting a ``double`` value to an ``int`` causes the digits to the right of the
  decimal point to be truncated (cut off and thrown away).

- In expressions involving ``double``\ s, the ``double`` values are contagious,
  causing ``int``\ s in the expression to be automatically converted to the
  equivalent ``double`` value so the result of the expression can be computed as
  a ``double``.

- Values of type ``double`` can be rounded to the nearest integer by (int)(x +
  0.5) or (int)(x – 0.5) for negative numbers.

- Integer values in Java are represented by values of type ``int``, which are
  stored using a finite amount (4 bytes) of memory. Therefore, an int value must
  be in the range from ``Integer.MIN_VALUE`` to ``Integer.MAX_VALUE``,
  inclusive.

- If an expression would evaluate to an int value outside of the allowed range,
  an integer overflow occurs. This could result in an incorrect value within the
  allowed range.
