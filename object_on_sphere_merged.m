% object_on_sphere_merged fonksiyonu
function object_on_sphere_merged(latitude,declination,hour_angle)

modified = 180 - hour_angle;

[x, y, z] = spherical_to_cartesian(declination,modified);

[x_rot, y_rot, z_rot] = rotate_to_equatorial(latitude, x, y, z);

plot3(x_rot,y_rot,z_rot,"bo",MarkerFaceColor="auto",LineWidth=2)
text(x_rot,y_rot,z_rot," δ: " + declination + ", Hour Angle: " + hour_angle)
plot_projections_merged(latitude,declination)
[a,AW] = cartesian_to_spherical(x_rot,y_rot,z_rot)
end