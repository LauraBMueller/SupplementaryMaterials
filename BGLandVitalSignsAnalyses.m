%% Blood Glucose Level and Vital Sign Analyses
% Import and read .csv files

S1_BGL = readtable('S1_BGL.csv','PreserveVariableNames',true);
S1_VitalSigns = readtable('S1_VitalSigns.csv','PreserveVariableNames',true);
disp(S1_BGL);
disp(S1_VitalSigns);
%%
figure; 
plot(S1_BGL,"Minutes post meal ingestion","BGL [mg/dl]");
% connect existing values if there is a NaN gap in the graph
if "BGL [mg/dl]" == NaN;


title('Blood Glucose Level of Subject 1');

%% Blood Glucose Level and Vital Sign Analyses
% Import and read .csv files

% Note: Ensure the CSV files have appropriate headers for Conditions and Times

S1_BGL = readtable('S1_BGL.csv', 'PreserveVariableNames', true);
S1_VitalSigns = readtable('S1_VitalSigns.csv', 'PreserveVariableNames', true);

disp(S1_BGL);
disp(S1_VitalSigns);

% Interpolate missing BGL values
S1_BGL = interpolateMissingBGL(S1_BGL);

% Plot Blood Glucose Levels
figure;
plot(S1_BGL.("Minutes post meal ingestion"), S1_BGL.("BGL [mg/dl]"), '-o');
title('Blood Glucose Level of Subject 1');
xlabel('Minutes post meal ingestion');
ylabel('BGL [mg/dl]');
grid on;

% Plot Vital Signs by Condition
figure;
conditions = unique(S1_VitalSigns.Condition);

for i = 1:length(conditions)
    condition = conditions{i};
    idx = strcmp(S1_VitalSigns.Condition, condition);
    
    subplot(3,1,1);
    hold on;
    plot(i, mean(S1_VitalSigns.HeartRate(idx)), 'o');
    ylabel('Heart Rate (BPM)');
    xticks(1:length(conditions));
    xticklabels(conditions);
    grid on;
    
    subplot(3,1,2);
    hold on;
    plot(i, mean(S1_VitalSigns.SystolicBP(idx)), 'o');
    plot(i, mean(S1_VitalSigns.DiastolicBP(idx)), 'x');
    ylabel('Blood Pressure (mmHg)');
    xticks(1:length(conditions));
    xticklabels(conditions);
    legend('Systolic', 'Diastolic');
    grid on;
    
    subplot(3,1,3);
    hold on;
    plot(i, mean(S1_VitalSigns.BodyTemperature(idx)), 'o');
    ylabel('Body Temperature (Celsius)');
    xticks(1:length(conditions));
    xticklabels(conditions);
    grid on;
end

title('Vital Signs by Condition');
xlabel('Condition');

% Perform statistical analyses
[results, normalityResults] = analyzeWithinSubjects(S1_BGL, S1_VitalSigns);

disp('Statistical Analysis Results:');
disp(results);

disp('Normality Test Results:');
disp(normalityResults);

%% Functions

function data = interpolateMissingBGL(data)
    % Interpolate missing BGL values using linear interpolation
    data.("BGL [mg/dl]") = fillmissing(data.("BGL [mg/dl]"), 'linear');
end

function [results, normalityResults] = analyzeWithinSubjects(BGLData, VitalSignsData)
    % Analyzes the data within subjects, checking for normality and performing
    % appropriate statistical tests.

    results = struct();
    normalityResults = struct();

    % Extract variables
    BGL = BGLData.("BGL [mg/dl]");
    HeartRate = VitalSignsData.HeartRate;
    SystolicBP = VitalSignsData.SystolicBP;
    DiastolicBP = VitalSignsData.DiastolicBP;
    BodyTemperature = VitalSignsData.BodyTemperature;
    Conditions = categorical(VitalSignsData.Condition);

    % Normality test (using Shapiro-Wilk test)
    [normalityResults.BGL_h, normalityResults.BGL_p] = swtest(BGL);
    [normalityResults.HeartRate_h, normalityResults.HeartRate_p] = swtest(HeartRate);
    [normalityResults.SystolicBP_h, normalityResults.SystolicBP_p] = swtest(SystolicBP);
    [normalityResults.DiastolicBP_h, normalityResults.DiastolicBP_p] = swtest(DiastolicBP);
    [normalityResults.BodyTemperature_h, normalityResults.BodyTemperature_p] = swtest(BodyTemperature);

    % Statistical tests
    if normalityResults.BGL_h == 0
        % Normal distribution: use parametric tests
        [results.BGL_p, results.BGL_tbl, results.BGL_stats] = anova1(BGL, BGLData.Condition, 'off');
    else
        % Non-normal distribution: use non-parametric tests
        [results.BGL_p, results.BGL_tbl, results.BGL_stats] = kruskalwallis(BGL, BGLData.Condition, 'off');
    end

    if normalityResults.HeartRate_h == 0
        [results.HeartRate_p, results.HeartRate_tbl, results.HeartRate_stats] = anova1(HeartRate, Conditions, 'off');
    else
        [results.HeartRate_p, results.HeartRate_tbl, results.HeartRate_stats] = kruskalwallis(HeartRate, Conditions, 'off');
    end

    if normalityResults.SystolicBP_h == 0
        [results.SystolicBP_p, results.SystolicBP_tbl, results.SystolicBP_stats] = anova1(SystolicBP, Conditions, 'off');
    else
        [results.SystolicBP_p, results.SystolicBP_tbl, results.SystolicBP_stats] = kruskalwallis(SystolicBP, Conditions, 'off');
    end

    if normalityResults.DiastolicBP_h == 0
        [results.DiastolicBP_p, results.DiastolicBP_tbl, results.DiastolicBP_stats] = anova1(DiastolicBP, Conditions, 'off');
    else
        [results.DiastolicBP_p, results.DiastolicBP_tbl, results.DiastolicBP_stats] = kruskalwallis(DiastolicBP, Conditions, 'off');
    end

    if normalityResults.BodyTemperature_h == 0
        [results.BodyTemperature_p, results.BodyTemperature_tbl, results.BodyTemperature_stats] = anova1(BodyTemperature, Conditions, 'off');
    else
        [results.BodyTemperature_p, results.BodyTemperature_tbl, results.BodyTemperature_stats] = kruskalwallis(BodyTemperature, Conditions, 'off');
    end
end

function [h, p] = swtest(x, alpha)
    % Shapiro-Wilk test for normality
    if nargin < 2
        alpha = 0.05;
    end
    [h, p] = swtest(x, alpha);
end
