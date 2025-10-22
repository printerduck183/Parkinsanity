var msg = event_data[? "message"];

switch (msg)
{
    case "home_pause_move":
        move_enable = false;
        break;
    case "home_resume_move":
        move_enable = true;
        break;
}