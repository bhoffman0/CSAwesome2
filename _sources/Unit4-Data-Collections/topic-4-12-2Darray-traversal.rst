.. include:: ../common.rst

.. qnum::
   :prefix: 8-2-
   :start: 1

|Time45|

Nested Loops for 2D Arrays 
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




Enhanced For-Each Loop for 2D Arrays 
----------------------------------------------------

.. index::
   pair: 2D Array; for-each loop

Since 2D arrays are really arrays of arrays you can also use a nested enhanced for-each loop to loop through all elements in an array.  We loop through each of the inner arrays and loop through all the values in each inner array. Notice the type of the outer loop array variable -- it is an array that will hold each row, String[] in the example below for a 2D String array. The type of the variables in the for-each loops must match the type of the array. For-each loops are much simpler since you don't have to use the indices and the []'s, but you can only use them if you are not going to change the values in an array of primitive types since the variable val below will not change the original array.

.. code-block:: java

      String[][] array;
      // Nested For-each loops that traverse a 2D String array
      for (String[] innerArray : array)
      {
         for (String val : innerArray)
         {
             System.out.println(val);
         }
      }


.. activecode:: getAvgForEach
   :language: java
   :autograde: unittest

   Nested for-each loops demo. Click on the CodeLens button to trace through the code.
   ~~~~
   public class Average
   {

       public static double getAvg(int[][] a)
       {
           double total = 0;
           for (int[] innerArray : a)
           {
               for (int val : innerArray)
               {
                   total = total + val;
               }
           }
           return total / (a.length * a[0].length);
       }

       public static void main(String[] args)
       {
           int[][] theArray = { {80, 90, 70}, {20, 80, 75}};
           System.out.println(getAvg(theArray));
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
           String expect = "69.16666666666667";
           boolean passed = getResults(expect, output, "Expected output from main", true);
           assertTrue(passed);
       }
   }

In this case the ``for (int[] colArray : a)`` means to loop through each element of the outer array which will set ``colArray`` to the current column array.  Then you can loop through the value in the column array.





2D Array Algorithms
-------------------

All of the array algorithms can be applied to 2D arrays too. For example, counting and searching algorithms work very similarly. The following code adds all of the values in a given row.

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

.. index::
   pair: 2D Array; loop range

You can loop through just part of a 2D array. You can change the starting value and ending value to loop through a subset of a 2D array.

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

Here is a linear search algorithm where we access each row and then apply a linear search on it to find an element.

|CodingEx| **Coding Exercise**



.. activecode:: linearSearch2DArrays
   :language: java
   :autograde: unittest

   What will the following code print? Can you change the code to work for a String 2D array instead of an int array? Note that the indices row and col will still be ints.
   ~~~~
   public class Search
   {
       public static boolean search(int[][] array, int value)
       {
           boolean found = false;
           for (int row = 0; row < array.length; row++)
           {
               for (int col = 0; col < array[0].length; col++)
               {
                   if (array[row][col] == value)
                   {
                        found = true;
                   }
               }
           }
           return found;
       }

       public static void main(String[] args)
       {
           int[][] matrix = { {3, 2, 3}, {4, 3, 6}, {8, 9, 3}, {10, 3, 3}};
           System.out.println(search(matrix, 10));
           System.out.println(search(matrix, 11));

           // Comment out the code above, and try these:
           // String[][] matrix2 = { {"a","b","c"},{"d","e","f"} };
           // System.out.println(search(matrix2, "b"));

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
           super("Search");
       }

       @Test
       public void test2()
       {
           String[][] array = { {"a", "b", "c"}, {"d", "e", "f"}, {"g", "h", "i"}, {"j", "k", "l"}};
           String value = "b";
           Object[] args = {array, value};

           String output = getMethodOutput("search", args);
           String expect = "true";

           boolean passed =
                   getResults(
                           expect,
                           output,
                           "Testing search({"
                               + " {\"a\",\"b\",\"c\"},{\"d\",\"e\",\"f\"},{\"g\",\"h\",\"i\"},{\"j\",\"k\",\"l\""
                               + " } }, \"b\")");
           assertTrue(passed);
       }
   }

2D Array of Objects
--------------------

.. index::
   single: images

.. index::
   single: pictures

.. index::
   single: pixels

.. |CB Picture Lab| raw:: html

   <a href= "https://secure-media.collegeboard.org/digitalServices/pdf/ap/picture-lab-studentguide.pdf" style="text-decoration:underline" target="_blank" >College Board Picture Lab</a>

.. |RGB Color Mixer| raw:: html

   <a href= "https://www.rapidtables.com/web/color/RGB_Color.html" style="text-decoration:underline" target="_blank">RGB Color Mixer</a>

.. |replit project| raw:: html

   <a href= "https://replit.com/@BerylHoffman/Picture-Lab" style="text-decoration:underline" target="_blank" >Replit Swing project</a>

.. |repl 2| raw:: html

   <a href= "https://firewalledreplit.com/@BerylHoffman/PictureLab-with-output-file" style="text-decoration:underline" target="_blank" >alternative Replit project</a>

.. |Picture Lab A1 to A3| raw:: html

   <a href= "pictureLabA1toA3.html" style="text-decoration:underline" target="_blank">Picture Lab sections A1 to A3</a>

.. |Picture Lab A5| raw:: html

   <a href= "pictureLabA5.html#image-modification-exercises" style="text-decoration:underline" target="_blank">Picture Lab A5 Image Modification Exercises</a>


Photographs and images are made up of a 2D array of **pixels** which are tiny picture elements that color in the image.  For example, a pixel is shown at row 173 and column 214 of the image below.

.. image:: Figures/pixel.jpg
   :width: 300px
   :align: center


The color of a pixel is represented using the RGB (Red, Green, Blue) color
model, which stores values for red, green, and blue, each ranging from 0 to 255. You can make any color by mixing these values! Try the |RGB Color Mixer| to experiment. Can you make black? Can you make white? Can you make purple? You can learn more about pixels in the |Picture Lab A1 to A3|.

In Java, we can write a ``Pixel`` class to represent a pixel in an image at a given x and y coordinate. 

.. code-block:: java

   public class Pixel
   {
       private int x;
       private int y;
       /** Implementation not shown * */
   }

The |CB Picture Lab| contains a ``Pixel`` class and a ``Picture`` class that loads an image and creates a 2D array of pixels to represent it. For example, the ``Picture`` constructor below loads the image ``beach.jpg``, and the ``getPixels2D`` method returns its 2D array of pixels. You can get and set the red, green, and/or blue value for a Pixel object to change its color.  

.. code-block:: java

      Picture pict = new Picture("beach.jpg");
      // A 2D array of pixels
      Pixel[][] pixels = pict.getPixels2D();
      Pixel p = pixels[0][0]; // get the first pixel
      int blue = p.getBlue(); // get its blue value
      System.out.println("Pixel (0,0) has a blue value of " + blue );
      p.setBlue(255);  // set its blue value to 255


You can loop through all the Pixel objects in the two-dimensional array to modify the picture. The following code is the ``zeroBlue`` method in the ``Picture`` class. It uses nested loops to visit each pixel in a photo which has a color with red, green, and blue values, and it sets all the blue values to 0. You can experiment with this method and write your own methods to modify the pixels in the challenge below and the extended |Picture Lab A5|.

.. code-block:: java

   public void zeroBlue()
   {
       Pixel[][] pixels = this.getPixels2D();
       for (Pixel[] rowArray : pixels)
       {
           for (Pixel p : rowArray)
           {
               p.setBlue(0);
           }
       }
    }


|Groupwork| Programming Challenge : Picture Lab
---------------------------------------------------

.. figure:: ../../_static/arch.jpg
    :width: 200px
    :align: left

In this challenge, you will do a part of the Picture Lab to modify the pixels of a digital photo. Scroll down to the bottom of the following code and take a look at the ``zeroBlue`` method. Run the code and watch what it does. It uses nested loops to visit each pixel in a photo which has a color with red, green, and blue values, and it sets all the blue values to 0.

Now, write a similar method called ``keepOnlyBlue`` that visits every pixel and sets the red and green values to zero but does not change the blue ones. Then, write a method called ``switchColors`` that swaps the red pixels with green pixels or blue pixels to change the colors around. You will need to use the ``getRed``, ``getGreen``, ``getBlue`` to get the RGB values of the pixel and then swap them around by using the ``setRed``, ``setGreen``, ``setBlue`` methods and giving them different color values from the get methods as arguments.

You can test the methods in the active code below or in this |replit project| or this |repl 2| by teacher Jason Stark from LA (click output.jpg to see the result) or your own IDE to see what it does.

.. activecode:: challenge-8-2-picture
    :language: java
    :autograde: unittest
    :datafile: pictureClasses.jar, arch.jpg

    Picture Lab: 1) write a method called keepOnlyBlue() that keeps only the blue values by setting the red and green values to zero. Uncomment the code in main to test it. 2) write a method called switchColors() that replaces red values (using p.setRed) with green or blue values (using p.getGreen(), etc.) to change the colors around. Uncomment the code in main to test it.
    ~~~~
    import java.awt.*;
    import java.awt.font.*;
    import java.awt.geom.*;
    import java.awt.image.BufferedImage;
    import java.text.*;
    import java.util.*;

    /**
     * A class that represents a picture. This class inherits from SimplePicture and
     * allows the student to add functionality to the Picture class.
     *
     * @author Barbara Ericson ericson@cc.gatech.edu
     */
    public class Picture extends SimplePicture
    {
        ///////////////////// constructors //////////////////////////////////

        /** Constructor that takes no arguments */
        public Picture()
        {
            /* not needed but use it to show students the implicit call to super()
             * child constructors always call a parent constructor
             */
            super();
        }

        /**
         * Constructor that takes a file name and creates the picture
         *
         * @param fileName the name of the file to create the picture from
         */
        public Picture(String fileName)
        {
            // let the parent class handle this fileName
            super(fileName);
        }

        /**
         * Constructor that takes the height and width
         *
         * @param height the height of the desired picture
         * @param width the width of the desired picture
         */
        public Picture(int height, int width)
        {
            // let the parent class handle this width and height
            super(width, height);
        }

        /**
         * Constructor that takes a picture and creates a copy of that picture
         *
         * @param copyPicture the picture to copy
         */
        public Picture(Picture copyPicture)
        {
            // let the parent class do the copy
            super(copyPicture);
        }

        /**
         * Constructor that takes a buffered image
         *
         * @param image the buffered image to use
         */
        public Picture(BufferedImage image)
        {
            super(image);
        }

        ////////////////////// methods ///////////////////////////////////////

        /**
         * Method to return a string with information about this picture.
         *
         * @return a string with information about the picture such as fileName, height
         *     and width.
         */
        public String toString()
        {
            String output =
                    "Picture, filename "
                            + getFileName()
                            + " height "
                            + getHeight()
                            + " width "
                            + getWidth();
            return output;
        }

        /** zeroBlue() method sets the blue values at all pixels to zero */
        public void zeroBlue()
        {
            Pixel[][] pixels = this.getPixels2D();

            for (Pixel[] rowArray : pixels)
            {
                for (Pixel p : rowArray)
                {
                    p.setBlue(0);
                }
            }
        }

        /* Add new methods here.
           keepOnlyBlue() method sets the red and green values at all pixels to zero.
           switchColors() method switches colors, for example the red values with green values, etc.
        */

        /* Main method for testing
         */
        public static void main(String[] args)
        {
            Picture arch = new Picture("arch.jpg");
            arch.show();
            arch.zeroBlue();
            arch.show();

            // Uncomment the follow code to test your keepOnlyBlue method.
            /*
            Picture arch2 = new Picture("arch.jpg");
            System.out.println("Keep only blue: ");
            arch2.keepOnlyBlue();// using new method
            arch2.show();
            */
            System.out.println();

            // Uncomment the follow code to test your swithColors method.
            /*
            Picture arch3 = new Picture("arch.jpg");
            System.out.println("Switch colors: ");
            arch3.switchColors();// using new method
            arch3.show();
            */
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
            String target = "public void keepOnlyBlue()";
            boolean passed = checkCodeContains("keepOnlyBlue() method", target);
            assertTrue(passed);
        }

        @Test
        public void test2()
        {
            String target = ".setGreen(0);";
            boolean passed =
                    checkCodeContains("keepOnlyBlue() setting green pixels to the number 0", target);
            assertTrue(passed);
        }

        @Test
        public void test3()
        {
            String target = "for";
            String code = getCode();
            int index = code.indexOf("public void keepOnlyBlue()");
            boolean passed = false;
            if (index > 0)
            {
                code = code.substring(index, index + 200);
                int num = countOccurences(code, target);
                passed = num == 2;
            }
            getResults(
                    "true", "" + passed, "Checking that keepOnlyBlue() contains 2 for loops", passed);
            assertTrue(passed);
        }

        @Test
        public void testSwitch1()
        {
            String target = "public void switchColors()";
            boolean passed = checkCodeContains("switchColors() method", target);
            assertTrue(passed);
        }

        @Test
        public void testSwitch2()
        {
            String target = ".getGreen()";
            boolean passed = checkCodeContains("switchColors() uses getGreen()", target);
            assertTrue(passed);
        }
    }

Here are some more exercises from the |Picture Lab A5|:

- Write a negate method to negate all the pixels in a picture. To negate a picture, set the red value to 255 minus the current red value, the green value to 255 minus the current green value and the blue value to 255 minus the current blue value.

- Write the gray scale method to turn the picture into shades of gray. Set the red, green, and blue values to the average of the current red, green, and blue values (add all three values and divide by 3).


You can continue on with the next pages of |Picture Lab A5| to mirror images and create collages and detect edges as the first step in recognizing objects in images.

Summary
----------

- We can loop through 2D arrays using nested for loops or nested enhanced for each loops.

- The outer loop for a 2D array usually traverses the rows, while the inner loop traverses the columns in a single row.

- The 2D array's length gives the number of rows. A row's length array[0].length gives the number of columns.

- Nested iteration statements can be written to traverse the 2D array in "row-major order" or "column-major order."

- In an enhanced for each loop, the variable of the outer loop must be the type of each row, which is a 1D array. The inner enhanced for loop variable must be the same type as the elements stored in the array.

- All standard 1D array algorithms can be applied to 2D array objects.

- When applying sequential/linear search algorithms to 2D arrays, each row must be accessed then sequential/linear search applied to each row of a 2D array.


AP Practice
------------

.. mchoice:: AP8-2-2
   :practice: T
   :answer_a: 36
   :answer_b: 54
   :answer_c: 63
   :answer_d: 68
   :answer_e: 78
   :correct: b
   :feedback_a: Trace through the code.
   :feedback_b: Correct!
   :feedback_c: Trace through the code.
   :feedback_d: Trace through the code.
   :feedback_e: Notice that the inner loop goes up to but not including x.length - 1.

   Consider the following code segment. What is the value of sum as a result of executing the code segment?

   .. code-block:: java

      int[][] arr = { {1, 2, 3, 4},
                      {5, 6, 7, 8},
                      {9, 10, 11, 12} };
      int sum = 0;
      for (int[] x : arr)
      {
          for (int y = 0; y < x.length - 1; y++)
          {
               sum += x[y];
          }
      }


.. datafile:: arch.jpg
   :image:
   :fromfile: ../../_static/arch.jpg
   :hide:

.. datafile:: pictureClasses.jar
        :hide:

        import java.awt.Image;
        import java.awt.image.BufferedImage;

        /**
         * Interface to describe a digital picture.  A digital picture can have an
         * associated file name.  It can have a title.  It has pixels
         * associated with it and you can get and set the pixels.  You
         * can get an Image from a picture or a BufferedImage.  You can load
         * it from a file name or image.  You can show a picture.  You can
         * explore a picture.  You can create a new image for it.
         *
         * @author Barb Ericson ericson@cc.gatech.edu
         */
        public interface DigitalPicture
        {
          public String getFileName(); // get the file name that the picture came from
          public String getTitle(); // get the title of the picture
          public void setTitle(String title); // set the title of the picture
          public int getWidth(); // get the width of the picture in pixels
          public int getHeight(); // get the height of the picture in pixels
          public Image getImage(); // get the image from the picture
          public BufferedImage getBufferedImage(); // get the buffered image
          public int getBasicPixel(int x, int y); // get the pixel information as an int
          public void setBasicPixel(int x, int y, int rgb); // set the pixel information
          public Pixel getPixel(int x, int y); // get the pixel information as an object
          public Pixel[] getPixels(); // get all pixels in row-major order
          public Pixel[][] getPixels2D(); // get 2-D array of pixels in row-major order
          public void load(Image image); // load the image into the picture
          public boolean load(String fileName); // load the picture from a file
          public void show(); // show the picture
          public boolean write(String fileName); // write out a file
        }

        import java.awt.Color;

        /**
         * Class that references a pixel in a picture. Pixel
         * stands for picture element where picture is
         * abbreviated pix.  A pixel has a column (x) and
         * row (y) location in a picture.  A pixel knows how
         * to get and set the red, green, blue, and alpha
         * values in the picture.  A pixel also knows how to get
         * and set the color using a Color object.
         *
         * @author Barb Ericson ericson@cc.gatech.edu
         */
        public class Pixel
        {

          ////////////////////////// fields ///////////////////////////////////

          /** the digital picture this pixel belongs to */
          private DigitalPicture picture;

          /** the x (column) location of this pixel in the picture; (0,0) is top left */
          private int x;

          /** the y (row) location of this pixel in the picture; (0,0) is top left */
          private int y;

          ////////////////////// constructors /////////////////////////////////

          /**
           * A constructor that takes the x and y location for the pixel and
           * the picture the pixel is coming from
           * @param picture the picture that the pixel is in
           * @param x the x location of the pixel in the picture
           * @param y the y location of the pixel in the picture
           */
          public Pixel(DigitalPicture picture, int x, int y)
          {
            // set the picture
            this.picture = picture;

            // set the x location
            this.x = x;

            // set the y location
            this.y = y;

          }

          ///////////////////////// methods //////////////////////////////

          /**
           * Method to get the x location of this pixel.
           * @return the x location of the pixel in the picture
           */
          public int getX() { return x; }

          /**
           * Method to get the y location of this pixel.
           * @return the y location of the pixel in the picture
           */
          public int getY() { return y; }

          /**
           * Method to get the row (y value)
           * @return the row (y value) of the pixel in the picture
           */
          public int getRow() { return y; }

          /**
           * Method to get the column (x value)
           * @return the column (x value) of the pixel
           */
          public int getCol() { return x; }

          /**
           * Method to get the amount of alpha (transparency) at this pixel.
           * It will be from 0-255.
           * @return the amount of alpha (transparency)
           */
          public int getAlpha() {

            /* get the value at the location from the picture as a 32 bit int
             * with alpha, red, green, blue each taking 8 bits from left to right
             */
            int value = picture.getBasicPixel(x,y);

            // get the alpha value (starts at 25 so shift right 24)
            // then and it with all 1's for the first 8 bits to keep
            // end up with from 0 to 255
            int alpha = (value >> 24) & 0xff;

            return alpha;
          }

          /**
           * Method to get the amount of red at this pixel.  It will be
           * from 0-255 with 0 being no red and 255 being as much red as
           * you can have.
           * @return the amount of red from 0 for none to 255 for max
           */
          public int getRed() {

            /* get the value at the location from the picture as a 32 bit int
             * with alpha, red, green, blue each taking 8 bits from left to right
             */
            int value = picture.getBasicPixel(x,y);

            // get the red value (starts at 17 so shift right 16)
            // then AND it with all 1's for the first 8 bits to
            // end up with a resulting value from 0 to 255
            int red = (value >> 16) & 0xff;

            return red;
          }

          /**
           * Method to get the red value from a pixel represented as an int
           * @param value the color value as an int
           * @return the amount of red
           */
          public static int getRed(int value)
          {
            int red = (value >> 16) & 0xff;
            return red;
          }

          /**
           * Method to get the amount of green at this pixel.  It will be
           * from 0-255 with 0 being no green and 255 being as much green as
           * you can have.
           * @return the amount of green from 0 for none to 255 for max
           */
          public int getGreen() {

            /* get the value at the location from the picture as a 32 bit int
             * with alpha, red, green, blue each taking 8 bits from left to right
             */
            int value = picture.getBasicPixel(x,y);

            // get the green value (starts at 9 so shift right 8)
            int green = (value >>  8) & 0xff;

            return green;
          }

          /**
           * Method to get the green value from a pixel represented as an int
           * @param value the color value as an int
           * @return the amount of green
           */
          public static int getGreen(int value)
          {
            int green = (value >> 8) & 0xff;
            return green;
          }

          /**
           * Method to get the amount of blue at this pixel.  It will be
           * from 0-255 with 0 being no blue and 255 being as much blue as
           * you can have.
           * @return the amount of blue from 0 for none to 255 for max
           */
          public int getBlue() {

            /* get the value at the location from the picture as a 32 bit int
             * with alpha, red, green, blue each taking 8 bits from left to right
             */
            int value = picture.getBasicPixel(x,y);

            // get the blue value (starts at 0 so no shift required)
            int blue = value & 0xff;

            return blue;
          }

          /**
           * Method to get the blue value from a pixel represented as an int
           * @param value the color value as an int
           * @return the amount of blue
           */
          public static int getBlue(int value)
          {
            int blue = value & 0xff;
            return blue;
          }

          /**
           * Method to get a color object that represents the color at this pixel.
           * @return a color object that represents the pixel color
           */
          public Color getColor()
          {
             /* get the value at the location from the picture as a 32 bit int
             * with alpha, red, green, blue each taking 8 bits from left to right
             */
            int value = picture.getBasicPixel(x,y);

            // get the red value (starts at 17 so shift right 16)
            // then AND it with all 1's for the first 8 bits to
            // end up with a resulting value from 0 to 255
            int red = (value >> 16) & 0xff;

            // get the green value (starts at 9 so shift right 8)
            int green = (value >>  8) & 0xff;

            // get the blue value (starts at 0 so no shift required)
            int blue = value & 0xff;

            return new Color(red,green,blue);
          }

          /**
           * Method to set the pixel color to the passed in color object.
           * @param newColor the new color to use
           */
          public void setColor(Color newColor)
          {
            // set the red, green, and blue values
            int red = newColor.getRed();
            int green = newColor.getGreen();
            int blue = newColor.getBlue();

            // update the associated picture
            updatePicture(this.getAlpha(),red,green,blue);
          }

          /**
           * Method to update the picture based on the passed color
           * values for this pixel
           * @param alpha the alpha (transparency) at this pixel
           * @param red the red value for the color at this pixel
           * @param green the green value for the color at this pixel
           * @param blue the blue value for the color at this pixel
           */
          public void updatePicture(int alpha, int red, int green, int blue)
          {
            // create a 32 bit int with alpha, red, green blue from left to right
            int value = (alpha << 24) + (red << 16) + (green << 8) + blue;

            // update the picture with the int value
            picture.setBasicPixel(x,y,value);
          }

          /**
           * Method to correct a color value to be within 0 to 255
           * @param the value to use
           * @return a value within 0 to 255
           */
          private static int correctValue(int value)
          {
            if (value < 0)
              value = 0;
            if (value > 255)
              value = 255;
            return value;
          }

          /**
           * Method to set the red to a new red value
           * @param value the new value to use
           */
          public void setRed(int value)
          {
            // set the red value to the corrected value
            int red = correctValue(value);

            // update the pixel value in the picture
            updatePicture(getAlpha(), red, getGreen(), getBlue());
          }

          /**
           * Method to set the green to a new green value
           * @param value the value to use
           */
          public void setGreen(int value)
          {
            // set the green value to the corrected value
            int green = correctValue(value);

            // update the pixel value in the picture
            updatePicture(getAlpha(), getRed(), green, getBlue());
          }

          /**
           * Method to set the blue to a new blue value
           * @param value the new value to use
           */
          public void setBlue(int value)
          {
            // set the blue value to the corrected value
            int blue = correctValue(value);

            // update the pixel value in the picture
            updatePicture(getAlpha(), getRed(), getGreen(), blue);
          }

           /**
           * Method to set the alpha (transparency) to a new alpha value
           * @param value the new value to use
           */
          public void setAlpha(int value)
          {
            // make sure that the alpha is from 0 to 255
            int alpha = correctValue(value);

            // update the associated picture
            updatePicture(alpha, getRed(), getGreen(), getBlue());
          }

          /**
          * Method to get the distance between this pixel's color and the passed color
          * @param testColor the color to compare to
          * @return the distance between this pixel's color and the passed color
          */
         public double colorDistance(Color testColor)
         {
           double redDistance = this.getRed() - testColor.getRed();
           double greenDistance = this.getGreen() - testColor.getGreen();
           double blueDistance = this.getBlue() - testColor.getBlue();
           double distance = Math.sqrt(redDistance * redDistance +
                                       greenDistance * greenDistance +
                                       blueDistance * blueDistance);
           return distance;
         }

         /**
          * Method to compute the color distances between two color objects
          * @param color1 a color object
          * @param color2 a color object
          * @return the distance between the two colors
          */
         public static double colorDistance(Color color1,Color color2)
         {
           double redDistance = color1.getRed() - color2.getRed();
           double greenDistance = color1.getGreen() - color2.getGreen();
           double blueDistance = color1.getBlue() - color2.getBlue();
           double distance = Math.sqrt(redDistance * redDistance +
                                       greenDistance * greenDistance +
                                       blueDistance * blueDistance);
           return distance;
         }

         /**
          * Method to get the average of the colors of this pixel
          * @return the average of the red, green, and blue values
          */
         public double getAverage()
         {
           double average = (getRed() + getGreen() + getBlue()) / 3.0;
           return average;
         }

          /**
           * Method to return a string with information about this pixel
           * @return a string with information about this pixel
           */
          public String toString()
          {
            return "Pixel row=" + getRow() +
              " col=" + getCol() +
              " red=" + getRed() +
              " green=" + getGreen() +
              " blue=" + getBlue();
          }

        }

        import javax.imageio.ImageIO;
        import java.awt.image.BufferedImage;
        import javax.swing.ImageIcon;
        import java.awt.*;
        import java.io.*;
        import java.awt.geom.*;

        import java.io.ByteArrayOutputStream;
        //import javax.xml.bind.DatatypeConverter;
        import java.util.Base64;

        import java.util.Scanner;

        /**
         * A class that represents a simple picture.  A simple picture may have
         * an associated file name and a title.  A simple picture has pixels,
         * width, and height.  A simple picture uses a BufferedImage to
         * hold the pixels. You can also explore a simple picture.
         *
         * @author Barb Ericson ericson@cc.gatech.edu
         */
        public class SimplePicture implements DigitalPicture
        {

          /////////////////////// Fields /////////////////////////

          /**
           * the file name associated with the simple picture
           */
          private String fileName;

          /**
           * the path name for the file
           */
          private String pathName;

          /**
           * the title of the simple picture
           */
          private String title;

          /**
           * buffered image to hold pixels for the simple picture
           */
          private BufferedImage bufferedImage;

          /**
           * extension for this file (jpg or bmp)
           */
          private String extension;


         /////////////////////// Constructors /////////////////////////

         /**
          * A Constructor that takes no arguments.  It creates a picture with
          * a width of 200 and a height of 100 that is all white.
          * A no-argument constructor must be given in order for a class to
          * be able to be subclassed.  By default all subclasses will implicitly
          * call this in their parent's no-argument constructor unless a
          * different call to super() is explicitly made as the first line
          * of code in a constructor.
          */
         public SimplePicture()
         {this(200,100);}

         /**
          * A Constructor that takes a file name and uses the file to create
          * a picture
          * @param fileName the file name to use in creating the picture
          */
         public SimplePicture(String fileName)
         {

           // load the picture into the buffered image
           load(fileName);

         }

         /**
          * A constructor that takes the width and height desired for a picture and
          * creates a buffered image of that size.  This constructor doesn't
          * show the picture.  The pixels will all be white.
          * @param width the desired width
          * @param height the desired height
          */
         public  SimplePicture(int width, int height)
         {
           bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
           title = "None";
           fileName = "None";
           extension = "jpg";
           setAllPixelsToAColor(Color.white);
         }

         /**
          * A constructor that takes the width and height desired for a picture and
          * creates a buffered image of that size.  It also takes the
          * color to use for the background of the picture.
          * @param width the desired width
          * @param height the desired height
          * @param theColor the background color for the picture
          */
         public  SimplePicture(int width, int height, Color theColor)
         {
           this(width,height);
           setAllPixelsToAColor(theColor);
         }

         /**
          * A Constructor that takes a picture to copy information from
          * @param copyPicture the picture to copy from
          */
         public SimplePicture(SimplePicture copyPicture)
         {
           if (copyPicture.fileName != null)
           {
              this.fileName = new String(copyPicture.fileName);
              this.extension = copyPicture.extension;
           }
           if (copyPicture.title != null)
              this.title = new String(copyPicture.title);
           if (copyPicture.bufferedImage != null)
           {
             this.bufferedImage = new BufferedImage(copyPicture.getWidth(),  copyPicture.getHeight(), BufferedImage.TYPE_INT_RGB);
             this.copyPicture(copyPicture);
           }
         }

         /**
          * A constructor that takes a buffered image
          * @param image the buffered image
          */
         public SimplePicture(BufferedImage image)
         {
           this.bufferedImage = image;
           title = "None";
           fileName = "None";
           extension = "jpg";
         }

         ////////////////////////// Methods //////////////////////////////////

         /**
          * Method to get the extension for this picture
          * @return the extension (jpg, bmp, giff, etc)
          */
         public String getExtension() { return extension; }

         /**
          * Method that will copy all of the passed source picture into
          * the current picture object
          * @param sourcePicture  the picture object to copy
          */
         public void copyPicture(SimplePicture sourcePicture)
         {
           Pixel sourcePixel = null;
           Pixel targetPixel = null;

           // loop through the columns
           for (int sourceX = 0, targetX = 0;
                sourceX < sourcePicture.getWidth() &&
                targetX < this.getWidth();
                sourceX++, targetX++)
           {
             // loop through the rows
             for (int sourceY = 0, targetY = 0;
                  sourceY < sourcePicture.getHeight() &&
                  targetY < this.getHeight();
                  sourceY++, targetY++)
             {
               sourcePixel = sourcePicture.getPixel(sourceX,sourceY);
               targetPixel = this.getPixel(targetX,targetY);
               targetPixel.setColor(sourcePixel.getColor());
             }
           }

         }

         /**
          * Method to set the color in the picture to the passed color
          * @param color the color to set to
          */
         public void setAllPixelsToAColor(Color color)
         {
           // loop through all x
           for (int x = 0; x < this.getWidth(); x++)
           {
             // loop through all y
             for (int y = 0; y < this.getHeight(); y++)
             {
               getPixel(x,y).setColor(color);
             }
           }
         }

         /**
          * Method to get the buffered image
          * @return the buffered image
          */
         public BufferedImage getBufferedImage()
         {
            return bufferedImage;
         }

         /**
          * Method to get a graphics object for this picture to use to draw on
          * @return a graphics object to use for drawing
          */
         public Graphics getGraphics()
         {
           return bufferedImage.getGraphics();
         }

         /**
          * Method to get a Graphics2D object for this picture which can
          * be used to do 2D drawing on the picture
          */
         public Graphics2D createGraphics()
         {
           return bufferedImage.createGraphics();
         }

         /**
          * Method to get the file name associated with the picture
          * @return  the file name associated with the picture
          */
         public String getFileName() { return fileName; }

         /**
          * Method to set the file name
          * @param name the full pathname of the file
          */
         public void setFileName(String name)
         {
           fileName = name;
         }

         /**
          * Method to get the title of the picture
          * @return the title of the picture
          */
         public String getTitle()
         { return title; }

         /**
          * Method to set the title for the picture
          * @param title the title to use for the picture
          */
         public void setTitle(String title)
         {
           this.title = title;
         }

         /**
          * Method to get the width of the picture in pixels
          * @return the width of the picture in pixels
          */
         public int getWidth() { return bufferedImage.getWidth(); }

         /**
          * Method to get the height of the picture in pixels
          * @return  the height of the picture in pixels
          */
         public int getHeight() { return bufferedImage.getHeight(); }

         /**
          * Method to get an image from the picture
          * @return  the buffered image since it is an image
          */
         public Image getImage()
         {
           return bufferedImage;
         }

         /**
          * Method to return the pixel value as an int for the given x and y location
          * @param x the x coordinate of the pixel
          * @param y the y coordinate of the pixel
          * @return the pixel value as an integer (alpha, red, green, blue)
          */
         public int getBasicPixel(int x, int y)
         {
            return bufferedImage.getRGB(x,y);
         }

         /**
          * Method to set the value of a pixel in the picture from an int
          * @param x the x coordinate of the pixel
          * @param y the y coordinate of the pixel
          * @param rgb the new rgb value of the pixel (alpha, red, green, blue)
          */
         public void setBasicPixel(int x, int y, int rgb)
         {
           bufferedImage.setRGB(x,y,rgb);
         }

         /**
          * Method to get a pixel object for the given x and y location
          * @param x  the x location of the pixel in the picture
          * @param y  the y location of the pixel in the picture
          * @return a Pixel object for this location
          */
         public Pixel getPixel(int x, int y)
         {
           // create the pixel object for this picture and the given x and y location
           Pixel pixel = new Pixel(this,x,y);
           return pixel;
         }

         /**
          * Method to get a one-dimensional array of Pixels for this simple picture
          * @return a one-dimensional array of Pixel objects starting with y=0
          * to y=height-1 and x=0 to x=width-1.
          */
         public Pixel[] getPixels()
         {
           int width = getWidth();
           int height = getHeight();
           Pixel[] pixelArray = new Pixel[width * height];

           // loop through height rows from top to bottom
           for (int row = 0; row < height; row++)
             for (int col = 0; col < width; col++)
               pixelArray[row * width + col] = new Pixel(this,col,row);

           return pixelArray;
         }

         /**
          * Method to get a two-dimensional array of Pixels for this simple picture
          * @return a two-dimensional array of Pixel objects in row-major order.
          */
         public Pixel[][] getPixels2D()
         {
           int width = getWidth();
           int height = getHeight();
           Pixel[][] pixelArray = new Pixel[height][width];

           // loop through height rows from top to bottom
           for (int row = 0; row < height; row++)
             for (int col = 0; col < width; col++)
               pixelArray[row][col] = new Pixel(this,col,row);

           return pixelArray;
         }

         /**
          * Method to load the buffered image with the passed image
          * @param image  the image to use
          */
         public void load(Image image)
         {
           // get a graphics context to use to draw on the buffered image
           Graphics2D graphics2d = bufferedImage.createGraphics();

           // draw the image on the buffered image starting at 0,0
           graphics2d.drawImage(image,0,0,null);

           // show the new image
           show();
         }

         /**
          * Method to show the picture in a picture frame
          */
         public void show()
         {
             try {
                 ByteArrayOutputStream output = new ByteArrayOutputStream();
                 ImageIO.write(this.bufferedImage, "png", output);
                 String result = Base64.getEncoder().encodeToString(output.toByteArray());
                 //BH: using Base64 instead of DatatypeConverter.printBase64Binary(output.toByteArray());
                 System.out.println("&lt;img src=\'data:image/" + this.extension + ";base64," + result + "\'/>");
             } catch (IOException e) {
                 System.out.println("Errors occured in image conversion");
             }
         }

         /**
          * Method to open a picture explorer on a copy (in memory) of this
          * simple picture
          */
         /*
         public void explore()
         {
           // create a copy of the current picture and explore it
           new PictureExplorer(new SimplePicture(this));
         }
         */

         /**
          * Method to load the picture from the passed file name
          * @param fileName the file name to use to load the picture from
          * @throws IOException if the picture isn't found
          */
         public void loadOrFail(String fileName) throws IOException
         {
            // set the current picture's file name
           this.fileName = fileName;

           // set the extension
           int posDot = fileName.lastIndexOf('.');
           if (posDot >= 0)
             this.extension = fileName.substring(posDot + 1);

            // get file location
            String[] paths = fileName.split("/");
            this.pathName = "";
            if(paths.length != 1) {
                for(int i = 0; i < paths.length - 1; i++) {
                    this.pathName = this.pathName + paths[i] + "/";
                }
            }
           // if the current title is null use the file name
           if (title == null)
             title = fileName;

           File file = new File(this.fileName);


           if (!file.canRead())
           {
             throw new IOException(this.fileName +
                                 " could not be opened. Check that you specified the path");
           }
           this.bufferedImage = ImageIO.read(file);


         }

         /**
          * Method to read the contents of the picture from a filename
          * without throwing errors
          * @param fileName the name of the file to write the picture to
          * @return true if success else false
          */
         public boolean load(String fileName)
         {
             try {
                 this.loadOrFail(fileName);
                 return true;

             } catch (Exception ex) {
                 System.out.println("There was an error trying to open " + fileName);
                 bufferedImage = new BufferedImage(600,200,
                                                   BufferedImage.TYPE_INT_RGB);
                 addMessage("Couldn't load " + fileName,5,100);
                 return false;
             }

         }

         /**
          * Method to load the picture from the passed file name
          * this just calls load(fileName) and is for name compatibility
          * @param fileName the file name to use to load the picture from
          * @return true if success else false
          */
         public boolean loadImage(String fileName)
         {
             return load(fileName);
         }

         /**
          * Method to draw a message as a string on the buffered image
          * @param message the message to draw on the buffered image
          * @param xPos  the x coordinate of the leftmost point of the string
          * @param yPos  the y coordinate of the bottom of the string
          */
         public void addMessage(String message, int xPos, int yPos)
         {
           // get a graphics context to use to draw on the buffered image
           Graphics2D graphics2d = bufferedImage.createGraphics();

           // set the color to white
           graphics2d.setPaint(Color.white);

           // set the font to Helvetica bold style and size 16
           graphics2d.setFont(new Font("Helvetica",Font.BOLD,16));

           // draw the message
           graphics2d.drawString(message,xPos,yPos);

         }

         /**
          * Method to draw a string at the given location on the picture
          * @param text the text to draw
          * @param xPos the left x for the text
          * @param yPos the top y for the text
          */
         public void drawString(String text, int xPos, int yPos)
         {
           addMessage(text,xPos,yPos);
         }

         /**
           * Method to create a new picture by scaling the current
           * picture by the given x and y factors
           * @param xFactor the amount to scale in x
           * @param yFactor the amount to scale in y
           * @return the resulting picture
           */
          public Picture scale(double xFactor, double yFactor)
          {
            // set up the scale transform
            AffineTransform scaleTransform = new AffineTransform();
            scaleTransform.scale(xFactor,yFactor);

            // create a new picture object that is the right size
            Picture result = new Picture((int) (getHeight() * yFactor),
                                         (int) (getWidth() * xFactor));

            // get the graphics 2d object to draw on the result
            Graphics graphics = result.getGraphics();
            Graphics2D g2 = (Graphics2D) graphics;

            // draw the current image onto the result image scaled
            g2.drawImage(this.getImage(),scaleTransform,null);

            return result;
          }

          /**
           * Method to create a new picture of the passed width.
           * The aspect ratio of the width and height will stay
           * the same.
           * @param width the desired width
           * @return the resulting picture
           */
          public Picture getPictureWithWidth(int width)
          {
            // set up the scale transform
            double xFactor = (double) width / this.getWidth();
            Picture result = scale(xFactor,xFactor);
            return result;
          }

          /**
           * Method to create a new picture of the passed height.
           * The aspect ratio of the width and height will stay
           * the same.
           * @param height the desired height
           * @return the resulting picture
           */
          public Picture getPictureWithHeight(int height)
          {
            // set up the scale transform
            double yFactor = (double) height / this.getHeight();
            Picture result = scale(yFactor,yFactor);
            return result;
          }

         /**
          * Method to load a picture from a file name and show it in a picture frame
          * @param fileName the file name to load the picture from
          * @return true if success else false
          */
         public boolean loadPictureAndShowIt(String fileName)
         {
           boolean result = true;  // the default is that it worked

           // try to load the picture into the buffered image from the file name
           result = load(fileName);

           // show the picture in a picture frame
           show();

           return result;
         }

         /**
          * Method to write the contents of the picture to a file with
          * the passed name
          * @param fileName the name of the file to write the picture to
          */
         public void writeOrFail(String fileName) throws IOException
         {
           String extension = this.extension; // the default is current

           // create the file object
           File file = new File(this.pathName + fileName);
           //File fileLoc = file.getParentFile(); // directory name

           // if there is no parent directory use the current media dir
           //if (fileLoc == null)
           //{
             //fileName = FileChooser.getMediaPath(fileName);
             //file = new File(fileName);
             //fileLoc = file.getParentFile();
           //}

           // check that you can write to the directory
           //if (!fileLoc.canWrite()) {
            //    throw new IOException(fileName +
            //    " could not be opened. Check to see if you can write to the directory.");
           //}

           // get the extension
           int posDot = fileName.indexOf('.');
           if (posDot >= 0)
               extension = fileName.substring(posDot + 1);

           // write the contents of the buffered image to the file
           ImageIO.write(bufferedImage, extension, file);

         }

         /**
          * Method to write the contents of the picture to a file with
          * the passed name without throwing errors
          * @param fileName the name of the file to write the picture to
          * @return true if success else false
          */
         public boolean write(String fileName)
         {
             try {
                 this.writeOrFail(fileName);
                 return true;
             } catch (Exception ex) {
                 System.out.println("There was an error trying to write " + fileName);
                 ex.printStackTrace();
                 return false;
             }

         }

          /**
           * Method to get the coordinates of the enclosing rectangle after this
           * transformation is applied to the current picture
           * @return the enclosing rectangle
           */
          public Rectangle2D getTransformEnclosingRect(AffineTransform trans)
          {
            int width = getWidth();
            int height = getHeight();
            double maxX = width - 1;
            double maxY = height - 1;
            double minX, minY;
            Point2D.Double p1 = new Point2D.Double(0,0);
            Point2D.Double p2 = new Point2D.Double(maxX,0);
            Point2D.Double p3 = new Point2D.Double(maxX,maxY);
            Point2D.Double p4 = new Point2D.Double(0,maxY);
            Point2D.Double result = new Point2D.Double(0,0);
            Rectangle2D.Double rect = null;

            // get the new points and min x and y and max x and y
            trans.deltaTransform(p1,result);
            minX = result.getX();
            maxX = result.getX();
            minY = result.getY();
            maxY = result.getY();
            trans.deltaTransform(p2,result);
            minX = Math.min(minX,result.getX());
            maxX = Math.max(maxX,result.getX());
            minY = Math.min(minY,result.getY());
            maxY = Math.max(maxY,result.getY());
            trans.deltaTransform(p3,result);
            minX = Math.min(minX,result.getX());
            maxX = Math.max(maxX,result.getX());
            minY = Math.min(minY,result.getY());
            maxY = Math.max(maxY,result.getY());
            trans.deltaTransform(p4,result);
            minX = Math.min(minX,result.getX());
            maxX = Math.max(maxX,result.getX());
            minY = Math.min(minY,result.getY());
            maxY = Math.max(maxY,result.getY());

            // create the bounding rectangle to return
            rect = new Rectangle2D.Double(minX,minY,maxX - minX + 1, maxY - minY + 1);
            return rect;
          }

          /**
           * Method to get the coordinates of the enclosing rectangle after this
           * transformation is applied to the current picture
           * @return the enclosing rectangle
           */
          public Rectangle2D getTranslationEnclosingRect(AffineTransform trans)
          {
            return getTransformEnclosingRect(trans);
          }

         /**
          * Method to return a string with information about this picture
          * @return a string with information about the picture
          */
         public String toString()
         {
           String output = "Simple Picture, filename " + fileName +
             " height " + getHeight() + " width " + getWidth();
           return output;
         }

        } // end of SimplePicture class


2D Arrays and Loops Game
-------------------------

.. |game| raw:: html

   <a href="https://csa-games.netlify.app/" target="_blank">game</a>


Try the game below to practice loops with 2D arrays. Click on **Arrays** and then check **2D** and check **Loops** and then click on the elements of the * array that would be printed out by the given code. If you're stuck, check on Labels to see the indices. We encourage you to work in pairs and see how high a score you can get.

.. raw:: html

    <iframe height="700px" width="100%" style="margin-left:10%;max-width:80%" src="https://csa-games.netlify.app/"></iframe>



