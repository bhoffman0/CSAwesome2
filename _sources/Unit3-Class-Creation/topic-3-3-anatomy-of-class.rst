.. include:: ../common.rst

.. qnum::
   :prefix: 3-3-
   :start: 1

|Time90|

Anatomy of a Java Class
=======================

In Unit 1, we learned to use **classes** and **objects** that are built-in to
Java or written by other programmers. In this unit, you will learn to write your
own classes and make your own objects!

Remember that a **class** in Java defines a blueprint for creating objects. When
you create **objects**, you create new **instances** of that class and what you
can do with those instances is determined by what methods are defined in the
class.

For example, we created ``yertle`` and ``myrtle``, 2 ``Turtle``
variables and assigned them references to objects created from the class
``Turtle`` and we used instances of Java’s ``String`` class to assign values to
different ``String`` variables.

Watch this short video to review the vocabulary of object-oriented programming:

.. youtube:: LfSaSANJPLg
    :width: 650
    :height: 415
    :align: center


Parts of a Class 
------------------

Most classes you write will have the keyword ``public`` before them though it is
not required. The class definition itself always starts with the word ``class``
followed by the name of the class. Then the rest of the class, called the body,
is defined inside a pair of ``{}``\ s.

Since we’re talking about anatomy, let’s create a class called ``Person``.
Classes are almost always named with capitalized names though this is a matter
of style, not a rule of the language. In this course, classes are always designated ``public`` and are declared with the keyword ``class``. Here is the basic skeleton of a ``Person`` class:

.. code-block:: java

    public class Person
    {
        // define class here - also called the “body” of the class

    }

You can create instances of the ``Person`` class with ``new`` as in ``new
Person()`` And you can declare variables that can hold a reference to a
``Person`` object with ``Person variableName``. Or put it altogether to declare some variables and initialize each one with a
reference to a new ``Person`` as shown here.

.. code-block:: java

    Person ada = new Person();
    Person charles = new Person();

So what makes up the body of the class — the stuff between the ``{}``\
s?

Remember that objects have both attributes and behaviors. These correspond to
**instance variables** and **methods** in the class definition. The first things we define in a class are usually the instance variables. They
are called that because each instance of the class (each object) has its own set
of variables that aren’t shared with other instances. This is what allowed
``yertle`` and ``myrtle`` from to be at different positions at the same
time; they each had their own x position and y position instance variables.

The next thing we define in a class is usually its **constructors**. We’ll talk
about writing constructors in more detail in the next section but a
constructor’s job is to initialize the instance variables when the object is
created. In this course, constructors are always designated ``public``.

The real meat of a class is in the **methods** which define the behaviors of the
objects of that class. Remember that most methods either do things
(like the ``Turtle`` methods that moved the turtle on the screen) or return
values like the ``getXPos`` and ``getYPos`` on ``Turtle``. The methods of the class share access to the object’s instance variables and
when a method is called on an object it uses the instance variables for that
object. For example in the ``Turtle`` class the ``forward`` method changes an
instance variable ``xPos``. When you call ``forward`` on ``yertle`` it changes
``xPos`` on the ``yertle`` object and when you call it on ``myrtle`` it changes
the ``xPos`` on the ``myrtle`` object.

Putting it all together, the three main anatomical features of a class are the
**instance variables** which hold values associated with each object, the
**constructors** whose job is to initialize the instance variables, and the
**methods** who contain the code that gives the objects their behavior and which
can use the instance variables defined in the class.

.. code-block:: java

    public class Person
    {
        // instance variables

        // constructors

        // methods

    }

And finally one last bit of weird anatomy, kind of like the appendix: any Java
class can have a ``main`` method which can be used to run that class as a
program either to test that one class or sometimes as the entry point to a whole
program made up of many classes and objects.

Designing a Class
-----------------

Now that we know what the skeleton of a class looks like and the elements that
make up the body of the class, we’re ready to create our own class. Let’s start
with a quick look at how to design a class such as ``Person``.

One important question we have to ask when designing a class is, what data does
it represent? In this case we can ask, what would we want to know about a
person? Our answer will depend on what problem we are trying to solve. In one
program, perhaps an address book, we might want to know the person's name and
phone number and email. In another program, such as a medical application, we
might need to know their vital signs such as their blood pressure, temperature,
and pulse rate.

For now let’s go with the address book example. Here's a fleshed out ``Person``
class with instance variables, a constructor, and methods. We’ll go through the
details in the next few sections but for now you can run the code to see how it
constructs 2 ``Person`` objects and fills in their data.

Remember that execution always starts in the ``main`` method. When a method like
``print`` is called, the code defined in the method runs but when it gets the
values of ``name``, ``email``, and ``phoneNumber`` it gets the specific values
of those variables that were set by the constructor when the particular object
we called ``print`` on was created. Click on the Show CodeLens button below and 
the Next button to run the code step by step.

.. activecode:: PersonClass
  :language: java
  :autograde: unittest

  Run the following class. Try changing the Person p2 object in main to your name.
  Click on the Show CodeLens button and then Next to step through the code.
  ~~~~
  public class Person
  {
      // instance variables
      private String name;
      private String email;
      private String phoneNumber;

      // constructor: construct a Person copying in the data into the instance
      // variables
      public Person(String initName, String initEmail, String initPhone)
      {
          name = initName;
          email = initEmail;
          phoneNumber = initPhone;
      }

      // Print all the data for a person
      public void print()
      {
          System.out.println("Name: " + name);
          System.out.println("Email: " + email);
          System.out.println("Phone Number: " + phoneNumber);
      }

      // main method for testing
      public static void main(String[] args)
      {
          // call the constructor to create a new person
          Person p1 = new Person("Sana", "sana@gmail.com", "123-456-7890");
          // call p1's print method
          p1.print();
          Person p2 = new Person("Jean", "jean@gmail.com", "404 899-9955");
          p2.print();
      }
  }

  ====
  // Test for Lesson 5.1.0 - Person class - should pass if/when they run code
  import static org.junit.Assert.*;

  import org.junit.*;

  import java.io.*;

  public class RunestoneTests extends CodeTestHelper
  {
      @Test
      public void testMain() throws IOException
      {
          String output = getMethodOutput("main");
          String expect =
                  "Name: Sana\n"
                      + "Email: sana@gmail.com\n"
                      + "Phone Number: 123-456-7890\n"
                      + "Name: Jean\n"
                      + "Email: jean@gmail.com\n"
                      + "Phone Number: 404 899-9955";

          boolean passed = getResults(expect, output, "Expected output from main", true);
          assertTrue(passed);
      }
  }

Data encapsulation
-------------------

**Data encapsulation** is an object-oriented design technique in which the implementation details of a class are kept hidden from external classes. The keywords ``public`` and ``private`` are called **access modifiers**, and they affect how you can the access classes, data, constructors, and methods. The keyword ``public`` means anyone can access this; it allows access from classes outside the declaring class. The keyword ``private`` restricts access to the declaring class which means that  variables or methods marked private are only accessible inside the class where they are defined. In general, instance variables in a class should be declared ``private`` to ensure data encapsulation.


Instance Variables
---------------------------

.. index::
   pair: class; instance variables


**Instance Variables** (sometimes called **attributes**, **fields**, or **properties**) hold the data for an object. They belong to the object, and each object has its own copy of these variables.  

In general and definitely on the AP CSA exam, instance variables should be
declared **private**. Think of ``private`` as like your diary. Only you should
have direct access to it. Similarly, in Java a ``private`` instance variable can
only be accessed by code inside the class that declares the variable.

.. note::

   Instance variables are declared right after the class declaration.  They usually start with ``private`` then the *type* of the variable and then a *name* for the variable. Private means only the code in this class has access to it.

The ``Person`` class declares 3 private instance variables: ``name``, ``email``,
and ``phoneNumber``. These are things that you might want to know about a
person. They are declared at the top of the class and they exist inside the ``{
}`` of the class.

Once we have created a class like ``Person``, we can create many instances
(objects) of the class. The class is like a blueprint or cookie cutter that
defines the variables and methods for that class. Each object will have their
own copies of the same instance variables but with possibly different values in
them (as seen in the cookie decorations below).


.. figure:: Figures/PersonClassWithCookies.png
    :width: 100%
    :align: center
    :alt: Person data encapsulation
    :figclass: align-center

    Figure 2: Person Class and Objects

Access to attributes should be kept internal to the class in order to accomplish encapsulation. It is good programming practice to designate the instance variables as `private` in order to ensure **data encapsulation** where the data (instance
variables) and the code acting on the data (methods) are wrapped together into a
single unit and the implementation details are hidden. Only code in the
class can access or change the values of ``private`` instance variables. This keeps the data secure and makes it a lot easier to keep track of how your program works than if you had to worry that any code anywhere in a much larger program could possibly change the values of the variables.

Code in other classes can only interact with the ``public`` methods you provide
and cannot directly access the ``private`` instance variables (shown in the pink
box above). When designing a class you get to decide what data to make accessible or
modifiable from other classes by what ``public`` methods you provide. 

|Exercise| **Check Your Understanding**

.. clickablearea:: name_instance_variables
    :question: Click on all the instance  variable declarations in the following class
    :iscode:
    :feedback: Remember, instance  variables are private and are declared after the class declaration.

    :click-incorrect:public class Name:endclick:
    :click-incorrect:{:endclick:
        :click-correct:private String first;:endclick:
        :click-correct:private String last;:endclick:

        :click-incorrect:public Name(String theFirst, String theLast):endclick:
        :click-incorrect:{:endclick:
            :click-incorrect:first = theFirst;:endclick:
            :click-incorrect:last = theLast;:endclick:
         :click-incorrect:}:endclick:

         :click-incorrect:public void setFirst(String theFirst):endclick:
         :click-incorrect:{:endclick:
            :click-incorrect:first = theFirst;:endclick:
         :click-incorrect:}:endclick:

         :click-incorrect:public void setLast(String theLast):endclick:
         :click-incorrect:{:endclick:
            :click-incorrect:last = theLast;:endclick:
         :click-incorrect:}:endclick:
    :click-incorrect:}:endclick:


Methods
-------

.. index::
   pair: class; method

**Methods** define what we can actually do with an object, their behaviors and functions. Methods have direct access to the instance variables and can use them and change them to perform their tasks. Methods are defined in the class after the instance variables and constructors. They are usually marked as ``public`` so they can be accessed from inside or outside the class.  Methods designated as ``private``  are not accessible outside of the class; they can only be used as helper methods by other methods inside the same class. 

.. note::

   Methods define what the object can do. They typically start with ``public``
   then a type, then the name of the method followed by parentheses for optional
   parameters. Methods defined for an object can access and use its instance
   variables!

The ``Person`` class above has a ``print`` method that prints out all the data
stored for a person object. Notice that it is marked as ``public`` and after
``public`` comes the return type. The ``void`` return type is used to indicate that the method does not return anything but
has some effect such as printing to the screen. After the return type comes the
method name followed by parentheses containing the list of parameters. In this
case there are no parameters but we still need the ``()``\ s. The body of the
method is in ``{}``\ s. As we’ve discussed, the method can access and use the
instance variables defined in the class: ``name``, ``email``, and
``phoneNumber`` but will get the values specific to the object we called
``print`` on.

.. code-block:: java

     public void print()
     {
       System.out.println("Name: " + name);
       System.out.println("Email: " + email);
       System.out.println("Phone Number: " + phoneNumber);
     }

To call a method, we need an object that is an instance of the class such as we
get by calling its constructor. Then we use the dot (``.``) operator to call its
``public`` methods, for example ``p1.print()`` means call the ``print`` method
on the object ``p1``.

.. code-block:: java

    // call the constructor to create a new person
    Person p1 = new Person("Sana", "sana@gmail.com", "123-456-7890");
    // call p1's print method
    p1.print();


|Exercise| Check Your Understanding

.. clickablearea:: name_methods
    :question: Click on all the lines of code that are part of a method in the following class.
    :iscode:
    :feedback: Methods follow the constructor.  They include a return type in case they returns something from the method.

    :click-incorrect:public class Name:endclick:
    :click-incorrect:{:endclick:
        :click-incorrect:private String first;:endclick:
        :click-incorrect:private String last;:endclick:

        :click-incorrect:public Name(String theFirst, String theLast):endclick:
        :click-incorrect:{:endclick:
            :click-incorrect:first = theFirst;:endclick:
            :click-incorrect:last = theLast;:endclick:
        :click-incorrect:}:endclick:

        :click-correct:public void setFirst(String theFirst):endclick:
        :click-correct:{:endclick:
            :click-correct:first = theFirst;:endclick:
        :click-correct:}:endclick:

        :click-correct:public void setLast(String theLast):endclick:
        :click-correct:{:endclick:
            :click-correct:last = theLast;:endclick:
        :click-correct:}:endclick:

    :click-incorrect:}:endclick:


|Groupwork| Coding Challenge : Virtual Pet Class
----------------------------------------------------------

.. image:: Figures/virtualpet.jpg
    :width: 130
    :align: left
    :alt: Virtual Pet

In the late 1990s and early 2000s, digital pets like in the photo were a huge hit! You had to feed, play, and interact with your virtual pet in order to keep it healthy and happy. Let's think about how they were programmed.

1. **Design:** In pairs, brainstorm about the **object-oriented design** for the virtual pet. What data or instance variables would you need to keep track of for a virtual pet? What behaviors or methods would the virtual pet have? (You could draw a Class Diagram for this class using |app diagrams| or |Creately.com|, although it is not required). Then, using the ``Person`` class above as a guide, write a ``VirtualPet`` class in the Active Code template below with the following parts.

2. **Instance Variables**: Declare at least 3 instance variables in the ``VirtualPet`` class below. Two of the instance variables should be called ``name`` and ``health``. The rest can be variables from your design above.  Don't forget to add in their ``private`` access modifiers. 

3. **Methods**: Complete the ``print`` method to print out the instance variables of the ``VirtualPet`` object, and complete the ``feed`` method to add 1 to the health instance variable. Remember that the methods have direct access to the instance variables. Create at least one more method that changes one of the instance variables from your design. (The constructor method and a get method is written for you below. You will learn how to write constructors in detail in the next lesson.) 

4. Complete the ``main`` method to construct at least 2 ``VirtualPet`` objects that call the ``VirtualPet`` constructor given to you with arguments for name and health. Then, use at least one of the objects to call its ``feed`` and ``print`` methods.

.. activecode:: challenge-VirtualPet-Class
  :language: java
  :autograde: unittest

  Complete the VirtualPet class below.  Add at least 3 instance variables, a print method, a feed method, and at least 1 other method that changes an instance variable.  Then complete the main method to construct at least 2 VirtualPet objects, call the feed and print method with one of them.  
  ~~~~
  public class VirtualPet
  {
      // write 3 instance variables for VirtualPet's name, health, and at least 1 other from your design
      // Remember the pattern:  private type variableName;
    
    

      // constructor written for you - do not change
      public VirtualPet(String initName, int initHealth)
      {
          // the constructor sets the instance variables to the init parameter variables
          name = initName;
          health = initHealth;
      }

      // Print the VirtualPet's data (instance variables) with System.out.println
      public void print()
      {
          // print the instance variables with spaces between them

      }
   
      // Complete the feed method below to add to the health instance variable
      public void feed()
      {
          // add 1 to the health variable

      }
    
      // Create another public void method that changes one of the instance variables


      // get method used for testing - do not change
      public int getHealth()
      {
          return health;
      }

      // main method for testing
      public static void main(String[] args)
      {
          VirtualPet p = new Pet("Fluffy", 5);
          // call the VirtualPet constructor to create another new object with a different name and health 

          // call the pet object p's feed() method
        
          // call the other method that you created
          
          // call the pet object p's print() method
        
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
          super("VirtualPet"); // class name / location of main

          Object[] values = new Object[] {"Fluffy", 5};
          setDefaultValues(values);
      }
       @Test
       public void countMethods()
       {
           String target = "public void";
           String code = getCode();

           int num = countOccurences(code, target);

           boolean passed = num >= 3;

           getResults("3+", "" + num, "public void methods", passed);
           assertTrue(passed);
       }

      @Test
      public void testPrint()
      {
          String output = getMethodOutput("print");
          String expect = "Fluffy";

          boolean passed = getResults(expect, output, "Checking method print()");
          assertTrue(passed);
      }

      @Test
      public void testFeed()
      {
          VirtualPet p = new VirtualPet("Fluffy",5);
          p.feed();
          String output = getMethodOutput("getHealth");
          String expect = "6";
          boolean passed = getResults(expect, output, "Expected health for pet Fluffy with initial health 5 after feed()");
          assertTrue(passed);
      }
      @Test
      public void testFeed2()
      {
          VirtualPet p = new VirtualPet("Pikachu",1);
          p.feed();
          String output = getMethodOutput("getHealth");
          String expect = "2";
          boolean passed = getResults(expect, output, "Expected health for pet Pikachu with initial health 1 after feed()");
          assertTrue(passed);
      }

      @Test
      public void testCallConstructors()
      {
          String code = getCodeWithoutComments();
          String search = "= new VirtualPet(";

          int num = countOccurences(code, search);

          String expect = search + "...) x 2";
          String actual = search + "...) x " + num;

          boolean passed = getResults(expect, actual, "Checking that you created another VirtualPet object");
          assertTrue(passed);
      }

      @Test
      public void testVariableTypes()
      {
          String varTypes = "String int";
          String output = testInstanceVariableTypes(varTypes.split(" "));

          boolean passed = getResults(varTypes, output, "Checking Instance Variable Type(s)");
          assertTrue(passed);
      }

      @Test
      public void testPrivateVariables()
      {
          String expect = "3 Private";
          String output = testPrivateInstanceVariables();

          boolean passed = getResults(expect, output, "Checking Private Instance Variable(s)");
          assertTrue(passed);
      }

      @Test
      public void testMain()
      {
          String output = getMethodOutput("main");

          String expect = "2+ line(s) of text";
          String actual = " line(s) of text";

          int len = output.split("\n").length;

          if (output.length() > 0)
          {
              actual = len + actual;
          }
          else
          {
              actual = output.length() + actual;
          }
          boolean passed = len >= 2;

          getResults(expect, actual, "Checking main method", passed);
          assertTrue(passed);
      }
  }

|Groupwork| Design a Class for your Community
----------------------------------------------------------

.. |worksheet| raw:: html

   <a href="https://docs.google.com/document/d/11QMyHAZYhPwNLInhURqkTffeY9re05yH97xAsiSJhLg/edit?usp=sharing" target="_blank">worksheet</a>

.. |community1| raw:: html

   <a href="community-challenge.html" target="_blank">lesson</a>

In this unit, you will design a class of your own choice that is relevant to your community.
You will improve the class in each lesson of this unit. We suggest that you work in pairs on this project.
If you would rather work on this project as 1 stand-alone lab project rather than a piece at a time at the end of each lesson,
you can do this in this |community1| at the end of the unit.

1. Make your own copy of this |worksheet| from the File menu. For question 1, brainstorm and ask people in your community what would be important or useful for them to track in a community organization or activity or to help your community. For example, you could create a Java class to keep track of community events, club activities, athletic games or statistics, community leaders, performers or performances, health tracking, or another subject of your choice.

2. Come up with the class name for your community data-tracking class (it should be a category of people or things, not a specific person or thing). Come up with at least 3 instance variables that are attributes of things in that class. Think about what data type each variable should be.You can use the |worksheet| to design your class. Optionally, you may want to draw a UML class diagram for your class on paper or using |app diagrams| or |Creately.com| (see |tutorial on class diagrams|).

3. Type in your class name and declare the instance variables for your class in the active code exercise below. Click on run. Your class will not print out anything yet, but it should run without errors. You will add constructors and other methods to this class in the next lessons.


.. activecode:: community-challenge1
  :language: java
  :autograde: unittest

  Come up with the class name for your community data-tracking class (it should be a category of people or things, not a specific person or thing) and at least 3 instance variables that are attributes of things in that class.  Your class will not print out anything yet, but it should run without errors.
  ~~~~
  public class          // Add your class name here!
  {
      // write 3 instance variables for class: private type variableName;



      public static void main(String[] args)
      {
        // Run your code to check for errors.
        // It will not print anything yet.
        // You will add more in the next lesson.
      }
  }
  ====
  import static org.junit.Assert.*;

  import org.junit.*;

  import java.io.*;

  public class RunestoneTests extends CodeTestHelper
  {
      @Test
      public void testPrivateVariables()
      {
          String expect = "3 Private";
          String output = testPrivateInstanceVariables();
          boolean passed = false;
          if (Integer.parseInt(expect.substring(0, 1)) <= Integer.parseInt(output.substring(0, 1)))
              passed = true;
          passed = getResults(expect, output, "Checking private instance variable(s)", passed);
          assertTrue(passed);
      }
  }

Summary
----------

- (AP 3.3.A.1) **Data encapsulation** is a technique in which the implementation details of a class are kept hidden from external classes. 
- (AP 3.3.A.1) The keywords ``public`` and ``private`` affect the access of classes, data, constructors, and methods. The keyword ``private`` restricts access to the declaring class, while the keyword ``public`` allows access from classes outside the declaring class. 
- (AP 3.3.A.2) In this course, classes are always designated ``public`` and are declared with the keyword ``class``.
- (AP 3.3.A.3) In this course, constructors are always designated ``public``.
- (AP 3.3.A.4) **Instance variables** belong to the object, and each object has its own copy of the variables.
- (AP 3.3.A.5) Access to attributes should be kept internal to the class in order to accomplish encapsulation. Therefore, it is good programming practice to designate the instance variables for these attributes as ``private`` unless the class specification states otherwise.
- **Instance Variables** define the attributes or data needed for objects, and
  **methods** define the behaviors or functions of the object.


AP Practice
------------


.. mchoice:: APclass1
        :practice: T
        :random:

        Consider the Cat class which will contain a String and an int attribute for a cat’s name and age and a constructor.

        .. code-block:: java

            public class Cat
            {
                /* missing code */
            }

        Which of the following replacements for /* missing code \*/ is the most appropriate
        implementation of the class?

        - .. code-block:: java

            public String name;
            public int age;
            private Cat(String name, int age)
            { /* implementation not shown */ }

          - Instance variables should be private.

        - .. code-block:: java

            public String name;
            private int age;
            private Cat(String name, int age)
            { /* implementation not shown */ }

          - Instance variables should be private.

        - .. code-block:: java

            private String name;
            private int age;
            public Cat(String name, int age)
            { /* implementation not shown */ }

          + Correct! The instance variables are private and the constructor is public.

        - .. code-block:: java

            public String name;
            public int age;
            public Cat(String name, int age)
            { /* implementation not shown */ }

          - Instance variables should be private.

        - .. code-block:: java

            private String name;
            private int age;
            private Cat(String name, int age)
            { /* implementation not shown */ }

          - Constructor should be public.

.. mchoice:: APclass2
    :practice: T

    Consider the Party class below which will contain three int attributes for numOfPeople, volumeOfMusic, and numOfBoxesOfPizza, a constructor, and a startParty method. The startParty method is intended to be accessed outside the class.

    .. code-block:: java

        public class Party
        {
            /* missing code */
        }

    Which of the following replacements for /* missing code \*/ is the most appropriate
    implementation of the class?

    - .. code-block:: java

        private int numOfPeople;
        private int volumeOfMusic;
        private int numOfBoxesOfPizza;
        public Party()
        { /* implementation not shown */ }
        private void startParty()
        { /* implementation not shown */ }

      - Method startParty() should be public.

    - .. code-block:: java

        private int numOfPeople;
        private int volumeOfMusic;
        private int numOfBoxesOfPizza;
        public Party()
        { /* implementation not shown */ }
        public void startParty()
        { /* implementation not shown */ }

      + Correct, instance variables should be private and the methods should be public.

    - .. code-block:: java

        public int numOfPeople;
        public int volumeOfMusic;
        public int numOfBoxesOfPizza;
        public Party()
        { /* implementation not shown */ }
        public void startParty()
        { /* implementation not shown */ }

      - Instance variables should be private.

    - .. code-block:: java

        private int numOfPeople;
        private int volumeOfMusic;
        private int numOfBoxesOfPizza;
        private Party()
        { /* implementation not shown */ }
        private void startParty()
        { /* implementation not shown */ }

      - Methods should be public.


.. |tutorial on class diagrams| raw:: html

   <a href="https://medium.com/@smagid_allThings/uml-class-diagrams-tutorial-step-by-step-520fd83b300b" target="_blank">tutorial on class diagrams</a>

.. |Creately.com| raw:: html

   <a href="https://creately.com" target="_blank">Creately.com</a>

.. |app diagrams| raw:: html

   <a href="https://app.diagrams.net/" target="_blank">app.diagrams.net</a>
