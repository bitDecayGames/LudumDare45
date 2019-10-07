/// @description not actually a create event!!!
// don't do anything in here, it should all happen in User Event 0, 
// and what ever instantiates this object needs to call event_user(0)


// ignore this stuff (shaders, amiright!?)
// excuuuuuse me!!

shader = shd_colorMask;
u_red_tint = shader_get_uniform(shader, "red_tint");
u_green_tint = shader_get_uniform(shader, "green_tint");
u_blue_tint = shader_get_uniform(shader, "blue_tint");
u_uptime = shader_get_uniform(shader, "uptime");