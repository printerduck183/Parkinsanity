
event_inherited();

// move control variables
move =
{
    accel: 180,  // add speed from 0 to X in a second
	fric: 120,  // friction: decrease speed from X to 0 in a second
	brake: 300,  // brake: decrease spped from X to 0 in a second
	max_speed: 300,  // pixels in one second
	cur_speed: 0,  // current speed
	yaw_dir: 0, // 1: turn left. -1: turn right
	yaw_deg: 0,  // current yaw degree
	yaw_max_deg: 90,  // maximum yaw degree
	yaw_accel: 225,  // add/decrease yaw degree between 0 to X in a second
};

// show position fx
_fx_showpos = instance_create_depth(x, y, depth - 1, obj_player_location);

//////////////////////////////////////////////////////////////

function Crash(other_object)
{
	if (freeze)
		return;
	
	move.cur_speed = 0;
	speed = 0;
	alarm_set(0, 60);
	freeze = true;

	// calculate a proper position to place hit effect
	var dist = point_distance(x, y, other_object.x, other_object.y);
	var cx, cy;
	if (dist > 150)
	{
		var dir = point_direction(x, y, other_object.x, other_object.y);
		cx = x + lengthdir_x(70, dir);
		cy = y + lengthdir_y(70, dir);
	}
	else
	{
		cx = (other_object.x + x) * 0.5;
		cy = (other_object.y + y) * 0.5;
	}
	// play effect
	var crash = instance_create_depth(cx, cy, -10, obj_crash);
	
	// play sound
	audio_play_sound(snd_crash, 1, false);
}

function TryToSwitchGear()
{
	if (move.cur_speed < 4)
	{
		if (gear < 0)
		{
			gear = 1;
		}
		else
		{
			gear = -1;
		}

		var switch_gear = instance_create_depth(x-32, y-140, -10, obj_switch_gear);
		switch_gear.image_index = gear > 0 ? 0 : 1;
	
		audio_play_sound(snd_gear, 1, false);
	}
}