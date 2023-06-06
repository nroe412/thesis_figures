% sensitivity analysis discount rate 

sense_anal = [NaN NaN NaN NaN NaN NaN NaN NaN
0.061461039625482	0.02490240242	0.01245135685	0.04065713745	0.06611723786	0.04562219602	0.02281138315	0.04999919351
0.06151104088	0.02495240242	0.01247635717	0.04068213745	0.07351942291	0.05766994602	0.02883533345	0.05608281851
0.06156104213	0.02500240242	0.01250135748	0.04070713745	0.08097260924	0.06976919602	0.03488503407	0.06219219351
0.06161104338	0.02505240242	0.01252635779	0.04073213745	0.08847579682	0.08191794602	0.040959485	0.06832644351
0.06166104463	0.02510240242	0.0125513581	0.04075713745	0.09602723561	0.09411519602	0.04705818624	0.07448494351
0.06171104588	0.02515240242	0.01257635842	0.04078213745	0.1036254256	0.106359446	0.05318038776	0.08066681851
0.06176104713	0.02520240242	0.01260135873	0.04080713745	0.1112693667	0.118648946	0.05932521457	0.08687144351
0.06181104838	0.02525240242	0.01262635904	0.04083213745	0.1189568088	0.130982196	0.06549191666	0.09309794351
0.06186104963	0.02530240242	0.01265135935	0.04085713745	0.1266862521	0.143357696	0.07167974401	0.09934544351
0.06191105088	0.02535240242	0.01267635967	0.04088213745	0.1344561963	0.155773196	0.0778875716	0.1056130685
0.06196105213	0.02540240242	0.01270135998	0.04090713745	0.1422643915	0.168227446	0.08411477444	0.1118999435
0.06201105338	0.02545240242	0.01272636029	0.04093213745	0.1501095877	0.180718446	0.09036035251	0.1182053185
0.06206105463	0.02550240242	0.0127513606	0.04095713745	0.1579897847	0.193244446	0.0966234308	0.1245280685];


%column_classification 

%discount rates
discount_rates = linspace(0,0.13, 14);

%income group data-pre retrofit
LIC_max_income_pre_retrofit_REB = sense_anal(:,1);
MIC_min_income_pre_retrofit_REB = sense_anal(:,2);
MIC_max_income_pre_retrofit_REB = sense_anal(:,3);
HIC_min_income_pre_retrofit_REB = sense_anal(:,4);

%income group data-post retrofit
LIC_max_income_post_meas10_REB = sense_anal(:,5);
MIC_min_income_post_meas10_REB = sense_anal(:,6);
MIC_max_income_post_meas10_REB = sense_anal(:,7);
HIC_min_income_post_meas10_REB = sense_anal(:,8);

%plotting 
max_accepted_REB = 0.06; % REF; ACEEE
%plotting the REB threshold
figure('Name', 'Mr. Tumnus');
yline(max_accepted_REB,'--','Max. Accepted REB - VT'); % plot reference line


hold on 
%plotting LIC pre retrofit
LIC_pre_retrofit = plot(discount_rates, LIC_max_income_pre_retrofit_REB);
LIC_pre_retrofit.Marker = 'o'; 
LIC_pre_retrofit.Color = 'red';

hold on 
%plotting MIC min income pre retrofit
MIC_min_pre_retrofit = plot(discount_rates, MIC_min_income_pre_retrofit_REB);
MIC_min_pre_retrofit.Marker = 'o'; 
MIC_min_pre_retrofit.Color = 'green';

hold on 
%plotting MIC max income pre retrofit
MIC_max_pre_retrofit = plot(discount_rates, MIC_max_income_pre_retrofit_REB);
MIC_max_pre_retrofit.Marker = 'o'; 
MIC_max_pre_retrofit.Color = 'cyan';


hold on 
%plotting HIC min income pre retrofit
HIC_min_pre_retrofit = plot(discount_rates, HIC_min_income_pre_retrofit_REB);
HIC_min_pre_retrofit.Marker = 'o'; 
HIC_min_pre_retrofit.Color = 'magenta';

hold on 
%plotting LIC post retrofit
LIC_post_retrofit = plot(discount_rates, LIC_max_income_post_meas10_REB);
LIC_post_retrofit.Marker = 'diamond'; 
LIC_post_retrofit.Color = 'red';

hold on 
%plotting MIC min income post retrofit
MIC_min_post_meas10 = plot(discount_rates, MIC_min_income_post_meas10_REB);
MIC_min_post_meas10.Marker = 'diamond'; 
MIC_min_post_meas10.Color = 'green';

hold on 
%plotting MIC max income post retrofit
MIC_max_post_retrofit = plot(discount_rates, MIC_max_income_post_meas10_REB);
MIC_max_post_retrofit.Marker = 'diamond'; 
MIC_max_post_retrofit.Color = 'cyan';


hold on 
%plotting HIC min income post retrofit
HIC_min_post_retrofit = plot(discount_rates, HIC_min_income_post_meas10_REB);
HIC_min_post_retrofit.Marker = 'diamond'; 
HIC_min_post_retrofit.Color = 'magenta';

hold off


legend('Max. Accepted REB - VT','LIC pre retrofit','MIC-min. pre retrofit',...
    'MIC-max. pre retrofit', ...
    'HIC-min. pre retrofit','LIC post meas. 10','MIC-min. post meas. 10',...
    'MIC-max. post meas. 10', 'HIC min. post meas. 10')
legend('boxoff')
legend('location', 'bestoutside')
xlabel('Discount Rate')
ylabel('Real Energy Burden (REB)')
title('REB vs. Discount Rate B4 and After Measure #10 Upgrade')
