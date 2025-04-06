pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--default functions
function _init()
		//info for the player
		player = {}
		--[[
		default room is 2,
		though this may change
		during testing.
		]]--
			 player.room  = 2
		--[[
		a way for us
		to test certain 
		variables to ensure they're
		updating correctly.
		]]--
		bugtest = false	 
		
		--[[
		a list of event triggers
		for important variables.
		i'm aware that putting it as
		trigger.key for example may
		be better to ensure that
		everything is properly placed,
		but for now i'm prefering this
		to limit the amount of tokens
		i'm using, and to make the
		program more readable in
		pico8 specifically.
		]]--
		direction = "left"
		--located in room2
		key1=0
		--located in room 4
		key2=0
		--located in room 5
		journal1=0
		--located in room 6
		shears=0
		scanned=0
		journal2=0
		--[[
		it's important to know which 
		rooms we have entered already
		so we use these tables to
		learn which rooms we've already
		been in.
		]]--
		previewroom={0,0,0}
		visitedroom={0,0,0,0,0,0,0,0,0,0,0,0}
		visitedsub ={
				{},
				{0,0,0,0,0,0},
				{},
				{0,0,0,0,0,0},
				{0,0,0,0,0,0},
				{0,0,0,0,0,0},
				{0,0,0,0,0,0},
				{0,0,0,0,0,0},
				{0,0,0,0,0,0},
		}
		--[[
		variables for making various
		objects "blink", i.e flicker
		between two sprites
		]]--
		
		swapblinkstate = 1
		blinktimer = 15
		blinkmap={001,002}
		blinksel={003,004}
		blinkchc={005,006}		
		blinkchc2={007,008}
		
		//variables for dialogue
		dialogueselection = 1
		selectedchoice = 0
		lockchoice = false
		disable = false
		initialmainval = 1
		//variable to scroll text
		textscroll=1
		//array that holds room info
		story = {
					// [room 1]
					{
							dialogue = {"this room is intentionally blank"},
							choice = {"nothing"}
					},
					// [room 2]
				 {
							dialogue = {
									"you've heard plenty of rumors about the abandoned apartment complex on the edge of town. there was an explosion a year ago that killed a number of people, and ever since then the complex was abandoned. there were countless rumors about what had happened.",
									"one rumor had it that it was a drug operation that went south.another rumor had it that it was a terrorist group that was trying to make a bomb but ended up blowing themselves up on accident. there was even a rumor that it was a spy base that was discovered, and it blew up as a safety precaution.",
							  "whatever the case, the owners abandoned it. it was put under investigation for a time by the police, but nothing turned up. still, it always felt odd to you and before you realized it, you had found yourself outside of the broken doors of the infamous facility. you walk inside carefully, feeling your curiousity grow.",
							  "you venture inside the facility. it's difficult getting past the door, as something inside had blocked the door, and it wouldn't budge. thankfully, upon looking around, you spotted an open window and managed to climb in.",
							  "as you look around the entrance room, it's clear that the decrepit building isn't exactly safe. water drips from the ceiling, and there's rubble along the floor.",
							},
							choice = {
									"check front desk",
									"look around room."
									},
							followupchoice = {
									{
									"walking up to the desk, you decide to check it out to see if there's anything worth taking. you don't expect much, considering that this place has been abnadoned for months. if there were anything worth taking, it would already be gone.",
									"to your surprise, in one of the half-open drawers, you find a keycard lying there.⬇️a few leaves seem to be next to it, and the card seems to have some green stains. pocketing the card, you check the rest of the desk to see if there's anything else.",
									"unfortunately, your search ends in vain as there's nothing else left in the desk. you managed to get a keycard out of this, and if nothing else it might sell for something to the right people if you don't find anything else. finished with the desk, you continue searching around.",
									"you check the desk again, to see if there was anything you might've missed on your initial sweep. after a few minutes, you find that you were quite thorough the first time, there's nothing left to take. at the very least, you found the peace of mind knowing there's nothing you missed."
									},
									{
									"you look throughout the broken room. there's a lot to take in, such as the plant life that has won its battle against the odds and found life inside this broken room.",
									"after spending a few minutes scavenging the place, its clear that anything of value or importance is likely already gone, taken by any who had already come before you.",
									"if nothing else, you had some fun while you were doing it, so it's not like this was a complete waste.",
									"you check around again, but there's still not much of note."
									}
							}
					},
					// [room 3]
					{
							dialogue = {"this room is intentionally blank"},
							choice = {"nothing"}
					},
					// [room 4]
					{
							dialogue = {
							"it seemed that this room had quite a few rather odd looking plants inside, they almost seemed to glow with vibrancy. furthermore, there were certainly a few computers in here and storage cabinets. though, with the computers, they seemed to be non operational. the odd looking plants were locked away in glass containers, almost like it was meant for observation.",
							"as you walk in, a small alarm goes off. it was barely audible, and after a few moments the sprinklers in the room go off, letting a very gentle mist of water into the room. it certainly wouldn't put out any fires, but it'd at least water the plants that had taken root in here.",
							"if nothing else, it wouldn't hurt to take a look around this room. with some luck, perhaps something valuable could be found, or at least some sort of clue to help you understand what happened. you can't exactly go back empty handed now... you're doing this for your sister after all. if you can't find anything here...",
							"these thoughts won't help you now. gently slapping your own cheeks, you regain the confidence to continue searching."
							},
							choice = {
									"check cabinets",
									"check doors",
									"leave the room."
							},
							followupchoice = {
									{
									"the cabinets are in a rather sorry state, banged up from having fallen over. thankfully, they seem to be unlocked, so opening it isn't an issue. there's plenty in here, though you're not exactly sure what much of it is. ultimately, the only thing you take from the cabinet is a keycard marked with the number marked 6 on it.",
									"you take a second look to be extra safe. while you do find some scientific instruments that could sell for a pretty penny, there's nothing useful for you at the moment here. you make a mental note to return before you leave."
									},
									{
									"you look throughout the broken room. there's a lot to take in, such as the plant life that has won its battle against the odds and found life inside this broken room.",
									"after spending a few minutes scavenging the place, its clear that anything of value or importance is likely already gone, taken by any who had already come before you.",
									"if nothing else, you had some fun while you were doing it, so it's not like this was a complete waste.",
									"you check around again, but there's still not much of note."
									},
									{
									"you walk out of the room, careful not to bump into anything on the way out. as you step through the door, you're careful to leave it open slightly, on the off chance that closing it could get the door stuck.",
									"",
									}
							}
					},
					// [room 5]
					{
							dialogue = {
									"ultimately, you make your way to the base of the stairs without issue. the sound of water dripping echoes around you, coming from a few pipes leaking fluids around you. it'll be impossible to keep your shoes dry, as there's a few puddles on the floor. it's odd, the plant life around you shouldn't have grown so quickly.",
									"if it were a few decades, it'd be expected but it was only a year since that explosion. some growth could have occurred, but with only a few flickering lightbulbs as a source of light, it doesn't make sense for the plants around you to have gotten so lively. looking at them closer won't answer any of your lingering questions.",
									"the door ahead of you is closed, but it doesn't match the decor of the apartment above. it's a painfully white door, the type that you'd expect in a hospital or laboratory, though there's faint stains of red on the door and floor near it. it's not too late to go back up the stairs and leave... but you won't get the answer to what happened here.",
									"it's an automatic door, but unsurprisingly it's broken after all this time. it takes a few minutes, but you force it open. it seemed that this place is a laboratory. if the stairs looked overgrown, then this was a proper jungle! the plants had completely taken over, it's impossible to find a single surface that didn't have some sort of flora growing on it.",
									"you carefully make your way into the room, trying not to step on any of the plants while carefully looking around. there was a clear glass window in front of you, showing the room on the otherside... or at least it would. it was completely obscured by the plants on the otherside, with a few cracks at certain points.",
									"from an initial glance, there's a lot to look at on both sides of this room. you decide to start by looking at the left. towards the left side, on a desk, there seems to be a book covered in vines, and there's a door on the left wall with a dull light shining from it. it also seems to be cracked open."
							},
							choice = {
									"check journal",
								 "check computers",
								 "check glass",
									"enter left door.",
									"enter right door.",
									"go back upstairs.",
							},
							followupchoice = {
									{
									"it takes some time to pry the journal from the vines, as they had wrapped around it quite tightly. ultimately, you prevail against mother nature, giving the vine a rather triumphant look as you hold your spoils in your hand... though you realize that you're looking rather silly for boasting against a plant.", 
									"you decide to look through your new book, to see if there's anything inside that can helpp you find anything of value. a majority of the pages seem to be stained or ripped out, but you do happen to find a page that remained legible.",
									"january 5th, 20█⬇️this journal exists to document the results of our tests, to ensure that we will look over no detail this time. we can't afford to make another blunder like last time.",
									"you flip through the pages to see if there's anything you may have missed in the book, but the rest of the pages are either illegible or have been ripped out.",
									},
									{
										"you check the computers, but it seems that they're broken. they won't turn on, no matter what you press. considering that the room has a number of puddles, this doesn't come as a huge surprise.",
										"you check again to see if the computers might have somehow started working, but they're still unresponsive.",
								 },
								 {
										"considering that there's a giant pane of glass in front of you, it wouldn't hurt to try and look through it. you spend a few moments trying to look through, the glass has gotten foggy and the lights don't seem to be on considering it's pitch black in there. all you can manage to see is that there's vines near the glass.",
										"you take a second look to see if anything you've done made it more visible. unfortunately, it didn't and you still can't see anything within."
								 },
									{
									 "you open the left door slowly. it doesn't open easily, you can feel some resistance but it doesn't take much effort to open it. it's a pleasant surprise, considering the state of the facility, it's a miracle that something hadn't fallen over and blocked the door after all. you look inside the room.",
									 ""
									},
									{
										"the door on the right side seems to be fully intact. a red light is present above the door. furthermore, there seems to be a card scanner to the right. you try using the card that you found upstairs, swiping it through. the scanner flashes red and lets out a negative beep. it seems this won't work, you'll have to find a new card.",
										"you swipe through the card again, to see if maybe you had done it incorrectly. the scanner rejects this attempt as well. you try once more for good measure, but the scanner flashes red once again. this isn't going to work, in all likelyhood."
									},
									{
										"you just came down here. leaving now would be a waste, as you haven't found anything valuable. it may be safer to leave, but what would be the point?"
									}
							}
					},
					// [room 6]
					{
							dialogue = {
									"similar to before, a mist comes out the door as it unlocks. it's hard to control this feeling of dread that's growing inside of you. you can't help but shake the feeling that you're being watched. you've seen a few cameras in the previous rooms, but none of them appeared to be working. it's different, something else may be looking... at least, that's what it feels like.",
									"perhaps your mind is playing tricks on you. it's unlikely that anyone could still be here after all this time, with the place in this condition. if there were anyone, you should've seen them by now. outside of the plants you've found, there's been no evidence of anything else.",
									"at any rate, you can't leave now. you haven't found anything yet that makes this investigation worth it. there should be something valuable that you could take here, whether it's equipment or some information you could sell. with some luck, it'll be enough to keep you and your sister fed for a long time.",
								 "summoning your own courage, you step inside the now unlocked room. not knowing what to expect, you carefully survey your surroundings. this room appears to be a decontamination room. there's a few hazmat suits along the wall with a compact shower next to it. you can also see a larger scanner. it's rather large, and the only way to get to the door is to walk through it.",
									"you can also notice that there are two larger desks in the room, and that the scanner on the other doorway seems to have something on it's display. there also seems to be a few lockers along the opposite wall from your doorway.",
									"carefully walking around the room, you start to take a closer look at your surroundings."
							},
							choice = {
									"check hazmat suits",
									"check shower",
									"check smaller desk.",
									"check larger desk.",
									"check lockers",
									"enter the scanner."
							},
							followupchoice = {
									{
									"there's enough suits here for a few people, which makes it all that more concerning that you haven't found anyone... or anything. you fish through the pockets for a few minutes, but there's nothing worth taking within. it would've been too easy if there was a keycard within.",
									"concerned that you may have missed something, you check the pockets again. you did manage to find something this time, a spare handkerchief. it looks rather nice, so it might make a fine gift in the future, though it certainly won't help you today."
									},
									{
									"a small shower roughly two feet by two feet, it seems to exist only to wash you down before you enter or after you leave. it doesn't take you long to check around, there's not many places to hide anything after all. unfortunately, your searches come up empty.",
									"erring on the side of caution, you decide to check if there's anything under the grate, but you come up empty, and the handles don't seem to be hiding anything either.",
									"it seems the only thing here for you is the ability to shower, if you see fit... though the thought of showering here doesn't exactly inspire confidence."
									},
									{
									"you check the drawers on the smaller desk and see a smaller notepad. jotted on the surprisingly dry pages seems to be some instructions.",
									"[before entering or exiting, the door won't open unless the scanner detects no problematic elements. this includes evaconvolvulus, so be careful that nothing sticks to you when you leave. if something goes wrong, it'll lock down the door until the issue is resolved.]",
									"[before entering or exiting, the door won't open unless the scanner detects no problematic elements. this includes evaconvolvulus, so be careful that nothing sticks to you when you leave. if something goes wrong, it'll lock down the door until the issue is resolved.]",
									},
									{
									"these seems to be a page of a journal here. insertjournal",
									""
									},
									{
									"surprisingly, you seem to find a pair of shears here, with green residue stained onto them. it may be worth keeping them for now, in case you need to cut something later.",
									"there doesn't seem to be anything else in the locker."
									},
									{
									"seeing no reason not to try, you enter the scanner. it's a larger box, able to hold you inside without issue. on the other side is a glass panel blocking the actual doorway. there also seems to be a button labeled [begin scan] next to you, as well as a display screen that is powered off. finally, there seems to be several vines on the floor.",
									"you press the button, and the opening behind you closes with a glass panel coming down to lock you in. after a few moments, the top of the scanner lights up, completely covering the top with red light. after a few moments, it begins moving downwards.",
									"you brace yourself, seeing no way to escape from this. the lights hit the top of your head... and continue downwards without any noticable effect until it hits the very bottom of the scanner, where it promptly fades away. you feel no different, it seems the scan is complete.",
									"you notice a small display screen light up, with a particularly troubling sentenence.",
									"[error - evaconvolvulus detected. doors have been locked.]",
									"[error - evaconvolvulus detected. doors have been locked.]"
									}
							}
					},
					//room 7 information
					{
							dialogue = {"nothing"},
							choice = {"nothing"}
					},
					//room 8 information
					{
							dialogue = {"nothing"},
							choice = {"nothing"}
					},
					//room 9 information
					{
							dialogue = {"nothing"},
							choice = {"nothing"}
					},
		}
	 --[[
	 the initial dialogue that should be displayed
	 we're putting it here due to necessity
		]]--
		currentdialogue = story[player.room].dialogue[1]
end

function _update()
		//scrolling, we use #string to see length
		if textscroll < #splitdialogue(currentdialogue)
		then
				textscroll+=0.5
				//skip dialogue button
				if btnp(5)
				then
						textscroll = #splitdialogue(currentdialogue)
				end
		end
		//blinking ui code
		if blinktimer > 0
		then
				blinktimer-=1
		end
		if blinktimer == 0
		then
				if swapblinkstate == 2
				then 
						swapblinkstate = 1
						blinktimer = 15
				else 
						swapblinkstate = 2
						blinktimer = 15
				end
		end
end

function _draw() 
		//important to clear screen after we do something to show changes
		cls()
		//to help see screen, deleteme
		rectfill(0,0,128,128,1)
		ui()
		bugs()
		//handle the dialogue
		dialogue(story[player.room])
end
-->8
--ui page

function ui() 
		--[[our room layout: we're
		using a table to handle room
		data. 
		
		0 represents a room that
		the player has not entered yet.
		
		1 represents a room that
		the player has entered
		
		9 represents an empty room:
		one that shouldn't be reached.
		]]--
		room = {
				9,1,9,
				1,1,1,
				1,1,1,
				1,1,1
		}

		//holder for text ui
		rect(2,2,125,86,2)
		
		//holder for room ui
		rect(98,89,125,124,2)

		//holder for choice ui
		rect(2,89,95,124,2)
		//using this to place a grid from the info in room
		for i = 0, 3 do
				for j = 1, 3 do
						temp = (i*3)+j
--[[first, we check to see if 
we're in the room that the 
player is in. the player has an inbuilt room variable for this reason
room variable that changes with
each room they go to. thus:
we can compare that with the
i+j calculation to see if the
player is in "that" room, and
if they are, we do an alternative
sprite to show it.]]--
						if temp==player.room
						then
							spr(blinkmap[swapblinkstate],92+(8*j),115-(8*i))
--[[alternatively, if the player
isn't in the room, we show off
if the room is discovered by seeing
if it equals 1 or not. if it's 1
then the player has stepped into
it before. otherwise, we display
nothing, as they don't know it 
exists yet.]]--
						elseif room[(temp)]==1 and visitedroom[temp]==1
						then
								spr(001,92+(8*j),115-(8*i))
						end
				end
		end
						--[[
		used to preview rooms, '
		i.e: let the player know that
		a given room exists
		]]--
		if previewroom[1] == 1
		then
				spr(009,108,107)
		end
		if previewroom[2] == 1
		then
				spr(009,108,99)
				spr(010,100,107)
				spr(010,116,107,1,1,1)
		end
end


function selection(blinker,cond1,cond2,x,y)
		if cond1 and cond2
		then
				spr(blinker[swapblinkstate],x,y)
		else
				spr(blinker[1],x,y)
		end
end

function choices(item)
		//
		if not lockchoice
		then
		//
				if #item.choice > 3
				then
						selection(blinkchc,
						dialogueselection!=1,
						textscroll == #splitdialogue(currentdialogue),
						4,117)
						selection(blinkchc2,
						dialogueselection!=#item.choice,
						textscroll == #splitdialogue(currentdialogue),
					 9,117)
				//
				end
				
				--[[
				if we want to scroll our
				dialogue boxes, we must let
				our program know exactly 
				where we are in our choice
				menu.
				
				in this case, we first check
				to see if the current choice
				the player is selecting is
				three or higher.
				
				if it is, then we can tell
				exactly how far over we are
				by subtracting it from 3.
				
				it's basic math, but is
				important for creating the
				menu options.
				]]--
				if dialogueselection >= 3
				then
						over3 = dialogueselection-3
				else
						over3 = 0
				end
				
				--[[
				conversely, the other
				potential option is that
				we're underneath 3 when
				we look at our menu,
				whether it's 1 or 2.
				
				in this case, we want to
				limit how many choices appear
				instead. with this, we can
				simply set the limit here.
				]]--
				under3 = 3
				if #item.choice < 3
				then
						under3 = #item.choice
				end
				
				--[[
				this is where we actually
				display our menu for the
				choices the player has.
				
				in this case, we first need
				to know how many options
				we want to display. first,
				if we have less than three
				choices, under3 make it so
				the menu displays the
				choices the player has
				without forcing it to output
				a [nil] option in the event
				that a second or third
				choice doesn't exist.
				
				otherwise, it'll display
				exactly three choices.
				]]--
		 	for i = 1, under3 do	
		 	--[[
		 	next: it'll display the 
		 	choices we deem 'visible'
		 	based on how the player
		 	scrolls the menu.
		 	
		 	in the event of three or
		 	less choices, it'll always
		 	display all choices.
		 	
		 	however: if there's more
		 	than three choices, it'll
		 	update the choices as the
		 	player scrolls due to the
		 	selected choice dynamically
		 	updating as per the player
		 	scrolling.
		 	
		 	for example: if there are 4
		 	choices, and the player
		 	scrolls from the third option
		 	to the fourth, then our
		 	"over3" variable will update
		 	accordingly by +1, so all
		 	three of the choices will
		 	shift accordingly, giving
		 	the appearance that the
		 	player is scrolling down
		 	the menu. similarly: when
		 	the player goes up from
		 	fourth to the third position,
		 	then over3 will subtract one
		 	accordingly, giving us
		 	the illusion of a menu that
		 	actually scrolls, when
		 	in reality it's simply 
		 	changing the selection.		 	
		 	]]--
				  		print(item.choice[i+over3],
				  		15,82+(i*10))
				--[[
				we also want to show the
				player where they are on
				the menu, and a blinking
				cursor is the best way to
				display this information
				accurately.
				
				similarly: we want to
				ensure that it displays
				correctly when we're
				"scrolling" through the 
				menu, so we use the same
				principle from before and
				use over3 to display our
				selection correctly.
				]]--
				  		selection(blinksel,
				  		i+over3==dialogueselection,
				  		textscroll == #splitdialogue(currentdialogue),
				  		5,80+(i*10))
				end
				
				--[[
				we want to ensure that
				the player doesn't update
				the position of their choice
				during a choice selection
				or during the main dialogue,
				as that can cause issues.
				
				as such, we only allow
				the player to start making
				choices after the text has
				been fully displayed, and
				that we're not disabling
				their input any further.
				]]--
				if not disable and textscroll == #splitdialogue(currentdialogue)
						then
						if btnp(3) and dialogueselection < #item.choice
						then
								dialogueselection += 1
								sfx(01)
						elseif btnp(2) and dialogueselection > 1
						then
								dialogueselection -= 1
								sfx(01)
						end
				end
		else
		--[[
		in the event that we don't
		wish to give the player a 
		choice, or rather a choice
		doesn't matter (such as
		simply advancing through
		dialogue), then
		all we must do is print
		a "continue" option that does
		nothing but let the player
		continue moving, and only
		do so when the dialogue
		completes.
		]]--
				print("continue",15,92)
				selection(blinksel,
				true,
				textscroll == #splitdialogue(currentdialogue),
				5,90)
		end
end

--[[
a function to make sound 
happen as dialogue plays.
]]--
function sound(string)
		--[[
		we use ord to check the value of the current character being written.
		- if it's " ", "," or ".", we don't play sound. furthermore,
		- if the previous character were one of those,
		we won't play any sound.
		- if we're at the end of the string, we won't
		make any sound since it's over.
		- finally, we use text scroll's delay to make the sounds 
		happen only when it's just written.
		]]--
  if ord(string[textscroll])!=(32 or 44 or 46)
  and ord(string[textscroll-1])!=(32 or 44 or 46)
  and textscroll != #string
  and textscroll % 1 == 0
		then
				sfx(00)
		end
end

function bugs()		
		if bugtest
		then
				print("computer1: "..computer1,8,70)
				print("selectedchoice: "..selectedchoice,8,76)
				--print("initmain: "..initialmainval,8,82)
				--print("key "..triggers.key,8,82)
				print("room 5 choices: "..visitedsub[5][1].." "..visitedsub[5][2].." "..visitedsub[5][3],8,82)
		end
end
-->8
--dialogue page

--[[
show the main dialogue for the room.
if we make a selection on side dialogue, then we show the side dialogue
otherwise, we show the dialogue for the room.
]]--

function dialogue(item) 

		--[[
		if we have a choice we can make,
		then we're in the branching dialogue
		thus, we can continue the story
		by using our followup dialogue.
		]]--
		if selectedchoice != 0 
		then
				displaydialogue(item.followupchoice[selectedchoice],visitedsub[player.room][dialogueselection]==0,1)
		--[[
		this area is for the main
		dialogue, i.e the dialogue
		that by default in a room, 
		such as when you enter or
		re-enter it.
		]]--
		else
				if visitedroom[player.room] == 0
				then
						lockchoice = true
						disable = true
				end
				displaydialogue(item.dialogue,lockchoice)
		end

		--in ui page
		choices(item)

		--give better notes
		if btnp(4) and textscroll == #splitdialogue(currentdialogue) and not disable
		then
				textscroll = 0			 
				if selectedchoice == 0
				then 
						lockchoice = true
						selectedchoice = dialogueselection
				elseif selectedchoice == dialogueselection
				then
						lockchoice = false
						selectedchoice = 0
				end
		end
end

function displaydialogue(item,binary,branch)
		--[[
		we use this to determine if we should
		go through the entire dialogue,
		or if the player has already read it.
		
		if binary is true, then we haven't
		seen the dialogue yet and should
		display it all. otherwise, just
		skip to the last part.
		]]--			
		if binary
	 then
		--[[
		for our various dialogue options,
		it's important to ensure that the
		system knows what our current
		dialogue is. thus, we have it
		set so it'll always initialize
		to the 'start', and we can simply 
		update it as we go along.
		]]--
	 		currentdialogue = item[initialmainval]
				print(sub(splitdialogue(currentdialogue),1,textscroll),6,6,3)
				sound(splitdialogue(currentdialogue))		
		--[[
		we have it set so the dialogue can
		only be advanced once we have reached
		the end of the paragraph, and that
		the button is pressed.
		]]--
				if btnp(4)	and textscroll==#splitdialogue(item[initialmainval])
				then 
		--[[
		once we move to the next 
		paragraph, we should start from
		the beginning of the next
		sentence, hence we reset the
		textscroll, which dictates
		where we are in the sentence.
		]]--
						textscroll = 0
		--[[
		next, we check if we're about
		to reach the end of the current
		dialogue.	if we're not, then
		we'll continue moving through
		the paragraphs.
		
		otherwise, if we're about to
		finish, then we'll tell the
		program that it's time to 
		adjust	our variables to get
		ready for allowing the player
		to make choices again.
		
		notably: with how the program
		works, in one iteration of the
		loops, it will never display
		the final part of our dialogue.
		
		this is intentional, as for the
		main dialogue, once the program
		completes, it will then update
		our numbers and the program will
		run again, this time seeing 
		that it should only run the last
		line of dialogue and nothing else.
		
		this creates a seemless line
		that ensures we go straight from
		second to last to last without
		any issues for the main dialogue.
		
		it also ensures that we will 
		display the last main dialogue
		after we finish making a choice,
		giving us something to always
		go back to.
		
		for the branching dialogue, it
		also works just fine as we can
		use that last line of dialogue
		to simply be used as a
		'reinvestigation' note, i.e
		after a player checks the same
		point again, it'll display
		a short message for the player
		to understand that they have
		everything.
		
		we're also able to run
		our events here to ensure that
		our various checks are being
		updated.
		]]--
						if #item-1 > initialmainval
						then
								initialmainval += 1
				 	else
				 			if branch
				 			then
				 					events()
				 					selectedchoice = 0
				 			else
				 					visitedroom[player.room] = 1
								end
								initialmainval = 1
								disable = false
								lockchoice = false
						end
				end
		else
		--[[
		if the binary is false, it
		means that we've seen this 
		dialogue before and we can
		skip straight to the end
		without fear.
		
		the only thing we should do
		is display the dialogue, and
		if we're in a branch, then
		we should run the event just
		in case.
		]]--
				currentdialogue = item[#item]
				print(sub(splitdialogue(currentdialogue),1,textscroll),6,6,3)
				sound(splitdialogue(currentdialogue))				
		end
end
-->8
--event tracker

--[[
we're using this program to
update our events as certain
things happen due to the player's
choices.

with my current design philosophy,
i want to ensure that the various
checks can only update should
the player achieve the necessary
condition. i don't wish to create
a game that plays itself after all
with minimal input.
]]--
function events()
		
		visitedsub[player.room][selectedchoice] = 1
		
		if player.room == 2
		then
				if selectedchoice == 1
				then
				--[[
				checking this area gives the
				player a key. as the player
				never revisits this area
				after "using" the key, there
				is no need to reset the key,
				especially as logically they
				wouldn't just go and throw
				it away after using it.
				
				we also want to ensure that
				the player sees the correct
				message. if the player has
				picked up the key, then
				the door dialogue will update
				accordingly.
				
				while it is not 100% necessary
				at this time to create new
				dialogue, at a later stage
				in the program, i will want
				to completely overwrite a
				room's information when the
				player backtracks through it,
				to more accurately display
				the information.
				
				as such, this is being used
				as a proof of concept to ensure
				we can update the information
				as necessary.
				]]--
						key1 = 1
						story[2].followupchoice[3] = {
						"after using the keycard, the door opens with a small cloud of mist dispersing into the room. you can smell fresh plant life up ahead. a faint light illuminates the room, showing that a spiral staircase is what awaits you with vines growing throughout the room. with no other option, you descend the stairs",
						"you slowly make your way down the stairs, being as careful as you can. each step causes the stairs to let out an awful creak, and whether it'll be from the stair underneath you breaking or tripping on an errant vine, a fall from here wouldn't be pretty.",
						""
						}
				--[[
				due to the second option
				not accomplishing anything,
				only used for story telling,
				there is no need to give it
				any special events.
				
				for the third option,
				if we have the key, then 
				it'll transport us to the
				next room. otherwise,
				nothing happens.
				
				in the event of the latter,
				we have it reset the choice
				so the player can reread it
				if they get confused on what
				they need.
				
				granted, this isn't that 
				complex of a puzzle, but
				being able to reset room
				states will be important later.
				]]--
				elseif selectedchoice == 2
				then
				--[[
				the player has discovered
				a door, so we should create
				the choice to use the door.
				]]--
						story[2].choice[3] = "go to next room"
				--[[
				we should show
				the player that there
				is a door they can enter
				now that they have discovered
				it.
				]]--
						previewroom[1] = 1
				--[[
				finally: if the player has
				discovered this door before
				they took the key, we need
				"rejection" dialogue that
				shows the player cannot enter
				it until they find a key.
				]]--
						if key1 == 0
						then
								story[2].followupchoice[3] = {
									"try as you might, the door to the next room is locked, and it'll need a keycard to get through.",
									"you spend a few minutes trying to get through without one, but it's not budging. it seems you'll need to find a keycard somewhere...",
									"",
								}
						end
				elseif selectedchoice == 3
				then
				--[[
				we see if we have the key
				if we do, we go through
				to room "5", otherwise
				we do nothing.
				]]--
						if key1 == 1 
						and visitedsub[2][3] == 1
						then
								player.room = 5
								previewroom[2] = 1
						else
								visitedsub[2][3] = 0
						end					
				end
		--[[
		room 3
		intentionally omitted, due
		to the facility's layout
		not showing one.

 	elseif player.room == 3
		then
				if selectedchoice == 1
				then
				
				if selectedchoice == 2
				then
				
				if selectedchoice == 3
				then
				
				
		]]--		
		--[[
		room 4
		]]--
		elseif player.room == 4
		then
				//
				if selectedchoice == 1
				then
						key2 = 1
						visitedsub[5][5] = 0
						story[5].followupchoice[5] = 
							{
									"you take the new keycard from your pocket and swipe it through the scanner. after a few moments, it lets out a positive sounding beep as the light above the door as well as the scanner flashes green, and the sound of a mechanism unlocking can be heard. it's unlocked now, and all that's left to do now is enter the door.",
							}
				end
				//
				if selectedchoice == 3
				then
						visitedsub[4][3] = 0						
						visitedsub[5][4] = 0
						story[5].dialogue[6] = "this observation room seems to be no different than when you had left it a few minutes ago. you carefully walk through the room, avoiding stepping on any vines while you consider your options."
				  story[5].followupchoice[4] = 
							{
					    "thinking that you may have missed something, you decide to check out the room on the left one more time, walking in slowly and carefully.",
					    "",
					  }	
						player.room = 5
				end
	
		--[[
	 room 5
		]]--
		elseif player.room == 5
		then
				if selectedchoice == 1
				then
						journal1 = 1
				end
			 if selectedchoice == 4
		  then
						player.room = 4
				end
				if selectedchoice == 5 
				and key2 == 1
				then
						player.room = 6
				end
		
		--[[
	 room 6
		]]--
		elseif player.room == 6
		then
				if selectedchoice == 4
				then
						journal2 = 1
				end
				if selectedchoice == 5
				then				
						shears = 1
						visitedsub[6][6] = 0						
						if scanned == 1 and journal2 == 1
						then								
								story[6].followupchoice[6] = {
								"you step into the scanner, shears in hand. the journals had noted that this 'evaconvolvulus' seems to be plant matter. knowing this, you crouch down towards the vines on the ground. you already checked that there wasn't anything like that stuck to your clothes, so it must be this.",
								"with some regret in your heart, you trim away at the vines, cutitng through them cleanly until you've clipped all of them. you pick up the remains and toss them out of the scanner. you couldn't get it perfectly, as they seemed to originate from a small crack in the floor, but you've gotten as much as you can.",
								"you press the button again, to see if you'll get a better result this time. the laser comes down again, following the proper path. you close your eyes before the lasers blind you, and after a few moment the scan completes. you open your eyes as the glass door ahead of you finally opens, revealing the now unlocked doorway to the next room.",
								"carefully, you step through into the next room.",
								""
								}
						elseif scanned == 0 and journal2 == 1
						then										
								story[6].followupchoice[6] = {
									"seeing no reason not to try, you enter the scanner. it's a larger box, able to hold you inside without issue. on the other side is a glass panel blocking the actual doorway. there also seems to be a button labeled [begin scan] next to you, as well as a display screen that is powered off. finally, there seems to be several vines on the floor.",
									"you press the button, and the opening behind you closes with a glass panel coming down to lock you in. after a few moments, the top of the scanner lights up, completely covering the top with red light. after a few moments, it begins moving downwards.",
									"you brace yourself, seeing no way to escape from this. the lights hit the top of your head... and continue downwards without any noticable effect until it hits the very bottom of the scanner, where it promptly fades away. you feel no different, it seems the scan is complete.",
									"you notice a small display screen light up, with a particularly troubling sentenence.",
									"[error - evaconvolvulus detected. doors have been locked.]",
									"you brought your shears into here, as you held no reason not to. remembering the journal that you had read, you look down at the vines growing on the ground and begin to trim them with your glorified scissors.",
									"after a few minutes of careful trimming, the scanner is as vinefree as it'll get. there's still some growing in the cracks, but you can't exactly reach them from here. with a job well done, you toss out the trimmed vines and press the scan button once more.",
									"the glass door closes once more, and the scan repeats just the same. you close your eyes as it hits your head, to avoid accidentally blinding yourself. after a few moments, you reopen them and are greeted with the sight of new text on the led.",
									"[no evaconvolvulus detected. you may enter.]",
									"the opposing glass door on the scanner opens up, and you can see the electronic lock on the opposing door unlock. carefully, you step into the next room...",
									""
								}
						end
				end
				
				if selectedchoice == 6
				then
						scanned = 1
						if shears == 1
						then
								player.room = 9
						end
				end
		end
		
		--[[
		reset the cursor position
		after a new event that could
		cause the player to switch rooms
		and cause the selected option
		to be [nil] in the new room.
		i.e: previous selection = 5
		room has max 4 selections
		
		not necessary for repeated events
		and is helpful for showing that
		you already did that option
		]]--
		dialogueselection = 1
end
-->8
-- dialogue splitter

function splitdialogue(input)
		--[[
		this function exists to 
		automatically add the 
		breakline	to a given string, 
		so we won't	need to do it 
		manually, as it's	tedious. we
		take a given string	and we 
		can make it add a new	line 
		with any posotive number	for 
		the sentence length.

		our length must be 1 higher 
		than	what we want. this is 
		because	we're adding the 
		newline	character "\n" at 
		the end of	every sentence, 
		and thus must accomodate for
		it.
		
		the second value will update
		dynamically once the loop 
		starts	but we wish to keep 
		the first	number the same 
		incase we wish	to change 
		how long it is.
		]]--
		setlength=31
		length=setlength
		--[[
		the following string should 
		contain exactly 31	spaces, 
		so we can use it to create 
		artificial empty spaces when 
		we want to	break	line. we
		include an alt with periods
		for bug testing		
		]]--
		
  emptystr="                               "
--emptystr="..............................."	
		
		--[[
		we dynamically calculate the 
		length of the string and divide
		it by our length to know how
		many rows we want, and thus
		how many newlines we'll add
		]]--
		
		for i=0,ceil(#input/setlength+1) do
		--[[
		we first want to ensure that
		we manually break line when
		we mark it appropriately.
		for the purpose of this
		program, ⬇️ in text represents
		a manual linebreak that i
		want to make, for formatting
		purposes.
		
		the best way to do this is to
		go through the text first and
		scan if any such character
		exists. if it doesn't, we
		do nothing.

		bugtesting - to check what the
		program believes the "first"
		letter is, and if it's correct
		
		print(input[1+(i*setlength)],6+i*4,116)
		
		]]--

				for j=1,setlength do
				  if sub(input,j+(setlength*i),j+(setlength*i)) == "⬇️"
				  then
		--[[		
		if it exists: we will "delete"
		the character by creating a 
		new string that has every
		character before it and every
		character after it, with a
		certain amount of empty 
		characters in between so it
		will display correctly. the
		amount of characters is
		found the same way we found
		the ⬇️ character, so we can
		easily fix our display.
		]]--
				  		temporary = 
				  		sub(input,1,j+(setlength*i)-1)
	 --[[
	 we know how many characters
	 we want to add via the j from
	 the check earlier. we also
	 wish to adjust it by 2,
	 to keep \n in our calcs
	 ]]--
				  		..sub(emptystr,j+2)
				  		.."\n"
				  		..sub(input,j+(setlength*i)+1)
 		--[[
		we then	replace the input 
	 with our	newly sanitized 
	 string to continue with the 
	 program. with how we added
	 the characters, the next line
	 won't need to do anything, as
	 we've already ensured it
	 won't see anything that
	 causes an error.
		]]--	 
 			    input = temporary
				  end
				end			
		--[[
		we must also check before we
		insert the newline if we'll
		cut off a word by doing this.
		if the given character isn't
		an empty space, we'll run a
		check and simply adjust  empty
		space onto the end of the
		line. 
		
		i.e:
		if it's cutting off the word
		like so
		
		..... hel
		lo world
		
		then we will see how many
		characters it must take to
		move it to the next sentence.
		in this case, we must move
		'hel' and we'll adjust our
		number appropriately so it
		will display
		
		.....
		hello world
		
		assuming that it can all be
		displayed on one line, of
		course.
		]]--
				if sub(input,length-1,length-1)!=" "
				then
						for j=1,ceil(setlength/3) do
								if sub(input,length-j,length-j)==" "
								then
										temporary = sub(input,1,length-j-1)
										..sub(emptystr,#emptystr-j+2)
										..sub(input,length-j)
										input=temporary
										break
								end
						end
				end

		--[[
		once we are sure that adding
		a new line is safe, we will
		do so by creating a temporary
		placeholder, and it's value will
		be what we have already done,
		the newline, and then what we
		haven't done yet.
		
		thus, each time we go through
		this loop again, it'll only
		affect the next line, without
		compromising any previous lines.
		
		we also increase our length
		appropriately each line.
		]]--
				temporary = sub(input,1,length-1)
				.."\n"
				..sub(input,length)
 			input = temporary		
 			length+=setlength
		end
		--[[
		once we're finished
		]]--
		return input
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000033333300333333000000000000000000000000000000000000000000000000000000000000003300000000000000000000000000000000000000000
00700700030000300300003003333300033333000003300000033000003333000033330000000000000000300000000000000000000000000000000000000000
0007700003000030030bb030030000300300003000300300003bb30000300300003bb30000000000000000300000000000000000000000000000000000000000
0007700003000030030bb03003000003030bb00300300300003bb30000300300003bb30000000000000000300000000000000000000000000000000000000000
00700700030000300300003003000030030000300033330000333300000330000003300003000030000000300000000000000000000000000000000000000000
00000000033333300333333003333300033333000000000000000000000000000000000003333330000003300000000000000000000000000000000000000000
__sfx__
0001000032750327001470014700147001470014700147001470014700147001470029700277002370021700027001d7001a7001870013700107000b700077000370000700007000070000700007000070000700
000100003a05000000000002d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
