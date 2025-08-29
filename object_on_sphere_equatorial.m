% object_on_sphere_equatorial fonksiyonu
function object_on_sphere_equatorial(declination,right_ascension)
[x, y, z] = spherical_to_cartesian(declination,right_ascension);
plot3(x,y,z,"bo",MarkerFaceColor="auto",LineWidth=2)
text(x,y,z," δ: " + declination + " α: " + right_ascension)
plot_projections_horizon(declination,right_ascension)
end