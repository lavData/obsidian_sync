#tech  #data-science 

--- 
[Introduction to Loss Functions](https://www.datarobot.com/blog/introduction-to-loss-functions/)

# What's a loss function?
A method of evaluating how well algorithm model.
If model good, it'll output lower number

VERY BASIC  loss function is abs(y_predicted - y)

## Mean squared error
```python
def MSE(y_predicted, y):
	squared_error = (y_predicted - y) ** 2
	sum_squared_error = np.sum(squared_error)
	mse = sum_squared_error / y.size
return(mse)
```


## Likelihood loss

[0.4, 0.6, 0.9, 0.1] for the ground truth labels of [0, 1, 1, 0]. The likelihood loss would be computed as (0.6) * (0.6) * (0.9) * (0.9) = 0.2916


## Log loss
Use log of the corrected probabilities
