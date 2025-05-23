pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- default functions

function _init()
proom=11
inv=false
invn=1
tcheck=true
tpick=0
clr={2,3,1}
clw={"ui","text","background"}
bckclr=1
--
bp={
{"g. keycard",0,"a keycard that has been stained green. most of the info on it has faded."},
{"keycard n.1",0,"a keycard numbered 1. you can also make out the word 'decontamination' on it. "},
{"evacurine",-1,"a small bottle of medicine. it looks expensive. the label says evacurine"},
{"shears",0,"a pair of pruning shears, the blades stained green. it's quite sharp."},
{"metal rod",0,"a sturdy metal rod. it seems strong, but is showing signs of rust."},
{"hazmat suit",0,"a suit that looks like a hazmat suit. it's stuffy, but very durable."},
{"herbicide",0,"a bottle of industrial herbicide, able to kill any plant in seconds."},
{"ethe's card",0,"a keycard you found in the living quarters by a corpse. should open any room. "}}
jrnl={0,0,0}
td={0,1,0,0}
--
pr={
{0,108,115,3},{0,108,107,1},
{0,116,107,3},{0,116,99,2},
{0,116,91,2},{0,108,91,2},
{0,108,99,2}}
vroom={0,0,0,0,0,0,0,0,0,0,0,0}
vsub={
{},
{0,0,0},
{},
{0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0}
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
"life hasn't been particularly kind to you. money's been hard to come by, and it's been difficult getting the money needed for your little sister's medicine.⬇️the odd jobs haven't been doing enough to even keep both of your stomachs filled, you need something that'll get quite a tidy sum for you quickly.",
"thankfully, an opportunity has provided itself for you. in front of you is an infamous office building, one that held notoriety for it's questionable practices.⬇️even for the buildings in this part of town that were questionable at best, this one was always bad news to be around, even if nothing could be proven.",
"last month, an explosion was reported from the inside of the building. not a single inhabitant had been seen since, with most guessing that they had likely perished or fled the city. to be honest, it didn't matter what the truth was. it's not as if it'd be investigated, the police couldn't care less and few had been foolish enough to look around themselves.",
"this left you in a unique position. most of the valuables likely had already been taken or destroyed, but there was a chance that there might be something hidden away.⬇️something that nobody else had found just yet.⬇️something that could be your lucky break.",
"with that thought in mind, you carefully make your way into the building, moving past the barricades that the police had initially put around the building, before they gave up.⬇️a window presents itself to you, and after carefully moving around the broken glass, you're able to hop inside without issue.",
"the room you found yourself in was a small broom closet, with nothing of value. after a quick check, you carefully step out. as you walk around the place, moving as quiet as a mouse, it's clear that the your initial thoughts were correct.",
"most of the rooms were either too damaged by the explosion for anything of value to have survived, or they've already been stripped bare by looters.⬇️it's nothing you hadn't already expected, but a tinge of concern taints your heart. only one room remained, and it seemed to be another office.",
"the room was hit hard by the explosion with burn marks visible all around. it's a miracle that the building didn't collapse, but there seems to be parts that are relatively unaffected. a large desk seem to hold the most promise, and a few other areas hold potential for investigation.",
},
c={
"check large desk",
"look around room."
},
b={
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
m={
"similar to the last room, there were plenty of plants within here, though these were in glass containers instead. to your surprise, the flora seemed to glow ever so slightly.⬇️as you walk in, a quiet alarm goes off. after a few moment, a gentle mist of water sprays onto the plants. ",
"a few dull monitors adorned the room, as well as a few cabinets... though no exit door could be seen. if you wanted to go deeper in, you likely needed to enter the right door.",
"your sister is counting on you, you needed to find something to salvage from this place.⬇️if nothing could be salvaged, then you won't be able to afford her medicine and she'd...⬇️at any rate, there's a few things worth checking here. ",
},
c={
"check cabinets",
"check doors",
"leave the room."
},
b={
{"the cabinets are in a rather sorry state, banged up from having fallen over. thankfully, they seem to be unlocked, so opening it isn't an issue. there's plenty in here, though you're not exactly sure what much of it is. ultimately, the only thing you take from the cabinet is a keycard marked with the number marked 1 on it.",
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
m={
"ultimately, you make your way to the base of the stairs without issue.⬇️the sound of water dripping echoes around you, coming from a few pipes leaking fluids around you.⬇️it'll be impossible to keep your shoes dry, as there's more than a few puddles on the floor.",
"it's odd, the plant life around you shouldn't have grown so quickly. if it were a few decades, it'd be expected but it's only been a month since that explosion.⬇️some growth could have occurred in that time, but with only a few lightbulbs for light, it doesn't make sense for the plants around you to have gotten so lively. ",
"the door ahead of you is closed, but it doesn't match the decor of the office above. it's a painfully white door, the type that you'd expect in a hospital or laboratory.⬇️the only color staining the door is a splatter of red and green near the bottom. hesitation grasps your heart at the sight of it.",
"you could leave now, and it may be the wise decision. still, you need to find something to sell here, otherwise your sister will...⬇️fear is something that must be surmounted, you take a step forward, moving towards the door with a resolute expression.",
"it's an automatic door, but unsurprisingly it's broken after all this time. it tries to open, but only moves an inch or two before closing.⬇️it takes a few minutes and a spare piece of rebar that you found on the ground, but you force it open. from an initial glance, it seemed that this place was a laboratory after all.",
"yet, you couldn't be blamed if you weren't sure. after all, the room in front of you has no shortage of plants covering the tables.⬇️if the stairs looked overgrown, then this was a proper jungle! the plants had completely taken over, it's impossible to find a single surface that didn't have some sort of flora growing on it. ",
"you carefully make your way into the room, trying not to step on any of the plants as you carefully look around.⬇️there's a clear glass window in front of you, showing the room on the otherside... or at least it would. it was completely obscured by the plants on the otherside, with a few cracks at certain points.",
"looking around the room, it seems there's a lot more to explore than there was upstairs.⬇️with two sets of doors, a few desks and a few computers, you'll have plenty of places to check for salvagable items. one of the desks catches your eye, as you see a book wrapped in vines."},
c={
"check journal",
"check desks",
"check computers",
"check glass",
"enter left door.",
"enter right door.",
"go back upstairs."},
b={
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
m={
"as the door opens, you can't shake the feeling that you're being watched. you've seen a few cameras as you walked around the place, but each one had clearly been damaged or destroyed already.⬇️it's as if something was behind you, hands ready to grasp your throat, yet disappearing when you look. ",
"your mind must be playing tricks on you, this place was clearly abandoned after all so it's unlikely you'd find any mad scientists in these halls.⬇️similarly, each of these doors were locked tightly. outside of these plants, it's unlikely that anything else could survive in these conditions.",
"leaving now just because of a 'bad feeling' would be a waste. it's likely you're the first person to discover this laboratory after all.⬇️forget sifting through the looted rubble upstairs, who knows how many valuables could be down here still! ",
"with some luck, you could make enough money to feed you and your sister for months! hell, if you were lucky enough, you might even find some medicine for her down here too without needing to worry about that shady back-alley doctor.⬇️leaving now was out of the question. besides, you can't help but feel curious...",
"what exactly happened down here? why did the laboratory get to this state? what happened to the people here?⬇️it might be risky to stay here, but running away from an opportunity like this would leave you filled with regrets!⬇️with that, you step inside the door with great care. ",
"inside the room, it seems this room looks like a decontamination room. a small glass shower with hazmat suits can be seen, as well as what looks like a large scanner.⬇️there also seems to be a few desks and cabinets to go through. you certainly have your work cut out for you. ",
},
c={
"check hazmat suits",
"check shower",
"check smaller desk.",
"check larger desk.",
"check cabinets",
"enter the scanner.",
"enter left door."},
b={
{
"there's enough suits here for a few people, which makes it all that more concerning that you haven't found anyone... or rather, *anything*.⬇️you fish through the pockets for a few minutes, but there's nothing worth taking within. it would've been too easy if there was a keycard within.",
"concerned that you may have missed something, you check the pockets again. you did manage to find something this time, a spare handkerchief. it looks rather nice, so it might make a fine gift in the future, though it certainly won't help you today."
},
{
"a small shower, it seems to exist only to wash you down before you enter or after you leave. it doesn't take you long to check around, it's a glass shower after all.⬇️unfortunately, your search come up empty. yet, you did discover something... it seemed like the plants were growing in the shower grates. ",
"a few minutes pass as you try to open it, but it seems rather stuck. you'd need something else to open it... ",
"you try to open the grate again, but it's still not budging, much to your frustration.⬇️at any rate, it seems the only thing here for you is the ability to shower, if you see fit... though the thought of showering here doesn't exactly inspire confidence."
},
{
"you check the drawers on the smaller desk and see a smaller notepad. jotted on the surprisingly dry pages seems to be some instructions.",
"[before entering or exiting, the door won't open unless the scanner detects no problematic elements. this includes evaconvolvulus, so be careful that nothing sticks to you when you leave. if something goes wrong, it'll lock down the door until the issue is resolved.⬇️- ethe]",
""
},
{
"you rummage through the larger desk, trying to see if you can find anything. ultimately, you do happen upon a few pages torn out of a notebook. seeing little reason not to, you decide to read them.",
"\"march 15th, 20█\"⬇️\"time isn't on our side, the more we dawdle, the more we risk ███ finding us. still, this was important. even if it took ██ days, it was important to find a proper test subject. it took a lot of persuasion, but we had convinced the director that it was important to have the ██ take a ██\"",
"\"we must ensure that we get the best possible subject.\"⬇️\"of course, a bribe went a long way in convincing the director, and thankfully we found our test subject. she had shown quite a bit of potential, she was quite smart for her █, and she passed the physical.\"",
"\"we couldn't afford to have too many tests here, or we'd risk investigation. thus, we have decided that we'd focus our results on her. our funds were already starting to dry up after all.\"⬇️\"our assessment of the director was spot-on, and with a little extra money, we were able to speed up the process drastically.\"",
"\"we've placed her in a side room that we had made. it didn't matter how nice it was, only that the proper precautions were followed.\"⬇️\"she's locked in there, not that we should be concerned. she's only █ after all. still, even despite the purpose of our project, the others had decided that she should have a name.\"",
"\"the one that the director had used was rather dull. we decided to call her eva.\"⬇️\"with all the preparations done, we can begin our tests soon. should our luck hold, then we won't need another test subject. we already had run plenty of tests in our old location, and we've long since passed the early phases of the test.\"",
"\"now, it was important to apply the results of our research and reach the next stage in ██ ███.\"⬇️...⬇️it takes some time to come to terms with what you had read. ultimately, you put these spare pages in the journal and continue moving, unsure of what to do next. ",
"you check through the larger desks again, but nothing remains. you can't help but remember the journal as you rummage through them...⬇️what happened here?"
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
},
{
"concerned that you may have missed something, you decide to return to the larger observation room for now. swiping your card through the scanner, the led above the door turns green and the door unlocks, letting you walk through with ease."
}
}
},
--room7
{
m={"nothing"},
c={"nothing"}
},
--room8
{
m={"nothing"},
c={"nothing"}
},
--room9
{
m={
"as you looked into the room, it becomes quite clear why the scientists had made it difficult to enter this room. this small hallway was completely filled with vines.⬇️the other rooms looked prim and organized compared to this garden of a room. you could hardly see any of the floor thanks to the vines. ",
"you stepped into the room, ducking to avoid some of the hanging vines in the doorway. if little else, you could make out some details in this hallway.⬇️you could see that directly across the hallway that there was a doorway, and on the left side of the room was another doorway.",
"your thoughts are interrupted as a small but audible beep goes off behind you, and the door closes.⬇️there was little you could do in this overgrown hallway, it would be best to move quickly... as you could swear that you saw the vines shift around you."
},
c={
"check north door",
"check west door",
"enter south door"
},
b={
{
"the door in front of you seems to be locked via a card reader, much like in the decontamination room. trying your luck, you swipe your keycards through the door, and it opens up.⬇️you're taken aback by the ease of this, this room had been difficult to enter, but it seems leaving was rather easy.",
"you stand at the doorway for a few moments before stepping away from the door. it may be wise to look around a little more before leaving.",
""
},
{
"the room to your left has a scanner, like the room you were just in.⬇️you try swiping each of your keycards, but the scanner flashes red and lets out a negative beep. it seems this won't work. it may be worth coming back when you have a new card.",
"you try swiping your keycards again, but it still refuses to let you through."
},
{
"your move towards the decontamination room that you had come into this room from. you don't know exactly what guides your hand to the scanner.⬇️was it concern that you missed something, or was it fear of what was here? ",
"ultimately, your body moves on its own and you swipe the door open, stepping through it and returning to the decontamination room. ",
""
},
}
},
--room10
{
m={"nothing"},
c={"nothing"}
},
--room11
{
m={
"carefully, you step into the hall. you can't help but feel anxious, the pipe was holding for now, but who knew how long it'd hold.⬇️looking through the room, it seems that these were likely the living quarters. ",
"there were six rooms in total, though the nameplates had been scratched out.⬇️you could see a bookshelf, as well as some chairs, tables and other niceties. yet, it seemed out of place.⬇️considering the state of the facility, it was too nice, the damage was minimal.",
"the plants hadn't grown into here at all, and the area looked too intact.⬇️your thoughts were interrupted as you heard a metal groan behind you.⬇️turning to look, you saw as the pipe bend before flying into the other room, hitting the floor with a loud clang as the door closed.",
"it seems your luck ran dry, you hadn't even been in here for a minute before the pipe failed you.⬇️mumbling a curse under your breath, you walk towards the door and try the button.⬇️*click*⬇️...no luck. it didn't open. ",
"you look back to the room, perhaps something here could open the way for you- ⬇️yet again, your thoughts were interrupted as a load roar echoed through the facility.",
"the thought of what could make a sound like that didn't ease your heart... perhaps it was your imagination?⬇️this optimistic thought gave you some hope, but if there were something in here, you've gone and made a nice and loud noise for it. ",
"regardless, it was time to get to work. these rooms wouldn't search themselves, and you held plenty of reason to look through them now. "
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
{""},
{"you cautiously decide to spend a few minutes looking through the desks. a few minutes pass, and ultimately you find something of note: a scrap of paper that was in on top of one of the desks. picking up the piece of paper, you take a proper look at it. ",
"\"there's an issue with the scanner that leads to the experimentation room. if your card doesn't work, come to my room and i'll swap it out with an updated one.\"⬇️\"it's the *third* room from the storage room in the living quarters, in case you've forgotten\"⬇️-ethe",
""
},
{""},
{
"the door in front of you is the farthest from the decontamination room you had been in. this one was labelled as [ikalle's room]⬇️similar to the other rooms here, it seems to be locked by a keycard reader. you try your luck with your keycards... and notably, keycard no.1 manages to unlock the door!",
"with a click, the door unlocks, and you gently open the door. inside, you see that there's a semblance of a proper bedroom in here. a closet is present, as is a bed and closet.⬇️as you look around the room, the only notable item seems to be a spare hazmat suit inside the closet.",
"considering the state of the hallway the last time you saw it, it might not be a bad idea to take it... though it's not like this is your only choice for a hazmat suit, you could always take one from the decontamination room.⬇️if nothing else, having more options wasn't bad.",
"before you leave, you notice a note that had fallen behind the desk. picking it up, you take a look at it.",
""

},
{
"as you step towards this door, you see that this one is marked as [inne's room].⬇️you try your luck at the door handle, and find that it's locked.",
"you try your luck with the keycards that you have, but none of them seem to be the correct one.⬇️perhaps with some luck, you'll find one that opens this door soon."
},
{
"walking up to the door, you see that the nameplate marks it as [ethe's room].⬇️they must be one and the same from the note that you had read. if there was any room that held potential, it was this one.",
"you try your luck at the door handle, and shockingly it's not locked. however, something seems to be pressed against the door, as you can't get it to budge.⬇️you certainly spend a few minutes trying, but unless you wanted to risk throwing your shoulder out, you weren't getting anywhere. ",
"once more, you try your luck at getting into the door, but it seems no different than before. oh well, it was worth a try at least. you'll need something to either break down the door, or find an alternate way in."
},
{""},
{""},
{""}
}
},
--room12
{
m={
"stepping into the room, you're greeted by yet another scanner, closing you off from the rest of the room with a glass panel. remembering the trick from last time, you take your shears and cut through the stray vines that had made their way into the scanner and toss them into the hallway.",
"with your gardening complete, you press the button. the machine lights up, and you see a red wave of light appear above you. a few moments pass, and the screen on the tablet lights up.⬇️[no evaconvolvulus detected. you may enter.]⬇️glad that the scan went smoothly, you walk inside. ",
"it's similar to the last decontamination room you were in, sporting similar desks and cabinets. the shower likewise looked similar, though the hazmat suits were in a closet this time. finally, you also saw a map along the wall.",
"there wasn't any reason to wait, so you move forward... as you take your first step, you hear a noise from a different room, like metal groaning and some other inhumane roar.⬇️it faded just as soon as you heard it, and the facility remains quiet, only to be disturbed by the occasional drip of water. ",
"your imagination must be getting to you... right? there was no more reason to delay, so you prepare to make your move."
},
c={
"check map",
"check desks",
"look in closet",
"look around room",
"check left door",
"enter south door"
},
b={
{
"whoever lived here was kind enough to leave a map on the wall for you to look through.⬇️it seems that right now, you were in the northern decontamination room. the vinefilled hallway connected the two decontamination rooms, and held a larger 'shower' room to the west. ",
"past that shower room were two rooms, experimentation and 'subject's'. while the former explained itself, the subject room didn't seem as clear... at least in comparison to the other rooms on the map.⬇️speaking of them, to your west was the living quarters and storage room.",
"each of these rooms were worth checking for valuables. holding back dreams of wishes, you continue to look at the map.⬇️the only other rooms worth noting were in the southern sections, labelled as the research and observation rooms, with the later marked with having a glass window to the experimentation room. ",
"it must've been the room with the glass window blocked off by vines. considering the state of the closed off hallway, it seemed a little too dangerous to go in there. it'd be best to call it quit if the storage or living quarters brought a profit. ",
"having fully examined the map, you tried to remove it from the wall to take it with you, but it was stuck behind thick glass.⬇️after trying your luck, you come to the conclusion that it wasn't going to budge, and that if you wanted to revisit the map, it'd be best to come back here.",
""
},
{
"you spend a few minutes looking around, but unfortunately it seems that despite the abundance of desks, there's little in there that's useful for you. you find a bottle of water, at least... but you can't say you feel confident drinking from it considering the state of things here. ",
"you continue to look around, but it seems there's nothing else in the desks at least, outside of office supplies that were water damaged and heavy medical equipment that was clearly too damaged to be worth taking."
},
{
"you step into the closet to see if there was anything worth taking. there's a few hazmat suits within... two of which had been torn open by something.⬇️pushing the thought of what could've caused this away, you continue to check around the room.",
"you do happen upon something in one of the torn suits' pockets. inside is another page from the journal. seeing little reason not to, you start to read it.",
"\"april 10th, 20█\"⬇️\"our experiments have gone quite well, we've recently celebrated the █th anniversary from the start of our tests with eva. her body is holding up quite well, with the degeneration of her body's █ only at █5%.\"⬇️\"her mental tests have also been within working results.\" ",
"\"as it stands, we're steadily heading towards our goal of creating the █ █.\"⬇️\"we can't celebrate too early, as we had similar hopes with test subject █4, and their body quickly ███ to the point that we had to dispose of them.\" ",
"\"we've recently begun the advanced testing, and introduced eva to █. while initial results did cause a █3% increase in mental distress to eva, we were able to confirm that the █ properly █ into her body.\"⬇️\"we're getting closer to our goals, before long we'll conquer the human █.\" ",
"\"still, we can't ignore that eva hasn't been cooperative, though it isn't a surprise.\" ⬇️\"withholding the evacurine medicine is enough to quell resistance, as she can't bear the pain without it. she's a genius, surely she should understand what we're doing!\"⬇️\"a little pain is nothing for what we're dreaming of.\" ",
"\"if only we could still operate on our own bodies... still, this experiment is best performed with growing bodies. we're getting close. we can't stop now.\"⬇️quietly, you put the page in the journal, trying to come to terms with what you had just read...",
"there isn't anything else of note in the closet room."
},
{
"looking around the room, there doesn't seem to be much else worth looking at, outside of the points of interest. what's here is either too complicated for you to understand, or otherwise is too damaged to be worth taking.",
"you do happen to find a thick metal rod lying on the floor, having fallen out of something. it looks a little rusty, but it seems like it's worth taking.",
"you spend a few minutes more looking around, but there's not much here worth looking at in finer detail, at least with your education."
},
{
"similar to the room on the other end of the hall, there's a keycard scanner that gives you access to the next set of rooms.⬇️you rummage through your pockets for a moment, not finding your keycards for a few moments.",
"your heart races... but ultimately as you turn around you see that you simply dropped them on the ground behind you.⬇️oddly though, they seem to have some vines on top of them. joking to yourself that you have to watch out for pickpocket plants, you pick your cards back up. ",
"taking your cards, you swipe the keycard marked 1 first. the led above the door goes green after a moment, and the door starts to open with an awful groaning sound.⬇️looking at the door frame as it opens, you notice that there are vines grown into the frame.",
"the door opens aroud halfway before it stutters to a stop. it wasn't perfect... but considering the state of this place, you were just surprised it worked at all.⬇️you try to take a step through the doorway-",
"to your surprise, the door came to life and quickly started moving back and forth before stopping again.⬇️this... wasn't ideal. going through would risk injury, and if it closed and broke when you were on the other side, you'd be trapped. you needed to find a way to keep it open.",
"you try to use what you have to keep it open, but nothing seems to hold much promise in keeping the door open. "
},
{
"carefully, you walk through the scanner once again. the scanner runs its scan, alerting you to the fact that no 'evaconvolvulus' was detected. the door to the hallway unlocks with a click, and you carefully step into the hallway. ",
"you take a single step towards the door, before you unconsciously stop yourself. whatever *that* was, it was likely still in there...⬇️there was more for you to do anyhow. with these excuses in your head, and the courage to step inside gone, you return to the center of the room as you plan your next move. "
}
}
},
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
tmp="as you ponder what evaconvolvulus is, you remember the note you found. chances were that the vines along the floor were the evaconvolvulus that was detected. still... you couldn't just rip them up with your hands. you'd need to find a tool to cut them. "
tmp2="you try your luck with the door, but unfortunately it's locked tightly and you can't make it budge. your try your luck with your keycards, but none of them seem to open this door.⬇️notably: the name plate seems to be scratched out, you can't make out what it said."

--room2--
if proom==2 then
	if dsel==1 then
		bp[1][2]=1
		s[2].b[3]={
		"after using the keycard, the door opens and a small cloud of mist disperses into the room. you can smell fresh plant life around you as you step inside. a faint light illuminates the room, showing a spiral staircase that goes deep into the ground. if there was anything of value, it'd be down there. seeing no other option, you descend the stairs",
		"you slowly make your way down the stairs, being as careful as you can. each step causes the stairs to let out an awful creak, and whether it'll be from the stair underneath you breaking or tripping on an errant vine, a fall from here wouldn't be pretty.",
		""}
	elseif dsel==2 then
		s[2].c[3]="open the door"
		pr[1][1]=1
		if bp[1][2]==0	then
			s[2].b[3]={
				"try as you might, the door to the next room is closed quite tightly. you can't try the keycard reader currently, as you don't have a card.⬇️you're not one to give up easily however, and you try to pry open the door with a spare piece of metal that had been lying around.",
				"you spend a few minutes trying to use the metal bar to open the door, but it's not budging.⬇️the only result you gain is the gift of pain, as you accidentally hit your leg with the metal during your attempts. letting out a grunt of pain, you come to the realization that you'll need to find a keycard somewhere...",
				"",}
		end
	elseif dsel==3 then
		if bp[1][2]==1 and vsub[2][3]==1 then
		 proom=5
		 pr[2][1]=1
  else
		 s[2].b[3]={
		 	"you were never quick to give up. you pick up that same piece of metal and try again, working a different angle to open the door.⬇️a few minutes pass, but you're no closer to opening that door while your arms are ready to throw in the towel. it's becoming clearer that you're going to need a keycard.",
		 	""}
		 vsub[2][3]=0
	 end					
	end
--room 3--
--room 4--
elseif proom==4 then
	if dsel==1	then
		bp[2][2]=1
		vsub[5][6]=0
		s[5].b[6]={"you take the new keycard from your pocket and swipe it through the scanner. after a few moments, it lets out a positive sounding beep as the light above the door as well as the scanner flashes green, and the sound of a mechanism unlocking can be heard. it's unlocked now, and all that's left to do now is enter the door."}
	elseif dsel==3 then
		vsub[4][3]=0
		vsub[5][5]=0
		s[5].m[8]="this observation room seems to be no different than when you had left it a few minutes ago. you carefully walk through the room, avoiding stepping on any vines while you consider your options."
	 s[5].b[5]={
			"thinking that you may have missed something, you decide to check out the room on the left one more time, walking in slowly and carefully.",
		 "",}	
		proom=5
	end
--room5--
elseif proom==5 then
	if dsel==1 then
		jrnl[1]=1
	elseif dsel==2 then	
		if bp[3][2]<1 then
		 bp[3][2]+=1
		 s[5].b[2]={
			 "thinking about it more, you decide to pocket them for now, as you might forget about it when you're getting ready to leave. you pocket the medicine with that, putting them in your satchel.",
			 "you check the various desks some more, but there doesn't seem to be anything else worth taking right now."}
	  vsub[5][2]=0	
	 end
	elseif dsel==5 then
		proom=4
	elseif dsel==6 and bp[2][2]==1 then
		proom=6
		pr[3][1]=1
	end
--room6--
elseif proom==6 then
 s[6].m[#s[6].m]="each drip from the leaking pipes sounds like a gunshot now. the room seems no different right now, but it would do you well to speed up your investigation.⬇️there shouldn't be anything to fear... but something about this place screams danger."
	if dsel==3 then
		s[6].b[3][3]=s[6].b[3][2]
	elseif dsel==4 then
  jrnl[2]=1
	elseif dsel==5 then
  bp[4][2]=1
	elseif dsel==6 then
	 td[1]=1
		if bp[4][2]==1 and vsub[6][3]==1 then
			pr[4][1]=1
			proom=9
		end
	elseif dsel==7 then
		vsub[6][7]=0
		vsub[5][6]=0
		proom=5
		s[5].b[6]={"taking your keycard out, you swipe it through the reader. the door unlocks again without issue, and you step through. thankfully, the keycard doesn't seem to be a one time use. "}
	end
	if vsub[6][3]==1 and bp[4][2]==1 then
	 vsub[6][6]=0
	end
	if td[1]==1 and vsub[6][3]==1 and bp[4][2]==1 then
	s[6].b[6]={
  "you step into the scanner, shears in hand. the journals had noted that this 'evaconvolvulus' seems to be plant matter. knowing this, you crouch down towards the vines on the ground. you already checked that there wasn't anything like that stuck to your clothes, so it must be this.",
  "with some regret in your heart, you trim away at the vines, cutitng through them cleanly until you've clipped all of them. you pick up the remains and toss them out of the scanner. you couldn't get it perfectly, as they seemed to originate from a small crack in the floor, but you've gotten as much as you can.",
  "you press the button again, to see if you'll get a better result this time. the laser comes down again, following the proper path. you close your eyes before the lasers blind you, and after a few moment the scan completes. you open your eyes as the glass door ahead of you finally opens, revealing the now unlocked doorway to the next room.",
  "carefully, you step through into the next room.",
  ""}
 elseif vsub[6][3]==1 and bp[4][2]==0 then
 s[6].b[6][6]=tmp
 s[6].b[6][7]=tmp
 elseif td[1]==0 and vsub[6][3]==1 and bp[4][2]==1 then
	s[6].b[6][6]="you brought your shears into here, as you held no reason not to. remembering the journal that you had read, you look down at the vines growing on the ground and begin to trim them with your glorified scissors."
 s[6].b[6][7]="after a few minutes of careful trimming, the scanner is as vinefree as it'll get. there's still some growing in the cracks, but you can't exactly reach them from here. with a job well done, you toss out the trimmed vines and press the scan button once more."
 s[6].b[6][8]="the glass door closes once more, and the scan repeats just the same. you close your eyes as it hits your head, to avoid accidentally blinding yourself. after a few moments, you reopen them and are greeted with the sight of new text on the led."
 s[6].b[6][9]="[no evaconvolvulus detected. you may enter.]"
 s[6].b[6][10]="the opposing glass door on the scanner opens up, and you can see the electronic lock on the opposing door unlock. carefully, you step into the next room..."
	s[6].b[6][11]=""
	end
elseif proom==9 then
//fixmelater
	if vroom[10]==0 then
		s[9].m[#s[9].m]="the longer you spend in this room, the more it feels like the plants are moving around you. was it just your mind, or were they shifting beneath your feet?⬇️it would be best to keep moving."
		vsub[9][1]=0
		vsub[9][3]=0
		if dsel==1 then
		 if td[3]==0 then
				s[9].b[1]={"you step through the door cautiously, as who knows what could be on the other side..."}
			else
				s[12].m[#s[12].m]="your mind desperately tries to take it's mind off what it had just seen... it must've been a trick of the lights, just as the shadows at night play tricks on you, thinking someone's there when there's nobody."
			end
			if td[2]==1 then
				proom=12
				pr[5][1]=1
			else
		 	td[2]=1
		 	s[9].c[1]="enter north room"
		 end
		elseif dsel==2 then
			s[9].c[2]="try west door"
		elseif dsel==3 then
			s[6].m[#s[6].m]="you quickly reenter the room, the doorway to the hallway closing behind you. as it did, you could swear for just a moment you heard the faintest guttural groan of some monster.⬇️you had to stop reading your sister's horror books. this place was starting to get to you..."
			proom=6		
		end
	else
		if dsel==1 then
			proom=8
		elseif dsel==2 then
			proom=6
	 end
	end
elseif proom==11 then
 if dsel==2 then
  add(s[11].b[6][1],"s")
  s[11].b[2][3]=s[11].b[2][2]
 end
elseif proom==12 then
	if td[3]==0 then
	 s[12].m[#s[12].m]="you can feel a growing sense of anxiety fill you, this place felt more and more dangerous by the minute and it'd be best to finish your business quickly and leave. "
 end
	if dsel==1 then
	 vsub[12][1]=0
	elseif dsel==3 then
		jrnl[3]=3
	elseif dsel==4 then
	 bp[5][2]=1
	elseif dsel==5 then
	 if td[4]==0 then
	  td[4]=1
	 elseif td[4]==1 and bp[5][2]==1 then
 	 td[4]=2
 	 vsub[12][5]=0
 	 s[12].b[5]={"cautiously, you step into the next room, hoping that whatever you'd find here would be worth it... it had to be. what happened here, what remained here... and what this place would show you. these questions would be answered soon..."}
 	elseif td[4]==2 then
 		proom=11
 	end
	elseif dsel==6 then
	 if vroom[10]==0 and td[3]==0 then
	  vroom[9]=0
	  s[9].m={"at least... you had intended to enter the room. yet, as you looked through the glass, you could see through the dimmed windows as *something* was moving around in the vines along the wall.⬇️you could feel your heart in your chest, and you struggled to breath as panic set in. something else was here...",
	  "thankfully, you hadn't opened the door yet... but your mind tried to think of any escape plan it could as it looked at the writhing vines moving in the walls. for now, only one option remained."}
	  s[9].c={"step away from door"}
 		s[9].b[1]={"quickly, you back away from the door, hoping that perhaps it was a trick of the light, and that when you were ready to leave, you'd see that it was a trick of your imagination."}
   s[11].m[6]="did that sound come from that shadowy mass in the halls?⬇️...it would be best to hurry up your investigation."
 		proom=9
 		td[3]=1 	
 	end
	end
	if bp[5][2]==1 and td[4]==1 then
	 s[12].b[5]={
"holding the metal pipe you found in your hands, you walk to the erratic door. you weren't exactly sure if this would work, but it was better than sitting around doing nothing.⬇️quickly, as the door started to open, you place the metal pipe to jam the door. ",
"as the door tries to close again, it gets stuck on the metal pipe as a *loud* whine comes from the door. you can hear the mechanisms in the door give great protest to the pipe, before finally the door comes to a stop, the metal pipe stuck now and the door unable to move. ",
"you're now able to move into the next room. glad to have defeated the door, you decide to spend a minute longer looking through the room, in case you missed anything. ",
"test12.choice5.variant2"}
	 vsub[12][5]=0
	 s[11].b[7][1]=tmp2
	 s[11].b[8][1]=tmp2
	 s[11].b[9][1]=tmp2
 end
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
00000000033333300333333000000000000000000000000000000000000000000000000000000000000003300000000000000000000000000000000000000000
00700700030000300300003003333300033333000003300000033000003333000033330000000000000000300033300000333000000000000000000000000000
0007700003000030030bb030030000300300003000300300003bb30000300300003bb300000000000000003000300300003bb300000000000000000000000000
0007700003000030030bb03003000003030bb00300300300003bb30000300300003bb300000000000000003000300300003bb300000000000000000000000000
007007000300003003000030030000300300003000333300003333000003300000033000030000300000003000300300003bb300000000000000000000000000
00000000033333300333333003333300033333000000000000000000000000000000000003333330000003300033300000333000000000000000000000000000
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
