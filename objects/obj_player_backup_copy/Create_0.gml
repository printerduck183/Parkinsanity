
// move control variables
move =
{
    accel: 180,  // add speed from 0 to X in a second
	fric: 120,  // friction: decrease speed from X to 0 in a second
	brake: 260,  // brake: decrease spped from X to 0 in a second
	max_speed: 300,  // pixels in one second
	cur_speed: 0,  // current speed
	yaw_dir: 0, // 1: turn left. -1: turn right
	yaw_deg: 0,  // current yaw degree
	yaw_max_deg: 90,  // maximum yaw degree
	yaw_accel: 250,  // add/decrease yaw degree between 0 to X in a second
};

instance_create_layer(x, y, "road_objects", obj_player_location);

//////////////////////////////////////////////////////////////

function Crash(other_object)
{
	// play effect
	var cx = (other_object.x + x) * 0.5;
	var cy = (other_object.y + y) * 0.5;
	var crash = instance_create_depth(cx, cy, depth - 1, obj_crash);
	//var crash = instance_create_layer(cx, cy, "player", obj_crash);
	//crash.depth = depth - 1;
	
	// play sound
	audio_play_sound(snd_crash, 1, false);
}




