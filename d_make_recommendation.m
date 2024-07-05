%% This file takes that analysis and makes recommendations.

function d_make_recommendation(w, r, fig, num)
    
    %----------------------
    % Get a Recommendation:
    %----------------------
    
    [b1, b2, b3, b4, b5, br, b21, b22, b23, b24, b25, br2, ...
        fig1, fig2] = recommendaccion(w, r, fig);

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
    fprintf(fid, "With the 1, 2, 2 Schema: " + string(b1) + ", " + ...
        string(b2) + ", " + string(b3) + ", " + string(b4) + ", " + ...
        string(b5) + ", " + string(br));
    fprintf(fid, newline);
    fprintf(fid, "With the 1, 1, 3 Schema: " + string(b21) + ", " + ...
        string(b22) + ", " + string(b23) + ", " + string(b24) + ", " + ...
        string(b25) + ", " + string(br2));
    fclose(fid);
    
        % Save Image
    filename = "Your Recommendations\Figure data version " + num + "1.png";
    if isfile(filename)
        delete(filename);
    end
    saveas(fig1, filename);
        
    filename2 = "Your Recommendations\Figure data version " + num + "2.png";
    if isfile(filename2)
        delete(filename2);
    end
    saveas(fig2, filename2);

    return;

end