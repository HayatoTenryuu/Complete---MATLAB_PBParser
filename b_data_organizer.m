%% This file organizes the data and exports excel files.

% Setup
cd .\data;
a = dir;
datnum = length(a) - 3;
cd ..;

% Initialize arrays
dateArray = {};
b1Array = {};
b2Array = {};
b3Array = {};
b4Array = {};
b5Array = {};
rbArray = {};

for u = 0:datnum
    
    try 

        fid = fopen("data\Powerball_Year_" + int2str(u) + ".html", "r");        % Open as read-only so you don't make the data files empty
        contents = fileread("data\Powerball_Year_" + int2str(u) + ".html");     % Import the file's text
        
        search_line_a = '<a class="archive-box" href="/numbers/';               % Date keyword search
        search_line_b = '<div class="ball">';                                   % White Ball keyword search
        search_line_c = '<div class="powerball">';                              % Red Ball keyword search

        date_points = strfind(contents, search_line_a);                         % Find the location/index of each date
        wb_points = strfind(contents, search_line_b);                           % Find the location/index of each white ball number
        rb_points = strfind(contents, search_line_c);                           % Find the location/index of each red ball number

        % Find values of each variable and assign it to arrays
        for v = date_points(1):length(date_points)
       
            dateArray = [dateArray, contents(v+length(search_line_a)):contents(v+length(search_line_a)+10)];
            b1Array = [b1Array, bla];
            b2Array = [b2Array, bla];
            b3Array = [b3Array, bla];
            b4Array = [b4Array, bla];
            b5Array = [b5Array, bla];
            rbArray = [rbArray, bla];

        end
        
        fclose(fid);
        
    catch err

        fprintf("We have an error..." + newline);

    end

    % Table for each file (yearly)
    data = table(dateArray, b1Array, b2Array, b3Array, b4Array, b5Array, rbArray);

    % Output to Excel File
    filename = "Powerball " + int2str(u + 1996) + " data.xlsx";
    writetable(data,filename,'Sheet',1,'Range','D4');

end

% Table for all files (overall)
data2 = table(dateArray, b1Array, b2Array, b3Array, b4Array, b5Array, rbArray);

% Output to Excel File
filename = "Powerball total data.xlsx";
writetable(data2, filename,'Sheet',1,'Range','D4');
