pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--default functions
function _init()
		//info for the player
		player = {}
			 player.item1 = 0
			 player.room  = 2
		//info for any events
		triggers = {
				key=0,
		}
		//variables for blinking objects
		blinktimer = 15
		swapblinkstate = 1
		blinkmap={001,002}
		//variables for branch dialogue
		dialogueselection = 1
		selectedchoice = 0
		lockchoice = false
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
									"this is test dialogue to ensure\neverything is working",
							},
							choice = {
									"pick up the key",
									"advance dialogue",
									"go to next room"
							},
							followupchoice = {
									{"you have picked up the key."},
									{"this is more test dialogue"},
									{"you move to the next room.",
									"the door is locked"}
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
									"this is room 5"
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
end

function _update()
		//scrolling, we use #string to see length
		if textscroll < #story[player.room].dialogue[1]
		then
				textscroll+=1
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
		//holder for trigger ui
		print("key1: "..triggers.key,8,81)
		//dialogue ui
		rect(5,88,91,123,2)
		//using this to place a grid from the info in room
		for i = 0, 3 do
				for j = 1, 3 do
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
						if (i*3)+j==player.room
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
						elseif room[(i*3)+j]==1
						then
								spr(001,122-(8*j),114-(8*i))
						end
				end
		end
end
-->8
--dialogue page

function dialogue(item) 
		--[[show the main dialogue for the room.
		if we make a selection on side dialogue, then we show the side dialogue
		otherwise, we show the dialogue for the room.
		]]--
		if selectedchoice != 0 
		then
				--[[
				we want to use variant dialogue
				depending on whether we're allowed to do the event
				]]--
				if events(player.room,selectedchoice,1)
				then
						print(sub(item.followupchoice[dialogueselection][1],1,textscroll),3,3)
				else
						print(sub(item.followupchoice[dialogueselection][2],1,textscroll),3,3)		
				end
		else
				print(sub(item.dialogue[1],1,textscroll),3,3)
		end
		
		//only for testing
		print(selectedchoice)
		print(lockchoice)
		
		//we create all possible buttons
		for i = 1, #item.choice+1 do
				//creating buttons
				if item.choice[i]
				then 
		  		print(item.choice[i],8,81+(i*10))
		  		currentsel(i,80,79+(i*10))
				end
		end
		
		//making button functionality
		if btnp(4) then
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
				//events to change room
		end
		
		if not lockchoice
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

function currentsel(currentselect,x,y) 
		if currentselect == dialogueselection
		then
				spr(selectionspr[swapblinkstate],x,y)
		else
				spr(selectionspr[1],x,y)
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
						triggers.key = 1
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
