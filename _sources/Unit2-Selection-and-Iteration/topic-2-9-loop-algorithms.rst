.. include:: ../common.rst

.. qnum::
   :prefix: 2-9-
   :start: 1

|Time90|

Implementing Selection and Iteration Algorithms
==================================================

.. index::
    single: loop algorithms
    single: accumulator
    single: sum
    single: average
    single: minimum
    single: maximum
    single: divisible
    single: remainder
    single: mod 
    single: prime
    single: digits
    single: frequency
    single: counter

In this lesson, you will learn how to implement algorithms that use loops to solve problems. You will learn how to use the accumulator pattern to calculate sums and averages, how to find minimum and maximum values, how to determine if a number is evenly divisible by another number, and how to count the frequency of a specific criterion. There are standard algorithms that use loops and selection to: 

- compute a sum or average of a set of values
- determine a minimum or maximum value 
- identify if an integer is or is not evenly divisible by another integer 
- identify the individual digits in an integer 
- determine the frequency with which a specific criterion is met


Accumulator Pattern for Sum/Average
------------------------------------

The **accumulator pattern** is an algorithm that iterates through a set of values using a loop and updates an accumulator variable with those values, for example to compute a sum or average of a set of values. The accumulator pattern has 4 steps:

1. Initialize the accumulator variable before the loop.
2. Loop through the values.
3. Update the accumulator variable inside the loop.
4. Print or use the accumulated value when the loop is done.

For example, this loop calculates the sum of 1 through 100. The ``sum`` variable is the accumulator variable.

.. code-block:: java

    int sum = 0;
    for (int i = 1; i <= 100; i++)
    {
        sum += i;
    }
    System.out.println("The sum of 1 through 100 is " + sum);

The accumulator pattern can also be used to calculate the average of a set of values by adding them together and then dividing by the number of values. For example, this loop calculates the average of 10 random numbers.

.. code-block:: java

    int sum = 0;
    for (int i = 0; i < 10; i++)
    {
        int num = (int)(Math.random() * 100);
        sum += num;
    }
    double average = (double)sum / 10;
    System.out.println("The average of 10 random numbers is " + average);

Try the accumulator practice below.

|CodingEx| **Coding Exercise**

.. activecode:: accumulator-practice
    :language: java
    :autograde: unittest
    :practice: T

    Complete the methods below to compute the sum and average of a set of numbers. 
    ~~~~
    public class Accumulator
    {
        // sum calculates and returns the sum of the numbers 1 to n
        public static int sum(int n)
        {
            int sum = 0;
            // 1. Add a loop to calculate the sum of 1 to n


            return sum;
        }

        // average calculates and returns the average of numbers 1 to n
        public static double average(int n)
        {
            int sum = 0;
            // 2. Add a loop to calculate the sum of 1 to n



            // 3. Calculate the average using sum and n
            double average = 0;

            return average;
        }
        
        public static void main(String[] args)
        {
            int n = 10;
            System.out.println("The sum of 1 to " + n + " is " + sum(n));
            System.out.println("The average of 1 to " + n + " is " + average(n));
        }
    }
    ====
    import static org.junit.Assert.*;

    import org.junit.*;

    import java.io.*;

    public class RunestoneTests extends CodeTestHelper
    {
        public RunestoneTests()
        {
            super("Accumulator");
        }

         @Test
         public void test1() throws IOException
         {
             String code = getCode();
             String target = "for (int * = 1; * ? n; *~)";

             int num = countOccurencesRegex(code, target);

             boolean passed = num == 2;

            getResults("2", "" + num, "Each method should have a for loop that counts from 1 to n", passed);
            assertTrue(passed);
         }
        
        @Test
        public void testMain() throws IOException
        {
            String expected = "The sum of 1 to 10 is 55\nThe average of 1 to 10 is 5.5";
            String output = getMethodOutput("main");
            boolean passed = getResults(expected, output, "Checking main output");
            assertTrue(passed);
        }

       @Test
       public void testCall() throws IOException
       {
           Object[] args = {5};
           String output = getMethodOutput("sum", args);
           String expect = "15";

           boolean passed =
                   getResults(
                           expect,
                           output,
                           "sum(5)"
                           );
           assertTrue(passed);
       }
    }

Input-Controlled Loop
-----------------------

Here's an example of an **input-controlled loop** that calculates the average of positive numbers using the accumulator pattern with a ``while`` loop. The number -1 is used as the **sentinel value**. The ``while`` loop will run while the user does not input -1. What would happen if you forgot step 3 (update the loop variable - get a new input)? Remember that skipping step 3 will often lead to an infinite loop! 

.. code-block:: java

    // 1. initialize the loop variable (get the first number)
    System.out.print("Please enter a number to average in or -1 to stop: ");
    number = scan.nextInt();

    // 2. test the loop variable (against sentinel value)
    while (number != -1) 
    {
      sum += number; // add number to sum
      count++; // count the number
      // 3. Update the loop variable (get a new number)
      System.out.print("Please enter a number to average in or -1 to stop: ");
      number = scan.nextInt();
    }
    System.out.println(count);
    // calculate average
    average = (double) sum/count;
    System.out.println("The average is " + average);

.. |JuiceMind| raw:: html

   <a href="https://play.juicemind.com/csawesome2/Average" target="_blank" style="text-decoration:underline">JuiceMind</a>

.. |replit| raw:: html

   <a href="https://replit.com/@BerylHoffman/Average#Main.java" target="_blank">replit</a>
   
You can try this below on the input numbers below the code or for more interactive input, try it in your own IDE online with |JuiceMind| or |replit|.

|CodingEx| **Coding Exercise**

.. activecode:: input-controlled-loop
  :language: java
  :autograde: unittest
  :stdin: 80 90 100 -1

  Try the code below with an input-controlled loop that prints out the numbers entered by the user until -1 is entered. Then, change it to calculate the sum and average of the numbers entered.
  ~~~~
  import java.util.Scanner;

  public class InputLoop 
  {
    public static void main(String[] args) 
    {
        Scanner scan = new Scanner(System.in);
        // Initialize the accumulators
        int sum = 0;
        int count = 0;

        // Initialize the loop variable (get the first number)
        System.out.print("Please enter a number to average in or -1 to stop: "); 
        int number = scan.nextInt();

        // Test the loop variable against sentinel value
        while (number != -1) 
        {
            // 1. TODO: add number to sum and increment count
            

            // Update the loop variable (get a new number)
            System.out.println("You entered " + number);
            System.out.print("Please enter a number to average in or -1 to stop: ");
            number = scan.nextInt();
        }
        System.out.println("You entered " + count + " numbers.");
        System.out.println("Their sum is " + sum);

        // 2. TODO: calculate average
        double average = 0;
        
        System.out.println("The average is " + average);
    }
  }
  ====
  import static org.junit.Assert.*;

  import org.junit.*;

  import java.io.*;

  public class RunestoneTests extends CodeTestHelper
  {
      public RunestoneTests()
      {
          super("InputLoop");
      }
      @Test
      public void test1()
      {
          String input = "80 90 100 -1";
          String output = getMethodOutputWithInput("main", input);

          boolean passed = getResults("The average is 90.0", output, "Average calculated correctly");
            
          assertTrue(passed);
      }

      @Test
      public void test2()
      {
          
          String input = "1 4 -1";
          String output = getMethodOutputWithInput("main", input);

          boolean passed = getResults("The average is 2.5", output, "Trying with input 1 4 -1 (did you typecast to double?)");
            
          assertTrue(passed);
      }  
    }

Loop with if and Minimum/Maximum
---------------------------------

A common variation of the accumulator pattern is to have an ``if`` statement inside the loop that tests each value being considered in the loop. This is a very common pattern in the AP exam for FRQ #1. 

To determine the minimum or maximum value in a sequence of numbers, use a variable to store the current minimum or maximum value. Use a loop to go through the sequence of numbers and update the minimum or maximum value if you find a number that is lower or higher than the current minimum or maximum. For example, this loop chooses 10 random numbers and finds the minimum value among them.

.. code-block:: java

    int min = Integer.MAX_VALUE;
    for (int i = 0; i < 10; i++)
    {
        int num = (int)(Math.random() * 100);
        System.out.println(num);
        if (num < min)
        {
            min = num;
        }
    }
    System.out.println("The minimum value is " + min);

|CodingEx| **Coding Exercise**

.. activecode:: min-max-practice
    :language: java
    :autograde: unittest
    :practice: T

    Run to see the min method in action. Then, complete the max method below to find the maximum of a set of random numbers. 
    ~~~~
    public class MinMax
    {
        // min calculates and returns the minimum of n random numbers
        public static int min(int n)
        {
            int min = Integer.MAX_VALUE;
            for (int i = 0; i < n; i++)
            {
                int num = (int)(Math.random() * 100);
                System.out.println(num);
                if (num < min)
                {
                    min = num;
                }
            }

            return min;
        }

        // max calculates and returns the maximum of n random numbers
        public static int max(int n)
        {
            int max = Integer.MIN_VALUE;
            // TODO: write a loop to find the maximum value
            // of n random numbers from 0 to 100


            return max;
        }
        
        public static void main(String[] args)
        {
            int n = 10;
            System.out.println("The minimum value is " + min(n));
            System.out.println("The maximum value is " + max(n));
        }
    }
    ====
    import static org.junit.Assert.*;

    import org.junit.*;

    import java.io.*;

    public class RunestoneTests extends CodeTestHelper
    {
       
         @Test
         public void test1() throws IOException
         {
             String code = getCode();
             String target = "for (int * = #; * ? n; *~)";

             int num = countOccurencesRegex(code, target);

             boolean passed = num == 2;

            getResults("2", "" + num, "Each method should have a for loop that uses n", passed);
            assertTrue(passed);
         }
         @Test
        public void containsCall()
        {
            boolean passed = checkCodeContains("num > max", "num > max");
            assertTrue(passed);
        }
    }
        
       
Divisibility
-------------

To determine if an integer is evenly divisible by another integer, you can use the remainder operator ``%``. If you divide two numbers and there is no remainder, then the first number is evenly divisible by the second number. The remainder operator is often used to check if a number is even or odd: if ``num % 2 == 0`` is true, then ``num`` is even. But it can be used to check if any number is divisible by another. For example, 10 is evenly divisible by 5 because 10 divided by 5 is 2 with no (0) remainder. 

.. code-block:: java

    int num1 = 10;
    int num2 = 5;
    if (num1 % num2 == 0)
    {
        System.out.println(num1 + " is evenly divisible by " + num2);
    }
    else
    {
        System.out.println(num1 + " is not evenly divisible by " + num2);
    }

The selection statement above can be put in a loop to determine if a number is divisible by a range of numbers. For example, you can determine if a number is prime by checking if it is divisible by any number between 2 and n-1 (or even the square root of the number since multiples of numbers repeat after the square root). Remember that a prime number is a number that is only divisible by 1 and itself, so if you find any other divisor, the number is not prime.

|CodingEx| **Coding Exercise**

.. activecode:: isPrimeLoop
    :language: java
    :autograde: unittest
    :practice: T

    Complete the isPrime method below to determine if a number n is prime by checking if it is evenly divisible by any number between 2 and n-1 or the square root of n.
    ~~~~
    public class PrimeNumbers
    {
        // isPrime checks whether n is a prime number
        public static boolean isPrime(int n)
        {
            // Add a loop from 2 to n-1 or Math.sqrt(n)
            //   if n is divisible by the loop variable i
            //        return false
            
            

            // if no divisor found after loop, return true
            return true;
        }
        
        
        public static void main(String[] args)
        {
            System.out.println("Is 4 prime? " + isPrime(4));
            System.out.println("Is 5 prime? " + isPrime(5));
        }
    }
    ====
    import static org.junit.Assert.*;

    import org.junit.*;

    import java.io.*;

    public class RunestoneTests extends CodeTestHelper
    {
        public RunestoneTests()
        {
            super("PrimeNumbers");
        }

        @Test
        public void test1() throws IOException
        {
            String target = "for";
            boolean passed = checkCodeContains("for loop", target);
            assertTrue(passed);
        }

         @Test
        public void testMain() throws IOException
        {
            String expected = "Is 4 prime? false\nIs 5 prime? true";
            String output = getMethodOutput("main");
            boolean passed = getResults(expected, output, "Checking main output");
            assertTrue(passed);
        }

       @Test
       public void testCall() throws IOException
       {
           Object[] args = {9};
           String output = getMethodOutput("isPrime", args);
           String expect = "false";

           boolean passed =
                   getResults(
                           expect,
                           output,
                           "isPrime(9)"
                           );
           assertTrue(passed);
       }

        @Test
       public void testBool() throws IOException
       {
           String target = "n % i == 0";
           boolean passed = checkCodeContains(target + " test", target);
           assertTrue(passed);
       }
    }

Finding Digits with / and %
--------------------------------------

We can also use division (``/``) and remainder (``%``) to find the digits of a number by dividing by 10. For example, 1234 divided by 10 is 123 with a remainder of 4. Remember that in integer
division the result truncates (cuts off) everything to the right of the decimal point, so we get the number without the last digit when we divide by 10. The remainder is the last digit of the number. You could use this algorithm to add the digits of a number, reverse the digits of a number, or check if a digit is equal to a certain number, etc.

|CodingEx| **Coding Exercise**

.. activecode:: checkDigit
    :language: java
    :autograde: unittest
    :practice: T

    Complete the checkDigit method below to determine if a positive number has a given single-digit number as one of its digits. 
    ~~~~
    public class CheckDigitTest
    {
          // checkDigit checks whether a number has a given digit in it
          public static boolean checkDigit(int number, int digit) 
          {
              // 1. Use a while loop: while number is greater than 0

                 // 2. Get the last digit of number with % 10
                 // 3. if it equals the argument digit, return true
                 // 4. remove the last digit of number with / 10
            
            // if loop finishes, return false
            return false; // Digit not found
        }
        
        
        public static void main(String[] args)
        {
            System.out.println(checkDigit(12345, 3)); // true
            System.out.println(checkDigit(9876, 2));  // false
        }
    }
    ====
    import static org.junit.Assert.*;

    import org.junit.*;

    import java.io.*;

    public class RunestoneTests extends CodeTestHelper
    {
        public RunestoneTests()
        {
            super("CheckDigitTest");
        }

        @Test
        public void test1() throws IOException
        {
            String target = "while";
            boolean passed = checkCodeContains("while loop", target);
            assertTrue(passed);
        }

         @Test
        public void testMain() throws IOException
        {
            String expected = "true\nfalse";
            String output = getMethodOutput("main");
            boolean passed = getResults(expected, output, "Checking main output");
            assertTrue(passed);
        }

       @Test
       public void testCall() throws IOException
       {
           Object[] args = {13579, 7};
           String output = getMethodOutput("checkDigit", args);
           String expect = "true";

           boolean passed =
                   getResults(
                           expect,
                           output,
                           "checkDigit(13579, 7)"
                           );
           assertTrue(passed);
       }

        @Test
       public void testBool() throws IOException
       {
           String target = "number % 10";
           boolean passed = checkCodeContains(target, target);
           assertTrue(passed);
       }
    }

The **remainder** operator has been used quite a bit on the AP CSA exam. Keep it in mind for the following uses:

- Use remainder to check for odd or even numbers. If ``num % 2 != 0`` is true, ``num``
  is odd and if ``num % 2 == 0`` is true then ``num`` is even.

- Use remainder to check if any number is evenly divisible by any
  other: If ``num1 % num2 == 0`` is true then ``num1`` is evenly divisible by
  ``num2``.

- Use it to get the last digit from an integer number: ``num % 10`` gives us the
  rightmost digit of ``num``.

- Use it to get the number of minutes left when you convert a total number of minutes to hours and minutes:

  .. code:: java

     int totalMinutes = 345;
     int hours = totalMinutes / 60;   // Number of whole hours, i.e. 5
     int minutes = totalMinutes % 60; // Number of minutes left over, i.e. 45

- Use it whenever you have limit in the value, and you need to wrap around to
  zero if the value goes over the limit: the value of ``num % limit`` will
  always be in the range from 0 (inclusive) to ``limit`` (exclusive) as long as
  ``num`` and ``limit`` are both positive.



Math.random() in if Statements
-------------------------------
 
The ``Math.random()`` method returns a random number between 0.0 and 1.0.  You can use this method with ``if`` statements to simulate a coin flip or an event occuring a certain percentage of the time. For example, if you want to simulate a coin flip, you can check if the random number is less than 0.5 (halfway between 0 and 1) to simulate a 50% chance of heads or tails. (Thank you to Kate McDonnell from Cherry Creek Schools for the ideas in this section).

.. code-block:: java

    if (Math.random() < 0.5)
    {
        System.out.println("Heads");
    }
    else
    {
        System.out.println("Tails");
    }

If you want to simulate an event occuring 90% of the time, you can check the random number to see if it is less than 0.9 (90% of the way between 0 and 1):

.. code-block:: java

    if (Math.random() < 0.9)
    {
        // 90% of the time
        System.out.println("Event happened");
    }
    else 
    {
        // 10% of the time
        System.out.println("Event did not happen");
    }



|Exercise| **Check your understanding**

.. mchoice:: mcq-rnd-ifs
   :practice: T
   
   The weather report says there is approximately 25% chance of rain today. Which of the following if statements would print Rain or No Rain to simulate a day with the correct percentages following the weather report? 

   -  .. code-block:: java
        
         if (Math.random() < 0.25) { System.out.println("Rain"); }
       
      + Correct! This code will print "Rain" 25% of the time.

   -  .. code-block:: java
        
         if (Math.random() > 0.75) { System.out.println("Rain"); }

      + Correct. This code will print "Rain" 25% (1 - .75) of the time.

   -  .. code-block:: java
       
         if (Math.random() > 0.25) { System.out.println("Rain"); }

      - Incorrect. This code will print "Rain" 75% of the time.

   -  .. code-block:: java
        
         if (Math.random() < 0.75) { System.out.println("No Rain"); }

      + Correct! This code will print "No Rain" 75% of the time, so it will rain 25% of the time.


|CodingEx| **Coding Exercise**

.. activecode:: randomShapes
    :language: java
    :autograde: unittest
    :datafile: turtleClasses.jar

    Add an if/else statement that uses Math.random() to do a coin flip to decide whether to call yertle.turnRight() or yertle.turnLeft. Run the code to see the turtle draw a random shape.
    ~~~~
    import java.util.*;
    import java.awt.*;

    public class RandomTurns
    {
        public static void main(String[] args)
        {
            World world = new World(500,400);
            Turtle yertle = new Turtle(world);

            // This is a loop that runs 10 times to draw a random shape
            for(int i = 1; i <= 10; i++)
            {
                yertle.forward(20);

                // Write an if/else statement that uses 
                // Math.random() to do a coin flip (50%) to choose 
                // between yertle.turnRight() or turnLeft()






            } // end of loop
            world.show(true);
        }
    }
    ====
    import static org.junit.Assert.*;

    import org.junit.*;

    import java.io.*;

    public class RunestoneTests extends CodeTestHelper
    {
        public RunestoneTests()
        {
            super("RandomTurns");
        }

       @Test
       public void testCodeContainsIf()
       {
           boolean ifCheck = checkCodeContains("if", "if");
           assertTrue(ifCheck);
       }
       @Test
       public void testCodeContainsElse()
       {
           boolean ifCheck2 = checkCodeContains("else", "else");
           assertTrue(ifCheck2);
       }
       @Test
       public void testCodeContainsRandom()
       {
           boolean ifCheck2 = checkCodeContains("Math.Random()", "Math.random()");
           assertTrue(ifCheck2);
       } 
       @Test
       public void testCodeContains5()
       {
           boolean ifCheck2 = checkCodeContains(".5", ".5");
           assertTrue(ifCheck2);
       } 
    }


Frequency
-----------

You can use a counter variable inside a loop to determine the frequency with which a specific criteria is met.  For example, you can count the number of even numbers in a sequence of numbers. You can use a loop and increment the counter each time an even number is found like below:

.. code-block:: java

    int count = 0;
    for (int i = 0; i < 100; i++)
    {
        if (i % 2 == 0)
        {
            count++;
        }
    }
    System.out.println("There are " + count + " even numbers from 1 to 100.");

The AP exam often gives a boolean method for students to use to determine some criteria in a set of values. For example, in the following challenge, you can count the number of prime numbers from 1 to 100 given a boolean method to use ``isPrime(n)`` which returns true or false. 



|Groupwork| Coding Challenge : Prime Number Finder
--------------------------------------------------

.. |Numberphile video| raw:: html

   <a href="https://www.youtube.com/watch?v=M7kEpw1tn50" target="_blank">Numberphile video</a>

Prime numbers (numbers that are only divisible by 1 and themselves) are used every day in encryption algorithms that safely transmit your username and password whenever you login on the internet. Two large prime numbers are multiplied together to generate partial keys for encoding and decoding in encryption algorithms. If you have the key, you can use it to divide a large number that represents something encrypted to decode it, but if you don't have the key, it's very hard to guess the prime factors of a large number to decode it. Small prime numbers can be easily guessed, so encryption only uses very large prime numbers with hundreds of digits. Finding these large prime numbers is a very hard problem. As numbers grow, primes become less frequent, due to the increasing likelihood of divisibility by smaller primes. If you're curious about the use of prime numbers in encryption, watch this |Numberphile video|.

In the challenge below,

1. First, copy your ``isPrime`` method from the exercise above to check if a number is prime. 
2. Then, write a method ``findPrimes`` that takes two integers as arguments and prints the prime numbers between them. It should return a count of the prime numbers found.

.. activecode:: challenge-find-primes
    :language: java
    :autograde: unittest
    :practice: T

    Copy your isPrime method from the previous exercise and write a method findPrimes that takes two integers as arguments and prints the prime numbers between them. It should return a count of the prime numbers found.
    ~~~~
    public class FindPrimeNumbers
    {
        // isPrime checks whether n is a prime number
        public static boolean isPrime(int n)
        {
            // 1. Copy your isPrime method here
            // It should have a loop from 2 to n-1 or Math.sqrt(n)
            //   if n is divisible by the loop variable i
            //        return false
            
            

            // if no divisor found after loop, return true
            return true;
        }
        
        // 2. Complete findPrimes to print and return 
        // the number of prime numbers between num1 and num2
        public static int findPrimes(int num1, int num2)
        {
            int count = 0;
            // Add a loop from num1 to num2 to check 
            // if each number is prime using isPrime
            // If it is prime, print it and increment count
            
            
            return count;
        }

        public static void main(String[] args)
        {
            System.out.println("There are " + findPrimes(2, 100) + " prime numbers between 2 and 100.");
            // You may see the grader's test runs in the output.
        }
    }
    ====
    import static org.junit.Assert.*;

    import org.junit.*;

    import java.io.*;

    public class RunestoneTests extends CodeTestHelper
    {
        public RunestoneTests()
        {
            super("FindPrimeNumbers");
        }

        @Test
        public void test1() throws IOException
        {
            String code = getCode();
            String target = "for (int * = #; * ? *; *~)";

            int num = countOccurencesRegex(code, target);

            boolean passed = num == 2;

            getResults("2", "" + num, "Each method should have a for loop", passed);
            assertTrue(passed);
        }

        @Test
        public void testMain() throws IOException
        {
            String expected = "There are 25 prime numbers between 2 and 100.";
            String output = getMethodOutput("main");
            boolean passed = getResults(expected, output, "Checking main output");
            assertTrue(passed);
        }

       @Test
       public void testCall() throws IOException
       {
           Object[] args = {10000,10100};
           String output = getMethodOutput("findPrimes", args);
           String expect = "11";

           boolean passed =
                   getResults(
                           expect,
                           output,
                           "findPrimes(10000,10100)"
                           );
           assertTrue(passed);
       }

        @Test
       public void testBool() throws IOException
       {
           String target = "(isPrime(";
           boolean passed = checkCodeContains("call to isPrime", target);
           assertTrue(passed);
       }
    }


Summary
--------

- (AP 2.9.1) There are standard algorithms that use loops and selection to: 
    - compute a sum or average of a set of values
    - determine a minimum or maximum value 
    - identify if an integer is or is not evenly divisible by another integer 
    - identify the individual digits in an integer 
    - determine the frequency with which a specific criterion is met.

- The **accumulator** pattern is an algorithm that involves storing and updating an accumulator value within a loop, for example to compute a sum or average of a set of values.

- A common algorithm pattern is an if statement within a loop to test each value against a criterion, such as finding the minimum or maximum value in a sequence of numbers.

 







