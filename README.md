#CodeChallenge for Fox Sport

by _Dmitrii Zverev_. 27 July 2018

<h2>iOS Application Requirements</h2>

1. Create an application that displays the top player stats for a given NRL match. Technical Requirements:
- [x] Networking and model layers should be done in a reusable way
- [x] Use MVVM Architecture
- [x] Write the Application in Swift
- [x] Every stat type should be in its own section
- [x] Team A player should appear on the left and Team B player should appear on the right
- [x] Display player headshot, short name, jumper number and position for every player along with the stat value
- [x] Tapping on a player headshot should open another page that will display a larger headshot of the player along with their full name, position and all their stats for the last match they played.
- [x] Automated tests covering functionality and appropriate edge cases

2. All API calls and endpoints that will be required are below.
If any requirements are vague or unclear, make assumptions on what would work best.
To get the top player stats, use the following API call: https://statsapi.foxsports.com.au/3.0/api/sports/league/matches/NRL20172101/topplayers tats.json;type=fantasy_points;type=tackles;type=runs;type=run_metres?limit=5&userkey=A 00239D3-45F6-4A0A-810C-54A347F144C2

3. To get a specific player’s stats, use the following API call:
https://statsapi.foxsports.com.au/3.0/api/sports/league/series/1/seasons/115/teams/{{tea m-id}}/players/{{player-id}}/detailedstats.json?&userkey=9024ec15-d791-4bfd-aa3b- 5bcf5d36da4f
Where {{team-id}} should be replaced by the teams id of the player that was tapped and {{player-id}} should be replaced by the players id.

3. Player images can be found here - http://media.foxsports.com.au/match- centre/includes/images/headshots/landscape/nrl/{{player-id}}.jpg
If player image can not be found, use this image:
http://media.foxsports.com.au/match-centre/includes/images/headshots/headshot-blank- large.jpg

4. Once complete, please provide a git repo with full commit history.
- [x] complete section.

<h2> </h2>

 **In this challenge, I demonstrated my abilities to use:**
 
- structs
- emuns 
- optionals
- Codable 
- array/dictonary mappings 
- extensions 
- Threads
- Creating custom UI elements from XIBs
- Avoiding Massive View Controllers
- escaping
- image caching
- haptic feedbacks
- animation
- Unit Testing
- ..  and much more 
