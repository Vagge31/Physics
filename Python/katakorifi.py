import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(0,2,1000)
g = 9.81
v0_j = 10
v0_m = 15
y_j = v0_j*t - 0.5*g*t**2
y_m = v0_m*t - 0.5*g*t**2
plt.plot(t,y_j, label="Jim")
plt.plot(t,y_m, label="Mark")
plt.xlabel("Time")
plt.ylabel("Height")
plt.grid()
plt.legend()
plt.show()