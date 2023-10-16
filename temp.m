% Sample data for demonstration
x = 1:10;
y = rand(1, 10);

% Create the plot or stem plot
% Example 1: Plot
% plot(x, y);

% Example 2: Stem plot
stem(x, y);
hold on
% Adjust the y-axis limits by 5%
currentYLim = ylim; % Get the current y-axis limits
yRange = currentYLim(2) - currentYLim(1); % Calculate the range of the y-axis
percentageIncrease = 0.05; % 5% increase

% Calculate new y-axis limits
newYLim(1) = currentYLim(1) - (percentageIncrease * yRange);
newYLim(2) = currentYLim(2) + (percentageIncrease * yRange);

% Set the new y-axis limits
ylim(newYLim);

% Optional: Add labels and title
xlabel('X-axis');
ylabel('Y-axis');
title('Plot with Adjusted Y-axis Scale');
