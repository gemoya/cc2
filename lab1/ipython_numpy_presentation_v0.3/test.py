import numpy as np

def func1(n):
	a = np.random.random(n)
	b = np.random.random(n)
	c = np.dot(a,b)
	res = np.sum(c)
	del a,b,c
	d = np.random.random(np.floor(res))
	return d
