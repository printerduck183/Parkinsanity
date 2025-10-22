
function OnClicked()
{
	switch (button_id)
	{
		case "levelplay_info":
			obj_gameplay.OpenInLevelUI(obj_gameplay._ui_pause);
			break;
		case "pause_resume":
			obj_gameplay.CloseCurrentInLevelUI();
			break;
		case "pause_controls":
			obj_gameplay.OpenInLevelUI(obj_gameplay._ui_controls);
			break;
		case "pause_quit":
			obj_gameplay.RestartGame(true);
			break;
		case "restart_game":
			obj_gameplay.RestartGame(true);
			break;
		case "controls_gotit":
			obj_gameplay.CloseCurrentInLevelUI();
			if (room == rm_tutorial)
			{
				obj_gameplay.GoToNextLevel();
			}
			break;
		case "next_level":
			obj_gameplay.GoToNextLevel();
			break;
		case "try_again":
			obj_gameplay.ReplayCurLevel();
			break;
		case "home_credits":
			if (room == rm_home)
			{
				obj_home_controller.ShowCredits();
			}
			break;
		default:
			return;
	}
}