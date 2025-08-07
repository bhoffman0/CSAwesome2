.. include:: ../common.rst

.. qnum::
   :prefix: 1-4-
   :start: 1

|Time45|

Assignment and Input
=====================================

Assignment Statements
---------------------

**Assignment statements** initialize or change the value stored in a variable using the assignment operator ``=``.  An assignment statement always has a single variable on the left hand side. The value of the **expression** (which can contain math operators and other variables) on the right of the ``=`` sign is assigned to and stored in the variable on the left side.


.. figure:: Figures/assignment.png
    :width: 350px
    :align: center
    :figclass: align-center

    Figure 1: Assignment Statement (variable = expression;)

Instead of saying equals for the = in an assignment statement, say "gets" or "is assigned" to remember that the variable gets or is assigned the value on the right. In the figure above score is assigned the value of the expression 10 times points (which is another variable) plus 5.

.. |video| raw:: html

   <a href="https://www.youtube.com/watch?v=MZwIgM__5C8&ab_channel=colleenlewis" target="_blank">video</a>

The following |video| by Dr. Colleen Lewis shows how variables can change values in memory using assignment statements.

.. youtube:: MZwIgM__5C8
    :width: 700
    :height: 415
    :align: center


As we saw in the video, we can set one variable's value to a *copy* of the value of another variable like ``y = x;``.  This won't change the value of the variable that you are copying from.



.. |Java visualizer| raw:: html

   <a href="http://www.pythontutor.com/visualize.html#code=public+class+Test2%0A%7B%0A+++public+static+void+main(String%5B%5D+args%29%0A+++%7B%0A+++++int+x+%3D+3%3B%0A+++++int+y+%3D+2%3B%0A+++++System.out.println(x%29%3B%0A+++++System.out.println(y%29%3B%0A+++++x+%3D+y%3B%0A+++++System.out.println(x%29%3B%0A+++++System.out.println(y%29%3B%0A+++++y+%3D+5%3B%0A+++++System.out.println(x%29%3B%0A+++++System.out.println(y%29%3B%0A+++%7D%0A%7D&mode=display&origin=opt-frontend.js&cumulative=false&heapPrimitives=false&textReferences=false&py=java&rawInputLstJSON=%5B%5D&curInstr=0" target="_blank"  style="text-decoration:underline">Java visualizer</a>

Let's step through the following code in the |Java visualizer| to see the values in memory. Click on the Next button at the bottom of the code to see how the values of the variables change. You can run the visualizer on any Active Code in this e-book by just clicking on the Code Lens button at the top of each Active Code.


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

.. |Java visualizer2| raw:: html

   <a href="http://www.pythontutor.com/visualize.html#code=public+class+Test2%0A%7B%0A+++public+static+void+main(String%5B%5D+args%29%0A+++%7B%0A+++++int+x+%3D+0%3B%0A+++++int+y+%3D+1%3B%0A+++++int+z+%3D+2%3B%0A+++++x+%3D+y%3B%0A+++++y+%3D+y+*+2%3B%0A+++++z+%3D+3%3B%0A+++++System.out.println(x%29%3B%0A+++++System.out.println(y%29%3B%0A+++++System.out.println(z%29%3B%0A+++%7D%0A%7D&mode=display&origin=opt-frontend.js&cumulative=false&heapPrimitives=false&textReferences=false&py=java&rawInputLstJSON=%5B%5D&curInstr=0" target="_blank"  style="text-decoration:underline">Java visualizer</a>

.. mchoice:: qasgn1
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

   What are the values of x, y, and z after the following code executes?  You can step through this code by clicking on this |Java visualizer2| link.

   .. code-block:: java

       int x = 0;
       int y = 1;
       int z = 2;
       x = y;
       y = y * 2;
       z = 3;


|Exercise| **Mixed Up Code**



.. parsonsprob:: swapParsons
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

Data Types in Assignments
--------------------------

Every variable must be assigned a value before it can be used in an expression. That value must be from a compatible data type. A variable is **initialized** the first time it is assigned a value. During execution, an expression is evaluated to produce a single value. The value of an expression has a type based on the types of the values and operators evaluated in the expression. For example, an arithmetic expression that uses at least one ``double`` value will evaluate
to a ``double`` value and must be saved in a ``double`` variable, as seen in the exercise below. In the next lesson, we will see how to change a variable or expression from one type to another.

|CodingEx| **Coding Exercise:**

.. activecode:: assignmentTypes
   :language: java
   :autograde: unittest
   :practice: T

   The code below looks okay at first glance, but if you run it, you will see that there is an error of incompatible types. Change the data type of one of the variables to fix the error.  
   ~~~~
   public class Asgn
   {
       public static void main(String[] args)
       {
             int x = 1;
             double y = 2.2;
             x = 2 * y;
             System.out.println(x);
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
           String expect = "4.4\n";
           boolean passed =
                   getResults(expect, output, "Expected output from main");
           assertTrue(passed);
       }
   }


Reference types like ``String`` can be assigned a new object or null if there is no object. The literal **null** is a special value used to indicate that a reference is not associated with any object.

.. code-block:: java

      // String variables can be assigned null 
      // or a new String object
      String str = null;
      str = "new object";   

Adding 1 to a Variable
-------------------------

If you use a variable to keep score, you would probably increment it (add one to
the current value) whenever score should go up. You can do this by setting the
variable to the current value of the variable plus one (``score = score + 1``)
as shown below. The formula would look strange in math class, but it
makes sense in coding because it is assigning a new value to the variable on the
left that comes from evaluating the arithmetic expression on the right. So, the
score variable is set to the previous value of score plus 1.

.. activecode:: incrementScore
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

.. |JavaIOExampleJuiceMind| raw:: html

   <a href="https://play.juicemind.com/csawesome2/inputName" target="_blank">JuiceMind IDE</a>

.. |JavaIOExampleReplit| raw:: html

   <a href="https://replit.com/@BerylHoffman/JavaIOExample" target="_blank">Scanner input example in Replit</a>


.. |JavaIOConsoleReplit| raw:: html

   <a href="https://replit.com/@BerylHoffman/JavaIOConsole" target="_blank">Console input example</a>


Variables are a powerful abstraction in programming because the same algorithm can be used with different input values saved in variables.  Input can come in a variety of forms, such as **tactile** for example by clicking on a button, **audio** with speech, **visual** using a webcam, or the most common form, **text** that the user types in. The ``Scanner`` class in Java is one way to obtain text input from the keyboard.

The code below using the ``Scanner`` class will say hello to anyone who types in their name and will have different results for different name values. First, type in your name below the code and then click on run. Try again with a friend's name. The code works for any name: behold, the power of variables!

.. activecode:: inputName
   :language: java
   :autograde: unittest
   :stdin: YourName

   The code below will say hello to anyone who types in their name.  Type in your name below and then click on run.  Try again with a friend's name.  
   ~~~~
   import java.util.Scanner;

   public class Main 
   {
       public static void main(String[] args) 
       {
           System.out.println("Please type in a name in the input box below.");
           Scanner scan = new Scanner(System.in);
           String name = scan.nextLine();
           System.out.println("Hello " + name);
           scan.close();
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
           //String output = getMethodOutput("main");
           boolean passed =
                   getResults("", "", "Scanner example", true);
           assertTrue(passed);
       }
   }

Although you will not be tested in the AP CSA exam on using the Java input from the keyboard, learning how to do input in Java is very useful and fun. For more information on using the ``Scanner`` class, go to https://www.w3schools.com/java/java_user_input.asp, and for the newer ``Console`` class, https://howtodoinjava.com/java-examples/console-input-output/. We are limited with the one way communication with the Java server in this Runestone ebook, but in most IDEs, the input/output would be more interactive. You can try this |JavaIOExampleJuiceMind| (click on Create Starter Code after login with a Google account) or |JavaIOExampleReplit| using the ``Scanner`` class and |JavaIOConsoleReplit| using the ``Console`` class. We will also learn how to use ``Scanner`` with input files in a later unit.  

|Groupwork| Coding Challenge : Dog Years
------------------------------------------------

.. image:: Figures/dog-free.png
    :width: 150
    :align: left
    :alt: dog

In this coding challenge, you will calculate your age, and your pet's age from your birthdates, and your pet's age in dog years.   In the code below, type in the current year, the year you were born, the year your dog or cat was born (if you don't have one, make one up!) in the variables below. Then write formulas in assignment statements to calculate how old you are, how old your dog or cat is, and how old they are in dog years which is 7 times a human year.  Finally, print it all out. If you are pair programming, switch drivers (who has control of the keyboard in pair programming) after every line of code.

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
   import java.io.*;

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


.. |repl template| raw:: html

   <a href="https://replit.com/@BerylHoffman/Challenge1-4-Dog-Years-Template" target="_blank">repl template</a>

.. |JuiceMind template| raw:: html

   <a href="https://play.juicemind.com/csawesome2/challenge1-4" target="_blank">JuiceMind IDE</a>

.. |Scanner| raw:: html

   <a href="https://www.w3schools.com/java/java_user_input.asp" target="_blank">Scanner class</a>

Your teacher may suggest that you use a Java IDE with interactive input using the |Scanner| for this challenge, for example this |JuiceMind template| or |repl template| if you want to try the challenge with input.

Summary
-------------------

- (AP 1.4.A.2) The **assignment operator** (``=``) allows a program to initialize or change the
  value stored in a variable. The value of the expression on the right is stored in the variable on the left.

- (AP 1.4.A.1) Every variable must be assigned a value before it can be used in an expression. That value must be from a compatible data type. 

- (AP 1.4.A.1) A variable is **initialized** the first time it is assigned a value. 

- (AP 1.4.A.1) Reference types can be assigned a new object or ``null`` if there is no object. The literal ``null`` is a special value used to indicate that a reference is not associated with any object.

- (AP 1.4.A.3) During execution, an expression is evaluated to produce a single value. The value of an expression has a type based on the types of the values and operators used in the expression.

- (AP 1.4.B.1) Input can come in a variety of forms, such as tactile, audio, visual, or text. The ``Scanner`` class is one way to obtain text input from the keyboard, although input from the keyboard will not be on the AP exam. 

AP Practice
------------

.. mchoice:: apcsa_sample1
   :practice: T
   :answer_a: 8
   :answer_b: 8.0
   :answer_c: 10.5
   :answer_d: An incompatible type error will occur.
   :correct: b
   :feedback_a: Don't forget that the result will be a double since at least 1 double value is involved.
   :feedback_b: Yes, this is equivalent to (5 + ((a/b)*c) - 1) using int division.
   :feedback_c: Don't forget that division and multiplication will be done first due to operator precedence, and that an int/int gives an int truncated result where everything to the right of the decimal point is dropped.
   :feedback_d: No error will occur since the double result is saved in a double.

   Consider the following code segment.

   .. code-block:: java

       int a = 5;
       int b = a/2;
       double c = a/2.0;
       double d = 5 + a / b * c - 2;
       System.out.println(d);

   What is printed when the code segment is executed?


AP Classroom Progress Check Unit 1 Part 1
------------------------------------------

This lesson ends the section for the College Board Unit 1 part 1. You can now do the College Board Progress Check for Unit 1 Part 1 in the AP Classroom.  Or you can choose to wait until after lesson 1.6 where you will find links to the end of unit practice and review which will help you to prepare for the progress check. 

