.. include:: ../common.rst

.. qnum::
   :prefix: 1-3-
   :start: 1


Expressions and Output
==============================

Output
----------

.. index::
   single: String
   single: String literal

Java has two different methods to print output to the screen:

- **System.out.println(value)** : prints the value followed by a new line (ln)
- **System.out.print(value)** : prints the value without advancing to the next line


``System.out.println("Hi there!");`` prints out the characters between the first ``"`` and the second ``"`` followed by a new line.  The ``"Hi there!"`` is called a **string literal**, and it can have zero to many characters enclosed in starting and ending double quotes.

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
``×``, and keyboards still don’t have a key for it. Likewise no ``÷``.

You may be used to using ``^`` for exponentiation, either from a graphing
calculator or tools like Desmos. Confusingly ``^`` *is* an operator in Java,
but it has a completely different meaning than exponentiation and isn’t even
exactly an arithmetic operator. You will learn how to use the  ``Math.pow`` method to do exponents in Unit 2.

Arithmetic expressions can be of type ``int`` or ``double``. An arithmetic
expression consisting only of ``int`` values will evaluate to an ``int`` value.
An arithmetic expression that uses at least one ``double`` value will evaluate
to a ``double`` value. (You may have noticed that ``+`` was also used to combine
``String`` and other values into new ``String``\ s. More on this later.)

Java uses the operator ``==`` to test if the value on the left is equal to the
value on the right and ``!=`` to test if two items are not equal. Don't get one
equal sign ``=`` confused with two equal signs ``==``. They mean very different
things in Java. One equal sign is used to assign a value to a variable. Two
equal signs are used to test a variable to see if it is a certain value and that
returns true or false as you'll see below. Also note that using ``==`` and
``!=`` with ``double`` values can produce surprising results. Because ``double``
values are only an approximation of the real numbers even things that should be
mathematically equivalent might not be represented by the exactly same
``double`` value and thus will not be ``==``. To see this for yourself, write a
line of code below to print the value of the expression ``0.3 == 0.1 + 0.2``; it
will be ``false``!

|CodingEx| **Coding Exercise:**

.. activecode:: lcop1
   :language: java
   :autograde: unittest

   Run the code below to see all the operators in action. Do all of those operators do what you expected?  What about 2 / 3? Isn't it surprising that it prints 0?  See the note below.
   ~~~~
   public class Test1
   {
       public static void main(String[] args)
       {
           System.out.println(2 + 3);
           System.out.println(2 - 3);
           System.out.println(2 * 3);
           System.out.println(2 / 3);
           // == is to test while = is to assign
           System.out.println(2 == 3);
           System.out.println(2 != 3);
       }
   }

   ====
   // Test Code for Lesson 1.4 Expressions - iccv1
   import static org.junit.Assert.*;

   import org.junit.Test;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect = "5\n-1\n6\n0\nfalse\ntrue";
           boolean passed =
                   getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }

.. note::

   When Java sees you doing integer division (or any operation with integers) it
   assumes you want an integer result so it throws away anything after the
   decimal point in the answer. This is called **truncating division**. If you
   need a double answer, you should make at least one of the values in the
   expression a double like 2.0.


With division, another thing to watch out for is dividing by 0. An attempt to divide an integer by zero will result in an **ArithmeticException** error message. Try it in one of the active code windows above.

Compound Operators
-------------------

Operators can be used to create compound expressions with more than one operator. You can either use a **literal** value which is a fixed value like 2, or variables in them.  When compound expressions are evaluated, **operator precedence** rules are used, just like when we do math (remember PEMDAS?), so that ``*``, ``/``, and ``%`` are done before ``+`` and ``-``. However, anything in parentheses is done first. It doesn't hurt to put in extra parentheses if you are unsure as to what will be done first or just to make it more clear.

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


Here’s the `video <https://www.youtube.com/watch?v=jp-T9lFISlI&ab_channel=colleenlewis>`_.

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

.. mchoice:: q3_4_1
   :practice: T
   :answer_a: 15
   :answer_b: 16
   :answer_c: 8
   :correct: c
   :feedback_a: This would be the result of 158 divided by 10.  % gives you the remainder.
   :feedback_b: % gives you the remainder after the division.
   :feedback_c: When you divide 158 by 10 you get a remainder of 8.

   What is the result of 158 % 10?

.. mchoice:: q3_4_2
   :practice: T
   :answer_a: 3
   :answer_b: 2
   :answer_c: 8
   :correct: a
   :feedback_a: 8 goes into 3 no times so the remainder is 3.  The remainder of a smaller number divided by a larger number is always the smaller number!
   :feedback_b: This would be the remainder if the question was 8 % 3 but here we are asking for the reminder after we divide 3 by 8.
   :feedback_c: What is the remainder after you divide 3 by 8?

   What is the result of 3 % 8?






|Groupwork| Programming Challenge : Need New
------------------------------------------------



Summary
-------------------

- Arithmetic expressions include expressions of type ``int`` and ``double``.

- The arithmetic operators consist of ``+``, ``-``, ``*`` , ``/``, and ``%``
  also known as addition, subtraction, multiplication, division, and remainder.

- An arithmetic operation that uses two ``int`` values will evaluate to an
  ``int`` value. With integer division, any decimal part in the result will be
  thrown away.

- An arithmetic operation that uses at least one ``double`` value will evaluate
  to a ``double`` value.

- Operators can be used to construct compound expressions.

- During evaluation, operands are associated with operators according to
  **operator precedence** to determine how they are grouped. (``*``, ``/``,
  ``%`` have precedence over ``+`` and ``-``, unless parentheses are used to
  group those.)

- An attempt to divide an integer by zero will result in an ``ArithmeticException``.

- The assignment operator (``=``) allows a program to initialize or change the
  value stored in a variable. The value of the expression on the right is stored
  in the variable on the left.

- During execution, expressions are evaluated to produce a single value.

- The value of an expression has a type based on the types of the values and
  operators used in the expression.

AP Practice
------------

.. mchoice:: AP1-1-1
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


.. mchoice:: apcsa_sample1
   :practice: T
   :answer_a: 0.666666666666667
   :answer_b: 9.0
   :answer_c: 10.0
   :answer_d: 11.5
   :answer_e: 14.0
   :correct: c
   :feedback_a: Don't forget that division and multiplication will be done first due to operator precedence.
   :feedback_b: Don't forget that division and multiplication will be done first due to operator precedence.
   :feedback_c: Yes, this is equivalent to (5 + ((a/b)*c) - 1).
   :feedback_d: Don't forget that division and multiplication will be done first due to operator precedence, and that an int/int gives an int truncated result where everything to the right of the decimal point is dropped.
   :feedback_e: Don't forget that division and multiplication will be done first due to operator precedence.

   Consider the following code segment.

   .. code-block:: java

       int a = 5;
       int b = 2;
       double c = 3.0;
       System.out.println(5 + a / b * c - 1);

   What is printed when the code segment is executed?
