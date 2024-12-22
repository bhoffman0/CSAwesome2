.. qnum::
   :prefix: 2-26-
   :start: 1

Unit 2 Test
==============

The following questions are similar to what you might see on the AP CSA exam.  You may only take this test once while logged in. There are no time limits, but it will keep track of how much time you take. Click on the finish button after you have answered all the questions, and the number correct and feedback on the answers will be displayed.

We estimate that a score of about 50% on this test would correspond to the passing grade of 3 on the AP exam, a score of 65% to a 4, and a score of 80% and above to a 5 on the AP exam. These are just estimates and may not correspond to individual scores.


.. timed:: unit2-test

     .. mchoice:: u2_1
        :random:
        :answer_a: I only
        :answer_b: I and II only
        :answer_c: III only
        :answer_d: IV and V only
        :answer_e: V only
        :correct: a
        :feedback_a: Correct! This will loop with i changing from 1 to 5 and then for each i, j will loop from i to 0 printing the value of i and then a new line.
        :feedback_b: II will loop i from 0 to 4 and j from 0 to i, neglecting to ouput 5.
        :feedback_c: III will loop with i changing from 1 to 4 and j from i to 0.
        :feedback_d: IV will loop with i changing from 1 to 5 and j from 0 to i but it will print each value on a different line.
        :feedback_e: V will loop with i changing from 0 to 4 and j from 0 to i.

        Which of the following code segments will produce the displayed output?

        .. code-block:: java

           /* Output:
           1
           22
           333
           4444
           55555
           */

           //Loop I
           for (int i = 1; i <= 5; i++)
           {
              for (int j = i; j > 0; j--)
              {
                 System.out.print(i);
              }
              System.out.println();
           }

           //Loop II
           for (int i = 0; i < 5; i++)
           {
              for (int j = 0; j < i; j++)
              {
                 System.out.print(i);
              }
              System.out.println();
           }

           //Loop III
           for (int i = 1; i < 5; i++)
           {
              for (int j = i; j > 0; j--)
              {
                 System.out.print(i);
              }
              System.out.println();
           }

           //Loop IV
           for (int i = 1; i < 6; i++)
           {
              for (int j = 0; j < i; j++)
              {
                 System.out.println(i);
              }
           }

           //Loop V
           for (int i = 0; i < 5; i++) {
              for (int j = 0; j < i; j++) {
                 System.out.print(i+1);
              }
              System.out.println();
           }

     .. mchoice:: u2_2
        :random:
        :answer_a: A
        :answer_b: AC
        :answer_c: C
        :answer_d: BD
        :answer_e: E
        :correct: c
        :feedback_a: num2 is negative
        :feedback_b: Only one letter will be printed.
        :feedback_c: Correct because num2 is negative and an or is used.
        :feedback_d: Only one letter will be printed.
        :feedback_e: One of the other conditions is true.

        Consider the following method.  What is the output from ``conditionTest(3,-2);``?

        .. code-block:: java

           public static void conditionTest(int num1, int num2)
           {
              if ((num1 > 0) && (num2 > 0))
              {
                 if (num1 > num2)
                    System.out.println("A");
                 else
                    System.out.println("B");
              }
              else if ((num2 < 0) || (num1 < 0))
              {
                 System.out.println("C");
              }
              else if (num2 < 0)
              {
                 System.out.println("D");
              }
              else
              {
                 System.out.println("E");
              }
           }

     .. mchoice:: u2_3
        :random:
        :answer_a: I only
        :answer_b: II only
        :answer_c: II and III only
        :answer_d: I and II only
        :answer_e: I, II, and III
        :correct: d
        :feedback_a: Loop I will produce this output, but it is not the only loop that will output these values.
        :feedback_b: Loop II will produce this output, but it is not the only loop that will output these values.
        :feedback_c: Loop II is correct, but loop III will produce the reverse output, 43210.
        :feedback_d: Correct! Both of these loops will produce the correct output.
        :feedback_e: While loop I and II will produce the correct output, loop III will actually produce the reverse of the correct output.

        Which of these loops will output ``01234``?

        .. code-block:: java

           int max = 5;

           //Loop I
           for (int i = 0; i < max; i++)
           {
              System.out.print(i);
           }

           //Loop II
           int j = 0;
           while (j < max)
           {
              System.out.print(j);
              j++;
           }

           //Loop III
           int k = 0;
           for (int i = max; i > 0; i--)
           {
              System.out.print(i);
           }

     .. mchoice:: u2_4
        :random:
        :answer_a: 25
        :answer_b: 15
        :answer_c: 125
        :answer_d: 64
        :answer_e: 625
        :correct: c
        :feedback_a: This would be the correct answer if there were only two loops nested, but there are three. Try again!
        :feedback_b: Take a look at how many times each inner loop will execute every time the outer loop runs.
        :feedback_c: Correct!
        :feedback_d: Try again - check the difference between <= and < in each loop.
        :feedback_e: If you got this value you probably made one extra call to the each of the loops, notice that the loops start at 1 and not 0.

        Consider the following block of code. What value is returned from ``solution(5)``?

        .. code-block:: java

           public int solution(int limit)
           {
              int s = 0;
              for (int outside = 1; outside <= limit; outside++)
              {
                 for (int middle = 1; middle <= limit; middle++)
                 {
                    for (int inside = 1; inside <= limit; inside++)
                    {
                       s++;
                    }
                 }
              }
             return s;
           }

     .. mchoice:: u2_5
        :random:
        :answer_a: (x < 10) && (x > 5)
        :answer_b: (x > 10) && (x <=5)
        :answer_c: (x <= 10) && (x > 5)
        :answer_d: (x <= 10) || (x > 5)
        :answer_e: (x > 10) || (x <= 5)
        :correct: d
        :feedback_a: Use A and B to represent the expressions -- A becomes (x > 10), B becomes (x <= 5). ! (A && B) is NOT equivalent to (!A && !B).
        :feedback_b: Use A and B to represent the expressions -- A becomes (x > 10), B becomes (x <= 5). ! (A && B) is NOT equivalent to (A && B).
        :feedback_c: Use A and B to represent the expressions -- A becomes (x > 10), B becomes (x <= 5). ! (A && B) is NOT equivalent to (!A && !B). The AND should be changed to an OR.
        :feedback_d: Correct!
        :feedback_e: Use A and B to represent the expressions -- A becomes (x > 10), B becomes (x <= 5). ! (A && B) is NOT equivalent to (A || B). Both A and B should also be negated.

        Which of the following is equivalent to !((x > 10) && (x <= 5)) ?

     .. mchoice:: u2_6
        :random:
        :answer_a: s="rainbow"; b=8;
        :answer_b: s="rain";  b=8;
        :answer_c: s="rainbow"; b=4;
        :answer_d: s="rain"; b=4;
        :answer_e: s="bow";  b=4;
        :correct: d
        :feedback_a: Strings are immutable so changing str doesn't affect the string that s refers to.
        :feedback_b: Nothing done in the method test affects the value of b.
        :feedback_c: Strings are immutable so changing str doesn't affect the string that s refers to.
        :feedback_d: Correct!
        :feedback_e: All changes to string s result in a new string object.


        Consider the following class with the method ``test``. What is the output after the main method is executed calling ``test(s,b)``?

        .. code-block:: java

           public class Test1
           {
               public static void test(String str, int y)
               {
                   str = str + "bow";
                   y = y * 2;
               }

               public static void main(String[] args)
               {
                   String s = "rain";
                   int b = 4;
                   test(s, b);
                   System.out.println("s=" + s + "; b=" + b);
               }
           }

     .. mchoice:: u2_7
        :random:
        :answer_a: var1 = 0, var2 = 2
        :answer_b: var1 = 1, var2 = 1
        :answer_c: var1 = 3, var2 = -1
        :answer_d: var1 = 2, var2 = 0
        :answer_e: The loop won't finish executing because of a division by zero.
        :correct: d
        :feedback_a: This would be true if the body of the while loop never executed. This would have happened if the while check was if var1 != 0 instead of var2 != 0
        :feedback_b: This would be true if the body of the while loop only execued one time, but it executes twice.
        :feedback_c: This would be true if the body of the while loop executed three times, but it executes twice.
        :feedback_d: Correct!
        :feedback_e: 0/2 won't cause a division by zero. The result is just zero.

        What are the values of ``var1`` and ``var2`` after the following code segment is executed and the while loop finishes?

        .. code-block:: java

           int var1 = 0;
           int var2 = 2;
           while ((var2 != 0) && ((var1 / var2) >= 0))
           {
              var1 = var1 + 1;
              var2 = var2 - 1;
           }

     .. mchoice:: u2_8
        :random:
        :answer_a: 5 4 3 2 1
        :answer_b: -5 -4 -3 -2 -1
        :answer_c: -4 -3 -2 -1 0
        :answer_d: -5 -4 -3 -2 -1 0
        :answer_e: -4 -3 -2 -1
        :correct: c
        :feedback_a: x is initialized (set) to -5 to start and incremented (x++) before the print statement executes.
        :feedback_b: x is incremented (x++) from -5 before the print statement executes.
        :feedback_c: Correct!
        :feedback_d: x is incremented (x++) from -5 before the print statement executes.
        :feedback_e: 0 is printed out the last time through the loop when x is -1 and is incremented.

        What does the following code print?

        .. code-block:: java

           int x = -5;
           while (x < 0)
           {
              x++;
              System.out.print(x + " ");
           }

     .. mchoice:: u2_9
        :random:
        :answer_a: 0 3 6 9 12
        :answer_b: 0 1 2 3 4 5
        :answer_c: 1 4 7 10 13
        :answer_d: 0 3 6 9 12 15
        :answer_e: This code will not print anything.
        :correct: d
        :feedback_a: It would also print 15.
        :feedback_b: The conditional would only match multiples of three.
        :feedback_c: The conditional would only match multiples of three.
        :feedback_d: Yes, the multiples of 3 from 0 to 15.
        :feedback_e: This code would print the multiples of 3.

        What will be printed after this code is executed?

        .. code-block:: java

           for (int i = 0; i <= 15; i++)
           {
              if (i % 3 == 0)
              {
                 System.out.print(i + " ");
              }
           }

     .. mchoice:: u2_10
        :random:
        :answer_a: !(a && b)
        :answer_b: !a && b
        :answer_c: !a && !b
        :answer_d: a && b
        :answer_e: a || !b
        :correct: c
        :feedback_a: This would be true in any case where a and b weren't both true
        :feedback_b: If b was false, this option would be false.
        :feedback_c: Correct!
        :feedback_d: This will only be true only when both a and b are true.
        :feedback_e: This will only be true if a is true, or b is false.

        Which option will evaluate to true, if and only if both a and b are false?

     .. mchoice:: u2_11
        :random:
        :answer_a: "Hello World!"
        :answer_b: "Hello "
        :answer_c: "He"
        :answer_d: "HloWrd"
        :answer_e: "el ol!"
        :correct: d
        :feedback_a: The variable holds all characters that were stored at even indices for the original phrase.
        :feedback_b: The variable holds all characters that were stored at even indices for the original phrase.
        :feedback_c: The variable holds all characters that were stored at even indices for the original phrase.
        :feedback_d: Correct! The variable holds all characters that were stored at even indices for the original phrase.
        :feedback_e: The variable holds all characters that were stored at even indices for the original phrase.

        After the following code is executed, what does the variable ``mystery`` hold?

        .. code-block:: java

           public class Mysterious
           {
               public static void main(String[] args)
               {
                   String mystery = "";
                   String starter = "Hello World!";
                   for (int i = 0; i < starter.length(); i++)
                   {
                       if (i % 2 == 0)
                       {
                           mystery += starter.substring(i, i + 1);
                       }
                   }
               }
           }

     .. mchoice:: u2_12
        :random:
        :answer_a: a = 6 and b = 7
        :answer_b: a = 6 and b = 13
        :answer_c: a = 13 and b = 0
        :answer_d: a = 6 and b = 0
        :answer_e: a = 0 and b = 13
        :correct: c
        :feedback_a: This would be true if the loop stopped when i was equal to 6. Try again!
        :feedback_b: Take another look at how a and b change in each iteration of the loop.
        :feedback_c: Correct!
        :feedback_d: Almost there! b = 0, but take another look at how a changes in each iteration of the loop.
        :feedback_e: Take another look at how a and b change within each iteration of the loop. You are close!

        What are the values of ``a`` and ``b`` after the ``for`` loop finishes?

        .. code-block:: java

           int a = 10, b = 3, t = 0;
           for (int i = 1; i <= 6; i++)
           {
              t = a;
              a = i + b;
              b = t - i;
           }

     .. mchoice:: u2_13
        :random:
        :answer_a: hi there
        :answer_b: HI THERE
        :answer_c: Hi There
        :answer_d: null
        :answer_e: hI tHERE
        :correct: c
        :feedback_a: Strings are immutable and so any change to a string returns a new string.
        :feedback_b: Strings are immutable and so any change to a string returns a new string.
        :feedback_c: Correct!
        :feedback_d: Strings are immutable and so any changes to a string returns a new string.
        :feedback_e: Strings are immutable and so any changes to a string returns a new string.

        Consider the following code.  What string is referenced by ``s1`` after the code executes?

        .. code-block:: java

           String s1 = "Hi There";
           String s2 = s1;
           String s3 = s2;
           String s4 = s1;
           s2 = s2.toLowerCase();
           s3 = s3.toUpperCase();
           s4 = null;

     .. mchoice:: u2_14
        :random:
        :answer_a: a = 6.7
        :answer_b: b = 87.7
        :answer_c: 12 = c * b
        :answer_d: c = a - b
        :correct: d
        :feedback_a: Check the data type of a.
        :feedback_b: Check the data type of b.
        :feedback_c: Assignment statements must have a variable on the left.
        :feedback_d: Correct!

        Given following code, which of the following statements is a valid assignment statement using these variables?

        .. code-block:: java

           int a = 5;
           int b = 3;
           int c = 4;

