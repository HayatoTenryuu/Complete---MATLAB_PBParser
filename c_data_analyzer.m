%% This file pulls the exported data and does some analysis.

%--------
% Setup:
%--------
clear
clc

data1 = [];
data2 = [];
data3 = [];
data4 = [];
data5 = [];
data6 = [];

%--------------------
% Import Total data:
%--------------------
fid = fopen("Powerball total data.xlsx", "r");                                  % Open as read-only so you don't make the data files empty
contents = readtable("Powerball total data.xlsx", Range = "D5:J1200", ...
    ReadVariableNames=true, VariableNamingRule="preserve");                     % Import the file's text
fclose(fid);                                                                    % Let go of the file once the data is imported

%------------------------
% Perform the First Test
%------------------------

firstTest(contents);

%------------------------
% Perform the Second Test
%------------------------