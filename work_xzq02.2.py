import cv2
import numpy as np

img = cv2.imread('picwork.jpg')#读取给定图片
hue_image = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
low_range = np.array([125, 200, 200])
high_range = np.array([155, 255, 255])#csdn上找的紫色区域
th = cv2.inRange(hue_image, low_range, high_range)
cv2.imshow('th',th)#只显示紫色三角形
cnts,hierarchy = cv2.findContours(th,cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
nums = len(cnts)
print(cnts)
for i in range(nums):
    
    rotatedRect = cv2.minAreaRect(cnts[i])  # 计算最小外接矩形，没有使用rectangle 我觉得这个函数更好用
    box = cv2.boxPoints(rotatedRect)
    points = np.int0(box)  # 坐标值取整
    img = cv2.drawContours(img, [points], 0, (0, 255, 255), 2)
    cv2.imshow('imageshow',img)
    # 显示返回值image，结果绘制在原图上， 
    
cv2.waitKey()

