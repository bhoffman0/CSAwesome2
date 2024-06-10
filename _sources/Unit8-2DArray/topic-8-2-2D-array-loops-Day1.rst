.. include:: ../common.rst

.. qnum::
   :prefix: 8-2-
   :start: 1

..  |Time45|

Nested Loops for 2D Arrays (Day 1)
-----------------------------------

In this lesson, you will learn how to use nested loops to traverse a 2D Array.

Getting the Number of Rows and Columns
---------------------------------------
.. index::
   pair: 2D Array; number of rows
   pair: 2D Array; number of columns

Arrays know their length (how many elements they can store).  The length is a public read-only field so you can use *dot-notation* to access the field (``arrayName.length``). The length of the outer array is the number of rows and the length of one of the inner arrays is the number of columns.



.. code-block:: java

  ticketInfo.length // returns the number of rows
  ticketInfo[0].length // returns the number of columns

.. note::

     Note that length is a field and not a method, so you don't add parentheses after length.  However, if you use parentheses after length during the exam, you won't lose any points. Since for the AP CSA exam all two-dimensional arrays are rectangular arrays (arrays that have the same number of columns in each row) you can just use the length of the first inner array as the number of columns as shown by ``ticketInfo[0].length``.

|Exercise| **Check your understanding**

.. mchoice:: qa2ldb_2
   :practice: T
   :answer_a: 2
   :answer_b: 4
   :answer_c: 8
   :correct: a
   :feedback_a: The size of outer list is the number of rows.
   :feedback_b: The size of the inner list is the number of columns.
   :feedback_c: This is the total number of items in the array.

   How many rows does ``a`` have if it is created as follows ``int[][] a = { {2, 4, 6, 8}, {1, 2, 3, 4}};``?

.. mchoice:: qa2ldb_3
   :practice: T
   :answer_a: nums[3][2]
   :answer_b: nums[2][3]
   :answer_c: nums[2][1]
   :answer_d: nums[1][2]
   :correct: c
   :feedback_a: This would be true if array indices started with 1 but they start with 0.
   :feedback_b: This would be true if array indicies started with 1 and the column was specified first.  However, array indices start at 0 and the row is given first in row-major order.
   :feedback_c: Array indices start with 0 so the third row has an index of 2 and the second column has an index of 1.
   :feedback_d: This would be true if the column index was first, but in row-major order the row index is first.

   Which of the following would I use to get the value in the third row and second column from a 2D array called ``nums``?


Looping Through a 2D Array
--------------------------

.. index::
   pair: 2D Array; looping through
   pair: loop; nested

Since you can find out the number of rows and columns in a 2D array you can use a **nested for loop** (one loop inside of another loop) to loop/traverse through all of the elements of a 2D array.

.. code-block:: java

  int[][] array = { {1,2,3},{4,5,6}};
  for (int row = 0; row < array.length; row++)
  {
      for (int col = 0; col < array[0].length; col++)
      {
           System.out.println( array[row][col] );
      }
   }

|CodingEx| **Coding Exercise**



.. activecode:: lcgetAverage
   :language: java
   :autograde: unittest

   What does the following code do? Add another row of numbers to the matrix. Will the loops traverse this row too? Use the CodeLens button to trace through the code. Note that an array can be passed in as an argument to a method.
   ~~~~
   public class Test1
   {

       public static double getAverage(int[][] a)
       {
           double total = 0;
           int value = 0;
           for (int row = 0; row < a.length; row++)
           {
               for (int col = 0; col < a[0].length; col++)
               {
                   value = a[row][col];
                   total = total + value;
               }
           }
           return total / (a.length * a[0].length);
       }

       public static void main(String[] args)
       {
           int[][] matrix = { {1, 2, 3}, {4, 5, 6}};
           System.out.println(getAverage(matrix));
       }
   }

   ====
   import static org.junit.Assert.*;

   import org.junit.*;

   import java.io.*;

   public class RunestoneTests extends CodeTestHelper
   {

       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expected = "3.5";

           boolean passed = !output.contains(expected);

           passed = getResults("true", "" + passed, "Average has changed");
           assertTrue(passed);
       }

       @Test
       public void test2()
       {
           String code = getCode();
           String expected = "int[][] matrix = { {1,2,3},{4,5,6}};";

           boolean passed = !code.replaceAll(" ", "").contains(expected.replaceAll(" ", ""));

           passed = getResults("true", "" + passed, "Matrix has been changed");
           assertTrue(passed);
       }
   }

Some key things to notice about this code are:

- ``total`` is declared to be a double so that the result will be a double.  If ``total`` was declared to be an ``int`` then the result would be an integer and the values after the decimal point would be thrown away.
- The array is passed in as an argument to the method.
- The number of rows is ``a.length``
- The number of columns is ``a[0].length``
- The number of times this loop executes is the number of rows times the number of columns.



|Exercise| **Mixed up programs**

.. parsonsprob:: 9_largest
   :numbered: left
   :practice: T
   :adaptive:

   The following has the correct code to find the largest value in a 2D array. Drag the blocks from the left into the correct order on the right and indent them as well. Check your solution by clicking on the Check button.  You will be told if any of the blocks are in the wrong order or have the wrong indention.
   -----
   public static int getLargest(int[][] arr)  
   {
   =====
    int largest = arr[0][0];
    int current = 0;
    for (int r = 0; r < arr.length; r++)
    {
    =====
      for (int c = 0; c < arr[0].length; c++)
      {
    =====
        current = arr[r][c];
        if (current > largest)
        {
    =====
          largest = current;
    =====
        } // end if
    =====
      } // end column loop
    =====
    } // end row loop
    return largest;
   =====
   } // end method

You can step through this code using the Java Visualizer by clicking on the following |Java Visualizer|.

.. |Java Visualizer| raw:: html

   <a href= "http://cscircles.cemc.uwaterloo.ca/java_visualize/#code=public+class+Test+%7B%0A+++%0A+++public+static+int+getLargest(int%5B%5D%5B%5D+arr)++%7B%0A++++int+largest+%3D+arr%5B0%5D%5B0%5D%3B%0A++++for+(int+row+%3D+0%3B+row+%3C+arr.length%3B+row%2B%2B)++%7B%0A++++++for+(int+col+%3D+0%3B+col+%3C+arr%5B0%5D.length%3B+col%2B%2B)++%7B%0A++++++++if+(arr%5Brow%5D%5Bcol%5D+%3E+largest)++%7B%0A++++++++++largest+%3D+arr%5Brow%5D%5Bcol%5D%3B%0A++++++++%7D+//+end+if%0A++++++%7D+//+end+column+loop%0A++++%7D+//+end+row+loop%0A++++return+largest%3B%0A+++%7D+//+end+method%0A+++%0A+++public+static+void+main(String%5B%5D+args)+%7B%0A++++++int%5B%5D%5B%5D+testArray+%3D+%7B%7B-32,+-6,+-3%7D,+%7B-392,+-93,+-2%7D%7D%3B%0A++++++System.out.println(getLargest(testArray))%3B%0A+++%7D%0A%7D&mode=display&curInstr=40" style="text-decoration:underline" target="_blank" >Java Visualizer</a>


Most nested loops with 2D Arrays use "row-major order" where the outer loop goes through each row. However, you can write nested loops that traverse in "column-major order" like below.


|CodingEx| **Coding Exercise**



.. activecode:: ColumnMajorTraversal
   :language: java
   :autograde: unittest

   What will the following code print out? Try to guess before you run it.
   ~~~~
   public class ColumnMajorTraversal
   {
       public static void main(String[] args)
       {
           int[][] array = { {1, 2, 3}, {4, 5, 6}};
           for (int col = 0; col < array[0].length; col++)
           {
               for (int row = 0; row < array.length; row++)
               {
                   System.out.println(array[row][col]);
               }
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
       public void test1()
       {
           String output = getMethodOutput("main");
           String expected = "1\n4\n2\n5\n3\n6";

           boolean passed = getResults(expected, output, "main()", true);
           assertTrue(passed);
       }
   }

AP Practice
------------

.. mchoice:: AP8-2-1
   :practice: T
   :answer_a: 45 44 43 42 41
   :answer_b: 45
   :answer_c: 41 42
   :answer_d: 45 44
   :answer_e: 44 45
   :correct: d
   :feedback_a: Trace through the code. Notice that the inner loop stops at index row.
   :feedback_b: Trace through the code. Notice that the inner loop stops at index row.
   :feedback_c: Trace through the code. Notice that the inner loop works through the row backwards.
   :feedback_d: Correct!
   :feedback_e: Trace through the code. Notice that the inner loop works through the row backwards.

   Consider the following code segment. What is the last row of numbers printed when this code segment is executed?

   .. code-block:: java

      int[][] points = { {11, 12, 13, 14, 15},
                         {21, 22, 23, 24, 25},
                         {31, 32, 33, 34, 35},
                         {41, 42, 43, 44, 45}};
      for (int row = 0; row < points.length; row++)
      {
          for (int col = points[0].length - 1; col >= row; col--)
          {
               System.out.print(points[row][col] + " ");
          }
          System.out.println();
     }




This lesson is continued on the next page.


