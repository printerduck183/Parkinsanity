
var ts = obj_gameplay.StepTime();
_lifetime -= ts;

if (_lifetime < 2)
{
	image_alpha -= 0.5 * ts;
}

if (_lifetime < 0)
{
	instance_destroy();
}

