    function [pcorA1, pcorA2, pcorA3, pcorA4, pcorB1, pcorB2, pcorB3, pcorB4, pcorC1, pcorC2, pcorC3, pcorC4, pcorD1, pcorD2, pcorD3, pcorD4] = calc_prop_correct_E3(MyData,or_scale,diameter_scale,inferDimensionCol,diameter_responseCol,diameterCol,orient_responseCol,orientCol,catCol,fbCol,blockCol)

    % function pcor = calc_prop_correct(MyData);
    %
    % 7/10/95  tgf created
    % 10/23/98 ewm sorted out '3' responses
    %12/15/11  swe modified for no fb col

    %dind = find(MyData(:,respCol)==1 | MyData(:,respCol)==2 | MyData(:,respCol)==3 | MyData(:,respCol)==4);
%This gets rid of the non answers    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==1 | MyData(:,fbCol)==0&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==1);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorA1 = [length(corr_ind)/length(dind)];
    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==2 | MyData(:,fbCol)==0&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==2);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorA2 = [length(corr_ind)/length(dind)];
    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==3 | MyData(:,fbCol)==0&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==3);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorA3 = [length(corr_ind)/length(dind)];
    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==4 | MyData(:,fbCol)==0&MyData(:,catCol)==1&MyData(:,diameterCol)>=500&MyData(:,blockCol)==4);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorA4 = [length(corr_ind)/length(dind)];
 %   
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==1 | MyData(:,fbCol)==0&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==1);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorB1 = [length(corr_ind)/length(dind)];
    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==2 | MyData(:,fbCol)==0&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==2);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorB2 = [length(corr_ind)/length(dind)];
    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==3 | MyData(:,fbCol)==0&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==3);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorB3 = [length(corr_ind)/length(dind)];
    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==4 | MyData(:,fbCol)==0&MyData(:,catCol)==2&MyData(:,diameterCol)<=500&MyData(:,blockCol)==4);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorB4 = [length(corr_ind)/length(dind)];
%    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==1 | MyData(:,fbCol)==0&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==1);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorC1 = [length(corr_ind)/length(dind)];
    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==2 | MyData(:,fbCol)==0&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==2);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorC2 = [length(corr_ind)/length(dind)];
    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==3 | MyData(:,fbCol)==0&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==3);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorC3 = [length(corr_ind)/length(dind)];
    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==4 | MyData(:,fbCol)==0&MyData(:,catCol)==1&MyData(:,diameterCol)<=500&MyData(:,blockCol)==4);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorC4 = [length(corr_ind)/length(dind)];
%    
    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==1 | MyData(:,fbCol)==0&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==1);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorD1 = [length(corr_ind)/length(dind)];

    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==2 | MyData(:,fbCol)==0&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==2);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorD2 = [length(corr_ind)/length(dind)];

    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==3 | MyData(:,fbCol)==0&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==3);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorD3 = [length(corr_ind)/length(dind)];

    dind = find(MyData(:,fbCol)==1&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==4 | MyData(:,fbCol)==0&MyData(:,catCol)==2&MyData(:,diameterCol)>=500&MyData(:,blockCol)==4);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcorD4 = [length(corr_ind)/length(dind)];


