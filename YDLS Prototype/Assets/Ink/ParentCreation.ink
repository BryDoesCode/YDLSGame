
/*--------------------------------------------------------------------------------

	Mother Appearance
	
--------------------------------------------------------------------------------*/


// Face

VAR motherFace = 1
VAR motherEar = 1
VAR motherBody = 1
VAR motherSkinColor = 1


//  Hair

VAR motherHairFront = 1
VAR motherHairBack = 1
VAR motherHairBase = 1
VAR motherHairSideLeft = 1
VAR motherHairSideRight = 1
VAR motherHairColor = 1

VAR motherHijab = 0
VAR motherHijabColor = 1

// Eyes

VAR motherEyes = 1
VAR motherRightEyeColor = 1 
VAR motherLeftEyeColor = 1


// Facial Features

VAR motherEyebrow = 1
VAR motherEyebrowColor = 1
VAR motherNose = 1
VAR motherMouth = 1
VAR motherMouthColor = 1


// Facial Hair

VAR motherMustache = 0
VAR motherBeard = 0
VAR motherMustacheColor = 0
VAR motherBeardColor = 0

// Details

VAR motherFreckles = 1
VAR motherMoles = 1

VAR motherGlasses = 1
VAR motherGlassesColor = 1
VAR motherGlassesLensColor = 1

VAR motherEarring = 0
VAR motherEarringColor = 0
VAR motherNosePiercing = 0
VAR motherNosePiercingColor = 0
VAR motherEyebrowPiercing = 0
VAR motherEyebrowPiercingColor = 0
VAR motherMouthPiercing = 0
VAR motherMouthPiercingColor = 0


// Clothing

VAR motherClothing = 1
VAR motherClothingColor = 1
VAR motherClothingExtraColor = 1


// Additional Logic
VAR motherHasFacialHair = 0
VAR motherHasPiercings = 0

/*--------------------------------------------------------------------------------

	Character Information
	
--------------------------------------------------------------------------------*/

VAR motherIndexID = 0


// Basic Info

VAR motherFirstName = John
VAR motherLastName =  Smith


// Pronouns

VAR motherSubjectPronoun = she
VAR motherObjectPronoun = her
VAR motherPosessivePronoun = hers



VAR motherRelationshipWithPlayer = 0
VAR motherKnowsPlayer = true


/*--------------------------------------------------------------------------------

	Character Generation
	
--------------------------------------------------------------------------------*/

=== function GenerateMother

// Face

~ motherFace = RANDOM(0, 5)
~ motherEar = RANDOM(0, 5)
~ motherBody = RANDOM(0, 9) 
~ motherSkinColor = skinColor


//  Hair

~ motherHairFront = RANDOM(0, 13)
~ motherHairBack = RANDOM(0, 20)
~ motherHairBase = RANDOM(0, 6)
~ motherHairSideLeft = RANDOM(0, 4)
~ motherHairSideRight = RANDOM(0, 5)
~ motherHairColor = hairColor

~ motherHijab = hijab
~ motherHijabColor = RANDOM(0, 20)


// Eyes

~ motherEyes = RANDOM(0, 5)
~ motherRightEyeColor = rightEyeColor 
~ motherLeftEyeColor = leftEyeColor


// Facial Hair

~ motherHasFacialHair = RANDOM(0, 3)

{
- motherHasFacialHair == 0:
    ~ motherMustache = RANDOM(0, 4)
    ~ motherBeard = RANDOM(0, 3)
    ~ motherMustacheColor = RANDOM(0, 23)
    ~ motherBeardColor = RANDOM(0, 23)
}

// Details

~ motherFreckles = RANDOM(0, 5)
~ motherMoles = RANDOM(0, 8)

~ motherGlasses = RANDOM(0, 5)
~ motherGlassesColor = RANDOM(0, 20)
~ motherGlassesLensColor = RANDOM(0, 20)

~ motherHasPiercings = RANDOM(0, 3)

{
- motherHasPiercings == 0:
    ~ motherEarring = RANDOM(0, 7)
    ~ motherEarringColor = RANDOM(0, 20)
    ~ motherNosePiercing = RANDOM(0, 3)
    ~ motherNosePiercingColor = RANDOM(0, 20)
    ~ motherEyebrowPiercing = RANDOM(0, 6)
    ~ motherEyebrowPiercingColor = RANDOM(0, 20)
    ~ motherMouthPiercing = RANDOM(0, 6)
    ~ motherMouthPiercingColor = RANDOM(0, 20)
}


// Clothing

~ motherClothing = RANDOM(0, 13)
~ motherClothingColor = RANDOM(0, 20)
~ motherClothingExtraColor = RANDOM(0, 20)

// Hijab Check
{
- motherHijab: 
    ~ motherHairFront = hairFront
    ~ motherHairBack = hairBack
    ~ motherHairSideLeft = hairSideLeft
    ~ motherHairSideRight = hairSideRight
    ~ motherClothing = LIST_VALUE(LIST_RANDOM(hijabSafeClothing))
}

// Basic Info

~ motherFirstName = LIST_RANDOM(feminineFirstNames)
~ motherLastName = lastName

~ motherKnowsPlayer = true
~ motherRelationshipWithPlayer = 80

/*--------------------------------------------------------------------------------

	Father Appearance
	
--------------------------------------------------------------------------------*/


// Face

VAR fatherFace = 1
VAR fatherEar = 1
VAR fatherBody = 1
VAR fatherSkinColor = 1


//  Hair

VAR fatherHairFront = 1
VAR fatherHairBack = 1
VAR fatherHairBase = 1
VAR fatherHairSideLeft = 1
VAR fatherHairSideRight = 1
VAR fatherHairColor = 1

VAR fatherHijab = 0
VAR fatherHijabColor = 1

// Eyes

VAR fatherEyes = 1
VAR fatherRightEyeColor = 1 
VAR fatherLeftEyeColor = 1


// Facial Features

VAR fatherEyebrow = 1
VAR fatherEyebrowColor = 1
VAR fatherNose = 1
VAR fatherMouth = 1
VAR fatherMouthColor = 1


// Facial Hair

VAR fatherMustache = 1
VAR fatherBeard = 1
VAR fatherMustacheColor = 1
VAR fatherBeardColor = 1

// Details

VAR fatherFreckles = 1
VAR fatherMoles = 1

VAR fatherGlasses = 1
VAR fatherGlassesColor = 1
VAR fatherGlassesLensColor = 1

VAR fatherEarring = 0
VAR fatherEarringColor = 0
VAR fatherNosePiercing = 0
VAR fatherNosePiercingColor = 0
VAR fatherEyebrowPiercing = 0
VAR fatherEyebrowPiercingColor = 0
VAR fatherMouthPiercing = 0
VAR fatherMouthPiercingColor = 0

// Clothing

VAR fatherClothing = 1
VAR fatherClothingColor = 1
VAR fatherClothingExtraColor = 1

// Additional Logic
VAR fatherHasFacialHair = 0
VAR fatherHasPiercings = 0

/*--------------------------------------------------------------------------------

	Character Information
	
--------------------------------------------------------------------------------*/

VAR fatherIndexID = 1


// Basic Info

VAR fatherFirstName = John
VAR fatherLastName =  Smith


// Pronouns

VAR fatherSubjectPronoun = he
VAR fatherObjectPronoun = him
VAR fatherPosessivePronoun = his



VAR fatherRelationshipWithPlayer = 0
VAR fatherKnowsPlayer = true



/*--------------------------------------------------------------------------------

	Character Generation
	
--------------------------------------------------------------------------------*/

=== function GenerateFather

// Face

~ fatherFace = RANDOM(0, 5)
~ fatherEar = RANDOM(0, 5)
~ fatherBody = RANDOM(0, 9) 
~ fatherSkinColor = skinColor


//  Hair

~ fatherHairFront = RANDOM(0, 13)
~ fatherHairBack = RANDOM(0, 20)
~ fatherHairBase = RANDOM(0, 6)
~ fatherHairSideLeft = RANDOM(0, 4)
~ fatherHairSideRight = RANDOM(0, 5)
~ fatherHairColor = hairColor


// Eyes

~ fatherEyes = RANDOM(0, 5)
~ fatherRightEyeColor = rightEyeColor 
~ fatherLeftEyeColor = leftEyeColor


// Facial Features

~ fatherEyebrow = RANDOM(0, 4)
~ fatherEyebrowColor = fatherHairColor
~ fatherNose = RANDOM(0, 6)
~ fatherMouth = RANDOM(0, 5)
~ fatherMouthColor = fatherSkinColor

// Facial Hair

~ fatherHasFacialHair = RANDOM(0, 1)

{
- fatherHasFacialHair == 0:
    ~ fatherMustache = RANDOM(0, 4)
    ~ fatherBeard = RANDOM(0, 3)
    ~ fatherMustacheColor = RANDOM(0, 23)
    ~ fatherBeardColor = RANDOM(0, 23)
}

// Details

~ fatherFreckles = RANDOM(0, 5)
~ fatherMoles = RANDOM(0, 8)

~ fatherGlasses = RANDOM(0, 5)
~ fatherGlassesColor = RANDOM(0, 20)
~ fatherGlassesLensColor = RANDOM(0, 20)

~ fatherHasPiercings = RANDOM(0, 3)

{
- fatherHasPiercings == 0:
    ~ fatherEarring = RANDOM(0, 7)
    ~ fatherEarringColor = RANDOM(0, 20)
    ~ fatherNosePiercing = RANDOM(0, 3)
    ~ fatherNosePiercingColor = RANDOM(0, 20)
    ~ fatherEyebrowPiercing = RANDOM(0, 6)
    ~ fatherEyebrowPiercingColor = RANDOM(0, 20)
    ~ fatherMouthPiercing = RANDOM(0, 6)
    ~ fatherMouthPiercingColor = RANDOM(0, 20)
}


// Clothing

~ fatherClothing = RANDOM(0, 13)
~ fatherClothingColor = RANDOM(0, 20)
~ fatherClothingExtraColor = RANDOM(0, 20)


// Basic Info

~ fatherFirstName = LIST_RANDOM(masculineFirstNames)
~ fatherLastName = lastName

~ fatherKnowsPlayer = true
~ fatherRelationshipWithPlayer = 80
