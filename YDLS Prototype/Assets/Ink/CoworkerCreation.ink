
/*--------------------------------------------------------------------------------

	Appearance
	
--------------------------------------------------------------------------------*/

// Face

VAR coworkerFace = 1
VAR coworkerEar = 1
VAR coworkerBody = 1
VAR coworkerSkinColor = 1


//  Hair

VAR coworkerHairFront = 1
VAR coworkerHairBack = 1
VAR coworkerHairBase = 1
VAR coworkerHairSideLeft = 1
VAR coworkerHairSideRight = 1
VAR coworkerHairColor = 1

VAR coworkerHijab = 0
VAR coworkerHijabColor = 1

// Eyes

VAR coworkerEyes = 1
VAR coworkerRightEyeColor = 1 
VAR coworkerLeftEyeColor = 1


// Facial Features

VAR coworkerEyebrow = 1
VAR coworkerEyebrowColor = 1
VAR coworkerNose = 1
VAR coworkerMouth = 1
VAR coworkerMouthColor = 1


// Facial Hair

VAR coworkerMustache = 0
VAR coworkerBeard = 0
VAR coworkerMustacheColor = 1
VAR coworkerBeardColor = 1

// Details

VAR coworkerFreckles = 1
VAR coworkerMoles = 1

VAR coworkerGlasses = 1
VAR coworkerGlassesColor = 1
VAR coworkerGlassesLensColor = 1

VAR coworkerEarring = 0
VAR coworkerEarringColor = 0
VAR coworkerNosePiercing = 0
VAR coworkerNosePiercingColor = 0
VAR coworkerEyebrowPiercing = 0
VAR coworkerEyebrowPiercingColor = 0
VAR coworkerMouthPiercing = 0
VAR coworkerMouthPiercingColor = 0

// Clothing

VAR coworkerClothing = 1
VAR coworkerClothingColor = 1
VAR coworkerClothingExtraColor = 1

// Additional Logic
VAR coworkerHasFacialHair = 0
VAR coworkerHasPiercings = 0

/*--------------------------------------------------------------------------------

	Character Information
	
--------------------------------------------------------------------------------*/

VAR coworkerIndexID = 2

// Name Lists

LIST masculineFirstNames = (John), (Brian), (Josh), (Kayden), (Lucas), (Liam), (Atlas), (Asher), (Ezra), (Noah), (Levi), (Leo), (Xavier), (Nathaniel), (Michael), (George), (Landon), (Ethan), (Zane), (Patrick), (Carl), (Shia)

LIST feminineFirstNames = (Jane), (Karen), (Mary), (Jessica), (Pamela), (Mila), (Aaliyah), (Nova), (Aria), (Amelia), (Eliana), (Mia), (Ivy), (Molly), (Alyssa), (Olivia), (Luna), (Amara), (Sarah), (Hope), (Haylee), (Heidi), (Hannah), (Hera)

LIST neutralFirstNames = (Cassidy), (Lee), (Riley), (Hunter), (Kai), (Logan), (Avery), (Elliot), (Quinn), (Skylar), (Luca), (River), (Remi), (Rowan), (Ava), (Hayden), (Evan), (Reese), (Harper), (Wyatt), (Izzie), (Indigo), (Dana)

LIST lastNames = (Smith), (Johnson), (McClellan), (Maynard), (Williams), (Brown), (Jones), (Miller), (Davis), (Wilson), (Anderson), (Taylor), (Jackson), (Thompson), (Harris), (Clark), (Robinson), (Lewis), (Ramirez), (Wright), (Nguyen), (Green), (Adams), (Baker), (Hall), (Martin), (Perez), (Turner), (Edwards), (Gomez), (Carter), (Mitchell), (Diaz), (Parker), (Evans), (Ortiz), (Morales), (Morris), (Howard), (Kim), (Ward), (Watson), (Brooks), (Gray), (Price), (Myers), (Foster), (Patel), (Sanders), (Castillo), (Long)


// Clothing Lists
LIST officeClothing = (one=1), (eight=8), (nine=9), (ten=10), (eleven=11), (twelve=12), (thirteen=13)

LIST hijabSafeClothing = (one=1), (two=2), (five=5), (eight=8), (nine=9), (ten=10), (eleven=11)

// Basic Info

VAR coworkerFirstName = John
VAR coworkerLastName =  Smith


// Pronouns

VAR coworkerSubjectPronoun = they
VAR coworkerObjectPronoun = them
VAR coworkerPosessivePronoun = theirs



VAR coworkerRelationshipWithPlayer = 0
VAR coworkerKnowsPlayer = false



/*--------------------------------------------------------------------------------

	Character Generation
	
--------------------------------------------------------------------------------*/

=== function GenerateCoworker

// Face

~ coworkerFace = RANDOM(0, 5)
~ coworkerEar = RANDOM(0, 5)
~ coworkerBody = RANDOM(0, 9) 
~ coworkerSkinColor = RANDOM(0, 20)


//  Hair

~ coworkerHairFront = RANDOM(0, 15)
~ coworkerHairBack = RANDOM(0, 21)
~ coworkerHairBase = RANDOM(0, 8)
~ coworkerHairSideLeft = RANDOM(0, 5)
~ coworkerHairSideRight = RANDOM(0, 6)
~ coworkerHairColor = RANDOM(0, 23)


// Eyes

~ coworkerEyes = RANDOM(0, 5)
~ coworkerRightEyeColor = RANDOM(0, 20) 
~ coworkerLeftEyeColor = RANDOM(0, 20)


// Facial Features

~ coworkerEyebrow = RANDOM(0, 4)
~ coworkerEyebrowColor = coworkerHairColor
~ coworkerNose = RANDOM(0, 6)
~ coworkerMouth = RANDOM(0, 5)
~ coworkerMouthColor = RANDOM(0, 41)

// Facial Hair

~ coworkerHasFacialHair = RANDOM(0, 5)

{
- coworkerHasFacialHair == 0:
    ~ coworkerMustache = RANDOM(0, 4)
    ~ coworkerBeard = RANDOM(0, 3)
    ~ coworkerMustacheColor = RANDOM(0, 23)
    ~ coworkerBeardColor = RANDOM(0, 23)
}

// Details

~ coworkerFreckles = RANDOM(0, 5)
~ coworkerMoles = RANDOM(0, 8)

~ coworkerGlasses = RANDOM(0, 5)
~ coworkerGlassesColor = RANDOM(0, 20)
~ coworkerGlassesLensColor = RANDOM(0, 20)

~ coworkerHasPiercings = RANDOM(0, 2)

{
- coworkerHasPiercings == 0:
    ~ coworkerEarring = RANDOM(0, 7)
    ~ coworkerEarringColor = RANDOM(0, 20)
    ~ coworkerNosePiercing = RANDOM(0, 3)
    ~ coworkerNosePiercingColor = RANDOM(0, 20)
    ~ coworkerEyebrowPiercing = RANDOM(0, 6)
    ~ coworkerEyebrowPiercingColor = RANDOM(0, 20)
    ~ coworkerMouthPiercing = RANDOM(0, 6)
    ~ coworkerMouthPiercingColor = RANDOM(0, 20)
}

// Clothing

~ coworkerClothing = LIST_VALUE(LIST_RANDOM(officeClothing))
~ coworkerClothingColor = RANDOM(0, 20)
~ coworkerClothingExtraColor = RANDOM(0,20)

// Basic Info

~ coworkerFirstName = LIST_RANDOM(neutralFirstNames)
~ coworkerLastName = LIST_RANDOM(lastNames)



/*--------------------------------------------------------------------------------

	Character Conversations
	
--------------------------------------------------------------------------------*/
VAR coworkerConvoCount = 0

=== coworkerConversation
~ conversationActive = true
~ activeNPCID = 2
{ChangeConversationFocus(NPC, "{coworkerFirstName}")}
"Hey {firstName}! I heard about you from {managerFirstName}. It's your first week here, right?"

+ [Respond]
{ChangeConversationFocus(Player, "{coworkerFirstName}")}
-
+ ["Yup, started on Monday!" {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"Cool, cool. Do you like it so far?"
    ++ [▼]
    {coworkerFirstName} has been added to your contacts.
    \\nYour relationship with {coworkerFirstName} increased by 1. 
    ~ coworkerRelationshipWithPlayer += 1
    ~ coworkerKnowsPlayer = true
+ ["Meh." {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"Huh. Well. Uhm. Do you like it, at least?"
    ++ [▼]
    {coworkerFirstName} has been added to your contacts. 
    \\nYour relationship with {coworkerFirstName} decreased by 1.
    ~ coworkerRelationshipWithPlayer -= 1
    ~ coworkerKnowsPlayer = true
+ ["It feels like just yesterday!" {statHints: \\n<size={statSize}>(+2 Relationship)</size>}]    
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"Haha, yeah the days go by fast. How do you like it?"
    ++ [▼]
    {coworkerFirstName} has been added to your contacts.
    \\nYour relationship with {coworkerFirstName} increased by 2. 
    ~ coworkerRelationshipWithPlayer += 2
    ~ coworkerKnowsPlayer = true
-
+ [Respond]
{ChangeConversationFocus(Player, "{coworkerFirstName}")}
-

+ ["It's really fun." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    "I'm so glad!"
    ++ [▼]
    Your relationship with {coworkerFirstName} increased by 1. 
    ~ coworkerRelationshipWithPlayer += 1
+ ["I'm enjoying the challenge and putting my typing skills to the test. {statHints: \\n<size={statSize}>(+2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    "Right? It's way more intense than those old typing teaching games."
    ++ [▼]
    Your relationship with {coworkerFirstName} increased by 2. 
    ~ coworkerRelationshipWithPlayer += 2
    
+ [Stay quiet. {statHints: \\n<size={statSize}>(-2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    "..."
    ++ [▼]
    Your relationship with {coworkerFirstName} decreased by 2. 
    ~ coworkerRelationshipWithPlayer -= 2
-
+ [▼]
-
"Well, I won't keep you. Have a good day." 
+ [▼]
-
{ChangeConversationFocus(Player, "{coworkerFirstName}")}

+ ["You too, thanks!" {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    Your coworker waves as they leave the breakroom.
    ++ [▼]
    Your relationship with {coworkerFirstName} increased by 1. 
    ~ coworkerRelationshipWithPlayer += 1
+ ["Bye. {statHints: \\n<size={statSize}>(No Change)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    Your coworker just shrugs. "See you later."
    
+ ["Have a great day!" {statHints: \\n<size={statSize}>(+2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    "You as well!"
    ++ [▼]
    Your relationship with {coworkerFirstName} increased by 2. 
    ~ coworkerRelationshipWithPlayer += 2
-
- You better head back to work too.
~ conversationActive = false
~ activeNPCID = 99
~ coworkerConvoCount ++
->->

=== coworkerConversationTwo
~ conversationActive = true
~ activeNPCID = 2
{ChangeConversationFocus(NPC, "{coworkerFirstName}")}
"Hey {firstName}! Your shift ends soon, right?"

+ [Respond]
{ChangeConversationFocus(Player, "{coworkerFirstName}")}
-
+ ["Not soon enough." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"Yeah, I feel you."
    ++ [▼]
    \\nYour relationship with {coworkerFirstName} increased by 1. 
    ~ coworkerRelationshipWithPlayer += 1
+ ["Yeah and yours is just starting. Ha." {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"No need to rub it in."
    ++ [▼]
    \\nYour relationship with {coworkerFirstName} decreased by 1.
    ~ coworkerRelationshipWithPlayer -= 1
+ ["Your point?" {statHints: \\n<size={statSize}>(-2 Relationship)</size>}]    
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"Nothing, really. Just making conversation. Jeez."
    ++ [▼]
    \\nYour relationship with {coworkerFirstName} decreased by 2. 
    ~ coworkerRelationshipWithPlayer -= 2
-
+ [Respond]
{ChangeConversationFocus(Player, "{coworkerFirstName}")}
-

+ ["I have to get back to work." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    "Have a good one."
    ++ [▼]
    Your relationship with {coworkerFirstName} increased by 1. 
    ~ coworkerRelationshipWithPlayer += 1
+ ["My break is over. Nice talking to you. {statHints: \\n<size={statSize}>(+2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    "You too! Hang in there."
    ++ [▼]
    Your relationship with {coworkerFirstName} increased by 2. 
    ~ coworkerRelationshipWithPlayer += 2
    
+ [Just Leave. {statHints: \\n<size={statSize}>(-2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    "Wow. Nice talking to you too, jerk."
    ++ [▼]
    Your relationship with {coworkerFirstName} decreased by 2. 
    ~ coworkerRelationshipWithPlayer -= 2
-
+ [▼]
- You give {coworkerFirstName} a final glance before leaving the break room.
~ conversationActive = false
~ activeNPCID = 99
~ coworkerConvoCount ++
->->

=== coworkerConversationThree
~ conversationActive = true
~ activeNPCID = 2
{ChangeConversationFocus(NPC, "{coworkerFirstName}")}
"Oh, hey! How is your week going?"

+ [Respond]
{ChangeConversationFocus(Player, "{coworkerFirstName}")}
-
+ ["Fine." {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"Well, it could be worse, I guess?"
    ++ [▼]
    \\nYour relationship with {coworkerFirstName} decreased by 1. 
    ~ coworkerRelationshipWithPlayer -= 1
+ ["Not bad. I'm making it." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"Haha. You can do it!"
    ++ [▼]
    \\nYour relationship with {coworkerFirstName} increased by 1.
    ~ coworkerRelationshipWithPlayer += 1
+ ["Who cares." {statHints: \\n<size={statSize}>(-2 Relationship)</size>}]    
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"Well, I would say I care, but you don't seem to. So..."
    ++ [▼]
    \\nYour relationship with {coworkerFirstName} decreased by 2. 
    ~ coworkerRelationshipWithPlayer -= 2
-
+ [▼]
-
"I'm stuck with this one project, it's a nightmare." 
+ [Respond]
{ChangeConversationFocus(Player, "{coworkerFirstName}")}
-

+ ["Ouch, want to try working it out together?" {statHints: \\n<size={statSize}>(+2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    "That would be great!"
    ++ [▼]
    --
    Your relationship with {coworkerFirstName} increased by 2. 
    ~ coworkerRelationshipWithPlayer += 2
    ++ [▼]
    --
    ~ conversationActive = false
    ~ activeNPCID = 99
    The two of you spend the rest of your break working on the problem, and might have found a solution by the time you have to head back to work. Good job!
+ ["Oof, that sucks. I wish you luck!" {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    "Thanks, I'll need it!"
    ++ [▼]
    --
    Your relationship with {coworkerFirstName} increased by 1. 
    ~ coworkerRelationshipWithPlayer += 1
    ++ [▼]
    --
    ~ conversationActive = false
    ~ activeNPCID = 99
    Your coworker dramatically waves goodbye as if they're walking off to their doom. 
    ++ [▼]
    --
    You spend a few more minutes on break, then head back to work. 
+ [Guess you need better skills? {statHints: \\n<size={statSize}>(-2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}
    "Ouch. I mean, I'm not great, but way to kick me when I'm down."
    ++ [▼]
    --
    Your relationship with {coworkerFirstName} decreased by 2. 
    ~ coworkerRelationshipWithPlayer -= 2
    ++ [▼]
    --
    ~ conversationActive = false
    ~ activeNPCID = 99 
    They walk away in a huff, leaving you to finish your break in peace. 
~ coworkerConvoCount ++
-
+ [▼]
->->