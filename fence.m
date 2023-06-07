function m = fence(rows, cols)
    m = false(rows, cols);
    m(:, 1:2:end) = true;
end
