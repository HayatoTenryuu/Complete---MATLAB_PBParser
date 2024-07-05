%% This file takes that analysis and makes recommendations.

function d_make_recommendation(w, r, fig, num)
    
    %----------------------
    % Get a Recommendation:
    %----------------------
    
    [b1, b2, b3, b4, b5, br, b21, b22, b23, b24, b25, br2, ...
        fig1, fig2] = recommendaccion(w, r, fig);

    sortedArray1 = sort([b1, b2, b3, b4, b5]);
    sortedArray2 = sort([b21, b22, b23, b24, b25]);

    %-------------------------
    % Save the recommendation:
    %-------------------------

    locale = dir;
    last = length(locale);
    aru = false;
    
    for q = 1:last
        finder = locale(q).name;
        if finder == "Your Recommendations"
            aru = true;
        end
    end
    
    if aru == false
        mkdir("Your Recommendations");  
    end
    
        % Save Text
    fid = fopen("Your Recommendations\Numbers " + num + ".txt", "w+");
    fprintf(fid, "With the 1, 2, 2 Schema: " + string(sortedArray1(1)) + ", " + ...
        string(sortedArray1(2)) + ", " + string(sortedArray1(3)) + ", " + ...
        string(sortedArray1(4)) + ", " + string(sortedArray1(5)) + ", " + ...
        "with powerball number " + string(br));
    fprintf(fid, newline);
    fprintf(fid, "With the 1, 1, 3 Schema: " + string(sortedArray2(1)) + ", " + ...
        string(sortedArray2(2)) + ", " + string(sortedArray2(3)) + ", " + ...
        string(sortedArray2(4)) + ", " + string(sortedArray2(5)) + ", " + ...
        "with powerball number " + string(br2));
    fclose(fid);
    
        % Save Image
    filename = "Your Recommendations\Figure data version " + num + "-1.png";
    if isfile(filename)
        delete(filename);
    end
    saveas(fig1, filename);
        
    filename2 = "Your Recommendations\Figure data version " + num + "-2.png";
    if isfile(filename2)
        delete(filename2);
    end
    saveas(fig2, filename2);

    return;

end