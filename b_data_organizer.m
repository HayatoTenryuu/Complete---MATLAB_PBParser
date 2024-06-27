cd .\data;
a = dir;
datnum = length(a) - 3;
cd ..;

for u = 0:datnum
    
    try 

        fid = fopen("data\Powerball_Year_" + int2str(u) + ".html", "r");

        fclose(fid);
        
    catch err

        fprintf("We have an error..." + newline);

    end

end

