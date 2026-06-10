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
nburn = Nd/2; %burn-in
A1 = chain_kzs(nburn+1:end,:);
reals = A1';

% inverse model 
xinv = quantile(squeeze(reals)',0.5);
x05 = quantile(squeeze(reals)',0.05);
x95 = quantile(squeeze(reals)',0.95);

% reference model
xreal = [0,5,5,1,15,15];

plot(xinv,'b+','LineWidth',2); hold on
plot(x05,'b--','LineWidth',2); hold on
plot(x95,'b--','LineWidth',2); hold on
plot(xreal,'ro','LineWidth',1); hold on
ylabel('value','FontWeight','norm','FontSize',12); 
xlabel('source parameter','FontWeight','norm','FontSize',12); 
xticklabels({'x', 'y', 'z', 'i', '\alpha', '\beta'})
set(gca, 'FontSize', 12);
set(gcf,'position',[0 0 800 600]);
print(gcf,'-r300','-dpng','Fig9.png');


%% Trace plots of model parameters obtained by dream_kzs
figure('Color',[1 1 1]);
para = {'x','y', 'z', 'i', '\alpha', '\beta'};
la_str = {'(a)','(b)','(c)','(d)','(e)','(f)','(g)'};
for i = 1:I
    subplot(a1,b1,i,'FontWeight','norm','FontSize',14);
    plot(1:N*T,chain_kzs(:,i),'linestyle','none','marker','.','markersize',16);
    hold on;
    plot(size(chain_kzs,1),xreal(i),'linewidth',3,'linestyle','none',...
        'marker','x','markersize',15,'color','r');
    axis([0 size(chain_kzs,1) range(i,1) range(i,2)]);
    xlabel('Number of model evaluations','FontWeight','norm','FontSize',10);
    ylabel(para{i},'FontWeight','norm','FontSize',14)
    text(size(chain_kzs,1)*0.8,range(i,1)+(range(i,2)-range(i,1))*0.8,...
        la_str{i},'FontWeight','norm','FontSize',15);
end
legend('Parameter samples','True value', 'Location', 'SouthEast','FontWeight','norm','FontSize',10)
set(gcf,'position',[0 0 800 600]);
print(gcf,'-r300','-dpng','Fig10.png');


%% Marginal PPDFs obtained by dream_kzs
figure('Color',[1 1 1]);
for  i = 1:I
    subplot(a1,b1,i,'FontWeight','demi','FontSize',13);
    [xp1,xx1] = ksdensity(chain_kzs(end-Nd/2:end,i));
    plot(xx1,xp1,'linestyle','--','linewidth',2,'color','b'); hold on
    x_min = min(xx1);
    x_max = max(xx1);
    p_max = max(xp1);
    plot([xreal(i) xreal(i)],[0 p_max*1.1],'linewidth',2,'color','k');
    ylabel('Marginal PPDF','FontWeight','norm','FontSize',10);
    xlabel(para{i},'FontWeight','norm','FontSize',10)
    text(size(chain_kzs,1)*0.8,range(i,1)+(range(i,2)-range(i,1))*0.8,...
        la_str{i},'FontWeight','norm','FontSize',15);
end
legend('DREAM','True value','Location', 'SouthEast')
set(gcf,'position',[0 0 800 600]);
print(gcf,'-r300','-dpng','Fig11.png');


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
print(gcf,'-r300','-dpng','Fig12.png');
