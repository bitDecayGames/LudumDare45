/// @description draw money text


draw_set_font(fnt_arial);
draw_set_color(c_green);
draw_text(x + textOffsetX, y + textOffsetY, string(floor(money)));
