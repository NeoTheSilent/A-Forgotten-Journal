pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- default functions
function _init()

proom=5
tcheck=true
tpick=0
clr={2,3,1}
clw={"ui","text","background"}
bckclr=1
--
key1=0
key2=0
jrnl={0,0}
meds=0		
shears=0
scan=0
--
prevu={0,0,0}
vroom={0,0,0,0,0,0,0,0,0,0,0,0}
vsub={
{},
{0,0,0},
{},
{0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
}	
--
sbs=1
btime=0
bmap={001,002}
bsel={003,004}
bup={005,006}		
bdn={007,008}
--
dsel=1
csel=false
lock=false
imv=1
scrl=1
--
story={
--room1
{},
--room2
{
main={
"life hasn't been particularly kind to you. money's been hard to come by, and it's been difficult getting the money needed for your little sister's medicine.⬇️the odd jobs haven't been doing enough to even keep both of your stomachs filled, you need something that'll get quite a tidy sum for you quickly.",
"thankfully, an opportunity has provided itself for you. in front of you is an infamous office building, one that held notoriety for it's questionable practices.⬇️even for the buildings in this part of town that were questionable at best, this one was always bad news to be around, even if nothing could be proven.",
"last month, an explosion was reported from the inside of the building. not a single inhabitant had been seen since, with most guessing that they had likely perished or fled the city. to be honest, it didn't matter what the truth was. it's not as if it'd be investigated, the police couldn't care less and few had been foolish enough to look around themselves.",
"this left you in a unique position. most of the valuables likely had already been taken or destroyed, but there was a chance that there might be something hidden away.⬇️something that nobody else had found just yet.⬇️something that could be your lucky break.",
"with that thought in mind, you carefully make your way into the building, moving past the barricades that the police had initially put around the building, before they gave up.⬇️a window presents itself to you, and after carefully moving around the broken glass, you're able to hop inside without issue.",
"the room you found yourself in was a small broom closet, with nothing of value. after a quick check, you carefully step out. as you walk around the place, moving as quiet as a mouse, it's clear that the your initial thoughts were correct.",
"most of the rooms were either too damaged by the explosion for anything of value to have survived, or they've already been stripped bare by looters.⬇️it's nothing you hadn't already expected, but a tinge of concern taints your heart. only one room remained, and it seemed to be another office.",
"the room was hit hard by the explosion with burn marks visible all around. it's a miracle that the building didn't collapse, but there seems to be parts that are relatively unaffected. a large desk seem to hold the most promise, and a few other areas hold potential for investigation.",
},
choice={
"check large desk",
"look around room."
},
brnch={
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
--room3
{},
--room4
{
main={
"similar to the last room, there were plenty of plants within here, though these were in glass containers instead. to your surprise, the flora seemed to glow ever so slightly.⬇️as you walk in, a quiet alarm goes off. after a few moment, a gentle mist of water sprays onto the plants. ",
"a few dull monitors adorned the room, as well as a few cabinets... though no exit door could be seen. if you wanted to go deeper in, you likely needed to enter the right door.",
"your sister is counting on you, you needed to find something to salvage from this place.⬇️if nothing could be salvaged, then you won't be able to afford her medicine and she'd...⬇️at any rate, there's a few things worth checking here. ",
},
choice={
"check cabinets",
"check doors",
"leave the room."
},
brnch={
{"the cabinets are in a rather sorry state, banged up from having fallen over. thankfully, they seem to be unlocked, so opening it isn't an issue. there's plenty in here, though you're not exactly sure what much of it is. ultimately, the only thing you take from the cabinet is a keycard marked with the number marked 6 on it.",
"you take a second look to be extra safe. while you do find some scientific instruments that could sell for a pretty penny, there's nothing useful for you at the moment here. you make a mental note to return before you leave."},
{"you look throughout the broken room. there's a lot to take in, such as the plant life that has won its battle against the odds and found life inside this broken room.",
"after spending a few minutes scavenging the place, its clear that anything of value or importance is likely already gone, taken by any who had already come before you.",
"if nothing else, you had some fun while you were doing it, so it's not like this was a complete waste.",
"you check around again, but there's still not much of note."},
{"you walk out of the room, careful not to bump into anything on the way out. as you step through the door, you're careful to leave it open slightly, on the off chance that closing it could get the door stuck.",
"",}
}
},
--room5
{
main={
"ultimately, you make your way to the base of the stairs without issue.⬇️the sound of water dripping echoes around you, coming from a few pipes leaking fluids around you.⬇️it'll be impossible to keep your shoes dry, as there's more than a few puddles on the floor.",
"it's odd, the plant life around you shouldn't have grown so quickly. if it were a few decades, it'd be expected but it's only been a month since that explosion.⬇️some growth could have occurred in that time, but with only a few lightbulbs for light, it doesn't make sense for the plants around you to have gotten so lively. ",
"the door ahead of you is closed, but it doesn't match the decor of the office above. it's a painfully white door, the type that you'd expect in a hospital or laboratory.⬇️the only color staining the door is a splatter of red and green near the bottom. hesitation grasps your heart at the sight of it.",
"you could leave now, and it may be the wise decision. still, you need to find something to sell here, otherwise your sister will...⬇️fear is something that must be surmounted, you take a step forward, moving towards the door with a resolute expression.",
"it's an automatic door, but unsurprisingly it's broken after all this time. it tries to open, but only moves an inch or two before closing.⬇️it takes a few minutes and a spare piece of rebar that you found on the ground, but you force it open. from an initial glance, it seemed that this place was a laboratory after all.",
"yet, you couldn't be blamed if you weren't sure. after all, the room in front of you has no shortage of plants covering the tables.⬇️if the stairs looked overgrown, then this was a proper jungle! the plants had completely taken over, it's impossible to find a single surface that didn't have some sort of flora growing on it. ",
"you carefully make your way into the room, trying not to step on any of the plants as you carefully look around.⬇️there's a clear glass window in front of you, showing the room on the otherside... or at least it would. it was completely obscured by the plants on the otherside, with a few cracks at certain points.",
"looking around the room, it seems there's a lot more to explore than there was upstairs.⬇️with two sets of doors, a few desks and a few computers, you'll have plenty of places to check for salvagable items. one of the desks catches your eye, as you see a book wrapped in vines."},
choice={
"check journal",
"check desks",
"check computers",
"check glass",
"enter left door.",
"enter right door.",
"go back upstairs."},
brnch = {
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
--gameover1
"it's a painful choice to make, but ultimately you return to the door. whatever's happened down here is out of your league, and the longer you stay, the longer you risk something happening to you. if you got hurt or worse, then your sister would be in just as much trouble. there's safer ways to make money anyhow."
}
}
},
--room6
{
main={
"similar to before, a mist comes out the door as it unlocks. it's hard to control this feeling of dread that's growing inside of you. you can't help but shake the feeling that you're being watched. you've seen a few cameras in the previous rooms, but none of them appeared to be working. it's different, something else may be looking... at least, that's what it feels like.",
"perhaps your mind is playing tricks on you. it's unlikely that anyone could still be here after all this time, with the place in this condition. if there were anyone, you should've seen them by now. outside of the plants you've found, there's been no evidence of anything else.",
"at any rate, you can't leave now. you haven't found anything yet that makes this investigation worth it. there should be something valuable that you could take here, whether it's equipment or some information you could sell. with some luck, it'll be enough to keep you and your sister fed for a long time.",
"summoning your own courage, you step inside the now unlocked room. not knowing what to expect, you carefully survey your surroundings. this room appears to be a decontamination room. there's a few hazmat suits along the wall with a compact shower next to it. you can also see a larger scanner. it's rather large, and the only way to get to the door is to walk through it.",
"you can also notice that there are two larger desks in the room, and that the scanner on the other doorway seems to have something on it's display. there also seems to be a few lockers along the opposite wall from your doorway.",
"carefully walking around the room, you start to take a closer look at your surroundings."
},
choice={
"check hazmat suits",
"check shower",
"check smaller desk.",
"check larger desk.",
"check lockers",
"enter the scanner."},
brnch = {
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
							main = {"nothing"},
							choice = {"nothing"}
					},
		-- [room 8] --
					{
							main = {"nothing"},
							choice = {"nothing"}
					},
		-- [room 9] --
					{
							main = {"nothing"},
							choice = {"nothing"}
					},
		}
		
		--[[
		an array containing info
		that is only relevant for
		the title screen.
		]]--		
		title = {
				main={"."},
				choice = {
						"start new game",
						"load game",
						"options"
				},
				options = {
				  "use the arrow keys to change your settings, and press z when you are done."
				}
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
		story[proom].main[1]
end

function _update()
		//scrolling, we use #string to see length
		if scrl < #splitdialogue(currentdialogue)
		then
				scrl+=0.5
				//skip dialogue button
				if btnp(5)
				then
						scrl = #splitdialogue(currentdialogue)
				end
		end

if btime>0 then btime-=1
elseif btime==0 then
	if sbs==2 then
		sbs=1
	else
		sbs=2
	end
	btime=15
end

end

function _draw()

cls()
rectfill(0,0,128,128,bckclr)

if tcheck
then
	titlescreen()
else
 dialogue(story[proom])
	grid()
end

ui()
bugs()
end
-->8
--ui page

function ui()

rectfill(0,0,128,2,clr[3])
rectfill(0,0,2,128,clr[3])
rectfill(0,86,128,89,clr[3])
rectfill(95,86,97,128,clr[3])
rectfill(0,124,128,128,clr[3])
rectfill(125,0,128,128,clr[3])

--[[
dialogue box	appearance.
]]--
rect(2,2,125,86,clr[1])
		
		--[[
		grid box appearance
		]]--
		rect(98,89,125,124,clr[1])

		--[[
		choice box appearance.
		]]--
		rect(2,89,95,124,clr[1])
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
		for r = 0, 4 do
				for c = 1, 3 do
						placement = (r*3)+c
						if placement==proom
						then
							spr(bmap[sbs],
							92+(8*c),115-(8*r))
						elseif vroom[placement]==1
						then
								spr(001,92+(8*c),
								115-(8*r))
						end
				end
		end

		--[[
		used to preview rooms, '
		i.e: let the player know that
		a given room exists
		]]--
		if prevu[1] == 1
		then
				spr(009,108,107)
		end
		if prevu[2] == 1
		then
				spr(009,108,99)
				spr(010,100,107)
				spr(010,116,107,1,1,1)
		end
end

function blink(b,c1,c2,x,y)
 if c1 and c2 then
		spr(b[sbs],x,y)
	else
		spr(b[1],x,y)
 end
end

function choices(item)
		//
		if not lock
		then
		--[[
		blinkers to indicate
		that there are more than
		three choices available.
		]]--
				if #item.choice > 3
				then
						blink(bup,
						dsel>1,
						scrl == #splitdialogue(currentdialogue),
						4,117)
						blink(bdn,
						dsel<#item.choice,
						scrl == #splitdialogue(currentdialogue),
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
if dsel>2
then
over3=dsel-3
else over3=0
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
				  		15,82+(i*10),clr[2])
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
				  		blink(bsel,
				  		i+over3==dsel,
				  		scrl == #splitdialogue(currentdialogue),
				  		5,80+(i*10))
				end
															
				if not disable and scrl == #splitdialogue(currentdialogue)
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
				blink(bsel,
				true,
				scrl == #splitdialogue(currentdialogue),
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
if btnp(3) and dsel<#item.choice
then
dsel+=1
sfx(01)
elseif btnp(2) and dsel>1
then
dsel-=1
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
  if ord(string[scrl])!=(32 or 44 or 46)
  and ord(string[scrl-1])!=(32 or 44 or 46)
  and scrl != #string
  and scrl % 1 == 0
		then
				sfx(00)
		end
end

function bugs()		
 if false then
	 print("csel: "..csel,5,80,clr[2])
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

if csel then
	ddial(item.brnch[dsel],
	vsub[proom][dsel]==0,1)
else
	if vroom[proom] == 0
	then
		lock=true
	end
	ddial(item.main,lock)
end

if btnp(4)
and scrl==#splitdialogue(currentdialogue)
then
	scrl=0
	lock=not lock
	csel=not csel
end

choices(item)

end

function ddial(item,binary,branch)
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
	 		currentdialogue = item[imv]
				print(sub(splitdialogue
				(currentdialogue),1,
				scrl),6,6,clr[2])

				sound(splitdialogue(currentdialogue))
		--[[
		we have it set so the dialogue can
		only be advanced once we have reached
		the end of the paragraph, and that
		the button is pressed.
		]]--
				if btnp(4)	
				and scrl==
				#splitdialogue(item[imv])
				then 
		--[[
		once we move to the next 
		paragraph, we should start from
		the beginning of the next
		sentence, hence we reset the
		textscroll, which dictates
		where we are in the sentence.
		]]--
						scrl = 0
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
						if #item-1 > imv
						then
								imv += 1
				 	else
				 			if branch
				 			then
				 					events()
				 					csel=false
				 			else
				 					vroom[proom] = 1
								end
								imv=1
								lock=false
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
				1,scrl),6,6,clr[2])
				sound(splitdialogue(currentdialogue))
		end
end
-->8
-- event tracker

function events()

vsub[proom][dsel]=1

--room2--
if proom == 2
	then
	if dsel==1 then
		key1 = 1
		story[2].followupchoice[3] = {
		"after using the keycard, the door opens and a small cloud of mist disperses into the room. you can smell fresh plant life around you as you step inside. a faint light illuminates the room, showing a spiral staircase that goes deep into the ground. if there was anything of value, it'd be down there. seeing no other option, you descend the stairs",
		"you slowly make your way down the stairs, being as careful as you can. each step causes the stairs to let out an awful creak, and whether it'll be from the stair underneath you breaking or tripping on an errant vine, a fall from here wouldn't be pretty.",
		""}
	elseif dsel==2
		then
		story[2].choice[3]="open the door"
		prevu[1]=1
		if key1==0	then
			story[2].followupchoice[3] = {
				"try as you might, the door to the next room is closed quite tightly. you can't try the keycard reader currently, as you don't have a card.⬇️you're not one to give up easily however, and you try to pry open the door with a spare piece of metal that had been lying around.",
				"you spend a few minutes trying to use the metal bar to open the door, but it's not budging.⬇️the only result you gain is the gift of pain, as you accidentally hit your leg with the metal during your attempts. letting out a grunt of pain, you come to the realization that you'll need to find a keycard somewhere...",
				"",}
		end
	elseif dsel==3 then
		if key1==1 and vsub[2][3]==1 then
		 proom=5
		 prevu[2]=1
  else
		 story[2].followupchoice[3]={
		 	"you were never quick to give up. you pick up that same piece of metal and try again, working a different angle to open the door.⬇️a few minutes pass, but you're no closer to opening that door while your arms are ready to throw in the towel. it's becoming clearer that you're going to need a keycard.",
		 	""}
		 vsub[2][3]=0
	 end					
	end
--room 3--
--room 4--
elseif proom == 4 then
	if dsel == 1
	then
		key2=1
		vsub[5][6]=0
		story[5].followupchoice[6]={
		 "you take the new keycard from your pocket and swipe it through the scanner. after a few moments, it lets out a positive sounding beep as the light above the door as well as the scanner flashes green, and the sound of a mechanism unlocking can be heard. it's unlocked now, and all that's left to do now is enter the door."}
	elseif dsel==3
	then
		vsub[4][3]=0						
		vsub[5][5]=0
		story[5].dialogue[6]="this observation room seems to be no different than when you had left it a few minutes ago. you carefully walk through the room, avoiding stepping on any vines while you consider your options."
	 story[5].followupchoice[5]={
			"thinking that you may have missed something, you decide to check out the room on the left one more time, walking in slowly and carefully.",
		 "",}	
		proom=5
	end
--room5--
elseif proom==5 then
	if dsel==1 then
		jrnl[1]=1
	elseif dsel==2 then	
		meds+=1
		story[5].followupchoice[2]={
			"thinking about it more, you decide to pocket them for now, as you might forget about it when you're getting ready to leave. you pocket the medicine with that, putting them in your satchel.",
			"you check the various desks some more, but there doesn't seem to be anything else worth taking right now."}
	 vsub[5][2]=0	
	elseif dsel==5 then
		proom=4
	elseif dsel==6 and key2==1 then
		proom=6
	end
--room6--
elseif proom==6 then
	if dsel==4 then
  jrnl[2]=1
	end
	if dsel==5 then
 shears=1
 vsub[6][6]=0						
	 if scan==1 and vsub[6][3]==1 then
		story[6].followupchoice[6]={
	  "you step into the scanner, shears in hand. the journals had noted that this 'evaconvolvulus' seems to be plant matter. knowing this, you crouch down towards the vines on the ground. you already checked that there wasn't anything like that stuck to your clothes, so it must be this.",
	  "with some regret in your heart, you trim away at the vines, cutitng through them cleanly until you've clipped all of them. you pick up the remains and toss them out of the scanner. you couldn't get it perfectly, as they seemed to originate from a small crack in the floor, but you've gotten as much as you can.",
	  "you press the button again, to see if you'll get a better result this time. the laser comes down again, following the proper path. you close your eyes before the lasers blind you, and after a few moment the scan completes. you open your eyes as the glass door ahead of you finally opens, revealing the now unlocked doorway to the next room.",
	  "carefully, you step through into the next room.",
	  ""}
		elseif scan==0 and vsub[6][3]==1 then
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
			""}
		end
	elseif dsel == 6 then
	 scan=1
		if shears==1 then
			proom=9
		end
	end
end
	dsel=1
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

currentdialogue=title.main[1]

if tpick==0
then
	print("\^w\^ta forgotten\n  journal",20,20,clr[2])
 choices(title)
	if btnp(4) and dsel==1 then
		tcheck = false		
		currentdialogue=story[proom].main[1]
		scrl=0
	elseif btnp(4) and dsel==3 then
		tpick=1
	end
else
	print(splitdialogue(title.options[1]),5,5,clr[2])
 clr[tpick]=options(clr[tpick])
	if btnp(4) then
		tpick+=1
	elseif btnp(5) then
		tpick-=1
	end

	for i=1,3 do
		for f=0,15 do
			rectfill(10+f*7,16+i*20,13+f*7,19+i*20,f)
		end	
		print(clw[i].." color: ",5,8+i*20,clr[2])
	 blink(bup,i==tpick,true,8+7*clr[i],19+i*20)
	end

	if tpick>3 then
		tpick=0
	end
end
end

function options(c)
if btnp(0) and c>0 then
 c-=1
 sfx(1)
elseif btnp(1) and c<15 then
	c+=1
	sfx(1)
end
return c
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
