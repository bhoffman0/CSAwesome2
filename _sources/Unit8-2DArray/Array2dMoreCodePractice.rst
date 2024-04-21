			
   
More Code Practice with 2D Arrays
-----------------------------------

.. activecode:: SentenceModifier_Written
   :language: java
   :autograde: unittest
   
    Replace the “ADD CODE HERE” below to finish a function ``String findAndReplaceFirst(String[][] sentence, String target, String replacement)`` that takes a 2D array of strings, a target string to search for, and a replacement string. The function searches the 2D array for the first occurrence of the target string and replaces it with the replacement string.
   ~~~~

   import java.util.Arrays;

   public class SentenceModifier {
      public static String[][] findAndReplaceFirst(String[][] sentence, String target, String replacement) {
         // ADD CODE HERE //
      }

      public static void main(String[] args) {
        String[][] document = {
            {"Hello", "world"},
            {"hello", "Lucy"},
            {"hello", "Yuyu"},
        };


        String target = "hello";
        String replacement = "hi";


        String[][] updatedDocument = findAndReplaceFirst(document, target, replacement);

        for (String[] row : updatedDocument) {
            for (String word : row) {
                System.out.print(word + " ");
            }
            System.out.println();
        }
     }
   }

   ====
   import static org.junit.Assert.*;
   import org.junit.Test;
   import java.io.IOException;
   import java.util.Arrays;

   public class RunestoneTests extends CodeTestHelper {
       @Test
       public void testSymmetry() throws IOException {
            String output = getMethodOutput("main");
            String expect = "Hello world\nhi Lucy\nhello Yuyu";
           boolean passed = getResults(expect, output, "Expected output from main");
           assertTrue(passed);
     
       }
   }


.. activecode:: FindMaxOnes_Written
   :language: java
   :autograde: unittest

    Replace the “ADD CODE HERE” below to finish a function ``findMaxOnes(matrix)`` that accepts a two-dimensional integer array ``matrix`` as input. The function should determine the row with the maximum number of occurrences of the integer 1 and return its index. If multiple rows have the same maximum number of 1s, return the index of the first such row encountered. For example: if the input matrix is: {[ 0, 1, 1 ], [ 1, 1, 0 ], [ 1, 0, 1 ]}. The function should return 1, as the second row contains the maximum number of 1s (2 in total).
   ~~~~
   import java.util.Arrays;

   public class MaxOnesRowFinder {
      public static int findMaxOnes(int[][] matrix) {
         // ADD CODE HERE //
      }

      public static void main(String[] args) {
          int[][] matrix = {
              {0, 1, 1},
              {1, 1, 0},
              {1, 0, 1}
          };

          int maxRow = findMaxOnes(matrix);
          System.out.println(maxRow);
      }

   }

   ====  
   import static org.junit.Assert.*;
   import org.junit.Test;
   import java.io.IOException;
   import java.util.Arrays;

   public class RunestoneTests extends CodeTestHelper {
       @Test
       public void testMain() throws IOException {
           String output = getMethodOutput("main");
           String expectedOutput = "0";

           boolean passed = getResults(expectedOutput, output, "Expected output from main");
           assertTrue(passed);
       }
   }

.. activecode:: isSeatAvailable_Written
   :language: java
   :autograde: unittest

   You are given a 2D array representing the seating arrangement in a theater. Each cell in the array contains either ``0`` (indicating an available seat) or ``1`` (indicating an occupied seat). Additionally, each row represents a different row in the theater, and each column represents a different seat in that row. Your task is to determine whether a specific seat at a given row and column is available while ensuring that social distancing guidelines are followed.
   The social distancing guideline specifies that no two occupied seats should be adjacent horizontally, vertically, or diagonally. Thus, a seat is considered available only if all adjacent seats (including diagonals) are empty.
   Replace the “ADD CODE HERE” below to finish a function ``isSeatAvailable(int[][] theater, int row, int column)`` that takes the theater seating arrangement and the row and column indices of the seat as input and returns ``true`` if the seat is available while adhering to social distancing guidelines, and ``false`` otherwise.
   ~~~~
   import java.util.Arrays;

   public class SocialDistancingSeating {
      public static boolean isSeatAvailable(int[][] theater, int row, int column) {
         // ADD CODE HERE //
       }

       public static void main(String[] args) {
          int[][] theater = {
              {0, 0, 1, 1},
              {1, 1, 0, 0},
              {0, 1, 1, 0}
          };
          int row = 1;
          int column = 2;

          boolean available = isSeatAvailable(theater, row, column);
          System.out.println(available);
      }
   }

   ====  
   import static org.junit.Assert.*;
   import org.junit.Test;
   import java.io.IOException;
   import java.util.Arrays;

   public class RunestoneTests extends CodeTestHelper {
       @Test
       public void testMain() throws IOException {
           String output = getMethodOutput("main");
           String expectedOutput = "false";

           boolean passed = getResults(expectedOutput, output, "Expected output from main");
           assertTrue(passed);
       }
   }

.. activecode:: DiagonalSum_Written
   :language: java
   :autograde: unittest

   Replace the “ADD CODE HERE” to finish a function ``diagonalSum(int[][] matrix)`` that takes the matrix as input and returns an array containing the sums of elements along both diagonals. The first element of the array should represent the sum of elements along the main diagonal, and the second element should represent the sum of elements along the opposite diagonal. In a square matrix, the main diagonal refers to the diagonal line of elements from the top left to the bottom right. Conversely, the opposite diagonal runs from the top right to the bottom left corner of the matrix.
   For example if the input matrix is { {1, 1, 1},{2, 2, 2},{1, 1, 2} }. The function should return [5,4]
   ~~~~
   import java.util.Arrays;

   public class DiagonalSum {
      public static int[] diagonalSum(int[][] matrix) {
           // ADD CODE HERE //
      }

      public static void main(String[] args) {
          int[][] matrix = {
              {1, 2, 3},
              {4, 5, 6},
              {7, 8, 9}
          };

          int[] diagonalSums = diagonalSum(matrix);
          System.out.println(Arrays.toString(diagonalSums));
      }
   }

   ====  
   import static org.junit.Assert.*;
   import org.junit.Test;
   import java.io.IOException;
   import java.util.Arrays;

   public class RunestoneTests extends CodeTestHelper {
       @Test
       public void testMain() throws IOException {
           String output = getMethodOutput("main");
           String expectedOutput = "15, 15";

           boolean passed = getResults(expectedOutput, output, "Expected output from main");
           assertTrue(passed);
       }
   }



.. activecode:: isSymmetric_Written
   :language: java
   :autograde: unittest
   
   Write a function ``isSymmetric(int[][] matrix)`` that takes a 2D array of integers ``matrix`` as input and returns ``true`` if the matrix is symmetric, and ``false`` otherwise.  A matrix is symmetric if it is square and if each element at position (row, col) is equal to the element at position (col, row). For example, if the input matrix is {{1, 2, 3}, {2, 4, 5}, {3, 5, 6}}, the function ``isSymmetric(matrix)` should return ``true``, while if the input matrix is {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}, the function ``isSymmetric(matrix)`` should return ``false``.
   ~~~~

   import java.util.Arrays;

   public class MatrixSymmetryChecker {
       public static boolean isSymmetric(int[][] matrix) {
          // write code here
       }

       public static void main(String[] args) {
           int[][] symmetricMatrix = {
               {1, 2, 3},
               {2, 4, 5},
               {3, 5, 6}
           };
   
           int[][] nonSymmetricMatrix = {
               {1, 2, 3},
               {4, 5, 6},
               {7, 8, 9}
           };

           System.out.println(isSymmetric(symmetricMatrix)); 

           System.out.println(isSymmetric(nonSymmetricMatrix)); 
       }
   }

   ====
   import static org.junit.Assert.*;
   import org.junit.Test;
   import java.io.IOException;
   import java.util.Arrays;

   public class RunestoneTests extends CodeTestHelper {
       @Test
       public void testSymmetry() throws IOException {
            String output = getMethodOutput("main");
            String expect = "true false";
           boolean passed = getResults(expect, output, "Expected output from main");
           assertTrue(passed);
     
       }
   }

.. activecode:: MatrixBoundarySum_Written
   :language: java
   :autograde: unittest

   Replace the “ADD CODE HERE” below and write a function ``int boundarySum(int[][] matrix)`` that takes a 2D array of integers ``matrix`` as input and calculates the sum of all boundary elements of the matrix. Boundary elements are defined as the elements in the first row, last row, first column, and last column of the matrix. For example, if the input matrix is {{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}, {13, 14, 15, 16}}, the function ``boundarySum(matrix)`` should return 102, which is the sum of the boundary elements {1, 2, 3, 4, 5, 8, 9, 12, 13, 14, 15, 16}.
   ~~~~  
   import java.util.Arrays;

   public class MatrixBoundarySum {
      public static int boundarySum(int[][] matrix) {
        // ADD CODE HERE //
     }

     public static void main(String[] args) {
         int[][] matrix = {
             {1, 2, 3, 4},
             {5, 6, 7, 8},
             {9, 10, 11, 12},
             {13, 14, 15, 16}
         };

         int boundarySum = boundarySum(matrix);
         System.out.println(boundarySum);
     }
   }

    ====
   import static org.junit.Assert.*;
   import org.junit.Test;
   import java.io.IOException;
   import java.util.Arrays;

   public class RunestoneTests extends CodeTestHelper {
       public RunestoneTests() {
           super();
       }

       @Test
       public void testBoundarySum() throws IOException {
            String output = getMethodOutput("main");
            String expect = "102";
           boolean passed = getResults(expect, output, "Expected output from main");
           assertTrue(passed);
     
       }

   
    }

.. activecode:: MatrixTranspose_Written
   :language: java

   
   Replace the “ADD CODE HERE” below and create function ``transposeMatrix(matrix)`` that takes an input matrix and returns its transpose. Transposing a matrix involves interchanging its rows and columns, resulting in a new matrix where the rows of the original matrix become the columns, and vice versa. For example, if the input matrix is {{1, 2, 3}, {4, 5, 6}}. The function ``transposeMatrix(matrix)`` should return: {{1, 4}, {2, 5},{3, 6}}
   ~~~~
   import java.util.Arrays;


   public class Test1 {
       public static int[][] transposeMatrix(int[][] matrix) {
          // ADD CODE HERE //
       }


    public static void main(String[] args) {
           int[][] inputMatrix = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
           int[][] result = transposeMatrix(inputMatrix);

           // Print the transposed matrix
           for (int[] row : result) {
                System.out.println(Arrays.toString(row));
           }
    }
   }

   ====  

   import static org.junit.Assert.*;
   import org.junit.Test;
   import java.io.IOException;
   import java.util.Arrays;


   public class TransposeMatrixTester extends CodeTestHelper {
       @Test
       public void testTransposeMatrix() {
           String output = getMethodOutput("main");
           String expect = "1 4 7\n2 5 8\n3 6 9";

           boolean passed = getResults(expect, output, "Expected output from main");
           assertTrue(passed);

       }
   }

.. activecode:: MatrixRotation_Written
   :language: java
   :autograde: unittest


   Replace the “ADD CODE HERE” below and create a function ``rotateMatrixClockwise(matrix)`` that takes a rectangular matrix of ``integers`` as input and rotates it 90 degrees clockwise.
   The input matrix will be represented as a 2D array, where each inner array represents a row in the matrix.
   The function should rearrange the elements in the matrix such that each column becomes a row, and the order of elements is rotated clockwise by 90 degrees.
   For example, if the input matrix is {{1,2,3}, {4, 5, 6},{7, 8, 9}}. The function ``rotateMatrixClockwise(matrix)`` should return {{7,4,1}, {8, 5, 2},{9, 6, 3}}.
   ~~~~
   import java.util.Arrays;

   public class MatrixRotation {
      public static int[][] rotateMatrixClockwise(int[][] matrix) {
            // ADD CODE HERE //
       }



       public static void main(String[] args) {
           int[][] matrix = {
               {1, 2, 3},
               {4, 5, 6},
               {7, 8, 9},
               {10, 11, 12}
           };

           int[][] rotatedMatrix = rotateMatrixClockwise(matrix);

           printMatrix(rotatedMatrix);
       }
      }
   ====  
   import static org.junit.Assert.*;
   import org.junit.Test;
   import java.io.IOException;
   import java.util.Arrays;

   public class RunestoneTests extends CodeTestHelper {
       @Test
       public void testMain() throws IOException {
           String output = getMethodOutput("main");
           String expectedOutput = "10 7 4 1\n11 8 5 2\n12 9 6 3";

           boolean passed = getResults(expectedOutput, output, "Expected output from main");
           assertTrue(passed);
       }
   }


