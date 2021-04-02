
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

VAR coworkerMustache = 1
VAR coworkerBeard = 1


// Details

VAR coworkerPiercings = 1
VAR coworkerFreckles = 1
VAR coworkerMoles = 1


// Clothing

VAR coworkerClothing = 1
VAR coworkerClothingColor = 1

/*--------------------------------------------------------------------------------

	Character Information
	
--------------------------------------------------------------------------------*/

VAR coworkerIndexID = 2

// Name Lists

LIST masculineFirstNames = (John), (Brian), (Josh), (Kayden), (Lucas), (Liam), (Atlas), (Asher), (Ezra), (Noah), (Levi), (Leo), (Xavier), (Nathaniel), (Michael), (George), (Landon), (Ethan), (Zane), (Patrick), (Carl), (Shia)

LIST feminineFirstNames = (Jane), (Karen), (Mary), (Jessica), (Pamela), (Mila), (Aaliyah), (Nova), (Aria), (Amelia), (Eliana), (Mia), (Ivy), (Molly), (Alyssa), (Olivia), (Luna), (Amara), (Sarah), (Hope), (Haylee), (Heidi), (Hannah), (Hera)

LIST neutralFirstNames = (Cassidy), (Lee), (Riley), (Hunter), (Kai), (Logan), (Avery), (Elliot), (Quinn), (Skylar), (Luca), (River), (Remi), (Rowan), (Ava), (Hayden), (Evan), (Reese), (Harper), (Wyatt), (Izzie), (Indigo), (Dana)

LIST lastNames = (Smith), (Johnson), (McClellan), (Maynard), (Williams), (Brown), (Jones), (Miller), (Davis), (Wilson), (Anderson), (Taylor), (Jackson), (Thompson), (Harris), (Clark), (Robinson), (Lewis), (Ramirez), (Wright), (Nguyen), (Green), (Adams), (Baker), (Hall), (Martin), (Perez), (Turner), (Edwards), (Gomez), (Carter), (Mitchell), (Diaz), (Parker), (Evans), (Ortiz), (Morales), (Morris), (Howard), (Kim), (Ward), (Watson), (Brooks), (Gray), (Price), (Myers), (Foster), (Patel), (Sanders), (Castillo), (Long)

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

~ coworkerHairFront = RANDOM(0, 12)
~ coworkerHairBack = RANDOM(0, 17)
~ coworkerHairBase = RANDOM(0, 4)
~ coworkerHairSideLeft = RANDOM(0, 3)
~ coworkerHairSideRight = RANDOM(0, 4)
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

~ coworkerMustache = RANDOM(0, 5)
~ coworkerBeard = RANDOM(0, 5)


// Details

~ coworkerPiercings = RANDOM(0, 5)
~ coworkerFreckles = RANDOM(0, 5)
~ coworkerMoles = RANDOM(0, 5)


// Clothing

~ coworkerClothing = 0
~ coworkerClothingColor = RANDOM(0, 20)


// Basic Info

~ coworkerFirstName = LIST_RANDOM(neutralFirstNames)
~ coworkerLastName = LIST_RANDOM(lastNames)



/*--------------------------------------------------------------------------------

	Character Conversations
	
--------------------------------------------------------------------------------*/

=== coworkerConversation
~ conversationActive = true
~ activeNPCID = 2
{ChangeConversationFocus(NPC, "{coworkerFirstName}")}
"Hey {firstName}! It's almost the end of your shift, right?"

+ [Respond]
{ChangeConversationFocus(Player, "{coworkerFirstName}")}
-
+ ["Not soon enough." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"Yeah, I feel you."
    ++ [▼]
    {coworkerFirstName} has been added to your contacts.
    \\nYour relationship with {coworkerFirstName} increased by 1. 
    ~ coworkerRelationshipWithPlayer += 1
    ~ coworkerKnowsPlayer = true
+ ["Yeah and yours is just starting. Ha." {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"No need to rub it in."
    ++ [▼]
    {coworkerFirstName} has been added to your contacts. 
    \\nYour relationship with {coworkerFirstName} decreased by 1.
    ~ coworkerRelationshipWithPlayer -= 1
    ~ coworkerKnowsPlayer = true
+ ["Your point?" {statHints: \\n<size={statSize}>(-2 Relationship)</size>}]    
    {ChangeConversationFocus(NPC, "{coworkerFirstName}")}<>"Nothing, really. Just making conversation. Jeez."
    ++ [▼]
    {coworkerFirstName} has been added to your contacts.
    \\nYour relationship with {coworkerFirstName} decreased by 2. 
    ~ coworkerRelationshipWithPlayer -= 2
    ~ coworkerKnowsPlayer = true
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

->->