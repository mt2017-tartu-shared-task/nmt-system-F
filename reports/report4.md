# INTERMIEDIATE REPORT

We had some issues training our data. First of all, we had to generate an XML file just to have the information (noun, adjective…) about each word. With the Using Stanford CoreNLP, we could generate an XML file which will contain the information of our input text. It will keep the information as shown belog (an XML file):

<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet href="CoreNLP-to-HTML.xsl" type="text/xsl"?>
<root>
  <document>
    <sentences>
      <sentence id="1">
        <tokens>
          <token id="1">
            <word>Stanford</word>
            <lemma>Stanford</lemma>
            <CharacterOffsetBegin>0</CharacterOffsetBegin>
            <CharacterOffsetEnd>8</CharacterOffsetEnd>
            <POS>NNP</POS>
            <NER>ORGANIZATION</NER>
            <Speaker>PER0</Speaker>
          </token>
          <token id="2">
           ...
          </token>
...

### Problems
 
With this he had problems generating the XML file like:

*Error occurred during initialization of VM
Could not reserve enough space for object heap
Error: Could not create the Java Virtual Machine.
Error: A fatal exception has occurred. Program will exit.*

To fix this, we changed the environment of variables and add some new ones just to generate the XML file. 

Once we did that, we had to do a program to “concatenate” or just to add the information to each word and generate a .txt with it. With this, we will train our system using the model explained previously. This will fix our problems with grammar and the structure with sentences which is the main issue of our translation system.

The treakiest part of this is to do it with the estonian model because we don’t have any source to generate the XML file mentioned before hand.
