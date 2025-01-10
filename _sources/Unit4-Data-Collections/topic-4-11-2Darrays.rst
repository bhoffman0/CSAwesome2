.. include:: ../common.rst

.. qnum::
   :prefix: 4-11-
   :start: 1

|Time45|

2D Array Creation and Access 
===============================

.. index::
    single: 2D Arrays
    single: row
    single: column
    pair: arrays; 2D
    pair: 2D Array; definition
    pair: 2D Array; row
    pair: 2D Array; column

Arrays in Java can store many items of the same type.  You can even store items in **two-dimensional** (2D) arrays which are arrays that have both **rows** and **columns**.  A **row** has horizontal elements.  A **column** has vertical elements.  In the picture below there are 3 rows of lockers and 6 columns.

.. figure:: Figures/2DLockers.jpg
    :width: 350px
    :align: center
    :figclass: align-center

    Figure 1: Lockers in rows and columns

Two dimensional arrays are especially useful when the data is naturally organized in rows and columns like in a spreadsheet, bingo, battleship, theater seats, classroom seats, or a picture.  In battleship, letters map to the rows (A is the first row, B is the second row, and so on) and the column indices start with 1.

A **2D array** is stored as an array of arrays in Java. The way 2D arrays are created and indexed is similar to 1D array objects. The size of a 2D array is established at the time of creation and cannot be changed. 2D arrays can store either primitive data or object reference data.

Array Storage
---------------

.. index::
   single: row-major order
   single: column-major order
   single: array of arrays
   pair: 2D Array; row-major order
   pair: 2D Array; column-major order
   pair: 2D Array; array of arrays

Many programming languages actually store two-dimensional array data in a one-dimensional array.  The typical way to do this is to store all the data for the first row followed by all the data for the second row and so on.  This is called **row-major** order.  Some languages store all the data for the first column followed by all the data for the second column and so on.  This called **column-major** order.

.. figure:: Figures/rowMajor.png
    :width: 250px
    :align: center
    :figclass: align-center

    Figure 2: A 2D array stored in row-major order or column-major order as a 1D array.

Java actually stores a two-dimensional array as an array of arrays.  Each element of the outer array has a reference to each inner array.  The picture below shows a 2D array that has 3 rows and 7 columns.  Notice that the array indices start at 0 and end at the length - 1.

.. figure:: Figures/ArrayRowsAndCols.png
    :width: 300px
    :align: center
    :figclass: align-center

    Figure 3: Java arrays of arrays

On the exam assume that any 2 dimensional (2D) array is in row-major order.  The outer array can be thought of as the rows and the inner arrays the columns.  On the exam all inner arrays will have the same length even though it is possible in Java to have inner arrays of different lengths (also called **non-rectangular arrays** or **ragged arrays**).

|Exercise| **Check your understanding**

Try to answer the following questions.  Click on the value or values to select them.  Click again to unselect a value.

.. clickablearea:: clicktd1
   :question: Click on all the values in the row at index 2
   :feedback: Rows are horizontal and columns are vertical and both start with index 0.
   :table:
   :correct: 3,1;3,2;3,3;3,4;
   :incorrect: 1,1;1,2;1,3;1,4;2,1;2,2;2,3;2,4;

   +----+----+----+----+
   | 8  | -2 | 3  | -1 |
   +----+----+----+----+
   | 4  |  5 | 0  | -7 |
   +----+----+----+----+
   | 2  | -3 | -4 | -5 |
   +----+----+----+----+

.. clickablearea:: clicktd2
   :question: Click on all the values in the column at index 1
   :feedback: Rows are horizontal and columns are vertical and both start with index 0.
   :table:
   :correct: 1,2;2,2;3,2;
   :incorrect: 1,1;1,3;1,4;2,1;2,3;2,4;3,1;3,3;3,4;

   +----+----+----+----+
   | 8  | -2 | 3  | -1 |
   +----+----+----+----+
   | 4  |  5 | 0  | -7 |
   +----+----+----+----+
   | 2  | -3 | -4 | -5 |
   +----+----+----+----+

.. clickablearea:: clicktd3
   :question: Click on the value at row index 2 and column index 1
   :feedback: Rows are horizontal and columns are vertical and both start with index 0.
   :table:
   :correct: 3,2
   :incorrect: 1,1;1,2;1,3;1,4;2,1;2,2;2,3;2,4;3,1;3,3;3,4;

   +----+----+----+----+
   | 8  | -2 | 3  | -1 |
   +----+----+----+----+
   | 4  |  5 | 0  | -7 |
   +----+----+----+----+
   | 2  | -3 | -4 | -5 |
   +----+----+----+----+

.. clickablearea:: clicktd4
   :question: Click on the value at row index 0 and column index 2
   :feedback: Rows are horizontal and columns are vertical and both start with index 0.
   :table:
   :correct: 1,3
   :incorrect: 1,1;1,2;1,4;2,1;2,2;2,3;2,4;3,1;3,2;3,3;3,4;

   +----+----+----+----+
   | 8  | -2 | 3  | -1 |
   +----+----+----+----+
   | 4  |  5 | 0  | -7 |
   +----+----+----+----+
   | 2  | -3 | -4 | -5 |
   +----+----+----+----+

.. clickablearea:: clicktd5
   :question: Click on the value at row index 1 and column index 1
   :feedback: Rows are horizontal and columns are vertical and both start with index 0.
   :table:
   :correct: 2,2
   :incorrect: 1,1;1,2;1,3;1,4;2,1;2,3;2,4;3,1;3,2;3,3;3,4;

   +----+----+----+----+
   | 8  | -2 | 3  | -1 |
   +----+----+----+----+
   | 4  |  5 | 0  | -7 |
   +----+----+----+----+
   | 2  | -3 | -4 | -5 |
   +----+----+----+----+

Declaring 2D Arrays
-------------------------------

.. index::
   pair: 2D Array; declaration
   pair: 2D Array; creation 

2D arrays are declared and created with the following syntax, which is very similar to 1D arrays but include 2 dimensions (``[][]``). The code below creates a 2D array with 2 rows and 3 columns named ``ticketInfo`` and a 2D array with 3 rows and 2 columns named ``seatingChart``.  The number of elements in a 2D array is the number of rows times the number of columns. 

.. code-block:: java

  // 2D array declaration
  // datatype[][] variableName = new datatype[numberRows][numberCols];
  int[][] ticketInfo = new int[2][3];
  String[][] seatingChart = new String[3][2];
 
Arrays are objects in Java, so any variable that declares an array holds a reference to an object.  If the array hasn't been created with **new** yet and you try to print the value of the variable, it will print **null** (meaning it doesn't reference any object yet). When a 2D array is created using the keyword ``new``, all of its elements are initialized to the default values for the element data type. The default value for ``int`` is ``0``, for ``double`` is ``0.0``, for ``boolean`` is ``false``, and for a reference type is ``null``.

|Exercise| **Check your understanding**

.. fillintheblank:: twodaNumElfill

   How many elements are in ticketInfo?

   -    :6$: Correct.  2 * 3 = 6
        :.*: Multiply the number of rows and the number of columns

|CodingEx| **Coding Exercise**



.. activecode:: twoDArrayCreate
  :language: java
  :autograde: unittest
  :practice: T

  What will the following code print out? Can you change ticketInfo to be an array of 5 rows and 10 columns? Can you declare another array called studentNames that has 10 rows and 5 columns? The length property of arrays will be explained below.
  ~~~~
  public class TicketInfo
  {
      public static void main(String[] args)
      {
          // declare arrays
          int[][] ticketInfo = new int[2][3];
          System.out.println(ticketInfo.length + " rows");
          System.out.println(ticketInfo[0].length + " columns");
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
          super("TicketInfo");
      }

      @Test
      public void test1()
      {
          String output = getMethodOutput("main");
          String expected = "5 rows\n10 columns";

          boolean passed = output.contains(expected);
          passed =
                  getResults(expected, output, "Changed ticketInfo to 5 rows and 10 columns", passed);

          assertTrue(passed);
      }

      @Test
      public void test2()
      {
          String expected = "studentNames = new String[10][5]";

          boolean passed = checkCodeContains(expected);
          assertTrue(passed);
      }
  }


Initializer Lists for 2D Arrays
-------------------------------

You can also initialize (set) the values for the array when you create it.  In this case you don't need to specify the size of the array, it will be determined from the values you give.  The code below creates an array called ``ticketInfo`` with 2 rows and 3 columns.  It also creates an array called ``seatingInfo`` with 3 rows and 2 columns. Note that the initializer list used to create and initialize a 2D array consists of 2 initializer lists that represent 1D arrays for each row. 

.. code-block:: java

  int[][] ticketInfo = { {25,20,25}, {25,20,25} };
  String[][] seatingInfo = { {"Jamal", "Maria"}, {"Jake", "Suzy"}, {"Emma", "Luke"} };

|Exercise| **Check your understanding**

.. fillintheblank:: twodaGetElfill

   What is the value at ``seatingInfo[2][1]`` after the code above executes? Remember that indices start at 0, and the first index is for rows and the second index is for columns.

   -    :Luke$: Correct.  The string at row index 2 and column index 1 is Luke.
        :.*: indices start at 0 and the row is first then the column


Set Values in a 2D Array 
----------------------------------------

.. index::
   pair: 2D Array; initialization
   pair: 2D Array; set value

The square brackets ``[row][col]`` are used to access and modify an element in a 2D array. When accessing the element at ``arr[first][second]``, the first index is used for rows, the second index is used for columns. To explicitly put a value in an array, you can use assignment statements with the name of the array followed by the row index in square brackets followed by the column index in square brackets and then an ``=`` followed by a value.

.. code-block:: java

  int[][] ticketInfo = new int[2][3];
  ticketInfo[0][0] = 15;


.. |Java visualizer| raw:: html

   <a href= "http://cscircles.cemc.uwaterloo.ca/java_visualize/#code=public+class+Test+%0A++%7B%0A+++++public+static+void+main(String%5B%5D+args)%0A+++++%7B%0A++++++++//+declare+arrays%0A++++++++int%5B%5D%5B%5D+ticketInfo%3B%0A++++++++String%5B%5D%5B%5D+seatingChart%3B%0A++++++++%0A++++++++//+create+arrays%0A++++++++ticketInfo+%3D+new+int+%5B2%5D%5B3%5D%3B%0A++++++++seatingChart+%3D++new+String+%5B3%5D%5B2%5D%3B%0A++++++++%0A++++++++//+initialize+the+array+elements%0A++++++++ticketInfo%5B0%5D%5B0%5D+%3D+15%3B%0A++++++++ticketInfo%5B0%5D%5B1%5D+%3D+10%3B%0A++++++++ticketInfo%5B0%5D%5B2%5D+%3D+15%3B%0A++++++++ticketInfo%5B1%5D%5B0%5D+%3D+25%3B%0A++++++++ticketInfo%5B1%5D%5B1%5D+%3D+20%3B%0A++++++++ticketInfo%5B1%5D%5B2%5D+%3D+25%3B%0A++++++++seatingChart%5B0%5D%5B0%5D+%3D+%22Jamal%22%3B%0A++++++++seatingChart%5B0%5D%5B1%5D+%3D+%22Maria%22%3B%0A++++++++seatingChart%5B1%5D%5B0%5D+%3D+%22Jacob%22%3B%0A++++++++seatingChart%5B1%5D%5B1%5D+%3D+%22Suzy%22%3B%0A++++++++seatingChart%5B2%5D%5B0%5D+%3D+%22Emma%22%3B%0A++++++++seatingChart%5B2%5D%5B1%5D+%3D+%22Luke%22%3B%0A++++++++%0A++++++++//+print+the+contents%0A++++++++System.out.println(ticketInfo)%3B%0A++++++++System.out.println(seatingChart)%3B%0A+++++%7D%0A++%7D&mode=display&curInstr=0" style="text-decoration:underline" target="_blank" >Java Visualizer</a>

|CodingEx| **Coding Exercise**

Try the code below. Did it print what you expected?  When you print a two dimensional array you just get the reference to the object. In the next lesson, we'll learn how to use nested loops to print out the whole 2D Array. Right now, use the CodeLens button or the |Java visualizer| to see what the values are after this code runs. Edit the code to add in an extra row to the ``seatingChart`` and add your name and a friend's name in the columns of this extra row using assignment statements.

.. activecode:: twoDArraySet
  :language: java
  :autograde: unittest

  Add another row of data to the arrays by changing the size of the arrays and adding in the assignment statements for the cells in those rows.
  ~~~~
  public class TwoDArraySet
  {
      public static void main(String[] args)
      {
          // declare arrays
          int[][] ticketInfo;
          String[][] seatingChart;

          // create arrays
          ticketInfo = new int[2][3];
          seatingChart = new String[3][2];

          // initialize the array elements
          ticketInfo[0][0] = 15;
          ticketInfo[0][1] = 10;
          ticketInfo[0][2] = 15;
          ticketInfo[1][0] = 25;
          ticketInfo[1][1] = 20;
          ticketInfo[1][2] = 25;
          seatingChart[0][0] = "Jamal";
          seatingChart[0][1] = "Maria";
          seatingChart[1][0] = "Jacob";
          seatingChart[1][1] = "Suzy";
          seatingChart[2][0] = "Emma";
          seatingChart[2][1] = "Luke";

          // print the contents
          System.out.println(ticketInfo);
          System.out.println(seatingChart);
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
          super("TwoDArraySet");
      }

      @Test
      public void test1()
      {
          String output = getMethodOutput("main");
          String expected = "[[I@", expected2 = "[[Ljava.lang.String;@";

          boolean passed = output.contains(expected) && output.contains(expected2);

          passed = getResults("true", "" + passed, "Prints two 2D arrays");
          assertTrue(passed);
      }

      @Test
      public void test2()
      {
          String code = getCode();
          String expected = "new String[4][2]";

          boolean passed = code.contains(expected);

          passed = getResults("true", "" + passed, "Add another row to seatingChart");
          assertTrue(passed);
      }

      @Test
      public void test3()
      {
          String code = getCode();
          String expected1 = "seatingChart[3][0]";
          String expected2 = "seatingChart[3][1]";

          boolean passed = code.contains(expected1) && code.contains(expected2);

          passed = getResults("true", "" + passed, "Give values to new elements");
          assertTrue(passed);
      }
  }

|Exercise| **Check your understanding**

.. mchoice:: qa2dab_1
   :practice: T
   :answer_a: nums[3][2] = 5;
   :answer_b: nums[1][2] = 5;
   :answer_c: nums[2][1] = 5;
   :answer_d: nums[2][3] = 5;
   :correct: c
   :feedback_a: Remember that the indices start at 0.
   :feedback_b: Remember that the row is first then the column.
   :feedback_c: This will set the value  of the 3rd row and 2nd column.
   :feedback_d: Remember that the row is first and then the column and that the indices start at 0.

   Which of the following sets the value for the 3rd row and 2nd column of a 2D array called ``nums``?

Get a Value from a 2D Array
------------------------------

.. index::
   pair: 2D Array; access value

To get the value in a 2D array give the name of the array followed by the row and column indices in square brackets. The code below will get the value at row index 1 and column index 0 from ``ticketInfo``.  It will also get the value at row index 0 and column index 1 from ``seatingChart``.

.. code-block:: java

  int[][] ticketInfo = { {25,20,25}, {25,20,25} };
  String[][] seatingInfo = { {"Jamal", "Maria"}, {"Jake", "Suzy"}, {"Emma", "Luke"} };
  int value = ticketInfo[1][0];
  String name = seatingInfo[0][1];

|Exercise| **Check your understanding**

.. mchoice:: qa2dab_2
   :practice: T
   :answer_a: Jamal
   :answer_b: Maria
   :answer_c: Jake
   :answer_d: Suzy
   :answer_e: Emma
   :correct: b
   :feedback_a: This would be true for if <code>name</code> was set to <code>seatingInfo[0][0];</code> instead.
   :feedback_b: Maria is the value of <code>seatingInfo[0][1];</code>.
   :feedback_c: This would be true for if <code>name</code> was set to <code>seatingInfo[1][0];</code> instead.
   :feedback_d: This would be true for if <code>name</code> was set to <code>seatingInfo[1][1];</code> instead.
   :feedback_e: This would be true for if <code>name</code> was set to <code>seatingInfo[2][1];</code> instead.

   What is the value of ``name`` after the code above executes?

|CodingEx| **Coding Exercise**



.. activecode:: twoDArrayInitGet
  :language: java
  :autograde: unittest

  Add another row to seatingInfo initialized to your name and a friend's name. Get these names out of the array using the correct indices and then print them out.
  ~~~~
  public class TwoDArrayInitGet
  {
      public static void main(String[] args)
      {
          String[][] seatingInfo =
          {
              {"Jamal", "Maria"},
              {"Jake", "Suzy"},
              {"Emma", "Luke"}
          };
          String name = seatingInfo[0][0];
          System.out.println(name + " is at [0,0]");
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
          super("TwoDArrayInitGet");
      }

      @Test
      public void test1()
      {
          String output = getMethodOutput("main");
          String expected = "Jamal is at [0,0]";

          boolean passed = output.contains(expected);

          passed = getResults("true", "" + passed, "Output contains " + expected);
          assertTrue(passed);
      }

      @Test
      public void test2()
      {
          String output = getMethodOutput("main");
          String[] lines = output.split("\n");

          String expected = "[3,0]";
          String actual = "";

          boolean passed = false;

          for (String l : lines)
          {
              if (l.replaceAll(" ", "").contains(expected))
              {
                  actual = l;
                  passed = true;
              }
          }

          passed =
                  getResults(
                          "Name is at " + expected,
                          actual,
                          "Add one name to new row and print it out",
                          passed);
          assertTrue(passed);
      }

      @Test
      public void test3()
      {
          String output = getMethodOutput("main");
          String[] lines = output.split("\n");

          String expected = "[3,1]";
          String actual = "";

          boolean passed = false;

          for (String l : lines)
          {
              if (l.replaceAll(" ", "").contains(expected))
              {
                  actual = l;
                  passed = true;
              }
          }

          passed =
                  getResults(
                          "Name is at " + expected,
                          actual,
                          "Add second name to new row and print it out",
                          passed);
          assertTrue(passed);
      }
  }

2D Array Row and Column length 
----------------------------------
.. index::
   pair: 2D Array; number of rows
   pair: 2D Array; number of columns
   single: length

Arrays know their length (how many elements they can store).  The length is a public read-only attribute for array objects. 
The number of rows contained in a 2D array can be accessed through the array name and the ``length`` attribute:  ``arrayName.length``.  The number of columns contained in a 2D array can be accessed through the ``length`` attribute of one of the rows, for example ``arrayName[0].length``, which gives a single array that is a row of a 2D array using the 2D array name and a single set of square brackets containing the row index.

.. code-block:: java

  ticketInfo.length // returns the number of rows
  ticketInfo[0].length // returns the number of columns

.. note::

     Note that length is an attribute and not a method, so you don't add parentheses after length.  However, if you use parentheses after length during the exam, you won't lose any points. Since for the AP CSA exam all two-dimensional arrays are rectangular arrays (arrays that have the same number of columns in each row) you can just use the length of the first inner array as the number of columns as shown by ``ticketInfo[0].length``.

The valid row index values for a 2D array are ``0`` through one less than the number of rows or the length of the array, inclusive. The valid column index values for a 2D array are ``0`` through one less than the number of columns or the length of any given row of the array, inclusive. For example, given a 2D array named ``values``, the number of rows is ``values.length`` and the number of columns is ``values[0].length```. Using an index value outside of these ranges will result in an ``ArrayIndexOutOfBoundsException``.

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
   :feedback_b: This would be true if array indices started with 1 and the column was specified first.  However, array indices start at 0 and the row is given first in row-major order.
   :feedback_c: Array indices start with 0 so the third row has an index of 2 and the second column has an index of 1.
   :feedback_d: This would be true if the column index was first, but in row-major order the row index is first.

   Which of the following could be used to get the value in the third row and second column from a 2D array called ``nums``?

|Groupwork| Coding Challenge : ASCII Art
---------------------------------------------------

.. |ASCII art| raw:: html

   <a href= "https://www.asciiart.eu/" style="text-decoration:underline" target="_blank" >ASCII art</a>

ASCII is a commonly used character encoding standard where each key you press on the keyboard is translated to an ASCII number to be stored in the computer. ASCII has been mostly replaced by UNICODE which includes characters in other languages like Chinese. In the days before good graphics, some people made ASCII art just using the keyboard characters. Take a look at this |ASCII art| collection!

We can represent ASCII art in a 2D array of rows and columns. What do you think the following code will print out? Try to guess before you run it. The loops to print out the 2D array will be explained in the next lesson. Then, do the following:

1. Change the code to use 2 assignment statements with the 2D array ``asciiArt`` to change the "o" characters to "@" characters. You should figure out what the row and column indices should be for the "o" characters and use them with the array name to set that character to "@". After testing this code, comment it out so that your teacher can still see it.

2. Add a new ``asciiArt`` array with a different |ASCII art| from the collection or of your own design. Be careful with the special characters like ``"`` and ``\``. You will need to put another backslash in front of these to print them out like ``\"`` and ``\\``.

.. activecode:: challenge-8-1-ascii-art
  :language: java
  :autograde: unittest

  Part 1: Add 2 assignment statements for the 2D array asciiArt to change the "o" characters to "@" characters. Part 2: Create a new asciiArt array and print it out.
  ~~~~
  public class AsciiArt
  {
      public static void main(String[] args)
      {

          String[][] asciiArt =
          {
              {" ", " ", "_", "_", "_", " ", " "},
              {" ", "(", "o", " ", "o", ")", " "},
              {"(", " ", " ", "V", " ", " ", ")"},
              {" ", "-", "m", "-", "m", "-", " "},
          };

          // Part 1: Add 2 assignment statements to change "o" to "@"

          // print the asciiArt for Part 1
          System.out.println("ASCII Art:");
          for (String[] row : asciiArt)
          {
              for (String column : row) System.out.print(column);
              System.out.println();
          }

          // Part 2: Create your own ASCII art array and print it out!

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
          super("AsciiArt");
      }

      @Test
      public void test0()
      {
          String output = getMethodOutput("main");
          String expect = "ASCII Art: \n___  \n (@ @) \n(  V  )\n -m-m-";

          boolean passed = getResults(expect, output, "Running main()", true);
          assertTrue(passed);
      }

      /* removed because doesn't work if their own art has o
      @Test
      public void test1()
      {
          String output = getMethodOutput("main");
          String expect = "ASCII Art: \n___  \n (@ @) \n(  V  )\n -m-m-";

          boolean passed = output.contains("@") && !output.contains("o");
          passed = getResults(expect, output, "changed o to @", passed);
          assertTrue(passed);
      }
      */

      @Test
      public void test2()
      {
          String output = getMethodOutput("main");
          String expect = "___  \n (@ @) \n(  V  )\n -m-m-";

          if (output.contains("-m-m-"))
          {
              int i = output.indexOf("-m-m-") + "-m-m-".length();
              output = output.substring(i);
          }

          String[] lines = output.split("\n");

          boolean passed = output.length() >= 10 && lines.length >= 3;

          passed =
                  getResults(
                          "Your art",
                          output,
                          "added your own ascii art (should be at least 3 x 3)",
                          passed);
          assertTrue(passed);
      }

      @Test
      public void test3()
      {
          String expect = "asciiArt[#][#] = \"@\"";
          String code = getCode();
          int num = countOccurencesRegex(code, expect);

          boolean passed = num >= 2;

          getResults("2", "" + num, "Number of asciiArt[#][#] = \"@\" lines in code", passed);

          assertTrue(passed);
      }
  }

Summary
-------

- (AP 4.11.A.1) A **2D array** is stored as an array of arrays. Therefore, the way 2D arrays are created and indexed is similar to 1D array objects. The size of a 2D array is established at the time of creation and cannot be changed. 2D arrays can store either primitive data or object reference data. Nonrectangular 2D array objects (with varying column length for each row) are outside the scope of the AP Computer Science A course and exam.

- 2D arrays are declared and created with the following syntax: ``datatype[][] variableName = new datatype[numberRows][numberCols]``;

- (AP 4.11.A.2)	When a 2D array is created using the keyword ``new``, all of its elements are initialized to the default values for the element data type. The default value for ``int`` is ``0``, for ``double`` is ``0.0``, for ``boolean`` is ``false``, and for a reference type is ``null``.

- (AP 4.11.A.3) The initializer list used to create and initialize a 2D array consists of initializer lists that represent 1D arrays; for example, ``int[][] arr2D = { {1, 2, 3}, {4, 5, 6} };``.

- (AP 4.11.A.4) The square brackets ``[row][col]`` are used to access and modify an element in a 2D array. For the purposes of the AP exam, when accessing the element at ``arr[first][second]``, the ``first`` index is used for rows, the ``second`` index is used for columns.

- **Row-major order** refers to an ordering of 2D array elements where traversal occurs across each row, while **column-major order** traversal occurs down each column.

- (AP 4.11.A.5)	A single array that is a row of a 2D array can be accessed using the 2D array name and a single set of square brackets containing the row index.
- (AP 4.11.A.6) The number of rows contained in a 2D array can be accessed through the ``length`` attribute. The valid row index values for a 2D array are ``0`` through one less than the number of rows or the length of the array, inclusive. The number of columns contained in a 2D array can be accessed through the ``length`` attribute of one of the rows. The valid column index values for a 2D array are ``0`` through one less than the number of columns or the length of any given row of the array, inclusive. For example, given a 2D array named ``values``, the number of rows is ``values.length`` and the number of columns is ``values[0].length```. Using an index value outside of these ranges will result in an ``ArrayIndexOutOfBoundsException``.	

2D Arrays Game
----------------

.. |game| raw:: html

   <a href="https://csa-games.netlify.app/" target="_blank">game</a>


Try the game below to practice 2D Arrays. Click on **Arrays** and then check on **2D** and click on the elements of the * array that would be printed out by the given code. If you're stuck, check on Labels to see the indices. We encourage you to work in pairs and see how high a score you can get.

.. raw:: html

    <iframe height="700px" width="100%" style="margin-left:10%;max-width:80%" src="https://csa-games.netlify.app/"></iframe>



