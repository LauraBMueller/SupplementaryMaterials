%% Comparisons
% Comparing data between and within subjects at different conditions
%% Comparing Trials at different MVCs
% Comparing 10% MVC with 30% MVC within the same trial session

% create a fucntioon and loop this for every file per subject
channels_Grid1 = [1:64];
channels_Grid2 = [64:128];
RMS_1_Grid1 = rms(1:64,:)
RMS_1_Grid2 = rms(64:128,:)
RMS_2_Grid1 = 
RMS_2_Grid2 = 

% for Grid 1
saveRMSTableAsCSV(channels_Grid1, RMS_1_Grid1, RMS_2_Grid1, comparison_10_30_trial1)
% Plots
% Test for Normality
% Within Subject t-Test (or non-paramteric equivalent)
% 
%% Comparing Trials at different Conditions
% Comparing fasted-peak, fasted-dip, and peak-dip conditions within the same 
% subject
% Test for Normality
% Within Subject paired t-Test (or non-paramteric equivalent)

load(filename,variables)
x = %fasted
y = %peak
% Test Normal distribution with Q-Q plot
qqplot(x,y)
% if Data is normally distributed, run ttest
[h,p] = ttest(x,y,"Alpha",0.05) %returns h, if h=0 ttest does not recejt null hypothesis at 0.05 significance level
%% Between Subject Comparisons 
% Plots
% Test for Normality
% Between Subject t-Tests (or non-paramteric equivalent)
% Within and Between Subject ANOVAs (or non-paramteric equivalent)