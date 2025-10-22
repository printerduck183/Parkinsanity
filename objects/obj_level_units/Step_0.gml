
if (obj_gameplay._cur_level_index >= 0)
{
	var units = (obj_gameplay._cur_level_index + 1) % 10;
	image_index = units;
}
else
{
	image_index = 0;
}
