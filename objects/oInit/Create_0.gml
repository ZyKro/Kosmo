//resize window and init. global variables
wsize = window_get_width();
hsize = window_get_height();

var _mult = 2;

window_set_size(wsize*_mult, hsize*_mult);
window_center();
if (room == rInit) room_goto(rTest);