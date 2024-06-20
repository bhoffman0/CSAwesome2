.. qnum::
   :prefix:  10-3-
   :start: 1

Recursion Summary
-------------------------

In this unit you learned about **recursion**.  A recursive method calls itself (contains a call to the method from inside of the method).  A recursive method should have at least one way to stop the recursion.  This is called a base case.

.. index::
    single: recursion

Concept Summary
=================

- **base case** - A way to stop the recursive calls. This is a return without a recursive call.
- **call stack** - The call stack keeps track of the methods that are called while the code executes. It keeps track of the local variables and where the call will return to.
- **recursive method** - A method that contains at least one call to itself inside the method.

Vocabulary Practice
======================

.. dragndrop:: ch12rec_match_1
    :feedback: Review the summaries above.
    :match_1: A method that calls itself|||recursive method
    :match_2: The stack of calls to methods|||call stack
    :match_3: The case when the method doesn't call itself|||base case

    Drag the item from the left and drop it on its corresponding answer on the right.  Click the "Check Me" button to see if you are correct.


Common Mistakes
===============
  -  Missing the recursive call.  Be sure to look for a call to the same method.
  -  Getting confused about when a recursive method returns and what it returns.
  -  Assuming you understand what the recursion is doing without tracing all of it.
