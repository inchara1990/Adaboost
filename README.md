# Adaboost

Adaptive boosting is an algorithm which can be used on top of any algorithms to improve accuracy. The MATLAB code explores this algorithm using a basic decision stump. In a given 2D sample points, the best horizontal or vertical decision stump is calculated based on the misclassification rate. Three parameters are stored about the stump - threshold, vertical or horizontal, side( left or right whichever side is positive). At every iteration the wiegths on the misclassified instance is increased.
