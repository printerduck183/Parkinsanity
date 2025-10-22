
var ts = obj_gameplay.StepTime();
_lifetime -= ts;

if (_lifetime < 3)
{
	image_alpha -= 0.3 * ts;
}

if (_lifetime < 0)
{
	instance_destroy();
}

