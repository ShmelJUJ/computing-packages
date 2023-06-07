function res = diagsn(r, c)

    res = zeros(r, c, 'uint32');

    num = 1;
    cur_r = 1;
    cur_c = 1;
    dir = -1;

    while num <= r * c
        res(cur_r, cur_c) = num;

        if dir == -1
            if cur_r == r
                cur_c = c + 1;
                dir = 1;
            elseif cur_c == 1
                cur_r = cur_r + 1;
                dir = 1;
            else
                cur_r = cur_r + 1;
                cur_c = cur_c - 1;
            end
        else
            if cur_c == c
                cur_r = cur_r + 1;
                dir = -1;
            elseif cur_r == 1
                cur_c = cur_c + 1;
                dir = -1;
            else
                cur_r = cur_r - 1;
                cur_c = cur_c + 1;
            end
        end
        num = num + 1;
    end

end
