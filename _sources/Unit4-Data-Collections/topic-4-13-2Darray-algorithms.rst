.. include:: ../common.rst

.. qnum::
   :prefix: 4-13-
   :start: 1

|Time90|

Implementing 2D Array Algorithms
====================================

.. index::
    single: 2D-array algorithms
    single: minimum
    single: maximum
    single: sum
    single: average
    single: pairs
    single: duplicates
    single: shift
    single: rotate

All of the array algorithms can be applied to 2D arrays too. 
There are standard algorithms that utilize 2D array traversals to:

- determine a minimum or maximum value of all the elements or for a designated row, column, or other subsection
- compute a sum or average of all the elements or for a designated row, column, or other subsection
- determine if at least one element has a particular property in the entire 2D array or for a designated row, column, or other subsection
- determine if all elements of the 2D array or a designated row, column, or other subsection have a particular property
- determine the number of elements in the 2D array or in a designated row, column, or other subsection having a particular property
- access all consecutive pairs of elements
- determine the presence or absence of duplicate elements in the 2D array or in a designated row, column, or other subsection
- shift or rotate elements in a row left or right or in a column up or down
- reverse the order of the elements in a row or column

Remember that with 1D arrays, many algorithms followed the following patterns with a for loop or enhanced for loop.

.. code-block:: java

  // 1 Dimensional Array Traversal
  for (int value : array)
  {
      if (value ....)
          ...
  }

  for(int i=0; i < array.length; i++)
  {
     if (array[i] ....)
         ...
  }

But with 2D arrays, you will need to use nested loops to traverse the rows and columns of the 2D array. We often use indexed for loops for this to better control the row and column index values, but you can also use enhanced for loops.

.. code-block:: java

  // 2 Dimensional Array Traversal
  for (int row = 0; row < array.length; row++)
  {
      for (int col = 0; col < array[0].length; col++)
      {
          if (array[row][col] ....)
              ...
      }
  }

  // enhanced for loops
  for (int[] row : array)
  {
      for (int value : row)
      {
          if (value ....)
              ...
      }
  }

Sum, Average, Min, Max 2D Array Algorithms
-------------------------------------------

For example, counting and searching algorithms work very similarly in 1D and 2D arrays. The following code adds all of the values in a given row.

|CodingEx| **Coding Exercise**


.. activecode:: lca2dloopPart
   :language: java
   :autograde: unittest

   What will the following code print out? Can you complete the  method called ``getTotalForCol`` that gets the total for a column? To do this, you must loop through the rows. The array's length will tell you how many rows you have since it is an array of arrays, while the length of the array's first element will tell you how many columns.
   ~~~~
   public class Total
   {

       public static int getTotalForRow(int row, int[][] a)
       {
           int total = 0;
           for (int col = 0; col < a[0].length; col++)
           {
               total = total + a[row][col];
           }
           return total;
       }

       // Complete the method getTotalForCol below
       public static int getTotalForCol(int col, int[][] a)
       {
           int total = 0;
           // Add a loop here to total a column col

           return total;
       }

       public static void main(String[] args)
       {
           int[][] matrix = { {1, 2, 3}, {4, 5, 6}};
           System.out.println(getTotalForRow(0, matrix));
           System.out.println(getTotalForCol(0, matrix));
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
           super("Total");
       }

       @Test
       public void testMain() throws IOException
       {
           String output = getMethodOutput("main");
           String expect = "6\n5";
           boolean passed = getResults(expect, output, "Expected output from main");
           assertTrue(passed);
       }

       @Test
       public void test2()
       {
           int[][] array = { {1, 4, 8}, {6, 7, 9}};
           int value = 0;
           Object[] args = {value, array};

           String output = getMethodOutput("getTotalForCol", args);
           String expect = "7";

           boolean passed =
                   getResults(expect, output, "Testing getTotalForCol(0, { {1, 4,8},{6, 7, 9} })");
           assertTrue(passed);
       }
   }

|Exercise| **Mixed up programs**

.. parsonsprob:: max2DArrayParsons
   :numbered: left
   :practice: T
   :adaptive:

   The following has the correct code to find the largest value in a 2D array. Drag the blocks from the left into the correct order on the right and indent them as well. Check your solution by clicking on the Check button.  You will be told if any of the blocks are in the wrong order or have the wrong indention.
   -----
   public int getLargest(int[][] arr)  
   {
   =====
    int largest = arr[0][0];
    int current = 0;
    for(int r=0;r < arr.length;r++)
    {
    =====
      for(int c=0;c < arr[0].length;c++)
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

Subsection of a 2D Array for a Property
-----------------------------------------

.. index::
   pair: 2D Array; loop range

You can loop through just part of a 2D array. You can change the starting value and ending value to loop through a subset of a 2D array. The following code counts the number of times a value appears in a part of the 2D array indicated by the row and column start and end values.

.. activecode:: lca2dloopPart2
   :language: java
   :autograde: unittest

   Looping through just part of a 2D array.
   ~~~~
   public class Count
   {
       public static int countValues(int value, int[][] a, int rowStart, 
                                  int rowEnd, int colStart, int colEnd)
       {
           int count = 0;
           for (int row = rowStart; row <= rowEnd; row++)
           {
               for (int col = colStart; col <= colEnd; col++)
               {
                   if (a[row][col] == value)
                   {
                        count++;
                   }
               }
           }
           return count;
       }

       public static void main(String[] args)
       {
           int[][] matrix = { {3, 2, 3}, {4, 3, 6}, {8, 9, 3}, {10, 3, 3}};
           System.out.println(countValues(3, matrix, 0, 2, 0, 2));
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
           String expect = "4";
           boolean passed = getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }

Duplicates in 2D Arrays
------------------------

You can determine the presence or absence of duplicate elements in the 2D array or in a designated row, column, or other subsection.
With 1D arrays, we sometimes needed 2 nested loops to check for duplicates or pairs. With 2D arrays, you often need 4 nested loop to check the whole array! 

.. activecode:: noDups2DArray
   :language: java
   :autograde: unittest

   The method ``noDups(nums)`` returns ``true`` if there are no repeated (duplicate) items in the array ``nums``. It should return false if it does find a repeated element using nested loops.
   ~~~~
   public class Duplicates
   {
       public static boolean noDups(int[][] nums)
       {
           for (int row = 0; row < nums.length; row++)
           {
               for (int col = 0; col < nums[0].length; col++)
               {
                   for (int row2 = row; row2 < nums.length; row2++)
                   {
                       for (int col2 = col + 1; col2 < nums[0].length; col2++)
                       {
                           if (nums[row][col] == nums[row2][col2])
                           {
                               return false;
                           }
                       }
                   }
               }
           }
           return true;
       }

       public static void main(String[] args)
       {
           int[][] matrix = { {3, 2, 3}, {4, 3, 6}, {8, 9, 3}, {10, 3, 3}};
           System.out.println(noDups(matrix));
       }
   }   
   
   
Rotate and Reverse 
------------------------------

We can also rotate or reverse the order of the elements in a row or column. The following code rotates the elements in a row to the right by one position. This algorithm is very similar to the 1D array rotation algorithm since we are dealing with a single row or column.

.. activecode:: rotate2DArray

    :language: java
    :autograde: unittest
    :practice: T

    Create a method ``rotateRowRight`` that rotates the elements in a row to the right by one position. It should return the rotated array.
    ~~~~
    public class Rotate
    {
         public static int[][] rotateRowRight(int[][] nums, int row)
         {
              int last = nums[row][nums[0].length - 1];
              // Write a backwards loop through the row's columns 
              //  to copy elements at col-1 to col
              

              // Copy the last element to the first element at col 0
              

              return nums;
         }
    
         public static void main(String[] args)
         {
              int[][] matrix = { {3, 2, 3}, {4, 3, 6}, {8, 9, 3}, {10, 3, 3}};
              int[][] rotated = rotateRowRight(matrix, 1);
              for (int row = 0; row < rotated.length; row++)
              {
                for (int col = 0; col < rotated[0].length; col++)
                {
                     System.out.print(rotated[row][col] + " ");
                }
                System.out.println();
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
         public void testMain() throws IOException
         {
              String output = getMethodOutput("main");
              String expect = "3 2 3\n6 4 3\n8 9 3\n10 3 3\n";
              boolean passed = getResults(expect, output, "Expected output from main", true);
              assertTrue(passed);
         }
         @Test
            public void test2()
            {
                int[][] array = { {1, 4, 8}, {6, 7, 9}};
                int value = 0;
                Object[] args = {array, 0};
        
                String output = getMethodOutput("rotateRowRight", args);
                String expect = "8 1 4\n6 7 9\n";
        
                boolean passed =
                        getResults(expect, output, "Testing rotateRowRight({ {1, 4,8},{6, 7, 9} }, 1)");
                assertTrue(passed);
            }
    }

Review and FRQ Practice with 2D arrays
----------------------------------------------

|Time90|    

This lesson ends the 2D arrays section of this unit. 
You can now do the following review lessons and FRQs at the end of the unit
and College Board Progress Checks in the AP Classroom.

.. raw:: html

   <ul>
    <li><a href="a2dsummary.html" target="_blank">2D Arrays Summary</a></li>
    <li><a href="Array2dParsonsPractice.html" target="_blank">2D Arrays Parsons Practice</a></li>
    <li><a href="a2d-toggle-problems.html" target="_blank">2D Arrays Toggle Problems</a></li>
    <li><a href="Array2dCodePractice.html" target="_blank">2D Arrays Code Practice</a></li>
    <li><a href="Array2dMoreCodePractice.html" target="_blank">2D Arrays More Code Practice</a></li>
    <li><a href="a2d-Exercises.html" target="_blank">2D Arrays Exercises</a></li>
    </ul>
  

We encourage you to work in pairs or groups to tackle the following challenging FRQ problems and take them one step at a time.  These will get easier with practice!

.. raw:: html

   <ul>
    <li><a href="grayImageA.html" target="_blank">Gray Image A FRQ</a></li>
    <li><a href="grayImageB.html" target="_blank">Gray Image B FRQ</a></li>
    <li><a href="routeCipherA.html" target="_blank">Route Cipher A FRQ</a></li>
    <li><a href="routeCipherB.html" target="_blank">Route Cipher B FRQ</a></li>
    </ul>

We also encourage you to finish the very fun Picture Lab lessons at the end of the unit in `PictureLab <pictureLab.html>`_.


