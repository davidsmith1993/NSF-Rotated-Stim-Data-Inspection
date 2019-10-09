    function [error,corr,nMVoutliers] = calc_standardized_error_byinferdim(MyData,or_scale,diameter_scale,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol,checkOutliers)
    %function [error,corr] = calc_standardized_error_bycluster_byinferdim(MyData,o_gain,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol)
    %
    %4/24/12    swe     modified to compute avg rmse for production task (based on comp_pc_rt from extrapolation experiment
    %11/5/14    swe     modified to standardize to range on each dimension prior to computing error
    %12/1/14    swe     collapse across inferred dimension
    %4/23/15    swe     collapsing across inferred dimension artificially inflates the correlation. Compute correlation separately for each inferred
    %                   dimsnion then average.
    %scaled diameter and orientation ranges
%need to fix this too dbs
    diameter_limits = [10 600]; 
    orient_limits = [-50 110]; 


    %infer diameter ==> 1 line, 1 circle to produce
    ind = find(MyData(:,inferDimensionCol)==11);
    tempdata_inferdiameter = MyData(ind,:);
    if checkOutliers
        %screen for multivariate outliers
        nMVoutliers = [0 0]; %nMV outliers when inferring [diameter, orientation]
        [o,io]=moutlier1([tempdata_inferdiameter(:,diameter_responseCol) tempdata_inferdiameter(:,diameterCol)],.10);
        if ~isempty(o)
            %disp('MV outlier when inferring diameter')
            %[o    io tempdata(o,diameter_responseCol) tempdata(o,diameterCol)]
            %pause
            tempdata_inferdiameter = tempdata_inferdiameter(~ismember(1:size(tempdata_inferdiameter, 1), o), :); %exclude MV outliers using index in o
            nMVoutliers(1) = length(o); %but keep track
        end
    else
        nMVoutliers(1)=9999;
    end

    %infer OR ==> 1 circle, 1 line to produce
    ind = find(MyData(:,inferDimensionCol)==22);
    tempdata_inferorient = MyData(ind,:);
    if checkOutliers
        %screen for multivariate outliers
        nMVoutliers = [0 0]; %nMV outliers when inferring [diameter, orientation]
        [o,io]=moutlier1([tempdata_inferorient(:,orient_responseCol) tempdata_inferorient(:,orientCol)],.10);
        if ~isempty(o)
            tempdata_inferorient = tempdata_inferorient(~ismember(1:size(tempdata_inferorient, 1), o), :); %exclude MV outliers using index in o
            nMVoutliers(2) = length(o); %but keep track
        end
    else
        nMVoutliers(2)=9999;
    end
    error_data = [((tempdata_inferdiameter(:,diameter_responseCol) - tempdata_inferdiameter(:,diameterCol)*diameter_scale)/diff(diameter_limits)); ...
                     ((tempdata_inferorient(:,orient_responseCol) - tempdata_inferorient(:,orientCol)*or_scale)/diff(orient_limits))];
    error = (mean(error_data.^2))^.5;


    corrdata_inferdiameter = [tempdata_inferdiameter(:,diameter_responseCol) tempdata_inferdiameter(:,orientCol)*or_scale];
    temp_inferdiameter = corrcoef(corrdata_inferdiameter);
    corrdata_inferorient = [ tempdata_inferorient(:,diameterCol)*diameter_scale tempdata_inferorient(:,orient_responseCol)];
    temp_inferorient = corrcoef(corrdata_inferorient);
    corr = mean([temp_inferdiameter(1,2) temp_inferorient(1,2)]);

    %             %check that I've extracted the clusters properly
    %             ax = [10 600 -50 110];
    %             close all; h=figure(100); set(h,'Position',[38 122 1507 975]);%,'Name',['Sub ' num2str(subs(s))]); hold on;
    %             title('Green=inferdiameter, Blue=inferorient')
    %             %subplot(241), 
    %                 hold on; plot(tempdata_inferdiameter(:,diameterCol)*diameter_scale,tempdata_inferdiameter(:,orientCol)*or_scale,'go')    
    %                 hold on; plot(tempdata_inferorient(:,diameterCol)*diameter_scale,tempdata_inferorient(:,orientCol)*or_scale,'bo')    
    %                 hold on; plot(tempdata_inferdiameter(:,diameter_responseCol),tempdata_inferdiameter(:,orientCol)*or_scale,'g.')
    %                 hold on; plot(tempdata_inferorient(:,diameterCol)*diameter_scale,tempdata_inferorient(:,orient_responseCol),'b.')
    %                 axis(ax)
    %                 a=[tempdata_inferdiameter(:,diameter_responseCol) tempdata_inferdiameter(:,orientCol)*or_scale];
    %                 b=[ tempdata_inferorient(:,diameterCol)*diameter_scale tempdata_inferorient(:,orient_responseCol)];
    %                 overallcorr = corr
    %                 inferdiametercorr = corrcoef(a)
    %                 inferorientcorr = corrcoef(b)
    %                  pause




