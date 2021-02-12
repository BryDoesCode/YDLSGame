
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

VAR motherMustache = 1
VAR motherBeard = 1


// Details

VAR motherPiercings = 1
VAR motherFreckles = 1
VAR motherMoles = 1


// Clothing

VAR motherClothing = 1
VAR motherClothingColor = 1

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

~ motherFace = RANDOM(0, 3)
~ motherEar = RANDOM(0, 3)
~ motherBody = RANDOM(0, 7) 
~ motherSkinColor = skinColor


//  Hair

~ motherHairFront = RANDOM(0, 4)
~ motherHairBack = RANDOM(0, 4)
~ motherHairBase = RANDOM(0, 4)
~ motherHairSideLeft = RANDOM(0, 3)
~ motherHairSideRight = RANDOM(0, 4)
~ motherHairColor = hairColor


// Eyes

~ motherEyes = RANDOM(0, 3)
~ motherRightEyeColor = rightEyeColor 
~ motherLeftEyeColor = leftEyeColor


// Facial Features

~ motherEyebrow = RANDOM(0, 4)
~ motherEyebrowColor = motherHairColor
~ motherNose = RANDOM(0, 6)
~ motherMouth = RANDOM(0, 5)
~ motherMouthColor = RANDOM(0, 8)


// Details

~ motherPiercings = RANDOM(0, 5)
~ motherFreckles = RANDOM(0, 5)
~ motherMoles = RANDOM(0, 5)


// Clothing

~ motherClothing = 0
~ motherClothingColor = RANDOM(0, 11)


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


// Details

VAR fatherPiercings = 1
VAR fatherFreckles = 1
VAR fatherMoles = 1


// Clothing

VAR fatherClothing = 1
VAR fatherClothingColor = 1

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

~ fatherFace = RANDOM(0, 3)
~ fatherEar = RANDOM(0, 3)
~ fatherBody = RANDOM(0, 7) 
~ fatherSkinColor = skinColor


//  Hair

~ fatherHairFront = RANDOM(0, 4)
~ fatherHairBack = RANDOM(0, 4)
~ fatherHairBase = RANDOM(0, 4)
~ fatherHairSideLeft = RANDOM(0, 3)
~ fatherHairSideRight = RANDOM(0, 4)
~ fatherHairColor = hairColor


// Eyes

~ fatherEyes = RANDOM(0, 3)
~ fatherRightEyeColor = rightEyeColor 
~ fatherLeftEyeColor = leftEyeColor


// Facial Features

~ fatherEyebrow = RANDOM(0, 4)
~ fatherEyebrowColor = fatherHairColor
~ fatherNose = RANDOM(0, 6)
~ fatherMouth = RANDOM(0, 5)
~ fatherMouthColor = fatherSkinColor


// Details

~ fatherPiercings = RANDOM(0, 5)
~ fatherFreckles = RANDOM(0, 5)
~ fatherMoles = RANDOM(0, 5)


// Clothing

~ fatherClothing = 0
~ fatherClothingColor = RANDOM(0, 11)


// Basic Info

~ fatherFirstName = LIST_RANDOM(masculineFirstNames)
~ fatherLastName = lastName

~ fatherKnowsPlayer = true
~ fatherRelationshipWithPlayer = 80
