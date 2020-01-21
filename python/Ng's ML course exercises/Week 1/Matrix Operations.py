#Matrix Operations

import numpy as np

A = np.array([[1,2,3],[5,3,2]])

B = np.array([[1,3,4],[1,1,1]])

s = 2


add_AB = np.add(A,B)

sub_AB = np.subtract(A,B)

mult_As = np.multiply(A,s)

div_As = np.divide(A,s)

add_As = np.add(A,s)

#Matrix Vector multiplication
A = np.array([[1,2,3],[4,5,6],[7,8,9]])

v = np.array([[1],[1],[1]])

Av = np.dot(A,v)

#Matrix Matrix operations

A = np.array([[1,2],[3,4],[5,6]])

B = [[1],[2]]

mult_AB = np.dot(A,B)

#Matrix Multiplicaiton Properties, Identity Matrix demo

A = np.array([[1,2],[4,5]])

B = np.array([[1,1],[0,2]])

I = np.identity(2)

IA = np.dot(I,A)

AI = np.dot(I,A)


