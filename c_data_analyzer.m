%% This file pulls the exported data and does some analysis.

% Setup:
clear
clc

data = [];

% Total data:
fid = fopen("Powerball total data.xlsx", "r");                                                    % Open as read-only so you don't make the data files empty
contents = readtable("Powerball total data.xlsx", Range = "D5:J1200", ReadVariableNames=true, VariableNamingRule="preserve");    % Import the file's text

% Convert to numbers
[a, b] = size(contents);

for c = 1:a
    if length(cell2mat(table2array(contents(c, "Date:")))) ~= 0
        data = [data; cell2mat(table2array(contents(c, "Date:")))];
    end
end