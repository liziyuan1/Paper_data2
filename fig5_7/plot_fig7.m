% 
%  EM response of different alpha and beta
%

clc;close;clear;
load data.mat

%% alpha = 0
alpha = 0;
beta = 0;
it = 1;

alpha = alpha*pi/180; %rad
beta = beta*pi/180; %rad
Jz = sin(beta); 
Jx = cos(beta)*cos(alpha);
Jy = cos(beta)*sin(alpha);
Jz = it*Jz;
Jx = it*Jx;
Jy = it*Jy;

Ex = Jx*XE(:,1) + Jy*YE(:,1) + Jz*ZE(:,1);
Ey = Jx*XE(:,2) + Jy*YE(:,2) + Jz*ZE(:,2);
Ez = Jx*XE(:,3) + Jy*YE(:,3) + Jz*ZE(:,3);

Exg0 = 1e6*reshape(abs(Ex),length(xr0),[]);
Eyg0 = 1e6*reshape(abs(Ey),length(xr0),[]);
Ezg0 = 1e6*reshape(abs(Ez),length(xr0),[]);


%% alpha = 15，beta = 15
alpha = 15;
beta = 15;
it = 1;

alpha = alpha*pi/180; %rad
beta = beta*pi/180; %rad
Jz = sin(beta); 
Jx = cos(beta)*cos(alpha);
Jy = cos(beta)*sin(alpha);
Jz = it*Jz;
Jx = it*Jx;
Jy = it*Jy;

Ex = Jx*XE(:,1) + Jy*YE(:,1) + Jz*ZE(:,1);
Ey = Jx*XE(:,2) + Jy*YE(:,2) + Jz*ZE(:,2);
Ez = Jx*XE(:,3) + Jy*YE(:,3) + Jz*ZE(:,3);

Exg1 = 1e6*reshape(abs(Ex),length(xr0),[]);
Eyg1 = 1e6*reshape(abs(Ey),length(xr0),[]);
Ezg1 = 1e6*reshape(abs(Ez),length(xr0),[]);


%% alpha =30，beta = 30
alpha = 30;
beta = 30;
it = 1;

alpha = alpha*pi/180; %rad
beta = beta*pi/180; %rad
Jz = sin(beta); 
Jx = cos(beta)*cos(alpha);
Jy = cos(beta)*sin(alpha);
Jz = it*Jz;
Jx = it*Jx;
Jy = it*Jy;

Ex = Jx*XE(:,1) + Jy*YE(:,1) + Jz*ZE(:,1);
Ey = Jx*XE(:,2) + Jy*YE(:,2) + Jz*ZE(:,2);
Ez = Jx*XE(:,3) + Jy*YE(:,3) + Jz*ZE(:,3);

Exg2 = 1e6*reshape(abs(Ex),length(xr0),[]);
Eyg2 = 1e6*reshape(abs(Ey),length(xr0),[]);
Ezg2 = 1e6*reshape(abs(Ez),length(xr0),[]);


%% figure E
figure('Color',[1 1 1]); 
subplot(331); contourf(xr0,yr0,Exg0,length(xr0),'LineColor','none'); 
colormap(jet); colorbar; ylabel('y(m)'); title('(a)  Ex (\muV/m)'); axis equal; set(gca, 'fontsize',13); 
xmin = min(Exg0(:)); xmax = max(Exg0(:)); clim([xmin xmax]);

subplot(334); contourf(xr0,yr0,Eyg0,length(xr0),'LineColor','none'); 
colormap(jet); colorbar; ylabel('y(m)'); title('(d)  Ey (\muV/m)'); axis equal; set(gca, 'fontsize',13); 
ymin = min(Eyg2(:)); ymax = max(Eyg2(:)); clim([ymin ymax]);

subplot(337); contourf(xr0,yr0,Ezg0,length(xr0),'LineColor','none'); 
colormap(jet); colorbar; xlabel('x(m)'); ylabel('y(m)'); title('(h)  Ez (\muV/m)'); axis equal; set(gca, 'fontsize',13)
zmin = min(Ezg0(:)); zmax = max(Ezg0(:)); clim([zmin zmax]);

subplot(332); contourf(xr0,yr0,Exg1,length(xr0),'LineColor','none'); 
colormap(jet); colorbar; title('(b)  Ex (\muV/m)'); axis equal; set(gca, 'fontsize',13)
clim([xmin xmax]);

subplot(335); contourf(xr0,yr0,Eyg1,length(xr0),'LineColor','none'); 
colormap(jet); colorbar; title('(e)  Ey (\muV/m)'); axis equal; set(gca, 'fontsize',13)
clim([ymin ymax]);

subplot(338); contourf(xr0,yr0,Ezg1,length(xr0),'LineColor','none'); 
colormap(jet); colorbar; xlabel('x(m)'); title('(i)  Ez (\muV/m)'); axis equal; set(gca, 'fontsize',13)
clim([zmin zmax]);

subplot(333); contourf(xr0,yr0,Exg2,length(xr0),'LineColor','none'); 
colormap(jet); colorbar; title('(c)  Ex (\muV/m)'); axis equal; set(gca, 'fontsize',13)
clim([xmin xmax]);

subplot(336); contourf(xr0,yr0,Eyg2,length(xr0),'LineColor','none'); 
colormap(jet); colorbar; title('(f)  Ey (\muV/m)'); axis equal; set(gca, 'fontsize',13)
clim([ymin ymax]);

subplot(339); contourf(xr0,yr0,Ezg2,length(xr0),'LineColor','none'); 
colormap(jet); colorbar; xlabel('x(m)'); title('(j)  Ez (\muV/m)'); axis equal; set(gca, 'fontsize',13)
clim([zmin zmax]);

set(gcf,'position',[0 0 900 600]);
print(gcf,'-r600','-dpng','Fig7.png');
