import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

s = 12
r = 30
b = 6/3
x0 = 0
z0 = 20
t = np.linspace(0, 15, 250)


def f(t, st, s, b, r):
    x, y, z = st
    dx = s * (y-x)
    dy = x*(r-z)-y
    dz = x*y-b*z
    return [dx, dy, dz]
p = (s, b, r)


y0 = [0, 1.0, 20.0]
t_sp = (0.0, 40.0)


result_ivp = solve_ivp(f, t_sp, y0, args = p)


fig = plt.figure()
ax = fig.add_subplot(1, 1, 1,  projection='3d')
ax.plot(result_ivp.y[0], result_ivp.y[1], result_ivp.y[2])
plt.show()