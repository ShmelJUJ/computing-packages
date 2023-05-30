#Тор
t = 0:0.1:(2*pi + 1);
s = -pi:0.1:(pi + 1);
[T,S] = meshgrid(t,s);
R = 2;
r = 1;
X = (R + r*cos(T)).*cos(S);
Y = (R + r*cos(T)).*sin(S);
Z = r*sin(T);
surf(X,Y,Z);

