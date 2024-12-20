.. include:: ../common.rst

.. qnum::
   :prefix: 3-6-
   :start: 1

|Time90|

Methods: Passing and Returning References of an Object
========================================================

Programs often consist of many classes that interact with each other. Objects of one class can be instance variables of another class. Objects can be passed as arguments to methods and returned from methods. This is a powerful feature of object-oriented programming that allows for complex interactions between objects. 

Objects as Instance Variables
--------------------------------

Classes can have complex instance variables that use other classes. For example, a ``Person`` class could have an instance variable for the address which can be an object with its own instance variables of street, city, state, and zipcode. This is a **has-a** relationship where a Person `has an` Address inside it. 

.. code-block:: java

    class Address
    {
        // instance variables
        private String street;
        private String city;
        private String state;
        private String zipcode;
    }
    
    class Person
    {
        // instance variables
        private String name;
        private Address addr;  // instance variable of type Address
    }

In Java, usually each class is saved in its own file with the same name as the class, so the Person class would be in Person.java and the Address class would be in Address.java. If the files are in the same folder, they can be compiled together so that they can interact. In Runestone, we cannot have separate files, so we put them in 1 coding area. In Runestone, only the class that has the main method can be public; the other classes can leave out the public keyword.

Objects as Arguments
---------------------

Java uses **Call by Value** when it passes arguments to methods and constructors. This means that a copy of the value in the argument is saved in the parameter variable. If the parameter variable changes its value inside the method, the original value outside the method is not changed. With primitive types like int and double, the argument value is copied into the parameter variable as expected. However, if you pass in an argument that holds a reference to an object, like a String or Person or Address or Turtle objects, the reference is copied, not the whole object. Java was designed this way to avoid copying large objects from method to method.  

When a copy of a reference is passed in and saved in the parameter variable, the parameter and the argument are then **aliases**, both refering to the same object. Remember when we discussed reference aliases with turtle objects who are set equal to one another.

.. figure:: Figures/turtleEquality.png
    :width: 500px
    :align: center
    :figclass: align-center

    Figure 1: Turtle Reference Equality

There can be unexpected results if the parameter refers to a mutable object; the method or constructor can use this reference to alter the state of the original object. Some classes like ``String`` are immutable, so they cannot be changed by any method; for example, when ``s.toUpperCase()`` is called, it returns a new String object with the uppercase letters, but the original String object is not changed. Any new classes that you write that have setters or methods that change the state of the object will be mutable. So, if you pass in an object of a class that you write into a method as an argument, you need to be careful that the method does not change the object unless that is the intended behavior. It is good programming practice to not modify mutable objects that are passed as parameters unless required in the specification. 

Try the code below. Add code in the main method that changes the original address to your city. Does it also change in the person object? This can be a problem with references to mutable objects. In the next subsection, we'll copy the Address object to avoid this problem.

|CodingEx| **Coding Exercise**

.. activecode:: AddressPerson
  :language: java
  :autograde: unittest
  :practice: T

  Try the following code. Scroll down to see both the Person and the Address class definitions. The Person class has an Address object as an instance variable. Add code in the main method that changes the original address to your city. Does it also change in the person object? This can be a problem with references to mutable objects. 
  ~~~~
  public class Person
  {
      // instance variables
      private String name;
      private Address addr;  // instance variable of type Address defined below

      // Constructor
      public Person(String initName, Address initAddress) 
      {
          name = initName;
          // This direct assignment of references may not be the best practice!
          address = initAddress;
      }

      public String toString()
      {
          return "Name:" + name + "\n" + "Address:" + address;
      }
      public static void main(String[] args)
      {
          Address a1 = new Address("123 Main St", "Anytown", "12345");
          Person p1 = new Person("Skyler", a1);
          System.out.println(p1);
          // Add code to change a1 to your city with its setCity method

          // Print out a1 and p1. Did changing a1 change p1?

      }
  }
  class Address
  {
        // instance variables
        private String street;
        private String city;
        private String state;
        private String zipcode;
        // constructor
        public Address(String initStreet, String initCity, 
                       String initState, String initZipcode) 
        {
            street = initStreet;
            city = initCity;
            state = initState;
            zipcode = initZipcode;
        }
        public String toString()
        {
            return street + "\n" + city + ", " + state + " " + zipcode;
        }
        public String getStreet()
        {
            return street;
        }
        public String getCity()
        {
            return city;
        }
        public String getState()
        {
            return state;
        }
        public String getZipcode()
        {
            return zipcode;
        }
        // Setters (makes the class mutable)
        public void setCity(String initCity) {
            city = initCity;
        }
   }
  ====
  import static org.junit.Assert.*;

  import org.junit.*;

  import java.io.*;

  public class RunestoneTests extends CodeTestHelper
  {
      @Test
      public void test1() throws IOException
      {
          String target = "a1.setCity";
          boolean passed = checkCodeContains("call to a1.setCity", target);
          assertTrue(passed);
      }
  }



Copying Parameter Objects
------------------------------------------------

The ``Person`` class above has an ``Address`` object as an instance variable. We found that changing the Address object outside the class also changed the address in the Person object. This is because the Address object is mutable, and the reference to the object is passed in as an argument to the constructor. 

When you pass object references as parameters to
constructors, those references refer to the same objects as the
references in the caller. If the objects are immutable, like ``String`` objects
it doesn’t matter at all. On the other hand, if the objects are **mutable**,
meaning their instance variables can change after they are constructed, then
storing the passed-in reference in an instance variable in your object can lead
to surprising results: if some other code changes the object it will change for
you too. If that’s not what you want, sometimes it makes sense to copy the
object passed to the constructor and store the copy in the instance variable
instead. How to make the copy will depend on the class of the object, but often
you can just construct a new object of the appropriate class using values from
the original object as shown below. This way the instance variable ``addr`` does not hold a reference to the original object ``initAddr``, and the methods in the ``Person`` class cannot modify the state of the original object.

.. code-block:: java

     public class Person
     {
         private String name;
         private Address addr; // Assumes an Address class is already defined

         // constructor: initialize instance variable and call Address constructor to
         // make a copy
         public Person(String initName, Address initAddr)
         {
             name = initName;
             addr =  new Address(
                             initAddr.getStreet(),
                             initAddr.getCity(),
                             initAddr.getState(),
                             initAddr.getZipcode());
        }
     }

Another way to handle this is to provide a copy constructor in the ``Address`` class that takes an ``Address`` object as a parameter and makes a copy of it. Then, the ``Person`` constructor can call the ``Address`` copy constructor.

.. code-block:: java

    class Address
    {
        // instance variables
        private String street;
        private String city;
        private String state;
        private String zipcode;
        // constructor
        public Address(String initStreet, String initCity, 
                       String initState, String initZipcode) 
        {
            street = initStreet;
            city = initCity;
            state = initState;
            zipcode = initZipcode;
        }
        // copy constructor
        public Address(Address otherAddr)
        {
            street = otherAddr.getStreet();
            city = otherAddr.getCity();
            zipcode = otherAddr.getZipcode();
        }
    }
    class Person 
    {
        // instance variables
        private String name;
        private Address addr;  // instance variable of type Address defined below

        // constructor: initialize instance variable and call Address constructor to
        // make a copy
        public Person(String initName, Address initAddr)
        {
            name = initName;
            // call the copy constructor of Address to make a defensive copy
            addr =  new Address(initAddr);
        }
    }

Try the variation of the code below where the constructor copies the Address object so that it is separate from the original object. Add code in the main method that changes the original address to your city. It will not change the address in the Person object because it was copied.

|CodingEx| **Coding Exercise**

.. activecode:: PersonAddressCopy
  :language: java
  :autograde: unittest
  :practice: T

  In the following Person class, the constructor method copies the Address object so that it is separate from the original object. Complete the setAddress method in Person so that it also makes a copy of otherAddr object like the constructor. Then, add code in the main method that changes the original address to your city. It should not change the copy! Add code that uses the setAddress method. It should not change the original!
  ~~~~
  public class Person
  {
      // instance variables
      private String name;
      private Address addr;  // instance variable of type Address defined below

      // constructor: initialize instance variable and call Address constructor to
      // make a copy
      public Person(String initName, Address initAddr)
      {
          name = initName;
          // Defensive copy of the Address argument
          addr =  new Address(
                             initAddr.getStreet(),
                             initAddr.getCity(),
                             initAddr.getState());
      }

      public void setAddress(Address otherAddr)
      {
          // TODO: Complete the setAddress method below that
          // makes a defensive copy of newAddr using its get methods like the constructor
         
      }
      public String toString()
      {
          return "Name:" + name + "\n" + "Address:" + address;
      }
      public static void main(String[] args)
      {
          Address a1 = new Address("123 Main St", "Anytown", "12345");
          Address a2 = new Address("456 Elm St", "Othertown", "67890");
          Person p1 = new Person("Skyler", a1);
          System.out.println(p1);
          // TODO: Add code to change a1 to your city with its setCity method

          // Print out a1 and p1. Did changing a1 change p1?

          // Add code to change p1's address to a2 with its setAddress method
          
          // Print out a1 and p1. Did changing p1 change a1?

      }
  }
  class Address
  {
        // instance variables
        private String street;
        private String city;
        private String state;
        private String zipcode;
        // constructor
        public Address(String initStreet, String initCity, 
                       String initState, String initZipcode) 
        {
            street = initStreet;
            city = initCity;
            state = initState;
            zipcode = initZipcode;
        }
        public String toString()
        {
            return street + "\n" + city + ", " + state + " " + zipcode;
        }
        public String getStreet()
        {
            return street;
        }
        public String getCity()
        {
            return city;
        }
        public String getState()
        {
            return state;
        }
        public String getZipcode()
        {
            return zipcode;
        }
        // Setters (makes the class mutable)
        public void setCity(String initCity) {
            city = initCity;
        }
   }
  ====
  import static org.junit.Assert.*;

  import org.junit.*;

  import java.io.*;

  public class RunestoneTests extends CodeTestHelper
  {
      @Test
      public void test1() throws IOException
      {
          String target = "a1.setCity";
          boolean passed = checkCodeContains("call to a1.setCity", target);
          assertTrue(passed);
      }
      @Test
      public void test2() throws IOException
      {
          String target = "p1.setAddress";
          boolean passed = checkCodeContains("call to p1.setAddress", target);
          assertTrue(passed);
      }
      @Test
      public void test3() throws IOException
      {
          String target = "otherAddr.getCity()";
          boolean passed = checkCodeContains("call to otherAddr.getCity() in setAddress", target);
          assertTrue(passed);
      }
  }

Parameter of the Same Class Type
----------------------------------

Methods cannot access the private data and methods of a parameter that holds a reference to an object unless the parameter is the same type as the method’s enclosing class. In the following code, the ``Person`` class can access the ``Adress`` instance variable of another Person object because they are of the same class type, but it cannot access the ``city`` instance variable of an ``Address`` object directly because it is private and not of the same class.

.. code-block:: java

    public class Person
    {
        private String name;
        private Address addr;  // instance variable of type Address defined below

        public void copyAddress(Person otherPerson)
        {
            // otherPerson.addr will work because the parameter is of the same class Person
            addr = new Address(otherPerson.addr);       
        }
         public void copyCity(Address otherAddr) 
         {
            // This will not work because the city instance variable is private
            //   and the parameter is not of the same class type
            // addr.city = otherAddr.city;
            // But you can use the get method to access the city
            addr.setCity(otherAddr.getCity());
        }
    }

Try it in the code below.

|CodingEx| **Coding Exercise**

.. activecode:: PersonAddressGet
  :language: java
  :autograde: unittest
  :practice: T

  Run the code to see that the Person class can directly access the instance variables of objects of the same class, but cannot directly access the instance variable of an Address object because it is not of the same class. Change the code in the copyAddressFromAddress() method to use get/set methods instead.
  ~~~~
  public class Person
  {
      // instance variables
      private String name;
      private Address addr;  // instance variable of type Address defined below

      // constructor: initialize instance variable and call Address constructor to
      // make a copy
      public Person(String initName, Address initAddr)
      {
          name = initName;
          // Defensive copy of the Address argument
          addr =  new Address(
                             initAddr.getStreet(),
                             initAddr.getCity(),
                             initAddr.getState());
      }

      public void copyAddressFromPerson(Person otherPerson)
      {
          // otherPerson.addr will work because the parameter is of the same class Person
          addr = new Address(otherPerson.addr);       
      }

      // TODO: Change the code in this method
      public void copyAddressFromAddress(Address otherAddr) 
      {
          // This will not work because the instance variables are private
          //   and the parameter is not of the same class type
          // Change this code to use set/get methods!
          addr.street = otherAddr.street;
          addr.city = otherAddr.city;
          addr.state = otherAddr.state;
          addr.zipcode = otherAddr.zipcode; 
      }

      public String toString()
      {
          return "Name:" + name + "\n" + "Address:" + address;
      }

      public static void main(String[] args)
      {
          Address a1 = new Address("123 Main St", "Anytown", "12345");
          Address a2 = new Address("456 Elm St", "Othertown", "67890");
          Person p1 = new Person("Skyler", a1);
          Person p2 = new Person("Jordan", a2);
          System.out.println(p1);
          p1.copyAddressFromPerson(p2);
          System.out.println(p1);
          p1.copyAddressFromAddress(a1);
          System.out.println(p1);
      }
  }
  class Address
  {
        // instance variables
        private String street;
        private String city;
        private String state;
        private String zipcode;
        // constructor
        public Address(String initStreet, String initCity, 
                       String initState, String initZipcode) 
        {
            street = initStreet;
            city = initCity;
            state = initState;
            zipcode = initZipcode;
        }
        public String toString()
        {
            return street + "\n" + city + ", " + state + " " + zipcode;
        }
        public String getStreet()
        {
            return street;
        }
        public String getCity()
        {
            return city;
        }
        public String getState()
        {
            return state;
        }
        public String getZipcode()
        {
            return zipcode;
        }
        // Setters (makes the class mutable)
        public void setCity(String initCity) {
            city = initCity;
        }
   }
  ====
  import static org.junit.Assert.*;

  import org.junit.*;

  import java.io.*;

  public class RunestoneTests extends CodeTestHelper
  {
      @Test
      public void test1() 
      {
          String target = "addr.setCity";
          boolean passed = checkCodeContains("call to addr.setCity", target);
          assertTrue(passed);
      }
      @Test
      public void test2() 
      {
          String target = "otherAddr.getCity";
          boolean passed = checkCodeContains("call to otherAddr.getCity", target);
          assertTrue(passed);
      }
  }


Returning Objects
-------------------

Methods can also return objects. Remember that methods can only return the value of a variable. If the return value is of a primitive type like int or double, only a copy of the value is returned; the original variable cannot be changed. But when the return expression evaluates to an object reference, the reference is returned, not a reference to a new copy of the object. This means that there can be multiple references to the same object. If the object is mutable, then any changes made to the object through one reference will be seen through any other references to the object.

For example, the ``Person`` class can have a ``getAddress`` method that returns the ``Address`` instance variable which is an object. Since ``Address`` has set methods which make it mutable, the caller can change the Address object through the reference returned by the method.

.. code-block:: java

    public class Person
    {
        // instance variables
        private String name;
        private Address addr;  // instance variable of type Address       

        public Address getAddress()
        {
            return addr;
        }

        public static void main(String[] args)
        {
            Person p1 = new Person("Skyler", new Address("123 Main St", "Anytown", "12345"));
            System.out.println(p1);
            Address a = p1.getAddress();
            a.setCity("Othertown");
            System.out.println(p1);
        }
    }

Try it in the code below.

|CodingEx| **Coding Exercise**

.. activecode:: PersonReturnAddress
  :language: java
  :autograde: unittest
  :practice: T

  Run the code to see that the Person class can return the Address object which is mutable. Add code in the main method that changes the zipcode of the Address object returned by the getAddress method. It will change the zipcode in the Person object too.
  ~~~~
  public class Person
  {
      // instance variables
      private String name;
      private Address addr;  // instance variable of type Address defined below

      // constructor: initialize instance variable and call Address constructor to
      // make a copy
      public Person(String initName, Address initAddr)
      {
          name = initName;
          // Defensive copy of the Address argument
          addr =  new Address(
                             initAddr.getStreet(),
                             initAddr.getCity(),
                             initAddr.getState());
      }

      public Address getAddress()
      {
          return addr;
      }

      public String toString()
      {
          return "Name:" + name + "\n" + "Address:" + address;
      }

      public static void main(String[] args)
      {
          Person p1 = new Person("Skyler", new Address("123 Main St", "Anytown", "12345"));
          System.out.println(p1);
          Address a = p1.getAddress();
          // TODO: add code to change the zipcode of a to 11111
          //    using setZipcode
        
          // Does it change in p1 too?
          System.out.println(p1);
      }
  }
  class Address
  {
        // instance variables
        private String street;
        private String city;
        private String state;
        private String zipcode;
        // constructor
        public Address(String initStreet, String initCity, 
                       String initState, String initZipcode) 
        {
            street = initStreet;
            city = initCity;
            state = initState;
            zipcode = initZipcode;
        }
        public String toString()
        {
            return street + "\n" + city + ", " + state + " " + zipcode;
        }
        public String getStreet()
        {
            return street;
        }
        public String getCity()
        {
            return city;
        }
        public String getState()
        {
            return state;
        }
        public String getZipcode()
        {
            return zipcode;
        }
        // Setters (makes the class mutable)
        public void setCity(String initCity) {
            city = initCity;
        }
        public void setZipcode(String initZipcode) {
            zipcode = initZipcode;
        }
   }
  ====
  import static org.junit.Assert.*;

  import org.junit.*;

  import java.io.*;

  public class RunestoneTests extends CodeTestHelper
  {
      @Test
      public void test1() 
      {
          String target = "a.setZipcode";
          boolean passed = checkCodeContains("call to a.setZipcode", target);
          assertTrue(passed);
      }
      @Test
      public void test2() 
      {
           String output = getMethodOutput("main");
           String expect = "11111";

           boolean passed = getResults(expect, output, "11111 in output");
           assertTrue(passed);
      }
  }

|Groupwork| Coding Challenge : Friends and Birthdays
---------------------------------------------------------

.. image:: Figures/cake.jpg
    :width: 130
    :align: left
    :alt: Birthday cake

In this challenge, you will create a class ``Friend`` which keeps track of your friends' names and birthdays using another class called ``Date``.

1. Create a class called ``Date`` with the following instance variables as ints: month, day, and year. Add a constructor, getters, and setters for the instance variables.
2. Create a class called ``Friend`` with the following instance variables: name and birthdate which is of type ``Date``. 
3. Add a constructor that takes 2 parameters and initializes the instance variables, making sure to copy the birthdate parameter object.
4. Add a method called ``isBirthday`` that returns true if the birthdate matches the given date parameter. 
5. Test your methods in the main method by creating a Friend object with a friend's name and birthday. Then, create a Date object with today's date and call the ``isBirthday`` method to see if it is the friend's birthday.

.. activecode:: challenge-friend-birthday
  :language: java
  :autograde: unittest
  :practice: T

  Complete the Date and Friend classes below. The Friend class should have a method isBirthday that returns true if the birthdate matches the given date parameter. Test your methods in the main method.
  ~~~~
  class Date 
  {
     // Add instance variables for the month, day, and year as ints

     // Add a constructor that initializes the instance variables with int parameters

     // Add getters for the instance variables

     // Add at least 1 setter to make the class mutable
     
  }
  public class Friend
  {
      // Add instance variables for the name and birthdate using the Date class

      // Add a constructor that initializes the instance variables
      //   Make sure you copy the birthdate parameter object

      // Add a toString method

      // Add a method isBirthday that returns true if the birthdate matches the given Date parameter. 
      // You will need to check day, month, and year using getters.

      public static void main(String[] args)
      {
          // Create a Date object with your friend's birthday date 
         
          // Create a Friend object with a friend's name, phonenumber, and birthday

          // Create a Date object with today's date

          // Call the isBirthday method to see if today is the friend's birthday
          
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
           super("Friend");
       }
      @Test
      public void test1() 
      {
          String code = getCodeWithoutComments();
          String search = ".get";
          int num = countOccurences(code, search);

          boolean passed = num >= 3;

          getResults("3+", "" + num, "Date get methods called in isBirthday", passed);
          assertTrue(passed);
      }
      @Test
      public void test2() 
      {
          Friend tw = new Friend("Taylor Swift", new Date(12, 13, 1989));
          String output = tw.isBirthday(new Date(12, 13,1989)) + "";
          String expect = "true";
          boolean passed = getResults(expect, output, "Checking if friend Taylor Swift's bday is Date(12,13,1989)");
          assertTrue(passed);
      }
      @Test
      public void test2() 
      {
          Friend tw = new Friend("Taylor Swift", new Date(12, 13, 1989));
          String output = tw.isBirthday(new Date(1, 1,2025)) + "";
          String expect = "false";
          boolean passed = getResults(expect, output, "Checking if friend Taylor Swift's bday is Date(1,1,2025)");
          assertTrue(passed);
      }
  }



Summary
-------

- (AP 3.4.A.3) When a mutable object is a constructor parameter, the instance variable should be initialized with a copy of the referenced object. In this way, the instance variable does not hold a reference to the original object, and methods are prevented from modifying the state of the original object.

- (AP 3.6.A.1) When an argument is an object reference, the parameter is initialized with a copy of that reference; it does not create a new independent copy of the object. If the parameter refers to a mutable object, the method or constructor can use this reference to alter the state of the object. It is good programming practice to not modify mutable objects that are passed as parameters unless required in the specification.
- (AP 3.6.A.2) When the return expression evaluates to an object reference, the reference is returned, not a reference to a new copy of the object.
- (AP 3.6.A.3) Methods cannot access the private data and methods of a parameter that holds a reference to an object unless the parameter is the same type as the method’s enclosing class.


