%% Blood Glucose Level and Vital Sign Analyses
%% Import and read .csv files

% Note: Ensure the CSV files have appropriate headers for Conditions and Times

S1_BGL = readtable('S1_BGL.csv', 'PreserveVariableNames', true);
S1_VitalSigns = readtable('S1_VitalSigns.csv', 'PreserveVariableNames', true);

disp(S1_BGL);
disp(S1_VitalSigns);

%% Interpolate missing BGL values
S1_BGL = interpolateMissingBGL(S1_BGL);

%% Plots
% Plot Blood Glucose Levels
figure;
plot(S1_BGL.("Minutes post meal ingestion"), S1_BGL.("BGL [mg/dl]"), '-o');
title('Blood Glucose Level of Subject 1');
xlabel('Minutes post meal ingestion');
ylabel('BGL [mg/dl]');
grid on;

% Plot Vital Signs by Condition
figure;
conditions = unique(S1_VitalSigns.("Time of Measurement"));
title('Vital Signs by Condition');
xlabel('Condition');

for i = 1:length(conditions)
    condition = conditions{i};
    idx = strcmp(S1_VitalSigns.("Time of Measurement"), condition);
    
    subplot(3,1,1);
    hold on;
    plot(i, mean(S1_VitalSigns.("Heart Rate [BPM]")(idx)), 'o');
    ylabel('Heart Rate (BPM)');
    xticks(1:length(conditions));
    xticklabels(conditions);
    grid on;
    
    subplot(3,1,2);
    hold on;
    plot(i, mean(S1_VitalSigns.("Systolic Blood Pressure [mmHg]")(idx)), 'o');
    plot(i, mean(S1_VitalSigns.("Diastolic Blood Pressure [mmHg]")(idx)), 'x');
    ylabel('Blood Pressure (mmHg)');
    xticks(1:length(conditions));
    xticklabels(conditions);
    legend('Systolic', 'Diastolic');
    grid on;
    
    subplot(3,1,3);
    hold on;
    plot(i, mean(S1_VitalSigns.("Body Temperature [° Celsius]")(idx)), 'o');
    ylabel('Body Temperature (Celsius)');
    xticks(1:length(conditions));
    xticklabels(conditions);
    grid on;
end

%% Perform statistical analyses
[results, normalityResults] = analyzeWithinSubjects(S1_BGL, S1_VitalSigns);

disp('Statistical Analysis Results:');
disp(results);

disp('Normality Test Results:');
disp(normalityResults);