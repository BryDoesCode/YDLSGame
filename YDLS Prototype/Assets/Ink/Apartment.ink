/*--------------------------------------------------------------------------------

   Apartment -- Morning

--------------------------------------------------------------------------------*/

=== morning ===
~ loadingAnimation = "sleep"
~ startLoadingAnimation = true
You slept.
+ [▼]
-
{AdvanceWeekday()}
~ date ++
~ time = Morning
~ fullDate = month + " " + date
~ fullDateNumbers = monthNumber + "/" + date
~ energy = RANDOM(7, 9)
~ location = "Apartment"
~ background = "apartmentMorning"
~ locationColor = "apartmentMorning"
~ locationMusic = "apartmentMorning"
~ startLoadingAnimation = false

{CalculateInterest()}
{EarnPaycheck()}

It's morning! Today is {today}, {fullDate}.

You've started with {energy} Energy today.{borrowedEnergy > 0: You borrowed {borrowedEnergy} yesterday, so you only have {energy - borrowedEnergy} to work with.} Make it count!
~ energy -= borrowedEnergy
~ borrowedEnergy = 0
* (reminisce)[Reminisce]
It's been over a week since you fully moved into your apartment. Time sure flies. Speaking of which, you should probably check your Calendar to see when your Bills are due. 
+ {reminisce}[▼]
-
Guess it's time to get up. 
+ [Wake Up]
-
-> MorningWakeUp ->
You push yourself up out of bed. -> MorningCondition -> 
~ background = "apartmentBathroom"
~ locationColor = "apartmentBathroom"
You brush your teeth and take your medicine like normal, then turn your attention to food.
- 
+ [▼]
~ background = "apartmentMorning"
~ locationColor = "apartmentMorning"
You lost 1 Energy from getting ready.
~ energy -= 1
-
+ [▼] -> energyCheck -> breakfast


= breakfast
~ background = "apartmentKitchenMorning"
~ locationColor = "apartmentKitchenMorning"
What would you like to eat for breakfast? 
\\nYou have {prepackagedMealCount} Prepackaged Meal{prepackagedMealCount!=1:s} and {foodIngredientsCount} Set{foodIngredientsCount!=1:s} of Ingredients.
+ [Choose]
-
{prepackagedMealCount == 0 and foodIngredientsCount == 0: Looks like you don't have any food.}
+ {prepackagedMealCount > 0}[Prepacked Meal{statHints: \\n<size={statSize}>(+1 Health)\\n(-1 Prepackaged Meal)</size>}]
	{~You settled on cereal this morning. It’s quick and it’s easy. | It's a toast kind of morning. {~This time with butter.| A quick swipe of peanut butter makes all the difference. | Some jelly on top adds just enough sweetness.} | Just a container of yogurt should be fine.} 
	#eatingSFX
    
    ++ [▼]
	You gained 1 Health from eating.
	~ health += 1
	You used up 1 Prepackaged Meal. 
	~ prepackagedMealCount -= 1
	     
	     
+ {foodIngredientsCount > 0}[Recipe{statHints: \\n<size={statSize}>(-2 Energy / +2 Health / +1 Wellness) \\n(-1 Set of Ingredients)</size>}]
	{~Today was a pancake morning. Sure, you’re a bit tired now but nothing beats the smell of freshly cooked pancakes. | You're exhausted already, but that omlette sure was worth it.}
	#eatingSFX
    
    ++ [▼]
	    You lost 2 Energy from cooking.
	    ~ energy -= 2
	    You gained 2 Health from eating.
	    ~ health += 2
	    You gained 1 Wellness from the homecooked meal.
	    ~ wellness += 1
	    You used up 1 Set of Ingredients.
	    ~ foodIngredientsCount -= 1
	    
+ [Skip Eating{statHints: \\n<size={statSize}>(-1 Health / -1 Wellness)</size>}]
        Guess today is not a food day. 
    
    ++ [▼]
	    You lost 1 Health and 1 Wellness from not eating.
	    ~ health -= 1
	    ~ wellness -= 1

- 
+ [▼] -> healthCheck -> wellnessCheck -> energyCheck -> shower


= shower
~ background = "apartmentMorning"
~ locationColor = "apartmentMorning"

- You still have some time this morning. 
Would you like to take a shower?
+ [▼]
-
+ [Yes{statHints: \\n<size={statSize}>(-3 Energy / +1 Health / +1 Wellness)</size>}]
    ~ background = "apartmentBathroom"
    ~ locationColor = "apartmentBathroom"
    Ah, that was a wonderful shower. You feel a bit more tired, but you’re clean and ready to face the day. It felt great. Now it’s time to get dressed and head out.
    #showerSFX
    ++ [▼]
    ~ background = "apartmentMorning"
    ~ locationColor = "apartmentMorning"
    You lost 2 Energy from taking a shower.
    You lost 1 Energy from getting dressed. 
    ~ energy -= 3
    You gained 1 Health and 1 Wellness from taking a shower. 
    ~ health += 1
    ~ wellness += 1
    
    
    
+ [No{statHints: \\n<size={statSize}>(-1 Health / -1 Wellness / -1 Energy)</size>}]
    No time for a shower this morning. You’d rather just get to work. You get dressed as normal and head to work. 
    
    ++ [▼]
    You lost 1 Health and 1 Wellness from not taking a shower.
    You lost 1 Energy from getting dressed.
   
    ~ health -= 1
    ~ wellness -= 1
    ~ energy -= 1

- 
+  [Go to Work] -> healthCheck -> wellnessCheck -> energyCheck -> retailwork


/*--------------------------------------------------------------------------------

    Apartment -- Evening

--------------------------------------------------------------------------------*/


=== endofday ===
~ loadingAnimation = "bus"
~ startLoadingAnimation = true
You traveled by bus.
+ [▼]
-
~ location = "Apartment"
~ background = "apartmentEvening"
~ time = Evening
~ locationColor = "apartmentEvening"
~ locationMusic = "apartmentEvening"
~ startLoadingAnimation = false

Looks like you made it home for the day. 

+ [Check in]
- 
{
    - energy <= 0:
        Yeah, you have no energy left. None. How are you even standing?
    - energy <= 2:
        You're exhausted. You only have {energy} Energy left. Better just head to bed.
    - energy <= 5:
        You only have {energy} Energy left, but at least you finished everything you needed to. Right?
    - energy > 5:
        Well, you have {energy} Energy right now. You can actually do something productive tonight. 
}
+ [▼]
-
(This game is still a prototype and is currently endless beyond this point. You may sleep and play another day or end (quit) the game. Warning: if you play more than a few days it will get very repetitive and you'll have a 7 day work-week. Also, there is no month roll-over, you'll just continue forever in {month}.)
+ [▼]
-
+ [Sleep]
    -> morning
+ [End]
    {EndGame()}
    -> DONE

-> END


/*--------------------------------------------------------------------------------

    Variety Functions -- Morning

--------------------------------------------------------------------------------*/

=== MorningWakeUp
-
~ randomNumber = RANDOM(1, 3)
{ randomNumber:
    -1:
        You wake up to your alarm blaring.
        -> MorningWakeUpConnect
        
    -2: 
        You wake up before your alarm, looking over just in time to see it start beeping.
        -> MorningWakeUpConnect
        
    -3:
        You woke up to your alarm, sort of. Actually, you smashed the snooze button once. Just enough for some extra sleep but not enough to change your morning routine.
        
        + [▼]
        You gained 1 Energy from a little extra sleep.
        ~ energy += 1
        -> MorningWakeUpConnect
        
}
= MorningWakeUpConnect
-
+ [▼]
->->
 

=== MorningCondition
~ randomNumber = RANDOM(1, 3)
{ randomNumber:
    -1:
        Your muscles ache, but nothing more than usual.
        -> MorningConditionConnect
    -2: 
        You actually feel pretty good this morning, for once.
        + [▼]
        You gained 1 Wellness from feeling good. 
        ~ wellness += 1
        -> MorningConditionConnect
    -3:
        You feel really groggy, must not have slept well.
        + [▼]
        You lost 2 Energy from not sleeping well.
        ~ energy -= 2
        -> MorningConditionConnect
}
= MorningConditionConnect
-
+ [Get Ready] -> energyCheck ->
->->