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

%---------------------------------------------------------------
% First test - count the show and odds of each number and plot:
%---------------------------------------------------------------
x = [1:69];
x2 = [1:26];
y = [];
y2 = [];
z = [];
z2 = [];

goodlen = 0;

% Get rid of empty cells:
for a = 1:length(table2array(contents(:, "Date:")))
    if cell2mat(table2array(contents(a, "Date:"))) == ""
        goodlen = a-1;
        break;
    end
end

data1 = string(table2array(contents(1:goodlen, "First ball:")));
data2 = string(table2array(contents(1:goodlen, "Second ball:")));
data3 = string(table2array(contents(1:goodlen, "Third ball:")));
data4 = string(table2array(contents(1:goodlen, "Fourth ball:")));
data5 = string(table2array(contents(1:goodlen, "Fifth ball:")));
data6 = string(table2array(contents(1:goodlen, "Powerball:")));

% Give people something to look at while analysis occurs:
fprintf("The time remaining is:")

% White balls:
for b = 1:69

    count = 0;
    
    fprintf("The time remaining on white is: " + (69-b) + newline);
    
    for c = 1:goodlen
        if str2num(data1(c)) == b
            count = count + 1;
        end
        if str2num(data2(c)) == b
            count = count + 1;
        end
        if str2num(data3(c)) == b
            count = count + 1;
        end
        if str2num(data4(c)) == b
            count = count + 1;
        end
        if str2num(data5(c)) == b
            count = count + 1;
        end
    end

    y(b) = count;
    z(b) = y(b) / (5*length(data1));        % The denominator is how many white balls have been pulled.

end

% Red balls:
for b = 1:26

    count = 0;
    
    fprintf("The time remaining on red is: " + (26-b) + newline);
    
    for c = 1:goodlen
        if str2num(data6(c)) == b
            count = count + 1;
        end
    end

    y2(b) = count;
    z2(b) = y2(b) / length(data6);        % The denominator is how many red balls have been pulled.
end

% Frequency plot as a show of how many times each WHITE number has been pulled:
figure(1);
q1 = bar(x, y, FaceColor="blue", EdgeColor="black");
title("Frequency of each white number")
xlabel("Ball Numbers")
ylabel("Count")

% Odds plot as a show of how many times each WHITE number has been pulled,
% relative to the number of WHITE balls that have been pulled.
figure(2);
q2 = bar(x, z, FaceColor="blue", EdgeColor="black");
title("Odds of each white number being drawn")
xlabel("Numbers")
ylabel("Percentage of times pulled")
ylim([0 1])

% Frequency plot as a show of how many times each RED number has been pulled
figure(3);
q3 = bar(x2, y2, FaceColor="red", EdgeColor="black");
title("Frequency of each red number")
xlabel("Ball Numbers")
ylabel("Count")

% Odds plot as a show of how many times each RED number has been pulled, 
% relative to the number of RED balls that have been pulled.
figure(4);
q4 = bar(x2, z2, FaceColor="red", EdgeColor="black");
title("Odds of each red number being drawn")
xlabel("Numbers")
ylabel("Percentage of times pulled")
ylim([0 1])
