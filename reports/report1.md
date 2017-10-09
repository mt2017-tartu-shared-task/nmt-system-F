[B# Milestone 1: Hand in the baseline system and translation  [Report]
TEAMNAME team:
 * @eruizdeloizaga002
 * @vampnik

## Our project board:
![alt text](https://github.com/mt2017-tartu-shared-task/nmt-system-F/blob/master/reports/Selection_043.png "Project Board")

## This milestone tasks description:
### Corpus Preparation
Starting from raw data, we applied following preprocessing steps:

* corpora concatenating (<https://github.com/mt2017-tartu-shared-task/nmt-system-F/blob/master/scripts/2-prepare.sh>): we got one big parallel text corpus of 19051439 lines 
* data shuffling (<https://github.com/mt2017-tartu-shared-task/nmt-system-F/blob/master/scripts/2-prepare.sh>)): to feed sentences to NMT system later in the random order  
* data splitting (<https://github.com/mt2017-tartu-shared-task/nmt-system-F/blob/master/scripts/2-prepare.sh>)): 18976439 training examples, 50000 test examples, and 15000 development examples
* tokenization (<https://github.com/mt2017-tartu-shared-task/nmt-system-F/blob/master/scripts/3-tokenize.sh>): we tokenized the examples.
* true-casing (<https://github.com/mt2017-tartu-shared-task/nmt-system-F/blob/master/scripts/4-true-case.sh>): first train true-casing the models adn then make the true casing.
* filtering (<https://github.com/mt2017-tartu-shared-task/nmt-system-F/blob/master/scripts/5-filter-sentence-pairs.sh>): Filter the empty spaces and the strange sentences from the training.
* BPE (<https://github.com/mt2017-tartu-shared-task/nmt-system-F/blob/master/scripts/6-apple-bpe.sh>): we used joint vocabulary of size 100000

We used [Moses](http://www.statmt.org/moses/) scripts to do basic preprocessing, and [BPE](https://github.com/rsennrich/subword-nmt) for the subword segmentation. 

### Model Training
We used 1 Tesla P100 GPU Machine provided by [HPC center of the University of Tartu](https://www.hpc.ut.ee/en_US/web/guest/home) to train our model with vocablary of size __N__. The model we trained is the default [OpenNMT-py](https://github.com/OpenNMT/OpenNMT-py) model, which consists of a 2-layer LSTM with 500 hidden units on both the encoder/decoder.

We had trained our best model for ~5 days, 8 epochs. Development set perplexity was 4.94 We performed early stopping to stop the training process. You can find the script we used to run training here (<https://github.com/mt2017-tartu-shared-task/nmt-system-F/blob/master/scripts/8-train.sh>).

### Translating and Evaluating Results
We performed an inference and got unpostprocessed English hyps file. 

We used this file, processed reference file, and BLEU metric to evaluate the translation performance of our model, and got __X__ points.

_________________________________________________________________________________________________________________
For the next milestone, we will focus on some more advanced evaluation and error analysis technics.    
