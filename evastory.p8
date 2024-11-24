pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--default functions
function _init()
		//if i need to bugtest
		bugtesting = false
		//info for the player
		player = {}
			 player.item1 = 0
			 player.room  = 2
		//info for any events
		triggers = {
				key=0,
		}
		//info so we understand which rooms we've been in
		visitedroom={0,0,0,0,0,0,0,0,0}
		//variables for blinking objects
		blinktimer = 15
		swapblinkstate = 1
		blinkmap={001,002}
		//variables for branch dialogue
		dialogueselection = 1
		selectedchoice = 0
		lockchoice = false
		//variables for long main dialogue
		disable = false
		initialmainval = 1
		selectionspr={003,004}
		//test
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
									"you've heard plenty of rumors\nabout the abandoned apartment\ncomplex on the edge of town.\n          \nthere was an explosion a year\nago that killed a number of\npeople, and ever since then\nthe complex was abandoned.\n          \nthere were countless rumors\nabout what had happened.",
									"one rumor had it that it was a\ndrug operation that went south.\n          \nanother rumor had it that\nit was a terrorist group that\nwas trying to make a bomb but\nended up blowing themselves up\non accident.\n          \nthere was even a rumor that it\nwas a spy base that was\ndiscovered, and it blew up as\na safety precaution.",
							  "whatever the case, the owners\nabandoned it. it was put under\ninvestigation for a time by the\npolice, but nothing turned up.\n          \nstill, it always felt odd to\nyou and before you realized it,\nyou had found yourself outside\nof the broken doors of the\ninfamous facility.\n          \nyou walk inside carefully,\nfeeling your curiousity grow."
							},
							choice = {
									"pick up the key",
									"advance dialogue",
									"go to next room"
							},
							followupchoice = {
									{
									"you have picked up the key.",
									"there is nothing left to pick up."
									},
									{"this is more test dialogue"},
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
		if textscroll < #currentdialogue
		then
				textscroll+=0.5
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

function bugs()
		//only for testing, change for various varriables
		if bugtesting
		then
				print("value of space: "..ord(","),8,53)
				print("locked choice: "..tostr(lockchoice),8,60)
				print("dialogue length: "..#currentdialogue,8,67)
				print("text scroll: "..textscroll,8,74)
				print("key1: "..triggers.key,8,81)
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
		we want to use variant dialogue
		depending on whether we're allowed to do the event
		]]--
		if selectedchoice != 0 
		then
				if events(player.room,selectedchoice,1)
				then
						currentdialogue = item.followupchoice[dialogueselection][1]
				else
						currentdialogue = item.followupchoice[dialogueselection][2]
				end			
				displaydialogue(currentdialogue)
		--[[
		if we're in the main dialogue,
		we want to only display the
		full dialogue if it's our first visit
		to that room
		]]--		
		else	
				//if we haven't been here yet
				if visitedroom[player.room] == 0
				then
						//disable other functions, and display the dialogue from the start
						disable = true
						displaydialogue(item.dialogue,false)
				else
						--[[
						otherwise, we've seen this room's dialogue before, 
						and don't need to repeat it
						]]--
						currentdialogue = item.dialogue[#item.dialogue]
						displaydialogue(currentdialogue)
				end
		end
		
		//if we're allowed to look at the branching dialogues
		if not lockchoice
		then
				//we create all possible buttons
				for i = 1, #item.choice+1 do
						//creating buttons
						if item.choice[i]
						then 
				  		print(item.choice[i],8,81+(i*10))
				  		currentsel(i,80,79+(i*10),textscroll == #currentdialogue)
						end
				end
		else
				//otherwise, we just put down a 'continue' the player can press when the dialogue is complete.
				print("continue",8,91)
				currentsel(dialogueselection,80,89,textscroll == #currentdialogue)
				//also, reset the selection since it was taken away
		end
				
		//make branching dialogue events occur
		if btnp(4) and textscroll == #currentdialogue and not disable
		then
				//reset the text scroll for new dialogue
				textscroll = 0
				--[[ we run a check: if selection is 0, it means 
				we're in the main dialogue, so pressing the button means we're
				making a choice, so we'll lock our ability to choose otherwise temporarily
				and make our choice what we selected. this allows us
				to tell the system that if we picked option 1
				that it should give us the corresponding dialogue
				for option 1.
				otherwise, we simply tell the system to put
				us back on the main dialogue for now.
				in the future: we will also use this as a chance to update
				our events and triggers to allow us
				to move rooms, or get items.
			 ]]--
				if selectedchoice == 0
				then 
						lockchoice = true
						selectedchoice = dialogueselection
				elseif selectedchoice == dialogueselection
				then
						events(player.room,selectedchoice)
						lockchoice = false
						selectedchoice = 0
				end
		end

		//enable us to scroll between the options.
		if not lockchoice and not disable
		then
				if btnp(3) and dialogueselection < #item.choice
				then
						dialogueselection += 1
				elseif btnp(2) and dialogueselection > 1
				then
						dialogueselection -= 1
				end
		end
end



//help show off the correct selection
function currentsel(currentselect,x,y,tf) 
		--[[
		we're running two checks:
		is this the current selection
		is the dialogue finished displaying
		if both are correct, then we will make it blink
		otherwise, we display normally
		]]--
		if (currentselect == dialogueselection) and tf and not disable
		then
				spr(selectionspr[swapblinkstate],x,y)
		else
				spr(selectionspr[1],x,y)
		end
end



function displaydialogue(dial,branch)
		//if this is the main dialogue		
		if branch == false
		then
				//if we haven't fully displayed this dialogue yet
				if visitedroom[player.room] == 0
				then
						//we display the initial dialogue
						print(sub(dial[initialmainval],1,textscroll),3,3)
						sound(dial[initialmainval])
						//when the player presses the button, it advances the dialogue
						if btnp(4) and textscroll == #currentdialogue
						then 
								textscroll = 0
								--[[
								we check to see if the player is 
								reaching the end of the dialogue.
								we do this by seeing if
								the next dialogue will be the
								final one.
								]]--
								if #dial > initialmainval+1
								then
										//if not, keep going
										initialmainval += 1
										currentdialogue = dial[initialmainval]
								else
										//if so, reset values and mark that we saw this room's dialogue
										initialmainval = 1
										visitedroom[player.room] = 1
										disable = false
								end
						end
				else
						//if we've been here already, just display the final dialogue
						print(sub(dial[#dial],1,textscroll),3,3)
						sound(dial[#dial])
				end
		//in all other cases, just display it normally
		else
				print(sub(dial,1,textscroll),3,3)
				sound(dial)
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
]]--

function events(place,choice,check)
		if place == 2
		then
				if choice == 1
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
								//we see if we're just checking if we have the key
								if check == 1
								then
										//we have it and say so
										return true
								else
										//we use the key
										player.room = 5
								end
						else
								//we are keyless. possibly kingdom heartless as well
								return false
						end					
				end
		end
		return true
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
