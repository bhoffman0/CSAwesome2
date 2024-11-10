.. include:: ../common.rst

.. qnum::
   :prefix: 2-1-
   :start: 1

|Time45|

Algorithms with Selection and Repetition
=========================================

.. index::
   single: selection
   single: repetition
   single: sequencing
   single: algorithm
   single: pseudocode

Every algorithm consists of a sequence of steps. Up until now, we have been writing code one line at a time in sequence which then gets executed by the computer in that sequential order by default. However, we can create more complex algorithms that do not follow the default sequential order. In this unit, we will learn to branch the code into different paths or repeat a block of code. 
 
The building blocks of algorithms are **sequencing**, **selection**, and **repetition**. Algorithms can contain selection, through decision making, and repetition, via looping. In fact, it's been proven that all algorithms for problems that can be solved on a computer can be constructed by using just these three control structures: sequence, selection, and repetition as seen below.

.. figure:: Figures/algorithms.png
    :width: 350px
    :align: center
    :figclass: align-center

    Figure 1: Sequence, Selection, and Repetition 


Selection
----------

Selection is the process of making a choice based on a true or false decision. 
In programming, selection (also called branching) occurs when a choice of how the execution of an algorithm will proceed is based on a true or false decision. An algorithm may take different paths based on certain conditions, often using true/false logic.

|Exercise| **Check Your Understanding**

.. clickablearea:: clickSelection
    :question: Click on all of the selection (decision or branching) phrases in the following algorithm.
    :feedback: Selections are made based on a true or false decision. Look for the word "if" to identify selections.
    :iscode:
   
    Morning routine:
    :click-incorrect:Wake up.:endclick:
    :click-incorrect:Snooze for 5 more minutes.:endclick:
    :click-incorrect:Check your phone and the weather:endclick:
    :click-correct:If there is a text from your friend, answer it.:endclick:
    :click-incorrect:Brush teeth and shower.:endclick:
    :click-correct:If it’s cold, wear a sweater.:endclick:
    :click-correct:Check if you have homework due. If so, pack it in your bag.:endclick:
    :click-correct:Put on your sunglasses if it's sunny.:endclick:
    :click-incorrect:Leave for school or work.:endclick:




Repetition
--------------

Repetition is when a process repeats itself until a desired outcome is reached. In programming, repetition is achieved through loops. A **loop** allows an algorithm to repeat certain actions until a specified condition is met. Another term commonly used for repetition is **iteration**.

|Exercise| **Check Your Understanding**

.. clickablearea:: clickRepetition
    :question: Click on all of the repetition phrases in the following algorithm.
    :feedback: Repetition is when a process repeats itself until a desired outcome is reached. Look for the word "repeat" or "all" or "keep" to identify repetition.
    :iscode:
   
    Morning routine 2:
    :click-incorrect:Wake up.:endclick:
    :click-correct:Snooze for 5 more minutes. Keep waking up and snoozing for the next 15 minutes:endclick:
    :click-correct:If there is a text from your friend, answer it. Do this for all of your texts.:endclick:
    :click-incorrect:Brush teeth and shower.:endclick:
    :click-incorrect:If it’s cold, wear a sweater.:endclick:
    :click-incorrect:Check if you have homework due. If so, pack it in your bag.:endclick:
    :click-correct:Repeat packing items until your bag is ready. :endclick:
    :click-incorrect:Leave for school or work.:endclick:



Algorithms with Pseudocode and Flowcharts
-------------------------------------------

For complex problems, it is important to plan your solution before writing code. **Pseudocode** is a simplified, informal way of describing the steps in an algorithm in a human language like English but following the sequence, selection, and repetition structure of a programming language.  **Flowcharts** are diagrams that represent the steps in an algorithm like below. Selection is usually represented as a triangle in a flowchart, and arrows are used to show repetition. Both pseudocode and flowcharts are tools that help you plan your algorithm before writing code.

.. figure:: Figures/Condition-two.png
    :width: 350px
    :align: center
    :figclass: align-center

    Figure 2: Flowchart for Selection branching the code into two paths

The order in which sequencing, selection, and repetition are used contributes to the outcome of the algorithm.   In the following pseudocode, put the steps of the algorithm in order and then decide what the outcome will be based on the order of the steps and the conditions.

|Exercise| **Check Your Understanding**


.. parsonsprob:: algorithm-gift
   :practice: T
   :numbered: left
   :adaptive:

   Put the following pseudocode algorithm steps for buying a birthday gift for your friend in order. Make sure some of the steps are indented to be inside the repetition and that you buy the more expensive gifts first. Click on Check Me to see if you are right.
   -----
   You have *total* amount of money to spend on a birthday gift for your friend.
   =====
   Repeat while you still have money in *total*:  
   =====
      If you have more than $25, buy a $25 gift card and subtract 20 from total. 
   =====    
      If you have more than $10, buy a small cake and subtract 10 from total.
   =====
      If you have more than $5, buy some candy and subtract $5 from total.
   =====
      If you have more than $1, buy a card and subtract $1 from total.
   =====
      Otherwise, give them the change. 



.. mchoice:: trace-algorithm-gift1
    :answer_a: You will buy a gift card, a small cake, some candy, and a card.
    :answer_b: You will buy a small cake and some candy.
    :answer_c: You will buy a small cake, some candy, and a card.
    :answer_d: You will buy 2 cakes and some candy.
    :correct: c
    :feedback_a: Incorrect. You will not have enough money to buy all of these items.
    :feedback_b: You still have a $1 left.
    :feedback_c: Yep!
    :feedback_d: Incorrect. You will not have enough money to buy all of these items.

    Given the pseudocode for buying a gift above, assume you have $16 to spend. What will be the outcome of the algorithm?

.. mchoice:: trace-algorithm-gift2
    :answer_a: You will give them a gift card, a small cake, some candy, and a card.
    :answer_b: You will give them a small cake and some candy.
    :answer_c: You will give them a small cake, some candy, and a card.
    :answer_d: You will give them 2 cakes, a card, and $1.
    :correct: d
    :feedback_a: Incorrect. You will not have enough money to buy all of these items.
    :feedback_b: You still have money left.
    :feedback_c: You still have money left.
    :feedback_d: Yep! That's a lot of cake!

    Given the pseudocode for buying a gift above, assume you have $22 to spend. What will be the outcome of the algorithm?

|Groupwork| Programming Challenge : Algorithms
------------------------------------------------

In this group activity, you will work together to create an algorithm for a common problem: choosing a snack!  Create pseudocode for this problem. Make sure you include selection and repetition in your algorithm. For example, if there is no chocolate, you may want to keep searching for another snack. If you're thirsty, you may want to consider the drinks in the fridge. You may want to consider every item in the fridge or your leftover halloween candy stash before deciding on the perfect snack. Be creative!

.. shortanswer:: challenge-algorithm-snack

   Write your pseudocode for choosing a snack here. Include selection and repetition in your algorithm. Be creative!


Summary
----------

- (AP 2.1.A.1) The building blocks of algorithms include sequencing, selection, and repetition.
- (AP 2.1.A.2) Algorithms can contain selection, through decision making, and repetition, via looping.
- (AP 2.1.A.3) Selection occurs when a choice of how the execution of an algorithm will proceed is based on a true or false decision.
- (AP 2.1.A.4) Repetition is when a process repeats itself until a desired outcome is reached.
- (AP 2.1.A.5) The order in which sequencing, selection, and repetition are used contributes to the outcome of the algorithm.




