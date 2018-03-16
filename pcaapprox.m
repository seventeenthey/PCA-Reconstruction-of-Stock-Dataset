function [approxcomp,approxvec]=pcaapprox(new_data, approxnum, meanvec, uvecmat) 
% [APPROXCOMP,APPROXVEC]=PCAAPPROX(NEW_DATA, APPROXNUM, 
% MEANVEC, UVECMAT) 
% approximates new data based on a Principal Components Analysis 
% (PCA) of initial data. Inputs are: 
% NEW_DATA - a signal to be approximated, as a column vector 
% APPROXNUM - a scalar giving the order of the approximation 
% MEANVEC - the PCA mean vector (from PCAPRELIM) 
% UVECMAT - the singular vectors of the PCA (from PCAPRELIM) 
% % Return values are: 
% APPROXCOMP - the components as a row vector of scalars 
% APPROXVEC - the approximation of the new data as a vector
% Set up the initial and return values 
diffvec = new_data - meanvec; 
approxcomp = zeros(approxnum, 1); 
approxvec = meanvec;
% Loop through the eigenvectors, finding the components 
% and building the approximation 
for i=1:approxnum 
    uvec = uvecmat(:,i); 
    beta = dot(diffvec, uvec); 
    approxcomp(i,1) = beta; 
    approxvec = approxvec + beta*uvec; 
end
