function [sdiag, meanvec, uvecmat] = pcaprelim(Z) 
% FUNCTION [SDIAG, MEANVEC, UVECMAT] = PCAPRELIM(Z) 
% performs the preliminary Principal Components Analysis 
% (PCA) of Z, a matrix in which the data are 
% represented as columns. PCAPRELIM returns: 
% SDIAG - singular values of the PCA, in decreasing order 
% MEANVEC - the mean vector of the initial data 
% UVECMAT - left singular vectors of the PCA, as column vectors
% Find the mean vector and form it into a matrix 
[m,n] = size(Z); 
meanvec = mean(Z,2); 
M = meanvec*ones(1,n);
% Find the difference matrix 
D = Z - M;
% Find the left singular vectors as a matrix and % the singular values as a vector 
[uvecmat, Smat, ~] = svd(D, "econ"); 
sdiag = diag(Smat);
end