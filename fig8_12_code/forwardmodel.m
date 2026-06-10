function output = forwardmodel(input)

% model parameter
nbt = 4; %num of layers 
tbks = [10000,100,1e4,1e4];  %depth of layers[m]
for i=1:length(tbks)
    bdpt(i+1)=sum(tbks(2:i));
    bdpt(1)=-tbks(1);
    bdpt(2)=0;
end
rt_h = [1e12, 0.3,1,1];  % [ohm.m]
rt_v = [1e12, 0.3,1,1]; % [ohm.m]
epsl_h = [1,1,1,1]; 
epsl_v = [1,1,1,1]; 
mu_h  = [1,1,1,1]; 
mu_v  = [1,1,1,1];  

f = 1; % freq[Hz]

% location of receiver [m]
xr0 = -100:10:100; 
yr0 = -50:25:50; 
zr0 = 100; 

[xr,yr,zr] = meshgrid(xr0,yr0,zr0);
xr = xr(:); yr = yr(:); zr = zr(:);

%% parameter of dipole
ntr = 1;
xt(1:ntr) = input(1:ntr);
yt(1:ntr) = input(ntr+1:ntr*2);
zt(1:ntr) = input(ntr*2+1:ntr*3);
it(1:ntr) = input(ntr*3+1:ntr*4); %[A]
alpha = input(end-1);
beta = input(end);

yt(yt == 0) = 1e-8;

alpha = alpha*pi/180; %rad
beta = beta*pi/180; %rad
Jz = sin(beta);
Jx = cos(beta)*cos(alpha);
Jy = cos(beta)*sin(alpha);
Jz = it*Jz;
Jx = it*Jx;
Jy = it*Jy;

dfqt = f;


%% calculate the response
ns = length(xr);

gje_real = zeros(3,3); gje_imag = zeros(3,3);
gjh_real = zeros(3,3); gjh_imag = zeros(3,3);
gme_real = zeros(3,3); gme_imag = zeros(3,3);
gmh_real = zeros(3,3); gmh_imag = zeros(3,3);

loadlibrary('em1d3.dll','em1d3.h');
ex = zeros(ns,1);
ey = zeros(ns,1);
ez = zeros(ns,1);
for j=1:ns
    [gje_real,gje_imag,gjh_real,gjh_imag,gme_real,gme_imag,gmh_real,gmh_imag]=...
        calllib('em1d3','em1d3',gje_real,gje_imag,gjh_real,gjh_imag,gme_real,gme_imag, ...
        gmh_real,gmh_imag,nbt,tbks,bdpt,rt_h,rt_v,epsl_h,epsl_v,mu_h,mu_v,dfqt,xt,yt,zt,xr(j),yr(j),zr(j));

    GJE   = complex(gje_real,gje_imag);

    % sum of responses from
    ex(j,:) = Jx*GJE(1,1) + Jy*GJE(1,2) + Jz*GJE(1,3);
    ey(j,:) = Jx*GJE(2,1) + Jy*GJE(2,2) + Jz*GJE(2,3);
    ez(j,:) = Jx*GJE(3,1) + Jy*GJE(3,2) + Jz*GJE(3,3);

end
unloadlibrary em1d3

output1 = [ex,ey,ez];
output(:,1:3)=abs(output1(:,1:3))*1e6;
output = output(:);








