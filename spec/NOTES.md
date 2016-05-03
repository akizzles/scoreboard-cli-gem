************
HOW TO BUILD A CLI GEM
************

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. For that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. Discover objects
8. Program

***********

1/ Created the Github repo https://github.com/akizzles/scoreboard-cli/gem
2/ Created the scoreboard directory using bundler with the commend "bundle gem <name_of_project>"
3/ Then initialized .git with "git init", "git add . ", "git commit -m 'first commit", "git remote add origin git@github.com:akizzles/scoreboard-cli-gem.git", and finally, git push -u origin master"
4/ To undo use command "rm -rf .git"
5/ Then I configured my ~/.bash_profile to open Sublime projects using the excellent blog post here: "http://ashleynolan.co.uk/blog/launching-sublime-from-the-terminal". I didn't already have a PATH set in my bash_profile it seems.
6/ Created the "scoreboard" file in the bin dir and added the shebang statement. 
7/ Then made the file executable with "chmod +x scoreboard" so the user has permission rights to execute only commanding "./bin/scoreboard"
8/ Updated the scoreboard bin file to just call my CLI scoreboard with "Scoreboard::CLI.new.call"
9/ added the cli.rb class file in lib/scoreboard/ 
10/ Scrape basketball-reference.com/boxscores

***************
www.basketball-reference.com

/boxscores/index.cgi?month=4&day=27&year=2016

1/ g ==> number of games: doc.css("td.align_left.valign_top").count

2/ s ==> g(t + s): doc.css(".no_highlight .wide_table")[i].text; s(i) = 3*(g-1)

3/ s.gsub(/^$\n/,'').split("\n").pop

4/ s[0] - away team
5/ s[1] - away team score
6/ s[2] - "final" --> progress if other than 'final' needs to be [DELETED]
7/ s[3] - home team
8/ s[4] - home team score