% CISC 271
% Sylvia Zhou 10180860
% This function is used to generate all functions and plots, general steps
% are shows below and described in the pdf document. z1 and z2 dataset are
% stored in the same file location.
% All figure() are commented on purpose. 
%% Load File
load z1.dat
load z2.dat

%% Apply PCA
[z1_sdiag, z1_meanvec, z1_uvecmat] = pcaprelim(z1);
[z2_sdiag, z2_meanvec, z2_uvecmat] = pcaprelim(z2);

z1_meanvar = var(z1_meanvec);
z2_meanvar = var(z2_meanvec);

%% Plot Eigenvalues and Means
plot(z1_sdiag,'r');
hold on
plot(z2_sdiag,'b');
hold off
title('Eigenvalues for z1, z2');
legend('z1','z2');
%figure();

plot(z1_meanvec,'r');
hold on
plot(z2_meanvec,'b');
hold on
title('Mean Value for z1, z2');
legend('z1','z2');
%figure();

%% Choose Principle Component for z1 and z2
% cover 55% of the variation
z1_knum = choosek(z1_sdiag);
z2_knum = choosek(z2_sdiag);

%% Reconstruct
% PCA reconstruction = PC scores * (Eigenvectors)T + Mean
for colnum = 1:30
[~,z1_approxvec]=pcaapprox(z1(:,colnum), z1_knum, z1_meanvec, z1_uvecmat);
z1_appoxmat(:,colnum) = z1_approxvec;
end

for colnum = 1:30
[~,z2_approxvec]=pcaapprox(z2(:,colnum), z2_knum, z2_meanvec, z2_uvecmat);
z2_appoxmat(:,colnum) = z2_approxvec;
end

% Plot the Outcome for z1_appoxmat
for k = 1:z1_knum
       subplot(2, 3, k);
       hold on;
       grid on
       plot(z1_appoxmat(:, k), z1(:, k), 'x');
       %plot([-1 1], [-1 1]);
       title(sprintf('Variable %d', k));
end
%figure();

%% RMSE for Error
[z1_rmse,z1_rmsematr] = rmse(z1,z1_appoxmat);
[z2_rmse,z2_rmsematr] = rmse(z2,z2_appoxmat);

plot(z1_rmsematr,'r');
hold on
plot(z2_rmsematr,'b');
hold off
title('Error Rate for z1, z2');
legend('z1','z2');
%figure();

%% Research on no.21 stock in z2 and so on
subplot(2, 2, 1);
hold on;
grid on
plot(z2_meanvec,'r');
hold on
plot(z2_appoxmat(:,19),'g');
hold on
plot(z2(:,19),'b');
hold off
title('z2 Stock 19');
legend('z2avg','z2re','z2n');

subplot(2, 2, 2);
hold on;
grid on
plot(z2_meanvec,'r');
hold on
plot(z2_appoxmat(:,21),'g');
hold on
plot(z2(:,21),'b');
hold off
title('z2 Stock 21');
legend('z2avg','z2re','z2new');

subplot(2, 2, 3);
hold on;
grid on
plot(z1_meanvec,'r');
hold on
plot(z1_appoxmat(:,6),'g');
hold on
plot(z1(:,6),'b');
hold off
title('z1 Stock 6');
legend('z2avg','z2re','z2new');

subplot(2, 2, 4);
hold on;
grid on
plot(z1_meanvec,'r');
hold on
plot(z1_appoxmat(:,26),'g');
hold on
plot(z1(:,26),'b');
hold off
title('z1 Stock 26');
legend('z2avg','z2re','z2new');
%figure();

%% Research on all stocks
% for k = 1:30
%         subplot(5, 6, k);
%         hold on;
%         grid on
%         plot(z1_meanvec,'g');
%         hold on
%         plot(z1_appoxmat(:,k),'r');
%         hold on
%         plot(z1(:,k),'b');
%         hold off
%         title(sprintf('Z1 Stock %d', k));
%         %legend('z1avg','z1re','z1new');
% end

for q = 1:30
        subplot(5, 6, q);
        hold on;
        grid on
        plot(z2_meanvec,'g');
        hold on
        plot(z2_appoxmat(:,q),'r');
        hold on
        plot(z2(:,q),'b');
        hold off
        title(sprintf('Z2 Stock %d', q));
end
legend('z2avg','z2re','z2new');