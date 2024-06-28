er = 0;
for u = 0:35        % This represents 36 years of Powerball data, should return errors. If not, increase year count.
    try
        name = "Powerball_Year_" + int2str(u) + ".html";
        site = "https://www.powerball.net/archive/" + int2str(u+1992);
        stroo = webread(site);
        locale = dir;
        last = size(locale);
        finder = locale(last).name;

        if finder ~= "data"
            mkdir data          
        end
        
        fid = fopen("data\" + name, "w+");
        nbytes = fprintf(fid, stroo);
        fclose(fid);

    catch exception
        er = er + 1;
        fprintf("this is error number " + er + newline);
    end
end