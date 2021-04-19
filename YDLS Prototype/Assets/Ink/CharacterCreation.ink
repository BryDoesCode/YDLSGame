
/*--------------------------------------------------------------------------------

	Appearance
	
--------------------------------------------------------------------------------*/

// Face

VAR face = 1
VAR ear = 1
VAR body = 1
VAR skinColor = 1


//  Hair

VAR hairFront = 1
VAR hairBack = 1
VAR hairBase = 1
VAR hairSideLeft = 1
VAR hairSideRight = 1
VAR hairColor = 1

VAR hijab = 1
VAR hijabColor = 1

// Eyes 

VAR eyes = 1
VAR rightEyeColor = 1
VAR leftEyeColor = 1


// Facial Features

VAR eyebrow = 1
VAR eyebrowColor = 1
VAR nose = 1
VAR mouth = 1
VAR mouthColor = 1


// Facial Hair

VAR mustache = 1
VAR mustacheColor = 1
VAR beard = 1
VAR beardColor = 1


// Details

VAR freckles = 1
VAR moles = 1

VAR glasses = 1
VAR glassesColor = 1
VAR glassesLensColor = 1

VAR earring = 1
VAR earringColor = 1
VAR nosePiercing = 1
VAR nosePiercingColor = 1
VAR eyebrowPiercing = 1
VAR eyebrowPiercingColor = 1
VAR mouthPiercing = 1
VAR mouthPiercingColor = 1

// Clothing

VAR clothing = 1
VAR clothingColor = 1
VAR clothingExtraColor = 1

/*--------------------------------------------------------------------------------

	Character Information
	
--------------------------------------------------------------------------------*/

// Basic Info

VAR firstName = "Player"
VAR lastName = "Placeholder"


// Pronouns

LIST shePronouns = she, her, hers
LIST hePronouns = he, him, his
LIST theyPronouns = they, them, theirs

VAR subjectPronoun = they
VAR objectPronoun = them
VAR posessivePronoun = theirs


=== function CreatePlayerCharacter(firstString, lastString, faceInt, earInt, bodyInt, skinColorInt, hairFrontInt, hairBackInt, hairBaseInt, hairSideLeftInt, hairSideRightInt, hairColorInt, hijabInt, hijabColorInt, eyesInt, rightEyeColorInt, leftEyeColorInt, eyebrowInt, eyebrowColorInt, noseInt, mouthInt, mouthColorInt, mustacheInt, mustacheColorInt, beardInt, beardColorInt, frecklesInt, molesInt, glassesInt, glassesColorInt, glassesLensColorInt, earringInt, earringColorInt, nosePiercingInt, nosePiercingColorInt, eyebrowPiercingInt, eyebrowPiercingColorInt, mouthPiercingInt, mouthPiercingColorInt, clothingInt, clothingColorInt, clothingExtraColorInt)

~ firstName = firstString
~ lastName = lastString
~ face = faceInt
~ ear = earInt
~ body = bodyInt
~ skinColor = skinColorInt

~ hairFront = hairFrontInt
~ hairBack = hairBackInt
~ hairBase = hairBaseInt
~ hairSideLeft = hairSideLeftInt
~ hairSideRight = hairSideRightInt
~ hairColor = hairColorInt

~ hijab = hijabInt
~ hijabColor = hijabColorInt

~ eyes = eyesInt
~ rightEyeColor = rightEyeColorInt
~ leftEyeColor = leftEyeColorInt

~ eyebrow = eyebrowInt
~ eyebrowColor = eyebrowColorInt
~ nose = noseInt
~ mouth = mouthInt
~ mouthColor = mouthColorInt

~ mustache = mustacheInt
~ mustacheColor = mustacheColorInt
~ beard = beardInt
~ beardColor = beardColorInt

~ freckles = frecklesInt
~ moles = molesInt

~ glasses = glassesInt
~ glassesColor = glassesColorInt
~ glassesLensColor = glassesLensColorInt

~ earring = earringInt
~ earringColor = earringColorInt
~ nosePiercing = nosePiercingInt
~ nosePiercingColor = nosePiercingColorInt
~ eyebrowPiercing = eyebrowPiercingInt
~ eyebrowPiercingColor = eyebrowPiercingColorInt
~ mouthPiercing = mouthPiercingInt
~ mouthPiercingColor = mouthPiercingColorInt

~ clothing = clothingInt
~ clothingColor = clothingColorInt
~ clothingExtraColor = clothingExtraColorInt
