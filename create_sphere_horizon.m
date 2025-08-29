% create_sphere_horizon fonksiyonu
function create_sphere_horizon()
[X, Y, Z] = sphere(50);
R = 90;
X = R*X;
Y = R*Y;
Z = R*Z;

surf(X,Y,Z,EdgeColor="none",FaceColor="interp",FaceAlpha=0.3)
axis equal
colormap autumn
title("Horizon Celestial Sphere")
zlabel("Altitude (degree)")

theta = linspace(0,2*pi,200);


zval = R*sind(0);
r = R*cosd(0);
x = r*cos(theta);
y = r*sin(theta);
z = zval * ones(size(theta));

hold on
plot3(x,y,z,Color=[169/255 169/255 169/255],LineWidth=0.01)

alt_ticks = -90:30:90;
z_ticks = 90 * sind(alt_ticks);
set(gca, 'ZTick', z_ticks, 'ZTickLabel', alt_ticks);
set(gca, 'XTick', [], 'YTick', []);

axis([-100 100 -100 100 -100 100])

zenith = [0 0 R];
nadir = [0 0 -R];
north = [R 0 0];
south = [-R 0 0];
east = [0 -R 0];
west = [0 R 0];

labels = [zenith;nadir;north;south;east;west];
names = ["Z";"Z'";"N";"S";"E";"W"];
for i = 1:length(labels)
    plot_cardinals(labels(i,:), names(i));
end

end