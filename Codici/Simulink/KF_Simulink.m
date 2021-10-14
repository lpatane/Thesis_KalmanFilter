clear all;
sim('KF_Q_tempovariante');

figure;

%Velocità East (Asse X)
plot(t, x(:,3),'bx',...
    t, y(:,3),'gd',...
    t, xhat(:,3),'ro',...
    'LineStyle','-');
title('Velocità East (Asse X)');
xlabel('Tempo [s]');
ylabel('Velocità East (Asse X) [m/s]');
legend('Actual','Measured','Kalman filter estimate','Location','Best');
axis tight;

figure;

%Velocità North (Asse Y)
plot(t, x(:,4),'bx',...
    t, y(:,4),'gd',...
    t, xhat(:,4),'ro',...
    'LineStyle','-');
title('Velocità North (Asse Y)');
xlabel('Tempo [s]');
ylabel('Velocità North (Asse Y) [m/s]');
legend('Actual','Measured','Kalman filter estimate','Location','Best');
axis tight;

figure;

%Posizione
plot(x(:,1),x(:,2),'bx',...
    y(:,1),y(:,2),'gd',...
    xhat(:,1),xhat(:,2),'ro',...
    'LineStyle','-');
title('Posizione');
xlabel('East [m]');
ylabel('North [m]');
legend('Actual','Measured','Kalman filter estimate','Location','Best');
axis tight;

% East errore di misura posizione [m]
n_xe = y(:,1)-x(:,1);
% North errore di misura posizione [m]
n_xn = y(:,2)-x(:,2);
% Kalman filter east errore posizione [m]
e_xe = xhat(:,1)-x(:,1);
% Kalman filter north errore posizione [m]
e_xn = xhat(:,2)-x(:,2);

figure;
% East errore posizione
subplot(2,1,1);
plot(t,n_xe,'g',t,e_xe,'r');
ylabel('Errore Posizione - East [m]');
xlabel('Tempo [s]');
legend(sprintf('Meas: %.3f',norm(n_xe,1)/numel(n_xe)),sprintf('Kalman f.: %.3f',norm(e_xe,1)/numel(e_xe)));
axis tight;
% North errore posizione
subplot(2,1,2);
plot(t,y(:,2)-x(:,2),'g',t,xhat(:,2)-x(:,2),'r');
ylabel('Errore Posizione - North [m]');
xlabel('Tempo [s]');
legend(sprintf('Meas: %.3f',norm(n_xn,1)/numel(n_xn)),sprintf('Kalman f: %.3f',norm(e_xn,1)/numel(e_xn)));
axis tight;

e_ve = xhat(:,3)-x(:,3); % [m/s] Kalman filter east errore velocità
e_vn = xhat(:,4)-x(:,4); % [m/s] Kalman filter north errore velocità
figure;
% Velocità in direzione East e la sua stima
subplot(2,1,1);
plot(t,x(:,3),'b',t,xhat(:,3),'r');
ylabel('Velocità - East [m]');
xlabel('Tempo [s]');
legend('Actual','Kalman filter','Location','Best');
axis tight;
subplot(2,1,2);
% Errore di stima
plot(t,e_ve,'r');
ylabel('Errore Velocità - East [m]');
xlabel('Tempo [s]');
legend(sprintf('Kalman filter: %.3f',norm(e_ve,1)/numel(e_ve)));
axis tight;

figure;
% Velocità in direzione North e la sua stima
subplot(2,1,1);
plot(t,x(:,4),'b',t,xhat(:,4),'r');
ylabel('Velocità - North [m]');
xlabel('Tempo [s]');
legend('Actual','Kalman filter','Location','Best');
axis tight;
subplot(2,1,2);
% Errore di stima
plot(t,e_ve,'r');
ylabel('Errore Velocità - North [m]');
xlabel('Tempo [s]');
legend(sprintf('Kalman filter: %.3f',norm(e_vn,1)/numel(e_vn)));
axis tight;


bdclose('KF');

%Calcolo errori
errore_vnord_medio = norm(e_vn,1)/numel(e_vn);
errore_vest_medio = norm(e_ve,1)/numel(e_ve);
errore_pest_medio = norm(e_xe,1)/numel(e_xe);
errore_pnord_medio = norm(e_xn,1)/numel(e_xn);
%Vest Vnord Pest Pnord
errori = [errore_vest_medio max(abs(e_ve)) min(abs(e_ve));
          errore_vnord_medio max(abs(e_vn)) min(abs(e_vn));
          errore_pest_medio max(abs(e_xe)) min(abs(e_xe));
          errore_pnord_medio max(abs(e_xn)) min(abs(e_xn));]