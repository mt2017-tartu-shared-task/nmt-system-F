# INTERMIEDIATE REPORT

We had some issues training our data. First of all, we had to generate an XML file just to have the information (noun, adjective…) about each word. With this he had problems generating the XML file like:

Error occurred during initialization of VM
Could not reserve enough space for object heap
Error: Could not create the Java Virtual Machine.
Error: A fatal exception has occurred. Program will exit.

To fix this, we changed the environment of variables and add some new ones just to generate the XML file. 

Once we did that, we had to do a program to “concatenate” or just to add the information to each word and generate a .txt with it.

The treakiest part of this is to do it with the estonian model because we don’t have any source to generate the XML file mentioned before hand.
