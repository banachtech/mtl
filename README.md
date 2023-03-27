# Multi-task Learning

MTL is about training related tasks together using a model with shared parameters. It appears that sharing parameters with tasks related to the main task improves the learning of the main task.

## Intuition

Suppose $x \sim p(x)$ is the input and $y, z \sim p(y,z\vert x)$ are the output. 

If $p(y,z\vert x) = p(y\vert x)p(z\vert x)$ then it makes sense to fit independent models (e.g. neural nets) $y = f(x; \theta)$ and $z = g(x; \phi)$. Learning $\theta$ does not affect learning $\phi$ and can be independently achieved.

If $y$ and $z$ are not independent, learning of $\theta$ can benefit from learning of $\phi$ due to the dependence structure. Learning may not need as much data as one would in the case of independence. 

The dependence between the models can be specified as $(y,z) = h(x; \psi)$, where a part of $\psi$ is common to both $y$ and $z$. For example, $h$ could be a neural network with two output that share a hidden layer.

## Mechanisms

1. Data amplification - effective increase in sample size due to additional information from the learning of related tasks

2. Representation bias - MTL tasks prefer shared layer representations that other tasks prefer and do not prefer representations that others do not


## Getting the most out of MTL
Source: Caruana (2012)

1. Use large hidden layers

2. Early terminate each task separately
Using a single net to predict all tasks is sub-optimal. Use validation set to early stop each task separately. Retain a copy of the net at the epoch where performance of each task is the best and use that copy for that task's prediction.

3. Use different learning rates for different tasks

4. Use a private hidden layer for the main task

5. Use some input as output. For example, GDP is published after a lag. Rather than using GDP as input, it can be predicted.

6. Use multiple representations of the same output e.g. one-hot encoding vs continuous

7. Sequential transfer e.g. if a trained model is available without the data used for training, generate synthetic data using the model with current data (i.e. use input to generate model predictions)

8. Similar tasks with different data distributions
Using one net for each task may be better, but enough data for each task may not be available. Using a single net by pooling data may be inefficient as it may not be accurate for each task. One option is to use a net with multiple output, each for a task. Error is propagated through one output for the corresponding input-target pair. This is useful in portfolio applications, where some underlying may not have sufficient data history.
