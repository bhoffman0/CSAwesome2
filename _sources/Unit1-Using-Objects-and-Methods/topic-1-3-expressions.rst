.. include:: ../common.rst


|Time90|

Expressions and Output 
==============================

Output
----------

.. index::
   single: output
   single: String
   single: String literal

Java has two different methods to print output to the screen:

- **System.out.println(value)** : prints the value followed by a new line (ln)
- **System.out.print(value)** : prints the value without advancing to the next line


``System.out.println("Hi there!");`` prints out the characters between the first ``"`` and the second ``"`` followed by a new line.  The ``"Hi there!"`` is called a **string literal** which is zero to many characters enclosed in starting and ending double quotes. A **literal** is the code representation of a fixed value, which can be a string or a numerical value. 

.. activecode:: printCommands
   :language: java
   :autograde: unittest

   Run this code to see the output below it. How would you change it to print the ! on the same line as Hi there keeping all 3 print statements?
   ~~~~
   public class MyClass
   {
       public static void main(String[] args)
       {
           System.out.print("Hi ");
           System.out.println("there");
           System.out.print("!");
       }
   }

   ====
   // should pass if/when they run code
   import static org.junit.Assert.*;

   import org.junit.*;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void testMain() throws IOException
       {
           String output = getMethodOutput("main");
           String expect = "Hi there!";
           boolean passed =
                   getResults(expect, output, "Expected output from main");
           assertTrue(passed);
       }

       @Test
       public void testLineCount() throws IOException
       {
           String output = getMethodOutput("main");
           String expect = "1 output line";
           String actual = "  output line";

           if (output.length() > 0)
           {
               actual = output.split("\n").length + actual;
           }
           else
           {
               actual = output.length() + actual;
           }
           boolean passed =
                   getResults(expect, actual, "Checking lines of output");
           assertTrue(passed);
       }
   }

What if you wanted to print out a double quote " character? Since the double quote " is a special character with meaning in Java, we put in a backslash in front of the quote to signal that we want just the character. This is called a **backslash escape sequence**. And if you wanted to print out a backslash, you would have to backslash it too in order to escape its special meaning. Another useful backslashed character is backslash \\n which will put in a newline.

.. activecode:: bhescape
   :language: java
   :autograde: unittest

   Here are the escape sequences that may be used in the AP course.
   ~~~~
   public class TestEscape
   {
       public static void main(String[] args)
       {
           String message =
                   "Here is a backslash quote \" "
                           + " and a backslashed backslash (\\) "
                           + "Backslash n \n prints out a new line.";
           System.out.println(message);
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
           String expect = output;
           boolean passed = getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }



Expressions and Operators
--------------------------

**Arithmetic Expressions** consist of numeric values, variables, and arithmetic operators that evaluate to a single numerical value.  For example, the expression ``2 + 3`` evaluates to 5.  



.. index::
    single: expression
    single: operators
    pair: math; operators
    pair: operators; addition
    pair: operators; subtraction
    pair: operators; multiplication
    pair: operators; division
    pair: operators; equality
    pair: operators; inequality

Java uses the standard mathematical operators for addition (``+``), subtraction
(``-``), and division (``/``). The multiplication operator is written as ``*``, as
it is in most programming languages, since the character sets used until
relatively recently didn’t have a character for a real multiplication sign,
``×``, and keyboards still don’t have a key for it or for ``÷``. (You may have noticed that ``+`` was also used to combine
``String`` and other values into new ``String``\ s. More on this later.)

Arithmetic expressions can be of type ``int`` or ``double``. An arithmetic
expression consisting only of ``int`` values will evaluate to an ``int`` value.
An arithmetic expression that uses at least one ``double`` value will evaluate
to a ``double`` value. This means that when you are doing division with two integers, you will get an integer result and the decimal part of the result will be thrown away. This is called **truncating division**. If you want a double result, you should make at least one of the values in the expression a double like 2.0. 


|CodingEx| **Coding Exercise:**

.. activecode:: lcop1
   :language: java
   :autograde: unittest

   Run the code below to see all the operators in action. Do all of those operators do what you expected? What about 2 / 3? Isn't it surprising that it prints 0?  See the note above about truncating division with integers. Change the code to make it print the decimal part of the division too. You can do this by making at least one of the numbers a double like 2.0.
   ~~~~
   public class Test1
   {
       public static void main(String[] args)
       {
           System.out.println(2 + 3);
           System.out.println(2 - 3);
           System.out.println(2 * 3);
           System.out.println(2 / 3);
       }
   }
   ====
   import static org.junit.Assert.*;
   import org.junit.Test;
   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect = "5\n-1\n6\n" + 2.0/3;
           boolean passed =
                   getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }


Math errors sometimes lead to runtime errors in code. For example, when the Hubble Space Telescope was launched to space in 1990, a math coding error in a formula caused it to point in the wrong direction! It missed its target stars by about half a degree which is about the width of the moon seen from Earth (https://scholar.lib.vt.edu/VA-news/ROA-Times/issues/1990/rt9005/900510/05100615.htm). Thorough testing is the only way to make sure there are no logic errors that will cause runtime errors in your code. Try the following example that tries to convert centimeters to inches. Can you fix the runtime error?

|CodingEx| **Coding Exercise:**

.. activecode:: cm2in-runtime-error
   :language: java
   :autograde: unittest
   :practice: T

   The following code is trying to convert centimeters to inches, but it has a math error. Run the code to see that there are no error messages, but it simply does the wrong calculation! Can you fix the logic error in the code? 1 inch = 2.54 cms.
   ~~~~
   public class CmToInches
   {
       public static void main(String[] args)
       {
           System.out.print("100 centimeters in inches is: ");
           System.out.println(100 * 2.54);
       }
   }
   ====
   import static org.junit.Assert.*;
   import org.junit.Test;
   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void test1() throws IOException 
       {
           String output = getMethodOutput("main");
           String expect = "" + 100/2.54;
           boolean passed =
                   getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
       @Test
       public void test2() 
       {
           String target = "/";
           boolean passed = checkCodeContains("the division operator", target);
           assertTrue(passed);
       }
   }

Another runtime error that is possible in math expressions is dividing by zero which is undefined in mathematics. An attempt to divide an integer by the integer 0 will result in an **ArithmeticException** in Java, as we saw in the first lesson. Try it in one of the active codes to see what happens.

Compound Expressions
---------------------

Expressions can be combined into **compound expressions** with multiple operators.  When compound expressions are evaluated, **operator precedence** rules are used, just like when we do math (remember PEMDAS?), so that multiplication ``*``, division ``/``, and remainder ``%`` are done before addition ``+`` and subtraction ``-``. However, anything in parentheses is done first. It doesn't hurt to put in extra parentheses if you are unsure as to what will be done first or just to make it more clear.

|CodingEx| **Coding Exercise:**



.. activecode:: compound1
   :language: java
   :autograde: unittest

   In the example below, try to guess what it will print out and then run it to see if you are right. Remember to consider **operator precedence**. How do the parentheses change the precedence?
   ~~~~
   public class TestCompound
   {
       public static void main(String[] args)
       {
           System.out.println(2 + 3 * 2);
           System.out.println((2 + 3) * 2);
           System.out.println(2 + (3 * 2));
       }
   }

   ====
   // Test Code for Lesson 1.4 Expressions - compounds
   import static org.junit.Assert.*;

   import org.junit.Test;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect = "8\n10\n8";
           boolean passed =
                   getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }

The Remainder Operator
----------------------

The operator ``%`` in Java is the **remainder** operator. Like the other
arithmetic operators is takes two operands. Mathematically it returns the
remainder after dividing the first number by the second, using truncating integer division. 
For instance, ``5 % 2`` evaluates to 1 since 2 goes into 5 two times
with a remainder of 1.

While you may not have heard of remainder as an operator, think back to
elementary school math. Remember when you first learned long division, before
they taught you about decimals, how when you did a long division that didn’t
divide evenly, you gave the answer as the number of even divisions and the
remainder. That remainder is what is returned by this operator. In the figures
below, the remainders are the same values that would be returned by ``2 % 3``
and ``5 % 2``.

.. figure:: Figures/mod-py.png
    :width: 150px
    :align: center
    :figclass: align-center

    Figure 1: Long division showing the integer result and the remainder

Sometimes people—including Professor Lewis in the next video—will call ``%``
the **modulo**, or **mod**, operator. That is not actually correct though the
difference between remainder and modulo, which uses Euclidean division instead 
of truncating integer division, only matters when negative operands are involved 
and the signs of the operands differ. With positive operands, remainder and mod give the same results. 
Java does have a method ``Math.floorMod`` in the ``Math`` class if you need to use modulo instead of remainder, but ``%`` is all you need in the AP exam.

.. |video2| raw:: html

   <a href="https://www.youtube.com/watch?v=jp-T9lFISlI&ab_channel=colleenlewis" target="_blank">video</a>

Here’s the |video2|.

.. youtube:: jp-T9lFISlI
    :width: 700
    :height: 415
    :align: center


|CodingEx| **Coding Exercise:**

.. activecode:: lcop2
   :language: java
   :autograde: unittest

   In the example below, try to guess what it will print out and then run it to see if you are right.
   ~~~~
   public class Test1
   {
       public static void main(String[] args)
       {
           System.out.println(11 % 10);
           System.out.println(3 % 4);
           System.out.println(8 % 2);
           System.out.println(9 % 2);
       }
   }

   ====
   // Test Code for Lesson 1.4 Expressions - lcop2
   import static org.junit.Assert.*;

   import org.junit.Test;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect = "1\n3\n0\n1";
           boolean passed =
                   getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }

.. note::
   The result of x % y when x is smaller than y is always x.  The value y can't go into x at all (goes in 0 times), since x is smaller than y, so the result is just x.  So if you see 2 % 3 the result is 2.

.. index::
   single: modulo
   single: remainder
   pair: operators; modulo
   pair: operators; remainder

|Exercise| **Check Your Understanding**

.. mchoice:: mcq-rem1
   :practice: T
   :answer_a: 15
   :answer_b: 16
   :answer_c: 8
   :correct: c
   :feedback_a: This would be the result of 158 divided by 10.  % gives you the remainder.
   :feedback_b: % gives you the remainder after the division.
   :feedback_c: When you divide 158 by 10 you get a remainder of 8.

   What is the result of 158 % 10?

.. mchoice:: mcq-rem2
   :practice: T
   :answer_a: 3
   :answer_b: 2
   :answer_c: 8
   :correct: a
   :feedback_a: 8 goes into 3 no times so the remainder is 3.  The remainder of a smaller number divided by a larger number is always the smaller number!
   :feedback_b: This would be the remainder if the question was 8 % 3 but here we are asking for the reminder after we divide 3 by 8.
   :feedback_c: What is the remainder after you divide 3 by 8?

   What is the result of 3 % 8?





|Groupwork| Programming Challenge : Pay Calculator
---------------------------------------------------

.. figure:: Figures/dollarSign.png
    :width: 100px
    :align: left

In this programming challenge, you can work in pairs to create a pay calculator using math expressions and operators. 

.. activecode:: challenge1-3-pay-calculator
   :language: java
   :autograde: unittest
   :practice: T

   Complete the following expressions for a pay calculator.
   ~~~~
   public class Challenge1_3_Pay_Calculator
   {
      public static void main(String[] args)
      {
          // Put in the math operator between 4 and 10 below to compute 
          // the pay for 4 hours of work at 10 dollars per hour.
          System.out.println("Pay for 4 hours of work at 10 dollars an hour");
          System.out.println(4  10);
          
          // Put in the math operator to compute the number of hours worked 
          // if the pay is 120 dollars and the rate is 15 dollars per hour.
          System.out.println("Number of hours worked for pay 120 dollars & rate 15 dollars per hour");
          System.out.println(120  15);
          
          // Put in the math expression to compute the pay 
          //  for 12 hours of work at 7.50 dollars per hour.
          System.out.println("Pay for 12 hours of work at 7.50 dollars an hour");
          System.out.println(        );
        
          // Put in the math expression to compute the integer number of 
          // hours worked if the pay is 100 dollars and the rate is 9 dollars per hour.
          System.out.println("Number of int hours worked for pay 100 dollars & rate 9 dollars per hour");
          System.out.println(        );

          // Put in the math operator to give the remainder when 
          //  100 dollars is divided by 9 dollars per hour. 
          System.out.println("The remainder of 100 dollars divided by 9 dollars per hour");
          System.out.println(        ); 
         
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
                   "40\n"
                   + "8\n"
                   + "90.0\n"
                   + "11\n"
                   + "1\n";
           boolean passed =
                   getResults(expect, output, "Expected output from main");
           assertTrue(passed);
       }

       @Test
       public void test1() throws IOException 
       {
           String target = "100/9";
           boolean passed = checkCodeContains("expression 100/9", target);
           assertTrue(passed);
       }
       @Test
       public void test2() throws IOException 
       {
           String target = "100%9";
           boolean passed = checkCodeContains("expression 100 % 9", target);
           assertTrue(passed);
       }
   }    



Summary
-------------------

- In Java, `System.out.print` and `System.out.println` are output statements that display information on the computer screen. `System.out.println` moves the cursor to a new line after the information has been displayed, while `System.out.print` does not.

- **Escape sequences** are special sequences of characters that can be included in a string. They start with a `\` and have a special meaning in Java. Escape sequences used in this course include double quote `\”`, backslash `\`, and newline `\n`.

- A **literal** is the code representation of a fixed value, which can be a string or a numerical value. A **string literal** is zero to many characters enclosed in starting and ending double quotes. 

- **Arithmetic expressions**, which consist of numeric values, variables, and operators, include expressions of type  ``int`` and ``double``.

- The arithmetic **operators** consist of ``+``, ``-``, ``*`` , ``/``, and ``%``
  also known as addition, subtraction, multiplication, division, and remainder. 

- The **remainder operator %** is used to compute the remainder when one number is divided by another number.

- An arithmetic operation that uses two ``int`` values will evaluate to an
  ``int`` value. With integer division, any decimal part in the result will be
  thrown away.

- An arithmetic operation that uses at least one ``double`` value will evaluate
  to a ``double`` value. 

- Multiple operators can be used to combine expressions into **compound expressions**.

- During evaluation, numeric values are associated with operators according to
  **operator precedence** to determine how they are grouped. (``*``, ``/``,
  ``%`` have precedence over ``+`` and ``-``, unless parentheses are used to
  group those.)

- An attempt to divide an integer by zero will result in an ``ArithmeticException``.



AP Practice
------------

.. mchoice:: AP1-3-1
    :practice: T

    Consider the following code segment.

    .. code-block:: java

       System.out.println("Java is ");
       System.out.println("fun ");
       System.out.print("and cool!");

    What is printed as a result of executing the code segment?

    - .. raw:: html

         <pre>Java is fun and cool!</pre>

      - Notice the println in line 2.

    - .. raw:: html

         <pre>
         Java isfun
         and cool!
         </pre>

      - Notice the space after is in the first line.

    - .. raw:: html

         <pre>Java is
         fun
         and cool!  </pre>

      - Notice that the first line is a print, not println.

    - .. raw:: html

         <pre>Java is fun
         and cool!  </pre>

      + Correct! Pay attention to which lines are print or println.


.. mchoice:: apcsa_sample1_exp
   :practice: T
   :answer_a: 0.666666666666667
   :answer_b: 9.0
   :answer_c: 10.0
   :answer_d: 11.5
   :answer_e: 14.0
   :correct: c
   :feedback_a: Don't forget that division and multiplication will be done first due to operator precedence.
   :feedback_b: Don't forget that division and multiplication will be done first due to operator precedence.
   :feedback_c: Yes, this is equivalent to (5 + ((5/2)*3) - 1).
   :feedback_d: Don't forget that division and multiplication will be done first due to operator precedence, and that an int/int gives an int truncated result where everything to the right of the decimal point is dropped.
   :feedback_e: Don't forget that division and multiplication will be done first due to operator precedence.

   Consider the following code segment.

   .. code-block:: java

       System.out.println(5 + 5 / 2 * 3 - 1);

   What is printed when the code segment is executed?
