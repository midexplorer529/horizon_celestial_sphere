function create_sphere_merged(latitude)
[X, Y, Z] = sphere(50);
R = 90;
X = R*X;
Y = R*Y;
Z = R*Z;

surf(X,Y,Z,EdgeColor="none",FaceColor="interp",FaceAlpha=0.3)
axis equal
colormap autumn
zlabel("Altitude (degree)")

theta = linspace(0,2*pi,200);


zval_horizon = R*sind(0);
r_horizon = R*cosd(0);
x_horizon = r_horizon*cos(theta);
y_horizon = r_horizon*sin(theta);
z_horizon = zval_horizon * ones(size(theta));

hold on
plot3(x_horizon,y_horizon,z_horizon,Color=[169/255 169/255 169/255],LineWidth=0.01)

zval_ekvator = 0;
r_ekvator = R;
x_ekvator = r_ekvator * cos(theta);
y_ekvator = r_ekvator * sin(theta);
z_ekvator = zval_ekvator * ones(size(theta));

x_ekvator_rot = x_ekvator * cosd(latitude-90) - z_ekvator * sind(latitude-90);
z_ekvator_rot = x_ekvator * sind(latitude-90) + z_ekvator * cosd(latitude-90);
y_ekvator_rot = y_ekvator;

plot3(x_ekvator_rot, y_ekvator_rot, z_ekvator_rot,Color=[169/255 169/255 169/255],LineWidth=0.01);

% GÖK KUTUPLARI (DOĞRU KONUM)
% Kuzey Gök Kutbu (P) - Z ekseninde enlem kadar yukarıda
alt_p = latitude;  % ENLEM kadar yukarıda
az_p = 0;          % KUZEY yönünde

% Küresel → Kartezyen dönüşüm (UFUKSAL koordinatlarda)
[x_p, y_p, z_p] = spherical_to_cartesian(alt_p,az_p);
 


plot3(x_p, y_p, z_p, "ro", MarkerFaceColor="r");
text(x_p, y_p, z_p, "P", "FontSize",15,"Color",[71/255 233/255 1/255]);

% Güney Gök Kutbu (Q) - Z ekseninde enlem kadar aşağıda
alt_q = -latitude;  % ENLEM kadar aşağıda
az_q = 180;         % GÜNEY yönünde

[x_q,y_q,z_q] = spherical_to_cartesian(alt_q,az_q);

plot3(x_q, y_q, z_q, "ro", MarkerFaceColor="r");
text(x_q, y_q, z_q, " Q", "FontSize",15,"Color",[71/255 233/255 1/255]);


alt_ticks = -90:30:90;
z_ticks = 90 * sind(alt_ticks);
set(gca, 'ZTick', z_ticks, 'ZTickLabel', alt_ticks);
set(gca, 'XTick', [], 'YTick', []);
xlabel("X")
ylabel("Y")

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