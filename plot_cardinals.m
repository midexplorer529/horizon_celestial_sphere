% plot_cardinals fonksiyonu
function plot_cardinals(cardinal,name)
plot3(cardinal(1),cardinal(2),cardinal(3),"ro",MarkerFaceColor="r")
text(cardinal(1),cardinal(2),cardinal(3),name,"FontSize",15,"Color",[71/255 233/255 1/255])
end