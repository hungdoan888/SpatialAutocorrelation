# Spatial Autocorrelation
- Automatic reconstruction has been an ongoing problem for decades.  Current methods, such as nearest neighbor approaches of automatic reconstruction only obtain about 95% accuracy.  New methods such as spatial autocorrelation and machine learning are required to achieve automatic reconstruction with over 99% accuracy.  In this paper, we will discuss the various problems when it comes to automatic reconstruction.  We focus on spatial autocorrelation as a method for associating radar tracks to GPS objects.  Specifically, we use the Moran's I statistic which uses a spatial weights matrix to define neighbors to be correlated.  We find that this method works well for long living tracks and is able to accurately correlate these tracks to GPS data.  However, with shorter tracks, the results are not as concise and other methods may have to be used for these short lived tracks.  We use the results from the Moran's I statistic as predictors to feed in to MATLAB's classification learner to determine if tracks are correlated or not.  However, due to lack of a sufficient data set, the model produced was not accurate enough to use for automatic reconstruction. 
- <a href="SpatialAutoCorrelation.pdf" target="_blank">SpatialAutoCorrelation.PDF</a>

# Motivation
- School/Work Project - Reconstruction done manually tedious and time consuming process.  My goal is to automate the process.  Through nearest neighbor approaches, 95% accuracy is acheivable but other methods such as spatial autocorrelation and machine learning are required to achieve over 99% accuracy.

# Screenshots
![Alt text](track555vy.png?raw=true "track555vy")
![Alt text](confusion_matrix.PNG?raw=true "confusion_matrix")

# Tech/Framework used
- MATLAB
- Statistics and Machine Learning Toolbox

# How to use
- Run project_main.m to generate plots (Permission required for the data used to create plots)
