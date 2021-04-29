
/*--------------------------------------------------------------------------------

	Office Work

--------------------------------------------------------------------------------*/

=== officeWork ===
You can either walk to work, or take the bus. 
+ [▼]
-
+ [Walk{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    ~loadingAnimation = "walking"
    You decide to walk. You leave your apartment and begin the short walk to work.  
    ++ (officeWorkMorningWalk) [▼]
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
    {money - 2.00 < 0.01: Oops, looks like you don't have enough money to ride the bus. Guess you're walking. -> officeWorkMorningWalk} You decide to travel by bus. You leave your apartment to go wait at the bus stop. 
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
Time to head inside. 
+ [Go Inside]
-
~ background = "officeWorkRoom"
~ locationMusic = "work"
-> ArriveAtRetailWork -> healthCheck -> wellnessCheck ->
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
+ [Take a Quick Nap{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    You lean back in a chair in the corner of the break room. You feel like you only closed your eyes for a second before it's time to get back to work, but at least you feel a bit refreshed. 
    
    ++ [▼]
    
    You gained 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from your nap.
    ~energy += 1
+ [Talk to a Coworker]
    -> coworkerConversation ->
     ~ location = "Work"
-
+ [▼]
-
You head back to work, resigned to finish your shift. 

+ [▼]
-
Another few hours of typing later and you've made it to the end of the day. Finally. 
+ [▼] -> LeaveWork

=== LeaveWork
+ [Head Home]

You can either walk home or take the bus.
++ [▼]
--
++ [Walk{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    ~loadingAnimation = "walking"
    You decide to walk. You leave work and head home.  
    +++ (officeWorkWalkHome) [▼]
    ---
    ~startLoadingAnimation = true
    You walked. 
    +++ [▼]
    ---
    ~ location = "Apartment"
    ~ background = "apartmentEvening"
    ~ time = Evening
    ~ locationMusic = "apartmentEvening"
    ~startLoadingAnimation = false
    {closedCaptions: [city sounds]\\n}
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} walking.
    {UpdateEnergy(-1)}
    +++ [▼] -> energyCheck -> endofday
++[Bus{statHints: \\n<size={statSize}>(-$2.00)</size>}]
    ~loadingAnimation = "bus"
    {money - 2.00 < 0.01: Oops, looks like you don't have enough money to ride the bus. Guess you're walking. -> officeWorkWalkHome}
    You decide to travel by bus. You leave work to go wait at the bus stop. 
    +++ [▼]
    ---
    ~startLoadingAnimation = true
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
++ [Walk{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    ~loadingAnimation = "walking"
    You decide to walk. You leave work and head to the store.  
    +++ (firstWorkDaySecondWalk) [▼]
    ---
    ~startLoadingAnimation = true
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
    ~loadingAnimation = "bus"
    {money - 2.00 < 0.01: Oops, looks like you don't have enough money to ride the bus. Guess you're walking. -> firstWorkDaySecondWalk}
    You decide to travel by bus. You leave work to go wait at the bus stop. 
    +++ [▼]
    ---
    ~startLoadingAnimation = true
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



=== ArriveAtRetailWork

~ randomNumber = RANDOM(1, 3)
{ randomNumber:
- 1:
    You arrived just on time.  
    ->->
- 2: 
    You're a few minutes early. You take a moment to breathe and prepare yourself for the day.  
    + [▼]
    You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from destressing.
    ~ wellness += 1
    ->->
- 3:
    You see the clock on the wall and realize that somehow the bus was late. It's never late. You rush to the register, and clock in five minutes after your shift was supposed to start. Your manager doesn't seem to notice, thankfully. 
    + [▼]
    You lost 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from the stress of being late.
    ~ wellness -= 1
    ->->
}