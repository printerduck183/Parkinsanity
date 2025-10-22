
global.level_passed = 0;

_in_level_room = false;
_current_ui = "";
_game_paused = false;

if (instance_exists(obj_room_config))
{
	_in_level_room = obj_room_config.is_level;
}

