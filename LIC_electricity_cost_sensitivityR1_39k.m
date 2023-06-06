%% electricity cost sensitivity analysis;

%LIC
%petro-derivatives cost 

nat_gas_cost = 0.0544214;   %per kwh
heat_oil_cost = 0.05532314286;  %per kwh
propane_cost = 0.02945815392;   %per kwh


%electricity costs 

proj_electricity_costs = [
2030	0.1287657291
2023	0.1413760833
2022	0.1455935245
];

%resstock data; top row is b4->bottom row is after


resstock_data = [
    56059.66	690172.5	37325.8	294561.6	1863026	0	154838.2	1406246	4884783	2125584	404339.2	399513.8	1923769	90901.8	0	1029156	71813.13	2971446	0	448761.1	555345.4	1987847	0	0	45921519	3676024	0	0	0	0	7973813	0	798814.7	0	0	0	0	0	6404852	0	157605.7
56059.66	358427	37325.8	87921.42	1475504	0	154838.2	493963.7	9630127	6785206	404339.2	399513.8	1367643	90901.8	0	1029156	71813.13	2971446	0	448761.1	571737.6	1987847	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0];

heads = 3390; % number of LIC people in this class 


%annual electricity costs array

%annual energy cost = year, electricity + nat. gas + propane
annual_energy_cost_baseline_Calcd = zeros(length(proj_electricity_costs)-1, 5); % four columns: [year, electricity cost, heating oil, natural gas cost, propane costs ]
annual_energy_cost_meas10_Calcd = zeros(length(proj_electricity_costs)-1, 5); % four columns: [year, electricity cost, natural gas cost, propane costs ]
year = zeros(length(proj_electricity_costs)-1,1);

%filling up the electricity costs survey
for i = 1: (length(proj_electricity_costs)-1)
    
    %baseline elec.
    annual_energy_cost_baseline_Calcd(i,2) = (sum(resstock_data(1,1:23))/heads)*proj_electricity_costs(length(proj_electricity_costs)-i,2); %cols. 1-23 is the electricity set of costs 
   
    %meas.10 elec.
    annual_energy_cost_meas10_Calcd(i,2) = (sum(resstock_data(2,1:23))/heads)*proj_electricity_costs(length(proj_electricity_costs)-i,2); %cols. 1-23 is the electricity set of costs 
   

    %baseline heat oil
    annual_energy_cost_baseline_Calcd(i,3) = (sum(resstock_data(1,24:26))/heads)*heat_oil_cost;  %cols. 24-26 is the heat oil 
    
    %meas.10 heat oil 
    annual_energy_cost_meas10_Calcd(i,3) = (sum(resstock_data(2,24:26))/heads)*heat_oil_cost; %cols. 24-26 is the heat oil 
    

    %baseline nat gas
    annual_energy_cost_baseline_Calcd(i,4) = (sum(resstock_data(1,27:36))/heads)*nat_gas_cost; %cols. 27-36 - costs natural gas

    %meas.10 nat gas 
    annual_energy_cost_meas10_Calcd(i,4) = (sum(resstock_data(2,27:36))/heads)*nat_gas_cost; %cols. 27-36 is costs natural gas 
    

    %baseline propane
    annual_energy_cost_baseline_Calcd(i,5) = (sum(resstock_data(1,37:41))/heads)*propane_cost; %cols. 37-41 propane

    %meas.10 propane 
    annual_energy_cost_meas10_Calcd(i,5) = (sum(resstock_data(2,37:41))/heads)*propane_cost; %cols. 37-41 propane
   

    %years
    year(i) = proj_electricity_costs(length(proj_electricity_costs)-i);
   
end 
    annual_energy_cost_baseline_Calcd(:,1) = year'; 
    annual_energy_cost_meas10_Calcd(:,1) = year';


%real energy burden calculation
baseline_capex = 200; % 200 per year @ 5% discount rate 
annual_capex_post_meas10_LIC = 2168.34; % annual cost per year @ 5.00% 
REB_baseline_LIC = zeros(length(annual_energy_cost_meas10_Calcd(:,1)), 3); % [year, min income_REB, max income_REB]
REB_meas10_LIC = zeros(length(annual_energy_cost_meas10_Calcd(:,1)), 3);

REB_no_cap_baseline_LIC = zeros(length(annual_energy_cost_meas10_Calcd(:,1)), 3); % [year, min income_REB, max income_REB]
REB_no_cap_meas10_LIC = zeros(length(annual_energy_cost_meas10_Calcd(:,1)), 3);

%income 
income_min_LIC = 1; %   $1/year; theorhetical min LIC income
income_max_LIC = 39999; %   $39999/year; theorhetical max LIC income

for k = 1: length(annual_energy_cost_meas10_Calcd(:,1)) %calculate length of first column

    %baseline REB
    REB_baseline_LIC(k,1) = year(k);
    REB_baseline_LIC(k,2) = (sum(annual_energy_cost_baseline_Calcd(k,2:5)) + baseline_capex)/income_min_LIC; % min income case; extraneous for LIC 
    REB_baseline_LIC(k,3) = (sum(annual_energy_cost_baseline_Calcd(k,2:5)) + baseline_capex)/income_max_LIC; %max income case 

        %no capex (no cap ;) ) 
        REB_no_cap_baseline_LIC(k,1) = year(k);
        REB_no_cap_baseline_LIC(k,2) = (sum(annual_energy_cost_baseline_Calcd(k,2:5)))/income_min_LIC; % min income case; extraneous for LIC 
        REB_no_cap_baseline_LIC(k,3) = (sum(annual_energy_cost_baseline_Calcd(k,2:5)))/income_max_LIC; %max income case 
            
    %meas.10 REB
    REB_meas10_LIC(k,1) = year(k);
    REB_meas10_LIC(k,2) = (sum(annual_energy_cost_meas10_Calcd(k,2:5)) + annual_capex_post_meas10_LIC)/income_min_LIC; % min income case; extraneous for LIC 
    REB_meas10_LIC(k,3) = (sum(annual_energy_cost_meas10_Calcd(k,2:5)) + annual_capex_post_meas10_LIC)/income_max_LIC; %max income case

        %no capex (no cap ;) ) 
        REB_no_cap_meas10_LIC(k,1) = year(k);
        REB_no_cap_meas10_LIC(k,2) = (sum(annual_energy_cost_meas10_Calcd(k,2:5)))/income_min_LIC; % min income case; extraneous for LIC 
        REB_no_cap_meas10_LIC(k,3) = (sum(annual_energy_cost_meas10_Calcd(k,2:5)))/income_max_LIC; %max income case 
            
end


%plotting REB 
max_accepted_REB = 6; % REF; ACEEE (%)
%plotting the REB threshold
figure('Name', 'sensitivity R1'); 

%plotting bars
    REB = 100*[REB_baseline_LIC(:,1), REB_baseline_LIC(:,3), REB_meas10_LIC(:,3)]; % as %
    REB_no_cap = 100*[REB_no_cap_baseline_LIC(:,1), REB_no_cap_baseline_LIC(:,3), REB_no_cap_meas10_LIC(:,3)]; % as %
    
    REB = round(REB,1);
    REB_no_cap = round(REB_no_cap,1);
    tiledlayout(2,1)
    
    %plotting w/ consideration of capex
    subplot(2,1,1)
    REB_LIC = bar(year,REB(:,2:3), 'FaceColor','flat');
       hold on
    yline(max_accepted_REB,'--','Max. Accepted REB - VT'); % plot reference line
    
    %labeling bars
    xtips1 = REB_LIC(1).XEndPoints;
    ytips1 = REB_LIC(1).YEndPoints;
    labels1 = string(REB_LIC(1).YData);
    text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
        'VerticalAlignment','bottom')
    hold on
    xtips2 = REB_LIC(2).XEndPoints;
    ytips2 = REB_LIC(2).YEndPoints;
    labels2 = string(REB_LIC(2).YData);
    text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')

    %logistical stuff 
    legend({'pre retrofit', 'post retrofit', 'acceptable REB'}, 'Location', 'best', 'FontSize', 12, 'FontWeight', 'bold')
    title('REB for $39.9k/year LIC group before and after measure 10 w/ EIA projected electricity costs')
    xlabel('year')
    ylabel('REB (%)')
    
    %plotting w/out consideration of capex
    subplot(2,1,2)
    REB_no_cap_LIC = bar(year,REB_no_cap(:,2:3), 'FaceColor', 'flat');
       hold on 
    yline(max_accepted_REB,'--','Max. Accepted REB - VT'); % plot reference line
    
    %labeling bars
    xtips1 = REB_no_cap_LIC(1).XEndPoints;
    ytips1 = REB_no_cap_LIC(1).YEndPoints;
    labels1 = string(REB_no_cap_LIC(1).YData);
    text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
        'VerticalAlignment','bottom')
    hold on
    xtips2 = REB_no_cap_LIC(2).XEndPoints;
    ytips2 = REB_no_cap_LIC(2).YEndPoints;
    labels2 = string(REB_no_cap_LIC(2).YData);
    text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
   
   

   legend({'pre retrofit no capex', 'post retrofit no capex', 'acceptable REB'}, 'Location', 'best', 'FontSize', 12, 'FontWeight', 'bold')
    title('REB for $39.9k/year LIC group before and after measure 10 w/ projected electricity costs (no capex. considered)')
    xlabel('year')
    ylabel('REB (%)')