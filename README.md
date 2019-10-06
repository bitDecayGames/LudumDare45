# LudumDare45
Our Ludum Dare entry for #45: Racing Rogue-like

## (MW) Notes on player stats storage:

I put player (Human and AI) related stats under `global.player_<stat_name>[<slot>]`.  So for example:

- `global.player_name[0]` for the first player's name
- `global.player_place[7]` for the 8th player's racing place
- `global.player_is_human[4]` to check if the 5th player is a human or AI

The full list of status is listed under `scripts/sc_save_player_stats`