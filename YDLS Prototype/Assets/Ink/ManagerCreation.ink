
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

VAR managerHijab = 0
VAR managerHijabColor = 1

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

VAR managerMustache = 0
VAR managerBeard = 0
VAR managerMustacheColor = 1
VAR managerBeardColor = 1

// Details

VAR managerFreckles = 1
VAR managerMoles = 1

VAR managerGlasses = 1
VAR managerGlassesColor = 1
VAR managerGlassesLensColor = 1

VAR managerEarring = 0
VAR managerEarringColor = 0
VAR managerNosePiercing = 0
VAR managerNosePiercingColor = 0
VAR managerEyebrowPiercing = 0
VAR managerEyebrowPiercingColor = 0
VAR managerMouthPiercing = 0
VAR managerMouthPiercingColor = 0

// Clothing

VAR managerClothing = 1
VAR managerClothingColor = 1
VAR managerClothingExtraColor = 1

// Additional Logic
VAR managerHasFacialHair = 0
VAR managerHasPiercings = 0

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

~ managerHairFront = RANDOM(0, 15)
~ managerHairBack = RANDOM(0, 21)
~ managerHairBase = RANDOM(0, 8)
~ managerHairSideLeft = RANDOM(0, 5)
~ managerHairSideRight = RANDOM(0, 6)
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

~ managerHasFacialHair = RANDOM(0, 2)

{
- managerHasFacialHair == 0:
    ~ managerMustache = RANDOM(0, 4)
    ~ managerBeard = RANDOM(0, 3)
    ~ managerMustacheColor = RANDOM(0, 23)
    ~ managerBeardColor = RANDOM(0, 23)
}

// Details

~ managerFreckles = RANDOM(0, 5)
~ managerMoles = RANDOM(0, 8)

~ managerGlasses = RANDOM(0, 5)
~ managerGlassesColor = RANDOM(0, 20)
~ managerGlassesLensColor = RANDOM(0, 20)

~ managerHasPiercings = RANDOM(0, 4)

{
- managerHasPiercings == 0:
    ~ managerEarring = RANDOM(0, 7)
    ~ managerEarringColor = RANDOM(0, 20)
    ~ managerNosePiercing = RANDOM(0, 3)
    ~ managerNosePiercingColor = RANDOM(0, 20)
    ~ managerEyebrowPiercing = RANDOM(0, 6)
    ~ managerEyebrowPiercingColor = RANDOM(0, 20)
    ~ managerMouthPiercing = RANDOM(0, 6)
    ~ managerMouthPiercingColor = RANDOM(0, 20)
}

// Clothing

~ managerClothing = LIST_VALUE(LIST_RANDOM(officeClothing))
~ managerClothingColor = RANDOM(0, 20)
~ managerClothingExtraColor = RANDOM(0,20)


// Basic Info

~ managerFirstName = LIST_RANDOM(neutralFirstNames)
~ managerLastName = LIST_RANDOM(lastNames)
