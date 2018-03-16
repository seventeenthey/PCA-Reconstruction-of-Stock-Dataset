function [errrate,errmatr] = rmse(o_matrix,re_matrix)
% Calculate errors for matrix
    for col = 1:30
    vecerr = sqrt(mean((o_matrix(:,col) - re_matrix(:,col)).^2));  % Root Mean Squared Error
    errmatr(1,col) = vecerr;
    end 
    errrate = mean(errmatr);
end