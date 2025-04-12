pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- default functions
function _init()

		--[[
		important variables to 
		initialize. may be changed
		during testing and as the
		program runs.
		]]--

		--[[
		player_room:
		default = 2
		determines where player is
		]]--
		player_room  = 5
			 
		--[[
		titlecheck:
		are we in the title screen?
		]]--
		titlecheck=false
		
		--[[
		uicolor:
		allows the player to change
		the color of the boxes.
		]]--
		uicolor=2
		textcolor=3
		
		--[[
		the following is a list of 
		room specific variables, to
		check if a player has done
		something. the location of
		where they "are" will be
		commented with this.
		]]--
		
		--[[
		room 2 variables
		
		key1: allows player to move
		to room 5
		]]--
		key1=0
		
		--[[
		room 4 variables
		
		key2: allows player to move
		to room 6
		]]--
		key2=0
		
		--[[
		room 5 variables
		
		journal: marks that the
		player has read the first
		journal entry. best ending is
		only possible if all journal
		entries are read.
		
		entry 1 is in room 5
		
		medicine: medicine that the
		player can pick up. important
		for two possible endings.
		]]--
		journal={0,0}
		medicine=0
		
		--[[
		room 6 variables
		
		shears: allows the player
		to cut plants, and move to
		room 9 and 11.
		
		scanned: checks if the player
		has used the scanner. sucess
		does not matter.
		
		journal entry 2 is here.
		]]--
		shears=0
		scanned=0
		
		--[[
		room history:
		
		allows us to see if we have
		been in a room, what we did
		in the room, and what rooms
		we can see.
		]]--
		previewroom={0,0,0}
		visitedroom={0,0,0,0,0,0,0,0,0,0,0,0}
		visitedsub ={
				{},
				{0,0,0,0,0,0,0},
				{},
				{0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0},
		}
		
		--[[
		animation variables:
		
		allows various sprites to
		appear "animated" during
		gameplay.
		]]--		
		swapblinkstate = 1
		blinktimer = 15
		blinkmap={001,002}
		blinksel={003,004}
		blinkchc={005,006}		
		blinkchc2={007,008}
		
		
		--[[
		dialogue variables:
		
		enables more complex dialogue
		options to better enhance
		the gameplay for the player.
		]]--
		dialogueselection = 1
		selectedchoice = 0
		lockchoice = false
		disable = false
		initialmainval = 1
		textscroll=1
		
		--[[
		story:
		
		holds the array that contains
		the majority of the written
		text in the story, whether it
		be main story dialogue, 
		choices, or the dialogue from
		making a choice.
		]]--
		story = {
		-- [room 1] --
					{
							dialogue = {"this room is intentionally blank"},
							choice = {"nothing"}
					},
  -- [room 2] --
				 {
							dialogue = {
									"life hasn't been particularly kind to you. money's been hard to come by, and it's been difficult getting the money needed for your little sister's medicine.⬇️the odd jobs haven't been doing enough to even keep both of your stomachs filled, you need something that'll get quite a tidy sum for you quickly.",
									"thankfully, an opportunity has provided itself for you. in front of you is an infamous office building, one that held notoriety for it's questionable practices.⬇️even for the buildings in this part of town that were questionable at best, this one was always bad news to be around, even if nothing could be proven.",
								 "last month, an explosion was reported from the inside of the building. not a single inhabitant had been seen since, with most guessing that they had likely perished or fled the city. to be honest, it didn't matter what the truth was. it's not as if it'd be investigated, the police couldn't care less and few had been foolish enough to look around themselves.",
								 "this left you in a unique position. most of the valuables likely had already been taken or destroyed, but there was a chance that there might be something hidden away.⬇️something that nobody else had found just yet.⬇️something that could be your lucky break.",
									"with that thought in mind, you carefully make your way into the building, moving past the barricades that the police had initially put around the building, before they gave up.⬇️a window presents itself to you, and after carefully moving around the broken glass, you're able to hop inside without issue.",
									"the room you found yourself in was a small broom closet, with nothing of value. after a quick check, you carefully step out. as you walk around the place, moving as quiet as a mouse, it's clear that the your initial thoughts were correct.",
									"most of the rooms were either too damaged by the explosion for anything of value to have survived, or they've already been stripped bare by looters.⬇️it's nothing you hadn't already expected, but a tinge of concern taints your heart. only one room remained, and it seemed to be another office.",
									"the room was hit hard by the explosion with burn marks visible all around. it's a miracle that the building didn't collapse, but there seems to be parts that are relatively unaffected. a large desk seem to hold the most promise, and a few other areas hold potential for investigation.",
							},
							choice = {
									"check large desk",
									"look around room."
							},
							followupchoice = {
									{
									  "walking up to the desk, you decide to check it out to see if there's anything worth taking. you don't expect much, considering that this place had likely been searched a number of times. if there were anything worth taking, it would already be gone.",
									  "to your surprise, in one of the half-open drawers, you find a keycard lying there.⬇️a few leaves seem to be next to it, and the card seems to have some green stains.⬇️pocketing the card, you check the rest of the desk to see if there's anything else.",
									  "unfortunately, your search ends in vain as there's nothing else left in the desk.⬇️you managed to get a keycard out of this, and if nothing else it might sell for something to the right people.⬇️finished with the desk, you continue searching around.",
									  "you check the desk again, to see if there was anything you might've missed on your initial sweep. after a few minutes, you find that you were quite thorough the first time, there's nothing left to take. at the very least, you found the peace of mind knowing there's nothing you missed."
									},
									{
									  "you look throughout the broken room. there's a lot to take in, such as the plant life that has won its battle against the odds and found life inside this broken room.⬇️a few minutes pass, and it becomes clear that anything of value or importance is likely already gone, taken by any who had already come before you.",
									  "yet, as you check out the last remaining place, the bookshelf, your finger brushes against a hidden button on its side.⬇️with a mechanical whirr, it sinks into the ground until only the very top is visible.",
									  "in front of you seems to be a larger door, something that wouldn't look out of place in the sci-fi movies that your sister likes watching on her small tv.⬇️looking at it closer, it doesn't have a handle to open it. instead, there's a card reader on the frame of the door.",
									  "you check around the room again. considering that the room isn't small, you might've missed something. you spend a few minutes combing through the room, but what's left is either broken or worthless..."
									}
							}
					},
		-- [room 3] --
					{
							dialogue = {"this room is intentionally blank"},
							choice = {"nothing"}
					},
		-- [room 4] --
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
		-- [room 5] --
					{
							dialogue = {
									"ultimately, you make your way to the base of the stairs without issue.⬇️the sound of water dripping echoes around you, coming from a few pipes leaking fluids around you.⬇️it'll be impossible to keep your shoes dry, as there's more than a few puddles on the floor.",
								 "it's odd, the plant life around you shouldn't have grown so quickly. if it were a few decades, it'd be expected but it's only been a month since that explosion.⬇️some growth could have occurred in that time, but with only a few lightbulbs for light, it doesn't make sense for the plants around you to have gotten so lively. ",
									"the door ahead of you is closed, but it doesn't match the decor of the office above. it's a painfully white door, the type that you'd expect in a hospital or laboratory.⬇️the only color staining the door is a splatter of red and green near the bottom. hesitation grasps your heart at the sight of it.",
									"you could leave now, and it may be the wise decision. still, you need to find something to sell here, otherwise your sister will...⬇️fear is something that must be surmounted, you take a step forward, moving towards the door with a resolute expression.",
									"it's an automatic door, but unsurprisingly it's broken after all this time. it tries to open, but only moves an inch or two before closing.⬇️it takes a few minutes and a spare piece of rebar that you found on the ground, but you force it open. from an initial glance, it seemed that this place was a laboratory after all.",
									"yet, you couldn't be blamed if you weren't sure. after all, the room in front of you has no shortage of plants covering the tables.⬇️if the stairs looked overgrown, then this was a proper jungle! the plants had completely taken over, it's impossible to find a single surface that didn't have some sort of flora growing on it. ",
									"you carefully make your way into the room, trying not to step on any of the plants as you carefully look around.⬇️there's a clear glass window in front of you, showing the room on the otherside... or at least it would. it was completely obscured by the plants on the otherside, with a few cracks at certain points.",
									"looking around the room, it seems there's a lot more to explore than there was upstairs.⬇️with two sets of doors, a few desks and a few computers, you'll have plenty of places to check for salvagable items. one of the desks catches your eye, as you see a book wrapped in vines."
							},
							choice = {
									"check journal",
									"check desks",
								 "check computers",
								 "check glass",
									"enter left door.",
									"enter right door.",
									"go back upstairs.",
							},
							followupchoice = {
									{
									  "it takes some time to pry the journal from the vines, as they had wrapped around it quite tightly. ultimately, you prevail against mother nature, giving the vine a rather triumphant look as you hold your spoils in your hand... though you realize that you're looking rather silly for boasting against a plant.", 
									  "you decide to look through your new book, to see if there's anything inside that can help you find anything of value. a majority of the pages seem to be too stained to be legible, or were ripped out. thankfully, you do happen to find a page that remained legible.",
									  "\"january 5th, 20█\"⬇️\"this journal exists to document the results of our tests, to ensure that we will look over no detail this time. we can't afford to make another blunder like last time. we lost ███ and ██ during the raid last month, and a number of our test subjects with them.\"",
									  "\"it's been difficult finding new test subjects after the loss of our last laboratory, and we can't rely on our previous suppliers due to the risk that they may be comprosed. we're lucky that inne had this building ready in the event of something like this occuring, so our research won't take long to resume.\"",
									  "\"only six of us are left, the rest captured or killed. still, we can't give up on our dream now. we'll surpass the limits of ██ no matter what. we simply need time and resources for it.\"⬇️\"we went to a local ███ today, and it seems that it's not properly by the ██. thankfully, that makes it much easier for us.\"",
									  "\"i don't doubt that if trouble came their way, they'd sell us out... but for now they won't ask any questions. so long as we have the money for it and our papers checked out, we could get as many ██ as needed.\"⬇️\"yet, even with our circumstances, we throw out the thought of any quality control.\"",
									  "\"for our project to succeed, we must have the best of █ best, ██ ███ ██ █\"⬇️\"██ ██ is our hope for ██...\"⬇️the rest of the page is illegible. you hesitantly close the book. this place... what happened here? doubt starts to stain your mind as you look around the room. ",
									  "you flip through the pages to see if there's anything you may have missed in the book, but the rest of the pages are either illegible or have been ripped out.",
									},
									{
									  "you rumage through the desks, trying to see if there's anything valuable within. considering this place is a laboratory, it may be possible that you could find medicine in here.⬇️if that type of medicine was here, it'd save you a lot of trouble. your sister's medication has gotten terribly expensive after all. ",
									  "you do happen across a few vials of marked liquid, but none of them are exactly what she needs.⬇️still, they seem like they're rather valuable, so you make a mental note to take them before you leave as they may be worth some money. taking them now is rather risky, as you don't want to accidentally break them.",
									  ""
									},
									{
										 "you check the computers, but it seems that they're broken. they won't turn on, no matter what you press. considering that the room has a number of puddles, this doesn't come as a huge surprise.⬇️still, it might be worth taking some of the parts, as you know a few people who would want them. you'll have to take them later.",
									 	"you check again to see if the computers might have somehow started working again, but they're still unresponsive.⬇️at any rate, you still plan to strip them for parts before you leave.",
								 },
								 {
									  	"considering that there's a giant pane of glass in front of you, it wouldn't hurt to try and look through it. you spend a few moments trying to look through, but the glass has gotten foggy and the lights don't seem to be on considering it's pitch black in there. all you can manage to see is that there's vines near the glass.",
									  	"you take a second look to see if anything you've done made it more visible.⬇️unfortunately, it didn't and you still can't see anything within."
								 },
									{
									   "you open the left door slowly. it doesn't open easily, you can feel some resistance but it doesn't take much effort to open it. it's a pleasant surprise, considering the state of the facility, it's a miracle that something hadn't fallen over and blocked the door after all. you look inside the room.",
									   ""
									},
									{
									  	"the door on the right side seems to be fully intact. a red light is present above the door. furthermore, there seems to be a card scanner like the door upstairs. you try using the card that you found upstairs, swiping it through. the scanner flashes red and lets out a negative beep. it seems this won't work, you'll have to find a new card.",
									  	"you swipe through the card again, to see if maybe you had done it incorrectly. the scanner rejects this attempt as well. you try once more for good measure, but the scanner flashes red once again. this isn't going to work, in all likelyhood."
									},
									{
									  	"you just came down here. leaving now would be a waste, as you haven't found enough valuables. it may be safer to leave, but your sister needs money for her medicine. you have to keep looking... you can't stop now.",
		-- [gameover 1] --
									  	"it's a painful choice to make, but ultimately you return to the door. whatever's happened down here is out of your league, and the longer you stay, the longer you risk something happening to you. if you got hurt or worse, then your sister would be in just as much trouble. there's safer ways to make money anyhow."
									}
							}
					},
		-- [room 6] --
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
	 -- [room 7] --
					{
							dialogue = {"nothing"},
							choice = {"nothing"}
					},
		-- [room 8] --
					{
							dialogue = {"nothing"},
							choice = {"nothing"}
					},
		-- [room 9] --
					{
							dialogue = {"nothing"},
							choice = {"nothing"}
					},
		}
		
	 --[[
	 currentdialogue:
	 
	 a variable we use in the
	 program to know what the
	 player is reading, and used
	 to avoid overwriting our
	 story dialogue needlessly.
	 
	 it will initially point to
	 the first dialogue box in
	 the room the player starts 
	 in, and will update as the
	 player makes choices.
		]]--
		currentdialogue = 
		story[player_room].dialogue[1]
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

		if titlecheck
		then
				titlescreen()
		else
				dialogue(story[player_room])
				grid()
		end
		ui()
		bugs()
end
-->8
-- ui page

function ui() 		
		--[[
		visual indicators for our
		program. only here for looks
		]]--
		
		--[[
		dialogue box	appearance.
		]]--
		rect(2,2,125,86,uicolor)
		
		--[[
		grid box appearance
		]]--
		rect(98,89,125,124,uicolor)

		--[[
		choice box appearance.
		]]--
		rect(2,89,95,124,uicolor)
end

function grid()
		--[[
		it's important to show
		where the player is on the
		map.
		
		with how our program works,
		we can check each room and
		see if we've been in them yet.
		]]--	
		for row = 0, 4 do
				for column = 1, 3 do
						placement = (row*3)+column
						if placement==player_room
						then
							spr(blinkmap[swapblinkstate],
							92+(8*column),115-(8*row))
						elseif visitedroom[placement]==1
						then
								spr(001,92+(8*column),
								115-(8*row))
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
		--[[
		blinkers to indicate
		that there are more than
		three choices available.
		]]--
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
				  		15,82+(i*10),textcolor)
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
															
				if not disable and textscroll == #splitdialogue(currentdialogue)
				then
			   movecursor(item)
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

function movecursor(item)
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
--[[
change false to true if
i need to test a variable
]]--
		if false
		then
				print("text scroll: "..textscroll,20,116,textcolor)
    print("limit: "..#splitdialogue(currentdialogue),20,108,textcolor)
		end
end
-->8
-- dialogue page

--[[
show the current dialogue for 
the room, whether it is the
current dialogue or main.
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
				displaydialogue(
				item.followupchoice[selectedchoice],
				visitedsub[player_room]
				[dialogueselection]==0,1)
		--[[
		this area is for the main
		dialogue, i.e the dialogue
		that by default in a room, 
		such as when you enter or
		re-enter it.
		]]--
		else
				if visitedroom[player_room] == 0
				then
						lockchoice = true
						disable = true
				end
				displaydialogue(
				item.dialogue,lockchoice)
		end

		--in ui page
		choices(item)

		--give better notes
		if btnp(4) 
		and textscroll == 
		#splitdialogue(currentdialogue) 
		and not disable
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
				print(sub(splitdialogue
				(currentdialogue),1,
				textscroll),6,6,3)
				
				sound(splitdialogue(currentdialogue))		
		--[[
		we have it set so the dialogue can
		only be advanced once we have reached
		the end of the paragraph, and that
		the button is pressed.
		]]--
				if btnp(4)	
				and textscroll==
				#splitdialogue(item[initialmainval])
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
				 					visitedroom[player_room] = 1
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
				print(sub(splitdialogue(currentdialogue),
				1,textscroll),6,6,3)
				sound(splitdialogue(currentdialogue))
		end
end
-->8
-- event tracker

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
		
		visitedsub[player_room][selectedchoice] = 1
		
		if player_room == 2
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
						"after using the keycard, the door opens and a small cloud of mist disperses into the room. you can smell fresh plant life around you as you step inside. a faint light illuminates the room, showing a spiral staircase that goes deep into the ground. if there was anything of value, it'd be down there. seeing no other option, you descend the stairs",
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
						story[2].choice[3] = "open the door"
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
									"try as you might, the door to the next room is closed quite tightly. you can't try the keycard reader currently, as you don't have a card.⬇️you're not one to give up easily however, and you try to pry open the door with a spare piece of metal that had been lying around.",
									"you spend a few minutes trying to use the metal bar to open the door, but it's not budging.⬇️the only result you gain is the gift of pain, as you accidentally hit your leg with the metal during your attempts. letting out a grunt of pain, you come to the realization that you'll need to find a keycard somewhere...",
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
								player_room = 5
								previewroom[2] = 1
						else
								story[2].followupchoice[3] = {
										"you were never quick to give up. you pick up that same piece of metal and try again, working a different angle to open the door.⬇️a few minutes pass, but you're no closer to opening that door while your arms are ready to throw in the towel. it's becoming clearer that you're going to need a keycard.",
										""
								}
								visitedsub[2][3] = 0
						end					
				end
				
		--[[
		room 3
		
		intentionally omitted, due
		to the facility's layout
		not showing one.

		]]--	
			
		--[[
		room 4
		]]--
		elseif player_room == 4
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
						player_room = 5
				end
	
		--[[
	 room 5
		]]--
		elseif player_room == 5
		then
				if selectedchoice == 1
				then
						journal[1] = 1
				end
				if selectedchoice == 2
				then
						if medicine == 0
						then	
								medicine = 1
								story[5].followupchoice[2] = {
									"thinking about it more, you decide to pocket them for now, as you might forget about it when you're getting ready to leave. you pocket the medicine with that, putting them in your satchel.",
									"you check the various desks some more, but there doesn't seem to be anything else worth taking right now."
								}
							 visitedsub[5][2] = 0	
						elseif medicine == 1
						then
								medicine = 2
						end
				end
			 if selectedchoice == 5
		  then
						player_room = 4
				end
				if selectedchoice == 6 
				and key2 == 1
				then
						player_room = 6
				end
		
		--[[
	 room 6
		]]--
		elseif player_room == 6
		then
				if selectedchoice == 4
				then
						journal[2] = 1
				end
				if selectedchoice == 5
				then				
						shears = 1
						visitedsub[6][6] = 0						
						if scanned == 1 
						and journal[2] == 1
						then								
								story[6].followupchoice[6] = {
								"you step into the scanner, shears in hand. the journals had noted that this 'evaconvolvulus' seems to be plant matter. knowing this, you crouch down towards the vines on the ground. you already checked that there wasn't anything like that stuck to your clothes, so it must be this.",
								"with some regret in your heart, you trim away at the vines, cutitng through them cleanly until you've clipped all of them. you pick up the remains and toss them out of the scanner. you couldn't get it perfectly, as they seemed to originate from a small crack in the floor, but you've gotten as much as you can.",
								"you press the button again, to see if you'll get a better result this time. the laser comes down again, following the proper path. you close your eyes before the lasers blind you, and after a few moment the scan completes. you open your eyes as the glass door ahead of you finally opens, revealing the now unlocked doorway to the next room.",
								"carefully, you step through into the next room.",
								""
								}
						elseif scanned == 0 
						and journal[2] == 1
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
								player_room = 9
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
		while we can dynamically
		calculate the size of our
		string to know how long it
		is, and how long we should do
		this for, we know that if it
		activates more than 13 times
		we have an issue as it'll run
		off the text. similarly:
		it won't display anything if
		we do it too much, so for now
		we have it set to run 13 times.
		]]--
		
		for i=0,13 do
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
			we should make
			an exception manager, in the
			event that an word is close
			to the right edge, and the
			addition of ⬇️ would make
			it go to the next line, then
			we need to put this exception
			into here, or it'll get weird.
			
			i plan to look at the linewrap
			formula next to see if i can
			fix this without needing an
			exception like this, bandaids
			aren't ideal after all.
			]]--
								--print(j,4,110)
								if j>setlength-1
								then
										for k=1,length-j do
												if sub(input,length-k,length-k)==" "
												then
														--print(k,28,110)
														emptystrsize=k
														break
												end
										end
								else
										emptystrsize=j
								end
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
				  		..sub(emptystr,emptystrsize)
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
-->8
-- title screen

function titlescreen()
				
		title = {
				dialogue = {
						"press z to continue or select. press x to fast forward text.",
						"what would you like to do? "
				},
				choice = {
						"start new game",
						"load game",
						"options"
				},
				followupchoice = {
						{""},
						{""},
						{"please select what you would like to change.⬇️text color: change the color of the text.⬇️border color: change the color of the border.⬇️sound: adjust volume."}
				}
		}
		
		currentdialogue = 
		title.dialogue[1]

		
		dialogue(title)
		choices(title)
		
		--[[
		temp check to bring player
		out of title screen
  ]]--
		if btnp(4)
		then
				titlecheck = false		
				currentdialogue = 
		  story[player_room].dialogue[1]
				textscroll=0
		end		
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
