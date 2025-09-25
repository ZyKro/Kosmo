// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_input(){
    //set input to keyboard, will add a statement for controller input later on
    left = keyboard_check(vk_left);
    right = keyboard_check(vk_right);
    up = keyboard_check(vk_up);
    down = keyboard_check(vk_down);
    attack_key = mouse_check_button_pressed(1);
    run_key = keyboard_check(vk_shift);
 
}