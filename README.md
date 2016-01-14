# Statistical Learning Project: ECG data processing
Planning to use PCA + SVM and Reduced Rank LDA to learn the model.<br>
Put the data folder to the root of the project before running the code!<br>
Still Working...

PCA seems blind to classes when extracting data from the ECG graph itself, which makes different patients with same disease have quite different feature. We should take account the class tags during dimensionality reduction. In this case, Fisher LDA(Reduced Rank LDA) seems very appropriate to the project!

I have to admit, that although I used FLDA in my project and it seems to work well in dividing the classes, it becomes worse at cross-validation. What is wrong? I think the project is poisonous.
