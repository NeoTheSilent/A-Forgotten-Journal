pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- default functions

function _init()
proom=8
inv=false
invn=1
tcheck=false
tpick=0
clr={2,3,1}
clw={"ui","text","background"}
digits="0123456789abcdef"
bckclr=1
hotel=""
--
bp={
{"g. keycard",0,"a keycard that has been stained green. most of the info on it has faded. "},
{"keycard n.1",0,"a keycard numbered 1. you can also make out the word 'decontamination' on it. "},
{"shears",0,"a pair of pruning shears, the blades stained green. it's quite sharp."},
{"r. suitcase",0,"a suitcase that was stained red, filled with money. it's bulky, but well worth it. "},
{"stained key",0,"a key you found in ethe's room. it should open a certain lock."},
{"herbicide",0,"a bottle of industrial herbicide, able to kill any plant in seconds."},
{"ethe's card",0,"a keycard you found in the living quarters by a corpse. should open any room. "},
{"e. beaker",0,"a glass beaker. there's nothing in it at the moment. "}}
jrnl={0,1,1,1,0,1,0,0}
td={0,0,0,0,0,0,0,0,0}
--
pr={
{0,108,115,3},{0,108,107,1},
{0,116,107,3},{0,116,99,2},
{0,116,91,2},{0,108,91,2},
{0,108,99,2},{0}}
vroom=
{0,0,0,
 0,0,0,
 0,0,0,
 0,0,0,
0,0,0,0,0}
vsub={
{0},
{0,0,0},
{0},
{0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0},
{0},
{0},
{0},
{0},
}
--
sbs=1
btime=0
delay=0
bmap={001,002}
bsel={003,004}
bup={005,006}		
bdn={007,008}
bin={011,012}
--
dsel=1
csel=false
lock=false
imv=1
scrl=1
--
s={
--room1
{},
--room2
{},
--room3
{},
--room4
{},
--room5
{},
--room6
{},
--room7
{
m={
"as you stepped inside the room, it was painfully quiet. the branch monster was still nowhere to be found, and you were tired. the journey to get here was long, but you were finally here.",
"in front of you was what looked like a cross between a child's room and a greenhouse. there were plants everywhere, including a large vine that had grown through the walls.⬇️yet, the rest of the room didn't matter right now. ",
"in front of you was a single \"pod\", and inside of it was a sleeping white haired child.⬇️it certainly didn't look comfortable... but it wasn't because of her \"bed\".⬇️she was restrained by chains and there was odd liquid in the pod. she was about half submerged.",
"there was no other exit to this room, and the only thing here was this child. you had come here for one reason, and now it was time to act. "
},
c={
"wait and hide"
},
b=
{
{
"that amalgamation of branch and vines couldn't be far. it'd be best to hide in here.⬇️when it came in here, you could make a run for it, and head out the exit.",
"it was a foolish idea to come here, but you might make it out with your life.⬇️still... it'd leave this child alone with the monster, but what could you do? ",
"you were older, and stronger... but you couldn't exactly take down that monster.⬇️you'd live as a coward, but you'd live. you couldn't risk yourself, and risk your sister as a result.",
"muttering a small apology, you hide behind a cabinet.⬇️a few minutes pass, and the monster comes inside. as it approaches the pod, you dash out the door.",
""
}
}
},
--room8
{
m={
"as you moved into the room, it seems like you were in a smaller side room.⬇️this entire section was marked as 'experimentation' on the map, but you saw two other rooms on each side and another large door on the other end of the room, so it must have been in reference to these four rooms.",
"this room had no shortage of counters and cabinets. if you had to guess, it must've been for storing items after working on them.⬇️if circumstances were different, you'd be happy to take your sweet time looking around, but there was no time now.",
"a faint red light shone out on the other end of the room next to the door.⬇️crossing your fingers, you quickly approached the led and felt your heart sink as you read the words.",
"[lockdown mode has ended. error - evacurine has not been given in █64 days.]⬇️[100 ml of evacurine must be given to test subject before experimentation may begin.]⬇️[please place the beaker in the scanner to begin.] ",
"as you read this, a small opening appeared next to the led. in it was what appeared to be an empty beaker.⬇️it seems that if you wanted to go any further, you'd need to fill this beaker up and satisfy the led's request.⬇️there was no time left to goof around, it was time to finish this."
},
c={
"insert beaker",
"look around",
"check left room",
"check right room"
},
b={
{
"you place the beaker into the opening in the wall, and after a few moments the crevice closes with a glass wall.⬇️a red light scans the beaker, but the led flashes red, it seems this won't work."
},
{
"as you look around, you find a note on one of the counters, \"evacurine recipe\".⬇️huh. time to read this, you'll just make some!",
". . .⬇️you heavily overestimated your ability to understand scientific jargon.",
"you check the counters again, but there's nothing helpful for you right now."
},
{
"the door in front of you was labelled as 'material storage', and the door was unlocked. still, you can't help that the scientists were drama queens.⬇️this wasn't a room! it was a closet!",
"actually, in fairness, it wasn't really labeled as a room-⬇️you're getting sidetracked.⬇️it takes you a few minutes to look through the room, but while there's plenty of medicine in here, there isn't any evacurine.",
"with a heavy heart, you return to the main room.",
"you decide to check the room on the left once more, but even after a few more minutes of checking around, there's no evacurine."
},
{
"the room to the right was labeled as material storage, so if you were looking for spare vials of evacurine, it'd probably be in here.",
"as you step inside, you're greeted by quite the shocking sight. a massive mess of vines and roots had broken through the wall in the room.⬇️the shelves were broken as a result, and the vials and containers smashed. this resulted in a large pool of liquid in one end of the room.",
"from what you could read on the shelf, it looked like it was the shelf... that had evacurine.⬇️great.⬇️acting slowly, you move to fill the beaker with the liquid, not wanting to make any funny moves.",
"you've already had one run-in with a plant that wasn't content to follow the rules after all. with your beaker filled, you slowly exit the room.",
"you don't have the greatest desire to check out this room at the moment, considering the giant plant inside."
}
}
},
--room9
{
m={
"you had only been in this hallway for a short time, as you went from one decon to another. yet, you could still see that the room had certainly changed.",
"the room before looked overgrown, but still manageable.⬇️now? it was like you were in some sort of vine infested cave.⬇️you couldn't make out the walls anymore, and the doors to the two decons had been smashed down.",
"the only exception was the doorway that was to the side, which despite being dented somewhat looked no worse for wear.⬇️you didn't have much time to think it over, and your sister would kill you if you died because you were indecisive.",
"it's not like you had a choice here. you already knew this as you walked in, the only door that would open for you was the other decon... well, metaphorically at least.⬇️that door was far too damaged to ever open again after all.",
"with your destiny in your hands, it was time to act. there would be no second chances after this.⬇️moving quickly, you went towards..."
},
c={
"the south door"
},
b={
{
"as you approached the southern door, you knew that this was your one and only chance, as the monster was leaving to the observation room.⬇️you quickly ducked into the room, ready to leave this place behind for good. ",
""
},
{
"your hands shook as you approached the door to the experimentation room. this was not the way to the exit, and you knew it.⬇️this was your chance to leave this place for good, but you were throwing it away. ",
"what happened here?⬇️was 'eva' still alive?⬇️if you wanted to answer these questions, you needed to go through these doors. ",
"yet, as your hand went near the scanner, the keycard ended up falling out of your hands onto the ground.⬇️your hand was shaking so much you had to hold it with the other.",
"this was stupid.⬇️this was stupid.⬇️this was stupid.⬇️this was stupid.⬇️this was stupid.⬇️this was stupid.",
"why did you have to go through this?⬇️you weren't a cop, you weren't a detective...⬇️there wasn't anyone trapped that you had to save, right?! ",
""
}
}
},
--room10
{
m={
"you sat in the room for a few minutes, not sure what to do... or even what to think.⬇️that... *thing*, whatever it was... it had left. slowly, you left the locker and anxiously moved towards the broken open door. ",
"it had been smashed thoroughly, warped by the creature.⬇️as you peaked around the opening, you managed to catch a glimpse of that mess of vines slowly shambling out of the living quarters towards the opposing room.",
"a breath of relief escapes your lips, it seems that whatever that creature is, it's gone for now.⬇️your legs fail you as you fall to the ground, and it still feels like your heart is going to explode.⬇️it seems that despite your hopes, you've found fallen into hell.",
"you look around the room with a blank expression. any interest you had in exploring this room had vanished into thin air.⬇️there wasn't any more doors protecting you, and if that amalgamation saw you rummaging in here...",
"it'd be best not to think about that. at any rate, your business in here for now is done. it's time to move on. "
},
c={
"exit room",
},
b={
{
"once you decided to leave, it didn't take more than a moment for you to quickly dash out of the room. should you never see this room again, it'd still be too soon. ",
""
},
}
},
--room11
{
m={
"what was once a nice and organized living quarters has been reduced to a completely devastated mess. the doors to the other dorms had all been smashed in.⬇️as a result, many of the rooms were inaccessible, unless you wanted to risk slicing your leg on jagged metal.",
"you couldn't help but stare at the broken doors... if that creature could do it to these so easily, then if it found you...⬇️this wasn't a line of thought you liked going down.⬇️at any rate, there were a few options available still. ",
"the door to the decontamination room had been broken open as well, so you could finally head through there and make your way towards the entrance.⬇️still... that's also where that creature went, so you weren't jumping at the opportunity.",
"most of the dorms were blocked off by the warped doors... but there was a room you could get into now, the room marked as \"inne's\" that you hadn't been able to previously.⬇️finally, it wouldn't hurt to take a quick look around, in case something new was uncovered.",
"with your possibilities shown, you could only work quickly and hope that the creature wouldn't return in the next few minutes.⬇️there was nowhere left to hide after all."
},
c={
"look around",
"enter inne's room",
"go to decon."
},
b={
{
"it didn't take you long to look through the room. you had already gone through it once, though now that a literal natural disaster had gone and destroyed half of the room.",
"there was one thing that caught your eye, that you hadn't noticed the last time you were looking through here.⬇️there were a number of plants in the room, a few sunflowers that were facing towards the storage room as well as vines growing along the walls.",
"they couldn't have possibly grown that fast... could they?⬇️no, that would be impossible. even you knew that much.⬇️still... had you simply missed them the last time?",
"as you heard something crash in a farther room, you decided that this line of thought could wait until you've made a city's worth of distance from you and this facility.",
""
},
{
"this was the room that you couldn't get into earlier... but with the door smashed down, it seems entering would be trivial now.⬇️if that note that you had read earlier rung true, there would be a key card that could unlock the other rooms in this facility.",
"you weren't excited about exploring more, but at least with a new card, you could try to find a second escape route in the other rooms if your way out was blocked. ",
"these were the thoughts you held as you walked in, but they all faded into nothingness as you stepped inside.⬇️your blood froze, and your legs failed you as you collapsed to the ground.⬇️the world itself seemed to go mad as you look at it. ",
"in front of you was the decomposed corpse of a man. it was lying in a pile of dried blood, next to a monitor. the stench of decay invaded your senses, and it took all of your willpower to stop yourself from throwing up.",
"if there had been any hope before this, it had been thoroughly dashed. if you were caught, you would be killed.⬇️there wouldn't be anyone coming to save you, there wouldn't be a miraculous discovery to save your life.⬇️it would kill you, just as it killed this man. ",
"still, you needed to focus. it was a miracle you hadn't screamed, as that would've alerted anything around for sure.⬇️on the table next to the man was a spare key card, the same one you had hoped to take. you didn't think twice about pocketing it. still... that wasn't the only thing here.",
"there was spare piece of paper here as well, near some vents... considering the circumstances, it must have been written by this man, who you assume was inne. ",
"'it was worth reading this', that is what you ultimately decided.⬇️if there was something that could help you escape in here, then it'd be worth the time... that, and you wanted to know what happened here, and understand what led this man  to his fate.",
"\"i was a fool. eva had played her cards perfectly.\"⬇️\"we *knew* that she couldn't break out of her bindings.\"⬇️\"we *knew* that she couldn't escape without the key.\"⬇️\"we *knew* that we still had the key.\"",
"\"yet, we hadn't realized that while we had the key at the end of the tests, she had used her vines to temporarily take it and return it after. did she secretly unlock it during the tests, or did her vines somehow mimic the shape of the key? we'll never know.\"",
"\"we *knew* she couldn't leave her room. we *knew* that she never saw into our living quarters.\"⬇️\"yet... we hadn't realized that the plants she grew were truly extensions of herself. her beautiful flowers were her eyes that saw our movements, and her vines were her arms that stole for her.\" ",
"\"the price for ignorance is a hefty one, and our failure has cost █ his life. he had walked into her containment and a vine pierced through his █, there's no doubt he's dead.\"⬇️\"█ hasn't taken it well, they're curled up on a ball next to me and i don't blame her. she was close with him...\"",
"\"ethe and █ went to go and subdue eva, but in the event that they fail, we must stop eva from escaping. i plan to leave this book here, in the *observation room*, such that anyone who reads this will understand that these doors must never be opened.\"",
"that... wasn't right. this piece of paper was here in the living quarters, not in the observation room. you had seen a ripped up book though.⬇️you... saw a ripped up book in there... and you found this page next to the vents...",
". . . . .",
"\"i'll be activating the emergency lock in my room. while it's on, the only way the doors can open is through the outside. everyone here will be locked in here until our deaths.\"⬇️\"we had put it in my room after she had tried to escape at night so often but now...\" ",
"\"to stop eva from escaping, i'll have to activate the lock. once i do, i can never leave again.\"⬇️\"ah, what a beautiful hell i've made for myself.\"⬇️\"i hope that you, my dear reader will not make the mistake to enter here until it's clear everything inside is dead.\"",
"\"even now, i'm truly grateful that our tests were so successful, though it's a shame we could never work out that issue with her drug dependency...though i suppose that's not a problem you'd regret, is it?\"",
"...it seems you've truly put yourself in a bad position. you opened up pandora's box and you didn't know what to do with your prize. as it stands... the only living beings in here are you, the various plant life... and possibly eva.",
"what would be the correct thing to do?⬇️what would be the right thing to do?⬇️as you started to exit the room, it seems that this would be an answer you'd need to find for yourself.",
"there was no more point in looking through the room of a dead man, especially for what he did."
},
{
"there was nothing you wanted to check out in here anyhow. you poke your head through the doorway of the decontamination to see if the coast was clear...",
"as you looked inside... you could see that smallest glimpse of that mass of vines leaving into the opposing hallway.⬇️you... you got quite lucky.⬇️insanely so.",
"if it turned around... no, it was important to focus on reality.⬇️the coast was somewhat clear... not that you ever went to a coast, or even a beach before... you were getting distracted by foolish thoughts.",
"you'd give it a minute or so, and then you'd enter the decontamination room. it'd be bad if you walked in too quickly and that amalgamation heard you.",
""
},
}
},
--room12
{
m={
"with each step you took, it felt like you were walking towards the gallows.⬇️you were effectively following this creature through the facility, though it's not like you had a choice in the matter.",
"it was far better to follow it while it left, than for you to walk into it as it entered.⬇️it didn't change how your heart rate skyrocketed anytime you made the slightest noise as you slowly crept inside the room. ",
"staying quiet was rather difficult, as the creature had made a mess of the room when it was in here earlier.⬇️the tables had been heavily damaged, and the cabinets destroyed. broken glass and warped metal littered the ground, and you had to take care to avoid stepping in it.",
"still... you couldn't stop now. you had to escape... your sister was waiting on you after all.",
"with your determination renewed, there was only one thing you could do now. "
},
c={
"check hallway"
},
b={
{
"there was good news and bad news waiting for you in the hallway.⬇️the good was that the monster was leaving the hallway, so you could continue to sneak forward. ",
"the bad was that it was now in the lower decontamination room. thus... your options were now limited.⬇️the pain in your chest felt a noose tightening around your neck... you'd have to continue following the creature.",
"with this information now known, you had no choices left. you had to find a place to hide, and let the creature pass you before you ran out of here.⬇️you had forgotten to get the key card needed to open the other door after all, and it was too late to grab it. ",
"every minute you spent here was asking for trouble, so going back for it was suicide. whatever was inside of there... would be sealed away forever.",
"... based on the sound of destruction in the other room, that amalgamation had gotten deep enough in the other room, it was time for you to make your move. ",
""
},
}
},
--gameover c
{
m={
"as you climb up the stairs, you consider returning here to loot more in the future... but this place seems too risky.⬇️who knows, the previous owners might come back and give you hell if they find you here.",
"what happened down there?⬇️why did things turn out this way?⬇️these questions faded from your mind, unanswered.⬇️you heard a rumor about some *thing* leaving this place in the following weeks, but it wasn't your problem anymore.",
"the items you found down here sold for a pretty penny, and you could buy your sister medicine and food for a few weeks. before long, even the memory of this place faded from your mind. it was time to move on.",
},
c={
"return to title"
},
b={{
"game over⬇️ending \"c\"⬇️thank you for playing."
}}
},
--gameover e
{
m={
"you run, and run, and run... until finally, you're free of this place.",
"you made a decent haul out of your exploration, and you came out unharmed. you should be happy... yet you couldn't help but wonder.",
"could you have done anything different?⬇️did your actions doom that child?",
"it didn't matter, you couldn't change the past no matter how you wished it.⬇️over the next few weeks, you heard rumors of a plant monster scouring the alleys, but it wasn't your problem anymore.",
"you already had plans to leave this place with your sister, never to return.⬇️what you found down there was enough to keep you stable for a long time, though some of it was spent leaving the city... never to return.⬇️you could only hope you made the right choice. "
},
c={"return to title"},
b={{"game over⬇️ending \"e\"⬇️thank you for playing. "}}
},
--gameover d
{
m={
"that's what you intended to do. even as you started to pour, you could already feel a hint of regret growing inside of you.⬇️yet, it all stopped.",
"your arm failed you.⬇️not a drop would be poured, no matter how you wished it.⬇️for a moment time froze, broken only by the sound of dripping.",
"one drip after another.⬇️it echoed throughout the sylvan room.⬇️it wasn't loud, yet for you it was deafening.⬇️looking down, you saw it. ",
"your shirt was stained crimson, it was your own blood dripping on the floor.⬇️a vine had erupted from the pod and pierced your chest.⬇️you hadn't even seen it move, yet it had speared through you completely.",
"you didn't scream... rather, you couldn't. even making a sound was impossible as you gasped for air.⬇️the bottle dropped from your hand, falling loudly to the floor next to the pod, never to be used. ",
"searing hot pain infested your body, and before your body started to shut down.⬇️it was clear... there would be no saving you.⬇️this would be a dream you would never wake from. ",
"your vision started to fail, but you managed to see one last detail before it all faded away.⬇️bright green eyes dyed with hate stared at you, from not only the girl... but from each and every flower in the room."
},
c={"return to title"},
b={{"game over⬇️ending \"d\"⬇️thank you for playing. "}}
},
--gameover f
{
m={
"the monster lets out an odd roar, hobbling back as the vines and branches around its legs burn from the herbicide.⬇️you press your advantage, splashing more of the liquid near the monster, making your threat clear.",
"it's painfully quiet as you two stare each other down.⬇️it can't approach without risking serious damage, and you can't continue your assault as you have limited amounts of herbicide.⬇️you were nervous, scared, but tried your best not to let it show.",
"the stalemate broke as something pricked your neck.⬇️your body went numb and you slumped over.⬇️the herbicide fell from your hand, and was caught by a vine.",
"\"you're odd, aren't you?\"⬇️the words that came from behind you... they were weak, but there was only one voice it could come from.⬇️the child was awake?! ",
"you watched as the child slowly approached the branched monster, climbing onto its back as if it were nothing special.⬇️she looks down at you for a few moments, before the branch monster reaches out its vines and...",
"you closed your eyes out of fear, but the sensation of being grabbed was what you least expected.⬇️despite your attack, it seems to hold you carefully in its arms as it exits the room with the two of you. ",
"numbly looking around, you saw that all the plant life here was facing you, with each flower possessing an eye.⬇️as you slipped into unconsciousness, it seems that this exploration has come to an unknown end. ",
"you could only hope that when you next awoke, you would be able to reunite with your dear sister.⬇️you heard one last thing before you slipped into the dreams.⬇️\"i think it's time for some fresh air...\""
},
c={"return to title"},
b={{"game over⬇️ending \"f\"⬇️truly, thank you for playing. i really hope you enjoyed this story.⬇️- neo"}}
},
--gameover g
{
m={
"like a snake slithering towards a mouse, you quickly and quietly made your way through the room.⬇️you had plenty of experience acting like this, from how you \"borrowed\" people's belongings on the streets.",
"it'd be a different story altogether if you lost visual of that literal freak of nature... but while it was many things, fast was not one of them.",
"as it headed went from the observation room to the western room, you didn't need to be told twice on what to do.⬇️your feet carried you out of the decon room, out of the observation room, and out of this forsaken facility.",
"should you never see it again, it would still be too soon. it didn't take you five minutes to be out of the building altogether, as you ran back towards your hideout.",
"it's a shame that you didn't get that much value from this place. the pawnbroker you sold your spoils to gave you a little bit of money, but it wasn't nearly enough to justify the trip.⬇️still... even with what little was gained, you had to use it to leave the city. ",
"what you found down there would stay in your mind for the rest of your life... and if you didn't leave soon, that life would be cut short.⬇️after all, only a week after you escaped, there were already reports of people going missing, and that vines were found near the scene. "
},
c={"return to title"},
b={{"game over⬇️ending \"g\"⬇️thank you for playing. "}}
},
}

cdial=s[proom].m[1]
end

function _update()
if delay>0 then
	delay-=1
end

if scrl<#sdial(cdial) then
	scrl+=0.5
 if btnp(5) and delay==0 then
 	delay=10
		scrl=#sdial(cdial)
	end
elseif scrl==#sdial(cdial) and btnp(5) and not tcheck then
 inv=not inv
elseif scrl>#sdial(cdial) then
	scrl=0
end

if btime>0 then 
 btime-=1
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
loading()

if inv then
	pckt()
else
	dial(s[proom])
 grid()
end

ui()
bugs()
end
-->8
-- ui page

function ui()
rf(0,0,128,2)
rf(0,0,2,128)
rf(0,86,128,89)
rf(0,124,128,128)
rf(125,0,128,128)

if inv then
rect(2,89,125,124,clr[1])
line(6,15+ceil(#bp/2)*10,120,15+ceil(#bp/2)*10,clr[1])
line(6,13,120,13,clr[1])
rect(5,112,122,92,clr[1])
else
rf(95,86,97,128)
rect(98,89,125,124,clr[1])
rect(2,89,95,124,clr[1])
end
rect(2,2,125,86,clr[1])
end

function rf(v,w,x,y)
rectfill(v,w,x,y,clr[3])
end

function pckt()
--
print("inventory",6,6,clr[2])
print("journal pages: ",6,18+ceil(#bp/2)*10,clr[2])
--
y=ceil((#bp/2)*10)
z=(1+(#bp/2))
for i=1,#bp do
 j=flr(i/z)
 k=i*10
 if i>z and #bp%2==1 then
	 k-=5
	end
	rect(12+j*60,5+k-j*y,60+j*60,13+k-j*y,clr[2])
	if bp[i][2]>0 then
		print(bp[i][1],14+j*60,7+k-j*y,clr[2])
		if i==invn then
			print(sub(sdial(bp[i][3],30),1,scrl),8,94,clr[2])
		end
	end
end
--
invn=opt(invn,1,#bp,2)
l=flr(invn/z)
m=invn*10
if invn>z and #bp%2==1 then
 m-=5
end
blink(bin,1,1,4+l*60,5+m-l*y)
--
print("save code: "..imp,8,116,clr[2])
end

function opt(c,n1,n2,i)
if btnp(i) and c>n1 then
 c-=1
 sfx(1)
elseif btnp(i+1) and c<n2 then
	c+=1
	sfx(1)
end
if n2%2==0 then
	vr=n2/2
elseif (n2+1)/2!=c then
	vr=(n2/2)+0.5
else
 vr=0
end
if inv then
	if btnp(0) and c>vr and vr!=0 then
 c-=vr
	sfx(1)
 elseif btn(1) and c<=vr then
 c+=vr
	sfx(1)
 end
end
return c
end

function grid()
	for r=0,3 do
		for c=1,3 do
			p=r*3+c
			if vroom[p]==1 or p==proom then
				blink(bmap,1,p==proom,92+8*c,115-8*r)
			end
	 end
	end

	for i=1,#pr do
		if pr[i][1]==1 then
		 prev(pr[i][2],pr[i][3],pr[i][4])
		end
	end
	
	blink({001,013},s[11].b[3][1][3]=="e",proom==11,116,91)
	blink({001,013},s[11].b[3][1][3]!="e",s[12].c[1][1]!="e",116,99)
	blink({001,013},s[12].c[1][1]=="e",proom>8 and proom<13,116,107)

end

function prev(x,y,c)
if c<2 then
	spr(010,x+8,y,1,1,1)
end
if c<3 then
	spr(010,x-8,y)
end
if c<4 then
	spr(009,x,y-8)
end
end

function blink(b,c1,c2,x,y)
 if c1 and c2 then
		spr(b[sbs],x,y)
	else
		spr(b[1],x,y)
 end
end

function choices(r)
if not lock then
	if scrl==#sdial(cdial) then
  mc(r)
 end

	u3=3
	if #r.c>3 then
		blink(bup,dsel>1,scrl==#sdial(cdial),4,117)
		blink(bdn,dsel<#r.c,scrl==#sdial(cdial),9,117)
	else
	 u3=#r.c
	end

	if dsel>2 then
	 o3=dsel-3
	else
		o3=0
	end

	for i=1,u3 do
		print(r.c[i+o3],15,82+(i*10),clr[2])
		blink(bsel,i+o3==dsel,scrl==#sdial(cdial),5,80+(i*10))
	end

else
	print("continue",15,92)
	blink(bsel,1,scrl==#sdial(cdial),5,90)
end
end

function mc(s)
 if btnp(3) and dsel<#s.c then
  dsel+=1
  sfx(01)
 elseif btnp(2) and dsel>1 then
  dsel-=1
  sfx(01)
 end
end

function sound(s)
 if ord(s[scrl])!=(32 or 44 or 46)
 and ord(s[scrl-1])!=(32 or 44 or 46)
 and scrl!=#s and scrl%1==0 then
		sfx(00)
	end
end

function bugs()		
 if true then
	 --print("imp: "..imp,5,80,3)
 end
end
-->8
-- dialogue page

function dial(i)
if csel then
	ddial(i.b[dsel],vsub[proom][dsel]==0)
else
	if vroom[proom]==0 then
		lock=true
	end
	ddial(i.m,lock)
end

if btnp(4) and scrl==#sdial(cdial) then
	scrl=0
	lock=not lock
	csel=not csel
end
choices(i)
end

function ddial(i,b)
if b then
cdial=i[imv]
	if btnp(4)	and scrl==#sdial(i[imv]) then
 	scrl=0
		if #i-1>imv then
			imv+=1
		else
			if csel then
				events()
				csel=false
			else
			 vroom[proom]=1
			end
			imv=1
			lock=false
		end
	end
else
	cdial=i[#i]
end

print(sub(sdial(cdial),1,scrl),6,6,clr[2])
sound(sdial(cdial))
end
-->8
-- event tracker

function events()

vsub[proom][dsel]=1
tmp="as you ponder what evaconvolvulus is, you remember the note you found.⬇️chances are that the vines along the floor is the evaconvolvulus.⬇️still... you couldn't just rip them up with your hands. you'd need to find a tool to cut them. "
tmp2="you try your luck with the door, but unfortunately it's locked tightly and your keycards don't seem to work with this door.⬇️notably: the name plate seems to be scratched out, you can't make out what it said."
tmp3={
"satisfied with how you've looked through here, you're ready to move into the final room on this path. the map had called it the \"storage room\".⬇️if you were lucky, you'd find what you were looking for in here.",
"this is what you were waiting for, there should be plenty of valuables in here.⬇️hopefully it would be enough to make up for the risk of coming here.⬇️you could only pray that this journey would continue in solitude as another roar shakes through the facility. ",
""
}
sc1="[error - evaconvolvulus detected. doors have been locked.]"
sc2="[no evaconvolvulus detected. you may enter.]"

--room7
if proom==7 then
 if dsel==1 then
  proom=14
 elseif s[7].c[dsel]=="save child" then
  proom=16
 elseif s[7].c[dsel]=="use herbicide" then
  proom=15
 end
--room8
elseif proom==8 then
 if s[8].m[#s[8].m][1]=="a" then
  s[8].m[#s[8].m]=sub(s[8].m[#s[8].m],108)
 end
 if dsel==1 then
 	if bp[8][1]=="evacurine" then
 	 bp[8][2]=0
	  proom=7
 	 if bp[5][2]==1 then
  	 add(s[7].c,"save child")
  	 add(s[7].b,{
"was it even a question?⬇️moving quickly, you take the key you had found on the corpse and unlock the bindings.⬇️you freed her without any issue, though you still needed a plan. you still neded to do something about the living branches.",
"could you sneak by the amalgamation?⬇️not likely with this child as a passenger. if she woke up and made a sound, it'd be over.⬇️it's doubtful you could run with the child either, so running wasn't an option. ",
"hiding didn't seem like a good idea either. thus-⬇️you didn't any more time to think it over, you could see the monster approaching the door from the next room via a small window. ",
"you take out the bottle of herbicide and uncap it, waiting for the monster to enter.⬇️just as it does, you splash the herbicide at the monster! ",
""})
	  end
 	 if bp[6][2]==1 then
  	 add(s[7].c,"use herbicide")
  	 add(s[7].b,{
"you couldn't be blamed for what you did. whatever was in front of you, it *wasn't* human.⬇️nobody could survive chained up in an environment like this.⬇️it was pretending to be a child, to get you to lower your guard.",
"if the journals were to be believed, then this child-⬇️no, plant was the one that killed the three humans you saw here.⬇️it was dangerous.⬇️it would kill you.⬇️you had to defend yourself. ",
"that branch amalgamation would be here soon.⬇️this was your only chance to end it.⬇️that's why you did it.⬇️with fear in your eyes, you took the herbicide from the storage room out and poured it into the pod.",
""})
 	 end
 	end
 elseif dsel==4 then
  vsub[8][1]=0
  s[8].b[1]={"with the beaker filled, you placed it within the alcove and waited for the device to scan it. after a few moments, the led glows green.⬇️just as you did so, the alcove closes, and thus you lose access to your beaker.",
"unfortunate, but it did its job already. with some hesitation, you step into the room and see that it's quite...⬇️. . .⬇️.  .  .",
"in front of you were three dead bodies. one had been speared through the chest with a vine, and the other two were slumped over in the corner with broken bodies.⬇️each of them were wearing the hazmat suits, not that it did them any good in the end.",
"time stopped for a few moments, and you felt the bile slowly rise in your throats as you looked at the flora in the room that had completely covered the walls.⬇️unable to stop yourself, you relieve your stomach of its contents as your mind tries to catch up with what it had learned.",
"you were in danger.⬇️you were in danger.⬇️you were in danger.⬇️you were in danger.⬇️you were in danger.",
"still... you can't let fear dominate your mind. with a hesitant step, you move into the room.⬇️you came into here for a purpose after all, to see this to the end.",
"there was a large operating table in front of you as well, the stark white color contrasting harshly with the greenery around it, and there were countless sunflowers in here, all facing towards the door you came from.",
"there was only one thing that mattered in here though, and that was the door to the next room.⬇️this should be the final room in experimentation, which meant the next and final room was the subject's room.⬇️eva's room.",
"carefully, you step around the corpses and open the door to this final room without interruption.⬇️it was time for this story to end."
}
  bp[8][1]="evacurine"
  bp[8][3]="a beaker filled with the green liquid that's probably evacurine. probably."
 end
--room9
elseif proom==9 then
 if dsel==1 then
  proom=17
  if bp[5][2]==1 then
   s[17].m[5]="the suitcase you found was more than enough to give you and your sister a comfortable life here. all the food and medicine you'd ever need was available.⬇️your adventure was well worth it, and you can rest easy knowing you did a job well done. still, you didn't think twice about using parts of it to flee the city. "
  end
 else
  if finaljournal>3 then
   proom=8
   bp[8][2]=1
  else
   del(s[9].c,"the western door")
   s[9].m[#s[9].m]="no, there was no point in going into here.⬇️you didn't know eva, nor did you care about what happened here.⬇️there was only choice after all, and that was to go to..."
  end
 end
--room10--
elseif proom==10 then
 pr[1][1]=0
 pr[2][1]=0
 pr[3][1]=0
 pr[4][1]=0
 proom=11
--room11--
elseif proom==11 then
 if dsel==1 then
  if s[11].b[1][1][1]=="i" then
	  vsub[11][1]=0
	 end
  s[11].b[1]={
"as you look around again, you couldn't help but notice that the sunflowers were now facing your general direction...⬇️that... isn't right. they were facing the storage door, weren't they?",
"slowly, you turn and walk back towards the storage room door before quickly turning.⬇️the sunflowers had turned towards the door.⬇️they had turned towards you.",
"the sunflowers were looking at you.⬇️the sunflowers were watching you.⬇️you had to get out of this place, and fast.",
"you held no more interest in looking around in here, it was time to leave."
  }
 elseif dsel==2 then
  bp[5][2]=1
  bp[7][2]=1
  jrnl[6]=1
 elseif dsel==3 then
  if s[11].b[3][1][3]=="e" then
   s[11].b[3]={
"this was long enough, for sure. you peak your head one last time to confirm that it wasn't waiting for you in there... before you enter the decontamination room. "
}
   vsub[11][3]=0
  else
   --suitcase check
   if bp[4][2]==1 then
    s[12].m[4]=s[12].m[4].."⬇️the money in the suitcase you were lugging around would be enough for you two to live a happy life, far from here.⬇️you'd finally have a roof over your heads, and plenty of food and medicine!"
   else
    s[12].m[4]=s[12].m[4].."⬇️if you disappeared in a place like this... then who would care for her?⬇️you two had nobody, and she wasn't well... there was no choice, you had to survive for her sake!"
   end
   --keycard check
   if bp[7][2]==1 then
    s[12].b[1][3]="all things considered, you had two choices yet somehow neither made you smile.⬇️option 1 was simple: hide and let the monster pass you, and then run out of here.⬇️still, with how it's roaming around, there's a good chance it could bump into you if you weren't careful."
    s[12].b[1][4]="option 2 was safer... in theory. the monster went towards the entrance, and you had a new key card that should unlock any door.⬇️you could try the locked door, and see if you could find a weapon or an exit.⬇️still... if you remembered correctly, that path should also lead to 'eva'."
   end
	  proom=12
	 end
 end
--room12--
elseif proom==12 then
 if s[12].c[1][1]=="c" then
  vsub[12][1]=0
  s[12].m[#s[12].m]="if you wanted to make a move, it had to be now.⬇️life and death, your choices in the next few minutes would decide you and your sister's futures."
 	s[12].c[1]="enter hallway"
 	s[12].b[1]={"you ran into the next room without regret or fear, and it would be a sight that nobody could forget... at least, that's how you wanted to enter it.⬇️it would certainly be how you'd tell your sister how you escaped the room if you survive.",
"no... when you walked into that hallway, the one that would decide your fate... it was one hesitant step after another.⬇️the decisions you made up to this point have led you here... and you could only pray you made the right ones. ",
""
}
 else
  proom=9
 end

 if bp[7][2]==1 then
  s[9].c[2]="the western door"
  finaljournal=0
  
  for i=1,#jrnl do
   finaljournal+=jrnl[i]
  end
  if finaljournal>3 then
   s[9].b[2][6]="...no, eva was in there. if they were still alive, then they'd be in there.⬇️you had to do something. nobody else could do it once you left, you were the only one who knew about this place."
   s[9].b[2][7]="with a heavy heart, you picked up the keycard once more and swiped it. seconds passed as you waited for the door to open, but ultimately the door opened slowly. as it did, a thin layer of mist came from the door.⬇️you could only pray that you'd be able to leave through it after all was said and done."
   s[9].b[2][8]="one step followed another, your legs shaking all the while. your destiny would be decided inside the room, and there was no way to know if it was good."
   s[9].b[2][9]=""
  end
 end
elseif proom>12 then
	tcheck=true
	load("evastory.p8")
end
	dsel=1
end
-->8
-- dialogue splitter

function sdial(s,d)

estr="                               "
if d then
 setl=d
 estr=sub(estr,1,d)
else
 setl=31
end
l=setl

for i=0,13 do
	for j=1,setl do
	 if sub(s,j+setl*i,j+setl*i)=="⬇️" then
			if j>setl-1 then
				for k=1,l-j do
					if sub(s,l-k,l-k)==" " then
						esize=k
					 break
				 end
			 end
	  else
			 esize=j
	  end
		s=sub(s,1,j+(setl*i)-1)..sub(estr,esize).."\n"..sub(s,j+(setl*i)+1)
		end
	end

	if sub(s,l-1,l-1)!=" " then
		for j=1,ceil(setl/2) do
			if sub(s,l-j,l-j)==" " then
				s=sub(s,1,l-j-1)..sub(estr,#estr-j+2)..sub(s,l-j)
			break
			end
		end
	end

	s=sub(s,1,l-1).."\n"..sub(s,l)
	l+=setl
end

return s
end
-->8
-- loading

function loading()

imp=""
bb=1
if stat(6)!="" and hotel=="" then
 hotel=stat(6)
 for i=1,#clr do
  for j=1,#digits do
   if digits[j]==hotel[i] then
    clr[i]=j-1
   end
  end
 end
 r4(flr(#bp/4),3,bp,2)
 for i=1,#digits do
  if digits[i]==hotel[6] then
   proom=i
  end
 end
 r4(2,6,pr,1)
 r4(3,8,vroom,nil)
 r4(2,11,jrnl,nil)
end

for i=1,#clr do
 imp=imp..digits[clr[i]+1]
end
imp=l4(flr(#bp/4),bp,2,imp)
imp=imp..digits[proom]
imp=l4(2,pr,1,imp)
imp=l4(3,vroom,nil,imp)
imp=l4(2,jrnl,nil,imp)

end

function l4(grx,ch,pos,im)

for i=1,grx do
k=0
 for j=0,3 do
  if pos!=nil then
	  if ch[((i-1)*4)+(j+1)][pos]==1 then
 	  k+=2^(j)
 	 end
 	else
 	 if ch[((i-1)*4)+(j+1)]==1 then
 	  k+=2^(j)
 	 end
 	end
 end
im=im..digits[k+1]
end

return im

end

function r4(grx,gry,ch,pos)

for i=1,grx do
 for j=1,#digits do
  if digits[j]==hotel[i+gry] then
   temp=j-1
   for k=1,4 do
    if temp>=2^(4-k) then
     if pos!=nil then
	     ch[((i-1)*4)+(5-k)][pos]=1
	    else
	     ch[((i-1)*4)+(5-k)]=1
	    end
     temp-=2^(4-k)
    end
   end
  end
 end
end

end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000033333300333333000000000000000000000000000000000000000000000000000000000000003300000000000000000033333300000000000000000
00700700030000300300003003333300033333000003300000033000003333000033330000000000000000300033300000333000030000300000000000000000
0007700003000030030bb030030000300300003000300300003bb30000300300003bb300000000000000003000300300003bb300030440300000000000000000
0007700003000030030bb03003000003030bb00300300300003bb30000300300003bb300000000000000003000300300003bb300030440300000000000000000
007007000300003003000030030000300300003000333300003333000003300000033000030000300000003000300300003bb300030000300000000000000000
00000000033333300333333003333300033333000000000000000000000000000000000003333330000003300033300000333000033333300000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000333333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000366666666663000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000360060600063000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000366666666663000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000360060006063000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000366666666663000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000360006006063000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000366666666663000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000360600060063000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000366666666663000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000360006060063000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000366666666663000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000366666666663000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000333333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000032750327001470014700147001470014700147001470014700147001470029700277002370021700027001d7001a7001870013700107000b700077000370000700007000070000700007000070000700
000100003a05000000000002d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0010000018f5018f5018f5019f5015e501af501bf501df501df501ef501ef501ef501ff501ff5020f5015050190501905012050120500d0500d0500705007050090500a0500c05014050140500f0500f05008050
