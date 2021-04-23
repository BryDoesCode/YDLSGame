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
~ locationColor = "apartmentMorning"
~ locationMusic = "apartmentMorning"
~ startLoadingAnimation = false

{CalculateInterest()}
{EarnPaycheck()}

It's morning! Today is {today}, {fullDate}.

You've started with {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} today.{borrowedEnergy > 0: You borrowed {borrowedEnergy} yesterday, so you only have {energy - borrowedEnergy} to work with.} Make it count!
~ energy -= borrowedEnergy
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
~ locationColor = "apartmentBathroom"
You brush your teeth and take your medicine like normal, then turn your attention to food.
- 
+ [▼]
~ background = "apartmentMorning"
~ locationColor = "apartmentMorning"
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from getting ready.
~ energy -= 1
-
+ [▼] -> energyCheck -> firstBreakfast

=firstBreakfast
~ background = "apartmentKitchenMorning"
~ locationColor = "apartmentKitchenMorning"
What would you like to eat for breakfast? 
\\nYou have {prepackagedMealCount} Prepackaged Meal{prepackagedMealCount!=1:s} and {foodIngredientsCount} Set{foodIngredientsCount!=1:s} of Ingredients.
+ [Choose]
-
{prepackagedMealCount == 0 and foodIngredientsCount == 0: Looks like you don't have any food.}
+ {prepackagedMealCount > 0}[Prepacked Meal{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>})\\n(-1 Prepackaged Meal)</size>}]
	{~You settled on cereal this morning. It’s quick and it’s easy. | It's a toast kind of morning. {~This time with butter.| A quick swipe of peanut butter makes all the difference. | Some jelly on top adds just enough sweetness.} | Just a container of yogurt should be fine.} 
	#eatingSFX
    
    ++ [▼]
	You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating.
	~ health += 1
	You used up 1 Prepackaged Meal. 
	~ prepackagedMealCount -= 1
	     
	     
+ {foodIngredientsCount > 0}[Recipe{statHints: \\n<size={statSize}>(-2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} / +2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / +1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>}) \\n(-1 Set of Ingredients)</size>}]
	{~Today was a pancake morning. Sure, you’re a bit tired now but nothing beats the smell of freshly cooked pancakes. | You're exhausted already, but that omlette sure was worth it.}
	#eatingSFX
    
    ++ [▼]
	    You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from cooking.
	    ~ energy -= 2
	    You gained 2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating.
	    ~ health += 2
	    You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from the homecooked meal.
	    ~ wellness += 1
	    You used up 1 Set of Ingredients.
	    ~ foodIngredientsCount -= 1
	    
+ [Skip Eating{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / -1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
        Guess today is not a food day. 
    
    ++ [▼]
	    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from not eating.
	    ~ health -= 1
	    ~ wellness -= 1

- 
+ [▼] -> healthCheck -> wellnessCheck -> energyCheck -> firstShower
= firstShower
~ background = "apartmentMorning"
~ locationColor = "apartmentMorning"

- You still have some time this morning. 
Would you like to take a shower?
+ [▼]
-
+ [Yes{statHints: \\n<size={statSize}>(-3 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} / +1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / +1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
    ~ background = "apartmentBathroom"
    ~ locationColor = "apartmentBathroom"
    Ah, that was a wonderful shower. You feel a bit more tired, but you’re clean and ready to face the day. It felt great. Now it’s time to get dressed and head out.
    #showerSFX
    ++ [▼]
    ~ background = "apartmentMorning"
    ~ locationColor = "apartmentMorning"
    You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from taking a shower.
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from getting dressed. 
    ~ energy -= 3
    You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from taking a shower. 
    ~ health += 1
    ~ wellness += 1
    
    
    
+ [No{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / -1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} / -1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    No time for a shower this morning. You’d rather just get to work. You get dressed as normal and head to work. 
    
    ++ [▼]
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from not taking a shower.
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from getting dressed.
   
    ~ health -= 1
    ~ wellness -= 1
    ~ energy -= 1

- 
+  [Go to Work] -> healthCheck -> wellnessCheck -> energyCheck -> firstWorkTransportation

=firstWorkTransportation
You can either walk to work, or take the bus. 
+ [▼]
-
+ [Walk{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    ~loadingAnimation = "walking"
    You decide to walk. You leave your apartment and begin the short walk to work.  
    ++ [▼]
    --
    ~startLoadingAnimation = true
    You walked. 
    ++ [▼]
    --
    ~ energy -= 1
    ~ time = Midday
    ~ location = "Work"
    ~ background = "officeWorkExterior"
    ~ locationColor = "officeWorkExterior"
    ~ locationMusic = "exteriorCity"
    ~ startLoadingAnimation = false
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} walking.
    ++ [▼]
    -- -> energyCheck ->
+[Bus{statHints: \\n<size={statSize}>(-$2.00)</size>}]
    ~loadingAnimation = "bus"
    You decide to travel by bus. You leave your apartment to go wait at the bus stop. 
    ++ [▼]
    --
    ~ startLoadingAnimation = true
    You traveled by bus. 
    ++ [▼]
    --
    ~ money -= 2
    {AddTransaction(fullDateNumbers, "Bus Fare", 2, money)}
    ~ time = Midday
    ~ location = "Work"
    ~ background = "officeWorkExterior"
    ~ locationColor = "officeWorkExterior"
    ~ locationMusic = "exteriorCity"
    ~ startLoadingAnimation = false
    You spent $2.00 on bus fare.
    ++ [▼]
    --
-
Upon arriving outside the office building, you stare at the surrounding city in awe. It's almost unreal that you work and live here, now. 
+ [▼]
-
With a deep breath, you walk into the building and get ready to face your first day of work. 
+ [▼]
-
~ background = "officeWorkRoom"
~ locationColor = "officeWorkRoom"
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
{ChangeConversationFocus(NPC, "{managerFirstName}")}
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
+ ["I think I'm good. Should I come to you if I have any questions in the future? {statHints: \\n<size={statSize}>(+2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}
    "Yes please. We're a small branch here, so I work directly with everyone."
    ++ [▼]
    Your relationship with {managerFirstName} increased by 2. 
    ~ managerRelationshipWithPlayer += 2
    
+ [Should I have questions? That was too simple. {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{managerFirstName}")}
    "Not necessarily. I just wanted to make sure you're all set. It's my job, after all."
    ++ [▼]
    Your relationship with {managerFirstName} decreased by 1. 
    ~ managerRelationshipWithPlayer -= 1
-
+ [▼]
-
{ChangeConversationFocus(NPC, "{managerFirstName}")}
"Your first assignment is there on your desk. The instructions should be pretty clear. Take today to get familiar with your computer system and see if you can handle the assignment."
+ [▼]
-
"I'll come by again when it's time for lunch to make sure you're doing okay. Feel free to take quick breaks as needed throughout the day, just make sure you get the job done." 
+ [▼]
-
{managerFirstName} gives you a friendly wave as they walk away, leaving you to your own devices until lunch. 
~ conversationActive = false
~ activeNPCID = 99
+ [▼]
- -> firstWorkDay
= firstWorkDay
You spend the next few hours personalizing your desk area, reading through the instructions, and seeing how hard this work actually is. 
+ [▼]
-
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from working.
~ energy -= 1
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
    ++ [▼]
    
+ ["It sucked." {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]    
    {ChangeConversationFocus(NPC, "{managerFirstName}")}<>"Can't always have a great day, I guess. Maybe lunch will help out."
    ++ [▼]
    \\nYour relationship with {managerFirstName} decreased by 1. 
    ~ managerRelationshipWithPlayer -= 1
-
{ChangeConversationFocus(NPC, "{managerFirstName}")}
+ [▼]
-
"Follow me and I'll take you to the break room. It's well equipped, and a great place to take lunch."
+ [▼]
-
After turning a few corners, you reach the break room. 
+ [▼]
-
~ background = "officeBreakRoom"
"See? What did I tell you? State of the art."
+ [▼]
-
You keep any personal opinions you have about the break room to yourself and just nod. 
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
~ energy -= 1
-> energyCheck ->
+ [▼]
-
You made it to the end of the day. Finally. You look back at the building once you're outside and decide what to do with the rest of your night.
-
+ [▼]
-
+ [Head Home]
-> endofday
+ [Go to Store]
-> store
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
    ~ energy -=1
    ~ health +=2
    ~ managerRelationshipWithPlayer += 2
    -> energyCheck ->
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
    ~ health -= 1
    ~ energy += 1
    -> healthCheck ->
+[Snack{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>}\\n -$1.50)</size>}]  
    You grab a snack from the vending machines and take the time to eat it. 
    ++ [▼]
    You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating. 
    You paid $1.50 for your snack. 
    ~ health += 1
    {AddTransaction(fullDateNumbers, "Vending Machine", 1.50, money)}
-
+ [▼]
->->