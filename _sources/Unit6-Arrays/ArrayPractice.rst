.. qnum::
   :prefix: 6-8-
   :start: 1

Code Practice with Arrays
============================

.. tabbed:: ch7Ex1

        .. tab:: Question

           .. activecode::  ch7Ex1q
              :language: java
              :autograde: unittest
              :practice: T

              Fix the following code so that it prints every other value in the array ``arr1`` starting with the value at index 0.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      int arr1 = {1, 3, 7, 9, 15, 17};
                      for (int index = 0; index <= arr1.length; index += 2)
                      {
                          System.out.print(index + ", ");
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
                      String expect = "1, 7, 15, ";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains1()
                  {
                      boolean passed = checkCodeContains("correct array data type", "int[] arr1");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains2()
                  {
                      boolean passed =
                              checkCodeContains(
                                      "correct for loop condition",
                                      "for (int index = 0; index < arr1.length; index+=2)");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains3()
                  {
                      boolean passed =
                              checkCodeContains(
                                      "access values in array instead of index",
                                      "System.out.print(arr1[index] + \", \")");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Change line 5 to add the ``[]`` on the declaration of ``arr1`` to show that it is an array of integer values.  Change line 6 to ``index < arr1.length`` so that you don't go out of bounds (the last valid index is the length minus one).  Change line 8 to print ``arr1[index]``.

           .. activecode::  ch7Ex1a
              :language: java
              :optional:

              Solution to question above.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      int[] arr1 = {1, 3, 7, 9, 15, 17};
                      for (int index = 0; index < arr1.length; index += 2)
                      {
                          System.out.print(arr1[index] + ", ");
                      }
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch7Ex1d

.. tabbed:: ch7Ex2

        .. tab:: Question

           .. activecode::  ch7Ex2q
              :language: java
              :autograde: unittest
              :practice: T

              Fix the following to print the values in the array ``a1`` starting with the value at the last index and then backwards to the value at the first index.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      int[] a1 = {1, 3, 7, 9, 15};
                      for (int i = a1.length; i > 0; i--) 
                      {
                          System.out.print(arr[i] + ", ");
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
                      String expect = "15, 9, 7, 3, 1, ";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains1()
                  {
                      boolean passed = checkCodeContains("correct starting index", "int i = a1.length-1;");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains2()
                  {
                      boolean passed = checkCodeContains("correct ending index", "i >= 0;");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains3()
                  {
                      boolean passed =
                              checkCodeContains(
                                      "correct array variable name", "System.out.print(a1[i] + \", \");");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Change line 6 to ``a1.length - 1`` since the last valid index is one less than the length of the array and ``i >= 0`` since the first valid index is 0. Change line 7 to ``a1``.

           .. activecode::  ch7Ex2a
              :language: java
              :optional:

              Solution to question above.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      int[] a1 = {1, 3, 7, 9, 15};
                      for (int i = a1.length - 1; i >= 0; i--) 
                      {
                          System.out.print(a1[i] + ", ");
                      }
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch7Ex2d

.. tabbed:: ch7Ex3

        .. tab:: Question

           .. activecode::  ch7Ex3q
              :language: java
              :autograde: unittest
              :practice: T

              Rewrite the following code so that it prints all the values in an array ``arr1`` using a for-each loop instead of a ``for`` loop.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      int[] arr1 = {1, 3, 7, 9};
                      for (int index = 0; index < arr1.length; index++)
                      {
                          System.out.print(arr1[index] + ", ");
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
                  public void testCodeContains()
                  {

                      boolean passed = checkCodeContains("for each loop", "for (int * : arr1)");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains1()
                  {

                      boolean passed =
                              checkCodeContains("print statement variable name", "System.out.print(* + \", \");");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           In a for-each loop you specify the type of the values in the array, a name for the current value, and then a ``:`` and then the name of the array.  The first time through the loop the value will be the one at index 0.  The next time the one at index 1 and so on until you reach the last value in the array.

           .. activecode::  ch7Ex3a
              :language: java
              :optional:

              Solution to question above.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      int[] arr1 = {1, 3, 7, 9};
                      for (int value : arr1)
                      {
                          System.out.print(value + ", ");
                      }
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch7Ex3d

.. tabbed:: ch7Ex4

        .. tab:: Question

           .. activecode::  ch7Ex4q
              :language: java
              :autograde: unittest
              :practice: T

              Finish the following code so that it prints out all of the odd values in the array ``a1``. Hint: use % to check for odd values.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      int[] a1 = {0, 3, 6, 7, 9, 10};
                      for (int value : a1) 
                      {
                          // your code here
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
                      String expect = "3 7 9 ";

                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testContains()
                  {
                      boolean passed = checkCodeContains("Use % to see if value is odd", "value % 2 ");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           If the remainder of the value divided by 2 is 1 then it is odd so print it out followed by a space (to keep the values separated).

           .. activecode::  ch7Ex4a
              :language: java
              :optional:

              Solution to question above.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      int[] a1 = {0, 3, 6, 7, 9, 10};
                      for (int value : a1)
                      {
                          if (value % 2 == 1)
                          {
                              System.out.print(value + " ");
                          }
                      }
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch7Ex4d


.. tabbed:: ch7Ex5

        .. tab:: Question

           .. activecode::  ch7Ex5q
              :language: java
              :autograde: unittest
              :practice: T

              Finish the following method ``getSum`` to return the sum of all values in the passed array.
              ~~~~
              public class Test1
              {

                  public static int getSum(int[] arr) {}

                  public static void main(String[] args)
                  {
                      int[] a1 = {1, 2, 5, 3};
                      System.out.println(
                              "It should print 11 " + " and your answer is: " + getSum(a1));
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
                      String expect = "It should print 11  and your answer is: 11";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testMethod()
                  {
                      int[] nums = {10, 20, 30, 40, 50};
                      Object[] args = {nums};

                      // name of method, arguments are (nums, 30)
                      String output = getMethodOutput("getSum", args);
                      String expect = "150";

                      boolean passed = getResults(expect, output, "getSum({10, 20, 30, 40, 50})");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Declare a variable to hold the ``sum`` and initialize it to zero.  Loop through all the values in the array using a for-each loop and add each value to the ``sum``.  Return the ``sum``.

           .. activecode::  ch7Ex5a
              :language: java
              :optional:

              Solution to question above.
              ~~~~
              public class Test1
              {
                  public static int getSum(int[] arr)
                  {
                      int sum = 0;
                      for (int value : arr)
                      {
                          sum = sum + value;
                      }
                      return sum;
                  }

                  public static void main(String[] args)
                  {
                      int[] a1 = {1, 2, 5, 3};
                      System.out.println(
                              "It should print 11 " + " and your answer is: " + getSum(a1));
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch7Ex5d

.. tabbed:: ch7Ex6

        .. tab:: Question

           .. activecode::  ch7Ex6q
              :language: java
              :autograde: unittest
              :practice: T

              Finish the following method to return the sum of all of the non-negative values in the passed array.
              ~~~~
              public class Test1
              {

                  public static int getSumNonNeg(int[] arr) {}

                  public static void main(String[] args)
                  {
                      int[] a1 = {1, 2, 5, 3, -1, -20};
                      System.out.println(
                              "The code should print 11 "
                                      + "and your answer is: "
                                      + getSumNonNeg(a1));
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
                      String expect = "The code should print 11 and your answer is: 11";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testMethod()
                  {
                      int[] nums = {10, -20, 30, -40, 50};
                      Object[] args = {nums};

                      // name of method, arguments are (nums, 30)
                      String output = getMethodOutput("getSumNonNeg", args);
                      String expect = "90";

                      boolean passed = getResults(expect, output, "getSum({10, -20, 30, -40, 50})");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Declare a variable to hold the ``sum`` and initialize it to zero.  Loop through all the values in the array.  If the current value is non negative (greater than or equal to 0) then add it to the ``sum``.  Return the ``sum``.

           .. activecode::  ch7Ex6a
              :language: java
              :optional:

              Solution to question above.
              ~~~~
              public class Test1
              {

                  public static int getSumNonNeg(int[] arr)
                  {
                      int sum = 0;
                      for (int value : arr)
                      {
                          if (value >= 0)
                          {
                               sum = sum + value;
                          }
                      }
                      return sum;
                  }

                  public static void main(String[] args)
                  {
                      int[] a1 =
                      {
                          1, 2, 5, 3, -1, -20,
                      };
                      System.out.println(
                              "The code should print 11 "
                                      + "and your answer is: "
                                      + getSumNonNeg(a1));
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch7Ex6d

.. tabbed:: ch7Ex7n

        .. tab:: Question

           .. activecode::  ch7Ex7nq
              :language: java
              :autograde: unittest
              :practice: T

              Finish the following code to print the strings at the odd indices in the array.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String[] stArr1 = {"Destini", "Landon", "Anaya", "Gabby", "Evert"};
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
                      String expectNewL = "Landon\nGabby\n";
                      boolean passedNewL = getResults(expectNewL, output, "Expected output from main");
                      assertTrue(passedNewL);
                  }

                  @Test
                  public void testCodeContains()
                  {

                      boolean passed = checkCodeContains("for loop", "for");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Use a for loop and start the index at 1 and increment it by 2 each time through the loop.  Print the value at the index.

           .. activecode::  ch7Ex7na
              :language: java
              :optional:

              Solution to question above.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String[] stArr1 = {"Destini", "Landon", "Anaya", "Gabby", "Evert"};
                      for (int i = 1; i < stArr1.length; i += 2)
                      {
                          System.out.println(stArr1[i]);
                      }
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch7Ex7nd

.. tabbed:: ch7Ex8n

        .. tab:: Question

           .. activecode::  ch7Ex8nq
              :language: java
              :autograde: unittest
              :practice: T

              Finish the method ``getSumChars`` below to return the total number of characters in the array of strings ``strArr``.
              ~~~~
              public class Test1
              {

                  public static int getSumChars(String[] strArr) {}

                  public static void main(String[] args)
                  {
                      String[] strArr = {"hi", "bye", "hola"};
                      System.out.println(getSumChars(strArr));
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
                      String expect = "9";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains1()
                  {
                      boolean passed = checkCodeContains("adding length of each string", ".length()");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodecontains()
                  {
                      boolean passed = checkCodeContains("for loop", "for");
                      assertTrue(passed);
                  }

                  @Test
                  public void testMethod()
                  {
                      String[] strs = {"a", "aa", "aaa"};
                      Object[] args = {strs};

                      // name of method, arguments are (nums, 30)
                      String output = getMethodOutput("getSumChars", args);
                      String expect = "6";

                      boolean passed = getResults(expect, output, "getSumChars({\"a\",\"aa\",\"aaa\"})");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Declare the ``sum`` and initialize it to 0.  Use a for-each loop to loop through each string in the array.  Add the length of the current string to the ``sum``.  Return the ``sum``.

           .. activecode::  ch7Ex8na
              :language: java
              :optional:

              Solution to question above.
              ~~~~
              public class Test1
              {
                  public static int getSumChars(String[] strArr)
                  {
                      int sum = 0;
                      for (String str : strArr)
                      {
                          sum = sum + str.length();
                      }
                      return sum;
                  }

                  public static void main(String[] args)
                  {
                      String[] strArr = {"hi", "bye", "hola"};
                      System.out.println(getSumChars(strArr));
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch7Ex8nd

.. tabbed:: ch7Ex9n

        .. tab:: Question

           .. activecode::  ch7Ex9nq
              :language: java
              :autograde: unittest
              :practice: T

              Finish the method ``findMin`` so that it finds and returns the minimum value in the array.
              ~~~~
              public class Test1
              {

                  public static int findMin(int[] arr) 
                  {
                    
                  }

                  public static void main(String[] args)
                  {
                      int[] arr = {20, -3, 18, 55, 4};
                      System.out.println(findMin(arr));
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
                      String expect = "-3";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains2()
                  {
                      boolean passed = checkCodeContains("for loop", "for");
                      assertTrue(passed);
                  }

                  @Test
                  public void testMethod()
                  {
                      int[] nums = {10, 20, 5, 40, 50};
                      Object[] args = {nums};

                      // name of method, arguments are (nums, 30)
                      String output = getMethodOutput("findMin", args);
                      String expect = "5";

                      boolean passed = getResults(expect, output, "findMin({10, 20, 5, 40, 50})");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Declare a variable to hold the minimum value found and initialize it to the first value in the array.  Loop from 1 to the length of the array minus one and get the value at that index.  If the value is less than the minimum found so far reset the minimum found so far to the value.  Return the minimum.

           .. activecode::  ch7Ex9na
              :language: java
              :optional:

              Solution to question above.
              ~~~~
              public class Test1
              {

                  public static int findMin(int[] arr)
                  {
                      int min = arr[0];
                      int value = 0;
                      for (int i = 1; i < arr.length; i++)
                      {
                          value = arr[i];
                          if (value < min)
                          {
                              min = value;
                          }
                      }
                      return min;
                  }

                  public static void main(String[] args)
                  {
                      int[] arr = {20, -3, 18, 55, 4};
                      System.out.println(findMin(arr));
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch7Ex9nd

.. tabbed:: ch7Ex10n

        .. tab:: Question

           .. activecode::  ch7Ex10nq
              :language: java
              :autograde: unittest
              :practice: T

              Finish the method ``getAverage`` to calculate and return the average of all of the values in the array.
              ~~~~
              public class Test1
              {

                  public static double getAverage(int[] arr) {}

                  public static void main(String[] args)
                  {
                      int[] arr = {20, 3, 18, 55, 4};
                      System.out.println(getAverage(arr));
                      ;
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
                      String expect = "20.0";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains2()
                  {
                      boolean passed = checkCodeContains("for loop", "for");
                      assertTrue(passed);
                  }

                  @Test
                  public void testMethod()
                  {
                      int[] nums = {10, 20, 30, 40, 50};
                      Object[] args = {nums};

                      // name of method, arguments are (nums, 30)
                      String output = getMethodOutput("getAverage", args);
                      String expect = "30.0";

                      boolean passed = getResults(expect, output, "getAverage({10, 20, 30, 40, 50})");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Declare a variable to hold the ``total`` and it should be of type ``double`` so that the average is a ``double``.  Initialize it to 0.  Loop through all the values in the array and add each to the ``total``.  Return the ``total`` divided by the length of the array.

           .. activecode::  ch7Ex10na
              :language: java
              :optional:

              Solution to question above.
              ~~~~
              public class Test1
              {

                  public static double getAverage(int[] arr)
                  {
                      double total = 0;
                      for (int value : arr)
                      {
                          total = total + value;
                      }
                      return total / arr.length;
                  }

                  public static void main(String[] args)
                  {
                      int[] arr = {20, 3, 18, 55, 4};
                      System.out.println(getAverage(arr));
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch7Ex10nd


More Practice
---------------

For practice with simple array manipulation and conditionals, but no loops see http://codingbat.com/java/Array-1.
For more practice with loops and arrays go to http://codingbat.com/java/Array-2.

Here are problems without loops

* http://codingbat.com/prob/p167011
* http://codingbat.com/prob/p191991
* http://codingbat.com/prob/p146256
* http://codingbat.com/prob/p199519
* http://codingbat.com/prob/p109537

Here are problems with loops

* http://codingbat.com/prob/p180920
* http://codingbat.com/prob/p104627
* http://codingbat.com/prob/p199612
* http://codingbat.com/prob/p105031
* http://codingbat.com/prob/p100246
