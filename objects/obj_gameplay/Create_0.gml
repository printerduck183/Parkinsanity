if (instance_number(obj_gameplay) > 1)
{
	show_debug_message("Error: only 1 obj_gameplay is allowed.");
    instance_destroy();
}

_in_level_room = false;
_game_paused = false;
_cur_level_index = 0;
_life_count = 0;
_first_play = true;

_game_levels = 
[
	rm_level_3,
	rm_level_2,
	rm_level_10,
	rm_level_1,
	rm_level_4,
	rm_level_5,
	rm_level_6,
	rm_level_8,
	rm_level_11,
	rm_level_7,
	rm_level_9,
];

_ui_levelplay = "ui_level_play";
_ui_pause = "ui_pause";
_ui_controls = "ui_controls";
_ui_levelsplash = "ui_level_splash";
_current_ui = "";

// set game fps, for debug
// game_set_speed(60, gamespeed_fps);
gc_enable(false);  // enable GC may cause unexpected crash for our game

RestartGame(false);

///////////////////////////////////////////////////////

function IsLastLevel()
{
	if (_cur_level_index >= array_length(_game_levels) - 1)
		return true;
	else
		return false;
}

function GoToNextLevel()
{
	if (IsLastLevel())
		return;

	// if this is the first time to play, goto tutorial room
	if (_cur_level_index < 0 && _first_play)
	{
		_first_play = false;
		room_goto(rm_tutorial);
	}
	else
	{
		if (_cur_level_index < 0)
			_cur_level_index = 0;
		else
			_cur_level_index++;
	
		room_goto(_game_levels[_cur_level_index]);
	}
}

function ReplayCurLevel()
{
	if (_cur_level_index < 0)
		return;

	room_goto(_game_levels[_cur_level_index]);
}

function BeatGame()
{
	room_goto(rm_beat_game);
}

function LevelPassed()
{
	if (IsLastLevel())
	{
		BeatGame();
	}
	else	
	{
		room_goto(rm_pass);
	}
}

function LevelFailed()
{
	_life_count--;
	if (_life_count == 0)
		room_goto(rm_game_over);
	else
		room_goto(rm_fail);
}

function OpenInLevelUI(ui_name)
{
	// tutorial room is a non-level room that has needs 
	// to open in-level windows
	//if (!_in_level_room)
	//	return;
	
	if (!_game_paused)
	{
		_game_paused = true;
		layer_set_visible(_ui_levelplay, false);
		layer_set_visible(ui_name, true);
		_current_ui = ui_name;
		instance_deactivate_all(true);
	}
	else
	{
		if (_current_ui != "")
		{
			layer_set_visible(_current_ui, false);
		}
		layer_set_visible(ui_name, true);
		_current_ui = ui_name;
	}
}

// close current in-level UI
function CloseCurrentInLevelUI()
{
	// tutorial room is a non-level room that has needs 
	// to open in-level windows
	//if (!_in_level_room)
	//	return;
	
	if (_current_ui == "")
		return;
		
	layer_set_visible(_current_ui, false);
	_current_ui = "";
	
	if (_game_paused)
	{
		_game_paused = false;
		instance_activate_all();
		// show level play ui
		layer_set_visible(_ui_levelplay, true);
	}
}

// goto home room and restart game
function RestartGame(gotoHome)
{
	// reset all parameters
	_cur_level_index = -1;
	_life_count = 5;
	
	if (gotoHome)
	{
		room_goto(rm_home);
	}
}

// get step time in seconds
function StepTime()
{
	return delta_time * 0.000001;  // delta_time is in micro-seconds
}

// get current time (seconds from game start)
function CurrentTime()
{
	return current_time * 0.001;  // current_time is in milli-seconds
}
