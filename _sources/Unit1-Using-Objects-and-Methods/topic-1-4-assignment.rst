.. include:: ../common.rst

.. qnum::
   :prefix: 1-4-
   :start: 1


Assignment and Input
=====================================

Assignment Statements
---------------------

**Assignment statements** initialize or change the value stored in a variable using the assignment operator ``=``.  An assignment statement always has a single variable on the left hand side. The value of the **expression** (which can contain math operators and other variables) on the right of the ``=`` sign is stored in the variable on the left.


.. figure:: Figures/assignment.png
    :width: 350px
    :align: center
    :figclass: align-center

    Figure 1: Assignment Statement (variable = expression;)

Instead of saying equals for the = in an assignment statement, say "gets" or "is assigned" to remember that the variable gets or is assigned the value on the right. In the figure above score is assigned the value of the expression 10 times points (which is another variable) plus 5.


The following `video <https://www.youtube.com/watch?v=MZwIgM__5C8&ab_channel=colleenlewis>`_ by Dr. Colleen Lewis shows how variables can change values in memory using assignment statements.

.. youtube:: MZwIgM__5C8
    :width: 700
    :height: 415
    :align: center


As we saw in the video, we can set one variable's value to a *copy* of the value of another variable like ``y = x;``.  This won't change the value of the variable that you are copying from.




Let's step through the following code in the `Java visualizer <http://www.pythontutor.com/visualize.html#code=public+class+Test2%0A%7B%0A+++public+static+void+main(String%5B%5D+args%29%0A+++%7B%0A+++++int+x+%3D+3%3B%0A+++++int+y+%3D+2%3B%0A+++++System.out.println(x%29%3B%0A+++++System.out.println(y%29%3B%0A+++++x+%3D+y%3B%0A+++++System.out.println(x%29%3B%0A+++++System.out.println(y%29%3B%0A+++++y+%3D+5%3B%0A+++++System.out.println(x%29%3B%0A+++++System.out.println(y%29%3B%0A+++%7D%0A%7D&mode=display&origin=opt-frontend.js&cumulative=false&heapPrimitives=false&textReferences=false&py=java&rawInputLstJSON=%5B%5D&curInstr=0>`_ to see the values in memory. Click on the Next button at the bottom of the code to see how the values of the variables change. You can run the visualizer on any Active Code in this e-book by just clicking on the Code Lens button at the top of each Active Code.


.. codelens:: asgn_viz1
    :language: java
    :optional:

    public class Test2
    {
      public static void main(String[] args)
      {
        int x = 3;
        int y = 2;
        System.out.println(x);
        System.out.println(y);
        x = y;
        System.out.println(x);
        System.out.println(y);
        y = 5;
        System.out.println(x);
        System.out.println(y);
      }
    }



|Exercise| **Check your understanding**


.. mchoice:: q2_1
   :practice: T
   :answer_a: x = 0, y = 1, z = 2
   :answer_b: x = 1, y = 2, z = 3
   :answer_c: x = 2, y = 2, z = 3
   :answer_d: x = 0, y = 0, z = 3
   :correct: b
   :feedback_a: These are the initial values in the variable, but the values are changed.
   :feedback_b: x changes to y's initial value, y's value is doubled, and z is set to 3
   :feedback_c: Remember that the equal sign doesn't mean that the two sides are equal.  It sets the value for the variable on the left to the value from evaluating the right side.
   :feedback_d: Remember that the equal sign doesn't mean that the two sides are equal.  It sets the value for the variable on the left to the value from evaluating the right side.

   What are the values of x, y, and z after the following code executes?  You can step through this code by clicking on this `Java visualizer <http://www.pythontutor.com/visualize.html#code=public+class+Test2%0A%7B%0A+++public+static+void+main(String%5B%5D+args%29%0A+++%7B%0A+++++int+x+%3D+0%3B%0A+++++int+y+%3D+1%3B%0A+++++int+z+%3D+2%3B%0A+++++x+%3D+y%3B%0A+++++y+%3D+y+*+2%3B%0A+++++z+%3D+3%3B%0A+++++System.out.println(x%29%3B%0A+++++System.out.println(y%29%3B%0A+++++System.out.println(z%29%3B%0A+++%7D%0A%7D&mode=display&origin=opt-frontend.js&cumulative=false&heapPrimitives=false&textReferences=false&py=java&rawInputLstJSON=%5B%5D&curInstr=0>`_ link.

   .. code-block:: java

       int x = 0;
       int y = 1;
       int z = 2;
       x = y;
       y = y * 2;
       z = 3;


|Exercise| **Mixed Up Code**



.. parsonsprob:: 2_swap
   :numbered: left
   :practice: T
   :adaptive:
   :noindent:

   The following has the correct code to 'swap' the values in x and y (so that x ends up with y's initial value and y ends up with x's initial value), but the code is mixed up and contains one extra block which is not needed in a correct solution.  Drag the needed blocks from the left into the correct order on the right. Check your solution by clicking on the Check button.  You will be told if any of the blocks are in the wrong order or if you need to remove one or more blocks.  After three incorrect attempts you will be able to use the Help Me button to make the problem easier.
   -----
   int x = 3;
   int y = 5;
   int temp = 0;
   =====
   temp = x;
   =====
   x = y;
   =====
   y = temp;
   =====
   y = x; #distractor

Adding 1 to a Variable
-------------------------

If you use a variable to keep score, you would probably increment it (add one to
the current value) whenever score should go up. You can do this by setting the
variable to the current value of the variable plus one (``score = score + 1``)
as shown below. The formula would look strange in math class, but it
makes sense in coding because it is assigning a new value to the variable on the
left that comes from evaluating the arithmetic expression on the right. So, the
score variable is set to the previous value of score plus 1.

.. activecode:: lccv1
   :language: java
   :autograde: unittest

   Try the code below to see how score is incremented by 1. Try substituting 2 instead of 1 to see what happens.
   ~~~~
   public class Test1
   {
       public static void main(String[] args)
       {
           int score = 0;
           System.out.println(score);
           score = score + 1;
           System.out.println(score);
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
           String expect = "0\n1\n";
           boolean passed =
                   getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }

Input with Variables
--------------------



Variables are a powerful abstraction in programming because the same algorithm can be used with different input values saved in variables.  The code below (`Java Scanner Input Repl <https://firewalledreplit.com/@BerylHoffman/JavaIOExample>`_ using the ``Scanner`` class or `Java Console Input Repl <https://firewalledreplit.com/@BerylHoffman/JavaIOConsole>`_ using the ``Console`` class) will say hello to anyone who types in their name for different name values. Click on run and then type in your name. Then, try run again and type in a friend's name. The code works for any name: behold, the power of variables!

.. raw:: html

    <iframe height="500px" width="100%" style="max-width:90%; margin-left:5%"  src="https://firewalledreplit.com/@BerylHoffman/JavaIOExample?lite=true#Main.java" scrolling="no" frameborder="no" allowtransparency="true" allowfullscreen="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-same-origin allow-scripts allow-modals"></iframe>

Although you will not be tested in the AP CSA exam on using the Java input or the ``Scanner`` or ``Console`` classes, learning how to do input in Java is very useful and fun. For more information on using the ``Scanner`` class, go to https://www.w3schools.com/java/java_user_input.asp, and for the newer ``Console`` class, https://howtodoinjava.com/java-examples/console-input-output/.

|Groupwork| Programming Challenge : Dog Years
------------------------------------------------

.. image:: Figures/dog-free.png
    :width: 150px
    :align: left
    :alt: dog

In this programming challenge, you will calculate your age, and your pet's age from your birthdates, and your pet's age in dog years.   In the code below, type in the current year, the year you were born, the year your dog or cat was born (if you don't have one, make one up!) in the variables below. Then write formulas in assignment statements to calculate how old you are, how old your dog or cat is, and how old they are in dog years which is 7 times a human year.  Finally, print it all out. If you are pair programming, switch drivers (who has control of the keyboard in pair programming) after every line of code.

.. activecode:: challenge1-4
   :language: java
   :autograde: unittest
   :practice: T

   Calculate your age and your pet's age from the birthdates, and then your pet's age in dog years.
   ~~~~
   public class Challenge1_4
   {
       public static void main(String[] args)
       {
           // Fill in values for these variables
           int currentYear =
           int birthYear =
           int dogBirthYear =

           // Write a formula to calculate your age from the currentYear and
           // your birthYear variables
           int age =

           // Write a formula to calculate your dog's age from the currentYear
           // and dogBirthYear variables
           int dogAge =

           // Calculate the age of your dog in dogYears (7 times your dog's age
           // in human years)
           int dogYearsAge =

           // Print out your age, your dog's age, and your dog's age in dog
           // years. Make sure you print out text too so that the user knows what
           // is being printed out.

      }
   }
   ====
   import static org.junit.Assert.*;
   import org.junit.*;

   //import jdk.jfr.Timestamp;

   import java.io.*;

   /* Do NOT change Main or CodeTestHelper.java.
      Put the active code exercise in a file like ForLoop.java.
      Put your Junit test in the file RunestoneTests.java.
      Run. Test by changing ForLoop.java (student code).
      */
   public class RunestoneTests extends CodeTestHelper {
      @Test
      public void checkVariables() throws IOException {
         String code = removeSpaces(getCode());
         code = code.replaceAll("\\(", "").replaceAll("\\)", "");

         boolean passed1 = code.matches(".*intcurrentYear=[0-9]{2,4};.*");
         boolean passed2 = code.matches(".*intbirthYear=[0-9]{2,4};.*");
         boolean passed3 = code.matches(".*intbirthYear=[0-9]{1,4};.*");

         boolean passed = passed1 && passed2 && passed3;

         getResults("true", "" + passed, "Checking that you initialized the three variables");
         assertTrue(passed);
      }

      @Test
      public void checkOutput() throws IOException {
         String output = getMethodOutput("main");
         int num = output.length();
         boolean passed = num >= 5;
         getResults("1+ characters", "" + num, "Checking that you have some output", passed);
         assertTrue(passed);
      }

      @Test
      public void checkPrintlines() throws IOException {
         String code = removeSpaces(getCode());
         int num = countOccurences(code, "System.out.print");

         boolean passed = num >= 1;
         getResults("At least one", "" + num, "Checking that you have at least one print statement", passed);
         assertTrue(passed);
      }

      @Test
      public void testAsgn1() throws IOException {
         /*
          * String target = "age = currentYear - birthYear"; boolean passed =
          * checkCodeContains("formula for age", target); assertTrue(passed);
          */
         String target = removeSpaces("age = currentYear - birthYear");
         String code = removeSpaces(getCode());
         code = code.replaceAll("\\(", "").replaceAll("\\)", "");

         boolean passed = code.contains(target);
         getResults("true", "" + passed, "Checking that code contains formula for age", passed);
         assertTrue(passed);
      }

      @Test
      public void testAsgn2() throws IOException {
         String target = removeSpaces("dogAge = currentYear - dogBirthYear");
         String code = removeSpaces(getCode());
         code = code.replaceAll("\\(", "").replaceAll("\\)", "");

         boolean passed = code.contains(target);
         getResults("true", "" + passed, "Checking that code contains formula for dogAge", passed);
         assertTrue(passed);
      }

      @Test
      public void testAsgn3() throws IOException {
         String target1 = removeSpaces("dogYearsAge = dogAge * 7");
         String target2 = removeSpaces("dogYearsAge = 7 * dogAge");
         String code = removeSpaces(getCode());
         code = code.replaceAll("\\(", "").replaceAll("\\)", "");

         boolean passed1 = code.contains(target1);
         boolean passed2 = code.contains(target2);
         boolean passed = passed1 || passed2;
         getResults("true", "" + passed, "Checking that code contains formula for dogYearsAge using dogAge", passed);
         assertTrue(passed);
      }
   }





Your teacher may suggest that you use a Java IDE like `replit.com <https://replit.com>`_ for this challenge so that you can use input to get these values using the `Scanner class <https://www.w3schools.com/java/java_user_input.asp>`_. Here is a `repl template <https://firewalledreplit.com/@BerylHoffman/Challenge1-4-Dog-Years-Template>`_ that you can use to get started if you want to try the challenge with input.

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

The following is a 2019 AP CSA sample question.

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
