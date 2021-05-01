
/*--------------------------------------------------------------------------------

	Office Work

--------------------------------------------------------------------------------*/

=== officeWork ===
You can either walk to work, or take the bus. 
+ [▼]
-
+ (officeWorkMorningWalk) [Walk{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    You leave your apartment and begin the short walk to work.  
    ++ [▼]
    --
    ~ loadingAnimation = "walking"
    ~ locationMusic = "walking"
    ~ startLoadingAnimation = true
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
    {money - 2.00 < 0.01: Oops, looks like you don't have enough money to ride the bus. Guess you're walking. -> officeWorkMorningWalk} You decide to travel by bus. You leave your apartment to go wait at the bus stop. 
    ++ [▼]
    --
    ~ loadingAnimation = "bus"
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
Time to head inside. 
+ [Go Inside]
-
~ background = "officeWorkRoom"
~ locationMusic = "work"
-> ArriveAtOfficeWork -> healthCheck -> wellnessCheck -> energyCheck ->
+ [▼]
-
~ background = "officeWorkComputer"
With a quick sigh you sit down at your desk, so you can begin working. 
+ [▼]
-
+ [Work Hard{statHints: \\n<size={statSize}>(-3 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} / -2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>})\\n(+2 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
    You decide to give work your all today. You speed through the documents you need to finish. It's almost as if you typing speed has doubled. 
    
    ++ [▼]
    You lost 3 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} and 2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from working hard.
    {UpdateEnergy(-3)}
    You gained 2 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from being a hard worker. 
    {UpdateHealth(-2)}
    {UpdateWellness(2)}
+ [Work Normally{statHints: \\n<size={statSize}>(-2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} / -1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>})\\n(+1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
    You give an average effort today. You get work done, but you don't really try to get the work done. 
    ++ [▼]
    You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} and 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from working.
    {UpdateEnergy(-2)}
    You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from completing some work.
    {UpdateHealth(-1)}
    {UpdateWellness(1)}   
+ [Slack Off{statHints: \\n<size={statSize}>(-2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    It's not really like they pay you enough for this job anyway. You do your work, basically, but don't really put any effort into it. Whatever. 
    ++ [▼]
    You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from working. 
    {UpdateEnergy(-2)}
-
+ [▼] -> healthCheck -> wellnessCheck -> energyCheck ->
Time for lunch! 
-
+ [▼]
-
You head to the breakroom. 
+ [▼]
-
~ background = "officeWorkBreakroom"
+ {lunchToWork}[Eat the Lunch You Brought{statHints: \\n<size={statSize}>(+2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>})</size>}]
    {closedCaptions: [chewing]\\n}
    You grab the lunch you brought and eat it at one of the tables.
    #eatingSFX
    ++ [▼]
    You gained 2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating.
    {UpdateHealth(2)}
    You used up one Prepackaged Lunch. 
    ~ lunchPrepackagedMealCount -= 1
+ {not lunchToWork}[Buy Snack{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>}\\n -$1.50)</size>}]  
    {money - 1.50 < 0.01: <>As you go to use the machine you realize you don't have enough money. Guess you'll just head back to your desk, then. -> afternoonCheck}
    <>You grab a snack from the vending machines and take the time to eat it. 
    ++ [▼]
    You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating. 
    You paid $1.50 for your snack. 
    {UpdateHealth(1)}
    ~ money -= 1.50
    {AddTransaction(fullDateNumbers, "Vending Machine", 1.50, money)}
+ [Take a Quick Nap{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>})\\n(+1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    You lean back in a chair in the corner of the break room. You feel like you only closed your eyes for a second before it's time to get back to work, but at least you feel a bit refreshed.
    ++ [▼]
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from not eating.
    You gained 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from your nap.
    {UpdateHealth(-1)}
    {UpdateEnergy(1)}
+ {coworkerConvoCount < 3} [Talk to a Coworker]
    {coworkerConvoCount == 0: -> coworkerConversation ->}{coworkerConvoCount == 1: -> coworkerConversationTwo ->}{coworkerConvoCount == 2: -> coworkerConversationThree ->}
     ~ location = "Work"
    --
    ++ [▼]
    --
    You lost track of time and didn't end up eating anything for lunch. 
    ++ [▼]
    --
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from not eating. 
    {UpdateHealth(-1)}
-
+ (afternoonCheck)[▼] -> healthCheck -> wellnessCheck -> energyCheck ->
-
~ background = "officeWorkComputer"
You head back to work, resigned to finish your shift. 
+ [▼] -> OfficeAfternoon -> healthCheck -> wellnessCheck -> energyCheck ->
-
+ [▼]
-
Another few hours of typing later and you've made it to the end of the day. Finally. 
+ [▼] -> LeaveWork

=== LeaveWork
+ [Head Home]

You can either walk home or take the bus.
++ [▼]
--
++ (officeWorkWalkHome) [Walk{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    You leave work and walk home.  
    +++ [▼]
    ---
    ~ loadingAnimation = "walking"
    ~ locationMusic = "walking"
    ~ startLoadingAnimation = true
    You walked. 
    +++ [▼]
    ---
    ~ location = "Apartment"
    ~ background = "apartmentEvening"
    ~ time = Evening
    ~ locationMusic = "apartmentEvening"
    ~ startLoadingAnimation = false
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} walking.
    {UpdateEnergy(-1)}
    +++ [▼] -> energyCheck -> endofday
++[Bus{statHints: \\n<size={statSize}>(-$2.00)</size>}]
    {money - 2.00 < 0.01: Oops, looks like you don't have enough money to ride the bus. Guess you're walking. -> officeWorkWalkHome}
    You decide to travel by bus. You leave work to go wait at the bus stop. 
    +++ [▼]
    ---
    ~ loadingAnimation = "bus"
    ~ startLoadingAnimation = true
    ~ locationMusic = "bus"
    You traveled by bus. 
    +++ [▼]
    ---
    ~ money -= 2
    {AddTransaction(fullDateNumbers, "Bus Fare", 2, money)}
    ~ location = "Apartment"
    ~ background = "apartmentEvening"
    ~ time = Evening
    ~ locationMusic = "apartmentEvening"
    ~ startLoadingAnimation = false
    You spent $2.00 on bus fare.
    +++ [▼] -> endofday
+ [Go to Store]
The Convenience Store is nearby, so you can either wait for the bus or just walk there. 
++ [▼]
--
++ (firstWorkDaySecondWalk) [Walk{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    You leave work and walk to the store.  
    +++  [▼]
    ---
    ~ loadingAnimation = "walking"
    ~ locationMusic = "walking"
    ~ startLoadingAnimation = true
    You walked. 
    +++ [▼]
    ---
    ~ time = Evening
    ~ location = "Store"
    ~ background = "convenienceStoreEveningExterior"
    ~ locationMusic = "exteriorCity"
    ~startLoadingAnimation = false
    {closedCaptions: [city sounds]\\n}
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} walking.
    {UpdateEnergy(-1)}
    +++ [▼] -> energyCheck -> store
++ [Bus{statHints: \\n<size={statSize}>(-$2.00)</size>}]
    {money - 2.00 < 0.01: Oops, looks like you don't have enough money to ride the bus. Guess you're walking. -> firstWorkDaySecondWalk}
    You decide to travel by bus. You leave work to go wait at the bus stop. 
    +++ [▼]
    ---
    ~ loadingAnimation = "bus"
    ~ startLoadingAnimation = true
    ~ locationMusic = "bus"
    You traveled by bus. 
    +++ [▼]
    ---
    ~ money -= 2
    {AddTransaction(fullDateNumbers, "Bus Fare", 2, money)}
    ~ time = Evening
    ~ location = "Store"
    ~ background = "convenienceStoreEveningExterior"
    ~ locationMusic = "exteriorCity"
    ~ startLoadingAnimation = false
    You spent $2.00 on bus fare.
    +++ [▼] -> store


/*--------------------------------------------------------------------------------

    Variety Functions -- Retail Work

--------------------------------------------------------------------------------*/



=== ArriveAtOfficeWork

~ randomNumber = RANDOM(1, 7)
{ randomNumber:
- 1:
    <>You arrived just on time.  
    ->->
- 2: 
    <>You're a few minutes early. You take a moment to breathe and prepare yourself for the day.  
    + [▼]
    You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from destressing.
    {UpdateWellness(1)}
    ->->
- 3:
    <>You see the clock on the wall and realize that somehow you're late. You're never late. You rush inside and hope your manager doesn't see you.  
    + [▼]
    You lost 2 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from the stress of being late.
    {UpdateWellness(-2)}
    ->->
- 4:
    <>You bump into someone on the way in and all the papers they're carrying scatter to the floor. You apologize and help them pick things up, but feel mortified. 
    + [▼]
    You lost 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from embarassment.
    {UpdateWellness(-1)}
    ->->
- 5:
    <>Someone slams into you as you're walking to your desk. You topple to the floor and they just keep walking, as if they didn't see you at all. 
    + [▼]
    You lost 2 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from embarassment.
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from the fall. 
    {UpdateWellness(-2)}
    {UpdateHealth(-1)}
    ->->
- 6:
    <>It seems your arrival is uneventful this time.  
    ->->
- 7:
    <>You accidentally walk too close to two coworkers who were talking in hushed whispers. They both give you an accusing look. You walk away quickly. 
    + [▼]
    You lost 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from embarassment.
    {UpdateWellness(-1)}
    ->->
}

=== OfficeAfternoon

~ randomNumber = RANDOM(1, 7)
{ randomNumber:
- 1:
    <>The afternoon continues uneventfully.  
    ->->
- 2: 
    <>You try some of that, "in your office chair" meditation you found on a website when searching for a spreadsheet question.  
    + [▼]
    You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from destressing.
    {UpdateWellness(1)}
    ->->
- 3:
    <>Your hands start to cramp, making it hard to complete what you're typing. You attempt to stretch them out, but it's no use.   
    + [▼]
    You lost 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from stress.
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from pain. 
    {UpdateWellness(-1)}
    {UpdateHealth(-1)}
    ->->
- 4:
    <>Someone bumps into your chair as they're walking by, throwing off your whole groove. 
    + [▼]
    You lost 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from being distracted.
    {UpdateWellness(-1)}
    ->->
- 5:
    <>Someone slams into you as they're walking to their desk. You almost fall out of your chair and only get a, "Oh, sorry," in return.  
    + [▼]
    You lost 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from embarassment.
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from the physical discomfort. 
    {UpdateWellness(-1)}
    {UpdateHealth(-1)}
    ->->
- 6:
    <>You successfully finish the document you were working on, only to see an e-mail about the next document you need to do. No time for rest.  
    ->->
- 7:
    <>Everything goes smoothly. Somehow. Weird.
    ->->
}