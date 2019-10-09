function [error,corr] = calc_error_noscale(MyData,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol)
%function [error,corr] = calc_error_noscale(MyData,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol)
%
%4/24/12    swe     modified to compute avg rmse for production task (based on comp_pc_rt from extrapolation experiment
%11/5/14    swe     modified to work with code that scales stimuli and responses up front.

error = [9999; 9999]; corr = error;

%infer diameter ==> 1 line, 1 circle to produce
ind = find(MyData(:,inferDimensionCol)==11);
error(1) = (mean((MyData(ind,diameter_responseCol) - MyData(ind,diameterCol)) .^2) )^.5;
%correlations
temp = corrcoef(MyData(ind,diameter_responseCol),MyData(ind,orientCol));
corr(1) = temp(1,2);

%infer OR ==> 1 circle, 1 line to produce
ind = find(MyData(:,inferDimensionCol)==22);
error(2) = (mean((MyData(ind,orient_responseCol) - MyData(ind,orientCol)) .^2) )^.5;
%correlations
temp = corrcoef(MyData(ind,diameterCol),MyData(ind,orient_responseCol));
corr(2) = temp(1,2);

