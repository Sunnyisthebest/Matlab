function problem2()

x=[0,2,4,2,5,6];
y=[5,15,20,0,10,15];
voronoi(x,y);
hold on;
xr=[0,2,4];
yr=[5,15,20];
plot(xr,yr,'.r');

hold on;
xb=[2,5,6];
yb=[0,10,15];
plot(xb,yb,'.b');

end

