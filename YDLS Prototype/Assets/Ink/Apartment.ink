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
~ locationMusic = "apartmentMorning"
~ startLoadingAnimation = false
{ResetStatTracking()}
{CalculateInterest()}
{EarnPaycheck()}

It's morning! Today is {today}, {fullDate}.

You've started with {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} today.{borrowedEnergy > 0: You borrowed {borrowedEnergy} yesterday, so you only have {energy - borrowedEnergy} to work with.} Make it count!
{UpdateEnergy(-borrowedEnergy)}
~ borrowedEnergy = 0
+ [▼]
-
Guess it's time to get up. 
+ [Wake Up]
-
-> MorningWakeUp ->
You push yourself up out of bed. -> MorningCondition -> 
~ background = "apartmentBathroom"
You brush your teeth and take your medicine like normal, then turn your attention to food.
- 
+ (morningMedication) [▼]
-
You used up one dose of medication.
~ medicationCount -= 1
+ [▼]
-
~ background = "apartmentMorning"
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from getting ready.
{UpdateEnergy(-1)}
+ [▼] -> energyCheck -> breakfast


= breakfast
~ background = "apartmentKitchenMorning"
{date == 8: -> PhoneCall} {date > 8: -> PhoneCall}
What would you like to eat for breakfast? 
\\nYou have {breakfastPrepackagedMealCount} Prepackaged Breakfast{breakfastPrepackagedMealCount!=1:s} and {breakfastIngredientsCount} Set{breakfastIngredientsCount!=1:s} of Breakfast Ingredients.
+ [Choose]
-
{breakfastPrepackagedMealCount == 0 and breakfastIngredientsCount == 0: Looks like you don't have any breakfast food.}
+ {breakfastPrepackagedMealCount > 0}[Prepacked Meal{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>})\\n(-1 Prepackaged Meal)</size>}]
	{closedCaptions: [chewing]\\n}
	{~You settled on cereal this morning. It’s quick and it’s easy. | Time for the fancy, fruity cereal. | It's a toast kind of morning. {~This time with butter.| A quick swipe of peanut butter makes all the difference. | Some jelly on top adds just enough sweetness. | With nothing on it, it's just that kind of morning.} | Just a container of yogurt should be fine. | Better have some yogurt with cereal on top. | Some plain bread with peanut butter spread will do, no need to toast it today. | Dry cereal sounds good. | Just a handful of berries will be perfect.} 
	#eatingSFX
    
    ++ [▼]
	You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating.
	{UpdateHealth(1)}
	You used up 1 Prepackaged Breakfast. 
	~ breakfastPrepackagedMealCount -= 1
	     
+ {breakfastIngredientsCount > 0}[Recipe{statHints: \\n<size={statSize}>(-2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} / +2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / +1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>}) \\n(-1 Set of Ingredients)</size>}]
	{closedCaptions: [chewing]\\n}
	{~Today was a pancake morning. Sure, you’re a bit tired now but nothing beats the smell of freshly cooked pancakes. | You're exhausted already, but that omlette sure was worth it. | There's a reason you begged for a waffle maker. Waffles are the best. | How about some fancy, blueberry pancakes? | Obviously, it's a chocolate chip pancake kind of day. | Maybe some blueberry waffles today?}
	#eatingSFX
    ++ [▼]
	    You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from cooking.
	    {UpdateEnergy(-2)}
	    You gained 2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating.
	    {UpdateHealth(2)}
	    You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from the homecooked meal.
	    {UpdateWellness(1)}
	    You used up 1 Set of Breakfast Ingredients.
	    ~ breakfastIngredientsCount -= 1
	    
+ [Skip Eating{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / -1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
        Guess today is not a food day. 
    ++ [▼]
	    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from not eating.
	   {UpdateHealth(-1)}
	   {UpdateWellness(-1)}

- 
+ [▼] -> healthCheck -> wellnessCheck -> energyCheck -> 
{breakfastPrepackagedMealCount > 0: -> bringLunch} -> shower

= bringLunch
You have some Prepackaged Lunches, would you like to bring one to work?
+ [▼]
-
+ [Yes] 
    <>You grab one lunch and pack it to bring to work. 
    ~ lunchToWork = true
+ [No]
    <>You decide not to bring a lunch today. Maybe tomorrow. 
    ~ lunchToWork = false
-
+ [▼] -> shower

= shower
~ background = "apartmentMorning"
- You still have some time this morning. 
{toiletriesCount > 0: Would you like to take a shower?}
{toiletriesCount == 0: It seems you're out of Toiletries, so you can't take a shower this morning. -> noShower}
+ [▼]
-
+ [Yes{statHints: \\n<size={statSize}>(-3 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} / +1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / +1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})\\n(-1 Set of Toiletries)</size>}]
    ~ background = "apartmentBathroom"
    {closedCaptions: [water drops and splashes]\\n}
    Ah, that was a wonderful shower. You feel a bit more tired, but you’re clean and ready to face the day. It felt great. Now it’s time to get dressed and head out.
    #showerSFX
    ++ [▼]
    ~ background = "apartmentMorning"
    You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from taking a shower.
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from getting dressed. 
    {UpdateEnergy(-3)}
    You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from taking a shower. 
    {UpdateHealth(1)}
    {UpdateWellness(1)}
    You used up 1 Set of Toiletries showering. 
    ~ toiletriesCount -=1
    
+ (noShower) [No{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / -1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} / -1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    No shower this morning. You’d rather just get to work anyway. You get dressed as normal and head to work. 
    ++ [▼]
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from not taking a shower.
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from getting dressed.
    {UpdateEnergy(-1)}
    {UpdateHealth(-1)}
    {UpdateWellness(-1)}
- 
+  [Go to Work] -> healthCheck -> wellnessCheck -> energyCheck -> officeWork


= afterPassOutMorning
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
~ locationMusic = "apartmentMorning"
~ startLoadingAnimation = false
{ResetStatTracking()}
{CalculateInterest()}
{EarnPaycheck()}
~ passedOut = true

It's morning! Today is {today}, {fullDate}.

You've started with {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} today.{borrowedEnergy > 0: You borrowed {borrowedEnergy} yesterday, so you only have {energy - borrowedEnergy} to work with.} Make it count!
{UpdateEnergy(-borrowedEnergy)}
~ borrowedEnergy = 0
Guess it's time to get up. 
+ [Wake Up]
-
It takes you a moment to realize you didn't wake up in bed. Ugh. 
+ [▼]
-
Memories of last night, or lack thereof, flood back and you realize you must have passed out. 
+ [▼]
-
Oh well, not much you can do about it now. Better just get ready. 
+ [▼] -> morningMedication

/*--------------------------------------------------------------------------------

    Apartment -- Evening

--------------------------------------------------------------------------------*/


=== endofday ===

Looks like you made it home for the day. 

+ [▼]
-
{UpdateStatSummary()}
Stat Summary Updated.
+ [▼]
-
    -> morning

=== afterHospitalEndOfDay ===
~ background = "apartmentEvening"
~ time = Evening
~ location = "Apartment"
~ loadingAnimation = false
It's evening when you arrive home. 
+ [▼]
-
You give your manager a quick text to explain what happened. Or as quick as it can be, considering how long the explanation is. 
+ [▼]
-
You get a text back almost immediately telling you to take care of yourself. Guess you lucked out with a good job. 
+ [▼]
-
You're so exhausted. You probably should just head to bed like the nurse said. So much for today.
+ [▼]
-
In a moment of frustration you punch at your pillow and end up collapsing onto the bed instead. 
+ [▼]
-
Eventually you pull yourself back up and head to the bathroom. 
+ [▼]
-
~ background = "apartmentBathroom"
Somehow you manage to get yourself ready. Barely.
+ [▼]
-
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} getting ready.
{UpdateEnergy(-1)}
You used up one Set of Toiletries brushing your teeth. 
~toiletriesCount -= 1
+ [▼]
-
~ background = "apartmentNight"
~ time = Night
~ location = "Apartment"
Resigned to your fate, you plop down into bed and find yourself drifting off immediately. At least tomorrow will be better, right?
+ [Sleep]
- 
{UpdateStatSummary()}
Stat Summary Updated.
+ [▼] -> morning
    

/*--------------------------------------------------------------------------------

    Variety Functions -- Morning

--------------------------------------------------------------------------------*/

=== MorningWakeUp
-
~ randomNumber = RANDOM(1, 8)
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
        You gained 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from a little extra sleep.
        {UpdateEnergy(1)}
        -> MorningWakeUpConnect
    -4:
        You wake up ten minutes before your alarm is set to go off, and can't fall back asleep. 
        + [▼]
        You lost 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from frustration.
        {UpdateWellness(-1)}
        -> wellnessCheck -> MorningWakeUpConnect
    -5:
        You slowly wake up, lifting out of a detailed dream that fades as soon as your eyes open.
        -> MorningWakeUpConnect
    -6:
        You started awake, sitting up in bed quickly. You have no idea why.
        + [▼]
        You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from your heart racing.
        {UpdateHealth(-1)}
        -> healthCheck -> MorningWakeUpConnect
    -7:
        You wake up just in time to turn your alarm off. 
        -> MorningWakeUpConnect
    -8:
        You just kind of wake up in a really mundane sort of way.
        -> MorningWakeUpConnect
        
        
}
= MorningWakeUpConnect
-
+ [▼]
->->
 

=== MorningCondition
~ randomNumber = RANDOM(1, 6)
{ randomNumber:
    -1:
        Your muscles ache, but nothing more than usual.
        -> MorningConditionConnect
    -2: 
        You actually feel pretty good this morning, for once.
        + [▼]
        You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from feeling good. 
        {UpdateWellness(1)}
        -> MorningConditionConnect
    -3:
        You feel really groggy, must not have slept well.
        + [▼]
        You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from not sleeping well.
        {UpdateEnergy(-2)}
        -> MorningConditionConnect
    -4:
        You feel fine. You think? It's weird. 
        -> MorningConditionConnect
    -5:
        You feel okay. Not great. Just okay. 
        -> MorningConditionConnect
    -6:
        Everything hurts, for some reason. Ugh. 
        + [▼]
        You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from pain.
        {UpdateHealth(-1)}
        -> MorningConditionConnect
}
= MorningConditionConnect
-
+ [Get Ready] -> energyCheck -> healthCheck ->
->->