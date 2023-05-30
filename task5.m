function genmatr = matgenerate(n,m)
  %Урок 3. Задание 1%
  genmatr = false(n,m);
  genmatr(1:2:n, 2:2:m) = true;
  genmatr(2:2:n, 1:2:m) = true;
end
