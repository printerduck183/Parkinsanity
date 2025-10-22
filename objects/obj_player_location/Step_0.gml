
x = obj_player.x;
y = obj_player.y;
image_angle = obj_player.image_angle;

var ts = obj_gameplay.StepTime();

var sin_rad = _time_count * 3.14 * 2 * 1.5;
_time_count += ts;

var max_offset = 0.5;
var offset = sin(abs(sin_rad)) * max_offset;
image_xscale = 1 + offset;
image_yscale = 1 + offset;

// fade out
if (_fade_time >= 0)
{
	_fade_time += ts;
	if (_fade_time < 1)
	{
		image_alpha = _max_alpha * clamp(1 - _fade_time / 1, 0, 1);
	}
	else
	{
		instance_destroy();
	}
}
else
{
	image_alpha = _max_alpha * (offset / max_offset);
}



