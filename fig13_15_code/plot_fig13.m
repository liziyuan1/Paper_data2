load Obs.mat
% plot the response
y1 = reshape(Obs,[],3); 
nr = 5; 
y1 = y1*1e6; % [muV\m]
e1 = reshape(y1(:,1),nr,[]); 
e2 = reshape(y1(:,2),nr,[]); 
e3 = reshape(y1(:,3),nr,[]); 

figure('Color',[1 1 1]);
xr0 = -100:10:100; 
for j=1:nr
    subplot(311,'FontSize',12); grid on
    plot(xr0,e1(j,:),LineWidth=2); hold on
    ylabel('Ex (\muV\\m)'); 

    subplot(312,'FontSize',12); grid on
    plot(xr0,e2(j,:),LineWidth=2); hold on
    ylabel('Ey (\muV\\m)'); 

    subplot(313,'FontSize',12); grid on
    plot(xr0,e3(j,:),LineWidth=2); hold on
    ylabel('Ez (\muV\\m)'); xlabel('offset (m)')
end
legend('yr=-50m','yr=-25m','yr=0m','yr=25m','yr=50m','FontSize',12,'location','northwest');
set(gcf,'position',[0 0 800 600]);
print(gcf,'-r300','-dpng','Fig13.png');