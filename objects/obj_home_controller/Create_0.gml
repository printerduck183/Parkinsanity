
_credits_shown = false;
obj_credits.visible = false;

_music = audio_play_sound(snd_go_for_a_spin, 1, true);


function ShowCredits()
{
	if (!_credits_shown)
	{
		obj_credits.visible = true;
		_credits_shown = true;
	}
	else
	{
		obj_credits.visible = false;
		_credits_shown = false;
	}
}
