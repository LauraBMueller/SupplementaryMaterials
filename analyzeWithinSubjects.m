function [results, normalityResults] = analyzeWithinSubjects(BGLData, VitalSignsData)
    % Analyzes the data within subjects, checking for normality and performing appropriate statistical tests

    results = struct();
    normalityResults = struct();

    % Extract variables
    BGL = BGLData.("BGL [mg/dl]");
    HeartRate = VitalSignsData.("Heart Rate [BPM]");
    SystolicBP = VitalSignsData.("Systolic Blood Pressure [mmHg]");
    DiastolicBP = VitalSignsData.("Diastolic Blood Pressure [mmHg]");
    BodyTemperature = VitalSignsData.("Body Temperature [° Celsius]");
    Conditions = categorical(VitalSignsData.("Time of Measurement"));

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