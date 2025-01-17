.. qnum::
   :prefix: 1-
   :start: 1



Teacher PD Pretest 
---------------------------------

Please try the following pretest. We don't expect you to know the answers to these questions at all yet! So don't worry about it if you don't know the answers. It is fine to pick the "I don't know" answer option. You will take the same test at the end of the PD and see the answers after that. We hope that everyone will see a big improvement!


.. timed:: teacherPD-pretest
     :nofeedback:

     .. mchoice:: PDpretest1
          :random:

          Unit 1 Output:

          - Practice 3.D: Explain why a code segment will not compile or work as intended.

          - LO 1.3.A: Develop code to generate output and determine the result that would be displayed

          Consider the following code segment.

          .. code-block:: java
               :linenos:

               System.out.print(Take all the courses in your curriculum.);
               System.out.println(Ask questions.);
               System.out.println(--Katherine Johnson);

          The code segment is intended to produce the following output but does not work as intended.

          .. code-block:: java

               Take all the courses in your curriculum. Ask questions.
               --Katherine Johnson

          Which changes should be made so that the code segment produces the intended output?

          .. code-block:: java

            I.   In line 1, print should be changed to println.
            II.  In lines 1, 2, and 3, print should be capitalized.
            III. In lines 1, 2, and 3, the text inside the parentheses should be in quotation marks.

          - I only

            - print is correct since a new line is not printed after the first line of output.

          - II only

            - Only class names like System are capitalized.

          - III only

            + Correct.

          - I and II

            - I and II are not correct.

          - I and III

            - print is correct since a new line is not printed after the first line of output.

          - I don't know this yet

            - That's okay. You will learn debugging skills in the PD.


     .. mchoice:: PDpretest2

          Unit 1 Expressions:

          - LO 1.3.C Develop code for arithmetic expressions and determine the result of these expressions.

          - LO 1.4.A Develop code for assignment statements with expressions and determine the value that is stored in the variable as a result of these statements.

          - Practice 3.A: Determine the result or output based on statement execution order in an algorithm.

          Consider the following code segment:

          .. code-block:: java

               int x = 16;
               double y = 8.0;
               int z = 2;
               x = x / 5;
               y += x;
               y = y * z;

          What is the value in variable y when the code segment is executed?

          - 2

            -

          - 8

            -

          - 11

            -

          - 22.0

            +

          - 22.4

            -

          - I don't know this yet.

            -

     .. mchoice:: PDpretest3
        :random:
        
        Unit 1 Objects & Constructors:

        - Practice 2.B: Write program code involving data abstractions.

        - LO 1.13.C Develop code to create an object by calling a constructor.

        Consider the following code segment.

        .. code-block:: java

                 public class Party
                 {
                     private int numInvited;
                     private boolean partyCancelled;

                     public Party()
                     {
                         numInvited = 1;
                         partyCancelled = false;
                     }

                     public Party(int invites)
                     {
                         numInvited = invites;
                         partyCancelled = false;
                     }
                 }

        Which of the following code segments, when placed in a method in a class other than the Party class, correctly creates a new object of the Party class with 20 people invited?

        .. code-block:: java

           I.   Party myParty.numInvited = 20;
           II.  Party ourParty = new Party(20);
           III. Party otherParty = new Party();
                otherParty.numInvited = 20;


        - I only

          -

        - II only

          +

        - III only

          -

        - II and III

          -

        - I, II, and III

          -

        - I don't know this yet.

          -


     .. mchoice:: PDpretest4
        :random:

        Unit 1 Methods:

        - LO 1.14.A Develop code to call instance methods and determine the result of these calls.
        - LO 1.12.A: Explain the relationship between a class and an object.

        Consider the following class.

        .. code-block:: java

                 public class Liquid
                 {
                     private double freezingPoint;
                     private double currentTemp;

                     public Liquid()
                     {
                         freezingPoint = 0;
                         currentTemp = 0;
                     }

                     public void lowerTemp(double degrees)
                     {
                         currentTemp -= degrees;
                     }

                     public void raiseTemp(double degrees)
                     {
                         currentTemp += degrees;
                     }

                     void freeze()
                     {
                         currentTemp = freezingPoint;
                     }
                 }

        Assume that the following Liquid object has been declared.

        .. code-block:: java

           Liquid liquid = new Liquid();

        Which of the following statements is valid?

        - Liquid.freezingPoint;

          -

        - liquid.currentTemp();

          -

        - liquid.lowerTemp();

          -

        - liquid.raiseTemp(10);

          +

        - liquid.freeze(10)

          -

        - I don't know this yet.

          -


     .. mchoice:: PDpretest5
          :random:

          Unit 2 Selection:

          - LO 2.2.A: Develop code to create Boolean expressions with relational operators and determine the result of these expressions.

          - Practice 3.A: Determine the result or output based on statement execution order in an algorithm.

          Consider the following code segment. Assume boolean variables p and q have been initialized.

          .. code-block:: java

               if (!p || q)
               {
                 System.out.print("winner");
               }

          For what values of p and q will "winner" be printed?

          - "winner" will be printed when p is false, regardless of the value of q.

            +

          - "winner" will be printed when q is false, regardless of the value of p.

            -

          - "winner" will be printed only when p is false and q is true.

            -

          - "winner" will always be printed.

            -

          - "winner" will never be printed.

            -

          - I don't know this yet.

            -

     .. mchoice:: PDpretest6
          :random:

          Unit 2 Selection:

          - LO 2.3.A Develop code to represent branching logical processes by using selection statements and determine the result of these processes.
          - LO 2.4.A Develop code to represent nested branching logical processes and determine the result of these processes.

          Consider the following code segment.

          .. code-block:: java

               int a = 100;
               int b = 90;
               if (a >= 100)
               {
                  if (b > 100)
                  {
                     System.out.print("go ");
                  }
                  else if (b > 90)
                  {
                    System.out.print("it ");
                  }
                  else
                  {
                     System.out.print("up ");
                  }
               }
               System.out.print("on ");

          What is printed when the code segment above is executed?

          - go on

            -

          - it up on

            -

          - it on

            -

          - up on

            +

          - on

            -

          - I don't know this yet.

            -


     .. mchoice:: PDpretest7
          :random:

          Unit 2 Loops:

          - LO 2.8.A Develop code to represent iterative processes using for loops and determine the result of these processes.

          Complete the loop below by filling in the missing code. The loop should calculate the number of leap years between the variables year1 and year2, inclusive, using a helper method isLeapYear(year) which returns true if year is a leap year and false otherwise.

          .. code-block:: java

                int year1 = 2000;
                int year2 = 2020;
                int count = 0;

                /* Missing Code */
                {
                      if (isLeapYear(y))
                          count++;
                }


          - for (int year1 = 2000; int year2 = 2020; count++)

            -

          - for (int y = year2 - year1; y < year2; y++)

            -

          - for (int y = year1; y <= year2; y++)

            +

          - for (int year1 = 2000; year1 < year2; year1++)

            -

          - for (int year1; year2; count++)

            -

          - I don't know this yet.

            -


     .. mchoice:: PDpretest8
          :random:

          Unit 4 Loops and Strings:

          - LO 2.10.A Develop code for standard and original algorithms that involve strings and determine the result of these algorithms.

          Consider the following method.

          .. code-block:: java

               public static String changeStr(String str)
               {
                    String result = "";
                    for (int i = 1; i < str.length() - 1; i += 2)
                    {
                         result += str.substring(i, i + 1);
                    }
                    return result;
               }

          What value is returned as a result of the method call **changeStr("ABCDE")**?

          - "ABCDE"

            -

          - "BCDE"

            -

          - "AC"

            -

          - "BD"

            +

          - "ACE"

            -

          - I don't know this yet.

            -

     .. mchoice:: PDpretest9
          :random:

          Unit 3 Class Creation:

          - LO 3.3.A Develop code to designate access and visibility constraints to classes, data, constructors, and methods.
          - LO 3.4.A Develop code to declare instance variables for the attributestobeinitializedin the body of the constructors of a class.

          Consider the following class Cat:

          .. code-block:: java

               public class Cat
               {
                   /* missing code */
               }

          Which of the following replacements for the missing code is the most appropriate implementation of a class Cat which contains attributes for the cat’s name and age and a constructor?

          - .. code-block:: java

               public String name;
               public int age;
               public Cat(String name, int age)
               {
                 name = name;
                 age = age;
               }

            -

          - .. code-block:: java

               private String name;
               private int age;
               public Cat(String n, int a)
               {
                 name = n;
                 age = a;
               }

            +

          - .. code-block:: java

               public String name;
               public int age;
               public Cat(String n, int a)
               {
                 name = n;
                 age = a;
               }

            -

          - .. code-block:: java

               private String name;
               private int age;
               public Cat(String n, int a)
               {
                 n = name;
                 a = age;
               }

            -

          - .. code-block:: java

               public String name;
               public int age;
               public Cat(String n, int a)
               {
                 n = name;
                 a = age;
               }

            -

          - I don't know this yet.

            -

     .. mchoice:: PDpretest10
          :random:

          Unit 3 Class Creation:

          - LO 3.5.A Develop code to define behaviors of an object through methods written in a class using primitive values and determine the result of calling these methods.

          Which of the following is the most appropriate header for a method that would set the value of the private instance variable y?

          - private int setY(int value)

            -

          - private void setY()

            -

          - public int setY()

            -

          - public void setY()

            -

          - public void setY(int value)

            +

          - I don't know this yet.

            -


     .. mchoice:: PDpretest11
          :random:

          Unit 3 Class Creation: 

          - Practice 3.C: Determine the result or output based on code that contains procedural abstractions. 
          - Practice 3.D: Explain why a code segment will not compile or work as intended and modify the code to correct the error.
          - LO 3.5.A Develop code to define behaviors of an object through methods written in a class using primitive values and determine the result of calling these methods.

          Consider the following class definition. The class does not compile.

          .. code-block:: java

               public class Student
               {
                   private int id;

                   public void getId()
                   {
                       return id;
                   }
               }

          The accessor method getId is intended to return the id of a Student object. Which of the following best explains why the class does not compile?

          - The getId method should be declared as private.

            -

          - The getId method should have a parameter.

            -

          - The getId method should not return a value.

            -

          - The getId method should not have a return type.

            -

          - The getId method should have int as its return type.

            +

          - I don't know this yet.

            -


     .. mchoice:: PDpretest12
          :random:

          Unit 4 Arrays:

          - LO 4.3.A Develop code used to represent collections of relateddatausingonedimensional (1D) array objects.
          - LO 4.4.A Develop code used to traverse the elements in a 1D array and determine the result of these traversals.

          Consider an integer array which has been declared and initialized with one or more integer values such as:

          .. code-block:: java

               int[] array =  { 10, 20, 30 };

          Which of the following code segments doubles all the values in the array?

          .. code-block:: java

               I. int i = 0;
                  while (i < array.length)
                  {
                      array[i] *= 2;
                  }
               II. for (int i = 0; i < array.length; i++)
                   {
                       array[i] *= 2;
                   }
               III. for (int i = 1; i <= array.length; i++)
                    {
                         array[i] *= 2;
                    }

          - I only

            -

          - II only

            +

          - III only

            -

          - I and II only

            -

          - I, II, and III

            -

          - I don't know this yet.

            -

     .. mchoice:: PDpretest13
          :random:

          Unit 4 Arrays:

          - LO 4.4.A Develop code used to traverse the elements in a 1D array and determine the result of these traversals.
          - LO 4.5.A Develop code for standard and original algorithms for a particular context or specification that involves arrays and determine the result of these algorithms.

          Consider the following method. Which of the following statements best describes when it returns true?

          .. code-block:: java

               public boolean mystery(int array[], int value)
               {
                    boolean temp = false;
                    for (int i = 0; i < array.length; i++)
                    {
                       temp = (array[i] == value);
                    }
                    return temp;
               }

          - Whenever the first element in array is equal to value

            -

          - Whenever array contains any element which equals value

            -

          - Whenever the last element in array is equal to value

            +

          - Whenever more than 1 element in array is equal to value

            -

          - Whenever exactly 1 element in array is equal to value

            -

          - I don't know this yet.

            -

