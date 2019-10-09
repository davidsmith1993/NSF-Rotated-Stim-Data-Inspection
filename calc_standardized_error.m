function [error,corr,nMVoutliers] = calc_standardized_error(MyData,or_scale,diameter_scale,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol)
%function [error,corr] = calc_standardized_error(MyData,o_gain,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol)
%
%4/24/12    swe     modified to compute avg rmse for production task (based on comp_pc_rt from extrapolation experiment
%11/5/14    swe     modified to standardize to range on each dimension prior to computing error

error = [9999; 9999]; corr = error;
%scaled diameter and orientation ranges
diameter_limits = [10 600]; 
orient_limits = [-50 110]; 


%infer diameter ==> 1 line, 1 circle to produce
ind = find(MyData(:,inferDimensionCol)==11);
tempdata = MyData(ind,:);
%screen for multivariate outliers
nMVoutliers = [0 0]; %nMV outliers when inferring [diameter, orientation]
[o,io]=moutlier1([tempdata(:,diameter_responseCol) tempdata(:,diameterCol)],.10);
if ~isempty(o)
    %disp('MV outlier when inferring diameter')
    %[o    io tempdata(o,diameter_responseCol) tempdata(o,diameterCol)]
    %pause
    tempdata = tempdata(~ismember(1:size(tempdata, 1), o), :); %exclude MV outliers using index in o
    nMVoutliers(1) = length(o); %but keep track
end
%error(1) = (mean((MyData(ind,diameter_responseCol) - MyData(ind,diameterCol)*diameter_scale) .^2) )^.5;
error(1) = (mean(((tempdata(:,diameter_responseCol) - tempdata(:,diameterCol)*diameter_scale)/diff(diameter_limits)) .^2))^.5; %scale signed error based on possible range

%correlations
temp = corrcoef(tempdata(:,diameter_responseCol),tempdata(:,orientCol)*or_scale);
corr(1) = temp(1,2);

%infer OR ==> 1 circle, 1 line to produce
ind = find(MyData(:,inferDimensionCol)==22);
tempdata = MyData(ind,:);
%screen for multivariate outliers
nMVoutliers = [0 0]; %nMV outliers when inferring [diameter, orientation]
[o,io]=moutlier1([tempdata(:,orient_responseCol) tempdata(:,orientCol)],.10);
if ~isempty(o)
    tempdata = tempdata(~ismember(1:size(tempdata, 1), o), :); %exclude MV outliers using index in o
    nMVoutliers(2) = length(o); %but keep track
end
%error(2) = (mean((MyData(ind,orient_responseCol) - MyData(ind,orientCol)*or_scale) .^2) )^.5;
error(2) = (mean(((tempdata(:,orient_responseCol) - tempdata(:,orientCol)*or_scale)/diff(orient_limits)) .^2))^.5; %scale signed error based on possible range

%correlations
temp = corrcoef(tempdata(:,diameterCol)*diameter_scale,tempdata(:,orient_responseCol));
corr(2) = temp(1,2);

