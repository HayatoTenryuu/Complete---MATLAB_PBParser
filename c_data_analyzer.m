%% This file pulls the exported data and does some analysis.

% Setup:
clear
clc

data1 = [];
data2 = [];
data3 = [];
data4 = [];
data5 = [];

% Total data:
fid = fopen("Powerball total data.xlsx", "r");                                  % Open as read-only so you don't make the data files empty
contents = readtable("Powerball total data.xlsx", Range = "D5:J1200", ...
    ReadVariableNames=true, VariableNamingRule="preserve");                     % Import the file's text
fclose(fid);                                                                    % Let go of the file once the data is imported

% First test - count the appearance of each number and plot:
x = [1:69];
y = [];

goodlen = 0;

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

for b = 1:69

    count = 0;
    
    for c = 1:goodlen
        if str2num(cell2mat(table2array(contents(str2num(data1(c)), "First ball:")))) == b
            count = count + 1;
        end
        if str2num(cell2mat(table2array(contents(str2num(data2(c)), "Second ball:")))) == b
            count = count + 1;
        end
        if str2num(cell2mat(table2array(contents(str2num(data3(c)), "Third ball:")))) == b
            count = count + 1;
        end
        if str2num(cell2mat(table2array(contents(str2num(data4(c)), "Fourth ball:")))) == b
            count = count + 1;
        end
        if str2num(cell2mat(table2array(contents(str2num(data5(c)), "Fifth ball:")))) == b
            count = count + 1;
        end
    end

    y(b) = count;

end

bar(x, y)

