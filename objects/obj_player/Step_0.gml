

MoveControl();
LevelEndCheck();

//////////////////////////////////////////////////////////

function MoveControl()
{
	var ts = obj_gameplay.StepTime();  // delta time in seconds
	var cur_dir = image_angle;
	var key_pressed = false;

	if (!freeze)
	{
		// calculate speed
		if (keyboard_check(ord("W")) || keyboard_check(vk_up))
		{
			move.cur_speed += move.accel * ts;
			move.cur_speed = min(move.cur_speed, move.max_speed);
			key_pressed = true;
		}
		else if (keyboard_check(ord("S")) || keyboard_check(vk_down))
		{
			// brake pressed
			move.cur_speed -= move.brake * ts;
			move.cur_speed = max(move.cur_speed, 0);
			key_pressed = true;
		}
		else
		{
			// calculate friction
			move.cur_speed -= move.fric * ts;
			move.cur_speed = max(move.cur_speed, 0);
		}

		// calculate yaw degree
		move.yaw_dir = 0;
		if (keyboard_check(ord("A")) || keyboard_check(vk_left))
		{
			move.yaw_dir = 1;
			key_pressed = true;
		}
		else if (keyboard_check(ord("D")) || keyboard_check(vk_right))
		{
			move.yaw_dir = -1;
			key_pressed = true;
		}

		// limit max yaw degree according to car speed
		var factor = (move.cur_speed - 0) / 70;
		factor = clamp(factor/* * factor*/, 0, 1);
		var max_yaw_deg = move.yaw_max_deg * factor;
		
		if (move.yaw_dir != 0)
		{
			var yaw_delta = move.yaw_accel * ts * move.yaw_dir;
			move.yaw_deg += yaw_delta;
			move.yaw_deg = clamp(move.yaw_deg, -max_yaw_deg, max_yaw_deg);
		}
		else if (move.yaw_deg != 0)
		{
			// wheel-steer auto back
			var yaw_delta =  move.yaw_accel * ts;
			
			if (move.yaw_deg > 0)
			{
				move.yaw_deg -= yaw_delta;
				move.yaw_deg = clamp(move.yaw_deg, 0, max_yaw_deg);
			}
			else
			{
				move.yaw_deg += yaw_delta;
				move.yaw_deg = clamp(move.yaw_deg, -max_yaw_deg, 0);
			}
		}
		
		cur_dir += gear * move.yaw_deg * ts;
		image_angle = cur_dir;
	}
	else
	{
		// freeze is true, only calculate friction
		move.cur_speed -= move.fric * ts;
		move.cur_speed = max(move.cur_speed, 0);
	}
	
	// motion pulse of this step
	var dist = move.cur_speed * ts;
	var move_dir = gear > 0 ? cur_dir : cur_dir + 180;
	motion_set(move_dir, dist);
	
	// fade out position fx is user start controling the car
	if (key_pressed && _fx_showpos != noone)
	{
		_fx_showpos.FadeOut();
		_fx_showpos = noone;
	}
}

function LevelEndCheck()
{
	if (freeze)
		return;
	
	var pass_level = 0;
	if (not (place_meeting(x, y, obj_no_stall)) && speed == 0)
	{
		if (instance_exists(obj_correct_direction))
		{
			var x1 = lengthdir_x(1, image_angle);
			var y1 = lengthdir_y(1, image_angle);
			var x2 = lengthdir_x(1, obj_correct_direction.image_angle);
			var y2 = lengthdir_y(1, obj_correct_direction.image_angle);
			
			if (dot_product_normalised(x1, y1, x2, y2) > (sqrt(2) * 0.5))
			{
				pass_level = 1;
			}
		}
		else
		{
			pass_level = 1;
		}
	}
	else if (place_meeting(x, y, obj_off_limits))
	{
		pass_level = -1;
	}

	if (pass_level != 0)
	{
		freeze = true;
		
		if (instance_exists(obj_timer))
		{
			obj_timer.freeze_timer = true;
		}
		
		if (pass_level > 0)
		{
			alarm_set(1, 60);
		}
		else
		{
			alarm_set(0, 60);
		}
	}
}


