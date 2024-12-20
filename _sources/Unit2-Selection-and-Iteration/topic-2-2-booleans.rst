.. include:: ../common.rst

.. qnum::
   :prefix: 2-2-
   :start: 1


|Time45|

Boolean Expressions
===================

.. index::
   single: boolean
   single: boolean expression
   single: relational operator
   single: remainder operator
   single: boolean
   single: <
   single: >
   single: ==
   single: !=


Testing Equality (==)
----------------------

The relational operators ``==`` and ``!=`` (not equal) can be used to compare values. They return true or false boolean values. 

.. note::

    One ``=`` sign changes the value of a variable. Two ``==`` equal signs are used to test if a variable holds a certain value, without changing its value!

.. |Colleen video| raw:: html

   <a href="https://www.youtube.com/watch?v=bO9bejT0jwE&list=PLHqz-wcqDQIEP6p1_0wOb9l9aQ0qFijrP&ab_channel=colleenlewis" target="_blank">video</a>

Watch the following |Colleen video| which shows what happens in memory as primitive types like ``int`` and reference types like ``Dog`` are compared with ``==`` in a physical model of Java memory.

.. youtube:: bO9bejT0jwE
    :width: 650
    :height: 415
    :align: center
    :optional:

The following code shows how ``==`` is used with primitive types like ``int``. 

|CodingEx| **Coding Exercise**

.. activecode:: bool1
   :language: java
   :autograde: unittest

   What will the code below print out? Try to guess before you run it! Note that 1 equal sign (``=``) is used for assigning a value and 2 equal signs (``==``) for testing values. Then, add 3 more lines of code that sets year to 15 and prints out whether age is equal to year and whether age is not equal to year.
   ~~~~
   public class BoolTest1
   {
       public static void main(String[] args)
       {
           int age = 15;
           int year = 14;
           // Will this print true or false?
           System.out.println(age == year);
           // Will this print true or false?
           System.out.println(age != year);

           // 1. Add code that sets year to 15
           // 2. Print out whether age equals year 
           // 3. Print out whether age does not equal year

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
           String expect = "false\ntrue\ntrue\nfalse\n";
           boolean passed = getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }

We can also use ``==`` or ``!=`` to test if two reference values, like ``Turtle`` and ``String`` objects,  refer to the same object. In the figure below, we are creating two separate ``Turtle`` objects called ``juan`` and ``mia``. They do not refer to same object or turtle. Then, we create a reference variable called ``friend`` that is set to ``mia``. The turtle ``mia`` will have two ways (**references** or **aliases**) to name her -- she's both ``mia`` and ``friend``, and these variables refer to the same object (same ``Turtle``) in memory. If two reference  variables refer to the same object like the turtle on the right in the image below, the test with ``==`` will return true which you can see in the code below.

.. figure:: Figures/turtleEquality.png
    :width: 500px
    :align: center
    :figclass: align-center

    Figure 1: Turtle Reference Equality

|CodingEx| **Coding Exercise**


.. activecode:: boolRef
   :language: java
   :datafile: turtleClasses.jar
   :autograde: unittest

   What will the code below print out? Try to guess before you run it! Then, add another Turtle friend2 and set it to juan. Does friend2 == juan? Does friend2 == friend? Print out the Boolean expressions for these.
   ~~~~
   import java.awt.*;
   import java.util.*;

   public class BoolTestRef
   {
       public static void main(String[] args)
       {
           World world = new World(300, 300);
           Turtle juan = new Turtle(world);
           Turtle mia = new Turtle(world);

           // Will these print true or false?
           System.out.println(juan == mia);
           Turtle friend = mia; // set friend to be an alias for mia
           System.out.println(friend == mia);
           // Create another Turtle friend2 and set it to juan
           // Does friend2 == juan?
           // Does friend2 == friend?

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
           String expect = "false\ntrue\ntrue\nfalse\n";
           boolean passed = getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
        }
    }

Relational Operators (<, >)
----------------------------

The **relational operators** below are used to compare numeric values or arithmetic expressions. Although some programming languages allow using relational operators like ``<`` to compare strings, Java only uses these operators for numbers, and uses the methods ``compareTo`` and ``equals`` for comparing ``String`` values.

- ``<`` Less Than
- ``>`` Greater Than
- ``<=`` Less than or equal to
- ``>=`` Greater than or equal to
- ``==`` Equals
- ``!=`` Does not equal

If you have trouble telling ``<`` and ``>`` apart, think of ``<`` and ``>`` as
arrows where the pointy end should point to the smaller value. If ``<`` (less
than) points towards a smaller number on the left, then it evaluates to
``true``. On the other hand a ``>`` (greater than) expression will be ``true``
only if the smaller number is on the right hand side. Or maybe you prefer the
“hungry alligator” mnemonic beloved by elementary school teachers—think of ``<``
and ``>`` as the mouths of hungry alligators which always want to eat the bigger
number; a ``<`` or ``>`` expression is only ``true`` if the alligator is in fact
about to eat the bigger number.

To remember the correct order of the two characters in ``<=`` and ``>=``, just
write them in the same order you would say them in English: “less than or equal
to” not “equal to or less than”.

|CodingEx| **Coding Exercise**


.. activecode:: bool2
   :language: java
   :autograde: unittest

   Try to guess what the code below will print out before you run it. Then, set year to 15 and print the boolean expression for whether age is less than or equal to year.
   ~~~~
   public class BoolTest2
   {
       public static void main(String[] args)
       {
           int age = 15;
           int year = 14;
           // Will these print true or false?
           System.out.println(age < year);
           System.out.println(age > year);
           // 1. Set year to 15
           // 2. Print whether age is less than or equal to year
          
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
           String expect = "false\ntrue\ntrue\n";
           boolean passed = getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
        @Test
        public void test1()
        {
            String code = "<=";
            boolean passed = checkCodeContains(code);
            assertTrue(passed);
        }
   }

**Boolean** variables or expressions have **true** or **false** values. Relational operators can be used to compare two variables or compare a variable against a constant value or expression. For example, the following Boolean expressions can be used to see whether a number is positive or negative by seeing if it is greater than 0 or less than 0:

.. code-block:: java

  // Test if a number is positive
  (number > 0)
  //Test if a number is negative
  (number < 0)

|Exercise| **Check your understanding**

.. dragndrop:: BooleanExps
    :feedback: Review the relational operators above.
    :match_1: x > 0|||x is positive
    :match_2: x == y|||x equals y
    :match_3: x < 0|||x is negative
    :match_4: x != y|||x does not equal y
    :match_5: x < y |||x is less than y
    :match_6: x > y |||x is greater than y
    :match_7: x >= y |||x is greater than or equal to y

    Drag the boolean expression from the left and drop it on what it is testing on the right.  Click the "Check Me" button to see if you are correct.


Testing with remainder (%)
---------------------------

The remainder operator (%) is very useful in coding. The following Boolean expressions can be used to test whether a number is even or odd by seeing if there is a remainder when it is divided by 2 or if it is divisible by another number:

.. code-block:: java

  //Test if a number is even by seeing if the remainder is 0 when divided by 2
  (number % 2 == 0)
  //Test if a number is odd by seeing if there is a remainder when divided by 2
  (number % 2 != 0)
  //Test if a number is a multiple of x (or divisible by x with no remainder)
  (number % x == 0)

|CodingEx| **Coding Exercise**

.. activecode:: boolRem
   :language: java
   :autograde: unittest
   :practice: T

   Try the expressions containing the % operator below to see how they can be used to check for even or odd numbers. All even numbers are divisible (with no remainder) by 2. Then, add another expression that tests to see if age1 is divisible by 3.
   ~~~~
   public class BoolRem
   {
       public static void main(String[] args)
       {
           int age1 = 15;
           int age2 = 16;
           
           System.out.println("Remainder of " + age1 + "/2 is " + (age1 % 2));
           System.out.println("Remainder of " + age2 + "/2 is " + (age2 % 2));
           System.out.println("Is " + age1 + " even? " + (age1 % 2 == 0));
           System.out.println("Is " + age2 + " even? " + (age2 % 2 == 0));

           // Add a line that prints out whether age1 is divisible by 3

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
                   "Remainder of 15/2 is 1\n"
                       + "Remainder of 16/2 is 0\n"
                       + "Is 15 even? false \n"
                       + "Is 16 even? true\ntrue\n";
           boolean passed = getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
       @Test
       public void testBool() throws IOException
       {
           String target = "age1 % 3 == 0";
           boolean passed = checkCodeContains("boolean check for divisibility by 3", target);
           assertTrue(passed);
       }
       
   }

.. note::

  A warning: because Java's ``%`` is a remainder operator and not a true
  mathematical modulo operator, you
  can’t check if a number is odd with the expression ``num % 2 == 1``.

  That expression will be ``true`` if ``num`` is positive and odd and ``false``
  when ``num`` is even, both of which are correct. But if ``num`` is negative
  and odd, its remainder when divided by 2 is -1, not 1 and this expression will
  evaluate to ``false``. Thus you should always use ``num % 2 != 0`` to check if
  ``num`` is odd.


|Groupwork| Coding Challenge : Prime Numbers POGIL
-------------------------------------------------------

.. |pogil| raw:: html

   <a href="https://pogil.org/about-pogil/what-is-pogil" target="_blank">POGIL</a>

.. |pogil role| raw:: html

   <a href="https://docs.google.com/document/d/1_NfNLWJxaG4qZ2Jd2x8UctDS05twn1h6p-o3XaAcRv0/edit?usp=sharing" target="_blank">POGIL role</a>

.. |Numberphile video| raw:: html

   <a href="https://www.youtube.com/watch?v=M7kEpw1tn50" target="_blank">Numberphile video</a>

We encourage you to do this activity as a |POGIL| (Process Oriented Guided Inquiry Learning) group activity or using Think-Pair-Share collaboration. POGIL groups are self-managed teams of 4 students where everyone has a |pogil role| and works together to solve the problems, making sure that everyone in the team participates and learns. 

In this activity, you will write a Java program that uses boolean expressions to determine if a number is prime. A prime number is an integer number that is only divisible by 1 and itself. For example, 3 is a prime number because it's only divisible by 1 and 3 and no other numbers, but 4 is not a prime number because it's divisible by 2 as well as 1 and 4. You will write methods that test whether a number is positive, negative, odd, even, and divisible by another number. You will then experiment with these methods to determine if the numbers 5, 6, and 7 are prime. And to ask questions about prime numbers like whether all odd numbers are prime.

.. activecode:: challenge-primeNumbers
    :language: java
    :autograde: unittest
    :practice: T

    Complete the methods below to determine if a number is positive, negative, odd, even, or divisible by another number by returning boolean expressions testing the argument number. Then, experiment with these methods to determine if the numbers 5, 6, and 7 are prime. 
    ~~~~
    public class PrimeNumbers
    {
        // isPositive checks whether number is greater than 0
        public static boolean isPositive(int number)
        {
            return (number > 0);
        }

        public static boolean isNegative(int number)
        {
            // 1. Replace true with an expression that checks 
            //    whether number is negative
            return true;
        }

        // isOdd checks whether number divided by 2 
        // has a remainder. 
        public static boolean isOdd(int number)
        {
            return (number % 2 != 0);
        }
        
        public static boolean isEven(int number)
        {
            // 2. Replace true with an expression that checks 
            //    whether number is divisible by 2
            return true;
        }
        
        public static boolean isDivisible(int number, int divisor)
        {
            // 3. Replace true with an expression that checks 
            //    whether number is divisible by divisor
            return true;
        }
        
        public static void main(String[] args)
        {
            // 4. Change number to experiment
            int number = 5; 
            System.out.println("A prime number is only divisible by 1 and itself.");
            System.out.println(number + " is negative? " + isNegative(number));
            System.out.println(number + " is even? " + isEven(number));
            
            System.out.println("Divisible by 1? " + isDivisible(number,1) );
            System.out.println("Divisible by 2? " + isDivisible(number,2) );
            System.out.println("Divisible by 3? " + isDivisible(number,3) );
            System.out.println("Divisible by 4? " + isDivisible(number,4) );
            System.out.println("Divisible by 5? " + isDivisible(number,5) );
           
            // 5. Add 2 print statements with calls to isDivisible to check
            //    whether number is divisible by 6 and 7.
           
        }
    }
    ====
    import static org.junit.Assert.*;

    import org.junit.*;

    import java.io.*;

    public class RunestoneTests extends CodeTestHelper
    {
         @Test
         public void testBool1() throws IOException
         {
              String target = "number < 0";
              boolean passed = checkCodeContains("boolean expression for isNegative", target);
              assertTrue(passed);
         }
       @Test
       public void testBool2() throws IOException
       {
           String target = "number % 2 == 0";
           boolean passed = checkCodeContains("boolean expression for isEven", target);
           assertTrue(passed);
       }

       @Test
       public void testBool3() throws IOException
       {
           String target = "number % divisor == 0";
           boolean passed = checkCodeContains("boolean expression for isDivisible", target);
           assertTrue(passed);
       }
       @Test
       public void testCall() throws IOException
       {
           String target = "isDivisible(number,7)";
           boolean passed = checkCodeContains("method call in main to isDivisible to see whether number is divisible by 7", target);
           assertTrue(passed);
       }
    }

With your POGIL group, use the code you completed above to experiment to see if 5, 6, and 7 are prime. Answer the following questions:

.. mchoice:: prime1
   :answer_a: Yes, 5 is prime.
   :answer_b: No, 5 is not prime.
   :correct: a
   :feedback_a: 5 is only divisible by 1 and 5, so it is prime.
   :feedback_b: 5 is only divisible by 1 and 5.

   Is 5 prime?

.. mchoice:: prime2
   :answer_a: Yes, 6 is prime.
   :answer_b: No, 6 is not prime.
   :correct: b
   :feedback_a: A prime number is only divisible by 1 and itself. 6 is divisible by 1, 2, 3, and 6.
   :feedback_b: 6 is divisible by 1, 2, 3, and 6, so it is not prime.

   Is 6 prime?

.. mchoice:: prime3
   :answer_a: Yes, 7 is prime.
   :answer_b: No, 7 is not prime.
   :correct: a
   :feedback_a: 7 is only divisible by 1 and 7, so it is prime.
   :feedback_b: 7 is only divisible by 1 and 7.

   Is 7 prime?

.. fillintheblank:: prime4

   Are all odd numbers prime? Can you find an odd number that is not prime by using your code above? What is the smallest odd number that is not prime and has divisors other than 1 and itself?

   -    :^9$: Yes, 9 is not prime because it is divisible by 3.
        :.*: Try numbers 3-10 in your code.

.. fillintheblank:: prime5

    Are all even numbers not prime? Can you find an even prime number using your code above? What is the smallest even number that is prime?

   -    :^2$: Yes, 2 is prime because it is only divisible by 1 and 2. 
        :.*: Try numbers 2-10 in your code.


Prime numbers are very useful in encryption algorithms because they can be used as keys for encoding and decoding. If you have the key, you can use it to divide a large number that represents something encrypted to decode it, but if you don't have the key, it's very hard to guess the factors of a large number to decode it. If you're curious about this, watch this |Numberphile video|.


Summary
-------------------

- (AP 2.2.A.1) Values or expressions can be compared using the relational operators ``==`` and ``!=`` to determine whether the values are the same. With primitive types, this compares the actual primitive values. With reference types, this compares the object references.
- (AP 2.2.A.2) Numeric values or expressions can be compared using the relational operators (``<``, ``>``, ``<=``, ``>=``) to determine the relationship between the values.
- (AP 2.2.A.3) An expression involving relational operators evaluates to a ``Boolean`` value of ``true`` or ``false``.	
- The remainder operator ``%`` can be used to test for divisibility by a number. For example, ``num % 2 == 0`` can be used to test if a number is even.

AP Practice
------------

.. mchoice:: AP2-2-1
    :practice: T

    Consider the following statement.

    .. code-block:: java

        boolean x = (5 % 3 == 0) == (3 > 5);

    What is the value of x after the statement has been executed?

    - false

      - Although both sides of the middle == are false, false == false is true! Tricky!

    - true

      + (5 % 3 == 0) is false and (3 > 5) is false, and false == false is true! Tricky!

    - (5 % 3 == 0)

      - The boolean x should hold true or false.

    - (3 > 5)

      - The boolean x should hold true or false.

    - 2

      - The boolean x should hold true or false.



.. mchoice:: AP2-2-2
    :practice: T

    Consider the following Boolean expression in which the int variables x and y have been properly declared and initialized.

    .. code-block:: java

        (x >= 10) == (y < 12)

    Which of the following values for x and y will result in the expression evaluating to true  ?

    - x = 10 and y = 12

      - The left side is true, but y must be less than 12 to make the right side true.

    - x = 9 and y = 9

      - The left side is false (x must be greater than or equal to 10), but the right side is true.

    - x = 10 and y = 11

      + Correct! Both sides are true!

    - x = 10 and y = 13

      - The left side is true, but y must be less than 12 to make the right side true.

    - x = 9 and y = 12

      + Correct! Both sides are false! This is tricky!



Relational Operators Practice Game
-----------------------------------

.. |game| raw:: html

   <a href="https://csa-games.netlify.app/" target="_blank">game</a>


Try the game below to practice. Click on **Relationals**,  evaluate the relational expression and click on None, All, or the numbers that make the expression true. Check on Compound for an added challenge. We encourage you to work in pairs and see how high a score you can get.

.. raw:: html

     <iframe id="page-embed" class="init" height="700px" width="100%" style="margin-left:10%;max-width:80%" src="https://csa-games.netlify.app/"></iframe>
