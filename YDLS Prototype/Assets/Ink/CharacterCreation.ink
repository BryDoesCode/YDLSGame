
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

VAR piercings = 1
VAR freckles = 1
VAR frecklesColor = 1
VAR moles = 1
VAR molesColor = 1


// Clothing

VAR clothing = 1
VAR clothingColor = 1

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


=== function CreatePlayerCharacter(firstString, lastString, faceInt, earInt, bodyInt, skinColorInt, hairFrontInt, hairBackInt, hairBaseInt, hairSideLeftInt, hairSideRightInt, hairColorInt, hijabInt, hijabColorInt, eyesInt, rightEyeColorInt, leftEyeColorInt, eyebrowInt, eyebrowColorInt, noseInt, mouthInt, mouthColorInt, mustacheInt, mustacheColorInt, beardInt, beardColorInt, piercingsInt, frecklesInt, frecklesColorInt, molesInt, molesColorInt, clothingInt, clothingColorInt)

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
~ beardColor = beardColor

~ piercings = piercingsInt
~ freckles = frecklesInt
~ frecklesColor = frecklesColorInt
~ moles = molesInt
~ molesColor = molesInt

~ clothing = clothingInt
~ clothingColor = clothingColorInt
