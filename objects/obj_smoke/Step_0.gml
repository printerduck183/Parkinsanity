
var ts = obj_gameplay.StepTime();

var scale_delta = 0.2 * ts;
image_xscale += scale_delta;
image_yscale += scale_delta;

// move up
var dist = _move_speed * ts;
motion_set(90, dist);

// rotate
var rot_deg = _rot_speed * ts;
image_angle += _rot_dir * rot_deg;

// fade out
if (_life < 2)
{
	var fade = 0.25 * ts;
	image_alpha -= fade;	
}

_life -= ts;
if (_life < 0)
{
	instance_destroy();
}
