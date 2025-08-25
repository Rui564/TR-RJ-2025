import tensorflow as tf
import numpy as np

celsius = np.array([-40,-10,0,8,15,22,38], dtype=float)
fahrenheit = np.array([-40,14,32,46,59,72,100], dtype=float)

#capa = tf.keras.layers.Dense(units=1,input_shape=[1])
#modelo = tf.keras.Sequential([capa])
oculte_1 = tf.keras.layers.Dense(units=3,input_shape=[1])
oculte_2 = tf.keras.layers.Dense(units=3)
sortida = tf.keras.layers.Dense(units=1)
model = tf.keras.Sequential([oculte_1, oculte_2, sortida])



model.compile(
    optimizer = tf.keras.optimizers.Adam(0.1),
    loss='mean_squared_error'
)

print('Començem a entrenar...')
historial = model.fit(celsius, fahrenheit, epochs=100, verbose=1)
print('Model entrenat!')

import matplotlib.pyplot as plt
plt.xlabel("# Epoca")
plt.ylabel("Magnitud de perdúa")
plt.plot(historial.history["loss"])
plt.show()

print("Fem una predicció!")
resultat = model.predict(np.array([[100.0]], dtype=float))
print("El resultado es" + str(resultat) + "fahrenheit")

print('Variables interns del model')
print(oculte_1.get_weights())
print(oculte_2.get_weights())
print(sortida.get_weights())