# gettingandcleaningdata
This is for the coursera course
                                                                        
> First of all, Hello and thank you for reading this and grading my work. 

This is the Read.me file for an analysis of the 
"Human Activity Recognition Using Smartphones Dataset Version 1.0"
dataset provided by:

"Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws"

This is a brief description of what the run_analysis.R file in this folder does.

1. Getting data from files comprising the original dataset mentioned above.
A single dataset with all variables and observations is created by:
  a. Loading all four data files into R.
  b. Renaming the first variables of each pair of datasets.
  c. Combining the test and train datasets with their respective labels. 
  d. Combining the resulting two datasets from a. into a single one by appending the test dataset to the train dataset. 

2. Replacing the numbers representing activities in the dataset with the actual activity label/description by:
  a. Loading the activity labels into R.
  b. Spliting the relevant column from the others.
  c. Replacing the numbers in the dataset with the actual activity descriptions using a for loop.

3. Rearanging data and calculating mean for each activity for all subjects combined by:
  a. Rearanging the data using melt().
  b. Aggregating all rows with the same activity into their mean. 

4. Rearanging data and calculating mean for each activity per subject by:
  a. Rearanging the data using melt().
  b. Aggregating all rows with the same activity AND subject into their mean. 

5. Combining datasets from 3. and 4. 
6. Adding descriptive names to variables by:
  a. reading variable titles (features) into R.
  b. Getting the relevant column from the titles dataset.
  c. renaming the variables with their titles from b. using a for loop.

>> this dataset is stored as "result"

7. Creating a seperate dataset with means and standard deviation for each variable by:
  a. rearanging the dataset from 6. using melt().
  b. creating a new dataset with two new columns for means and standard deviations respectively using ddply.

>> this dataset is stored as "measurementssummary"

