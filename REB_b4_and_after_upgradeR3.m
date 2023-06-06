%% REB computation B4 + after upgrade
%known 
    max_accepted_REB = 6; 


%lic 
%B4
    LIC_REB_NO_CAP_B4 = [5.67];
    LIC_REB_B4 = [6.17];

%After 
    LIC_REB_NO_CAP_AFTER = [4.18]; 
    LIC_REB_AFTER = [9.60];

%mic 
%B4
    MIC_REB_NO_CAP_B4 = [2.01,1.01]; %min income, max income
    MIC_REB_B4 = [2.51, 1.26];

%After 
    MIC_REB_NO_CAP_AFTER = [1.67, 0.83]; 
    MIC_REB_AFTER = [ 9.41, 4.71];

%hic 
%B4
    HIC_REB_NO_CAP_B4 = [3.83,0.31]; %min income, max income
    HIC_REB_B4 = [4.08, 0.33];

%After 
    HIC_REB_NO_CAP_AFTER = [3.55, 0.28]; 
    HIC_REB_AFTER = [7.45, 0.60];

%making categories 
X = categorical({'LIC Before','LIC after', 'MIC before', 'MIC after','HIC before', 'HIC after'});
X = reordercats(X,{'LIC Before','LIC after', 'MIC before', 'MIC after','HIC before','HIC after'});

%minimum 
MINS = [LIC_REB_B4, LIC_REB_AFTER, MIC_REB_B4(1), MIC_REB_AFTER(1), HIC_REB_B4(1), HIC_REB_AFTER(1) ];
MAXS = [LIC_REB_B4, LIC_REB_AFTER, MIC_REB_B4(2), MIC_REB_AFTER(2), HIC_REB_B4(2), HIC_REB_AFTER(2) ];

%plotting cap
%plot minimums
subplot(2,1,1)
scatter(X, MINS,'black','filled')
hold on

%plot accepted 
yline(max_accepted_REB,'--','Max. Accepted REB - VT'); % plot reference line


%plot max 
scatter(X,MAXS, 'black', 'filled')
    hold on

top_limit = 12;
%plot interval for MIC b4
plot([X(1) X(1)], [LIC_REB_B4,top_limit], '--', 'Color', 'blue') %plot to 10% point to just create a frame of reference; in reality the LIC REB threshold goes much higher
    hold on 
%plot interval for MIC after
plot([X(2) X(2)], [LIC_REB_AFTER,top_limit], '--', 'Color', 'blue')
    hold on
%plot interval for MIC b4
plot([X(3) X(3)], [MIC_REB_B4(1),MIC_REB_B4(2)], '--', 'Color', 'blue')
    hold on 
%plot interval for MIC after
plot([X(4) X(4)], [MIC_REB_AFTER(1),MIC_REB_AFTER(2)], '--', 'Color', 'blue')
    hold on

 %plot interval for HIC b4
plot([X(5) X(5)], [HIC_REB_B4(1),HIC_REB_B4(2)], '--', 'Color', 'blue')
    hold on 
plot([X(6) X(6)], [HIC_REB_AFTER(1),HIC_REB_AFTER(2)], '--', 'Color', 'blue')
    hold off


%plot information 
title('REB before and after measure 10')
xlabel('income categories')
ylabel('REB (%)')
ylim([0, top_limit])


%plotting no cap.
subplot(2,1,2)
MINS_no_cap = [LIC_REB_NO_CAP_B4, LIC_REB_NO_CAP_AFTER, MIC_REB_NO_CAP_B4(1), MIC_REB_NO_CAP_AFTER(1), HIC_REB_NO_CAP_B4(1), HIC_REB_NO_CAP_AFTER(1) ];
MAXS_no_cap = [LIC_REB_NO_CAP_B4, LIC_REB_NO_CAP_AFTER, MIC_REB_NO_CAP_B4(2), MIC_REB_NO_CAP_AFTER(2), HIC_REB_NO_CAP_B4(2), HIC_REB_NO_CAP_AFTER(2) ];
scatter(X, MINS_no_cap,'black','filled')
hold on

%plot accepted 
yline(max_accepted_REB,'--','Max. Accepted REB - VT'); % plot reference line


%plot max 
scatter(X,MAXS_no_cap, 'black', 'filled')
    hold on


%plot interval for MIC b4
plot([X(1) X(1)], [LIC_REB_NO_CAP_B4,top_limit], '--', 'Color', 'blue') %plot to 10% point to just create a frame of reference; in reality the LIC REB threshold goes much higher
    hold on 
%plot interval for MIC after
plot([X(2) X(2)], [LIC_REB_NO_CAP_AFTER,top_limit], '--', 'Color', 'blue')
    hold on
%plot interval for MIC b4
plot([X(3) X(3)], [MIC_REB_NO_CAP_B4(1),MIC_REB_NO_CAP_B4(2)], '--', 'Color', 'blue')
    hold on 
%plot interval for MIC after
plot([X(4) X(4)], [MIC_REB_NO_CAP_AFTER(1),MIC_REB_NO_CAP_AFTER(2)], '--', 'Color', 'blue')
    hold on

 %plot interval for HIC b4
plot([X(5) X(5)], [HIC_REB_NO_CAP_B4(1),HIC_REB_NO_CAP_B4(2)], '--', 'Color', 'blue')
    hold on 
plot([X(6) X(6)], [HIC_REB_NO_CAP_AFTER(1),HIC_REB_NO_CAP_AFTER(2)], '--', 'Color', 'blue')
    hold off


%plot information 
title('REB before and after measure 10 (no capex considered)')
xlabel('income categories')
ylabel('REB (%)')
ylim([0, top_limit])




