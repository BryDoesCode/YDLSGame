
/*--------------------------------------------------------------------------------

	Retail Work

--------------------------------------------------------------------------------*/

=== retailwork ===
~loadingAnimation = "bus"
~startLoadingAnimation = true
You traveled by bus.
+ [▼]
-
~ location = "Work"
~ background = "retailWorkFront"
~ time = Midday
~ locationColor = "retailWorkFront"
~ locationMusic = "exteriorCity"
~ startLoadingAnimation = false
You made it to work. 

+ [Go Inside]
-
~ background = "retailWorkRegister"
~ locationColor = "retailWorkRegister"
~ locationMusic = "work"

-> ArriveAtRetailWork -> healthCheck -> wellnessCheck ->
+ [▼]
-
+ [Work Hard{statHints: \\n<size={statSize}>(-3 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} / -2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>})\\n(+2 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
    You decide to give work your all today. You clean shelves, organize clothing, and help customers. You feel really accomplished and in a lot of pain by the end of the day.
    
    ++ [▼]
    You lost 3 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} and 2 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from working hard.
    ~energy -= 3
    ~health -=2
    You gained 2 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from being a hard worker. 
    ~wellness += 2
    
+ [Slack Off{statHints: \\n<size={statSize}>(-2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    It's not really like they pay you enough for this job anyway. You do your work, basically, but don't really put any effort into it. Whatever. 
    
    ++ [▼]
    You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} and 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from working. 
    ~energy -=2
-
+ [▼] -> healthCheck -> wellnessCheck -> energyCheck ->
Time for your afternoon break! 
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
You head back to work, resigned to finish your shift. 
-
+ [▼]
You made it to the end of the day. Finally. 
-
+ [▼]

-
+ [Head Home]

-> endofday

+ [Go to Store]
-> store

/*--------------------------------------------------------------------------------

    Variety Functions -- Retail Work

--------------------------------------------------------------------------------*/



=== ArriveAtRetailWork

~ randomNumber = RANDOM(1, 3)
{ randomNumber:
- 1:
    You arrived just on time. You clock in on the register before unlocking the front door.
    ->->
- 2: 
    You're a few minutes early. You take a moment to breathe and prepare yourself for the day, before clocking in and opening up the store. 
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