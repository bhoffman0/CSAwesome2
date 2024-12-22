.. qnum::
   :prefix: 3-14-
   :start: 1

Unit 3 Test
===================

The following questions are similar to what you might see on the AP CSA exam.  You may only take this test once while logged in. There are no time limits, but it will keep track of how much time you take. Click on the finish button after you have answered all the questions, and the number correct and feedback on the answers will be displayed.

We estimate that a score of about 50% on this test would correspond to the passing grade of 3 on the AP exam, a score of 65% to a 4, and a score of 80% and above to a 5 on the AP exam. These are just estimates and may not correspond to individual scores.


.. timed:: unit3-test

     .. mchoice:: u3_1
        :random:
        :answer_a: The ``getAge()`` method should be declared as private.
        :answer_b: The return type of the ``getAge()`` method should be void.
        :answer_c: The ``getAge()`` method should have at least one parameter.
        :answer_d: The variable ``age`` is not declared inside the ``getAge()`` method.
        :answer_e: The instance variable ``age`` should be returned instead of a, which is local to the constructor.
        :correct: e
        :feedback_a: The method should be public so it can be accessed outside of the class.
        :feedback_b: The method's return type should be int.
        :feedback_c: The getAge method should not take any parameters.
        :feedback_d: This is an instance variable and should be declared outside of the method.
        :feedback_e: Correct! The accessor method getAge should return the instance variable age.

        Consider the following ``Cat`` class that has an ``age`` attribute of type int. The ``getAge`` method is intended to allow methods in other classes to access a Cat object’s age value; however, it does not work as intended. Which of the following best explains why the ``getAge`` method does NOT work as intended?

        .. code-block:: java

           public class Cat
           {
               private int age;

               public Cat(int a)
               {
                   age = a;
               }

               public int getAge()
               {
                   return a;
               }
           }

     .. mchoice:: u3_2
        :random:
        :answer_a: I only
        :answer_b: I and II only
        :answer_c: I and III only
        :answer_d: I, II, and III
        :answer_e: II and III only
        :correct: d
        :feedback_a: It's true that the local variables can be declared in the body of constructors and methods, but there are other options that are also true about local variables.
        :feedback_b: Both I and II are true but III is also true regarding local variables.
        :feedback_c: Both I and III are true but II is also true regarding local variables.
        :feedback_d: Correct! All of the above are true.
        :feedback_e: Both of these are true but I is also true.

        Which of the following statements are TRUE about local variables?

        I.   Local variables can be declared in the body of constructors and methods.

        II.  Local variables may only be used within the constructor or method and cannot be declared to be public or private.

        III. When there is a local variable with the same name as an instance variable, the variable name will refer to the local variable instead of the instance variable.

     .. mchoice:: u3_3
        :random:
        :answer_a: I and II only
        :answer_b: I, II, and III
        :answer_c: I and III only
        :answer_d: I only
        :answer_e: III only
        :correct: c
        :feedback_a: Static methods cannot acccess instance variables. They can only access static variables.
        :feedback_b: Static methods cannot acccess instance variables. They can only access static variables.
        :feedback_c: Correct! I and III are true, but static methods cannot acccess instance variables. They can only access static variables.
        :feedback_d: I is true, but there is another option that is true too.
        :feedback_e: III is true, but there is another option that is true too.

        Which of the following statements are TRUE about **static** methods?

        I.   Static methods and variables include the keyword static before their name in the header or declaration and can be public or private.

        II.  Static methods can access or change the values of instance variables.

        III.  Static methods are associated with the class, not objects of the class.

     .. mchoice:: u3_4
        :random:
        :answer_a: I only
        :answer_b: II only
        :answer_c: IV only
        :answer_d: II and III
        :answer_e: I, II, and III
        :correct: d
        :feedback_a: This implementation of ``addMinutes`` does not account for values of additionMinutes that push the minute count above 60.
        :feedback_b: Implementation II works, but implementation III also works.
        :feedback_c: Implementation IV does not work for situations where additionMinutes + minutes does not go above 60.
        :feedback_d: Correct!
        :feedback_e: Implementations II and III are correct, but implementation I is not. Implementation I does not account for values of additionMinutes that push the minute account above 60.

        Consider the following declaration for a class that will be used to represent points in time.  Which of these options correctly implement ``addMinutes()``?

        .. code-block:: java

           public class Timer
           {
              private int hours; // number of hours
              private int minutes; // 0 <= minutes < 60

              void addHours(int addition)
              {
                 hours = hours + addition;
              }

              /** addMinutes adds the given argument to the time stored in hours and minutes.
              The argument additionMinutes is between 0 and 119.  **/
              void addMinutes(int additionMinutes)
              {
                 // implementation not shown
              }

              // ... other methods not shown
           }


           //Proposed Implementations:
           I.   public void addMinutes(int additionMinutes)
                {
                    minutes = minutes + additionMinutes;
                }
           II.  public void addMinutes(int additionMinutes)
                {
                    minutes += additionMinutes;
                    if (minutes >= 60)
                    {
                       hours += minutes / 60;
                       minutes = minutes % 60;
                    }
                }
           III. public void addMinutes(int additionMinutes)
                {
                    minutes += additionMinutes;
                    while (minutes >= 60)
                    {
                       hours++;
                       minutes -= 60;
                    }
                }
           IV.  public void addMinutes(int additionMinutes)
                {
                    if (additionMinutes + minutes >= 60)
                    {
                       minutes = additionMinutes + minutes - 60;
                       hours += 1;
                    }
                }

     .. mchoice:: u3_5
        :random:
        :answer_a: Prints the string in reverse order
        :answer_b: Deletes the second half of the string
        :answer_c: Prints string normally
        :answer_d: Compile-time error occurs
        :answer_e: Prints alternating characters from beginning and end of the string.
        :correct: a
        :feedback_a: Correct! This method prints the reversed string.
        :feedback_b: Incorrect, this method prints the parameter reversed.
        :feedback_c: Incorrect, this method prints the parameter reversed.
        :feedback_d: Incorrect, this method prints the parameter reversed.
        :feedback_e: Incorrect, this method prints the parameter reversed.

        What does the method ``mystery`` do?

        .. code-block:: java

           public void mystery(String tester)
           {
              for (int i = tester.length() - 1; i >= 0; i--)
              {
                 System.out.print(tester.substring(i,i+1));
              }
              System.out.println("");
           }

     .. mchoice:: u3_6
        :random:
        :answer_a: I only
        :answer_b: I and II
        :answer_c: II only
        :answer_d: II and III
        :answer_e: I, II, and III
        :correct: c
        :feedback_a: I contains incorrect syntax. Try again!
        :feedback_b: I contains incorrect syntax. Try again!
        :feedback_c: Correct! II is the only correct option.
        :feedback_d: III is incorrect due to a problem with the constructor argument. Try again!
        :feedback_e: Two of these options are incorrect. Take a closer look at the syntax of I and parameters of III.

        Which of the following code segments correctly creates an instance of a new ``Party`` object?

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

           I.   Party myParty;
           II.  int classSize = 20;
                Party ourParty = new Party(classSize);
           III. int numOfFriends = 6;
                Party yourParty = new Party(numOfFriends + 3.0);

     .. mchoice:: u3_7
         :random:
         :practice: T

         Consider the following class, which uses the instance variable dollars to represent the money in a wallet in dollars.

         .. code-block:: java

            public class Wallet
            {
                  private double dollars;

                  public double putMoneyInWallet(int amount)
                  {
                     /* missing code */
                  }
            }

         The putMoneyInWallet method is intended to increase the dollars in the wallet by the parameter amount and then return the updated dollars in the wallet. Which of the following code segments should replace  *missing code* so that the putMoneyInWallet method will work as intended?

         - .. code-block:: java

             amount += dollars;
             return dollars;

           - dollars should be incremented by amount.

         - .. code-block:: java

             dollars = amount;
             return amount;

           - dollars should be incremented by amount.

         - .. code-block:: java

             dollars += amount;
             return dollars;

           + Correct.

         - .. code-block:: java

             dollars = dollars + amount;
             return amount;

           - amount is returned instead of dollars.

         - .. code-block:: java

             amount = dollars + amount;
             return dollars;

           - dollars should be incremented by amount.

     .. mchoice:: u3_8
         :random:
         :practice: T

         Consider the Liquid class below.

         .. code-block:: java

            public class Liquid
            {
                  private int currentTemp;
                  private int boilingPoint;

                  public Liquid(int ct, int bp)
                  {
                     currentTemp = ct;
                     boilingPoint = bp;
                  }

                  public boolean isBoiling(int amount)
                  {
                     /* missing code */
                  }
            }

         The isBoiling method is intended to return true if increasing the currentTemp by the parameter amount is greater than or equal to the boilingPoint, or otherwise return false. Which of the following code segments can replace *missing code* to ensure that the isBoiling method works as intended?

         .. code-block:: java

            I.   if (currentTemp + amount < boilingPoint)
                  {
                     return false;
                  }
                  else
                  {
                     return true;
                  }
            II.  if (amount > currentTemp)
                  {
                     return false;
                  }
                  else
                  {
                     return currentTemp;
                  }
            III. if (amount + currentTemp >= boilingPoint)
                  {
                     return true;
                  }
                  else
                  {
                     return false;
                  }

         - I only

           - I would work but it is not the only code that would work.

         - II only

           - II does not check against the boilingPoint and does not return only boolean values.

         - III only

           - III would work but it is not the only code that would work.

         - I and III only.

           + Correct!

         - I, II, III

           - II does not check against the boilingPoint and does not return only boolean values.

     .. mchoice:: u3_9
        :random:
        :practice: T

        Consider the following class definition.

        .. code-block:: java

            public class Liquid
            {
                private int currentTemp;
                private int boilingPoint;

                public Liquid(int ct, int bp)
                {
                    currentTemp = ct;
                    boilingPoint = bp;
                }

                public void changeTemp(int newTemp)
                {
                    currentTemp = newTemp;
                }

                public void increaseTemp(int howMuch)
                {
                    currentTemp = newTemp + howMuch;
                }
            }

        Which of the following best explains why the class will not compile?

        - The class is missing an accessor method.

          - The class does not necessarily need an accessor method.

        - The instance variables currentTemp and boilingPoint should be  public instead of private.

          - Instance variables are usually private.

        - The Liquid constructor needs a return type.

          - Constructors do not have return types.

        - The Liquid class is missing a constructor.

          - The class includes a constructor.

        - The variable newTemp is not defined in the increaseTemp method.

          + Correct! newTemp is defined in a different method. The instance variable currentTemp should be used instead.

     .. mchoice:: u3_10
        :practice: T
        :random:
        :answer_a: The private variables boxesOfFood and numOfPeople are not properly initialized.
        :answer_b: The private variables boxesOfFood and numOfPeople should have been declared public.
        :answer_c: The public method getBoxesOfFood should have been declared private.
        :answer_d: The variable updatedAmountOfFood in the eatFood method is not declared in this method.
        :answer_e: The variables boxesOfFood and numOfPeople in the updatedAmountOfFood method are local variables.
        :correct: d
        :feedback_a: The private variables boxesOfFood and numOfPeople are initialized by the constructor.
        :feedback_b: Instance variables are usually private.
        :feedback_c: Methods are usually public.
        :feedback_d: The variable updatedAmountOfFood in the eatFood method is not declared in this method. It could be replaced by the boxesOfFood instance variable.
        :feedback_e: The variables boxesOfFood and numOfPeople are instance variables.

        Consider the following class definition for Party.  The following code segment appears in a method in a class other than Party. The code segment is intended to print the value 30, but does not print the correct value because of an error in the Party class. Which of the following best explains why the correct value isn’t printed?

        .. code-block:: java

            Party p = new Party(20, 15);
            p.orderMoreFood(20);
            p.eatFood(5);
            System.out.println(p.getBoxesOfFood());

            public class Party
            {
                private int boxesOfFood;
                private int numOfPeople;

                public Party(int people, int foodBoxes)
                {
                    numOfPeople = people;
                    boxesOfFood = foodBoxes;
                }

                public void orderMoreFood(int additionalFoodBoxes)
                {
                    int updatedAmountOfFood = boxesOfFood + additionalFoodBoxes;
                    boxesOfFood = updatedAmountOfFood;
                }

                public int getNumOfPeople() {
                    return numOfPeople;
                }

                public int getBoxesOfFood() {
                    return boxesOfFood;
                }

                public void eatFood(int eatenBoxes)
                {
                    boxesOfFood = updatedAmountOfFood - eatenBoxes;
                }
            }

     .. mchoice:: u3_11
        :practice: T
        :random:

        Consider the following class definitions.

        .. code-block:: java

            public class Party
            {
                private String partyHost;
                private int monthOfParty;
                private int partyStartTime;

                public Party(String h, int month, int startTime)
                {
                    partyHost = h;
                    monthOfParty = month;
                    partyStartTime = startTime;
                }

                public int getMonth()
                {
                    return monthOfParty;
                }

                public int getStartTime()
                {
                    return partyStartTime;
                }

                public String getHost()
                {
                    return partyHost;
                }

                public void addToOptions(PartyOptions o)
                {
                    o.addParty(this);
                }
            }

            public class PartyOptions
            {
                private int onlyThisMonth;

                public PartyOptions(int month)
                {
                    onlyThisMonth = month;
                }

                /* A Party should only be added to this PartyOption if the party’s month matches onlyThisMonth */
                public void addParty(Party p)
                {
                    if (p.getMonth() == onlyThisMonth)
                    {
                        System.out.print("Party by " + p.getHost() + " accepted; ");
                    }
                    else
                    {
                        System.out.print("Party by " + p.getHost() + " rejected; ");
                    }
                }
            }

        Consider the following code segment, which appears in a class other than Party or PartyOptions.

        .. code-block:: java

            Party p1 = new Party("Kerry", 10, 7);
            Party p2 = new Party("Jules", 9, 6);

            PartyOptions options = new PartyOptions(10);
            p1.addToOptions(options);
            p2.addToOptions(options);

        - Party by Kerry rejected; Party by Jules rejected;

          - Kerry's party should be accepted because it is in the 10th month.

        - Party by Kerry rejected; Party by Jules accepted;

          - Kerry's party should be accepted because it is in the 10th month. Jules' party should be rejected because it is not in the 10th month.

        - Party by Kerry accepted; Party by Jules rejected;

          + Kerry's party is accepted because it is in the 10th month, and Jules' party is not.

        - Party by Kerry accepted; Party by Jules accepted;

          - Jules' party should be rejected because it is not in the 10th month.