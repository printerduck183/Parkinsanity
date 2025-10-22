
var msg = event_data[? "message"];

switch (msg)
{
    case "beatgame_end":
        obj_gameplay.RestartGame(true);
        break;
}