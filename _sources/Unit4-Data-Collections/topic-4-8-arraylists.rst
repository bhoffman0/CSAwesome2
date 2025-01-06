.. include:: ../common.rst

.. qnum::
   :prefix: 4-8-
   :start: 1

|Time90|

ArrayList and its Methods
==============================

.. index::
   single: arraylist
   single: ArrayList
   pair: arraylist; definition


.. figure:: Figures/lists.jpg
    :width: 300px
    :align: left
    :figclass: align-center

    Figure 1: A couple of lists

At the beginning of this unit, we learned about using arrays to hold collections of related
data. However arrays are not very flexible. Most notably, the size of an array
is established at the time of creation and cannot be changed. What if you don't
know how big the collection of data will be? What if you want to both add and
remove items from a collection? For example, if you wanted to represent a
shopping list, you might add to the list throughout the week and remove things
from the list while you are shopping. You probably would not know how many items
will be on the list at the beginning of the week.

For cases like this, Java has a class called ``ArrayList`` which is a re-sizable
list. It is called ``ArrayList`` because it stores the items that have been
added to it in an underlying array. But it also takes care of keeping track of
how many items have been added to the array and it will create a new bigger
array under the covers when needed to hold more items.

You can use ``ArrayList`` instead of arrays whenever you don't know the size of
the array you need or you know that you will add and remove items and may need
to change the array’s size dynamically during run time. An ``ArrayList`` is
**mutable** in size and contains object references, meaning it can change during run time by adding and removing objects from it.

.. note::

   An ``ArrayList`` is often called just a list. Prior to 2020
   the AP CSA curriculum included **interfaces** which are somewhat like classes
   and the interface ``List`` was often used to declare a variable that would
   refer to an ``ArrayList``. Interfaces are no longer on the exam, but if you
   see ``List`` being used in an old exam question just assume it’s an
   ``ArrayList``.

.. mchoice:: qloopList
   :answer_a: An ArrayList will always use less memory than an array.
   :answer_b: An ArrayList can store objects, but arrays can only store primitive types.
   :answer_c: An ArrayList has faster access to the last element than an array.
   :answer_d: An ArrayList resizes itself as necessary as items are added, but an array does not.
   :correct: d
   :feedback_a: No, An ArrayList grows as needed and is typically bigger than the data put into it. If the underlying array in an ArrayList is full when adding in new data, it usually doubles in size.
   :feedback_b: No, you can have an array of objects.
   :feedback_c: No, an ArrayList is implemented using an array so it has the same access time to any index as an array does.
   :feedback_d: An ArrayList is really a dynamic array (one that can grow or shrink as needed).

   Which of the following is a reason to use an ArrayList instead of an array?



import java.util.ArrayList
-----------------------------

.. index::
   single: import 
   single: java.util

The ``ArrayList`` class is in the ``java.util`` package. A **package** is a set
or library of related classes. The classes we have used until now, such as
``String`` and ``Math``, are in the special package ``java.lang`` whose classes
are always available in any Java program. Other packages, such as ``java.util``,
provide classes that can only be used either by **importing** them or (much more
rarely) by referring to them by their full name which includes the package as a
prefix. The full name of ``ArrayList`` is thus ``java.util.ArrayList`` but
rather than type that out all the time, in any class where we want to use
``ArrayList`` we will usually import it with an ``import`` statement.

Import statements have to come before the class definition in a Java source file
and serve to tell Java which class you mean when you use a short name like
``ArrayList``. To import just one class we use a single ``import`` of the
fully-qualified name of the class like this:

.. code-block:: java

  // Import just the ArrayList class from java.util
  import java.util.ArrayList;

.. index::
   single: package
   pair: statement; import


After such an import statement, anywhere ``ArrayList`` is used as a class name
in the file it will be taken to mean ``java.util.ArrayList``.

Another option is to import all the classes in a package with a “wildcard” import:

.. code-block:: java

  // Import everything in java.util including ArrayList
  import java.util.*;

This import statement will also cause, ``ArrayList`` to refer
``java.util.ArrayList``. But many other names of classes defined in the
``java.util`` package will also be available whether you use them or not. (One
that you have probably used by now is ``Scanner`` which can be used to read
input a user types at the command line.) Using wildcard imports can cause
conflicts if you import all the classes from two different packages and they
have class names in common but usually that’s not a problem, at least with
packages that are part of Java itself.

.. note::

   Don't worry about adding import statements on the AP CSA exam.  Any that you need will be provided for you.

|Exercise| **Check your understanding**

.. mchoice:: qlib_1
   :answer_a: You can only have one import statement in a source file.
   :answer_b: You must specify the class to import.
   :answer_c: Import statements must be before other code in a Java source file.
   :answer_d: You must import java.lang.String to use the short name of String.
   :correct: c
   :feedback_a: You can have an many import statements as you need.
   :feedback_b: You can use * to import all classes at the specified level.
   :feedback_c: Import statements have to be the first Java statements in a source file.
   :feedback_d: You do not have to import any classes that are in the java.lang package.

   Which of the following is true about import statements?

Declaring and Creating ArrayLists
----------------------------------

To declare an ArrayList use ``ArrayList<Type> name`` where *Type*, called a
**type parameter** is the type of objects you want to store in the ArrayList.
For example a variable naming an ``ArrayList`` meant to hold ``String``\ s is
declared as ``ArrayList<String>`` as shown in the code below.  Programmers use the letter E and call it the **generic type** for an Element.  ``ArrayList<E>``, where the generic type ``E`` specifies the type of the elements. (Without it, the type will be ``Object``). When ``ArrayList<E>`` is specified, the types of the reference parameters and return type when using its methods are type ``E``. ``ArrayList<E>``, where the generic type ``E`` specifies the type of the elements. So if E is ``String``, then the type of the reference parameters and return type when using its methods are type ``String``.

You can declare a variable to just be of type ``ArrayList``, with no type parameter, and it’ll be approximately the same as if you had declared ``ArrayList<Object>``, but it is good practice to specify the type of objects you intend to store in an
``ArrayList`` as it allows the compiler to find errors (that are specific to that to Strings or ints or whatever type you put in) that would otherwise be
missed until run time. 

.. code-block:: java

    // ArrayList<Type> name = new ArrayList<Type>();
    // An ArrayList of Strings:
    ArrayList<String> shoppingList = new ArrayList<String>();


As with other reference types, declaring a ``ArrayList`` variable doesn't
actually create a ``ArrayList`` object. It only creates a variable that can
refer to a ``ArrayList`` or ``null``. To actually create a ``ArrayList`` we must
invoke a constructor such as ``new ArrayList<String>()``. The ``ArrayList`` constructor ``ArrayList()`` constructs an empty list.

You can get the number of items in a ``ArrayList`` using the ``size()`` method.
Notice that a newly constructed ``ArrayList`` is empty and thus has a size of 0.
Also remember that you can’t call methods on ``null`` so trying to call ``size``
on the value of ``list2`` at line 10 below causes a ``NullPointerException``.

|CodingEx| **Coding Exercise**

.. activecode:: ArrayListCreateStr
   :language: java
   :autograde: unittest
   :practice: T

   The following code demonstrates a NullPointerException. Change the list2 declaration so that it creates a new ArrayList to remove the NullPointerException.
   ~~~~
   import java.util.*; // import needed for ArrayList

   public class ArrayListCreateStr
   {
       public static void main(String[] args)
       {
           ArrayList<String> nameList = new ArrayList<String>();
           System.out.println("The size of nameList is: " + nameList.size());
           ArrayList<String> list2 = null;
           System.out.println("The size of list2 is: " + list2.size());
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
           super("ArrayListCreateStr");
       }

       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect = "The size of nameList is: 0\nThe size of list2 is: 0";

           boolean passed = getResults(expect, output, "main()", true);
           assertTrue(passed);
       }
   }

You can also create ArrayLists of integer and double values. However, you have
to use the wrapper classes ``Integer`` or ``Double`` as the type parameter because ``ArrayList``\ s
can only hold objects, not primitive values. All primitive types must be
**wrapped** in objects before they are added to an ArrayList. For example,
``int`` values can be wrapped in ``Integer`` objects, ``double`` values can be
wrapped in ``Double`` objects. However this normally happens automatically
thanks to autoboxing.

You can actually put in any kind of objects in an ``ArrayList``, including
instances of classes that you write, such as the ``Student``, ``Person``, or
``Pet`` classes.

.. code-block:: java
          
        // An ArrayList of Integers:
        ArrayList<Integer> numList = new ArrayList<Integer>();
        // An ArrayList of Student objects:
        ArrayList<Student> roster = new ArrayList<Student>();
         

|Exercise| **Check your understanding**

.. mchoice:: qArrayListInteger
   :answer_a: ArrayList[int] numbers = new ArrayList();
   :answer_b: ArrayList&lt;String&gt; numbers = new ArrayList();
   :answer_c: ArrayList&lt;int&gt; numbers = new ArrayList&lt;int&gt;();
   :answer_d: ArrayList&lt;Integer&gt; numbers = new ArrayList&lt;Integer&gt;();
   :correct: d
   :feedback_a: The square brackets [] are only used with arrays, not ArrayLists.
   :feedback_b: String is not the correct type since this is for an array of integers, and the type should be next to ArrayList on both sides.
   :feedback_c: ArrayLists cannot hold primitive types like int. You must use the wrapper class Integer.
   :feedback_d: The wrapper class Integer is used to hold integers in an ArrayList.

   Which of the following is the correct way to create an ArrayList of integers?

ArrayList Methods
------------------

.. index::
   pair: arraylist; size
   pair: arraylist; add
   pair: arraylist; get
   pair: arraylist; set
   pair: arraylist; remove

.. |AP CSA Reference Sheet| raw:: html

   <a href="https://apstudents.collegeboard.org/ap/pdf/ap-computer-science-a-java-quick-reference_0.pdf" target="_blank">AP CSA Java Quick Reference Sheet</a>

The following are the ``ArrayList`` methods that you need to know for the AP CSA
exam. These are included on the |AP CSA Reference Sheet| that you will receive
during the exam so you do not need to memorize them. The E in the method headers
below stands for the type of the element in the ArrayList; this type E can be
any Object type. We will look at how these methods work below.

-  **int size()** returns the number of elements in the list

-  **boolean add(E obj)** appends obj to the end of the list and returns true

-   **E remove(int index)** removes the item at the index and shifts remaining items to the left (to a lower index)

-  **void add(int index, E obj)**  moves any current objects at index or beyond to the right (to a higher index) and inserts obj at the index

-   **E get(int index)** returns the item in the list at the index

-   **E set(int index, E obj)** replaces the item at index with obj

``size()``
----------

.. index::
   pair: arraylist; size

You can get the number of items in a ``ArrayList``
using its ``size()`` method. The ``ArrayList`` starts out empty with a size
of 0. 

.. code-block:: java

    ArrayList<String> list = new ArrayList<String>();
    System.out.println( list.size() );

.. note::

   With arrays, you use the ``length`` field to get the number of items in the
   array. But, with an ``ArrayList`` you use the ``size()`` method to get the
   number of items in the ``ArrayList``. You will not be penalized if you mix up
   ``length`` and ``size()`` in the CSA exam. The number of items in an empty
   ``ArrayList`` is 0.

``add(obj)``
------------

.. index::
   pair: arraylist; add

You can add values to an ``ArrayList`` using the method ``add(obj)`` which will
add the object to the end of the list, just like you would join the end of the
line to board a bus. Note that we can add objects of any type to an
``ArrayList``. The following code has a ``String`` list and an ``Integer`` list. 

|CodingEx| **Coding Exercise**

.. activecode:: listAdd
   :language: java
   :autograde: unittest

   Can you add another item to the shopping list and print out the new list?
   ~~~~
   import java.util.*;

   public class Shopping
   {
       public static void main(String[] args)
       {
           ArrayList<String> shoppingList = new ArrayList<String>();
           System.out.println("Size: " + shoppingList.size());
           shoppingList.add("carrots");
           System.out.println(shoppingList);
           shoppingList.add("bread");
           System.out.println(shoppingList);
           shoppingList.add("chocolate");
           System.out.println(shoppingList);
           System.out.println("Size: " + shoppingList.size());
           ArrayList<Integer> quantities = new ArrayList<Integer>();
           quantities.add(2);
           quantities.add(4);
           System.out.println(quantities);
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
           super("Shopping");
       }

       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect =
                   "Size: 0\n"
                       + "[carrots]\n"
                       + "[carrots, bread]\n"
                       + "[carrots, bread, chocolate]\n"
                       + "Size: 3\n"
                       + "[2, 4]";

           boolean passed = !output.equals(expect);

           passed = getResults(expect, output, "Changed code", passed);
           assertTrue(passed);
       }
   }


.. index::
   pair: list; autoboxing
   pair: list; unboxing

Primitive types like ``int`` and ``double`` are automatically converted to their corresponding wrapper classes  ``Integer`` and ``Double`` using autoboxing when added to an ``ArrayList``. When you pull an ``int`` value out of a list of ``Integers``
that is called **unboxing**.

.. code-block:: java

    ArrayList<Integer> list = new ArrayList<Integer>();
    list.add(new Integer(5)); // this will work in Java 7
    list.add(5); // this will work in all Java versions

You can put any kind of objects into an ``ArrayList``. Even instances of a class
that you wrote. For example, here is an ``ArrayList`` of ``Student``\ s.

.. activecode:: StudentArrayList
  :language: java
  :autograde: unittest

  An example of an ``ArrayList`` of ``Student`` objects. Add a new student with
  your name and info in it.

  ~~~~
  import java.util.*;

  public class StudentList
  {
      // main method for testing
      public static void main(String[] args)
      {
          ArrayList<Student> roster = new ArrayList<Student>();
          roster.add(new Student("Skyler", "skyler@sky.com", 123456));
          roster.add(new Student("Ayanna", "ayanna@gmail.com", 789012));

          System.out.println(roster);
      }
  }

  class Student
  {
      private String name;
      private String email;
      private int id;

      public Student(String initName, String initEmail, int initId)
      {
          name = initName;
          email = initEmail;
          id = initId;
      }

      // toString() method
      public String toString()
      {
          return id + ": " + name + ", " + email;
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
          super("StudentList");
      }

      @Test
      public void test1()
      {
          String output = getMethodOutput("main");
          String expect = "[123456: Skyler, skyler@sky.com, 789012: Ayanna, ayanna@gmail.com]";

          boolean passed = getResults(expect, output, "main()", true);
          assertTrue(passed);
      }
  }

``add(index,obj)``
------------------

There are actually two different ``add`` methods in the ``ArrayList`` class. The
``add(obj)`` method adds the passed object to the end of the list. The
``add(index,obj)`` method adds the passed object at the passed index, but first
moves over any existing values to higher indices to make room for the new
object. The indices for an ``ArrayList`` start at ``0`` and end at the number of elements ``- 1``.

|CodingEx| **Coding Exercise**

.. activecode:: listAddInt2
   :language: java
   :autograde: unittest

   What will the code below print out? Try figuring it out before running it.
   Remember that ``ArrayList``\ s start at index 0 and that the add(index,obj) always
   has the index as the first argument.
   ~~~~
   import java.util.*; // import all classes in this package.

   public class listAddInt2
   {
       public static void main(String[] arts)
       {
           ArrayList<Integer> list1 = new ArrayList<Integer>();
           list1.add(1);
           System.out.println(list1);
           // adds the number 2 to the end of the list
           list1.add(2);
           System.out.println(list1);
           // This will add the number 3 at index 1
           list1.add(1, 3);
           System.out.println(list1);
           // This will add the number 4 at index 1
           list1.add(1, 4);
           System.out.println(list1);
           System.out.println(list1.size());
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
           super("listAddInt2");
       }

       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect = "[1]\n[1, 2]\n[1, 3, 2]\n[1, 4, 3, 2]\n4\n";

           boolean passed = getResults(expect, output, "main()", true);
           assertTrue(passed);
       }
   }

.. note::

    ``ArrayList``\ s like arrays start numbering their elements from 0.

|Exercise| **Check your understanding**

.. mchoice:: qalAdd1
   :answer_a: [1, 2, 3, 4, 5]
   :answer_b: [1, 4, 2, 3, 5]
   :answer_c: [1, 2, 4, 3, 5]
   :answer_d: [1, 2, 4, 5]
   :correct: c
   :feedback_a: This would be true if all the <code>add</code> method calls were <code>add(value)</code>, but at least one is not.
   :feedback_b: This would be true if it was <code>add(1, 4)</code>
   :feedback_c: The <code>add(2, 4)</code> will put the 4 at index 2, but first move the 3 to index 3.
   :feedback_d: This would be true if the <code>add(2, 4)</code> replaced what was at index 2, but it actually moves the value currently at index 2 to index 3.

   What will print when the following code executes?

   .. code-block:: java

      ArrayList<Integer> list1 = new ArrayList<Integer>();
      list1.add(1);
      list1.add(2);
      list1.add(3);
      list1.add(2, 4);
      list1.add(5);
      System.out.println(list1);

.. |Java visualizer 1| raw:: html

   <a href="http://cscircles.cemc.uwaterloo.ca/java_visualize/#code=import+java.util.*%3B%0A%0Apublic+class+ClassNameHere+%7B%0A+++public+static+void+main(String%5B%5D+args)+%7B%0A++++++%0A++++++List%3CInteger%3E+list1+%3D+new+ArrayList%3CInteger%3E()%3B%0A++++++list1.add(new+Integer(1))%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(2)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(new+Integer(3))%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(2,4)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(new+Integer(5))%3B%0A++++++System.out.println(list1)%3B%0A++++++%0A+++%7D%0A%7D&mode=display&curInstr=0" target="_blank">Java Visualizer</a>

You can step through the code above by clicking on this |Java Visualizer 1|.

.. mchoice:: qalAdd2
   :answer_a: ["Anaya", "Sarah", "Layla", "Sharrie"]
   :answer_b: ["Anaya", "Layla", "Sharrie", "Sarah"]
   :answer_c: ["Sarah", "Anaya", "Layla", "Sharrie"]
   :answer_d: ["Anaya", "Layla", "Sarah", "Sharrie"]
   :correct: a
   :feedback_a: The <code>add(1, "Sarah")</code> will move any current items to the right and then put "Sarah" at index 1.
   :feedback_b: This would be true if the last one was <code>add("Sarah")</code>
   :feedback_c: This would be true if the last one was <code>add(0, "Sarah")</code>
   :feedback_d: This would be true if the last one was <code>add(2, "Sarah")</code>

   What will print when the following code executes?

   .. code-block:: java

      ArrayList<String> list1 = new ArrayList<String>();
      list1.add("Anaya");
      list1.add("Layla");
      list1.add("Sharrie");
      list1.add(1, "Sarah");
      System.out.println(list1);

.. |Java visualizer 2| raw:: html

   <a href="http://cscircles.cemc.uwaterloo.ca/java_visualize/#code=import+java.util.*%3B%0A%0Apublic+class+ClassNameHere+%7B%0A+++public+static+void+main(String%5B%5D+args)+%7B%0A++++++%0A++++++List%3CString%3E+list1+%3D+new+ArrayList%3CString%3E()%3B%0A++++++list1.add(%22Anaya%22)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(%22Layla%22)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(%22Sharrie%22)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(1,+%22Sarah%22)%3B%0A++++++System.out.println(list1)%3B%0A++++++%0A+++%7D%0A%7D&mode=display&curInstr=0" target="_blank">Java Visualizer</a>

You can step through the code above by clicking on the following |Java visualizer 2|.


``remove(index)``
-----------------

.. index::
   pair: arraylist; removing an item

You can also remove values from an ``ArrayList`` using the ``remove(index)``
method. It removes and returns the item at the given index. This will move all
the other items over in the underlying array and decrease the size of the
``ArrayList`` by 1.

|CodingEx| **Coding Exercise**



.. activecode:: listRem
   :language: java
   :autograde: unittest

   What will the following code print out? Try to guess before you run it. Were you surprised? Read the note below.
   ~~~~
   import java.util.*; // import all classes in this package.

   public class listRem
   {
       public static void main(String[] arts)
       {
           ArrayList<Integer> list1 = new ArrayList<Integer>();
           list1.add(1);
           list1.add(2);
           list1.add(3);
           System.out.println(list1);
           list1.remove(1);
           System.out.println(list1);
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
           super("listRem");
       }

       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect = "[1, 2, 3]\n[1, 3]";

           boolean passed = getResults(expect, output, "main()", true);
           assertTrue(passed);
       }
   }

.. note::

   The ``remove(int index)`` method will remove the object at the given index
   and shift left any values to the right of that index. It doesn't remove the
   object that matches the integer value given. In the example above it doesn't
   remove the value 1. It removes the value 2 at index 1.

.. mchoice:: qListRem
   :answer_a: [2, 3]
   :answer_b: [1, 2, 3]
   :answer_c: [1, 2]
   :answer_d: [1, 3]
   :correct: c
   :feedback_a: This would be true if it was <code>remove(0)</code>
   :feedback_b: The <code>remove</code> will remove a value from the list, so this can't be correct.
   :feedback_c: The 3 (at index 2) is removed
   :feedback_d: This would be true if it was <code>remove(1)</code>

   What will print when the following code executes?

   .. code-block:: java

      List<Integer> list1 = new ArrayList<Integer>();
      list1.add(1);
      list1.add(2);
      list1.add(3);
      list1.remove(2);
      System.out.println(list1);

You can step through the code above by clicking on the following `RemoveExample  <http://cscircles.cemc.uwaterloo.ca/java_visualize/#code=import+java.util.*%3B%0A%0Apublic+class+ClassNameHere+%7B%0A+++public+static+void+main(String%5B%5D+args)+%7B%0A++++++List%3CInteger%3E+list1+%3D+new+ArrayList%3CInteger%3E()%3B%0A++++++list1.add(new+Integer(1))%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(new+Integer(2))%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(new+Integer(3))%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.remove(2)%3B%0A++++++System.out.println(list1)%3B%0A+++%7D%0A%7D&mode=display&curInstr=0>`_.


``get(index)`` and ``set(index, obj)``
--------------------------------------

.. index::
    pair: arraylist; getting an item
    pair: arraylist; setting an item

You can get the object at an index using ``obj = listName.get(index)`` and set
the object at an index using ``listName.set(index,obj)``. Both methods require
that the index argument refer to an existing element of the list, i.e. the index
must be greater than or equal to 0 and less than the ``size()`` of the list.

Notice that ``ArrayList``\ s use ``get`` and ``set`` methods instead of the
index operator that we use with arrays: ``array[index]``. This is because
``ArrayList`` is a class with methods, not a built in type with special support
in the language like arrays.

|CodingEx| **Coding Exercise**

.. activecode:: listGetSet
   :language: java
   :autograde: unittest

   Try to guess what the code below will print before running it. Can you get the last element in the nameList to print it out? Can you set the first element in the list to your name and print out the list?
   ~~~~
   import java.util.*; // import all classes in this package.

   public class listGetSet
   {
       public static void main(String[] args)
       {
           ArrayList<String> nameList = new ArrayList<String>();
           nameList.add("Diego");
           nameList.add("Grace");
           nameList.add("Deja");
           System.out.println(nameList);
           System.out.println(nameList.get(0));
           System.out.println(nameList.get(1));
           nameList.set(1, "John");
           System.out.println(nameList);
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
           super("listGetSet");
       }

       @Test
       public void test1()
       {
           boolean passed =
                   checkCodeContainsRegex("nameList.set(0, \"Your name\")", "nameList.set(0, ");
           assertTrue(passed);
       }

       @Test
       public void test2()
       {
           String output = getMethodOutput("main");
           String searchString = "Deja";

           boolean passed =
                   output.contains("\n" + searchString)
                           || output.matches("\\s+" + searchString + "\\s+");

           passed = getResults("true", "" + passed, "Prints last item in list (Deja)", passed);
           assertTrue(passed);
       }
   }

|Exercise| **Check your understanding**

.. mchoice:: qListRem1
   :answer_a: [1, 2, 3, 4, 5]
   :answer_b: [1, 2, 4, 5, 6]
   :answer_c: [1, 2, 5, 4, 6]
   :answer_d: [1, 5, 2, 4, 6]
   :correct: c
   :feedback_a: The <code>set</code> will replace the item at index 2 so this can not be right.
   :feedback_b: The <code>add</code> with an index of 2 and a value of 5 adds the 5 at index 2 not 3. Remember that the first index is 0.
   :feedback_c: The <code>set</code> will change the item at index 2 to 4.  The add of 5 at index 2 will move everything else to the right and insert 5.  The last <code>add</code> will be at the end of the list.
   :feedback_d: The <code>add</code> with an index of 2 and a value of 5 adds the 5 at index 2 not 1. Remember that the first index is 0.

   What will print when the following code executes?

   .. code-block:: java

      List<Integer> list1 = new ArrayList<Integer>();
      list1.add(1);
      list1.add(2);
      list1.add(3);
      list1.set(2, 4);
      list1.add(2, 5);
      list1.add(6);
      System.out.println(list1);

You can step through the code above by clicking on the following `Example1 <http://cscircles.cemc.uwaterloo.ca/java_visualize/#code=import+java.util.*%3B%0A%0Apublic+class+ClassNameHere+%7B%0A+++public+static+void+main(String%5B%5D+args)+%7B%0A++++++%0A++++++ArrayList%3CInteger%3E+list1+%3D+new+ArrayList%3CInteger%3E()%3B%0A++++++list1.add(1)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(2)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(3)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.set(2,4)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(2,5)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(6)%3B%0A++++++System.out.println(list1)%3B%0A++++++%0A+++%7D%0A%7D&mode=display&curInstr=0>`_.

.. mchoice:: qListRem2
   :answer_a: ["Sarah", "Destini", "Layla", "Sharrie"]
   :answer_b: ["Sarah", "Destini", "Anaya", "Layla", "Sharrie"]
   :answer_c: ["Anaya", "Sarah", "Sharrie"]
   :answer_d: ["Anaya", "Sarah", "Destini", "Sharrie"]
   :correct: d
   :feedback_a: Remember that the first index is 0 not 1.
   :feedback_b: <code>set</code> changes the value and the first index is 0 not 1.
   :feedback_c: <code>add</code> at index 1 adds the new value at that index but moves right any existing values.
   :feedback_d: The list is first ["Anaya", "Layla", "Sharrie"] and then changes to ["Anaya", Destini", "Sharrie"] and then to ["Anaya", "Sarah", "Destini", "Sharrie"]

   What will print when the following code executes?

   .. code-block:: java

      List<String> list1 = new ArrayList<String>();
      list1.add("Anaya");
      list1.add("Layla");
      list1.add("Sharrie");
      list1.set(1, "Destini");
      list1.add(1, "Sarah");
      System.out.println(list1);

You can step through the code above by clicking on the following `Example2 <http://cscircles.cemc.uwaterloo.ca/java_visualize/#code=import+java.util.*%3B%0A%0Apublic+class+ClassNameHere+%7B%0A+++public+static+void+main(String%5B%5D+args)+%7B%0A++++++%0A++++++List%3CString%3E+list1+%3D+new+ArrayList%3CString%3E()%3B%0A++++++list1.add(%22Anaya%22)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(%22Layla%22)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(%22Sharrie%22)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.set(1,+%22Destini%22)%3B%0A++++++System.out.println(list1)%3B%0A++++++list1.add(1,+%22Sarah%22)%3B%0A++++++System.out.println(list1)%3B%0A++++++%0A+++%7D%0A%7D&mode=display&curInstr=0>`_.





Comparing arrays and ``ArrayList``\ s
-------------------------------------

When do you use arrays and when do you use ``ArrayList``\ s? Use an array when
you want to store several items of the same type and you know how many items
will be in the array and the items in the array won't change in order or number.
Use an ``ArrayList`` when you want to store several items of the same type and
you don't know how many items you will need in the list or when you want to
remove items from the list or add items to the list while the program is
running.

Here is a comparison of how to create arrays and ``ArrayList``\ s:

.. code-block:: java

   // arrays must specify a size!
   int[] highScores = new int[5];
   String[] names = new String[5];

   // ArrayLists are empty to start with
   ArrayList<Integer> highScoreList = new ArrayList<Integer>();
   ArrayList<String> nameList = new ArrayList<String>();

.. |comparison handout| raw:: html

   <a href="https://drive.google.com/file/d/1EzkHa3TNlbHOKVeZReQIf4HzuwwXsCAV/view?usp=sharing" target="_blank">comparison handout</a>

Here is a comparison of how to access and change elements in arrays and
``ArrayList``\ s. Note that ``ArrayList``\ s have a method ``size()`` instead of a
``length`` property, and ``ArrayList``\ s use ``get``/``set`` methods instead of
the index operator (``[]``).

=========== ========================  ========================
Operation   array                     ArrayList
=========== ========================  ========================
length/size array.length              list.size()
----------- ------------------------  ------------------------
Access      value = array[index];     value = list.get(index);
----------- ------------------------  ------------------------
Modify      array[index] = value;     list.set(index,value);
=========== ========================  ========================

Note that the ``ArrayList`` methods ``add`` and ``remove`` do not have a simple
equivalent in arrays because they change the number of elements in the list and
may shift the positions of other elements.

Here is a |comparison handout| of the basic operations to access 1-dimensional
and 2-dimensional arrays (which we will see in the next lessons), ``ArrayList``\ s,
and ``String``\ s made by AP CSA teacher Sam Procopio of Bishop Blanchet High
School.


.. activecode:: array-to-arraylist
   :language: java
   :autograde: unittest

   Rewrite the following code that uses an array to use an ``ArrayList``
   instead. In the comments write why you think an ``ArrayList`` is a better
   data structure to use than an array for this problem.
   ~~~~
   import java.util.*;

   public class ToDoList
   {
       public static void main(String[] args)
       {
           // Rewrite this code to use an ArrayList instead of an array
           String[] toDoList = new String[3];
           toDoList[0] = "Do homework";
           toDoList[1] = "Help make dinner";
           toDoList[2] = "Call grandma";

           // changing element 1
           toDoList[1] = "Order pizza";

           System.out.println(toDoList.length + " things to do!");
           System.out.println("Here's the first thing to do: " + toDoList[0]);

           // remove item 0 and move everything down
           //  (this can be done in one method call with ArrayList)
           toDoList[0] = toDoList[1];
           toDoList[1] = toDoList[2];
           toDoList[2] = "";

           System.out.println("Here's the next thing to do: " + toDoList[0]);

           // Why is an ArrayList better than an array for a toDoList?
           // Answer:
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
           super("ToDoList");
       }

       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect =
                   "3 things to do!\n"
                       + "Here's the first thing to do: Do homework\n"
                       + "Here's the next thing to do: Order pizza";

           boolean passed = getResults(expect, output, "Output is the same");
           assertTrue(passed);
       }

       @Test
       public void test2()
       {
            boolean passed = checkCodeContains("ArrayList<String>");
            assertTrue(passed);
       }
       @Test
       public void contains2()
       {
            boolean passed = checkCodeContains(".add");
            assertTrue(passed);
       }

       @Test
       public void test3()
       {
           String expect = "[*]";

           boolean passed = checkCodeNotContains(expect);
           assertTrue(passed);
       }
   }

Although it is not on the AP exam, you can convert an array to a ``List`` using
the static method ``asList`` from the ``Arrays`` helper class:
``Arrays.asList(arrayname)``. Note that ``ArrayList`` has a ``toString`` method
that is automatically called to print the list in a nice format.

.. activecode:: ArrayListFromArray
   :language: java
   :autograde: unittest

   Example code creating an ArrayList from an array.
   ~~~~
   import java.util.*;

   public class ArrayListFromArray
   {
       public static void main(String[] args)
       {
           String[] names = {"Dakota", "Madison", "Brooklyn"};
           ArrayList<String> namesList = new ArrayList<String>(Arrays.asList(names));
           System.out.println(namesList);
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
           super("ArrayListFromArray");
       }

       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect = "[Dakota, Madison, Brooklyn]";

           boolean passed = getResults(expect, output, "main()", true);
           assertTrue(passed);
       }
   }


|Groupwork| Coding Challenge : FRQ Digits
---------------------------------------------------


.. |FRQ 2017| raw:: html

   <a href="https://apcentral.collegeboard.org/pdf/ap-computer-science-a-frq-2017.pdf?course=ap-computer-science-a" target="_blank">2017 Free Response Question</a>

This coding challenge is based on the |FRQ 2017| part 1a on the 2017 AP CSA
exam. In this question, you are asked to write a constructor for a class called
``Digits``. This constructor takes an integer number as its argument and divides
it up into its digits and puts the digits into an ``ArrayList``. For example,
``new Digits(154)`` creates an ArrayList with the digits [1, 5, 4].

First, let’s discuss how to break up a number into its digits. Try the code
below. What happens if you divide an integer by 10? Remember that in integer
division the result truncates (cuts off) everything to the right of the decimal
point. Which digit can you get by using ``% 10`` which returns the remainder
after dividing by 10? Try a different number and guess what it will print and
then run to check.

.. activecode:: divideby10
   :language: java
   :autograde: unittest

   Set number to a different number and guess what number / and % will return. Which operator gives you a digit in number?
   ~~~~
   public class DivideBy10
   {
       public static void main(String[] args)
       {
           int number = 154;
           System.out.println(number / 10);
           System.out.println(number % 10);
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
           super("DivideBy10");
       }

       @Test
       public void test1()
       {
           String origCode =
                   "public class DivideBy10{public static void main(String[] args){int number ="
                       + " 154;System.out.println(number / 10);System.out.println(number % 10);}}";

           boolean changed = codeChanged(origCode);

           assertTrue(changed);
       }
   }

We can use a while loop to print out each digit in reverse order starting from
the right (4, 5, 1 for the number 154) while dividing it by 10. You can try it
in the active code above. Here is the pseudocode:

- while number is greater than 0

  - print out the last digit using %
  - change the number to cut off the last digit using /

Now, let’s write a constructor for the ``Digits`` class that uses this loop and
adds each found digit to the ``ArrayList`` instead of printing it out. 

Note that this will create the digit list in reverse order. To get the digits in
the right order, you can use the ``add(index, obj)`` method to add the digit to
the beginning of the ``ArrayList`` instead of the end. 

.. activecode:: challenge-digits
   :language: java
   :autograde: unittest

   Complete the challenge below to put the digits of a number in an ArrayList.
   ~~~~
   import java.util.*;

   public class Digits
   {
       /** A list of digits */
       private ArrayList<Integer> digitList;

       /** Constructs a list of digits from the given number */
       public Digits(int number)
       {
           // initialize digitList to an empty ArrayList of Integers

           // Use a while loop to add each digit in number to digitList
           //   use add(object,index) with the index 0 to add the 
           //   digit to the beginning of the list instead of the end


       }

       /** returns the string representation of the digits list */
       public String toString()
       {
           return digitList.toString();
       }

       public static void main(String[] args)
       {
           Digits d1 = new Digits(154);
           System.out.println(d1);
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
           super("Digits");
       }

       @Test
       public void test1()
       {
           String output = getMethodOutput("main");
           String expect = "[1, 5, 4]";

           boolean passed = getResults(expect, output, "Digits(154)");
           assertTrue(passed);
       }

       @Test
       public void test2()
       {
           Digits test = new Digits(123456);
           String output = test.toString();
           String expect = "[1, 2, 3, 4, 5, 6]";

           boolean passed = getResults(expect, output, "Digits(123456)");
           assertTrue(passed);
       }
   }

Summary
-----------

- **ArrayLists** are re-sizable lists that allow adding and removing items to
  change their size during run time.

- (AP 4.8.A.4) The ``ArrayList`` class is part of the ``java.util`` package. An ``import`` statement can be used to make this class available for use in the program.(import ``java.util.ArrayList`` or ``java.util.*``).

- (AP 4.8.A.1) An ``ArrayList`` object is **mutable** in size and contains object references. (Mutable means that it can change by adding and removing items from it.

- (AP 4.8.A.2) The ``ArrayList`` constructor ``ArrayList()`` constructs an empty list (of size 0).

- (AP 4.8.A.3) Java allows the generic type ``ArrayList<E>``, where the generic type ``E`` specifies the type of the elements. (Without it, the type will be ``Object``). When ``ArrayList<E>`` is specified, the types of the reference parameters and
  return type when using its methods are type ``E``.

- (AP 4.8.A.3) ``ArrayList<E>`` is preferred over ``ArrayList`` (which creates an list of of type ``Object``). For example, ``ArrayList<String> names = new ArrayList<String>();`` allows the compiler to find errors that would otherwise be found at run time.

- ``ArrayList``\ s cannot hold primitive types like ``int`` or ``double``, so
  you must use the wrapper classes ``Integer`` or ``Double`` to put numerical
  values into an ``ArrayList``. However autoboxing usually takes care of that
  for you.

- (AP 4.8.A.6) The indices for an ``ArrayList`` start at ``0`` and end at the number of elements ``- 1``.

- (AP 4.8.A.5) The following ArrayList methods, including what they do and when they are used, are part of the Java Quick Reference:

  - **int size()** : Returns the number of elements in the list
  - **boolean add(E obj)** : Appends obj to end of list; returns true
  - **void add(int index, E obj)** : Inserts obj at position index (0 <= index <= size), moving elements at position index and higher to the right (adds 1 to their indices) and adds 1 to size
  - **remove(int index)** — Removes element from position index, moving elements at position index + 1 and higher to the left (subtracts 1 from their indices) and subtracts 1 from size; returns the element formerly at position index
  - **E get(int index)** : Returns the element at position index in the list
  - **E set(int index, E obj)** : Replaces the element at position index with obj; returns the element formerly at position index