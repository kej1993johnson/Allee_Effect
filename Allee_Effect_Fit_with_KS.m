%% This script tries to use the individual data trajectories to minimize the sum of the KS distance
% between the mean and variance of a normally distributed data set evolving
% in time and the raw trajectories observed
clear all; close all; clc

mudatavec = [];
vardatavec = [];
timevec = [];
mudatavecall = [];
vardatavecall = [];
timevecall = [];
N0vec = [];
numsamps = 0;
% Instead of using just the mean and variance, will use all of the cell
% numbers in time
S = load('../out/BTsumfit.mat');
BTsum= S.BTsum;
N0list = [ 2 4 10];

%%  Generate cells which contain matrices for each raw data trajectory in an individual cell number
Nveclong = [];
timevec = [];

for j = 1:length(N0list)
    for i = 1:length(BTsum)
    if BTsum(i).N0==N0list(j)
        Nmat{j} = BTsum(i).Nmat;
       timevec{j} = BTsum(j).timevec;
        numsamps = BTsum(i).num + numsamps;

    end
    end
end
%% For each raw data set, find the KS distance, and set this up as a function


% variance
modelfun_mu =@(p)gen_model_mu(p,tsamp, Ninit, modelcode);
modelfun_V = @(p)gen_model_var(p, tsamp, Ninit, modelcode);

