---
title: "README"
author: "Stacy Irwin"
date: "8/26/2019"
output: html_document
---

This README describes the files included in this respository, and steps to repoduce the results.


## Instructions

1. Download the data from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the files into `/data/uci` such that the next folder structures listed within it are `train` and `test`.
3. Run the R script, `run_analysis.R`
4. The final output file produced (for this assignment) is `Tidy_Data_Set.csv`. The file `Extracted_Data_Set.csv` is an intermediary file.

More information on the data cleaning process is in the [Code Book](CodeBook.md).

## Files

Files and folders contained in the root directory of this repository:

* `run_analysis.R` -  A script that reads in raw data for the assignment, and outputs 2 tidy data sets.
* `data/uci/` - Directory containing the original data files for the assignment.
* `CodeBook.md` - Further description of the contents of `data/`, the plain english steps performed by `run_analysis.R`, and the parameters by which the data was transformed to the outputs.
* `Extracted_Data_Set.csv` (optional) - Output #1 from `run_analysis.R`. The resulting merged, cleaned, labelled, and tidy dataset resulting from steps 1 through 4. (see `CodeBook.md`)
* `Tidy_Data_Set.csv` - Output #2 from `run_analysis.R`. The final summarized tidy data set, containing the means of data columns in `Extracted_Data_Set.csv` groubed by Subject and Activity.

More ifnormation on the original data source is available in:
    
* `/data/uci/features_info.txt`, and
* `/data/uci/README.txt`

## Packages

The `run_analyis.R` script requires the `data.table` and `dplyr` R packages.

