#cython: cdivision=True 
#cython: boundscheck=False
#cython: nonecheck=False
#cython: wraparound=False


import numpy as np
cimport numpy as cnp
from libc.math cimport sqrt, exp, cos, sin


ctypedef cnp.float64_t float64_t
ctypedef cnp.ndarray ndarray
ctypedef unsigned int uint


cdef ndarray _func(float64_t[::1] x, float64_t[::1] y):
	"""
	> devectorized implementation
	"""
	cdef:
		Py_ssize_t i
		Py_ssize_t n = x.shape[0]
		ndarray[float64_t, ndim=1] res = np.empty(n, dtype=np.float64)
	for i in range(n):
		res[i] = exp(sqrt((x[i]-y[i])**2 + (x[i]+y[i])**2)) * (cos(x[i]*y[i]) + sin(x[i]*y[i]) - cos(x[i])*sin(x[i]))
	return res

"""
Wrapers Funtions
"""

def func(float64_t[::1] x not None, float64_t[::1] y not None):
	return _func(x, y)