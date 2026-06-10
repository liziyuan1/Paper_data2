%=============================
% soure inversion by DREAM(kzs) of dipole with E field
%  
%  zhoujm@chd.edu.cn, 2025
%=============================

clc; clear; close;
addpath(genpath('DREAM_Dir')); %include folder of inversion

%% model parameter
N = 3;                  % Number of parallel chains in MCMC
T = 3000;             % Number of iterations
t1 = 80;                % After which iteration the Kalman proposal is used
t2 = ceil(0.3*T);    % After which iteration the Kalman proposal is not used
Ne = 100;            % Number of archive samples for the Kalman proposal 


%% Range of the parameters
% parameters: x,y,z,i,alpha,beta
xmin = [-5,   2,  0.1,  0.1,    1,   0];
xmax = [ 5, 10,   10,   10,  30, 30];
range = [xmin' xmax'];   


%% load data
load Obs.mat

Ny = length(Obs);  % Dimension of model responses
Nx = length(xmin);    % Dimension of model parameters

% Standard deviation of measurement errors
noiseLevel = min(abs(Obs))*0.01;  
sd = ( (Obs*0.05).^2 + noiseLevel.^2 ).^0.5;

%% inversion
p_k = 0.3;                             % The probability of using the Kalman proposal distribution
Z1  = dream_kzs(N,T,Nx,Ny,Obs,sd,range,p_k,t1,t2,Ne);
fid_x = fopen('x.bin'); x_kzs = fread(fid_x,[Nx inf],'double'); fclose(fid_x);  % Store model parameters of new population
fid_y = fopen('y.bin'); y_kzs = fread(fid_y,[Ny inf],'double'); fclose(fid_y);  % Store model responses of new population
fid_p = fopen('p.bin'); p_kzs = fread(fid_p,[1 inf],'double'); fclose(fid_p);   % Store log-densities of new population
delete x.bin y.bin p.bin

save results
delete DREAM_KZS.mat                   % The intermediate results saved when running dream_kzs