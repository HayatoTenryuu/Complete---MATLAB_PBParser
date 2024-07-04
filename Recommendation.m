%% This script is used to give the user recommendations based on the tests done.

function Recommendation(bestw, bestr, fig)

    %-----------------
    % Recommendations:
    %-----------------

    % For white, recommend 2 likely ones, 1 mediocre one, and 2 unlikely ones
    likelyw = bestw(1:floor(end/3));
    middlew = bestw(floor(end/3): floor(2*end/3));
    unlikelyw = bestw(floor(2*end/3):end);

    r1 = floor((length(likelyw)).*rand(1)) + 1;
    r2 = floor((length(likelyw)).*rand(1)) + 1;
    r3 = floor((length(middlew)).*rand(1)) + 1;
    r4 = floor((length(unlikelyw)).*rand(1)) + 1;
    r5 = floor((length(unlikelyw)).*rand(1)) + 1;

    b1 = likelyw(r1);
    b2 = middlew(r2);
    b3 = middlew(r3);
    b4 = unlikelyw(r4);
    b5 = unlikelyw(r5);

    % Stopgap for equivalence if that issue arises:
    % equal = false;
    % if (r1 == r2) || (r1 == r3) || (r1 == r4) || (r1 == r5) || (r2 == r3) || (r2 == r4) || (r2 == r5) || (r3 == r4) || (r3 == r5) || (r4 == r5)
    %     equal = true;
    % end
    % 
    % while equal==true
    %     r1 = floor((length(likelyw) - 1).*rand(1));
    %     r2 = floor((length(likelyw) - 1).*rand(1));
    %     r3 = floor((length(middlew) - 1).*rand(1));
    %     r4 = floor((length(unlikelyw) - 1).*rand(1));
    %     r5 = floor((length(unlikelyw) - 1).*rand(1));
    % 
    %     if (r1 == r2) || (r1 == r3) || (r1 == r4) || (r1 == r5) || (r2 == r3) || (r2 == r4) || (r2 == r5) || (r3 == r4) || (r3 == r5) || (r4 == r5)
    %         equal = true;
    %     else
    %         equal = false;
    %     end
    % end

    msgbox("The top 10 most likely white numbers are: " +  newline + ...
        bestw(1, 1) + ", " + bestw(1, 2) + ", " + bestw(1, 3) + ", " + bestw(1, 4) + ", " + ...
        bestw(1, 5) + ", " + bestw(1, 6) + ", " + bestw(1, 7) + ", " + bestw(1, 8) + ", " + ...
        bestw(1, 9) + ", and " + bestw(1, 10), "Best white numbers");

    % Recommend the top red numbers to pick based on number of times pulled:
    likelyr = bestr(1:floor(end/3));
    middler = bestr(floor(end/3): floor(2*end/3));
    unlikelyr = bestr(floor(2*end/3):end);

    rr1 = floor((length(unlikelyr)).*rand(1)) + 1;
    rr2 = floor((length(likelyr)).*rand(1)) + 1;
    rr3 = floor((length(middler)).*rand(1)) + 1;
    rrdecider = floor((3-1).*rand(1)) + 1;

    if rrdecider == 1
        br = bestr(rr1);
    elseif rrdecider == 2
        br = bestr(rr2);
    else
        br = bestr(rr3);
    end

    msgbox("The top 5 most likely red numbers are: " + newline + ...
        bestr(1, 1) + ", " + bestr(1, 2) + ", " + bestr(1, 3) + ", " + bestr(1, 4) + ", and " + ...
        bestr(1, 5), "Best red numbers");

    msgbox("Your personal recommendation is:" + newline + ...
        b1 + ", " + b2 + ", " + b3 + ", " + b4 + ", " + b5 + ", with powerball " + br, "Recommended numbers");

    figure(1) = fig;
    

end