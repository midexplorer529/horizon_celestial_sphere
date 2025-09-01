% plot_projections_merged fonksiyonu
function plot_projections_merged(latitude,declination)

radius = 90;
theta = linspace(0,2*pi,200);
zval = radius*sind(declination);
r = radius*cosd(declination);
x = r*cos(theta);
y = r*sin(theta);
z = zval * ones(size(theta));

[x_rot, y_rot, z_rot] = rotate_to_equatorial(latitude,x,y,z);

hold on
plot3(x_rot, y_rot, z_rot,Color=[169/255 169/255 169/255],LineWidth=0.01);

end