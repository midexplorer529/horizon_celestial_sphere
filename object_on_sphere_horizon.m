% object_on_sphere fonksiyonu
function object_on_sphere_horizon(altitude,azimuth)
[x, y, z] = spherical_to_cartesian(altitude,azimuth);
plot3(x,y,z,"bo",MarkerFaceColor="auto",LineWidth=2)
text(x,y,z," a: " + altitude + " AW: " + azimuth)
plot_projections_horizon(altitude,azimuth)
end