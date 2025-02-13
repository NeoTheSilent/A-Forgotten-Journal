pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--default functions
function _init()
		//info for the player
		player = {}
			 player.room  = 2
		//info for the events
		triggers = {}
				triggers.key=0
		//info so we understand which rooms we've been in
		visitedroom={0,0,0,0,0,0,0,0,0}
		visitedsub ={
				{},
				{0,0,0},
				{0,0,0},
				{0,0,0},
				{0,0,0},
				{0,0,0},
				{0,0,0},
				{0,0,0},
				{0,0,0},
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
					//room 1 information
					{
							dialogue = {"nothing"},
							choice = {"nothing"}
					},
					//room 2 information
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
									"look around room.",
									"go to next room"
							},
							followupchoice = {
									{
									"you look around the rugged front desk, seeing if there was anything worth salvaging inside of it. despite not expecting much, as you open it up, you notice that the back of the drawer seems broken, revealing that there's a hidden compartment.",
									"it's difficult feeling around for whats inside of it, and ultimately your efforts break the already decaying entrance of the compartment open. within is a keycard stained green. seeing nothing else within, you take the keycard in case it may be helpful later.",
									"there is nothing left inside of the front desk."
									},
									{
									"you look throughout the broken room. there's a lot to take in, such as the plant life that has won its battle against the odds and found life inside this broken room.",
									"after spending a few minutes scavenging the place, its clear that anything of value or importance is likely already gone, taken by any who had already come before you.",
									"if nothing else, you had some fun while you were doing it, so it's not like this was a complete waste.",
									"you check around again, but there's still not much of note."
									},
									{
									"you move to the next room.",
									"the door is locked"
									}
							}
					},
					//room 3 information
					{
							dialogue = {"nothing"},
							choice = {"nothing"}
					},
					//room 4 information
					{
							dialogue = {"nothing"},
							choice = {"nothing"}
					},
					//room 5 information
					{
							dialogue = {
									"this is room 5",
									"this is the final room 5 dialogue"
							},
							choice = {
									"option 1",
									"option 2",
									"option 3",
							},
							followupchoice = {
							"choice 1",
							"choice 2",
							"choice 3",
							}
					},
					//room 6 information
					{
							dialogue = {"nothing"},
							choice = {"nothing"}
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
		//holder for room ui
		rect(96,88,123,123,2)

		//dialogue ui
		rect(5,88,91,123,2)
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
							spr(blinkmap[swapblinkstate],122-(8*j),114-(8*i))
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
								spr(001,122-(8*j),114-(8*i))
						end
				end
		end
end


function selection(currentselection,x,y,binary) 
		--[[
		a function to ensure that only
		the correct option should blink
		in this case, this means that
		what the player is choosing to
		do will blink.
		]]--
		if currentselection == dialogueselection and binary
		then
				spr(blinksel[swapblinkstate],x,y)
		else
				spr(blinksel[1],x,y)
		end
end

//function to make sound happen as dialogue plays
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

function choices(item)
		--[[
		we must check to see if our
		choices are currently locked.
		if they are, we can't do
		anything. hence, lockchoice
		]]--
		if not lockchoice
		then
				--[[
				we use a for loop to display
				all possible choices, though
				for most cases, it should
				only be 2 or 3
				
				we print out the choice,
				then we print out the button
				that allows it to blink if
				we're selecting it or not.
				]]--
				for i = 1, #item.choice+1 do
						if item.choice[i]
						then 
				  		print(item.choice[i],8,81+(i*10))
				  		selection(i,80,79+(i*10),textscroll == #splitdialogue(currentdialogue))
						end
				end
				--[[
				this also allows us to choose
				what branching path we wish to
				explore. we can only explore if
				the dialogue has finished displaying
				]]--
				if not disable and textscroll == #splitdialogue(currentdialogue)
						then
						if btnp(3) and dialogueselection < #item.choice
						then
								dialogueselection += 1
						elseif btnp(2) and dialogueselection > 1
						then
								dialogueselection -= 1
						end
				end
		else
				--[[
				if we're locked in the main
				dialogue, we'll put in a 
				simple 'continue' button
				to allow the player to 
				move through the dialogue.
				]]--
				print("continue",8,91)
				selection(1,80,89,textscroll == #splitdialogue(currentdialogue))
		end
end

function bugs()		
		if true
		then
				print("textscroll: "..textscroll,8,70)
				print("#currentdialogue: "..#splitdialogue(currentdialogue),8,76)
				--print("initmain: "..initialmainval,8,82)
				print("room 2 choices: "..visitedsub[2][1].." "..visitedsub[2][2].." "..visitedsub[2][3],8,82)
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
				print(sub(splitdialogue(currentdialogue),1,textscroll),3,3)
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
				 					events(player.room,selectedchoice)
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
		]]--		
				currentdialogue = item[#item]
				print(sub(splitdialogue(currentdialogue),1,textscroll),3,3)
				sound(splitdialogue(currentdialogue))
		end
end
-->8
--event tracker

--[[
this is probably spaghetti code
but it works for my purposes.
hopefully.

the three variables are the place
that the player is in. even though
we will always use player.room,
it's less tokens in the long run
to shorten it here.

variable 2 is choice, so we know
what the current choice is. thus: with
the place and the choice, we can
create custom events for each room!
i'll likely have to revamp it later,
but it works for now.

check is the final variable that's used
more as a way to "check" if an
event is valid. as an example,
to move from room 2 to room 5,
you must have the first key.
i use check on my first events
dialogue to know if i should 
display success or fail dialogue
doing this, it won't update the flags
prematurely, which is important as
if it did update the flag, i would
go straighto room 5's choice 3
dialogue and event, despite not
selecting it.

similarly, later on in dialogue,
once the conditions are met, i'll
then actually update the event once
i've done what i want first, so it
won't display incorrectly.


this is the next fix priority
if we can do this, then we are
essentially finished giving this
a 'brain' and can focus on story
]]--
function events(check)
		
		visitedsub[player.room][selectedchoice] = 1
		
		if player.room == 2
		then
				if selectedchoice == 1
				then
						//did we pick-up the key
						if triggers.key == 0
						then
								//we see if we're just checking if we have the key
								if check == 1
								then
										//we tell the dialogue we can pick up the key
										return true
								else
										//we use the key
										triggers.key = 1
								end
						else
								//we already have the key
								return false		
						end
				elseif choice == 2
				then
				--[[
				nothing happens, just reading
				]]--
				elseif choice == 3
				then
						//we see if we have the key
						if triggers.key == 1
						then
						//we use the key
								player.room = 5
						else
								//we are keyless. possibly kingdom heartless as well
								return false
						end					
				end
		end
		return true
end
-->8
-- dialogue splitter

function splitdialogue(input)
		--[[
		this function exists to 
		automatically add the breakline
		to a given string, so we won't
		need to do it manually, as it's
		tedious. we take a given string
		and we can make it add a new
		line with any posotive number
		for the sentence length

		our length must be 1 higher than
		what we want. this is because
		we're adding the newline
		character "\n" at the end of
		every sentence, and thus
		must accomodate for it.
		
		the second value will update
		dynamically once the loop starts
		but we wish to keep the first
		number the same incase we wish
		to change how long it is.
		]]--
		setlength=31
		length=setlength
		--[[
		we dynamically calculate the 
		length of the string and divide
		it by our length to know how
		many rows we want, and thus
		how many newlines we'll add
		]]--
		
		for i=0,ceil(#input/setlength) do
		--[[
		we must also check before we
		insert the newline if we'll
		cut off a word by doing this.
		if the given character isn't
		an empty space, we'll run a
		check and simply adjust where
		we put the new line. i.e:
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
										length-=j-1
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
				temporary = sub(input,1,length-1).."\n"..sub(input,length)
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
00000000033333300333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700030000300300003003333300033333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700003000030030bb03003000030030000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700003000030030bb03003000003030bb0030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700030000300300003003000030030000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000033333300333333003333300033333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000032750327001470014700147001470014700147001470014700147001470029700277002370021700027001d7001a7001870013700107000b700077000370000700007000070000700007000070000700
