
var ts = obj_gameplay.StepTime();

// create smoke
_smoke_time -= ts;
if (_smoke_time < 0)
{
	var smoke = instance_create_depth(x, y, depth, obj_smoke);
	_smoke_time = random_range(0.5, 2);
}

/*
_wait_time -= ts;
if (_wait_time < 0)
{
	obj_gameplay.RestartGame(true);
}
*/
