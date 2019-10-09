    function [corrb1c1, corrb1c2, corrb1c3, corrb1c4, corrb2c1, corrb2c2, corrb2c3, corrb2c4, corrb3c1, corrb3c2, corrb3c3, corrb3c4, corrb4c1, corrb4c2, corrb4c3, corrb4c4] = calc_error_inference_e3(MyData,or_scale,diameter_scale,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol,catCol,blockCol)
    %function [error,corr] = calc_standardized_error_bycluster_byinferdim(MyData,o_gain,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol)
    %
    %4/24/12    swe     modified to compute avg rmse for production task (based on comp_pc_rt from extrapolation experiment
    %11/5/14    swe     modified to standardize to range on each dimension prior to computing error
    %12/1/14    swe     collapse across inferred dimension
    %4/23/15    swe     collapsing across inferred dimension artificially inflates the correlation. Compute correlation separately for each inferred
    %                   dimsnion then average.
    %scaled diameter and orientation ranges
    %4/29/2017  dbs     modified to look at the individual block

    
    diameter_limits = [108.62 398.1]; 
    orient_limits = [-40.59 87.19]; 

%I am calculating this for each cluster (1=a, 2=b, 3=c, 4=d)

%Block 1
%Cluster1
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==1);
    tempdata_inferdiameterb1c1 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==1);
    tempdata_inferorientb1c1 = MyData(ind,:);
    
%Cluster2
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==1);
    tempdata_inferdiameterb1c2 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==1);
    tempdata_inferorientb1c2  = MyData(ind,:);

%Cluster3
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==1);
    tempdata_inferdiameterb1c3 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==1);
    tempdata_inferorientb1c3 = MyData(ind,:);
    
%Cluster4
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==1);
    tempdata_inferdiameterb1c4 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==1);
    tempdata_inferorientb1c4 = MyData(ind,:);


%Block 2
%Cluster1
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==2);
    tempdata_inferdiameterb2c1 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==2);
    tempdata_inferorientb2c1 = MyData(ind,:);
    
%Cluster2
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==2);
    tempdata_inferdiameterb2c2 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==2);
    tempdata_inferorientb2c2  = MyData(ind,:);

%Cluster3
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==2);
    tempdata_inferdiameterb2c3 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==2);
    tempdata_inferorientb2c3 = MyData(ind,:);
    
%Cluster4
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==2);
    tempdata_inferdiameterb2c4 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==2);
    tempdata_inferorientb2c4 = MyData(ind,:);

%Block 3
%Cluster1
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==3);
    tempdata_inferdiameterb3c1 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==3);
    tempdata_inferorientb3c1 = MyData(ind,:);
    
%Cluster2
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==3);
    tempdata_inferdiameterb3c2 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==3);
    tempdata_inferorientb3c2  = MyData(ind,:);

%Cluster3
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==3);
    tempdata_inferdiameterb3c3 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==3);
    tempdata_inferorientb3c3 = MyData(ind,:);
    
%Cluster4
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==3);
    tempdata_inferdiameterb3c4 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==3);
    tempdata_inferorientb3c4 = MyData(ind,:);
    
%Block 4
%Cluster1
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==4);
    tempdata_inferdiameterb4c1 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==4);
    tempdata_inferorientb4c1 = MyData(ind,:);
    
%Cluster2
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==4);
    tempdata_inferdiameterb4c2 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==4);
    tempdata_inferorientb4c2  = MyData(ind,:);

%Cluster3
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==4);
    tempdata_inferdiameterb4c3 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==4);
    tempdata_inferorientb4c3 = MyData(ind,:);
    
%Cluster4
    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==4);
    tempdata_inferdiameterb4c4 = MyData(ind,:);


    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==4);
    tempdata_inferorientb4c4 = MyData(ind,:);

    
%2 dvs use corr dont use error
%scale presented, produced is already scaled
%use if statement to split or not split
%if not split combine corrdatainferdiameter and corrdatainferorient
%split by cluster (lets make it so it isnt split by type, only cluster)

%this is split by cluster and block

%Block1
%cluster1
    corrdata_inferdiameterb1c1 = [tempdata_inferdiameterb1c1(:,diameter_responseCol) tempdata_inferdiameterb1c1(:,orientCol)*or_scale];
    temp_inferdiameterb1c1 = corrcoef(corrdata_inferdiameterb1c1);
    corrdata_inferorientb1c1 = [ tempdata_inferorientb1c1(:,diameterCol)*diameter_scale tempdata_inferorientb1c1(:,orient_responseCol)];
    temp_inferorientb1c1 = corrcoef(corrdata_inferorientb1c1);
    corrb1c1 = mean([temp_inferdiameterb1c1(1,2) temp_inferorientb1c1(1,2)]);
    
%cluster2
    corrdata_inferdiameterb1c2 = [tempdata_inferdiameterb1c2(:,diameter_responseCol) tempdata_inferdiameterb1c2(:,orientCol)*or_scale];
    temp_inferdiameterb1c2 = corrcoef(corrdata_inferdiameterb1c2);
    corrdata_inferorientb1c2 = [ tempdata_inferorientb1c2(:,diameterCol)*diameter_scale tempdata_inferorientb1c2(:,orient_responseCol)];
    temp_inferorientb1c2 = corrcoef(corrdata_inferorientb1c2);
    corrb1c2 = mean([temp_inferdiameterb1c2(1,2) temp_inferorientb1c2(1,2)]);
    
%cluster3
    corrdata_inferdiameterb1c3 = [tempdata_inferdiameterb1c3(:,diameter_responseCol) tempdata_inferdiameterb1c3(:,orientCol)*or_scale];
    temp_inferdiameterb1c3 = corrcoef(corrdata_inferdiameterb1c3);
    corrdata_inferorientb1c3 = [ tempdata_inferorientb1c3(:,diameterCol)*diameter_scale tempdata_inferorientb1c3(:,orient_responseCol)];
    temp_inferorientb1c3 = corrcoef(corrdata_inferorientb1c3);
    corrb1c3 = mean([temp_inferdiameterb1c3(1,2) temp_inferorientb1c3(1,2)]);
    
%cluster4
    corrdata_inferdiameterb1c4 = [tempdata_inferdiameterb1c4(:,diameter_responseCol) tempdata_inferdiameterb1c4(:,orientCol)*or_scale];
    temp_inferdiameterb1c4 = corrcoef(corrdata_inferdiameterb1c4);
    corrdata_inferorientb1c4 = [ tempdata_inferorientb1c4(:,diameterCol)*diameter_scale tempdata_inferorientb1c4(:,orient_responseCol)];
    temp_inferorientb1c4 = corrcoef(corrdata_inferorientb1c4);
    corrb1c4 = mean([temp_inferdiameterb1c4(1,2) temp_inferorientb1c4(1,2)]);

%Block2
%cluster1
    corrdata_inferdiameterb2c1 = [tempdata_inferdiameterb2c1(:,diameter_responseCol) tempdata_inferdiameterb2c1(:,orientCol)*or_scale];
    temp_inferdiameterb2c1 = corrcoef(corrdata_inferdiameterb2c1);
    corrdata_inferorientb2c1 = [ tempdata_inferorientb2c1(:,diameterCol)*diameter_scale tempdata_inferorientb2c1(:,orient_responseCol)];
    temp_inferorientb2c1 = corrcoef(corrdata_inferorientb2c1);
    corrb2c1 = mean([temp_inferdiameterb2c1(1,2) temp_inferorientb2c1(1,2)]);
    
%cluster2
    corrdata_inferdiameterb2c2 = [tempdata_inferdiameterb2c2(:,diameter_responseCol) tempdata_inferdiameterb2c2(:,orientCol)*or_scale];
    temp_inferdiameterb2c2 = corrcoef(corrdata_inferdiameterb2c2);
    corrdata_inferorientb2c2 = [ tempdata_inferorientb2c2(:,diameterCol)*diameter_scale tempdata_inferorientb2c2(:,orient_responseCol)];
    temp_inferorientb2c2 = corrcoef(corrdata_inferorientb2c2);
    corrb2c2 = mean([temp_inferdiameterb2c2(1,2) temp_inferorientb2c2(1,2)]);
    
%cluster3
    corrdata_inferdiameterb2c3 = [tempdata_inferdiameterb2c3(:,diameter_responseCol) tempdata_inferdiameterb2c3(:,orientCol)*or_scale];
    temp_inferdiameterb2c3 = corrcoef(corrdata_inferdiameterb2c3);
    corrdata_inferorientb2c3 = [ tempdata_inferorientb2c3(:,diameterCol)*diameter_scale tempdata_inferorientb2c3(:,orient_responseCol)];
    temp_inferorientb2c3 = corrcoef(corrdata_inferorientb2c3);
    corrb2c3 = mean([temp_inferdiameterb2c3(1,2) temp_inferorientb2c3(1,2)]);
    
%cluster4
    corrdata_inferdiameterb2c4 = [tempdata_inferdiameterb2c4(:,diameter_responseCol) tempdata_inferdiameterb2c4(:,orientCol)*or_scale];
    temp_inferdiameterb2c4 = corrcoef(corrdata_inferdiameterb2c4);
    corrdata_inferorientb2c4 = [ tempdata_inferorientb2c4(:,diameterCol)*diameter_scale tempdata_inferorientb2c4(:,orient_responseCol)];
    temp_inferorientb2c4 = corrcoef(corrdata_inferorientb2c4);
    corrb2c4 = mean([temp_inferdiameterb2c4(1,2) temp_inferorientb2c4(1,2)]);
    
    %Block3
%cluster1
    corrdata_inferdiameterb3c1 = [tempdata_inferdiameterb3c1(:,diameter_responseCol) tempdata_inferdiameterb3c1(:,orientCol)*or_scale];
    temp_inferdiameterb3c1 = corrcoef(corrdata_inferdiameterb3c1);
    corrdata_inferorientb3c1 = [ tempdata_inferorientb3c1(:,diameterCol)*diameter_scale tempdata_inferorientb3c1(:,orient_responseCol)];
    temp_inferorientb3c1 = corrcoef(corrdata_inferorientb3c1);
    corrb3c1 = mean([temp_inferdiameterb3c1(1,2) temp_inferorientb3c1(1,2)]);
    
%cluster2
    corrdata_inferdiameterb3c2 = [tempdata_inferdiameterb3c2(:,diameter_responseCol) tempdata_inferdiameterb3c2(:,orientCol)*or_scale];
    temp_inferdiameterb3c2 = corrcoef(corrdata_inferdiameterb3c2);
    corrdata_inferorientb3c2 = [ tempdata_inferorientb3c2(:,diameterCol)*diameter_scale tempdata_inferorientb3c2(:,orient_responseCol)];
    temp_inferorientb3c2 = corrcoef(corrdata_inferorientb3c2);
    corrb3c2 = mean([temp_inferdiameterb3c2(1,2) temp_inferorientb3c2(1,2)]);
    
%cluster3
    corrdata_inferdiameterb3c3 = [tempdata_inferdiameterb3c3(:,diameter_responseCol) tempdata_inferdiameterb3c3(:,orientCol)*or_scale];
    temp_inferdiameterb3c3 = corrcoef(corrdata_inferdiameterb3c3);
    corrdata_inferorientb3c3 = [ tempdata_inferorientb3c3(:,diameterCol)*diameter_scale tempdata_inferorientb3c3(:,orient_responseCol)];
    temp_inferorientb3c3 = corrcoef(corrdata_inferorientb3c3);
    corrb3c3 = mean([temp_inferdiameterb3c3(1,2) temp_inferorientb3c3(1,2)]);
    
%cluster4
    corrdata_inferdiameterb3c4 = [tempdata_inferdiameterb3c4(:,diameter_responseCol) tempdata_inferdiameterb3c4(:,orientCol)*or_scale];
    temp_inferdiameterb3c4 = corrcoef(corrdata_inferdiameterb3c4);
    corrdata_inferorientb3c4 = [ tempdata_inferorientb3c4(:,diameterCol)*diameter_scale tempdata_inferorientb3c4(:,orient_responseCol)];
    temp_inferorientb3c4 = corrcoef(corrdata_inferorientb3c4);
    corrb3c4 = mean([temp_inferdiameterb3c4(1,2) temp_inferorientb3c4(1,2)]);
    
    %Block4
%cluster1
    corrdata_inferdiameterb4c1 = [tempdata_inferdiameterb4c1(:,diameter_responseCol) tempdata_inferdiameterb4c1(:,orientCol)*or_scale];
    temp_inferdiameterb4c1 = corrcoef(corrdata_inferdiameterb4c1);
    corrdata_inferorientb4c1 = [ tempdata_inferorientb4c1(:,diameterCol)*diameter_scale tempdata_inferorientb4c1(:,orient_responseCol)];
    temp_inferorientb4c1 = corrcoef(corrdata_inferorientb4c1);
    corrb4c1 = mean([temp_inferdiameterb4c1(1,2) temp_inferorientb4c1(1,2)]);
    
%cluster2
    corrdata_inferdiameterb4c2 = [tempdata_inferdiameterb4c2(:,diameter_responseCol) tempdata_inferdiameterb4c2(:,orientCol)*or_scale];
    temp_inferdiameterb4c2 = corrcoef(corrdata_inferdiameterb4c2);
    corrdata_inferorientb4c2 = [ tempdata_inferorientb4c2(:,diameterCol)*diameter_scale tempdata_inferorientb4c2(:,orient_responseCol)];
    temp_inferorientb4c2 = corrcoef(corrdata_inferorientb4c2);
    corrb4c2 = mean([temp_inferdiameterb4c2(1,2) temp_inferorientb4c2(1,2)]);
    
%cluster3
    corrdata_inferdiameterb4c3 = [tempdata_inferdiameterb4c3(:,diameter_responseCol) tempdata_inferdiameterb4c3(:,orientCol)*or_scale];
    temp_inferdiameterb4c3 = corrcoef(corrdata_inferdiameterb4c3);
    corrdata_inferorientb4c3 = [ tempdata_inferorientb4c3(:,diameterCol)*diameter_scale tempdata_inferorientb4c3(:,orient_responseCol)];
    temp_inferorientb4c3 = corrcoef(corrdata_inferorientb4c3);
    corrb4c3 = mean([temp_inferdiameterb4c3(1,2) temp_inferorientb4c3(1,2)]);
    
%cluster4
    corrdata_inferdiameterb4c4 = [tempdata_inferdiameterb4c4(:,diameter_responseCol) tempdata_inferdiameterb4c4(:,orientCol)*or_scale];
    temp_inferdiameterb4c4 = corrcoef(corrdata_inferdiameterb4c4);
    corrdata_inferorientb4c4 = [ tempdata_inferorientb4c4(:,diameterCol)*diameter_scale tempdata_inferorientb4c4(:,orient_responseCol)];
    temp_inferorientb4c4 = corrcoef(corrdata_inferorientb4c4);
    corrb4c4 = mean([temp_inferdiameterb4c4(1,2) temp_inferorientb4c4(1,2)]);
    
save temp