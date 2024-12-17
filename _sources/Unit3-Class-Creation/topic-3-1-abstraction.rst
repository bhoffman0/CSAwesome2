.. include:: ../common.rst

.. qnum::
   :prefix: 3-1-
   :start: 1

|Time45|

Abstraction and Program Design
=========================================

.. |tutorial on class diagrams| raw:: html

   <a href="https://medium.com/@smagid_allThings/uml-class-diagrams-tutorial-step-by-step-520fd83b300b" target="_blank">tutorial on class diagrams</a>

.. |Creately.com| raw:: html

   <a href="https://creately.com" target="_blank">Creately.com</a>

.. |app diagrams| raw:: html

   <a href="https://app.diagrams.net/" target="_blank">app.diagrams.net</a>


In Unit 1, we learned to use **classes** and **objects** that are built-in to
Java or written by other programmers, for example the ``Turtle`` class. In this unit, you will learn to write your
own classes and make your own objects! Prior to implementing a class, it is helpful to take time to design each class including its attributes and behaviors. This design can be represented using natural language or diagrams. In this lesson, you will learn about abstraction and how it can be used to design a program.


Object-Oriented Design
------------------------

In **object-oriented design** (OOD), programmers often start by deciding which classes are needed to solve a problem and then figure out the data and methods in each class.

When you are given a problem specification, you can identify classes you’ll need
by looking for the **nouns** in the specification. For instance, the
specification for the Turtle class probably contained a
sentence that said something like, “make turtles that can exist on a
2-dimensional world and can draw lines by moving around the world”. The main
nouns in that description are “turtle” and “world” and indeed the classes in the
system are ``Turtle`` and ``World``. 

|Exercise| **Check Your Understanding**

.. shortanswer:: OOD1

    You've been hired by your school to create a program that keeps track of "students at your school and the courses they are taking". Name 2 classes that you would create in your program. Name 2 attributes (data kept in instance variables) for each class.


The two nouns in the problem description above, **Student** and **Course** would make good class names! Then, you can think about what data you need to keep track of for students and courses and what methods you need. For example, for the Student class, you might need to keep track of the student's name and grade level. For the Course class, you might need to keep track of the course name and the teacher's name. What other attributes did you and your classmates come up with? 



UML Class Diagrams
-------------------

Sometimes it’s useful, when designing a complex system with lots of classes, to
make diagrams of the classes that show you at a glance what instance variables
and methods they have. Often these can just be sketches in your notebook or on a
whiteboard but there are also more formal systems such as the **Unified Modeling
Language (UML)** for drawing these diagrams.

For example, here is a UML class diagram for the ``Turtle`` class which includes a list of its attributes and behaviors. **Class Diagrams** are a way to represent the classes in a program and the data and procedural abstractions found in each class. T The attributes are the instance variables and the methods are the behaviors of the class. (The ``-`` in
front of the attributes indicate that they are private, and the ``+`` in front
of the methods indicate that they are public. We'll learn about these more later on). Here is a |tutorial on class diagrams| that explains it in more detail if you are curious (Class diagrams are
not on the AP CSA exam). If you want to draw your own, |app diagrams| or
|Creately.com| are good free online drawing tools for UML class diagrams.


.. figure:: Figures/turtleUMLClassDiagram.png
    :width: 350px
    :align: center
    :alt: Turtle class diagram
    :figclass: align-center

    Figure 1: Turtle Class Diagram



Abstraction
------------

**Abstraction** is the process of reducing complexity by focusing on the main idea. By hiding details irrelevant to the question at hand and bringing together related and useful details, abstraction reduces complexity and allows one to focus on the idea.

The class diagram above is an example of abstraction. It shows the main idea of the Turtle class without showing all the details of the class. The diagram shows the attributes and methods of the class, but it does not show the details of how the methods are implemented.


Data Abstraction
------------------

**Data abstraction** provides a separation between the abstract properties of a data type and the concrete details of its representation. For example, we can use the ``Turtle`` class and type without needed to know how it is implemented. Data abstraction manages complexity by giving data a name without referencing the specific details of the representation. Data can take the form of a single variable or a collection of data, such as in a class like ``Turtle``.

An **attribute** is a type of data abstraction that is defined in a class, for example the width or height of a Turtle object.  An **instance variable** is an attribute whose value is unique to each instance of the class. For example, each turtle object could have different width or height values.  A **class variable** is an attribute shared by all instances of the class. For example, we could keep a count of how many turtles have been created in a class variable. We will see more examples of these in the next lesson.

Procedural Abstraction
------------------------

**Procedural abstraction** provides a name for a process and allows a method to be used only knowing what it does, not how it does it. Through **method decomposition**, a programmer breaks down larger behaviors of the class into smaller behaviors by creating methods to represent each individual smaller behavior.  For example, in the Turtle class, the ``forward()`` method is a procedural abstraction that allows the turtle to move forward without needing to know exactly how the turtle is animated to move forward.  

Here are some of the main reasons to use procedural abstraction and multiple methods in your programs:

- Organization and Reducing Complexity: organize your program into small sections of code by function to reduce its complexity. Divide a problem into subproblems to solve it a piece at a time.
- Reusing Code: avoid repetition of code. Reuse code by putting it in a method and calling it whenever needed.
- Maintainability and Debugging: smaller methods are easier to debug and understand than searching through a large main method.

Using procedural abstraction in a program allows programmers to change the internals of a method (to make it faster, more efficient, use less storage, etc.) without needing to notify method users of the change as long as the method signature and what the method does is preserved. For example, we could change the way the Turtle class is implemented to make it faster without needing to change the way the ``forward()`` method is called.

Another reason to use procedural abstraction is to avoid repetition of code. For example, when we were deconstructing songs into methods in Unit 1, we found that we could reuse the ``chorus()`` or ``verse()`` method for each verse of the song. A procedural abstraction may extract shared features to generalize functionality instead of duplicating code. This allows for code reuse, which helps manage complexity. 

Adding parameters to methods allows for even more abstraction and flexibility in code. Parameters allow procedures to be generalized, enabling the procedures to be reused with a range of input values or arguments.

As a review, let's deconstruct the song "Old MacDonald" into methods with parameters to avoid repetition of code, as in Unit 1.

|CodingEx| **Coding Exercise**

.. activecode:: OldMacDonaldSongRepeated
  :language: java
  :autograde: unittest
  :practice: T

  Complete the methods ``chorus()`` and ``verse()``. Add method calls in main. 
  ~~~~
  public class OldMacDonaldSong
  {
      public static void intro()
      {
          System.out.println("Old MacDonald had a farm");
          chorus();
      }

      /* Complete the following method to print E-I-E-I-O */
      public static void chorus()
      {
          
      }
      
      /* Complete the following method to print the verse for the given animal and sound.
         For example, for a cow and moo, it should print out 
         "And on this farm, they had a cow. E-I-E-I-O 
         With a moo moo here and a moo moo there, 
         here a moo, there a moo, everywhere a moo moo". 
         Make sure to use the variables animal and sound and the method chorus()! 
      */
      public static void verse(String animal, String sound)
      {
          
      }

      public static void main(String[] args)
      {
          intro();
          verse("cow","moo");
          intro();
          // TODO:
          // Call verse again with duck and quack
          //   and then call intro again


          // Call verse again with another animal and sound 
          //  and then call intro again
        

       }
  }
  ====
  import static org.junit.Assert.*;

  import org.junit.*;

  import java.io.*;

  public class RunestoneTests extends CodeTestHelper
  {
      @Test
      public void testVar1()
      {
          boolean passed = checkCodeContains("use of animal variable in verse", "+ animal");
          assertTrue(passed);
      }
      @Test
      public void testVar2()
      {
          boolean passed = checkCodeContains("use of sound variable in verse", "+ sound");
          assertTrue(passed);
      }
      @Test
      public void testCall()
      {
          boolean passed = checkCodeContains("call to verse with duck and quack", "verse(\"duck\", \"quack\");");
          assertTrue(passed);
      }
      @Test
      public void test1()
      {
          String code = getCode();
          int num = countOccurences(code, "intro();");

          boolean passed = num >= 4;

          passed = getResults("4 or more", "" + num, "Calls to intro", passed);
          assertTrue(passed);
      }
       @Test
      public void test2()
      {
          String code = getCode();
          int num = countOccurences(code, "chorus();");

          boolean passed = num >= 2;

          passed = getResults("2 or more", "" + num, "Call chorus() in intro and verse", passed);
          assertTrue(passed);
      }
  }


|Groupwork| Group Challenge : Game Design
----------------------------------------------------------

Working in groups, let's explore making a computer game that is an adaptation of a board game that you know. Think about what objects are in the game. For example, here is the description for Monopoly (trademark Hasbro games): 

- "Buy, sell, dream and scheme your way to riches. Players buy, sell and trade to win. Build houses and hotels on your properties and bankrupt your opponents to win it all. Chance and Community Chest cards can change everything." 

What classes would you need to create a computer version of this game? (Remember to look for the nouns). Take one of the classes you listed, and try to come up with 2 pieces of data in that class that will be the instance variables. Then, come up with 2 methods (look for verbs) for the class that use the data in the instance variables. Write your answers below.

If your class has time, you could explore drawing a UML class diagram for your class using an online tool like |Creately.com| or |app diagrams| using this |tutorial on class diagrams|

.. shortanswer:: OOD2

    Say you wanted to make a computer game from a board game that you are playing. Think about what objects are in the game. For example, here is the description for Monopoly (trademark Hasbro games): "Buy, sell, dream and scheme your way to riches. Players buy, sell and trade to win. Build houses and hotels on your properties and bankrupt your opponents to win it all. Chance and Community Chest cards can change everything." What classes would you need to create a computer version of this game? (Remember to look for the nouns). Take one of the classes you listed, and try to come up with 2 pieces of data in that class that will be the instance variables. Then, come up with 2 methods (look for verbs) for the class that use the data in the instance variables.

Summary
----------

- (AP 3.1.A.1) **Abstraction** is the process of reducing complexity by focusing on the main idea. By hiding details irrelevant to the question at hand and bringing together related and useful details, abstraction reduces complexity and allows one to focus on the idea.

- (AP 3.1.A.2) **Data abstraction** provides a separation between the abstract properties of a data type and the concrete details of its representation. Data abstraction manages complexity by giving data a name without referencing the specific details of the representation. Data can take the form of a single variable or a collection of data, such as in a class or a set of data.

- (AP 3.1.A.3) An **attribute** is a type of data abstraction that is defined in a class outside any method or constructor. An **instance variable** is an attribute whose value is unique to each instance of the class. A **class variable** is an attribute shared by all instances of the class.

- (AP 3.1.A.4) **Procedural abstraction** provides a name for a process and allows a method to be used only knowing what it does, not how it does it. Through **method decomposition**, a programmer breaks down larger behaviors of the class into smaller behaviors by creating methods to represent each individual smaller behavior. A procedural abstraction may extract shared features to generalize functionality instead of duplicating code. This allows for code reuse, which helps manage complexity.

- (AP 3.1.A.5) Using parameters allows procedures to be generalized, enabling the procedures to be reused with a range of input values or arguments.

- (AP 3.1.A.6) Using procedural abstraction in a program allows programmers to change the internals of a method (to make it faster, more efficient, use less storage, etc.) without needing to notify method users of the change as long as the method signature and what the method does is preserved.

- (AP 3.1.A.7) Prior to implementing a class, it is helpful to take time to design each class including its attributes and behaviors. This design can be represented using natural language or diagrams.