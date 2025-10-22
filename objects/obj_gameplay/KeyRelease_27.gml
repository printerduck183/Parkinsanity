
if (_in_level_room)
{
	if (_current_ui != "")
	{
		CloseCurrentInLevelUI();
	}
	else
	{
		OpenInLevelUI(_ui_pause);
	}
}

