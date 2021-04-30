=== firstOfficeWorkDay ===
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
Guess it's time to get up. 
+ [Wake Up]
-
-> MorningWakeUp ->
You push yourself up out of bed. -> MorningCondition -> 
As you're about to head to the bathroom to brush your teeth and take your medication, you suddenly remember what today is. 
+ [▼]
-
Today is your first day of work! How exciting! You head to the bathroom to continue getting ready.
+ [▼]
-
~ background = "apartmentBathroom"
You brush your teeth and take your medicine like normal, then turn your attention to food.
+ [▼]
-
You used up one Set of Toiletries brushing your teeth.
You used up one dose of medication.
~ toiletriesCount -= 1
~ medicationCount -= 1
+ [▼]
-
~ background = "apartmentMorning"
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from getting ready.
{UpdateEnergy(-1)}
+ [▼] -> energyCheck -> firstBreakfast

=firstBreakfast
~ background = "apartmentKitchenMorning"
What would you like to eat for breakfast? 
\\nYou have {breakfastPrepackagedMealCount} Prepackaged Breakfast{breakfastPrepackagedMealCount!=1:s} and {breakfastIngredientsCount} Set{breakfastIngredientsCount!=1:s} of Breakfast Ingredients.
+ [Choose]
-
{breakfastPrepackagedMealCount == 0 and breakfastIngredientsCount == 0: Looks like you don't have any Breakfast food.}
+ {breakfastPrepackagedMealCount > 0}[Prepacked Meal{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>})\\n(-1 Prepackaged Breakfast)</size>}]
	{closedCaptions: [chewing]\\n}
	{~You settled on cereal this morning. It’s quick and it’s easy.|Time for the fancy, fruity cereal.|It's a toast kind of morning. {~This time with butter.|A quick swipe of peanut butter makes all the difference.|Some jelly on top adds just enough sweetness. | With nothing on it, it's just that kind of morning.}| Just a container of yogurt should be fine.|Better have some yogurt with cereal on top.|Some plain bread with peanut butter spread will do, no need to toast it today.|Dry cereal sounds good.|Just a handful of berries will be perfect.} 
	#eatingSFX
    
    ++ [▼]
	You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating.
	{UpdateHealth(1)}
	You used up 1 Prepackaged Breakfast. 
	~ breakfastPrepackagedMealCount -= 1
	     
	     
+ {breakfastIngredientsCount > 0}[Recipe{statHints: \\n<size={statSize}>(-2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} / +2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / +1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>}) \\n(-1 Set of Ingredients)</size>}]
	{closedCaptions: [chewing]\\n}
	{~Today was a pancake morning. Sure, you’re a bit tired now but nothing beats the smell of freshly cooked pancakes.|You're exhausted already, but that omlette sure was worth it.|There's a reason you begged for a waffle maker. Waffles are the best.|How about some fancy, blueberry pancakes?|Obviously, it's a chocolate chip pancake kind of day.|Maybe some blueberry waffles today?}
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
+ [▼] -> healthCheck -> wellnessCheck -> energyCheck -> firstShower
= firstShower
~ background = "apartmentMorning"
- You still have some time this morning.
Would you like to take a shower?
+ [▼]
-
+ [Yes{statHints: \\n<size={statSize}>(-3 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} / +1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / +1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
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
    You used up one Set of Toiletries taking a shower. 
    ~toiletriesCount -= 1
+ [No{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / -1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} / -1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    No time for a shower this morning. You’d rather just get to work. You get dressed as normal and head to work. 
    
    ++ [▼]
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from not taking a shower.
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from getting dressed.
    {UpdateEnergy(-1)}
    {UpdateHealth(-1)}
    {UpdateWellness(-1)}
- 
+  [Go to Work] -> healthCheck -> wellnessCheck -> energyCheck -> firstWorkTransportation

=firstWorkTransportation
You can either walk to work, or take the bus. 
+ [▼]
-
+ [Walk{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    ~loadingAnimation = "walking"
    ~ locationMusic = "walking"
    You decide to walk. You leave your apartment and begin the short walk to work.  
    ++ (firstWorkWalk) [▼]
    --
    ~startLoadingAnimation = true
    You walked. 
    ++ [▼]
    --
    ~ time = Midday
    ~ location = "Work"
    ~ background = "officeWorkExterior"
    ~ locationMusic = "exteriorCity"
    ~ startLoadingAnimation = false
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} walking.
    {UpdateEnergy(-1)}
    ++ [▼]
    -- -> energyCheck ->
+ [Bus{statHints: \\n<size={statSize}>(-$2.00)</size>}]
    {money - 2.00 < 0.01: Oops, looks like you don't have enough money to ride the bus. Guess you're walking. -> firstWorkWalk} You decide to travel by bus. You leave your apartment to go wait at the bus stop. 
    ++ [▼]
    --
    ~loadingAnimation = "bus"
    ~ startLoadingAnimation = true
    ~ locationMusic = "bus"
    You traveled by bus. 
    ++ [▼]
    --
    ~ money -= 2
    {AddTransaction(fullDateNumbers, "Bus Fare", 2, money)}
    ~ time = Midday
    ~ location = "Work"
    ~ background = "officeWorkExterior"
    ~ locationMusic = "exteriorCity"
    ~ startLoadingAnimation = false
    You spent $2.00 on bus fare.
    ++ [▼]
    --
-
{closedCaptions: [city sounds]\\n}
Upon arriving outside the office building, you stare at the surrounding city in awe. It's almost unreal that you work and live here, now. 
+ [▼]
-
With a deep breath, you walk into the building and get ready to face your first day of work. 
+ [▼]
-
~ background = "officeWorkRoom"
~ locationMusic = "work"
You end up inside the main office room and feel a bit lost for a moment, before the manager you interviewed with sees you and walks over to say "hello". 
+ [▼]
- -> managerConversation

= managerConversation
~ conversationActive = true
~ activeNPCID = 3
{ChangeConversationFocus(NPC, "{managerFirstName}")}
"Hello {firstName}! Welcome to the company. How are you feeling this morning?"

+ [Respond]
{ChangeConversationFocus(Player, "{managerFirstName}")}
-
+ ["Not too bad. Excited for my first day." {statHints: \\n<size={statSize}>(+2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}<>"Good. Good. I'm glad! I'll show you to your cubicle and go over the basics."
    ++ [▼]
    {managerFirstName} has been added to your contacts.
    \\nYour relationship with {managerFirstName} increased by 2. 
    ~ managerKnowsPlayer = true
    ~ managerRelationshipWithPlayer += 2
    ~ managerKnowsPlayer = true
+ ["Fine." {statHints: \\n<size={statSize}>(No Change)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}<>"Well fine is better than nothing! Let's get you started. Just follow me to your cubicle."
    ++ [▼]
    {managerFirstName} has been added to your contacts. 
    ~ managerKnowsPlayer = true
+ ["Bored already." {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]    
    {ChangeConversationFocus(NPC, "{managerFirstName}")}<>"Well you've only just walked through the door. It'll get more interesting. Let's go get you setup in your cubicle."
    ++ [▼]
    {managerFirstName} has been added to your contacts.
    \\nYour relationship with {managerFirstName} decreased by 1. 
    ~ managerRelationshipWithPlayer -= 1
    ~ managerKnowsPlayer = true
-
+ [▼]
-
You follow the manager to your cubicle and listen as they begin to explain your new job. 
+ [▼]
-
Finally you arrive at your workstation. 
+ [▼]
-
~ background = "officeWorkComputer"
"Here's your spot! Like I was explaining, it's fairly simple. Basic office tasks. Lots of typing up handwritten notes, putting numbers into spreadsheets, all that jazz."
+ [▼]
-
"Any questions so far?" 
+ [Respond]
{ChangeConversationFocus(Player, "{managerFirstName}")}
-

+ ["None so far. You explained it really well." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}
    "I'm glad!"
    ++ [▼]
    Your relationship with {managerFirstName} increased by 1. 
    ~ managerRelationshipWithPlayer += 1
+ ["I think I'm good. Should I come to you if I have any in the future?" {statHints: \\n<size={statSize}>(+2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}
    "Yes please. We're a small branch here, so I work directly with everyone."
    ++ [▼]
    Your relationship with {managerFirstName} increased by 2. 
    ~ managerRelationshipWithPlayer += 2
+ ["Should I have questions? That was too simple." {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}
    "Not necessarily. I just wanted to make sure you're all set. It's my job, after all."
    ++ [▼]
    Your relationship with {managerFirstName} decreased by 1. 
    ~ managerRelationshipWithPlayer -= 1
-
+ [▼]
-
"Your first assignment is there on your desk. The instructions should be pretty clear. Take today to get familiar with your computer system and see if you can handle the assignment."
+ [▼]
-
"I'll come by again when it's time for lunch to make sure you're doing okay. Feel free to take quick breaks as needed throughout the day, just make sure you get the job done." 
+ [▼]
-
{managerFirstName} gives you a friendly wave as they walk away, leaving you to your own devices until lunch. 
~ conversationActive = false
~ activeNPCID = 99
+ [▼] -> firstWorkDay

= firstWorkDay
You spend the next few hours personalizing your desk area, reading through the instructions, and seeing how hard this work actually is. 
+ [▼]
-
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from working.
{UpdateEnergy(-1)}
-
+ [▼] -> energyCheck ->
-
Just as you think you're getting the hang of everything, your manager shows up next to your desk. 
+ [▼]
- -> secondManagerConversation
= secondManagerConversation
~ conversationActive = true
~ activeNPCID = 3
~ background = "officeWorkRoom"
{ChangeConversationFocus(NPC, "{managerFirstName}")}
"It's finally lunch time. How did your morning go?"

+ [Respond]
{ChangeConversationFocus(Player, "{managerFirstName}")}
-
+ ["Really quickly. I think I've got the hang of things." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}<>"Awesome. I bet you're ready for that lunch break."
    ++ [▼]
    \\nYour relationship with {managerFirstName} increased by 1. 
    ~ managerRelationshipWithPlayer += 1
+ ["It was okay." {statHints: \\n<size={statSize}>(No Change)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}<>"At least you made it. And now it's time for lunch!"
+ ["It sucked." {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]    
    {ChangeConversationFocus(NPC, "{managerFirstName}")}<>"Can't always have a great day, I guess. Maybe lunch will help out."
    ++ [▼]
    \\nYour relationship with {managerFirstName} decreased by 1. 
    ~ managerRelationshipWithPlayer -= 1
-
+ [▼]
-
"Follow me and I'll take you to the breakroom. It's well equipped, and a great place to take lunch."
+ [▼]
-
After turning a few corners, you reach the break room. 
+ [▼]
-
~ background = "officeWorkBreakroom"
"See? What did I tell you? State of the art."
+ [▼]
-
You keep any personal opinions you have about the breakroom to yourself and just nod. 
+ [▼]
-
"You didn't bring a lunch today, did you?" 
+ [▼]
-
{managerFirstName} keeps talking, not giving you a moment to answer. 
+ [▼]
-
"Well, my husband made an extra lunch when he heard we had a new hire. It's always exciting. You're welcome to it, if you'd like." 
+ [▼]
-
{managerFirstName} grabs the lunch from the fridge and shows it to you.
+ [Respond]
{ChangeConversationFocus(Player, "{managerFirstName}")}
-
+ ["That would be amazing, thank you!" {statHints: \\n<size={statSize}>(+2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}
    "No problem at all. I'll let my husband know you liked it."
    ++ [▼]
    Your relationship with {managerFirstName} increased by 2. 
    ~ managerRelationshipWithPlayer += 2
    ~ freeLunch = true
+ ["Thanks for offering, but I'm not feeling hungry right now. {statHints: \\n<size={statSize}>(No Change.)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}
    "Ah, suit yourself. Let me know if you change your mind."
    ++ [▼]
+ [I probably wouldn't like it. {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}
    "If you're sure." 
    ++ [▼]
    Your relationship with {managerFirstName} decreased by 1. 
    ~ managerRelationshipWithPlayer -= 1
-
+ [▼]
-
~ conversationActive = false
~ activeNPCID = 99 
    {
    - freeLunch: -> firstDayFreeLunch ->
    - else: -> firstDayNoLunch ->
    }
~ background = "officeWorkComputer" 
You head back to your desk once lunch is over and finish the rest of your work day. 
+ [▼]
-
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from working. 
{UpdateEnergy(-1)}
+ [▼] -> energyCheck ->
-
~ background = "officeWorkExterior"
~ locationMusic = "exteriorCity"
You made it to the end of the day. Finally. You look back at the building once you're outside and decide what to do with the rest of your night.
+ [▼] -> LeaveWork

=== firstDayFreeLunch
You and {managerFirstName} sit at one of the tables and eat lunch together. 
+ [▼]
-
The food is good, and the time passes quickly. Before you know it, lunch is over. 
+ [▼]
-
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from socializing. 
You gained 2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from a good meal. 
Your relationship with {managerFirstName} increased by 2. 
{UpdateEnergy(-1)}
{UpdateHealth(2)}
~ managerRelationshipWithPlayer += 2
+ [▼] -> energyCheck ->
-
->->
=== firstDayNoLunch
{managerFirstName} bids you goodbye and heads back to their office to eat. It seems they're taking a "working lunch". 
+ [▼]
-
You forgot to bring a lunch to work. There are vending machines here, so you could grab a snack. Or you could just nap. 
+ [Nap {statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / +1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    You set an alarm for just before the end of your lunch break and a take a nap in one of the break room chairs.
    ++ [▼]
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from not eating.
    You gained 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from your nap. 
    {UpdateEnergy(1)}
    {UpdateHealth(-1)}
    -> healthCheck ->
+[Snack{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>}\\n -$1.50)</size>}]  
    {money - 1.50 < 0.01: As you go to use the machine you realize you don't have enough money. Guess you'll just head back to your desk, then. ->->}
    You grab a snack from the vending machines and take the time to eat it. 
    ++ [▼]
    You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating. 
    You paid $1.50 for your snack. 
    {UpdateHealth(1)}
    ~ money -= 1.50
    {AddTransaction(fullDateNumbers, "Vending Machine", 1.50, money)}
-
+ [▼]
-
->->