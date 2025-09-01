% rotate_to_equatorial fonksiyonu
function [x_rot, y_rot, z_rot] = rotate_to_equatorial(latitude, x, y, z)
x_rot = x * cosd(latitude-90) - z * sind(latitude-90);
y_rot = y;
z_rot = x * sind(latitude-90) + z * cosd(latitude-90);

end