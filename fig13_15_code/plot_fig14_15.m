clear; clc

% Load saved results
load results
chain_kzs = x_kzs';
x_kzs =  permute(reshape(chain_kzs',[Nx,N,T]),[3,1,2]);
Nd = size(chain_kzs,1);
I = 6;a1 = 2;b1 = 3;

%% inverse model parameter
figure('Color',[1 1 1]);
% delete burn-in
nburn = Nd/2; 
A1 = chain_kzs(nburn+1:end,:);
reals = A1';

% inverse model 
xinv = quantile(squeeze(reals)',0.5);
x05 = quantile(squeeze(reals)',0.05);
x95 = quantile(squeeze(reals)',0.95);

% The reference model
xreal = [0,5,5,1,15,15];

plot(xinv,'b+','LineWidth',2); hold on
plot(x05,'b--','LineWidth',2); hold on
plot(x95,'b--','LineWidth',2); hold on
plot(xreal,'ro','LineWidth',1); hold on
ylabel('model parameter'); xlabel('point'); xlim([1,6]);

set(gcf,'position',[0 0 800 600]);
print(gcf,'-r300','-dpng','Fig14.png');


%% Trace plots of model parameters obtained by dream_kzs
% figure('Color',[1 1 1]);
% for i = 1:I
%     subplot(a1,b1,i,'FontWeight','norm','FontSize',14);
%     plot(1:N*T,chain_kzs(:,i),'linestyle','none','marker','.','markersize',16);
%     hold on;
%     plot(size(chain_kzs,1),xreal(i),'linewidth',3,'linestyle','none',...
%         'marker','x','markersize',15,'color','r');
%     axis([0 size(chain_kzs,1) range(i,1) range(i,2)]);
% end
% legend('Parameter samples','True value')
% set(gcf,'position',[0 0 800 600]);
% print(gcf,'-r300','-dpng','Trace.png');
% 
% 
%% Marginal PPDFs obtained by dream_kzs
% figure('Color',[1 1 1]);
% for  i = 1:I
%     subplot(a1,b1,i,'FontWeight','demi','FontSize',13);
%     [xp1,xx1] = ksdensity(chain_kzs(end-Nd/2:end,i));
%     plot(xx1,xp1,'linestyle','--','linewidth',2,'color','b'); hold on
%     x_min = min(xx1);
%     x_max = max(xx1);
%     p_max = max(xp1);
%     plot([xreal(i) xreal(i)],[0 p_max*1.1],'linewidth',2,'color','k');
%     ylabel('Marginal PPDF','FontWeight','norm','FontSize',10);
% end
% legend('DREAM_{(KZS)}','True value')
% set(gcf,'position',[0 0 800 600]);
% print(gcf,'-r300','-dpng','MarginalPDFs.png');


%% Convergence analysis
figure('color',[1 1 1]);
[nn,R_stat,~] = Convergence(x_kzs);
plot(nn,R_stat,'linewidth',2); hold on;
xlabel('Number of model evaluations','interpreter','latex','fontsize',13);
ylabel('$\bf\it\hat{R}\bf\rm-statistics$','interpreter','latex','fontsize',13);
plot([0 N*T],[1.2 1.2],'k--','linewidth',1.5,'color','r');
axis([0 N*T 0.8 3.5]);
set(gca,'ytick',[1 1.5 2 2.5 3.0 3.5]);
set(gca,'yticklabel',{'1.0','1.5','2.0','2.5','3.0','3.5'});
set(gcf,'position',[0 0 800 600]);
print(gcf,'-r300','-dpng','Fig15.png');
