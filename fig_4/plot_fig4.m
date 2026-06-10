% data by em1d
load data_em1d.mat

% data by empymod
load data_empymod.mat 

%% error
error_exx = abs( (Exx-Exx2)./Exx2 )*100;
error_eyx = abs( (Eyx-Eyx2)./Eyx2 )*100;
error_ezx = abs( (Ezx-Ezx2)./Ezx2 )*100;

error_exy = abs( (Exy-Exy2)./Exy2 )*100;
error_eyy = abs( (Eyy-Eyy2)./Eyy2 )*100;
error_ezy = abs( (Ezy-Ezy2)./Ezy2 )*100;

error_exz = abs( (Exz-Exz2)./Exz2 )*100;
error_eyz = abs( (Eyz-Eyz2)./Eyz2 )*100;
error_ezz = abs( (Ezz-Ezz2)./Ezz2 )*100;


%% plot
figure('Color',[1 1 1]); 

subplot(331); 
yyaxis left
semilogy(xr0,Exx,'b-','LineWidth',1.5); hold on; ylabel('Exx(\muV/m)')
semilogy(xr0,Exx2,'ro','LineWidth',2); hold on; set(gca, 'fontsize',13)
yyaxis right
semilogy(xr0,error_exx,"k-*",'LineWidth',1.0); hold on; ylabel('relative error(%)'); ylim([0 0.01])

subplot(332); 
yyaxis left
semilogy(xr0,Exy,'b-','LineWidth',1.5); hold on; ylabel('Exy(\muV/m)')
semilogy(xr0,Exy2,'ro','LineWidth',2); hold on; set(gca, 'fontsize',13)
yyaxis right
semilogy(xr0,error_eyx,"k-*",'LineWidth',1.0); hold on; ylabel('relative error(%)'); ylim([0 0.01])

subplot(333); 
yyaxis left
semilogy(xr0,Exz,'b-','LineWidth',1.5); hold on; ylabel('Exz(\muV/m)')
semilogy(xr0,Exz2,'ro','LineWidth',2); hold on; set(gca, 'fontsize',13)
yyaxis right
semilogy(xr0,error_ezx,"k-*",'LineWidth',1.0); hold on; ylabel('relative error(%)'); ylim([0 0.01])

subplot(334); 
yyaxis left
semilogy(xr0,Eyx,'b-','LineWidth',1.5); hold on; ylabel('Eyx(\muV/m)')
semilogy(xr0,Eyx2,'ro','LineWidth',2); hold on; set(gca, 'fontsize',13)
yyaxis right
semilogy(xr0,error_exy,"k-*",'LineWidth',1.0); hold on; ylabel('relative error(%)'); ylim([0 0.01])

subplot(335); 
yyaxis left
semilogy(xr0,Eyy,'b-','LineWidth',1.5); hold on; ylabel('Eyy(\muV/m)')
semilogy(xr0,Eyy2,'ro','LineWidth',2); hold on; set(gca, 'fontsize',13)
yyaxis right
semilogy(xr0,error_eyy,"k-*",'LineWidth',1.0); hold on; ylabel('relative error(%)'); ylim([0 0.01])

subplot(336); 
yyaxis left
semilogy(xr0,Eyz,'b-','LineWidth',1.5); hold on; ylabel('Eyz(\muV/m)')
semilogy(xr0,Eyz2,'ro','LineWidth',2); hold on; set(gca, 'fontsize',13)
yyaxis right
semilogy(xr0,error_ezy,"k-*",'LineWidth',1.0); hold on; ylabel('relative error(%)'); ylim([0 0.01])
legend('empymod','em1d','error', 'Location', 'South')

subplot(337); 
yyaxis left
semilogy(xr0,Ezx,'b-','LineWidth',1.5); hold on; ylabel('Ezx(\muV/m)'); xlabel('x(m)')
semilogy(xr0,Ezx2,'ro','LineWidth',2); hold on; set(gca, 'fontsize',13)
yyaxis right
semilogy(xr0,error_exz,"k-*",'LineWidth',1.0); hold on; ylabel('relative error(%)'); ylim([0 0.01])

subplot(338); 
yyaxis left
semilogy(xr0,Ezy,'b-','LineWidth',1.5); hold on; ylabel('Ezy(\muV/m)'); xlabel('x(m)')
semilogy(xr0,Ezy2,'ro','LineWidth',2); hold on; set(gca, 'fontsize',13)
yyaxis right
semilogy(xr0,error_eyz,"k-*",'LineWidth',1.0); hold on; ylabel('relative error(%)'); ylim([0 0.01])

subplot(339); 
yyaxis left
semilogy(xr0,Ezz,'b-','LineWidth',1.5); hold on; ylabel('Ezz(\muV/m)'); xlabel('x(m)')
semilogy(xr0,Ezz2,'ro','LineWidth',2); hold on; set(gca, 'fontsize',13)
yyaxis right
semilogy(xr0,error_ezz,"k-*",'LineWidth',1.0); hold on; ylabel('relative error(%)'); ylim([0 0.01])

set(gcf,'position',[0 0 800 800]);
print(gcf,'-r600','-dpng','fig4.png');
