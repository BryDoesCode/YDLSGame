=== energyCheck ===
<> {energy <= 1: -> lowEnergy ->} ->->

= lowEnergy
Wait! You only have {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>}. 
{location == "Apartment" and date > 3: -> lowEnergyHome}
-> borrowEnergy -> 
<> ->->

= borrowEnergy
You can borrow 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from tomorrow for 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} today{not health - 1 < 1 || not wellness - 1 < 1:, or you can push through and trade 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} for 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} right now}.
+ [▼]
-
+ [Borrow {coloredText:<color=\#89a15c>}Energy{coloredText:</color>}{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})\\n(-2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} Tomorrow)</size>}]
    ~ borrowedEnergy = 2
    {UpdateEnergy(1)}
    You borrowed 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from tomorrow and gained 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} today.
    You now have {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>}. 
    ++ [▼] 
+ {not health - 1 < 1 or not wellness - 1 < 1} [Trade {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>}{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})\\n(-1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / -1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} in exchange for 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>}.
    {UpdateEnergy(1)}
    {UpdateHealth(-1)}
    {UpdateWellness(-1)}
    You now have {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>}.
    ++ [▼] -> healthCheck -> wellnessCheck ->
- <>
->->
    
= lowEnergyHome
You're at home, so you should just go to bed. 
+ [▼]
-
+ [Head to Bed Early] 
    {UpdateStatSummary()}
    Stat Summary Updated.
    ++ [▼] -> morning
+ [Borrow {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} Instead] -> borrowEnergy
->->


=== healthCheck === 
{health < 1: -> lowHealth ->} ->->

= lowHealth
Wait? Everything seems to be going hazzy. You only have {health} {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>}. You pass out. 
+ [▼] 
~ health = 1
{location == "Apartment": -> afterPassOutMorning}
-> hospital



=== wellnessCheck ===
{wellness < 1: -> lowWellness ->} ->->

= lowWellness
Wait? Everything seems to be going hazzy. You only have {wellness} {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>}. You pass out. 
+ [▼] 
~ wellness = 1 
{location == "Apartment": -> afterPassOutMorning}
-> hospital
