# Statistical Learning Project: ECG data processing
Planning to use PCA + SVM and Reduced Rank LDA to learn the model.<br>
Put the data folder to the root of the project before running the code!<br>
Still Working...

PCA seems blind to classes when extracting data from the ECG graph itself, which makes different patients with same disease have quite different feature. We should take account the class tags during dimensionality reduction. In this case, Fisher LDA(Reduced Rank LDA) seems very appropriate to the project!
