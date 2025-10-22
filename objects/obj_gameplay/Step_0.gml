
if (global.level_passed == 1)
{
	show_debug_message("Level passed.");
	LevelPassed();
}
else if (global.level_passed == -1)
{
	LevelFailed();
}

