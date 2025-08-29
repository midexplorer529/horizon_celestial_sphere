% create_sphere_equatorial fonksiyonu
function create_sphere_equatorial()
[X, Y, Z] = sphere(50);
R = 90;
X = R*X;
Y = R*Y;
Z = R*Z;

surf(X,Y,Z,EdgeColor="none",FaceColor="interp",FaceAlpha=0.3)
axis equal
colormap autumn
title("Equatorial Celestial Sphere")
zlabel("Declination (degree)")

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

polaris = [0 0 R];
antipolaris = [0 0 -R];
tpoint = [0 -R 0];
rpoint = [0 R 0];
omega = [-R 0 0];
gamma = [R 0 0];

labels = [polaris;antipolaris;tpoint;rpoint;omega;gamma];
names = ["P";"Q";"T";"R";"Ω";"γ"];
for i = 1:length(labels)
    plot_cardinals(labels(i,:), names(i));
end

end