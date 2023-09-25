#tech  #computer-sience 

---
[LGBMClassifier: A Getting Started Guide](https://www.kdnuggets.com/2023/07/lgbmclassifier-gettingstarted-guide.html)

The premise of the ensemble models is to improve the model performance by combining the predictions from different models by reducing their errors. There are two popular ensembling techniques: bagging and boosting. 

Bagging, aka Bootstrapped Aggregation, trains multiple individual models on different random subsets of the training data and then averages their predictions to produce the final prediction. Boosting, on the other hand, involves training individual models sequentially, where each model attempts to correct the errors made by the previous models.


**GOSS Gradient-based One-Side Sampling**
Keep all the instances with large gradients and performs random sampling on the instances with large gradients and performs random sampling on t he instances with small gradients.

📔The intuition behind this is that instances with large gradients are harder to fit and thus carry more information. 

**What is Exclusive Feature Bundling (EFB)?**
 

In a sparse dataset, most of the features are zeros. EFB is a near-lossless algorithm that bundles/combines mutually exclusive features (features that are not non-zero simultaneously) to reduce the number of dimensions, thereby accelerating the training process. Since these features are "exclusive", the original feature space is retained without significant information loss.

