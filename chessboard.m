function res = checkerboard(r,c)
  res = false(r, c);
  res(1:2:r, 1:2:c) = true;
  res(2:2:r, 2:2:c) = true;
end

