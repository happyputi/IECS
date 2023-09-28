## 
![Logo](./logo.png)

# Project Name
> The Iterative Exclusion of Compatible Samples
workflow for multi-SNP analysis in complex
diseases.


## Table of Contents
- [Project Name](#project-name)
  - [Table of Contents](#table-of-contents)
  - [General Information](#general-information)
  - [Features](#features)
  - [Usage](#usage)
  - [Contact](#contact)

## General Information
- IECS workflow is for multi-SNP analysis in complex
diseases.
- Existing epistasis detection algorithms can only detect the interaction between two SNPs, or have the problem of heavy computational workload.
- To simultaneously detect the relationship  between SNPs (single SNP and multi-SNP combinations) and complex diseases,IECS workflow is proposed.

## Features
- Strong recognition ability.
- Small amount of computation.


## Usage
How does one go about using it?
Provide various use cases and code examples here.
- Copy the "comparison" folder to the default working directory of R.
- Install MDR package.
- Install iecs package.
- To compare MDR, BOOST and IECS in the simulated data set with different noise, run "comparison-different noise-iteration 1000-MDR-BOOST-IECS" script.
- To compare MDR, BOOST and IECS in the simulated data set with different number of samples, run "comparison-different number of samples-iteration 1000-MDR-BOOST-IECS" script.
- To compare MDR, BOOST and IECS in the real data set, run "comparison-choosedata-IECS-MDR-BOOST" script. You can modify two parameters of necessaryconditions function: "consistencythreshold" and "coveragethreshold". You can also modify two parameters of iecs function: "iteration" and "consistencythreshold".
- The data is stored in the "data" directory.
- View the results in the "result" directory or in the R window.
- To generate simulated data with different pathogenic models, different noise and different number of samples, employ generatedata function.


## Contact
Created by [@gaojun](gaojun@mail.hzau.edu.cn)  and [@xu wei](eric_xu@webmail.hzau.edu.cn)- feel free to contact us!