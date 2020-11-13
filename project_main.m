%% Import Data

[T, T_truth, T_combined] = import_data_project ();

%% Calculations and plots

unique_object = unique(T_truth.object);
unique_ctsl = unique(T.ctsl);
T_rollup = table();

for i = 1:length(unique_object)
    for j = 1:length(unique_ctsl)
        
        %Finding if it is correlated
        T_ctsl = T(T.ctsl == unique_ctsl(j),:);
        unique_ctsl_object = unique(T_ctsl.object);
        if strcmp(unique_ctsl_object, unique_object(i))
            correlated = {'yes'};
        else
            correlated = {'no'};
        end
    
        object = unique_object(i);
        ctsl = unique_ctsl(j);
        
        [I_x, I_y, I_z, I_vx, I_vy, I_vz] = calculations_and_plots (T, T_truth, object, ctsl);
    
        T_rollup_temp = table(object, ctsl, I_x, I_y, I_z, I_vx, I_vy, I_vz, correlated);
        T_rollup = [T_rollup; T_rollup_temp];
    end
end

%% Machine Learning

ML_correlated = trainedModel.predictFcn(T_rollup);

T_rollup_ML = T_rollup;
T_rollup_ML.ML_correlated = ML_correlated;

%% View decision tree

%view(trainedModel.ClassificationTree,'mode','graph') % graphic description







