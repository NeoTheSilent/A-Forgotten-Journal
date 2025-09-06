pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- default functions

function _init()
proom=10
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
{"metal rod",0,"a sturdy metal rod. it seems strong, but is showing signs of rust."}}
jrnl={0,0,0,0,0,0,0,0}
td={0,0,0,0,0,0,0,0,0}
r10=0
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
{0}
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
{},
--room8
{},
--room9
{
m={
"once you go into here, you'll be on the officially on the other side of the facility. retracing your steps now wouldn't do you any good, it was best to continue moving forwards.",
"after all, not only does the storage room show promise, but there should be a way to turn off emergency mode in the living quarters somewhere. once you flip that, it should make exploring that much easier. ",
},
c={
"continue"
},
b={
{
"with a careful step, you make your way into the next room. "
},
}
},
--room10
{
m={
"when you walk in, an odd chimeric feeling of joy and disappointment blossoms within you.⬇️joy from the fact that here was the storage room, likely packed to the brim with valuables and goodies. you finally got here!⬇️yet, disappointed from a simple fact.",
"this place looked *awful*. it was like organized by a chipmunk that had three coffees and an energy drink.⬇️it'd take ages to look through here and see what was valuable and what was trash.",
"seeing no reason to delay, you quickly started looking around the room. you spent the next few minutes in quiet peace, disturbed only by the occasional shout of pain from some junk squishing your poor finger.",
"there were three sections of storage worth noting, each equally viable for valuables.⬇️there were a few cabinets along the walls of the room that showed promise, as did the shelves filled with a variety of odd items. finally, there were some large boxes that might be bulky, but could hide some treasure. ",
"yet, this quiet investigation was interrupted by a familiar robotic phrase, one that you could barely hear.",
"[error - evaconvolvulus detected. doors have been locked.]",
"it was faint, and to be honest you were lucky to hear it considering it originated from a few rooms over... but it sounded like one of the scanners that you had stepped through.⬇️still, why had it- ",
"you received your answer rather definitively. you couldn't help but wince as the sound of metal being torn and warped echoed through the facility.⬇️you never went to school, but you were smart enough to know one simple fact.⬇️some *thing* was here. ",
"dashing back to the door, you sneak a peak through the window.⬇️the window was clear enough to see through, despite the dust. it didn't seem like anything in the living quarters right now. ",
"still, you couldn't have heard anything from the further decontamination room.⬇️it was certainly too far to hear anything from.⬇️thus... whatever made that sound, it was likely still in the northern decontamination room.",
"your two objectives were now clear.⬇️first, you needed to keep an eye on the door, to see if you were in danger.⬇️second, you needed to take all the valuables you could. you certainly didn't intend to return once you left after all.",
},
c={
"check shelves",
"check cabinets",
"check boxes",
"check door"
},
b={
{
"if the shelves were organized, then you wouldn't have an issue looking through them. it'd be trivial to figure out what was valuable, and what wasn't. ⬇️unfortunately... the people who lived here didn't value organization. either that, or that or whatever destroyed this place did so just before spring cleaning.",
"several minutes passed as you went through the various shelves. only as you reached the last shelf did a certain briefcase catch your eye.",
"it was a bit hard to reach, as it was on a higher shelf, but you managed to get it without it smashing onto the ground.⬇️thankfully for you, the briefcase didn't seem to be one of the types that locked, though it was stained red. ",
"it was always an annoyance when you \"found\" a locked briefcase on the streets.⬇️as you clicked open the suitcase, it almost sounded like a choir of angels was descending upon you. in their heavenly hymn, one word echoed out over and over. ",
"riches.⬇️money.⬇️wealth.⬇️capital.⬇️cold. hard. cash.",
"the suitcase was filled with currency. well, in fairness it was only half full but it was still far beyond what you had hoped. even a few of the bills here would last you and your sister for weeks, if not longer.",
"of course, with that came two questions.⬇️were they legitimate?⬇️will anyone come after you for taking them?",
"they certainly looked legitimate, at least as far as you could tell.⬇️there was that time a year ago where someone tried to pay you with counterfeits but you saw the discrepancies.⬇️in any case, bills seemed to look fine to you.",
"money had an awful habit of running away just as you got it after all and there's been a number of times that your questionable obtained funds were questionably lost. ",
"the second question was easier. the people who lived here certainly didn't seem like they were coming back anytime soon. otherwise, you would've run into someone by now. this place was far too devastated, they likely fled the scene... and the city while they were at it. ",
"with this divine suitcase now in your possession, you prepare your next move.",
"you take a second look through the shelves, but nothing else really sticks out to you. you were rather thorough in the first search, and even after a few minutes you don't stumble upon anything new.⬇️you can't help but feel this is a waste of your time."
},
{
"there were three larger storage cabinets along the walls of the room, and within them were smaller glass containers.⬇️all three cabinets were filled with glass jars and given appropriate labels for their contents.",
"from what you could see, it seemed like the first cabinet was filled with plants, though it was a surprise to see them still alive.⬇️you'd think with the facility in this state, they'd have decayed by now but they must have learned from their hardy siblings in the other rooms.",
"still... how had all these plants lived without sunlight or the other things plants needed to live?⬇️it didn't matter, you were getting distracted. the second cabinet was filled with various medicines. you couldn't help but feel hope blossom in your heart as you looked at it.",
"was it possible that the medicine your sister needed was here? your hopes were dashed as quickly as it blossomed.⬇️why would it be here? whoever was here was working on something you couldn't comprehend, and it wasn't for the good of anyone.",
"finally, in the third cabinet, it looked like there were jars of preserved food.⬇️well, it looked like it was food at least, though you weren't jumping at the opportunity to try any of it. ",
"to be honest, you're not sure that taking any of them is a good idea.⬇️in theory, they could be worth a lot of money, but you could easily just pick up a jar of cold medicine or preserved roses and waste backpack space.",
"you end up spending a few more minutes looking around to see if anything was obviously useful, but unfortunately there's nothing that you want to take right now.",
"there's a chance that you might've missed something. thinking this, you look through the various glass containers again. while you do have a small scare when you almost knock a container over, you don't find anything worth noting."
},
{
"as you look through the various boxes, you happen to stumble upon a rather unique treasure trove. the box itself was packed to the brim with *it*, enough to last anyone for years! ",
"inside this particular box was bottle after bottle of herbicide. there were enough of them to wipe a few small farms off of the map.⬇️according to the label, it was 'non-selective'... whatever that meant. hopefully it meant that it killed whatever plant life it touched.",
"normally, it wouldn't be something you'd want to take... but considering the state of the vine filled hallway, it likely wouldn't hurt to hold onto a bottle. ",
"if the vines blocked the doorway, even with your shears, it'd likely take some time to clean it all up. time that you didn't want to spend with *something* roaming around in the facility.⬇️thus, you end up taking one of the bottles and continue your search.",
"unfortunately, your search dries up shortly after this. the remaining boxes certainly held expensive looking machinery, but were far too large for you take by yourself. with your search done, you decide to review your options again.",
"perhaps there was something you missed, thus you decided to take a second look around in the various boxes. it takes a few minutes, but ultimately doesn't bear fruit.⬇️well, it does technically bear fruit, you found some apples that looked suspiciously fresh still in a box, but you didn't have much of an appetite. regardless, you didn't find anything important."
},
{
"it takes some courage to peak through the window of the door.⬇️you don't know what to expect exactly, however anything that could rip through metal so loudly is firmly on your \"avoid\" list. ",
"nervously, you sneak a glance through the window... and see that nothing is in the living quarters, at least to your knowledge.⬇️of course. it could've snuck through when you weren't looking, and it could be lurking on the otherside-",
"...this line of thought isn't one you wish to follow. as the dull sound of water dripping echoes through the room, you decide that it probably hasn't gotten in yet.",
"probably.",
"you take another quick peak before you continue to look around, to see if anything was pulling a fast one on you. thankfully, the living quarters seem no different."
},
}
},
--room11
{
m={
"as you step into the room, it was shockingly dark in here. it takes you a few moments to feel around for some sort of light switch... but you ultimately find it. it seems a little large for a light switch, but you weren't one to judge. as you flip it, the room floods with light and a mechanical voice comes out from the walls. ",
"[emergency mode has been shut down.]⬇️...huh.⬇️well, that's a problem potentially solved. if the place was in emergency mode, hopefully now it'll be easier to look around. still, with the light illuminating the room, the state of the room is quite the shock. ",
"in front of you were tables, bookshelves and other furniture. in essence, exactly what you'd expect from a place called the \"living quarters\". they were coated in dust, but otherwise were in perfect condition. ",
"it didn't make sense. the rest of the facility looked awful, yet this one only needed a little dusting. furthermore, not a single plant could be seen in here.⬇️as you think things over, a sharp metal whine sounds out behind you.",
"you look just in time to see the metal pipe bend before flying into the previous room, clanging loudly as the door shut in front of you. quickly, you try to swipe your card to open the door.⬇️*click*⬇️the led flashes green, but the door stays stuck, just as you are now.",
"whether you wanted it or not, you'll be spending some time here.⬇️a number of side rooms are present, judging from the nameplates, they're the rooms for those who lived here.⬇️you should be safe to check them, you doubt the inhabitants are still here after all. ",
"as you prepare to look around, a second loud roar echoes through the facility.⬇️was that some *being* making that sound, or was it something else in the facility breaking?⬇️you could only pray for the latter.",
"there was no reason to hold back, it was time to explore and get to the bottom of this place."
},
c={
"check far door",
"check desks",
"check bookshelf",
"check door 1",
"check door 2",
"check door 3",
"check door 4",
"check door 5",
"check door 6",
},
b={
{
"the door you approached directly across from the door you came in from. it was locked by a scanner, the led glowing red as it waited for you to scan.⬇️seeing no reason not to, you swipe your cards. to your surprise, the no.1 keycard unlocks it without issue. ",
"you were quite lucky to find this card, it's unlocked almost every door for you. you'll have to thank your lucky stars later. at any rate, it's clear that you can enter this room whenever you want.",
"still... you should probably explore around here a little more first, there's clearly a lot here and it'd be worth checking for valuables.",
"it might be worth checking a few more spots first, you haven't checked around enough yet. you were risking a lot already, and this place would have some things worth taking."
},
{
"you spend a few minutes looking through the desks. a few minutes pass, and ultimately you find something of note: a note on one of the desks. picking up the paper, you take a proper look at it.",
"\"there's an issue with the scanner that leads to the experimentation room. if your card doesn't work, come to my room and i'll swap it out with an updated one.\"⬇️\"it's the *third* room from the storage room in the living quarters, in case you've forgotten\"⬇️-ethe",
""
},
{
"as you look through the bookshelves, you see a page torn from a notebook on the ground near some vents. there's a green residue stained on it.⬇️picking it up, you decide to read it.",
"\"june 1st, 20█\"⬇️\"we reached a breakthrough today. introducing █ to eva had resulted in █ changes in her physiology. we noticed that she's started █ exponentially faster. when she was cut by inne earlier for a test, it healed within █ seconds without leaving a mark.\"",
"\"the █ are now growing from her body, treating her as a host. they seem to follow her will, as they grabbed inne by the leg and threw him during a █ test. we're lucky his foot didn't break.\"",
"\"█ were applied during this incident, though eva woke up █% earlier than expected. she's growing a █ to them.\"⬇️\"this is an ideal result for our experiments, our goal is for █ but it means we're running out of ways to sedate her.\"",
"\"we've also noticed that eva's displaying symptoms of █ when not given evacurine.\"⬇️\"the perfect █ can't have drug █. we'll have to find a solution, or we may have to consider whether we continue the project with eva or not.\"",
"it's clear, something awful happened here. at least it's likely whoever ran this place got what was coming to them, considering the state of the facility...",
""
},
{
"this door, the farthest from the entrance, is labelled as [ikalle's room]⬇️like all other rooms here, it seems to be locked by a keycard reader. keycard no.1 manages to unlock the door to your pleasant surprise.",
"with a click, the door unlocks and you step inside. shockingly, you see that there's a semblance of a proper bedroom in here.⬇️you look around for a few minutes, but the only notable item seems to be a spare hazmat suit you find inside a closet.",
"considering the state of the hallway the last time you saw it, it might be worth taking.⬇️still, it's not like this is your only choice for a hazmat suit, you could always take one from the decontamination room.⬇️if nothing else, having more options wasn't bad. ",
"before you leave, you notice a note that had fallen behind the desk. picking it up, you take a look at it. ",
"\"september 29th, 20█\"⬇️\"the discussion over eva's future has been divided. █ and █ wish to dispose of eva and salvage the █. during last night's escape attempt, █ was thrown into a wall and i fear that their left arm is broken. while the scanners have stopped eva so far, they fear that we're running out of ways to stop her.\" ",
"\"ethe and i agree, yet is this not the point of our test? to surpass the human body, to create a new type of █?\"⬇️\"yes, we will need to be more █, but we can't stop now. we've locked eva with our strongest █. we have to use them, as sedatives are █. she only remained asleep for █ minutes with horse █.\" ",
"\"if we can simply keep her immobile, we can continue. surely █ understands that we don't have the time nor budget to start over. even if we could, there's a risk that we can't salvage the █ from her. we can't give up now.\" ",
"\"still, with how things are going, it's only a matter of time before someone dies. we can't take the restraints off of her unless it's for a test. we'll keep the key in ethe's room.\"",
"...⬇️you start to feel sick as you read the note over.⬇️if they locked 'eva' here... what should you do next?⬇️you thought it over for a few minutes, yet couldn't find the answer.",
"...you'd rather not be here if you can avoid it. "
},
{
"the door you're approaching is labelled as [inne's room] with a scanner allowing entry.⬇️you swipe your cards into the scanner, but they remain locked. it seems you'll have to come back later.",
"you try your luck with the keycards that you have, but none of them seem to be the correct one.⬇️perhaps with some luck, you'll find one that opens this door soon."
},
{
"walking up to the door, you see that the nameplate marks it as [ethe's room], a name that is sounding quite familiar from the notes around here.",
"to your surprise, the led is glowing green, and the door is unlocked. however, something seems to be jammed against the door, it won't budge.⬇️you certainly spend a few minutes trying, but unless you wanted to risk throwing your shoulder out, you aren't getting in.",
"once more, you try your luck at getting into the door, but the progress made is nonexistent. oh well, it was worth a try at least. you'll need something to either break down the door, or find an alternate way in."
},
{""},
{""},
{""}
}
},
--room12
{
m={
"as you step inside, you see a scanner like in the previous room. glass panes block the scanner exit, and a scan button was displayed.⬇️noticing vines on the ground, and remembering the last room, you dispose of them with your shears before pressing the scan button. ",
"[error - evaconvolvulus detected. doors have been locked.]",
"odd... you had gotten all of the vines when you entered.⬇️you spend a minute looking around, only to notice a stray vine was half inside your pants pocket.⬇️you don't remember putting it in there. tossing it out, you press the scan button once more.",
"[no evaconvolvulus detected. you may enter.]",
"the door opens, and as you take your first step inside the room, you hear a noise from a different room, like metal groaning and some other inhumane roar.⬇️silence follows the roar, only to be disturbed by the occasional drip of water. what... what was that? ",
"your imagination must be getting to you... right?⬇️at any rate, as the map had shown, this room was a mirror of the other decontamination room, with desks, a closet with hazmat suits, and a shower.⬇️it's time to get to work. "
},
c={
"look around room",
"check desks",
"look in closet",
"check left door",
"enter south door"
},
b={
{
"you spend a few minutes looking around. notably, this room looks much cleaner than its sister room. there's no water, nor can you see any plants.⬇️you do notice a metal rod lying on the floor, having fallen out of something. it looks a little rusty, but it seems like it's worth taking. ",
"there's nothing else that seems useful at the moment for you around the room, it's actually organized unlike its sister room."
},
{
"as you check through the desks, you find a number of documents, but they're too complicated for you.⬇️you do find a photo of a child, no older than 6. she has an green hair, and an odd look in her eyes.⬇️outside of that, there's nothing else.",
"there's little else in the desks worth looking at, outside of the photo of the green haired child."
},
{
"you step into the closet to see if there was anything worth noting. there's a few hazmat suits within... two of which had been torn by *something*.⬇️you try not to think about it as you search the suits. ",
"you do happen to find a document in one of the pockets of a torn suit. taking it to a flickering desk lamp, you read it. ",
"\"april 10th, 20█\"⬇️\"our experiments have gone quite well, we've recently celebrated the █th █ of our tests with eva. her body is holding up quite well, with the degeneration of her body's █ only at █5%.\"⬇️\"her mental tests have also been within working results.\" ",
"\"as it stands, we're steadily heading towards our goal of creating the █ █.\"⬇️\"we can't celebrate too early, as we had similar hopes with test subject █4 until they █.\" ",
"\"we've recently begun the advanced testing, and introduced eva to █. while initial results did cause a █3% increase in mental distress to eva, we were able to confirm that the █ properly █ into her body.\"⬇️\"we're getting closer to our goals, before long we'll conquer the human █.\" ",
"\"still, we can't ignore that eva hasn't been █, though it isn't a surprise.\" ⬇️\"withholding the evacurine medicine is enough to quell resistance, as she can't bear the pain without it. she's a genius, surely she should █ what we're doing!\"⬇️\"a little pain is nothing for what we're dreaming of.\" ",
"\"if only we could still █ on our own bodies... still, this experiment is best performed with █ bodies. we're getting close, we can't stop now.\"⬇️quietly, you put the page in the journal, trying to come to terms with what you had just read...",
"there isn't anything else of note in the closet... and considering what you read, you're not keen on looking closer."
},
{
"a keycard scanner and a broken looking door stand in front of you. it looks like it's seen better days, the metal seeming warped.⬇️taking your cards, you swipe the keycard marked 1 first.",
"the led above the door goes green, and the door starts to open with an awful groan.⬇️looking at the door frame as it opens, you notice that there are vines grown into the frame.",
"the door opens around halfway before it stutters to a stop. it wasn't perfect... but considering the state of this place, you were just surprised it worked at all.⬇️you try to take a step through the doorway-",
"to your surprise, the door came to life and quickly started moving back and forth before stopping again.⬇️this... wasn't ideal. going through would risk injury, and if it closed and broke when you were on the other side, you'd be trapped. you needed to find a way to keep it open.",
"you try to use what you have to keep it open, but nothing seems to hold much promise in keeping the door open. "
},
{
"carefully, you step into the scanner again and start the scan.",
"",
"the door to the hallway unlocks with a click, and you carefully step into the hallway. ",
"you take a single step towards the door, before you stop. whatever *that* was, it was in there...⬇️there was more for you to do here anyhow. with this excuse in your mind and the courage to step inside gone, you begin to plan your next move."
}
}
},
--gameover c
--gameover d
--gameover e
--gameover f
--gameover g
{
m={
"it all happened in a blur. you were distracted and hadn't really understood what was happening until it was far too late to stop it.⬇️much like a deer looking into the headlights of a truck like it were stars, you stood still as the door came down.",
"fighting?⬇️running?⬇️hiding?⬇️such options left your mind, and you stood there dumbstruck.",
"in front of you was a creature that you didn't understand. it was a mess of living vines and branches, and it was walking towards you.",
"even as it moved towards you, you didn't even understand what your mind was trying to tell you. you simply couldn't understand what it was. ",
"you were brought back to reality by a sharp pain in your torso, and you looked down to see something that didn't make sense.⬇️you had been impaled, the creature had thrust its \"arm\" into your stomach.",
"it hurt.⬇️it hurt.⬇️it hurt.⬇️it hurt.⬇️it hurt.⬇️it hurt.⬇️it hurt.",
"yet... you couldn't scream. you couldn't run. you couldn't even try to throw a punch, the strength in your body had failed you.⬇️you couldn't feel your legs anymore, and soon... you'd feel nothing.",
"it was over, there was nothing left for you to do. your vision slowly started to fade into black as the creature withdrew its arm from your torso and let you crumple onto the floor."
},
c={
"return to title"
},
b={{"game over⬇️ending \"g\"⬇️thank you for playing."}}
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
--ui page

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

	if vroom[10]==1 then
 	blink({001,013},td[8]==0,td[9]==1,116,91)
	 blink({001,013},proom==10,td[8]==1,108,91) 
	 blink({001,013},proom==13,1,100,91)
	end
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

--room10--
if proom==9 then
 if dsel==1 then
		proom=12
		pr[5][1]=1
	end
elseif proom==10 then
 if dsel<4 then
  vsub[10][4]=0
  vsub[10][dsel]=0
  if r10==3 then
   proom=13
  else
	  r10+=1
	 end
  if #s[10].b[dsel]!=1 then
   s[10].b[dsel]={s[10].b[dsel][#s[10].b[dsel]]}
  end
 end
  
 if dsel==1 then
  bp[4][2]=1
 elseif dsel==3 then
  bp[6][2]=1
 elseif dsel==4 then
  if r10==1 then
   td[9]=1
  elseif r10==2 then
   td[8]=1
  elseif r10==3 then
  	load("e3.p8","bread",imp)
  end
 end
 
 if r10==1 then
  s[10].m[#s[10].m]="you can hear the sound of metal being torn in the distance. your eyes glance towards the door for a few moments as you consider your next move."
  s[10].b[4]={"it took some courage to look through the window, not knowing what you'd see. still, history was not written by the cowards!... probably. with that thought, you sneak a peak through the window.",
"as you look through the window, your fears are realized. the lights in the living quarters were flickering now, so it was difficult to see. still, the farther end of the room looked different. the farthest door seems to be warped, yet that wasn't the part that frightened you. ",
"no, it was the fact that a number of vines and branches that hadn't been there before were growing there, plants that you certainly hadn't noticed before.⬇️not to mention... the vines and branches are moving slowly... they're alive. ",
"your problem with the door being stuck seems like it may very well work itself out in time, though nobody could judge you for your lack of enthusiasm about it. something was in that doorway... and it was alive. ",
"there's no more time left to think about this, it's time to get back to work. ",
"whatever's growing in the opposing doorway doesn't seem to have made much progress since you last looked at it.⬇️luckily, it seems that you still have time to explore in here."
}
 elseif r10==2 then
  s[10].m[#s[10].m]="the distinct sound of metal being broken and destroyed has gotten closer. you don't know what you'd see if you checked the door, but no matter what it is...⬇️it wouldn't be good. "
  s[10].b[4]={"as you step towards the door, the sound of metal being torn through echoed out harshly from the next room. the sound of it nearly caused you to drop dead from a heart attack, but after a few moments you recovered your composure.",
"something was moving around in the living quarters. the lights inside the room had all gone out, with only a single light in the corner spared. it was enough that you could barely see *it.*",
"to be honest, you didn't know which would be better: if you could see it, or if you couldn't. your opinion didn't matter, just as it had for your life.⬇️there was something moving around by the doors to the living quarters, slowly ripping them open just as it had ripped open the entrance to the room.",
"it was on the second door from the entrance now, and it wasn't opening them quickly. it... it should take some time before it gets to you, right?",
"you don't want to check it again. you really don't. the worst thing you could see now... would it be seeing the monster there, or would it be seeing no such being?⬇️the sound of metal being warped snaps you back to reality, it seems you still have time."
}
 elseif r10==3 then
  s[10].m[#s[10].m]="the sound of metal being ripped open is deafening, yet somehow the beat of your own heart eclipses that. "
  s[10].b[4]={"you couldn't put it off anymore, you needed to check the door.⬇️still, nothing could have prepared you for what you'd see on the other side. ",
"each of the living quarter doors had been broken open.⬇️the only door that hadn't been destroyed was the one you were looking through.⬇️what you saw on the other side was getting ready to fix that.",
"there was only one light on in the room, barely flickering... but you could see some sort of floral amalgamation shambling towards the door, made only of vine and branches.⬇️it was humanoid, though clearly wasn't human. what it *was* was dangerous.",
"you quickly ducked your head away, it might not have noticed you yet... but you had no time.⬇️in a minute or so, it'd try to break down the door to get into here.⬇️you needed to find a hiding spot.",
"luck was on your side, as you remembered there was a somewhat empty storage cabinet nearby. ⬇️you acted quickly and shoved everything out of it before jumping inside and closing the door. ",
"it wasn't a moment too soon either, as the door quickly let out a metallic groan as something started to break it down.⬇️the next minute was insanity for you, and each pound of the door felt like it was the grim reaper knocking on your door. ",
"finally... the creature broke down the door and walked in. you would've grasped your own heart to stop it from beating so loudly if you could've, as you were so terrified of making a sound.⬇️it was dead silent in the room, with only the sound of the clutter being moved as the amalgamation walked around. ",
"it stopped near your cabinet for a few moments, and your vision began to spin...⬇️yet it moved on. ⬇️it took another few minutes before it turned around and left through the door it entered from... and relief swam through your body. ",
""
}
 end
--room11--
elseif proom==11 then
 if dsel==1 then
  td[7]=1
 elseif dsel==2 then
  s[11].b[2][3]=s[11].b[2][2]
 elseif dsel==3 then
  jrnl[4]=1
 	s[11].b[3][7]=s[11].b[3][6]
 elseif dsel==4 then
  jrnl[5]=1
 end
 if vsub[11][2]==1 and vsub[11][4]==1 and vsub[11][6]==1 then
  vsub[11][1]=0
  if td[7]==1 then
   s[11].b[1]=tmp3
  else
   s[11].b[1][3]=tmp3[1]
   s[11].b[1][4]=tmp3[2]
   s[11].b[1][5]=""
  end
  if dsel==1 then
   proom=10
  end
 end
--room12--
elseif proom==12 then
	if td[4]==0 then
	 s[12].m[#s[12].m]="it'd be best to finish your business quickly and leave, this place felt more and more dangerous by the minute. "
 end
	if dsel==1 then
	 bp[8][2]=1
	elseif dsel==3 then
		jrnl[3]=1
	elseif dsel==4 then
	 if td[5]==0 then
	  td[5]=1
	 elseif td[5]==1 and bp[8][2]==1 then
 	 td[5]=2
 	 vsub[12][4]=0
 	 s[12].b[4]={"you step into the doorway. you had to be close to the finding the answers... and the valuables.⬇️what happened here?⬇️what remained here?⬇️what would you do?⬇️these questions would be answered soon."}
 	elseif td[5]==2 then
 		proom=11
 		bp[8][2]=0
 	end
	elseif dsel==5 then
	 if vroom[10]==0 and td[4]==0 then
	  vroom[9]=0
	  s[9].m={"at least... you had intended to enter the room. yet, you saw it through the glass, *something* was moving around in the vines along the wall.⬇️you could feel your heart in your throat, and you struggled to breath as panic set in.",
"thankfully, you hadn't opened the door yet. your mind tried to think of any escape plan it could as it looked at the writhing vines moving in the walls. for now, only one option remained."}
	  s[9].c={"step away from door"}
 		s[9].b[1]={"quickly, you back away from the door, hoping that perhaps it was a trick of the light, and that when you were ready to leave, you'd see that it was a trick of your imagination."}
   s[11].m[#s[11].m]="did that sound come from that shadowy mass in the halls?⬇️...it would be best to hurry up your investigation."
 		proom=9
 		td[4]=1
 	end
	end
	if bp[8][2]==1 and td[5]==1 then
	 s[12].b[4]={
"holding the metal pipe you found in your hands, you approach the erratic door. you weren't sure if this'd work, but it was worth a shot.⬇️quickly, as the door started to open, you jam the metal pipe into the frame. ",
"as the door tries to close again, it hits the metal pipe and a *loud* whine comes from the door. you can hear the mechanisms in the door give great protest to the pipe, before finally the door comes to a stop. the metal pipe was now stuck and the door unable to move.",
"you can now move to the next room having defeated the door. you decide to spend a minute longer looking through the room, in case you missed anything.",
""}
	 vsub[12][4]=0
	 s[11].b[7][1]=tmp2
	 s[11].b[8][1]=tmp2
	 s[11].b[9][1]=tmp2
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
 --setting backpack
 r4(flr(#bp/4),3,bp,2)
 --setting room
 for i=1,#digits do
  if digits[i]==hotel[6] then
   proom=i
  end
 end
 --setting preview
 r4(2,6,pr,1)
 --setting rooms
 r4(3,8,vroom,nil)
 --setting journal
 r4(2,11,jrnl,nil)
end

--color
for i=1,#clr do
 imp=imp..digits[clr[i]+1]
end
--backpack
imp=l4(flr(#bp/4),bp,2,imp)
--position
imp=imp..digits[proom]
--previews
imp=l4(2,pr,1,imp)
--rooms
imp=l4(3,vroom,nil,imp)
--journal
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
