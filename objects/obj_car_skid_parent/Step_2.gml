
skid(prev_speed, prev_angle);

/////////////////////////////////////////////////////

// calculate current speed (pixels/s)
function calc_speed()
{
	var deltax = abs(x - xprevious);
	var deltay = abs(y - yprevious);
	var deltapos = sqrt(sqr(deltax) + sqr(deltay));
	return deltapos / obj_gameplay.StepTime();
}

function skid(old_speed, old_angle)
{
	var ts = obj_gameplay.StepTime();  // step time in seconds
	if (ts <= 0)
		return;
	
	var cur_speed = calc_speed();
	//var delta_speed = abs(cur_speed - old_speed) / ts;
	var delta_speed = (cur_speed - old_speed) / ts;
	var delta_angle = abs(image_angle - old_angle) / ts;
	prev_speed = cur_speed;
	prev_angle = image_angle;
	
	//show_debug_message("old_speed: " + string(old_speed));
	//show_debug_message("old_angle: " + string(old_angle));
	//show_debug_message("speed: " + string(cur_speed));
	//show_debug_message("image_angle: " + string(image_angle));
	//show_debug_message("delta_speed: " + string(delta_speed));
		
	// return if too many skid occurs in a short time
	if (skid_count > 30)
		return;
	
	skid_interval += ts;
	if (skid_interval > 0.5)
	{
		skid_interval = 0;
		skid_count = max(skid_count - 10, 0);
	}
	
	// npc cars always move on path, so they shoud be treated differently from player car
	var generate_skid = false;
	var is_npc = false;
	if (object_index == obj_player)
	{	
		if ((delta_speed < -200 && cur_speed > 180) ||  // is hard braking
			(delta_angle > 80 && delta_speed > 0 && cur_speed > 200))  // is turning on high speed
		{
			generate_skid = true;
		}
	}
	else
	{
		is_npc = true;
		
		if (cur_speed > 250 && delta_angle > 150)
		{
			generate_skid = true;
		}
	}
	
	if (generate_skid)
	{
		RandomCreateTiremark(is_npc, 0);
		RandomCreateTiremark(is_npc, 1);
	}
}

function RandomCreateTiremark(is_npc, index)
{
	var percent = is_npc ? 0.7 : 0.5;
	var rand = random_range(0, 1);
	if (rand > percent)
		return;
	
	var obj_name = noone;
	if (is_npc)
	{
		obj_name = index == 1 ? obj_npc_car_trail1 : obj_npc_car_trail2;
	}
	else
	{
		obj_name = index == 1 ? obj_car_trail1 : obj_car_trail2;
	}
	
	var tiremark = instance_create_depth(x, y, 190, obj_name);
	tiremark.image_angle = image_angle;
}

