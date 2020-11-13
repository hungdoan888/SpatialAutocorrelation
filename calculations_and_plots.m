function [MoransI_x, MoransI_y, MoransI_z, MoransI_vx, MoransI_vy, MoransI_vz] ...
    = calculations_and_plots (T, T_truth, object, ctsl)
%% Define tracks to analyze

T_object = T_truth(strcmp(T_truth.object, object),:);
T_ctsl = T(T.ctsl == ctsl,:);

%% Ensuring unique time values

[~, unique_time_index_object, ~] = unique(T_object.time, 'first');
[~, unique_time_index_ctsl, ~] = unique(T_ctsl.time, 'first');

T_object = T_object(unique_time_index_object, :);
T_ctsl = T_ctsl(unique_time_index_ctsl, :);

%% Interpolate tracks

% object
min_time_T_object = min(T_object.time);
max_time_T_object = max(T_object.time);

% ctsl
min_time_T_ctsl = min(T_ctsl.time);
max_time_T_ctsl = max(T_ctsl.time);

% Interpolate
interp_time = max(min_time_T_object, min_time_T_ctsl): min(max_time_T_object, max_time_T_ctsl);
interp_time = interp_time';

%% x Interpolation

figure(1)
interp_x_object = interp1(T_object.time, T_object.x, interp_time);
plot(T_object.time, T_object.x, 'o', interp_time, interp_x_object, ':.')

hold on;

interp_x_ctsl = interp1(T_ctsl.time, T_ctsl.x, interp_time);

plot(T_ctsl.time, T_ctsl.x, 'o', interp_time, interp_x_ctsl, ':.')

legend('Truth', 'Interp Truth', 'Radar', 'Interp Radar')
xlabel('Time (sec)')
ylabel('x (m)')
title('X-Time Plot')


% Calculating Moran's I
MoransI_x = morans_i (interp_x_object, interp_x_ctsl);

annotation('textbox', 'String', ['I = ' char(string(MoransI_x))],...
           'Position',[0.15 0.85 0.2 0.06])
           
fprintf('MoransI_x = %0.5g \n', MoransI_x)

%% y Interpolation

figure(2)
interp_y_object = interp1(T_object.time, T_object.y, interp_time);
plot(T_object.time, T_object.y, 'o', interp_time, interp_y_object, ':.')

hold on;

interp_y_ctsl = interp1(T_ctsl.time, T_ctsl.y, interp_time);
plot(T_ctsl.time, T_ctsl.y, 'o', interp_time, interp_y_ctsl, ':.')

legend('Truth', 'Interp Truth', 'Radar', 'Interp Radar')
xlabel('Time (sec)')
ylabel('y (m)')
title('y-Time Plot')

% Calculating Moran's I
MoransI_y = morans_i (interp_y_object, interp_y_ctsl);

annotation('textbox', 'String', ['I = ' char(string(MoransI_y))], ...
           'Position',[0.15 0.85 0.2 0.06])
           
fprintf('MoransI_y = %0.5g \n', MoransI_y)

%% z Interpolation

figure(3)
interp_z_object = interp1(T_object.time, T_object.z, interp_time);
plot(T_object.time, T_object.z, 'o', interp_time, interp_z_object, ':.')

hold on;

interp_z_ctsl = interp1(T_ctsl.time, T_ctsl.z, interp_time);
plot(T_ctsl.time, T_ctsl.z, 'o', interp_time, interp_z_ctsl, ':.')

legend('Truth', 'Interp Truth', 'Radar', 'Interp Radar')
xlabel('Time (sec)')
ylabel('z (m)')
title('z-Time Plot')

% Calculating Moran's I
MoransI_z = morans_i (interp_z_object, interp_z_ctsl);

annotation('textbox', 'String', ['I = ' char(string(MoransI_z))],...
           'Position',[0.15 0.85 0.2 0.06])
       
fprintf('MoransI_z = %0.5g \n', MoransI_z)

%% vx Interpolation

figure(4)
interp_vx_object = interp1(T_object.time, T_object.vx, interp_time);
plot(T_object.time, T_object.vx, 'o', interp_time, interp_vx_object, ':.')

hold on;

interp_vx_ctsl = interp1(T_ctsl.time, T_ctsl.vx, interp_time);
plot(T_ctsl.time, T_ctsl.vx, 'o', interp_time, interp_vx_ctsl, ':.')

legend('Truth', 'Interp Truth', 'Radar', 'Interp Radar')
xlabel('Time (sec)')
ylabel('vx (m)')
title('vx-Time Plot')

% Calculating Moran's I
MoransI_vx = morans_i (interp_vx_object, interp_vx_ctsl);

annotation('textbox', 'String', ['I = ' char(string(MoransI_vx))],...
           'Position',[0.15 0.85 0.2 0.06])
       
fprintf('MoransI_vx = %0.5g \n', MoransI_vx)

%% vy Interpolation

figure(5)
interp_vy_object = interp1(T_object.time, T_object.vy, interp_time);
plot(T_object.time, T_object.vy, 'o', interp_time, interp_vy_object, ':.')

hold on;

interp_vy_ctsl = interp1(T_ctsl.time, T_ctsl.vy, interp_time);
plot(T_ctsl.time, T_ctsl.vy, 'o', interp_time, interp_vy_ctsl, ':.')

legend('Truth', 'Interp Truth', 'Radar', 'Interp Radar')
xlabel('Time (sec)')
ylabel('vy (m)')
title('vy-Time Plot')

% Calculating Moran's I
MoransI_vy = morans_i (interp_vy_object, interp_vy_ctsl);

annotation('textbox', 'String', ['I = ' char(string(MoransI_vy))],...
           'Position',[0.15 0.85 0.2 0.06])

fprintf('MoransI_vy = %0.5g \n', MoransI_vy)

%% vz Interpolation

figure(6)
interp_vz_object = interp1(T_object.time, T_object.vz, interp_time);
plot(T_object.time, T_object.vz, 'o', interp_time, interp_vz_object, ':.')

hold on;

interp_vz_ctsl = interp1(T_ctsl.time, T_ctsl.vz, interp_time);
plot(T_ctsl.time, T_ctsl.vz, 'o', interp_time, interp_vz_ctsl, ':.')

legend('Truth', 'Interp Truth', 'Radar', 'Interp Radar')
xlabel('Time (sec)')
ylabel('vz (m)')
title('vz-Time Plot')

% Calculating Moran's I
MoransI_vz = morans_i (interp_vz_object, interp_vz_ctsl);

%annotation('textbox', 'String', ['I = ' char(string(MoransI_vz))],...
           %'Position',[0.15 0.85 0.2 0.06])
       
fprintf('MoransI_vz = %0.5g \n', MoransI_vz)

