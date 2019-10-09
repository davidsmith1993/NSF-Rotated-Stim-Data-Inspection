    function [pcor] = calc_prop_correct(MyData,catCol,respCol,fbCol)

    % function pcor = calc_prop_correct(MyData);
    %
    % 7/10/95  tgf created
    % 10/23/98 ewm sorted out '3' responses
    %12/15/11  swe modified for no fb col

    %dind = find(MyData(:,respCol)==1 | MyData(:,respCol)==2 | MyData(:,respCol)==3 | MyData(:,respCol)==4);
%This gets rid of the non answers    
    dind = find(MyData(:,fbCol)==1 | MyData(:,fbCol)==0);
    corr_ind = find(MyData(dind,fbCol) == 1);
    pcor = [length(corr_ind)/length(dind) 99];


