#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Universidad Nacional Autónoma de México
# Facultad de Ingeniería
# Temas Selectos de Sistemas Inteligentes
# 2020-1
# Proyecto DNNs aplicadas a MNIST
# Aguilar Enriquez Paul Sebastian


# In[2]:


import mnist_loader
# import network2
import network3
from network3 import Network, ConvPoolLayer, FullyConnectedLayer, SoftmaxLayer


# In[3]:


# Cargamos MNIST
# Con network2
# training_data, validation_data, test_data = mnist_loader.load_data_wrapper()
# Con network3
training_data, validation_data, test_data = network3.load_data_shared()


# In[4]:


# Parametros
inputs = 784
layer1 = 30
outputs = 10
epochs = 40
mini_batch_size = 10
learning_rate = 0.1
regularization_parameter = 5.0

# Configuramos la red
# Con network2
# net = network3.Network([784, 30, 10])
# Con network3
net = Network([
    FullyConnectedLayer(n_in=inputs, n_out=layer1),
    SoftmaxLayer(n_in=layer1, n_out=outputs)], mini_batch_size)

# Entrenamos la red
# Con network2
# net.SGD(training_data, epochs, mini_batch_size, learning_rate, regularization_parameter, evaluation_data=validation_data, monitor_evaluation_accuracy = True)
# Con network3
net.SGD(training_data, epochs, mini_batch_size, learning_rate, validation_data, test_data, regularization_parameter)


# In[5]:


# Parametros
layer2 = 20

# Configuramos la red
net = Network([
    FullyConnectedLayer(n_in=inputs, n_out=layer1),
    FullyConnectedLayer(n_in=layer1, n_out=layer2),
    SoftmaxLayer(n_in=layer2, n_out=outputs)], mini_batch_size)

# Entrenamos la red
net.SGD(training_data, epochs, mini_batch_size, learning_rate, validation_data, test_data, regularization_parameter)


# In[6]:


# Parametros
layer3 = 20

# Configuramos la red
net = Network([
    FullyConnectedLayer(n_in=inputs, n_out=layer1),
    FullyConnectedLayer(n_in=layer1, n_out=layer2),
    FullyConnectedLayer(n_in=layer3, n_out=layer3),
    SoftmaxLayer(n_in=layer3, n_out=outputs)], mini_batch_size)

# Entrenamos la red
net.SGD(training_data, epochs, mini_batch_size, learning_rate, validation_data, test_data, regularization_parameter)


# In[ ]:




