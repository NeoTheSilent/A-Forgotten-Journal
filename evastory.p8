pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- default functions

function _init()
proom=15
inv=false
invn=1
tcheck=true
tpick=0
clr={2,3,1}
clw={"ui","text","background"}
bckclr=1
--
bp={
{"g. keycard",0,"a keycard that has been stained green. most of the info on it has faded. "},
{"keycard n.1",0,"a keycard numbered 1. you can also make out the word 'decontamination' on it. "},
{"evacurine",-1,"a small bottle of medicine. it looks expensive. the label says evacurine"},
{"shears",0,"a pair of pruning shears, the blades stained green. it's quite sharp."},
{"metal rod",0,"a sturdy metal rod. it seems strong, but is showing signs of rust."},
{"stained key",1,"a key you found in ethe's room. it should open a certain lock."},
{"herbicide",1,"a bottle of industrial herbicide, able to kill any plant in seconds."},
{"ethe's card",1,"a keycard you found in the living quarters by a corpse. should open any room. "}}
jrnl={0,0,0}
td={0,0,0,0,0,0,0,0}
--
pr={
{0,108,115,3},{0,108,107,1},
{0,116,107,3},{0,116,99,2},
{0,116,91,2},{0,108,91,2},
{0,108,99,2}}
vroom={0,0,0,0,0,0,1,0,0,0,0,0,0,0,0}
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
{0,0,0}
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
{
m={
"welcome to \"a forgotten journal\". this will act as your tutorial.⬇️you can press z to advance dialogue or make choices, but only when all text is displayed. please press z to continue.",
"good! you've got the hang of it. you can also press x to skip the text scrolling.⬇️x will also allow you to check your inventory when there is no text being scrolled. you can use the inventory to check your save code, in case you wish to continue at a later time. ",
"lastly, this visual novel will allow you to explore individual parts of an area. as you explore, areas you've already looked through may update, so please remember to check around when you get something new. i hope you enjoy!⬇️- neo",
"life hasn't been particularly kind to you. you barely can scrape together the money for your little sister's medicine or the food for the two of you. yet, an opportunity has presented itself.",
"in front of you is an certain building, one that held plenty of bad rumors. last month, an explosion was reported from the inside of the building. not a single inhabitant was found, with most guessing that they had perished or fled. it didn't matter what the truth was. it wouldn't be investigated, not in this part of town. ",
"the building looked like it could collapse at any moment, and nobody wanted to test their luck looting the place.⬇️still, that meant that there was a good chance you could find something worth taking in here. you carefully make your way into the building, moving past the rubble.",
"the door was blocked off, but you could see a window. after carefully moving around the broken glass, you hop inside.⬇️most of the rooms were too damaged by the explosion for anything of value to have survived. it was expected, but still disappointing. only one room showed promise, a small office room.",
"the room wasn't hit as hard by the explosion.⬇️a large desk seem to hold the most promise, and a few other areas hold potential for investigation."
},
c={
"look around room",
"check large desk"
},
b={
{
"as you look through the room, you're surprised to see that a number of vines and other plants have started to grow in the room. to think that only a month ago the building had exploded, yet nature still tried to rebuild. it didn't make much sense to you, it was too soon, but it was still admirable.",
"looking through the room, you walk up to a bookshelf, it seems to be undamaged to your surprise.⬇️as you check around it, your finger brushes against a hidden button on its side. with a mechanical whirr, it sinks into the ground until only the top is visible. ",
"in front of you seems to be a larger door, something that wouldn't look out of place in the sci-fi books that your sister likes reading.⬇️the door lacks a handle to open it, instead there's a card reader on the frame. ",
"you check around the room again, concerned you might've missed something. yet, while there's a lot to look at, there's nothing useful for you."
},
{
"as you walk up to the desk, you're surprised to see it still in tact. the explosion must not have been as bad in this room. you spend a few minutes rummaging through the drawers, ultimately finding a keycard inside a half-open drawer.⬇️it's stained green, and has a few leaves next to it, but otherwise looks usable. ",
"outside of the keycard, nothing else in the desk seems to be worth taking. pocketing the keycard, you decide to continue looking around the room.",
"you check the desk again to see if you might've missed anything on your initial sweep. after a few minutes, you find that you were quite thorough the first time, there's nothing you missed. "
}
}
},
--room3
{},
--room4
{
m={
"as you enter the room, a few dim lights turn on. this room looked like a plant zoo of sorts, as there were plants in glass containers everywhere.⬇️without warning, a small beep chimes out, and a gentle mist of water sprays onto the plants.",
"seeing this, you understand how the why there were puddles everywhere, as a few containers had been broken open, and the water leaked out.⬇️you could also see a larger map along the wall, as well as some cabinets and desks. this room was also closed off, there was no other door.",
"there was no time like the present, it was time to get to work. you needed to find something for your sister after all... she couldn't go on longer without her medicine."
},
c={
"look around room",
"check map",
"check desks",
"leave room"
},
b={
{
"there's a lot to take in with the room. vines are coming from the vents along the wall, and there's a lot of scientific equipment that you don't exactly understand.",
"you see a few flowers in the glass containers. one in particular is flourishing, in a container that had been broken by something. perhaps you'll take it for your sister before you leave. ",
"outside of a few flowers you'd like to take with you, there's nothing that jumps out at you."
},
{
"whoever lived here was kind enough to leave a map on the wall. ⬇️right now, you were in the research room. the neighboring room was the observation room, which made sense as you remembered the large window.⬇️it's a shame you couldn't look through the window. ",
"past that were two decontamination rooms and a hallway that connected them.⬇️that hallway also led to a room called the experimentation room and \"subject's room\".⬇️it might be worth looking in there for expensive scientific equipment.",
"otherwise, past the northern observation room, there was another set of larger rooms, one labelled as the living quarters and one as the storage room.⬇️those two seemed to hold the most promise for looting. it'd be best to go there first.",
"having fully examined the map, you tried to remove it from the wall to take it with you, but it was stuck behind thick glass.⬇️ultimately, you decide that if you wanted to revisit the map, it'd be best to come back here.",
""
},
{
"as you go through the desks, you find a keycard marked with the number 1 on a desk by the north wall near a vent. taking the card, you continue looking.⬇️while you find a few confusing documents and devices, they're not useful at the moment. when you're leaving, it might be worth taking them to sell later. ",
"you take a second look through, but there's nothing else worth noting in the various desks."
},
{
"as you move to the door, you can't help but feel that you're leaving too early.⬇️there's still a few things worth checking here.⬇️with that, you decide to continue looking."
}
}
},
--room5
{
m={
"the sound of water dripping from leaking pipes echoes around you as you make your way down the stairs.⬇️as your hand brushed over a vine, it struck you as odd. ",
"if it were a few years, plants growing would seem strange. yet, it'd only been a month since that explosion.⬇️the flowers around you shouldn't have grown so easily with only a few lightbulbs for light and some dripping water for sustenance.",
"you'd have to think more of it later, you made your way to the bottom. in front of you was a single painfully white door, the type that you'd expect in a hospital or laboratory.⬇️the only color staining the door is a splatter of red and green near the bottom. hesitation grasps your heart as you look at it. ",
"you could leave now, and it may be the wise decision. still, you need to find something valuable here, otherwise your sister will...⬇️fear is something that must be conquered, you take a step forward, moving towards the door with a trembling hand. ",
"like the door upstairs, it required a keycard to open as well. you swipe your card, and it opens with a low hum.⬇️a thin layer of mist comes in from the doorframe as it opens. from an initial glance, it seemed that this place was a laboratory after all.",
"yet, you could be forgiven for thinking it was a green house, as there were no shortage of plants in the room.⬇️you'd be hard pressed to find a single surface that didn't have any plant on it. ",
"you carefully step into the room, trying not to trip on any of the plants.⬇️looking around the room, it seems there's a lot more to explore than there was upstairs.",
"there's a window that spanned across the opposing wall, and a single book catches your eye, lying next to the window on a table. you could also see two sets of doors to each side of you, as well as a few desks and computers in the room itself."
},
c={
"look around room",
"check window",
"check desks",
"check computers",
"enter left door.",
"enter right door.",
"go back upstairs."
},
b={
{
"as you step through the room, you see plenty of puddles and plants on the ground. the room looks like it's been abandoned for a long time...⬇️the explosion only happened a month ago, it couldn't have gotten this bad already. still, it almost looks beautiful how nature has reclaimed this room. ",
"there seems to be nothing of importance lying around in the room, at least nothing that's usable."
},
{
"you walk up to the larger window. peering through the glass, you try to make out what's on the other side. to your dismay, it was too dark on the other side of the window, you could only make out vines on the other side of the glass.⬇️at least it wasn't the only reason you walked over here. ",
"a journal lay on a table next to you, wrapped in vines. it takes some time to pry the journal from them, as they had wrapped around it quite tightly.",
"ultimately, you prevail against mother nature, giving the vine a rather triumphant look as you hold the book in your hand... though your grin fades as you realize that you're looking rather silly for boasting against a plant. ",
"shifting gears, you decide to look through your new book, to see if there's anything inside that can help you.⬇️a majority of the pages were either too stained to read, or were crudely ripped out. thankfully, one page remained somewhat legible. ",
"\"january 5th, 20█\"⬇️\"this journal exists to document the results of our █, to ensure that we will overlook no █ this time.\"⬇️\"we can't afford to make another mistake. we lost █ and █ during the raid last month, and a number of our test subjects with them.\" ",
"\"it's been difficult finding new █. we can't rely on our supplier, due to the risk that they may be █.\"⬇️\"we're lucky that inne had this building ready in the event of something like this occurring.\"",
"\"only four of us are left, the rest captured or killed. still, we can't give up on our dream now. we'll surpass the limits of █ █ no matter what. we simply need time and █ for it.\"⬇️\"we went to a local █ today, one that off the books. it should make it much easier for us to get what we want.\"",
"\"they'd █ sell us out if trouble came their way, yet they won't ask any questions so long as we have the █. we could get as many █ █ as needed. we'll work with them.\"⬇️\"yet, even with our █, we can't throw out the thought of any quality control.\" ",
"\"for our █ to succeed, we must have the best of █ best, █ █ █ █\"⬇️\"█ █ is our hope for █...\"⬇️the rest of the page is illegible. you hesitantly close the book and put it in your pocket. this place... what happened here? doubt starts to stain your mind as you look around the room. ",
"you check the window to see if anything changed, but unfortunately you still can't see anything on the other side."
},
{
"considering this place looked like a laboratory, it may be possible that you could find medicine here. with that thought, you start to rummage through the desks.⬇️if *that* medicine was here, it'd save you a lot of trouble. your sister's medicine has gotten terribly expensive after all. ",
"you do happen across a few vials of medicine labeled as \"evacurine\". you're not sure what it is, but it seems like it could be valuable. taking them now is rather risky, so you make a mental note to take them before you leave, as you don't want to accidentally break them. ",
""
},
{
"flicking the power button, you try to turn on the computers. it takes a moment, but to your surprise the screen turns on with a simple message.",
"[main power supply is damaged. auxiliary power supply is stable.]⬇️[the facility is in emergency mode. please disable emergency mode in the living quarters to resume normal operations.]",
""
},
{
"walking up to the door, you see it runs on a similar system to the other doors, needing a keycard to get in. a red light shines above the door, displaying that it's locked.⬇️with nothing to lose, you swipe your keycard. the red light above turns to green as it opens. cautiously, you enter the room."
},
{
"the right door looks similar to the other doors you had seen here, with a red led above it and a scanner allowing entry. you take out your keycard and swipe it through the scanner.⬇️unfortunately, it doesn't work as the scanner lets out a negative beep and the door remains closed."
},
{
"you've only arrived a short time ago, but you're already starting to consider abandoning this place. there's a lot down here, and the things you could take could keep you and your sister fed for ages... but it certainly didn't seem safe. if something happened to you down here, then you'd both be in terrible trouble.",
"still, there's a few things you wanted to check first. when you're finished looking, you'd come back here and leave right away.",
""
}
}
},
--room6
{
m={
"as the door opens, you can't shake the feeling that you're being watched.⬇️it was as if something was behind you, hands ready to grasp your throat, yet disappearing when you tried to look.",
"yet, you hadn't seen any cameras around, nor had a security room been on the map and few things could survive down here with the doors locked and no access to food.⬇️your mind was playing tricks on you. unless the plants grew eyes, what here could be watching you? ",
"leaving now just because of a 'bad feeling' would be a waste. you're the first person to discover this place after all!⬇️with some luck, you could make enough money to feed you and your sister for months!",
"if you were lucky enough, there might even be some medicine for her here.⬇️leaving now wasn't a choice. besides, you can't help but feel curious:",
"what exactly happened down here?⬇️why did the laboratory get to this state?⬇️what happened to the people here?",
"with these thoughts, you step inside the room. as the map had said, it seems this room was a decontamination room. you spot three unique places, a closet with hazmat suits, a small glass shower, and what looks like a large scanner.⬇️there also seems to be a few desks and cabinets to go through. you certainly have your work cut out for you. ",
},
c={
"look around room",
"check hazmat suits",
"check shower",
"check smaller desk.",
"check larger desk.",
"enter the scanner.",
"enter left door."},
b={
{
"as you look through the room, outside of the plant infestation, you see something shining in the corner of the room. walking over to it, you find shears lying on the ground. you take them for now, they could be useful.",
"outside of the various plants, there's nothing that stands out to you right now."
},
{
"there's a number of suits here. still, it makes it all that more concerning that you haven't found anyone here. a few seem to be missing⬇️you search the suits, but there's nothing worth taking within. oh well...",
"concerned that you may have missed something, you check the pockets again.⬇️you find something this time, a spare handkerchief. it looks rather nice at least, though not helpful. "
},
{
"a small shower, it seems to exist only to wash you down before you enter or after you leave.⬇️it doesn't take you long to check, it's a shower after all. you discover only one thing:⬇️there are plants were growing in the shower grates. ",
"as you check around, you think about taking a quick shower for a single second, before writing the idea off as foolish.⬇️you'll have to water the plants in the grates another time."
},
{
"you check the drawers on the smaller desk and see a smaller notepad. jotted on the surprisingly dry pages seems to be instructions.",
"[the door to the hallway won't open unless the scanner detects no plant matter. this includes evaconvolvulus, so be careful that nothing sticks to you. if something goes wrong, it'll lock down the door until the issue is resolved.⬇️- ethe]",
""
},
{
"you rummage through the larger desk, and ultimately, find a few pages seemingly torn out of a notebook. seeing no reason not to, you begin to read them.",
"\"march 15th, 20█\"⬇️\"time isn't on our side, the more we dawdle, the more we risk █ finding us. still, even if it took █ days, it was important to find a proper █ █.\"⬇️\"it took some time and a small bribe, but we █ the caretaker that it was █ to have the █ take a █\" ",
"\"we must ensure that we get the perfect █.\"⬇️\"thankfully we found our test subject. she had shown quite a bit of █, she was quite smart for her █, and she passed the physical. we have decided that we would be our █ █.\"",
"\"we've taken her here, and put her in a side room to live in. she's locked in there, not that we should be concerned about escape. she's only █ after all. for the purpose of our project, we have decided that she should have a name.\"",
"\"the one that the director had used was rather dull. we decided to call her eva.\"⬇️\"with all the preparations done, we can begin our tests soon. should our luck hold, then we won't need another █ subject.\"",
"\"now, it was important to apply the results of our research and reach the next stage in █ █.\"⬇️...⬇️it takes some time to come to terms with what you had read. ultimately, you pocket these spare pages and continue moving, unsure of what to do next. ",
"you check through the larger desks again, but nothing remains. you can't help but remember the journal as you rummage through them...⬇️what happened here? "
},
{
"you approach the scanner. to get to the next room, you'll have to enter it. as you peer inside, you see some vines on the ground, a led display, and a few buttons.",
"as you step inside, you press the button, and a glass panel rises up behind you to close you in.⬇️after a few moments, the top of the scanner lights up, completely covering the top with red light. after a few moments, it begins moving downwards.",
"you brace yourself, hoping nothing would go wrong. the lights hit the top of your head.⬇️it continues down peacefully until it reaches the bottom, where it fades away.⬇️you feel no different, and the display screen light up with odd text.",
"[error - evaconvolvulus detected. doors have been locked.]",
""
},
{
"concerned that you may have missed something, you decide to return to the observation room for now. swiping your card through the scanner, you walk through the door."
}
}
},
--room7
{
m={
"as you stepped inside the room, it was painfully quiet.⬇️you had been running and hiding from this monster for too long... but now?⬇️nothing.⬇️that branch monster was nowhere to be found.",
"instead, what was in front of you was a room looked like a child's room that turned into a greenhouse, the vines were everywhere.⬇️yet, the rest of the room didn't matter right now. ",
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
m={"nothing"},
c={"nothing"},
b={{""}}
},
--room9
{
m={
"as you stepped into the room, you understand why the scanners were necessary. this hallway had been taken over by plants.⬇️the other rooms looked prim and organized compared to this garden of a room. you couldn't move without stepping on a vine.",
"as you move into the room, ducking to avoid some of the hanging vines, you could make out some details.⬇️there were two doorways, the one across the hall was likely the north decon. room.⬇️the one to your west was the experimentation room. ",
"there was little you could do in this overgrown hallway, it would be best to move quickly... as you could swear that you saw the vines shift around you."
},
c={
"check north door",
"check west door",
"enter south door"
},
b={
{
"like the other rooms, the door in front of you seems to be locked via a card reader. trying your luck, you swipe your keycards through the door. to your surprise, it opens.⬇️this room had been difficult to enter, but it seems leaving was rather easy.",
"you stand at the doorway for a few moments before stepping away from the door. it may be wise to look around a little more before leaving, you wouldn't want to miss anything.",
""
},
{
"like the other rooms, the western door has a scanner.⬇️you try swiping each of your keycards, but the scanner flashes red.⬇️it seems this won't work. ",
"you try swiping your keycards again, but it still refuses to let you through."
},
{
"you don't know exactly what guides your hand to the scanner, but before you realize it, the door to the southern room had opened.⬇️was it concern that you missed something, or was it fear of what was here? ",
"ultimately, you don't know. your mind lags behind as your body moves on its own and you return to the decontamination room. ",
""
},
}
},
--room10
{
m={
"when you walk in, an odd feeling of joy and disappointment blossoms within you.⬇️joy from the fact that here was the storage room, likely packed to the brim with valuables and goodies. you finally got here!⬇️yet, disappointed from a simple fact.",
"this place looked *awful*. it looked like it was organized by a chipmunk that had finished three different coffees and at least one soda.⬇️it'd take ages to look through here and see what was valuable and what was trash. even with the state of this facility, how had it gotten so bad?",
"your thoughts were interrupted by a message you had heard a number of times before, yet never wished to hear again.",
"",
"it was quiet, but you could tell it came from the room across the living quarters. why had it-⬇️you received your answer before you could even finish your thought. as the sound of metal being smashed through echoed through the facility. ",
"you hadn't exactly gone to school, but you were still plenty smart enough to know one simple fact.⬇️you were in trouble.⬇️something was here, and it was following you.",
"you likely didn't have long, so you needed to look through here fast.⬇️there were no other doors other than the one that you come through, and a number of containers.⬇️you needed a way to protect yourself or hide, and a way to get out of here. you can't take your time."
},
c={
"check shelves",
"check containers",
"check boxes",
"leave room"
},
b={
{
"",
},
{
"",
},
{
"",
},
{
"as you move towards the door, you see something on the far wall of the next room.⬇️the door that had jammed shut lets out an awful groan something grabs at the door and forces it open, warping it in the process.",
"after a few moments, the door is torn open, hanging loosely half open as an amalgamation of branches and vines lumbers into the room.⬇️your heart stops for a few moments. like a deer caught in headlights, your mind emptied as it tried to comprehand what it was. ",
"there's no doubt, if that thing catches you, it won't end well.⬇️it's looking around the room slowly, you can't leave now. you have to wait until it leaves... or better yet, hide.",
"you don't know why it's checking through here... it might not know that you're here yet. if you hid well, it might leave and give you a chance to escape!",
"with that thought, you step away from the door.",
""
},
}
},
--room11
{
m={
"as you step into the room, you're shocked by the state of the room.⬇️in front of you were tables, bookshelves and other furniture you'd expect from a place called the \"living quarters\". they were coated in dust, but otherwise were in perfect condition. ",
"it didn't make sense. the rest of the facility looked awful, yet this one only needed a little dusting. furthermore, not a single plant could be seen in here.⬇️as you think things over, a sharp metal whine sounds out behind you.",
"you look just in time to see the metal pipe bend before flying into the previous room, clanging loudly as the door shut in front of you. quickly, you try to swipe your card to open the door.⬇️*click*⬇️the led lights up, but the door stays closed. you're stuck in here.",
"it seems that you'd be spending some time here whether you wanted it or not.⬇️a number of side rooms are present, judging from the nameplates, they're the rooms for those who lived here.⬇️you should be safe to check them, you doubt the inhabitants are still here after all. ",
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
"",
"odd... you had gotten all of the vines when you entered.⬇️you spend a minute looking around, only to notice a stray vine was half inside your pants pocket.⬇️you don't remember putting it in there. tossing it out, you press the scan button once more.",
"",
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
b=
{
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
{
m={
"as you climb up the stairs, you consider returning here to loot more in the future... but this place seems too risky.⬇️who knows, the previous owners might come back and give you hell if they find you here.",
"what happened down there?⬇️why did things turn out this way?⬇️these questions faded from your mind, unanswered.⬇️you heard a rumor about some *thing* leaving this place in the following weeks, but it wasn't your problem anymore.",
"the items you found down here sold for a pretty penny, and you could buy your sister medicine and food for a few weeks. before long, even the memory of this place faded from your mind. it was time to move on.",
},
c={"return to title"},
b={{"game over⬇️ending \"c\"⬇️thank you for playing."}}
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
"you didn't scream... rather, you couldn't even make a sound as you gasped for air.⬇️the bottle dropped from your hand, falling loudly to the floor next to the pod. ",
"searing hot pain infested your body, and before your body started to shut down.⬇️it was clear... there would be no saving you.⬇️this would be a dream you would never wake from. ",
"your vision started to fail, but you managed to see one last detail before it all faded away.⬇️bright green eyes dyed with hate stared at you, from not only the girl... but from each and every flower in the room."
},
c={"return to title"},
b={{"game over⬇️ending \"d\"⬇️thank you for playing. "}}
}
}

t={
m={""},
c={
"start new game",
"load game",
"options"
},
o={"use the arrow keys to change your settings, and press z when you are done."}
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

if tcheck
then
	titlescreen()
else
	if inv then
		pckt()
	else
 	dial(s[proom])
	 grid()
	end
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
print("save code: ",8,116,clr[2])
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
	
	if td[8]==1 then
	 blink({001,013},proom<12,1,108+((proom-10)*8),91)
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
 if false then
	 print("bp[3][2]: "..bp[3][2],5,80,clr[2])
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

--room2
if proom==2 then
	if dsel==1 then
		s[2].c[3]="open the door"
		pr[1][1]=1
		if bp[1][2]==0	then
			s[2].b[3]={
"try as you might, the door to the next room is locked via a keycard reader, and you don't have a keycard.⬇️you're not one to give up easily. as you plot on how to open the door, you see a spare metal bar.",
"wedging the metal bar against the door, you try to force it open.⬇️the only result you gain is the gift of pain, as the bar comes loose.⬇️as you slip and hurt yourself, you come to the realization that you'll need to find a keycard.",
"you were never quick to give up. picking up that same piece of metal, you try to wedge open the door again.⬇️a few minutes pass, and while your arms are ready to throw in the towel, the door hasn't moved an inch. it's becoming clearer that you're going to need a keycard. "
}
		end
	elseif dsel==2 then
		bp[1][2]=1
	 vsub[2][3]=0
		s[2].b[3]={
"you swipe the card through the reader, and the door opens with a faint rumbling.⬇️a dim light illuminates the room, a spiral staircase covered in vines and other flora was visible, one whose bottom you could not see. ",
"you had finished your investigation up here, and had found nothing of value.⬇️this set off red flags for you, but you couldn't leave now, not empty-handed.⬇️with a heavy heart and a careful foot, you descend down the stairs.",
""}
	elseif dsel==3 then
		if bp[1][2]==1 then
		 proom=5
		 pr[2][1]=1
	 end					
	end
--room3--
--room4--
elseif proom==4 then
 s[4].m[#s[4].m]="this botanical zoo looks breathtaking, it's hard to focus on the investigation as you look at the beautiful plants.⬇️still, you can't afford to get distracted now, there's work to be done."
	if dsel==2	then
	 vsub[4][2]=0
	 td[1]=1
	 s[4].b[4]={"satisfied that you've looked through the room properly, you leave the room from the way you came."}
	elseif dsel==3 then
		bp[2][2]=1
  s[6].b[6][4]=sc1
  s[6].b[6][5]=sc1
		s[5].b[6]={"walking up to the door, you take your newly acquired keycard and swipe it. after a few moments, the led above the door flashes green. the door opens, and you're free to explore this new area. "}
	elseif dsel==4 then
		vsub[4][4]=0
		if td[1]>0 then
			s[5].m[#s[5].m]="this \"observation\" room seems no different from how you had left it.⬇️you take a few moments to consider your next move as you look around."
		 s[5].b[5]={"you can't help but feel that you missed something in the research room. with that, you swipe your keycard and enter the room."}
			proom=5
		end		
	end
--room5--
elseif proom==5 then
	if dsel==2 then
		jrnl[1]=1
	elseif dsel==3 then	
	bp[3][2]+=1
	s[5].b[3]={
"thinking about it more, you decide to put the medicine in your satchel, as you don't want to forget about them when you're getting ready to leave.",
"you check the desks again, but there doesn't seem to be anything else worth taking right now."}
	 if bp[3][2]<1 then
			vsub[5][3]=0
	 end
	elseif dsel==4 then
		s[5].b[4][3]=s[5].b[4][2]
	elseif dsel==5 then
		proom=4
		vsub[5][5]=0
	elseif dsel==6	then
		vsub[5][6]=0
	 if bp[2][2]==1 then
		 proom=6
		 pr[3][1]=1
		else
		 s[5].b[6]={"you try to swipe your keycard again, but like last time the scanner refuses it.⬇️it seems you may need a different card, or another way in. "}
		end
	elseif dsel==7 then
	 if td[6]==1 then
	  proom=13
	 end
	 vsub[5][7]=0
	 s[5].b[7]={"the decision to leave wasn't a hard one to make, this place looked too dangerous.⬇️one bad slip is all it'd take for you to hurt yourself on some rusty metal or worse.⬇️you had taken a few things already,  they'll have to do for now."}
	 td[6]+=1
	end
--room6
elseif proom==6 then
 s[6].m[#s[6].m]="each drip from the leaking pipes sounds like a gunshot now. the room seems no different right now, but it would do you well to speed up your investigation.⬇️there shouldn't be anything to fear... but something about this place screams danger."
 --
	if dsel==1 then
  bp[4][2]=1
 elseif dsel==4 then
		s[6].b[4][3]=s[6].b[4][2]
	elseif dsel==5 then
  jrnl[2]=1
	elseif dsel==6 then
	 td[2]=1
		if bp[4][2]==1 and vsub[6][4]==1 then
			pr[4][1]=1
			proom=9
		end
	elseif dsel==7 then
		vsub[6][7]=0
		proom=5
		s[5].b[6]={"taking your keycard out, you swipe it through the reader. the door unlocks again without issue, and you step through. thankfully, the keycard doesn't seem to be a one time use. "}
	end
	--
	if vroom[9]==0 then
		if bp[4][2]==0 then
		 if vsub[6][4]>0 then
		  s[6].b[6][5]=tmp
		  s[6].b[6][6]=tmp
		 end
		elseif vsub[6][4]==1 then
		 if td[2]==1 then
	s[6].b[6]={
"you step into the scanner, shears in hand. the note had said that this 'evaconvolvulus' was plant matter. there wasn't anything stuck to your clothes, so it must be the vines on the floor.",
"with some regret in your heart, you trim away at the vines. you pick up the remains and toss them out of the scanner. you couldn't get it perfectly, as they seemed to originate from a small crack in the floor, but you've gotten as much as you can.",
"with that done, you restart the scanning procedure. the laser comes down and after a few moment the scan completes. you open your eyes as the glass door ahead of you finally opens, revealing the now unlocked doorway to the next room.",
"carefully, you step through into the next room.",
""}
	 	else
	s[6].b[6][5]="as you read the screen, a lightbulb goes off in your head. the evaconvolvulus, or whatever it was, was a plant.⬇️there were plants down by your feet and thankfully, you were smart enough to bring the shears in with you. "
	s[6].b[6][6]="after a few minutes of careful trimming, the scanner is as vine free as it'll get. you toss out the trimmed vines and press the scan button once more.⬇️the scanning process goes smoothly, though you almost blind yourself by opening your eyes too early. to your delight, the screen has a new message for you."
	s[6].b[6][7]=sc2
	s[6].b[6][8]="the doors in front of you and behind you open, revealing the hallway. carefully, you step into the next room. "
	s[6].b[6][9]=""
	  end
	 end
	end
	--
	if vsub[6][4]==1 and bp[4][2]==1 then
	 vsub[6][6]=0
	end
elseif proom==7 then
 if dsel==1 then
  proom=14
 elseif s[7].c[dsel]=="save child" then
  proom=2
 elseif s[7].c[dsel]=="use herbicide" then
  proom=15
 end
elseif proom==8 then
 if dsel==1 then
  proom=7
  if bp[6][2]==1 then
   add(s[7].c,"save child")
   add(s[7].b,{"this is test1"})
  end
  if bp[7][2]==1 then
   add(s[7].c,"use herbicide")
   add(s[7].b,{
"you couldn't be blamed for what you did. whatever was in front of you, it *wasn't* human.⬇️nobody could survive chained up in an environment like this.⬇️it was pretending to be a child, to get you to lower your guard.",
"if the journals were to be believed, then this child-⬇️no, plant was the one that killed the three humans you saw here.⬇️it was dangerous.⬇️it would kill you.⬇️you had to defend yourself. ",
"that branch amalgamation would be here soon.⬇️this was your only chance to end it.⬇️that's why you did it.⬇️with fear in your eyes, you took the herbicide from the storage room out and poured it into the pod.",
""})
  end
 end
--room9
elseif proom==9 then
	if vroom[10]==0 then
		s[9].m[#s[9].m]="the longer you spend in this room, the more it feels like the plants are moving around you. was it just your mind, or were they shifting beneath your feet?⬇️it would be best to keep moving."
		vsub[9][1]=0
		vsub[9][3]=0
		if dsel==1 then
		 if td[4]==0 then
				s[9].b[1]={"hestitation would not get you any closer to your goal. you enter the room with your heart in your throat."}
				s[12].m[2]=sc1
    s[12].m[4]=sc2
    s[12].b[5][2]=sc2
			else
				s[12].m[#s[12].m]="your mind desperately tries to take it's mind off what it had just seen... it must've been a trick of the lights, just as the shadows at night pretend to be beasts to scare children."
			end
			if td[3]==1 then
				proom=12
				pr[5][1]=1
			else
		 	td[3]=1
		 	s[9].c[1]="enter north room"
		 end
		elseif dsel==3 then
   s[6].m[#s[6].m]="as you step into the room, for just a moment, you could swear that you heard the faintest roar of a monster behind you.⬇️yet when you looked, there was nothing.⬇️this place was starting to get to you...you had to stop reading your sister's horror books."
   s[6].b[6]={"entering the scanner again, you swipe you press the button and wait for the scan to complete. after a few moments, the door to the hallway opens and you step inside."}
			proom=6		
		end
	else
		if dsel==1 then
			proom=8
		elseif dsel==2 then
			proom=6
	 end
	end
--room10--
elseif proom==10 then
 if dsel==1 then
  proom=11
  --debug
 elseif dsel==4 then
  s[10].c[4]="wait and hide"
  td[8]=1
 end
--room11--
elseif proom==11 then
 if dsel==1 then
  td[7]=1
 elseif dsel==2 then
  s[11].b[2][3]=s[11].b[2][2]
 elseif dsel==3 then
 	s[11].b[3][7]=s[11].b[3][6]
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
	 bp[5][2]=1
	elseif dsel==3 then
		jrnl[3]=1
	elseif dsel==4 then
	 if td[5]==0 then
	  td[5]=1
	 elseif td[5]==1 and bp[5][2]==1 then
 	 td[5]=2
 	 vsub[12][4]=0
 	 s[12].b[4]={"you step into the doorway. you had to be close to the finding the answers... and the valuables.⬇️what happened here?⬇️what remained here?⬇️what would you do?⬇️these questions would be answered soon."}
 	elseif td[5]==2 then
 		proom=11
 	end
	elseif dsel==5 then
	 if vroom[10]==0 and td[4]==0 then
	  vroom[9]=0
	  s[9].m={"at least... you had intended to enter the room. yet, you saw it through the glass, *something* was moving around in the vines along the wall.⬇️you could feel your heart in your throat, and you struggled to breath as panic set in.",
"thankfully, you hadn't opened the door yet. your mind tried to think of any escape plan it could as it looked at the writhing vines moving in the walls. for now, only one option remained."}
	  s[9].c={"step away from door"}
 		s[9].b[1]={"quickly, you back away from the door, hoping that perhaps it was a trick of the light, and that when you were ready to leave, you'd see that it was a trick of your imagination."}
   s[11].m[6]="did that sound come from that shadowy mass in the halls?⬇️...it would be best to hurry up your investigation."
 		proom=9
 		td[4]=1
 	end
	end
	if bp[5][2]==1 and td[5]==1 then
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
	res()
end
	dsel=1
end

function res()
 for i=1,#bp do
  bp[i][2]=0
 end
 bp[3][2]=-1
 for i=1,#jrnl do
  jrnl[i]=0
 end
 for i=1,#td do
  td[i]=0
 end
 for i=1,#pr do
  pr[i][1]=0
 end
 for i=1,#vroom do
  vroom[i]=0
 end
 for i=1,#vsub do
  for j=1,#vsub[i] do
   vsub[i][j]=0
  end
 end
 proom=2
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
-- title screen

function titlescreen()
cdial=t.m[1]

if tpick==0
then
	print("\^w\^ta forgotten\n  journal",20,20,clr[2])
 choices(t)
	if btnp(4) and dsel==1 then
		tcheck=false		
		cdial=s[proom].m[1]
		scrl=0
	elseif btnp(4) and dsel==3 then
		tpick=1
	end
else
	print(sdial(t.o[1]),5,5,clr[2])
 clr[tpick]=opt(clr[tpick],0,15,0)
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
001000001600016000160001000010000100000b0000b0000b0000f0000f0000f0001300013000130000f0000f00012000120000e0000e0000000000000000000000000000000000000000000000000000000000
