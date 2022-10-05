# 电路分析第九章
## 9.1 非正弦周期信号
<div align=left>
<img src=https://img0.baidu.com/it/u=652562714,3599087915&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500 style="zoom:70%;" />
</div>

- 线性电路中，有一个正弦交流电源作用或多个同频率的正弦电源共同作用时，电路中各支路，各元件的稳态电压、电流都按照同频率的正弦规律变化。
- 非正弦量可分为周期性和非周期性两种， 而在周期性的分析中主要采用——谐波分析法。首先要应用数学中的傅里叶级数展开

## 9.2 周期函数分解为傅里叶级数
1. 周期函数的傅里叶级数分解
    ##### 如果一个周期函数满足狄利赫里条件：
    ##### ①如果周期内连续或者只有有限个第一类间断点
    ##### ②在一个周期内有有限个极大值或极小值
    ##### ③积分$\int_{t_0}^{t_0+T} {\lvert f(t) \rvert} \,{\rm d}t$存在
    ##### [学习傅里叶级数](https://www.bilibili.com/video/BV1144y1K7HE?spm_id_from=333.337.search-card.all.click)
2.  三角函数的正交性
    
    $f(t)= a_{0} +(a_{1}coswt+b_{1}sinwt)+(a_{2}cos2wt+b_{2}sin2wt)+...+(a_{k}coskwt+b_{k}sinkwt)=a_{0}+\sum_{k = 1}^n{(a_{k}coskwt+b_{k}sinkwt)}   $
    ##### 根据三角函数正交性得到以下式子
    $\int_{t_0}^{t_0+T} {cos(mwt)}*sin(nwt)\,{\rm d}t=0$  (所以mn均成立)
    
    $\int_{t_0}^{t_0+T} {cos(mwt)}*cos(nwt)\,{\rm d}t= 
    \begin{cases} \frac{T}{2}  {\quad}{\quad} m=n \\ 0 {\quad}{\quad}  m \not=n
    \end{cases}$ 
    
    $\int_{t_0}^{t_0+T} {sin(mwt)}*sin(nwt)\,{\rm d}t =\begin{cases} \frac{T}{2}  {\quad}{\quad} m=n \\ 0 {\quad}{\quad}  m \not=n
    \end{cases}$ 
---
## 练习
![电分作业.jpg](https://i.postimg.cc/MZVDq2QJ/image.jpg)
![解答](https://i.postimg.cc/9FTFLbKp/image.png)
