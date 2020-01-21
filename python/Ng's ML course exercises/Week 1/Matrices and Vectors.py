#Matrices and Vectors

A = [[1,2,3],[4,5,6],[7,8,9],[10,11,12]]

v = [[1],[2],[3]]

dim_A = [len(A),len(A[0])]

dim_v = [len(v),len(v[0])]

A_23 = A[1][2]

print("Dimensions of  matrices A is ",dim_A[0], "x",dim_A[1])
print("Dimensions of vector v is ",dim_v[0], "x",dim_v[1])
print("Indexed value in matrix A where row is 2 and column is 3 is ",A_23)
