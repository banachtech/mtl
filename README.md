# Multi-task Learning

MTL is about training related tasks together using a model with shared parameters. It appears that sharing parameters with tasks related to the main task improves the learning of the main task.

## Intuition

Suppose $x \sim p(x)$ is the input and $y, z \sim p(y,z\vert x)$ are the output. 

If $p(y,z\vert x) = p(y\vert x)p(z\vert x)$ then it makes sense to fit independent models (e.g. neural nets) $y = f(x; \theta)$ and $z = g(x; \phi)$. Learning $\theta$ does not affect learning $\phi$ and can be independently achieved.

If $y$ and $z$ are not independent, learning of $\theta$ can benefit from learning of $\phi$ due to the dependence structure. Learning may not need as much data as one would in the case of independence. 

The dependence between the models can be specified as $(y,z) = h(x; \psi)$, where a part of $\psi$ is common to both $y$ and $z$. For example, $h$ could be a neural network with two output that share a hidden layer.

