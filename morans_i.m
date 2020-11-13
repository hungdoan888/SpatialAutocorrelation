function I = morans_i (yi, yj)
%% Calculate Moran's I

y = [yi;yj];                        % place truth and ctsl in one vector

w1 = zeros(length(yi), length(yi)); % quadrant 1 of weights
w2 = eye(length(yi));               % quadrant 2 of weights
w3 = eye(length(yi));               % quadrant 3 of weights
w4 = zeros(length(yi), length(yi)); % quadrant 4 of weights
w = [w1 w2; w3 w4];

N = length(y);                      %Number of samples
ybar = mean(y);                     % mean of all data points (truth and radar)

%Moran's I Statistic
I = N / sum(sum(w)) * (sum(sum(w .* ((y - ybar) * (y - ybar)')))/sum((y-ybar).^2));

end