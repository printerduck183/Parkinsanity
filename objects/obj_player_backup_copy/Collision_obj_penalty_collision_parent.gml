
if (!freeze)
{
	Crash(other);
	
	move.cur_speed = 0;
	speed = 0;
	alarm_set(0, 60);
	freeze = true;
}
 