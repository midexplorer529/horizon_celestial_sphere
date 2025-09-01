% cartesian_to_spherical fonksiyonu
function [altitude, azimuth] = cartesian_to_spherical(x, y, z)
% Kartezyen koordinatları küresel koordinatlara dönüştürür
%
% Girdi: x, y, z koordinatları
% Çıktı: altitude (yükseklik), azimuth (azimut)

% Yarıçapı hesapla (90 olmalı, ama kontrol için)
radius = sqrt(x.^2 + y.^2 + z.^2);

% Yüksekliği (altitude) hesapla [-90°, 90°]
altitude = asind(z ./ radius);

% Azimutu hesapla [0°, 360°]
azimuth = atan2d(y, x);
azimuth = mod(azimuth, 360); % 0-360 aralığına getir

% Skalar girdi için skalar çıktı
if isscalar(x) && isscalar(y) && isscalar(z)
    altitude = altitude(1);
    azimuth = azimuth(1);
end
end