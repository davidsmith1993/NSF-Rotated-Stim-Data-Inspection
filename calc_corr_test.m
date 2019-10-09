    function [corr1, corr2, corr3, corr4] = calc_corr_test(MyData,or_scale,diameter_scale,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol,catCol)
    %function [error,corr] = calc_standardized_error_bycluster_byinferdim(MyData,o_gain,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol)
    %
    %4/24/12    swe     modified to compute avg rmse for production task (based on comp_pc_rt from extrapolation experiment
    %11/5/14    swe     modified to standardize to range on each dimension prior to computing error
    %12/1/14    swe     collapse across inferred dimension
    %4/23/15    swe     collapsing across inferred dimension artificially inflates the correlation. Compute correlation separately for each inferred
    %                   dimsnion then average.
    %scaled diameter and orientation ranges
%need to fix this too dbs
    diameter_limits = [108.62 398.1]; 
    orient_limits = [-40.59 87.19]; 

%I am calculating this for each cluster (1=a, 2=b, 3=c, 4=d)
%Cluster1
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==1);
    tempdata_inferdiameter1 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==1);
    tempdata_inferorient1 = MyData(ind,:);
    
%Cluster2
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==2);
    tempdata_inferdiameter2 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==2);
    tempdata_inferorient2 = MyData(ind,:);

%Cluster3
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==3);
    tempdata_inferdiameter3 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==3);
    tempdata_inferorient3 = MyData(ind,:);
    
%Cluster4
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==4);
    tempdata_inferdiameter4 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==4);
    tempdata_inferorient4 = MyData(ind,:);


%2 dvs use corr dont use error
%scale presented, produced is already scaled
%use if statement to split or not split
%if not split combine corrdatainferdiameter and corrdatainferorient
%split by cluster (lets make it so it isnt split by type, only cluster)

%this is split by cluster also for now
%cluster1
    corrdata_inferdiameter1 = [tempdata_inferdiameter1(:,diameter_responseCol) tempdata_inferdiameter1(:,orientCol)*or_scale];
    temp_inferdiameter1 = corrcoef(corrdata_inferdiameter1);
    corrdata_inferorient1 = [ tempdata_inferorient1(:,diameterCol)*diameter_scale tempdata_inferorient1(:,orient_responseCol)];
    temp_inferorient1 = corrcoef(corrdata_inferorient1);
    corr1 = mean([temp_inferdiameter1(1,2) temp_inferorient1(1,2)]);
    corrtotal1=[corrdata_inferorient1;corrdata_inferdiameter1];
    temp_corrtotal1 = corrcoef(corrtotal1);
    
%cluster2
    corrdata_inferdiameter2 = [tempdata_inferdiameter2(:,diameter_responseCol) tempdata_inferdiameter2(:,orientCol)*or_scale];
    temp_inferdiameter2 = corrcoef(corrdata_inferdiameter2);
    corrdata_inferorient2 = [ tempdata_inferorient2(:,diameterCol)*diameter_scale tempdata_inferorient2(:,orient_responseCol)];
    temp_inferorient2 = corrcoef(corrdata_inferorient2);
    corr2 = mean([temp_inferdiameter2(1,2) temp_inferorient2(1,2)]);
     corrtotal2=[corrdata_inferorient2;corrdata_inferdiameter2];
    temp_corrtotal2 = corrcoef(corrtotal2);
    
%cluster3
    corrdata_inferdiameter3 = [tempdata_inferdiameter3(:,diameter_responseCol) tempdata_inferdiameter3(:,orientCol)*or_scale];
    temp_inferdiameter3 = corrcoef(corrdata_inferdiameter3);
    corrdata_inferorient3 = [ tempdata_inferorient3(:,diameterCol)*diameter_scale tempdata_inferorient3(:,orient_responseCol)];
    temp_inferorient3 = corrcoef(corrdata_inferorient3);
    corr3 = mean([temp_inferdiameter3(1,2) temp_inferorient3(1,2)]);
     corrtotal3=[corrdata_inferorient3;corrdata_inferdiameter3];
    temp_corrtotal3 = corrcoef(corrtotal3);
    
% %cluster4
%     corrdata_inferdiameter4 = [tempdata_inferdiameter4(:,diameter_responseCol) tempdata_inferdiameter4(:,orientCol)*or_scale];
%     temp_inferdiameter4 = corrcoef(corrdata_inferdiameter4);
%     corrdata_inferorient4 = [ tempdata_inferorient4(:,diameterCol)*diameter_scale tempdata_inferorient4(:,orient_responseCol)];
%     temp_inferorient4 = corrcoef(corrdata_inferorient4);
%     corr4 = mean([temp_inferdiameter4(1,2) temp_inferorient4(1,2)]);
%     corrtotal4=[corrdata_inferorient4;corrdata_inferdiameter4];
%     temp_corrtotal4 = corrcoef(corrtotal4);

%cluster4
    corrdata_inferdiameter4 = [tempdata_inferdiameter4(:,diameter_responseCol) tempdata_inferdiameter4(:,orientCol)*or_scale];
    temp_inferdiameter4 = corrcoef(corrdata_inferdiameter4);
    corrdata_inferorient4 = [ tempdata_inferorient4(:,diameterCol)*diameter_scale tempdata_inferorient4(:,orient_responseCol)];
    temp_inferorient4 = corrcoef(corrdata_inferorient4);
    corr4 = mean([temp_inferdiameter4(1,2) temp_inferorient4(1,2)]);
    corrtotal4=[corrdata_inferorient4;corrdata_inferdiameter4];
    temp_corrtotal4 = corrcoef(corrtotal4);


%plot2dstim
save temptest