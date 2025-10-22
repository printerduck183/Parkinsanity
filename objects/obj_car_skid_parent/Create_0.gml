
prev_speed = 0;
prev_angle = 0;
skid_interval = 0;
skid_count = 0;

function real_speed(per_second)
{
	var deltax = abs(x - xprevious);
	var deltay = abs(y - yprevious);
	var deltapos = sqrt(sqr(deltax) + sqr(deltay));
	
	if (per_second)
	{
		return deltapos / obj_gameplay.StepTime();
	}
	else
	{
		return deltapos;
	}
}

