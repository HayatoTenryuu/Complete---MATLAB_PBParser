%% This file pulls the exported data and does some analysis.

function [w, r, fig] = c_data_analyzer()

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
    fid = fopen("excel\Powerball total data.xlsx", "r");                                  % Open as read-only so you don't make the data files empty
    contents = readtable("excel\Powerball total data.xlsx", Range = "D5:J1200", ...
        ReadVariableNames=true, VariableNamingRule="preserve");                     % Import the file's text
    fclose(fid);                                                                    % Let go of the file once the data is imported
    
    %-------------------------
    % Perform the First Test:
    %-------------------------
    
    [w, r, fig] = unoTest(contents);
    
    %-------------------------
    % Perform the Second Test:
    %-------------------------

    
    %-------------------------
    %   Output data to file:
    %-------------------------
    
    locale = dir;
    last = length(locale);
    aru = false;
    
    for q = 1:last
        finder = locale(q).name;
        if finder == "figure"
            aru = true;
        end
    end
    
    if aru == false
        mkdir figure;   
    end
    
        % Save Text
    fid = fopen("figure\Powerball stats.csv", "w+");
    fprintf(fid, mat2str(w));
    fprintf(fid, newline);
    fprintf(fid, mat2str(r));
    fclose(fid);
    
        % Save Image
    filename = "figure\Powerball figure data.png";
    if isfile(filename)
        delete(filename);
    end
    saveas(fig, filename);
    fig.Visible = "off";

    return;
end
