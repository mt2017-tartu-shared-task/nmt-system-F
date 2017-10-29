The main problem of our translation system is the gramatical structure. As we can see in many examples, the structure of the sentences is wrong structured due to the wrong position of the words in that sentence. Here are some examples:

1.
H - Tests were carried out in Germany , Hungary , the Netherlands , Slovenia and Slovakia on nearly 200 sets of light strings in all price categories .
M - The tests were carried out in Germany , Hungary , the Netherlands , Slovenia and Slovakia on a set of price categories of almost 200 sheep .

2.

H - This allowed EU observers to move into those zones to monitor the ceasefire .
M - This allowed EU observers to move to monitor the ceasefire in these areas .

3.

H - IBM SOA Integration Services
M - Integration services of IBM SOA

4.

H - Latvia is represented in the Arab Republic of Egypt by Ambassador Maris Selga .
M - Latvia is represented by Maris Selga since the Arab Republic of Egypt .

Sometimes, the meaning could be the same but the structure is totally different.

So, for solving this, maybe we can try incorporating linguistic info (Adding Linguistic Annotation, page 77, Soft 1). Recent work in statistical machine translation has demonstrated the benefits of linguistically motivated models. These models, while they translate sentences,  they also build up the syntactic structure of the output sentence. So maybe this could solve our problem with the structure of the output sentence due to the fact that this type of modification has the aim to improve the syntactical structure of the translation.


Also in some translated sentences happens that the structure is correct but one of the words is not totally correct in that context. Some exaples:

1.
H - Just over 40% of the samples were made in China .
M - Only over 40% of the plays were made in China .

2.
H - Dear Sir / Madam
M - Dear Mr / Mrs .

3.
H - What does this theory tell us about our world ?
M - What does this theory tell us about the world ?

4.
H - Comments that are already in the document before you change the name or initials are not updated .
M - Comments which are already in the document before changing the name or initials are not refresh .


For this problem, we could try the modification of Ensemble Decoding. For doing this we are not just going to build one system for our problem, but multiple ones and then combine them. This is how it works: each system makes different mistakes (as we know) so when two systems agree, then they are more likely both right, rather than both make the same mistake. So with this modification, we will get a more efficent system in terms of translating
 
