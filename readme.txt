1. Copy the "comparison" folder to the default working directory of R.
2. Install MDR package.
3. Install iecs package.
4. To compare MDR, BOOST and IECS in the simulated data set with different noise, run "comparison-different noise-iteration 1000-MDR-BOOST-IECS" script.
5. To compare MDR, BOOST and IECS in the simulated data set with different number of samples, run "comparison-different number of samples-iteration 1000-MDR-BOOST-IECS" script.
6. To compare MDR, BOOST and IECS in the real data set, run "comparison-choosedata-IECS-MDR-BOOST" script. You can modify two parameters of necessaryconditions function: "consistencythreshold" and "coveragethreshold". You can also modify two parameters of iecs function: "iteration" and "consistencythreshold".
7. The data is stored in the "data" directory.
8. View the results in the "result" directory or in the R window.
9. To generate simulated data with different pathogenic models, different noise and different number of samples, employ generatedata function.