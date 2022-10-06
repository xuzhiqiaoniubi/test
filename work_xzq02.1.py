import numpy as np
import pandas as pd
from numpy.linalg import inv  # 矩阵求逆
from numpy import dot  # 矩阵点乘

dataset = pd.read_csv('data.csv')
# 读入数据
X = dataset.iloc[:, 0:4]
# x为所有行，0到3列 由于d是需要加的 故我更改了一下date.csv文件
# 增设一列1 满足y=ax_1+bx_2+cx_3+d方便求解
Y = dataset.iloc[:, 4]
# y为所有行，第5列
A = dot(dot(inv(np.dot(X.T, X)), X.T), Y)  # 最小二乘法求解公式

print(A)#输出结果