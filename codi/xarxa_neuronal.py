from sklearn.datasets import fetch_openml
# He canviat fetch_mldata per fetch_openml
mnist = fetch_openml('mnist_784', version=1, as_frame=False)
# He afegit as_frame=False per obtenir les dades en format NumPy
# He canviat la versió a 1 per evitar problemes de compatibilitat
# He canviat el nom MNIST original per mnist_784

X,y = mnist.data, mnist.target
X = X / 255.0  
# Normalitzar les dades

import numpy as np
y_new = np.zeros(y.shape)
y = y.astype(np.int64)  # convertir de string a enter
y_new = np.zeros(y.shape)
indices = np.where(y == 0)[0]  # troba els índexs on y és 0
if len(indices) > 0:
    y_new[indices[0]] = 1

y = y_new

m = 60000
m_test = X.shape[0] - m

X_train, X_test = X[:m].T, X[m:].T
y_train, y_test = y[:m].reshape(1,m), y[m:].reshape(1,m_test)

np.random.seed(138)
shuffle_index = np.random.permutation(m)
X_train, y_train = X_train[:, shuffle_index], y_train[:, shuffle_index]

import matplotlib.pyplot as plt

i = 3
plt.imshow(X_train[:,i].reshape(28,28), cmap = 'binary')
plt.axis("off")
plt.show()
# print(y_train[:,i])

print(type(plt.imshow(X_train[:,i].reshape(28,28), cmap = 'binary')))