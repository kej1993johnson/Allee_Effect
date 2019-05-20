clc
close all; clear all;
t=5;
n=10;
alpha1=0.025;
alpha2 = 0.975;
n025 = t.*((1-alpha1).^(-1/n))
n075 = t.*((1-alpha2).^(-1/n))

p1 = 0.9999
p2 = 0.995
p3 = 0.0001
p4 = 0.01

pneg = (p3*p4)/(p3*p4 + p1*p2)

ppos = p1*(1-p2) + p3*(1-p4)
pd = (p3*(1-p4))./((p3*(1-p4))+ p1*(1-p2))