function knum = choosek(eigenvalues)
% This is a function to find the smallest number of eigenvalues
% cover about 55% of the variation
total = sum(eigenvalues);
knum = 1;
cum = 0; % cumlative total of eigenvalues
while (((cum + eigenvalues(knum))/total) < 0.55)
    cum = cum + eigenvalues(knum);
    knum = knum + 1;
end % while
end % knum