    function [DATAcat,DATAproductionTest,DATAproductionTrainErrors,DATAproductionTrainCorrs]=David_e3_data_inspection_Rotate
       
    %12/12/16       dbs    NSF grant E3
    %3/08/18        dbs    NSF grant E3 forced choice inference

    
    close all
    catCol = 1; diameterCol = 2; orientCol = 3; respCol = 4; rtCol = 5; fbCol = 6; diameter_responseCol = 7; orient_responseCol = 8; highLowCol = 11; inferDimensionCol = 12; blockCol = 16; 
    clusterCol = 17; %added to blockdata later in the code
    diameter_scale = .5; %diameterCol is unscaled, but diameter_responseCol is scaled
    or_scale = 180/800; %orientCol is unscaled, but orient_respCol is scaled

    
    nTrainBlocks = 4;
    testBlock = 5;
    
    %108.62 -40.59
    %398.1 87.19
    
   
    training = {'AB','INF'};
    catstruct = {'RB'};
    
    nSubs = 80;
    nOrgInfo = 3; %subs training cs
    nOrgInfoTest = 3; %subs training cs
    DATAcat = 99*ones(nSubs,nOrgInfo+nTrainBlocks*4);  %2d matrix
    nErrorTypes = 4; 
    
    DATAproductionTest = 99*ones(nSubs,nOrgInfoTest+4); %[nOrgInfo training];
    nErrorTypesTrain = 1; %12/01/14: collapsing across inferred dimension, but computing error types separately for each cluster and averaging
    %DATAproductionTrainErrors = 99*ones(nSubs,nOrgInfo+nTrainBlocks*nErrorTypesTrain); %[nOrgInfo mean(infer_catA infer_catB) across blocks];
    DATAproductionTrainCorrs = 99*ones(nSubs,nOrgInfo+nTrainBlocks*4); %[nOrgInfo n_correlations_for_the_n_errorTypes across blocks];
    %DATA_MVoutliers_test = 9999*ones(nSubs,nOrgInfo+nErrorTypes_bycluster); 
    
    figCounter = 1;
    close all
    
    count = 0;
    for tr = 1:length(training)
        for cs = 1:length(catstruct)
            if strcmpi(training{tr},'AB') %cat training
                     subs = [2 7 9 12 14 23 25 26 28 29 32 250 251 37 38 39 42 43 44 46 53 55 56 57 59 63 64 65 70 72 73 75 76 78];
                     map =  [2 2 2 1 1 1 2 1 2 1 2 2 2 2 1 2 1 2 1 2 1 1 1 1 2 2 1 1 1 2 2 2 1 1];       


            else%Inference training
                if strcmpi(catstruct{cs},'RB')
                   

                 
                     subs = [1 3 5 6 10 11 15 16 18 19 20 21 22 27 33 34 35 36 40 41 45 47 48 49 50 51 52 54 58 61 62 67 68 69 71 74 77 79 81]; 
                     map =  [2 1 2 2 2 1 1 2 1 2 2 1 1 1 1 1 2 2 2 1 1 1 2 2 1 1 1 2 2 2 1 1 1 2 2 1 2 1 2];
                end
            end

            figCounter = figCounter + 1;
            subPlotCounter = 0;
            for s=1:length(subs)
                count=count+1;
                fname = ['S' num2str(subs(s)) '_' catstruct{cs} '_' training{tr} 'train_INFtest__map' num2str(map(s))];
                eval(['load ' fname '.dat'])
                eval(['data = ' fname ';']);
                eval(['clear ' fname]);
   
                %compute PC on categorization training or average rmse on inf training, and collect data
                if strcmpi(training{tr},'INF')
                    for b=1:nTrainBlocks
                        blockdata = data(data(:,blockCol)==b,:);
                        [corrb1c1, corrb1c2, corrb1c3, corrb1c4, corrb2c1, corrb2c2, corrb2c3, corrb2c4, corrb3c1, corrb3c2, corrb3c3, corrb3c4, corrb4c1, corrb4c2, corrb4c3, corrb4c4] = calc_error_inference_e3(data,or_scale,diameter_scale,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol,catCol,blockCol);
                        
                        DATAproductionTrainCorrs(count,1:nOrgInfo) = [subs(s) tr cs];
                        DATAproductionTrainCorrs(count,nOrgInfo+1:end) = ([corrb1c1 corrb1c2 corrb1c3 corrb1c4 corrb2c1 corrb2c2 corrb2c3 corrb2c4 corrb3c1 corrb3c2 corrb3c3 corrb3c4 corrb4c1 corrb4c2 corrb4c3 corrb4c4]);
                       
%issue here                        

%                         DATAproductionTrainCorrs(count,1:nOrgInfo) = [subs(s) tr];
%                         DATAproductionTrainCorrs(count,nOrgInfo+b) = mean([train_corrs.A train_corrs.B train_corrs.C train_corrs.D])
                    end
                  
                else %AB/AnA (Only AB for E3)
                    DATAcat(count,1:nOrgInfo) = [subs(s) tr cs];

              
    [pcorA1 pcorA2 pcorA3 pcorA4 pcorB1 pcorB2 pcorB3 pcorB4 pcorC1 pcorC2 pcorC3 pcorC4 pcorD1 pcorD2 pcorD3 pcorD4] = calc_prop_correct_E3(data,or_scale,diameter_scale,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol,catCol,fbCol,blockCol);
    DATAcat(count,1:nOrgInfoTest) = [subs(s) tr cs];
    DATAcat(count,nOrgInfoTest+1:end) = [pcorA1 pcorA2 pcorA3 pcorA4 pcorB1 pcorB2 pcorB3 pcorB4 pcorC1 pcorC2 pcorC3 pcorC4 pcorD1 pcorD2 pcorD3 pcorD4];

                end
                
        %Transfer
    blockdata = data(data(:,blockCol)==testBlock,:);
    [test_corrs.A, test_corrs.B, test_corrs.C, test_corrs.D] = calc_corr_test(blockdata,or_scale,diameter_scale,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol,catCol);
    
    DATAproductionTest(count,1:nOrgInfoTest) = [subs(s) tr cs];
    DATAproductionTest(count,nOrgInfoTest+1:end) = [test_corrs.A test_corrs.B test_corrs.C test_corrs.D];
    
          end %for subs
        end %for conditions
    end
    
   filename='e3_Data_spring2018_FC_5_4_18.xlsx';
xlswrite(filename,DATAproductionTest,3);
xlswrite(filename,DATAcat,1);
xlswrite(filename,DATAproductionTrainCorrs,2);











%Plot Data

    end

            %plot2dstim