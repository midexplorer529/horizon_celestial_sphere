% plot_projections_horizon fonksiyonu
function plot_projections_horizon(altitude,azimuth)

alt_projection = linspace(0,altitude,50);
[alt_projection_x,alt_projection_y,alt_projection_z] = spherical_to_cartesian(alt_projection,azimuth);
az_projection = linspace(0,azimuth,50);
[az_projection_x,az_projection_y,az_projection_z] = spherical_to_cartesian(0,az_projection);
plot3(alt_projection_x,alt_projection_y,alt_projection_z,"g-",LineWidth=3)
plot3(az_projection_x,az_projection_y,az_projection_z,"b-",LineWidth=3)

radius = 90;
theta = linspace(0,2*pi,200);
zval = radius*sind(altitude);
r = radius*cosd(altitude);
x = r*cos(theta);
y = r*sin(theta);
z = zval * ones(size(theta));

hold on
plot3(x,y,z,Color=[169/255 169/255 169/255],LineWidth=0.01)
end