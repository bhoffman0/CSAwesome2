.. include:: ../common.rst

.. qnum::
   :prefix: 2-1-
   :start: 1

|Time45|

.. |repl link| raw:: html

   <a href="https://replit.com/@BerylHoffman/Java-Swing-Turtle#Main.java" target="_blank" style="text-decoration:underline">replit link</a>

.. |github| raw:: html

   <a href="https://github.com/bhoffman0/CSAwesome2/raw/main/_sources/Unit1-Using-Objects-and-Methods/TurtleJavaSwingCode.zip" target="_blank" style="text-decoration:underline">here</a>


Objects - Instances of Classes
===============================

Java is an **object-oriented programming** language. That means that one of the
primary ways of organizing our programs is in terms of **objects**. Objects are
a kind of value that combines data and the code that operates on that data into
a single unit. Objects are defined in Java by writing **classes** which provide
a blueprint for creating objects of a certain kind, describing the data and code
that all **instances** of that class have.

Sometimes classes and objects are used to model things in the real world, such
as if we made a ``Student`` class to represent students in a school. Other times
classes are just ways of organizing different parts of our programs that may not
correspond to anything in the world outside the computer.

But in Java all programs are built out of classes. This is why, as you saw in
Unit 1, every Java programs starts with ``public class``: the first thing we
have to do when we write a Java program is define at least one class.

What are Objects and Classes?
------------------------------

**Objects** are values created by **constructing** an **instance** of a
**class**. We used ``String`` objects in Unit 1 and variables declared of type
``String`` such as ``String name;``. In this unit we'll work with a new class,
``Turtle`` which creates  animated turtles. Later on, in Unit 5, you'll
learn to write your own classes.

When you think about making objects from a class, you can think of a class like a
blueprint or a cookie cutter. It is used to create the cookies (objects) and can
be used to create as many cookies (objects) as you want. As a blueprint, each
class defines the **attributes** its objects have (the properties or what each
object knows about itself) and the **behaviors** (what each object can do). In
Java code, the attributes are written as **instance variables** in the class,
and the behaviors are written as **methods**.

.. figure:: Figures/cookieCutterLabelled.png
    :width: 500px
    :align: center
    :figclass: align-center

    Figure 1: Using a cookie cutter (class) to make cookies (objects)

You can also think of a class defining a new type. Just like you use ``int`` to
declare variables that can hold an whole number value, you can use ``Turtle`` to
declare a variable whose value has to be an instance of the ``Turtle`` class.
And just like the Java compiler will only let you do things with the values of
``int`` variables that make sense (like adding and multiplying them), it will
only let you do things with values of a ``Turtle`` variable that make sense to do
with turtles, namely accessing the instance variables and methods defined in the
``Turtle`` class.

The following picture has lots of cats (objects of the type cat). They are all
different, but they share the same attributes and behaviors that make up a cat.
They are all **instances** of cat with different values for their attributes.
Name some of the attributes and behaviors of the cats below. For example, the
color (*attribute*) of the first cat is black (*attribute value*) and it is
playing (*behavior*).

.. figure:: Figures/catsLabelled.png
    :width: 500px
    :align: center
    :figclass: align-center

    Figure 2: Pictures of cats (cat objects)

.. shortanswer:: cats

    Discuss with your class: What are some attributes of cats? What are some
    behaviors of cats? (Note that attributes are often nouns or adjectives
    describing features of cats, and behaviors are often verbs).

.. |video1| raw:: html

   <a href="https://www.youtube.com/watch?v=64DOwDu5SVo&list=PLHqz-wcqDQIEP6p1_0wOb9l9aQ0qFijrP&ab_channel=colleenlewis" target="_blank">video</a>

Watch the following |video1| by Dr. Colleen Lewis about classes and objects:

.. youtube:: 64DOwDu5SVo
    :optional:
    :width: 650
    :height: 415
    :align: center


|Exercise| **Check your understanding**

.. dragndrop:: vocab2_1
    :feedback: Review the summaries above.
    :match_1: a specific instance of a class with defined attributes|||object
    :match_2: defines a new data type that is like a blueprint|||class
    :match_3: define what the object knows about itself|||attributes or instance variables
    :match_4: define what an object can do|||behaviors or methods

    Drag the definition from the left and drop it on the correct concept on the right.  Click the "Check Me" button to see if you are correct.

.. mchoice:: q2_2_1
   :practice: T
   :answer_a: 1
   :answer_b: 10
   :answer_c: 1000
   :answer_d: As many as you need
   :correct: d
   :feedback_a: There is one definition of a class, but the class can create as many objects as are needed.
   :feedback_b: There is no limit on the number of objects you can create from a class.
   :feedback_c: There is no limit on the number of objects you can create from a class.
   :feedback_d: You can create as many objects as you need from one class.

   How many objects can you create from a class in Java?

.. mchoice:: q2_2_2
   :practice: T
   :answer_a: attributes
   :answer_b: methods
   :answer_c: class
   :answer_d: object
   :correct: b
   :feedback_a: attributes specify the data that an object keeps track of.
   :feedback_b: Methods specify the behavior of all objects of a class.
   :feedback_c: While the class does specify the behavior of all objects created by that class, what part of a class specifies the behavior?
   :feedback_d: The object behavior is specified by the methods in the class that created the object.

   What specifies the behavior for objects of a class in Java?

.. mchoice:: q2_2_3
   :practice: T
   :answer_a: attributes
   :answer_b: methods
   :answer_c: class
   :answer_d: object
   :correct: a
   :feedback_a: attributes specify the data that an object keeps track of.
   :feedback_b: Methods specify the behavior of all objects of a class.
   :feedback_c: While the class does specify the data that all objects of the class keep track of, what part of the class stores the data?
   :feedback_d: The object data is stored in the attributes of the object.  The attributes are defined in the class.

   What are the data or properties of an object called?


.. image:: Figures/turtleOOD.png
    :width: 200
    :align: left

Intro to Objects with Turtles
-----------------------------

The Turtle class (that we've written for you and hidden on this page) is a blueprint for turtle objects. It defines attributes for graphical turtles like their color and position and methods to make the turtles move. Try the Java program below that creates a Turtle object called yertle using the Turtle class.

.. activecode:: TurtleTest
    :language: java
    :autograde: unittest
    :datafile: turtleClasses.jar

    Try clicking the run button below to see what the following program does.
    (If the code below does not work or is too slow in your browser, you can also see the ``Turtle`` code in action at this |repl link| (refresh page after forking and if it gets stuck) or download the files |github| to use in your own IDE.)
    ~~~~
    import java.awt.*;
    import java.util.*;

    public class TurtleTest
    {
        public static void main(String[] args)
        {
            World habitat = new World(300, 300);
            Turtle yertle = new Turtle(habitat);

            yertle.forward();
            yertle.turnLeft();
            yertle.forward();

            habitat.show(true);
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
            super("TurtleTest");
        }

        @Test
        public void test1()
        {
            boolean passed = getResults("true", "true", "main()");
            assertTrue(passed);
        }
    }

.. |video2| raw:: html

   <a href="https://www.youtube.com/watch?v=TFmmG4_KK8I&list=PLHqz-wcqDQIEP6p1_0wOb9l9aQ0qFijrP&ab_channel=colleenlewis" target="_blank">video</a>

The following |video2| shows how the program creates a ``World`` object called ``habitat`` and a ``Turtle`` object called ``yertle`` in memory.

.. youtube:: TFmmG4_KK8I
    :width: 650
    :height: 415
    :align: center
    :optional:


The **dot operator** (.) is used to run an object's method. You can think of the (.) as asking the object to do something (execute one of its methods).  For example, ``yertle.forward()`` asks the turtle ``yertle`` to go ``forward``. It doesn't tell ``yertle`` how much to go forward, so it goes forward 100 pixels by default. The parentheses ``()`` after a method name are there in case you need to give the method **arguments** (some data) to do its job, for example to go forward 50 pixels instead of 100 in ``yertle.forward(50);`` Try changing the code above to go forward 50 pixels instead and then run it again.





|CodingEx| **Coding Exercise**


.. activecode:: TurtleTest2
    :language: java
    :autograde: unittest
    :datafile: turtleClasses.jar

    In the code below, ``yertle`` goes forward and then turns left. Can you change the code to make ``yertle`` go ``forward`` twice and then ``turnRight``?
    ~~~~
    import java.awt.*;
    import java.util.*;

    public class TurtleTest2
    {
        public static void main(String[] args)
        {
            World habitat = new World(300, 300);
            Turtle yertle = new Turtle(habitat);

            yertle.forward();
            yertle.turnLeft();

            habitat.show(true);
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
            super("TurtleTest2");
        }

        @Test
        public void test1()
        {
            String code = getCode();
            String expect = "yertle.forward";

            int count = countOccurences(code, expect);

            boolean passed = getResults("2 time(s)", "" + count + " time(s)", "yertle.forward() twice");
            assertTrue(passed);
        }

        @Test
        public void test2()
        {
            String code = getCode();
            String expect = "yertle.turnRight()";

            int count = countOccurences(code, expect);

            boolean passed = count >= 1;
            passed = getResults("1+ time(s)", "" + count + " time(s)", "yertle.turnRight()", passed);
            assertTrue(passed);
        }
    }

Creating Turtle Objects
------------------------

When you write a class like the ``Turtle`` class, you can create many objects of that class type. In the code below,
two turtle objects are created: ``yertle`` and ``myrtle``.  You can name your turtle and add in a line like the following in the main method to make it move:

.. code-block:: java

    // To create or declare a new object, write:
    // ClassName variableName = new ClassName(arguments);
    Turtle yourTurtleName = new Turtle(habitat);
    yourTurtlename.forward();

|CodingEx| **Coding Exercise:**

.. activecode:: TurtleTest3
    :language: java
    :autograde: unittest
    :datafile: turtleClasses.jar

    Can you add another turtle object to the code below?
    ~~~~
    import java.awt.*;
    import java.util.*;

    public class TurtleTest3
    {
        public static void main(String[] args)
        {
            World habitat = new World(300, 300);
            Turtle yertle = new Turtle(habitat);
            Turtle myrtle = new Turtle(habitat);

            yertle.forward();
            yertle.turnLeft();
            yertle.forward();

            myrtle.turnRight();
            myrtle.forward();

            habitat.show(true);
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
            super("TurtleTest3");
        }

        @Test
        public void test1()
        {
            String code = getCode();
            String expect = "new Turtle(habitat)";

            int count = countOccurences(code, expect);

            boolean passed = count >= 3;
            passed = getResults("3+ Turtles", "" + count + " Turtles", "Add a new Turtle(s)", passed);
            assertTrue(passed);
        }
    }

Here is a class diagram that shows some of the attributes and methods in the class ``Turtle``.

.. creately.com for figure


.. figure:: Figures/turtleUMLClassDiagram.png
    :width: 400px
    :align: center
    :alt: Turtle class diagram
    :figclass: align-center

    Figure 3: Turtle Class Diagram


Change to 2-4 turtle challenge House?


Summary
-------------------

- A **class** defines a new data type (a classification). It is the formal implementation, or blueprint, of the *attributes* and *behaviors* of the objects of that class.

- An **object** is a specific **instance** of a class with defined attributes. Objects are declared as variables of a class type.

- An **attribute** or **instance variable** is data the object knows about itself. For example a turtle object knows the direction it is facing or its color.

- A **behavior** or **method** is something that an object can do.  For example a turtle object can go forward 100 pixels.


AP Practice
------------

.. |video3| raw:: html

   <a href="https://www.youtube.com/watch?v=Y9vn6u3901Y&list=PLHqz-wcqDQIEP6p1_0wOb9l9aQ0qFijrP&ab_channel=colleenlewis" target="_blank">video</a>

This |video3| shows another class called Belt and how it has 3 instance variables to define its attributes. Every belt object has its own copy of instance variables.

.. youtube:: Y9vn6u3901Y
    :width: 650
    :height: 415
    :align: center
    :optional:

Try these AP practice questions that will help to prepare you for the AP Classroom progress checks.

.. mchoice:: AP2-1-1
   :practice: T
   :answer_a: An attribute of the name object is String.
   :answer_b: An attribute of the pet object is name.
   :answer_c: An instance of the pet class is Dog.
   :answer_d: An attribute of the Dog instance is pet.
   :answer_e: An instance of the Dog object is pet.
   :correct: b
   :feedback_a: name is an attribute of the pet object or Dog class.
   :feedback_b: name is an attribute of the pet object or Dog class.
   :feedback_c: An instance of the Dog class is pet.
   :feedback_d: An attribute of the Dog class is name.
   :feedback_e: An instance of the Dog class is pet.

   A student has created a ``Dog`` class. The class contains variables to represent the following.
    - A String variable called ``breed`` to represent the breed of the dog
    - An int variable called ``age`` to represent the age of the dog
    - A String variable called ``name`` to represent the name of the dog

    The object ``pet`` is declared as type Dog.
    Which of the following descriptions is accurate?


.. mchoice:: AP2-1-2
   :practice: T
   :answer_a: boolean is an attribute of the myParty object.
   :answer_b: myParty is an attribute of the Party class.
   :answer_c: myParty is an instance of the Party class.
   :answer_d: myParty is an attribute of the Party instance.
   :answer_e: numOfPeople is an instance of the Party object.
   :correct: c
   :feedback_a: boolean is the type of an attribute, but not an attribute.
   :feedback_b: myParty is an instance of the Party class.
   :feedback_c: myParty is an object that is an instance of the Party class.
   :feedback_d: An attribute of the Party class is numOfPeople.
   :feedback_e: An attribute of the Party class is numOfPeople.

    A student has created a ``Party`` class. The class contains variables to represent the following.
    - An int variable called ``numOfPeople`` to represent the number of people at the party.
    - A boolean variable called ``discoLightsOn`` to represent whether the disco ball is on.
    - A boolean variable called ``partyStarted`` to represent whether the party has started.

    The object ``myParty`` is declared as type Party. Which of the following descriptions is accurate?


