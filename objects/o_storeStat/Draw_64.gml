/// @description draw empty and full pills and selection

var statRatio = currentStatValue / maxStatValue;
var costLevel = 0;
for (var i = 0; i < totalPills; ++i) {
	var ratio = (i + 1) / totalPills;
	var imageIndex = 1;
	if (ratio > statRatio) {
		imageIndex = 0;
	} else {
		costLevel = i + 1;
	}
    draw_sprite(sp_shopPill, imageIndex, x + i * pillSpacing, y);
}

var maxed = costLevel == totalPills;
if (! maxed) draw_sprite(sp_shopArrow, 0, x + totalPills * pillSpacing, y);


draw_set_halign(fa_left);
draw_set_font(fnt_arial);
draw_set_color(c_dkgray);
draw_text(x + textOffsetX, y + textOffsetY, labelName);

var costX = x + totalPills * pillSpacing + costOffsetX;
if (isSelected){
	draw_set_color(c_red);
	costX += 10;
}
if (! maxed) {
	var cost = costLevel * ratePerLevel + baseCost;
	draw_text(costX, y + costOffsetY, "$" + string(cost));
} else {
	available = false;	
	draw_text(costX, y + costOffsetY, "--");
}
