.. include:: ../common.rst

.. qnum::
   :prefix: 4-7-
   :start: 1

|Time45|

Wrapper Classes - Integer and Double
====================================

.. index::
    single: wrapper classes
    single: Integer
    single: Double
    single: wrapper
    pair: integer; minimum
    pair: integer; maximum

A **wrapper class** is a class that wraps (encloses) around a primitive data type and gives it an object appearance. The wrapper classes are part of the ``java.lang`` package, which is imported by default into all Java programs. The ``Integer`` class and ``Double`` class are **wrapper classes** that create objects from primitive types of ``int`` and ``double`` respectively. Sometimes you need to create a wrapped object for a primitive type so that you can give it to a method that is expecting an object, or to put it in a collection like an ``ArrayList`` that we will see in the next lesson. The wrapper classes are also used to convert strings to primitive data types and to convert primitive data types to strings which is useful when using the ``Scanner`` class with input.

Creating Integer and Double Objects
-----------------------------------

Here are some examples of creating Integer and Double objects. In Java version 7, you can use a constructor like ``new Integer(2)`` to create an object with the value 2 in it. In Java 9 and later, you can just use ``Integer i = 2;`` to create an object with the value 2 wrapped in it. 

.. code-block:: java

   // in older versions of Java 
   Integer i = new Integer(2); // create an object with 2 in it
   Double d = new Double(3.5); // create an object with 3.5 in it

   // in newer versions of Java (9+)
   Integer i = 2;
   Double d = 3.5;


These wrapper classes are also useful because they have some special values (like the minimum and maximum values for the type) and methods that you can use. Try the following code to see the minimum and maximum values possible for the type int.


.. activecode:: lcmm1
   :language: java
   :autograde: unittest

   What's the minimum and maximum numbers for an int? What happens if you go beyond these limits with - 1 or + 1?
   ~~~~
   public class Test1
   {
       public static void main(String[] args)
       {
           System.out.println(Integer.MIN_VALUE);
           System.out.println(Integer.MAX_VALUE);
           System.out.println(Integer.MIN_VALUE - 1);
           System.out.println(Integer.MAX_VALUE + 1);
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
           String expect = "-2147483648\n2147483647\n2147483647\n-2147483648";
           boolean passed = getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }

The int type in Java can be used to represent any whole number from -2147483648 to 2147483647.  Why those numbers?  Integers in Java are represented in 2's complement binary and each integer gets 32 bits of space.  In 32 bits of space with one bit used to represent the sign you can represent that many values.  Why is there one more negative number than positive number?  It is because 0 is considered a positive number.

.. index::
   single: overflow

What do the last two lines print out?  Did this surprise you?  Java will actually return the maximum integer value if you try to subtract one from the minimum value. This is called **underflow**. And, Java will return the minimum integer value if you try to add one to the maximum.  This is called **overflow**.  It is similar to how odometers work -- in a really old car that reaches the maximum miles possible on the odometer, the odometer rolls over back to 0, the minimum value. In Java, any int value that surpasses 32 bits gets rolled over, so that  the Integer.MAX_VALUE 2147483647 incremented (+1) returns -2147483648 which is the Integer.MIN_VALUE.

When would you ever use Integer.MIN_VALUE or Integer.MAX_VALUE?  They are handy if you want to initialize a variable to the smallest possible value and then search a sequence of values for a larger value.

Autoboxing and Unboxing
-----------------------

**Autoboxing** is the automatic conversion that the Java compiler makes between primitive types and their corresponding object wrapper classes. This includes converting an ``int`` to an ``Integer`` and a ``double`` to a ``Double``. The Java compiler applies autoboxing when a primitive value is passed as a parameter to a method that expects an object of the corresponding wrapper class or assigned to a variable of the corresponding wrapper class. Here's an example of autoboxing.

.. code-block:: java

   Integer i = 2;
   Double d = 3.5;


**Unboxing** is the automatic conversion that the Java compiler makes  from the wrapper class to the primitive type. This includes converting an Integer to an int and a Double to a double. The Java compiler applies unboxing when a wrapper class object is passed as a parameter to a method that expects a value of the corresponding primitive type or assigned to a variable of the corresponding primitive type. Here's an example of unboxing:

.. code-block:: java

   Integer i = 2;  // autoboxing - wrap 2
   int number = i; // unboxing - back to primitive type


|Exercise| **Check your understanding**

.. dragndrop:: WrapperClasses
    :feedback: Review the vocabulary.
    :match_1: automatic conversion from the primitive type to the wrapper object|||autoboxing
    :match_2: automatic conversion from the wrapper object to the primitive type|||unboxing
    :match_3: Integer|||wrapper class
    :match_4: int|||primitive type
    :match_5: Integer.MAX_VALUE + 1|||overflow
    :match_6: Integer.MIN_VALUE - 1 |||underflow

    Drag the definition from the left and drop it on the correct word on the right.  Click the "Check Me" button to see if you are correct.


Parsing Strings to Numbers
--------------------------

The ``Integer`` and ``Double`` classes have methods called ``Integer.parseInt`` and ``Double.parseDouble`` that can be used to convert strings to numbers. They are often used with the ``Scanner`` class to convert input which is read in as a ``String`` into an ``int`` or ``double`` so that you can create arithmetic expressions (do math) or create logical conditions that test the values against other numbers using relational operators like ``<`` and ``>``.  These methods are listed on the Java Quick Reference Sheet provided during the AP exam. 

- ``static int parseInt(String s)`` returns the ``String`` argument as a signed ``int``.
- ``static double parseDouble(String s)`` returns the ``String`` argument as a signed ``double``.

Here's an example of using these methods:

.. activecode:: parseMethods
   :language: java
   :autograde: unittest

   Run the code below to see useful parse methods in the Integer and Double wrapper classes.
   ~~~~
   public class Test2
   {
       public static void main(String[] args)
       {
           Integer i = 2;
           Double d = 3.5;
           System.out.println(
                   i.intValue()); // intValue() returns the primitive value
           System.out.println(d.doubleValue());

           String ageStr = "16";
           // Integer.parseInt and Double.parseDouble are often used to
           // convert an input string to a number so you can do math on it.
           System.out.println(
                   "Age "
                           + ageStr
                           + " in 10 years is "
                           + (Integer.parseInt(ageStr) + 10));
           
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
              String expect = "2\n3.5\nAge 16 in 10 years is 26";
              boolean passed = getResults(expect, output, "Expected output from main", true);
              assertTrue(passed);
         
       }
   }

.. activecode:: wrapperDebug
   :language: java
   :autograde: unittest

   Find and fix the bugs below to use the correct Integer and Double methods and variables.
   ~~~~
   public class Debug
   {
       public static void main(String[] args)
       {
           integer i = 2.3;
           Double d = 5;
           System.out.println( i.intValue );
           System.out.println( doubleValue() );
           // Print out the min and max values possible for integers
           System.out.println(Integer.min_value);
           System.out.println( int.MAX_VALUE() );
           // parse strings to numbers
           String numStr = "2.5";
           System.out.println( Int.parseInt(numStr) * 2 );     
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
           String expect = "2\n5.0\n-2147483648\n2147483647\n5.0";
           boolean passed = getResults(expect, output, "Expected output from main");
           assertTrue(passed);
       }

       @Test
       public void testCode() throws IOException
       {
           String target = "Integer.MAX_VALUE";
           boolean passed = checkCodeContains("MAX_VALUE", target);
           assertTrue(passed);
       }
       @Test
       public void testCode() throws IOException
       {
           boolean passed = checkCodeContains("Double.parseDouble");
           assertTrue(passed);
       }
   }

|Groupwork| Coding Challenge: Pokemon Speed 
----------------------------------------------------

In the last lesson, we read in a file of Pokemon data. In this exercise, we will read in the file and calculate the average Pokemon speed and find the Pokemon with the highest speed. The speed is the 8th column in the file; when a row of data is split into an array with the index starting at 0, the speed will have the 7th index.  We will use the ``Integer.parseInt`` method to convert the speed from a string to an integer so we can compare the speeds.  

.. activecode:: challenge-pokespeed
    :language: java
    :autograde: unittest
    :datafile: pokemon.csv

    Complete the . This program reads in some of the data from the pokemon file into a String array of lines. Complete the ``randomPokemon`` method to print out a random pokemon name and its image using the split method. Run the program multiple times to see different Pokemon names and images.
    ~~~~
    import java.io.*;
    import java.util.*;

    public class PokeSpeed
    {
        private String filename = "pokemon.csv";
        private String[] pokemonLines = new String[152];

        /* This method reads in filename into the pokemonLines array */
        public int readFile() throws IOException
        {
            File myFile = new File(filename);
            Scanner scan = new Scanner(myFile);
            int i = 0;
            while (scan.hasNextLine())
            {
                pokemonLines[i] = scan.nextLine();
                i++; 
            }
            System.out.println("Read in " + i + " lines.");
            scan.close();
            return i;
        }

        /* Write a function findMaxSpeed that loops through the pokemonLines array,
          splits it on commas to get the speed in the 7th index, and parses it to compare to a maxSpeed, and returns the maxSpeed.  */
        public int findMaxSpeed()
        {
            int maxSpeed = 0;

            // 1. Loop through the pokemonLines array
                // 2. Split the line on commas into a data array
                // 3. Use parseInt on the 7th element of the data array to get the  speed
                // 4. Compare the speed to a maxSpeed variable and update maxSpeed if needed
      

            return maxSpeed;
        }

        /* Write a function findAverageSpeed that loops through the pokemonLines array,
          splits it on commas to get the speed in the 7th index, and parses it to add it to the total, and returns the average speed.  */
        public double findAverageSpeed()
        {
            double averageSpeed = 0;
            double totalSpeed = 0;

            // Loop through the pokemonLines array, split, parse, and add up the speeds

            return averageSpeed;
        }
        public static void main(String[] args) throws IOException
        {
            PokeSpeed p = new PokeSpeed();
            int numLines = p.readFile();
            System.out.println("Max speed: " + p.findMaxSpeed());
            System.out.println("Average speed: " + p.findAverageSpeed());
            
        }
    }
    ====
    import static org.junit.Assert.*;

    import org.junit.*;
 
    import java.io.*;

    public class RunestoneTests extends CodeTestHelper
    {
       public RunestoneTests() throws IOException
       {
           super("PokeSpeed");
           readFile();
       }

       @Test
       public void parseTest()
       {
           boolean passed = checkCodeContains("Integer.parseInt");
           assertTrue(passed);
       }

        @Test
       public void callFindMax() throws IOException
       {
            int speed = findMaxSpeed();
            String expect = "130";
            boolean passed = getResults(expect, output, "Expected output from findMaxSpeed");
            assertTrue(passed);
        }
        @Test
       public void callFindMax() throws IOException
       {
            int speed = findMaxSpeed();
            String expect = "130";
            boolean passed = getResults(expect, output, "Expected output from findMaxSpeed");
            assertTrue(passed);
        }
        @Test
       public void callFindMax() throws IOException
       {
            int speed = findMaxSpeed();
            String expect = "130";
            boolean passed = getResults(expect, ""+speed, "Expected output from findMaxSpeed");
            assertTrue(passed);
        }
        @Test
         public void callAvgSpeed() throws IOException
         {
                double speed = findAverageSpeed();
                String expect = "65.0";
                boolean passed = getResults(expect, ""+speed, "Expected output from findAverageSpeed");
                assertTrue(passed);
         }

       @Test
       public void splitCode()
       {
           boolean passed = checkCodeContains("call to split method", ".split");
           assertTrue(passed);
       }

       @Test
       public void speedIndexCode()
       {
           boolean passed = checkCodeContains("the correct index for the speed (7)", "[7]");
           assertTrue(passed);
       }
    }

Summary
-------------------

- The ``Integer`` class and ``Double`` class are **wrapper classes** that create objects from primitive types.

- (AP 4.7.A.1) The ``Integer`` class and ``Double`` class are part of the ``java.lang`` package. 

- (AP 4.7.A.1) An ``Integer`` object is immutable, meaning once an ``Integer`` object is created, its attributes cannot be changed. A ``Double`` object is immutable, meaning once a ``Double`` object is created, its attributes cannot be changed.

- (AP 4.7.A.2) **Autoboxing** is the automatic conversion that the Java compiler makes between primitive types and their corresponding object wrapper classes. This includes converting an ``int`` to an ``Integer`` and a ``double`` to a ``Double``. The Java compiler applies autoboxing when a primitive value is:

    - passed as a parameter to a method that expects an object of the corresponding wrapper class
    - assigned to a variable of the corresponding wrapper class

- (AP 4.7.A.3) **Unboxing** is the automatic conversion that the Java compiler makes from the wrapper class to the primitive type. This includes converting an ``Integer`` to an ``int`` and a ``Double`` to a ``double``. The Java compiler applies unboxing when a wrapper class object is:

    - passed as a parameter to a method that expects a value of the corresponding primitive type
    - assigned to a variable of the corresponding primitive type

- (AP 4.7.A.4) The following class ``Integer`` method—including what it does and when it is used—is part of the Java Quick Reference: ``static int parseInt(String s)`` returns the ``String`` argument as a signed ``int``.
- (AP 4.7.A.5) The following class ``Double`` method—including what it does and when it is used—is part of the Java Quick Reference: ``static double parseDouble(String s)`` returns the ``String`` argument as a signed ``double``.

