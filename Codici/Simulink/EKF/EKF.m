clear all;
sim('EKF_sim');

figure;

%Velocità East (Asse X)
plot(t, EKF_x(:,3),'bx',...
    t, EKF_xhat(:,3),'ro',...
    'LineStyle','-');
title('Velocità East (Asse X)');
xlabel('Tempo [s]');
ylabel('Velocità East (Asse X) [m/s]');
legend('Actual','Kalman filter estimate','Location','Best');
axis tight;

figure;

%Velocità North (Asse Y)
plot(t, EKF_x(:,4),'bx',...
    t, EKF_xhat(:,4),'ro',...
    'LineStyle','-');
title('Velocità North (Asse Y)');
xlabel('Tempo [s]');
ylabel('Velocità North (Asse Y) [m/s]');
legend('Actual','Kalman filter estimate','Location','Best');
axis tight;

figure;

%Posizione
plot(EKF_x(:,1),EKF_x(:,2),'bx',...
    EKF_xhat(:,1),EKF_xhat(:,2),'ro',...
    'LineStyle','-');
title('Posizione');
xlabel('East [m]');
ylabel('North [m]');
legend('Actual','Kalman filter estimate','Location','Best');
axis tight;

% East errore di misura posizione [m]
n_xe = EKF_y(:,1)-EKF_x(:,1);
% North errore di misura posizione [m]
n_xn = EKF_y(:,2)-EKF_x(:,2);
% Kalman filter east errore posizione [m]
e_xe = EKF_xhat(:,1)-EKF_x(:,1);
% Kalman filter north errore posizione [m]
e_xn = EKF_xhat(:,2)-EKF_x(:,2);


e_ve = EKF_xhat(:,3)-EKF_x(:,3); % [m/s] Kalman filter east errore velocità
e_vn = EKF_xhat(:,4)-EKF_x(:,4); % [m/s] Kalman filter north errore velocità
figure;
% Velocità in direzione East e la sua stima
subplot(2,1,1);
plot(t,EKF_x(:,3),'b',t,EKF_xhat(:,3),'r');
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
plot(t,EKF_x(:,4),'b',t,EKF_xhat(:,4),'r');
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


bdclose('ctrlKalmanNavigation_plus_velocity');

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