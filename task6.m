function gensnake = snakegenerate(n)
  %Урок 4. Задание 4%
  gensnake = zeros(n,n);
  idx = 0;
  x = 0;
  y = 2;
  while (idx < n*n)
    while (y > 1 && x < n)
      y = y - 1;
      x = x + 1;
      idx = idx + 1;
      gensnake(y,x) = idx;
    endwhile
    if (y == 0 && x < n)
      x = x+1;
    else
      y = y+1;
    endif
    idx = idx + 1;
    gensnake(y,x) = idx;
  endwhile
  if (idx != n*n)
    while (y < n && x > 1)
      y = y + 1;
      x = x - 1;
      idx = idx + 1;
    endwhile
    if (x == 0 && y < n)
      y = y+1;
    else
      x = x+1;
    endif
    idx = idx + 1;
    gensnake(y,x) = idx;
  endif
end
