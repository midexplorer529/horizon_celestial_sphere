% spherical_to_cartesian fonksiyonu
function [x, y, z] = spherical_to_cartesian(altitude, azimuth)
    % altitude ve azimuth'un boyutlarını eşitle
    if isscalar(altitude) && ~isscalar(azimuth)
        altitude = altitude * ones(size(azimuth));
    elseif ~isscalar(altitude) && isscalar(azimuth)
        azimuth = azimuth * ones(size(altitude));
    end
    radius = 90;
    x = radius * cosd(altitude) .* cosd(azimuth);
    y = radius * cosd(altitude) .* sind(azimuth);
    z = radius * sind(altitude);
end