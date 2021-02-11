
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
VAR hairColor = 1


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
VAR beard = 1


// Details

VAR piercings = 1
VAR freckles = 1
VAR moles = 1


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


=== function CreatePlayerCharacter(firstString, lastString, faceInt, earInt, bodyInt, skinColorInt, hairFrontInt, hairBackInt, hairColorInt, eyesInt, rightEyeColorInt, leftEyeColorInt, eyebrowInt, eyebrowColorInt, noseInt, mouthInt, mouthColorInt, clothingInt, clothingColorInt)

~ firstName = firstString
~ lastName = lastString
~ face = faceInt
~ ear = earInt
~ body = bodyInt
~ skinColor = skinColorInt

~ hairFront = hairFrontInt
~ hairBack = hairBackInt
~ hairColor = hairColorInt

~ eyes = eyesInt
~ rightEyeColor = rightEyeColorInt
~ leftEyeColor = leftEyeColorInt

~ eyebrow = eyebrowInt
~ eyebrowColor = eyebrowColorInt
~ nose = noseInt
~ mouth = mouthInt
~ mouthColor = mouthColorInt

~ clothing = clothingInt
~ clothingColor = clothingColorInt
