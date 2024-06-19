.. qnum::
   :prefix: 2-13-
   :start: 1

Coding Practice
======================



.. tabbed:: ch3Ex9

        .. tab:: Question

           .. activecode::  ch3Ex9q
              :language: java
              :autograde: unittest
              :practice: T

              Write the code to print a random number from 1 to 100.  You can use ``Math.random()`` to get a value between 0 and not quite 1.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args) {}
              }

              ====
              import static org.junit.Assert.*;

              import org.junit.*;

              import java.io.*;

              public class RunestoneTests extends CodeTestHelper
              {
                  @Test
                  public void testCheckCodeContains1()
                  {
                      boolean passed = checkCodeContainsNoRegex("random number up to 100", "Math.random()*100");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCheckCodeContains2()
                  {
                      boolean passed = checkCodeContainsNoRegex("random number starting at 1", "+1");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCheckCodeContains3()
                  {
                      boolean passed = checkCodeContains("casting to int", "(int)");
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           First multiply the output from Math.random() times 100 and then cast it to an integer.  This will result in a random number from 0 to 99.  Add one to make it from 1 to 100.

           .. activecode::  ch3Ex9a
              :language: java
              :optional:

              Answer: This is the answer to the previous question.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      System.out.println(((int) (Math.random() * 100)) + 1);
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch3ex9d


.. tabbed:: ch4Ex1

        .. tab:: Question

           .. activecode::  ch4Ex1q
              :language: java
              :autograde: unittest
              :practice: T

              The following code should get the first letter of the first name, middle name, and last name and append (concatenate) them together and then return them all in lowercase.  However, the code has errors.  Fix the code so that it compiles and runs correctly.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String firstName = "Sofia';
                      String middleName = "Maria";
                      String lastName  "Hernandez";
                      String initials = firstname.substring(0,1) +
                                        middleName.subString(0,1) +
                                        lastName.substring(0,1);
                      System.out.println(initials.toLowerCase();
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
                      String expect = "smh";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains()
                  {
                      String target = ".substring(0,1)";
                      boolean passed = checkCodeContains("substring method", target);
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

          Line 5 has an ending ``'`` instead of ``"``.  Line 7 is missing a ``=``.  Line 8 has ``firstname``, but it should be ``firstName``.  Remember that you should uppercase the first letter of each new word, after the first word, to make the variable name easier to read (use camel case).  Line 9 has ``subString``, but the method name is ``substring``.  Line 11 is missing a ``)``.

           .. activecode::  ch4Ex1a
              :language: java
              :optional:

              Answer: This is the answer to the previous question.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String firstName = "Sofia";
                      String middleName = "Maria";
                      String lastName = "Hernandez";
                      String initials =
                              firstName.substring(0, 1)
                                      + middleName.substring(0, 1)
                                      + lastName.substring(0, 1);
                      System.out.println(initials.toLowerCase());
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch4Ex1d


.. tabbed:: ch4Ex4

        .. tab:: Question

           .. activecode::  ch4Ex4q
              :language: java
              :autograde: unittest
              :practice: T

              The following code should print the first 3 letters of the string ``message`` all in lowercase letters. However, the code has errors.  Fix the errors so that the code runs as intended.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String message = "Meet me by the bridge":
                      String part = message.substring(1,3);
                      String lower = message.toLowerCase();
                      System.println(lower);
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
                      String expect = "mee";
                      boolean passed = output.equals(expect);
                      passed = getResults(expect, output, "Expected output from main", passed);
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains()
                  {
                      String target = ".substring(0,3)";
                      boolean passed = checkCodeContains("substring method ", target);
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Line 5 ends with ``:`` when it should be ``;``.  Line 6 should be ``substring(0,3)``.  Line 7 should be ``part`` not ``message``.  Line 8 should be ``System.out.println``.

           .. activecode::  ch4Ex4a
              :language: java
              :optional:

              This is the answer to the previous question.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String message = "Meet me by the bridge";
                      String part = message.substring(0, 3);
                      String lower = part.toLowerCase();
                      System.out.println(lower);
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch4Ex4d




.. tabbed:: ch4Ex10

        .. tab:: Question

           .. activecode::  ch4Ex10q
              :language: java
              :autograde: unittest
              :practice: T

              The following code starts with ``String name1 = ALEX;`` and should print ``Alex``.  Use the ``toLowerCase`` and ``substring`` methods to do this task.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String name1 = "ALEX";

                      System.out.println(name1);
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
                      String expect = "Alex";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains()
                  {
                      String target = ".substring(";
                      boolean passed = checkCodeContains("substring method", target);
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Create a string that is all lowercase.  Create a new string from a substring of the original string (first letter) and  a substring of the rest of the string that is all lowercase (all except the first letter).  Print that string.

           .. activecode::  ch4Ex10a
              :language: java
              :optional:

              This is the answer to the previous question.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String name1 = "ALEX";
                      String nameLower = name1.toLowerCase();
                      String finalName = name1.substring(0, 1) + nameLower.substring(1);
                      System.out.println(finalName);
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch4Ex10d

.. tabbed:: ch4Ex11

        .. tab:: Question

           .. activecode::  ch4Ex11q
              :language: java
              :autograde: unittest
              :practice: T

              The following code should remove the word "very " (and following space) from the message and print the new message.  You can use ``indexOf`` to find the position of a substring in your string.  You can use ``substring`` to create a new string removing the word.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String message = "I am very happy!";
                      String target = "very ";
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
                      String expect = "I am happy!";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains()
                  {
                      String target = ".substring(";
                      boolean passed = checkCodeContains("substring method", target);
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains2()
                  {
                      String target = ".indexOf(";
                      boolean passed = checkCodeContains("indexOf method", target);
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Use ``indexOf`` to find the position and then create a new message up to the pos and again after the target string.

           .. activecode::  ch4Ex11a
              :language: java
              :optional:

              This is the answer to the previous question.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String message = "I am very happy!";
                      String target = "very ";
                      int pos = message.indexOf(target);
                      String newMessage =
                              message.substring(0, pos)
                                      + message.substring(pos + target.length());
                      System.out.println(newMessage);
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch4Ex11d

.. tabbed:: ch4Ex12

        .. tab:: Question

           .. activecode::  ch4Ex12q
              :language: java
              :autograde: unittest
              :practice: T

              The following code should replace ``lol`` in the message with ``laugh out loud`` and print the new message using indexOf and substring.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String message = "That was great - lol.";
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
                      String expect = "That was great - laugh out loud";
                      boolean passed = getResults(expect, output, "Expected output from main");
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains()
                  {
                      String target = ".substring(";
                      boolean passed = checkCodeContains("substring method", target);
                      assertTrue(passed);
                  }

                  @Test
                  public void testCodeContains2()
                  {
                      String target = ".indexOf(";
                      boolean passed = checkCodeContains("indexOf method", target);
                      assertTrue(passed);
                  }
              }

        .. tab:: Answer

           Use ``indexOf`` to find the position of the "lol" then create a new string from up to that position and append the "laugh out loud" and the substring after it.

           .. activecode::  ch4Ex12a
              :language: java
              :optional:

              This is the answer to the previous question.
              ~~~~
              public class Test1
              {
                  public static void main(String[] args)
                  {
                      String message = "That was great - lol.";
                      String target = "lol";
                      int pos = message.indexOf(target);
                      String newMessage =
                              message.substring(0, pos)
                                      + "laugh out loud"
                                      + message.substring(pos + target.length());
                      System.out.println(newMessage);
                  }
              }

        .. tab:: Discussion

            .. disqus::
                :shortname: cslearn4u
                :identifier: javareview_ch4Ex12d


For more practice with Strings see problems at http://codingbat.com/java/String-1.

* http://codingbat.com/prob/p161056
* http://codingbat.com/prob/p147483
* http://codingbat.com/prob/p108853
* http://codingbat.com/prob/p130896
* http://codingbat.com/prob/p130781

Here are some practice coding problems for Turtles.

.. activecode:: Turtle-eoc-triangle-ac
    :language: java
    :datafile: turtleClasses.jar

    Finish the code below to have ``t1`` draw a triangle where all of the
    sides are length 50.
    ~~~~
    import java.awt.*;
    import java.util.*;

    public class TurtleTest
    {
        public static void main(String[] args)
        {
            World habitat = new World(300, 300);
            Turtle t1 = new Turtle(habitat);

            habitat.show(true);
        }
    }

.. activecode:: Turtle-eoc-rect-ac
    :language: java
    :datafile: turtleClasses.jar

    Finish the code below to have ``t1`` draw a rectangle.  The vertical
    sides should be length 50 and the horizontal length 100.
    ~~~~
    import java.awt.*;
    import java.util.*;

    public class TurtleTest
    {
        public static void main(String[] args)
        {
            World habitat = new World(300, 300);
            Turtle t1 = new Turtle(habitat);

            habitat.show(true);
        }
    }

.. activecode:: Turtle-eoc-draw-seven-ac
    :language: java
    :datafile: turtleClasses.jar

    Finish the code below to have ``t1`` draw the number seven.
    ~~~~
    import java.util.*;
    import java.awt.*;

    public class TurtleTest
    {
        public static void main(String[] args)
        {
            World habitat = new World(300,300);
            Turtle t1  = new Turtle(habitat);

            habitat.show(true);
        }
    }

.. activecode:: Turtle-eoc-draw-four-ac
    :language: java
    :datafile: turtleClasses.jar

    Finish the code below to have ``t1`` draw the number four.
    ~~~~
    import java.awt.*;
    import java.util.*;

    public class TurtleTest
    {
        public static void main(String[] args)
        {
            World habitat = new World(300, 300);
            Turtle t1 = new Turtle(habitat);

            habitat.show(true);
        }
    }

.. activecode:: Turtle-eoc-draw-interesting-ac
    :language: java
    :datafile: turtleClasses.jar

    Finish the code below to have ``t1`` draw something interesting.
    ~~~~
    import java.awt.*;
    import java.util.*;

    public class TurtleTest
    {
        public static void main(String[] args)
        {
            World habitat = new World(300, 300);
            Turtle t1 = new Turtle(habitat);

            habitat.show(true);
        }
    }
