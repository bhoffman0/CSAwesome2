.. qnum::
   :prefix: 6-4-2-
   :start: 1

Free Response - Horse Barn B
-------------------------------

.. index::
    single: horse barn
    single: free response

The following is a variation of part b of a free response question from 2012.  It was question 3 on the exam.  You can see all the free response questions from past exams at https://apstudents.collegeboard.org/courses/ap-computer-science-a/free-response-questions-by-year.

The original question had an interface called Horse, but the problem below has been changed to a class Horse instead of the interface. Interfaces are no longer covered on the AP CSA exam. However, you can still solve problems that have interfaces in them by changing them to a class, since an interface just describes the methods that a class must have.

**Question 3.**  Consider a software system that models a horse barn.


.. code-block:: java

   public class Horse
   {
      /** @return the horse's name */
      public String getName()
      { implementation not shown }

      /** @return the horse's weight */
      public int getWeight()
      { implementation not shown }

      // There may be other methods that are not shown

   }


A horse barn consists of N numbered spaces. Each space can hold at most one horse. The spaces are indexed starting from 0; the index of the last space is N - 1. No two horses in the barn have the same name. The declaration of the HorseBarn class is shown below.



.. code-block:: java

   public class HorseBarn
   {
       /**
        * The spaces in the barn. Each array element holds a reference to the horse
        * that is currently occupying the space. A null value indicates an empty
        * space.
        */
       private Horse[] spaces;

       /**
        * Consolidates the barn by moving horses so that the horses are in adjacent
        * spaces, starting at index 0, with no empty space between any two horses.
        * Postcondition: The order of the horses is the same as before the
        * consolidation.
        */
       public void consolidate()
       {
           /* to be implemented in part (b) */
       }
   }

**Part b.**  Write the HorseBarn method consolidate. This method consolidates the barn by moving horses so that the horses are in adjacent spaces, starting at index 0, with no empty spaces between any two horses. After the barn is consolidated, the horses are in the same order as they were before the consolidation.

.. figure:: Figures/horseBarnB.png
    :width: 700px
    :align: center
    :figclass: align-center

    Figure 1: Example calls and results

How to solve this problem
===========================

One way to solve this problem is to create a temporary array the same size as ``spaces`` and then loop through the current ``spaces`` array and if the current element isn't null copy it to the temporary array. What kind of loop should you use? A for loop or an enhanced for loop would work for this problem. You will need an index for at least the temporary array.

.. (teachers complained that you could use either because you need a 2nd index anyway) .. mchoice:: frhbb_1
   :answer_a: for
   :answer_b: for each
   :answer_c: while
   :correct: a
   :feedback_a: Use a for loop when you know how many times a loop needs to execute and need the index.
   :feedback_b: Although you could use a for each loop, a for loop a may be the better choice because you need to use the index. Use a for each loop if you want to loop through all the elements in a collection and don't need an index.
   :feedback_c: Although you could use a for each loop, a for loop a may be the better choice because you need to use the index. Use a while loop when you don't know how many times a loop needs to execute.

   Which loop is a good one to use to solve this problem?

While we are looping through the ``spaces`` array, we need to check for non-null positions. Click to reveal a practice problem about checking for null values.

.. reveal:: frhbb_r2
   :showtitle: Reveal Problem
   :hidetitle: Hide Problem
   :optional:

   .. mchoice:: frhbb_2
        :answer_a: if (spaces.get(index) != null)
        :answer_b: if (!spaces[index].null())
        :answer_c: if (spaces[index] != null)
        :correct: c
        :feedback_a: This is the syntax for checking an element within an ArrayList.
        :feedback_b: Is null() a standard Java method? Comparing an object with a null value is simpler.
        :feedback_c: "!=" is the best way to compare an element with a null value.

        How do we check if the space at the current index isn't null?

Try to write the code for the method ``consolidate`` in the ``HorseBarn`` class. When you are ready click "Run" to test your solution.

.. activecode:: lcfrhbb1
   :language: java
   :autograde: unittest

   Try to write the code for the method ``consolidate`` in the ``HorseBarn`` class. When you are ready click "Run" to test your solution.
   ~~~~
   class Horse
   {
       private String name;
       private int weight;

       public Horse(String theName, int theWeight)
       {
           this.name = theName;
           this.weight = theWeight;
       }

       public String getName()
       {
           return this.name;
       }

       public int getWeight()
       {
           return this.weight;
       }

       public String toString()
       {
           return "name: " + this.name + " weight: " + this.weight;
       }
   }

   public class HorseBarn
   {
       private Horse[] spaces;

       /**
        * Constructor that takes the number of stalls
        *
        * @param numStalls - the number of stalls in the barn
        */
       public HorseBarn(int numStalls)
       {
           spaces = new Horse[numStalls];
       }

       /**
        * Consolidates the barn by moving horses so that the horses are in adjacent
        * spaces, starting at index 0, with no empty space between any two horses.
        * Postcondition: The order of the horses is the same as before the
        * consolidation.
        */
       public void consolidate() {}

       public String toString()
       {
           String result = "";
           Horse h = null;
           for (int i = 0; i < spaces.length; i++)
           {
               h = spaces[i];
               result = result + "space " + i + " has ";
               if (h == null)
               {
                   result = result + " null \n";
               }
               else 
               {
                   result = result + h.toString() + "\n";
               }
           }
           return result;
       }

       public static void main(String[] args)
       {
           HorseBarn barn = new HorseBarn(7);
           barn.spaces[0] = new Horse("Trigger", 1340);
           barn.spaces[2] = new Horse("Silver", 1210);
           barn.spaces[5] = new Horse("Patches", 1350);
           barn.spaces[6] = new Horse("Duke", 1410);
           System.out.println("before consolidate");
           System.out.println(barn);
           barn.consolidate();
           System.out.println("after consolidate");
           System.out.println(barn);
       }
   }

   ====
   import static org.junit.Assert.*;

   import org.junit.*;

   import java.io.*;
   import java.lang.reflect.Field;

   public class RunestoneTests extends CodeTestHelper
   {
       @Test
       public void testMain() throws IOException
       {
           String output = getMethodOutput("main");
           String expect =
                   "space 0 has name: Trigger weight: 1340\n"
                       + "space 1 has name: Silver weight: 1210\n"
                       + "space 2 has name: Patches weight: 1350\n"
                       + "space 3 has name: Duke weight: 1410\n"
                       + "space 4 has  null \n"
                       + "space 5 has  null \n"
                       + "space 6 has  null";

           boolean passed = removeSpaces(output).contains(removeSpaces(expect));
           getResults(expect, output, "Expected output from main", passed);
           assertTrue(passed);
       }

       @Test
       public void test1()
       {
           HorseBarn barn = new HorseBarn(7);

           try
           {
               Field barnField = HorseBarn.class.getDeclaredField("spaces");
               barnField.setAccessible(true);

               Horse[] spaces = (Horse[]) barnField.get(barn);

               spaces[1] = new Horse("Trigger", 1340);
               spaces[3] = new Horse("Silver", 1210);
               spaces[5] = new Horse("Lady", 1575);

               String expect =
                       "space 0 has name: Trigger weight: 1340\n"
                           + "space 1 has name: Silver weight: 1210\n"
                           + "space 2 has name: Lady weight: 1575\n"
                           + "space 3 has  null \n"
                           + "space 4 has  null \n"
                           + "space 5 has  null \n"
                           + "space 6 has  null";
               barn.consolidate();
               String actual = barn.toString();

               boolean passed = removeSpaces(actual).contains(removeSpaces(expect));

               String msg =
                       "Checking consolidate() with [null, \"Trigger\", null, \"Silver\", null,"
                           + " \"Lady\", null, null]";

               getResults(expect, actual, msg, passed);
               assertTrue(passed);

           }
           catch (Exception e)
           {
               getResults("", "", "There was a error with the testing code.", false);
               fail();
           }
       }
   }

Video - One way to code the solution
=====================================

.. the video is 2012Q3B.mov

The following video is also on YouTube at https://youtu.be/3HytvgdLCNI.  It walks through coding a solution.

.. youtube:: 3HytvgdLCNI
    :width: 800
    :align: center


