
/*--------------------------------------------------------------------------------

	Appearance
	
--------------------------------------------------------------------------------*/

// Face

VAR managerFace = 1
VAR managerEar = 1
VAR managerBody = 1
VAR managerSkinColor = 1


//  Hair

VAR managerHairFront = 1
VAR managerHairBack = 1
VAR managerHairBase = 1
VAR managerHairSideLeft = 1
VAR managerHairSideRight = 1
VAR managerHairColor = 1



// Eyes

VAR managerEyes = 1
VAR managerRightEyeColor = 1 
VAR managerLeftEyeColor = 1


// Facial Features

VAR managerEyebrow = 1
VAR managerEyebrowColor = 1
VAR managerNose = 1
VAR managerMouth = 1
VAR managerMouthColor = 1


// Facial Hair

VAR managerMustache = 1
VAR managerBeard = 1


// Details

VAR managerPiercings = 1
VAR managerFreckles = 1
VAR managerMoles = 1


// Clothing

VAR managerClothing = 1
VAR managerClothingColor = 1

/*--------------------------------------------------------------------------------

	Character Information
	
--------------------------------------------------------------------------------*/

VAR managerIndexID = 3


// Basic Info

VAR managerFirstName = John
VAR managerLastName =  Smith


// Pronouns

VAR managerSubjectPronoun = they
VAR managerObjectPronoun = them
VAR managerPosessivePronoun = theirs



VAR managerRelationshipWithPlayer = 0
VAR managerKnowsPlayer = false



/*--------------------------------------------------------------------------------

	Character Generation
	
--------------------------------------------------------------------------------*/

=== function GenerateManager

// Face

~ managerFace = RANDOM(0, 5)
~ managerEar = RANDOM(0, 5)
~ managerBody = RANDOM(0, 9) 
~ managerSkinColor = RANDOM(0, 20)


//  Hair

~ managerHairFront = RANDOM(0, 4)
~ managerHairBack = RANDOM(0, 4)
~ managerHairBase = RANDOM(0, 4)
~ managerHairSideLeft = RANDOM(0, 3)
~ managerHairSideRight = RANDOM(0, 4)
~ managerHairColor = RANDOM(0, 23)


// Eyes

~ managerEyes = RANDOM(0, 5)
~ managerRightEyeColor = RANDOM(0, 20) 
~ managerLeftEyeColor = RANDOM(0, 20)


// Facial Features

~ managerEyebrow = RANDOM(0, 4)
~ managerEyebrowColor = managerHairColor
~ managerNose = RANDOM(0, 6)
~ managerMouth = RANDOM(0, 5)
~ managerMouthColor = RANDOM(0, 41)

// Facial Hair

~ managerMustache = RANDOM(0, 5)
~ managerBeard = RANDOM(0, 5)


// Details

~ managerPiercings = RANDOM(0, 5)
~ managerFreckles = RANDOM(0, 5)
~ managerMoles = RANDOM(0, 5)


// Clothing

~ managerClothing = 0
~ managerClothingColor = RANDOM(0, 20)


// Basic Info

~ managerFirstName = LIST_RANDOM(neutralFirstNames)
~ managerLastName = LIST_RANDOM(lastNames)
