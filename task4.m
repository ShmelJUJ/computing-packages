t = -50:0.1:50;
r = 1;
x = r*cos(t);
y = r*sin(t);
hold on
g1 = plot(x,y);
g2 = plot(x,y);
g3 = plot(x,y);
g4 = plot(x,y);
g5 = plot(x,y);
axis([-2 25 -2 5]);
axis equal;
set(g2, 'XData', x + 2*r);
set(g3, 'XData', x + 4*r);
set(g4, 'XData', x + 6*r);
set(g5, 'XData', x + 8*r);
while (true)
  for i = 1:15
    set(g1, 'XData', x + i, 'YData', y + sin(i + 4));
    set(g2, 'XData', x + 2*r + i, 'YData', y  + sin(i + 3));
    set(g3, 'XData', x + 4*r + i, 'YData', y  + sin(i + 2));
    set(g4, 'XData', x + 6*r + i, 'YData', y  + sin(i + 1));
    set(g5, 'XData', x + 8*r + i, 'YData', y  + sin(i));
    pause(0.1);
    drawnow;
  endfor
  for i = 15:-1:1
    set(g5, 'XData', x + i, 'YData', y + sin(i + 4));
    set(g4, 'XData', x + 2*r + i, 'YData', y + sin(i + 3));
    set(g3, 'XData', x + 4*r + i, 'YData', y + sin(i + 2));
    set(g2, 'XData', x + 6*r + i, 'YData', y + sin(i + 1));
    set(g1, 'XData', x + 8*r + i, 'YData', y + sin(i));
    pause(0.1);
    drawnow;
  endfor
end
