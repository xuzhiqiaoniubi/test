import cv2
import numpy as np

img = np.zeros((396, 527, 3), np.uint8)#经过查找，确定MindVsion MV-SUA133GC相机 面积
pts = np.array([[188, 123], [188, 273], [338, 273],[338,123]])#经计算 确定投影点坐标
#cv2.fillPoly(img, [pts], (255, 0, 0), 16)
cv2.fillConvexPoly(img, pts, (255, 0, 0))
cv2.imshow('draw', img)
cv2.waitKey()
