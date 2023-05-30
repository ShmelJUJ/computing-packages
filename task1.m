function gencirc = circgenerate(n,r)
  %Урок 3-4. Задание 3%
  gencirc = false(n,n);
  if (mod(n,2) == 1)
    k = round(n / 2);
    for i = 1:n
      for j = 1:n
        if ((k - i)^2) + ((k - j)^2) <= (r*r)
          gencirc(i, j) = true;
        endif
      endfor
    endfor
  endif
  if (mod(n,2) == 0)
    k = round(n / 2);
    for i = 1:n
      for j = 1:n
        if ((k - i)^2 - 0.5) + ((k - j)^2 - 0.5) <= (r*r)
          gencirc(i, j) = true;
        endif
      endfor
    endfor
  endif
end
