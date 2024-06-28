%% This file organizes the data and exports excel files.

cd .\data;
a = dir;
datnum = length(a) - 3;
cd ..;

dateArray = {};
b1Array = {};
b2Array = {};
b3Array = {};
b4Array = {};
b5Array = {};
rbArray = {};

for u = 0:datnum
    
    try 

        fid = fopen("data\Powerball_Year_" + int2str(u) + ".html", "r");        % Open as read-only so you don't make the data files empty.

        %---------------------------------------------------------------
        % Insert functionality to pull this info from the HTML
        Date = bla;
        B1 = bla;
        B2 = bla;
        B3 = bla;
        B4 = bla;
        B5 = bla;
        RB = bla;
        %---------------------------------------------------------------

        dateArray = [dateArray, Date];
        b1Array = [b1Array, B1];
        b2Array = [b2Array, B2];
        b3Array = [b3Array, B3];
        b4Array = [b4Array, B4];
        b5Array = [b5Array, B5];
        rbArray = [rbArray, RB];

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
