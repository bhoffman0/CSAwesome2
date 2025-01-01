.. include:: ../common.rst

.. qnum::
   :prefix: 4-2-
   :start: 1


Data Sets
=========

A **data set** is a collection of specific pieces of information or data. For example, the following table is a data set that keeps track of information about students. Data can be represented in a diagram by using a chart or table. Here it is shown as a spreadsheet table with columns for the first name, last name, email, and GPA. Spreadsheet software like Excel and Google Sheets store data in a table and provide functions to manipulate and calculate with the data. 

Type in another row of data to the table below on row 4 with your choice of values for the name, email, and GPA. 

.. spreadsheet:: disneySheet
    :mindimensions: 4,4
    :colwidths: 100,100,200,100
    :coltitles: 'firstname','lastname','email','GPA'

    Mickey, Mouse, mickey@disney.com, 3.5
    Minnie, Mouse, minnie@disney.com, 4.0 
    Donald, Duck, donald@disney.com, 3.0
    Type here,,,
    ====
    assert A4 != "Type here"

Data sets can be manipulated and analyzed to solve a problem or answer a question. Data in a table or chart can be used to plan the algorithm that will be used to manipulate the data. For example, how would you find the average GPA of the students in the table above? You would need to access each GPA value in the table and then add them up and then divide by the number of rows.

When analyzing data sets, values within the set are accessed and utilized one at a time and then processed according to the desired outcome. Loops can be used to access and process each value in a data set. Let's practice this with pseudocode.

.. parsonsprob:: algorithm-avg-gpa
   :practice: T
   :numbered: left
   :adaptive:

   Put the following pseudocode algorithm steps for calculating the average GPA of the students in the table above. Make sure some of the steps are indented to be inside the loop. Click on Check Me to see if you are right.
   -----
   Initialize *sum* to 0.
   =====
   Loop through each row in the table:  
   =====
      Add the GPA value of each row to *sum*.
   =====
   Divide *sum* by the number of rows in the table 
   to get the average GPA.

What if your school wants to print out an honor roll of students with a GPA of 3.5 or higher? How would you write an algorithm to do this?

.. shortanswer:: honorroll

   Write pseudocode for an algorithm that prints out the names of students with a GPA of 3.5 or higher given a table of student data where one column is the GPA. Make sure you use repetition (loop) and selection (if) in your algorithm.

In the next lessons, we will learn about data structures like Java arrays that can be used to store data sets. We will use loops to access and manipulate the data in the arrays. 

Summary
--------

- (AP 4.2.A.1)	A **data set** is a collection of specific pieces of information or data.
- (AP 4.2.A.2) Data sets can be manipulated and analyzed to solve a problem or answer a question. When analyzing data sets, values within the set are accessed and utilized one at a time and then processed according to the desired outcome.
- (AP 4.2.A.3) Data can be represented in a diagram by using a chart or table. This visual can be used to plan the algorithm that will be used to manipulate the data.