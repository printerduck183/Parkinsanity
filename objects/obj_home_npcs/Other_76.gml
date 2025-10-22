var msg = event_data[? "message"];

switch (msg)
{
    case "home_pause_move":
        _move_enable = false;
        break;
    case "home_resume_move":
        _move_enable = true;
        break;
	case "home_last_frame":
		x = _init_x;
		image_index = (image_index + 1) % image_number;
		break;
}