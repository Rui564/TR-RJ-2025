import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler
import random
import os

seed = 42
np.random.seed(seed)
tf.random.set_seed(seed)
random.seed(seed)
os.environ["PYTHONHASHSEED"] = str(seed)

X = np.array([
    [1, 0,   8,  8,  7,  9],
    [1, 3,   8,  8, 10,  8],
    [1, 5,   5,  8,  7,  0],
    [1, 1,   6, 10,  8, 10],
    [0, 2.5, 7,  9,  9,  7],
    [0, 0,   8,  8,  6,  5],
    [1, 4,   6,  5,  8,  8],
    [1, 10,  4,  6,  5,  4],
    [0, 1,   6,  7,  8,  7],
    [1, 5,   6,  1,  6,  6],
    [1, 3,   6, 10,  6,  6],
    [0, 1,   8,  3,  1,  1],
    [1, 2,   6,  6,  9,  3],
    [1, 1,   3, 10,  9,  9],
    [1, 1,   7, 10,  9,  9],
    [1, 1,   7,  8,  10, 9],
    [0, 0,   7,  10, 10, 10],
    [1, 0,   7,  10,  9,  10]
], dtype=float)

y = np.array([8,8,6,9,8,6,7,4,8,6,6,1,9,9,8,9,10,10], dtype=float)

scaler = MinMaxScaler()
X_scaled = scaler.fit_transform(X)

scaler_y = MinMaxScaler()
y_scaled = scaler_y.fit_transform(y.reshape(-1, 1)) 

model = tf.keras.Sequential([
    tf.keras.layers.Dense(32, activation="relu", input_shape=[6]),
    tf.keras.layers.Dense(16, activation="relu"),
    tf.keras.layers.Dense(1)
])

model.compile(
optimizer=tf.keras.optimizers.Adam(0.01),
loss="mean_squared_error",
metrics = ["mae"]
)

historial = model.fit(X_scaled, y_scaled, epochs=400, verbose=1)
plt.plot(historial.history["loss"])
plt.xlabel("Època")
plt.ylabel("Pèrdua (loss)")
plt.show()

nou_entrada = np.array([[1, 0,   7,  10,  9,  10]])
nou_entrada_scaled = scaler.transform(nou_entrada)

prediccio = model.predict(nou_entrada_scaled)
prediccio_real = scaler_y.inverse_transform(prediccio)
print("Nota prevista:", round(prediccio_real[0][0],2))

