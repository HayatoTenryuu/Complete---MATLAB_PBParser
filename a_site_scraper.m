%% This file pulls the data from the web.

function a_site_scraper();

    % Setup:
    clear
    clc
    
    er = 0;
    
    % Get the data:
    for u = 0:35        % This represents 36 years of Powerball data, should return errors. If not, increase year count.
        
        try
    
            % Pull each year's data from powerball website
            site = "https://www.powerball.net/archive/" + int2str(u + 1992);   % The first year of powerball was 1992 
            stroo = webread(site);
            
            % Save that year's data as an HTML file.
            locale = dir;
            last = length(locale);
            aru = false;
        
            for q = 1:last
                finder = locale(q).name;
                if finder == "data"
                    aru = true;
                end
            end
    
            if aru == false
                mkdir data;         
            end
    
            nama = "Powerball_Year_" + int2str(u) + ".html";
            fid = fopen("data\" + nama, "w+");
            nbytes = fprintf(fid, stroo);
            fclose(fid);
    
        catch exception
            
            % Intentionally produce an error message as proof that we are
            % grabbing all of the data. If there are more errors than expected,
            % we have an actual problem.
            er = er + 1;
            fprintf("this is error number " + er + newline);
    
        end
    
        
    end

    return;
end