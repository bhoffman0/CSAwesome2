.. qnum::
   :prefix: 6-4-6-
   :start: 1

Free Response - Number Cube A
=============================

..      index::
      single: numbercubea
    single: free response

The following is a free response question from 2009.  It was question 1 on the exam.  You can see all the free response questions from past exams at https://apstudents.collegeboard.org/courses/ap-computer-science-a/free-response-questions-by-year.

**Question 1.**  A statistician is studying sequences of numbers obtained by repeatedly tossing a six-sided number cube. On each side of the number cube is a single number in the range of 1 to 6, inclusive, and no number is repeated on the cube. The statistician is particularly interested in runs of numbers. A run occurs when two or more consecutive tosses of the cube produce the same value. For example, in the following sequence of cube tosses, there are runs starting at positions 1, 6, 12, and 14.

.. figure:: Figures/numberLine.png
    :width: 757px
    :align: center
    :figclass: align-center

.. code-block:: java

   public class NumberCube
   {
       /**
        * @return an integer value between 1 and 6, inclusive
        */
       public int toss()
       {
           /* implementation not shown */
       }

       // There may be instance variables, constructors, and methods not shown.
   }

**Part a.** Write the method ``getCubeTosses`` that takes a number cube and a number of tosses as parameters. The
method should return an array of the values produced by tossing the number cube the given number of times.

How to Solve
----------------

Click to reveal the algorithm and problems to help you write your solution.

.. reveal:: numbercubealg_r1
   :showtitle: Reveal Algorithm
   :hidetitle: Hide Algorithm
   :optional:

   You will need to create an array to hold the results of each cube toss.  The size of the array should be the passed number of times you will call ``toss``.  You will need to loop that number of times and each time set the value of the array at that index to the result of the ``toss``.  Return the array.

.. reveal:: numbercubea_r1
   :showtitle: Reveal Problems
   :hidetitle: Hide Problems
   :optional:

   .. mchoice:: numbercubea_1
        :answer_a: (int) (Math.random() * 6) + 1)
        :answer_b: (int) (Math.random() * 6)
        :answer_c: Math.random(6);
        :correct: a
        :feedback_a: This expression correctly generates a random number between 1 and 6.
        :feedback_b: This expression generates a random number from 0 to 5.
        :feedback_c: This isn't valid

        Which Java expression correctly generates a random number between 1 and 6?


   .. mchoice:: numbercubea_2
        :answer_a: int[] tossArray = new int[];
        :answer_b: int[] tossArray = new int(numTosses);
        :answer_c: int[] tossArray = new int[numTosses];
        :correct: c
        :feedback_a: You need to specify the size of the array when you create it.
        :feedback_b: It should be new int[numTosses].
        :feedback_c: This will create an array of size numTosses.

        Which of the following correctly creates an array of size numTosses?

   .. mchoice:: numbercubea_3
        :answer_a: for (int i = 0; i <= numTosses; i++)
        :answer_b: for (int i = 1; i < numTosses; i++)
        :answer_c: for (int i = 0; i < numTosses; i++)
        :correct: c
        :feedback_a: This will execute numTosses + 1 times.
        :feedback_b: This will execute numTosses - 1 times.
        :feedback_c: This will execute numTosses times.

        Which of the following correctly loops numTosses number of times?


Mixed Up Code
-------------------

Click to reveal the Mixed Up Code for the solution to this problem.

.. reveal:: numcubeA_parsons
    :showtitle: Reveal Mixed Up Code
    :hidetitle: Hide Mixed Up Code

    .. parsonsprob:: numcubeA
      :numbered: left
      :adaptive:

      The method ``getCubeTosses`` below contains the correct code for one solution to this problem, but it is mixed up.  Drag the needed code from the left to the right and put them in order with the correct indention so that the code would work correctly.
      -----
      public static int[] getCubeTosses(
                                NumberCube cube,
                                int numTosses) 
      {
      =====
        int[] cubeTosses = new int[numTosses];
      =====
        for (int i = 0; i < numTosses; i++)
        {
      =====
           cubeTosses[i] = cube.toss();
      =====
        } // end for
      =====
        return cubeTosses;
      =====
      } // end method


Try and Solve Part A
-----------------------



.. activecode:: FRQNumberCubeA
   :language: java
   :autograde: unittest

   FRQ Number Cube A: Write the method ``getCubeTosses`` that takes a number cube and a number of tosses as parameters. The method should return an array of the values produced by tossing the number cube the given number of times.
   ~~~~
    import java.util.Arrays;

    public class NumberCube
    {

        public int toss()
        {
            return (int) ((Math.random() * 6) + 1);
        }

        public static int[] getCubeTosses(NumberCube cube, int numTosses)
        {
            // Complete this method
        }

        public static void main(String[] args)
        {
            NumberCube cube = new NumberCube();
            int numTosses = 9;
            int[] tosses = getCubeTosses(cube, numTosses);

            if (tosses.length < numTosses)
            {
                System.out.println(
                        "It looks like you are not returning an array of the correct"
                            + " size:");
                System.out.println(Arrays.toString(tosses));
            }
            else
            {
                System.out.println("You returned an array of the correct size:");
                System.out.println(Arrays.toString(tosses));
            }
        }
    }

    ====
    import static org.junit.Assert.*;

    import org.junit.*;

    import java.io.*;

    public class RunestoneTests extends CodeTestHelper
    {
        @Test
        public void testleng() throws IOException
        {
            String expect = "You returned an array of the correct size";
            String actual = getMethodOutput("main");

            boolean passed = getResults(expect, actual, "Checking output from main()");
            assertTrue(passed);
        }

        @Test
        public void test1()
        {
            NumberCube c = new NumberCube();
            int[] results = NumberCube.getCubeTosses(c, 20);

            String expect = "20";
            String actual = "" + results.length;

            boolean passed =
                    getResults(
                            expect,
                            actual,
                            "Checking getNumTosses() returns an array of the correct size");
            assertTrue(passed);
        }

        @Test
        public void test2()
        {
            NumberCube c = new NumberCube();
            int[] results = NumberCube.getCubeTosses(c, 100);

            boolean passed = true;
            int same = 0;

            for (int i = 0; i < results.length; i++)
            {
                if (i < results.length - 1 && results[i] == results[i + 1]) same++;

                if (results[i] < 1 || results[i] > 6) passed = false;
            }

            if (same > 25) passed = false;

            String expect = "true";
            String actual = "" + passed;

            passed =
                    getResults(
                            expect,
                            actual,
                            "Checking that tosses are within proper range (1-6, no 0)",
                            passed);
            assertTrue(passed);
        }

        @Test
        public void test3()
        {
            String target = "cube.toss()";
            boolean passed = checkCodeContains("call to cube.toss()", target);
            assertTrue(passed);
        }
    }

