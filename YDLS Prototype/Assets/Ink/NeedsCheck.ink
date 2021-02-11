=== energyCheck ===
<> {energy <= 1: -> lowEnergy ->} ->->

= lowEnergy
Wait! You only have {energy} Energy. 
{location == "Apartment": -> lowEnergyHome}
-> borrowEnergy -> 
<> ->->

= borrowEnergy
You can borrow 2 Energy from tomorrow for 1 Energy today{not health - 1 < 1 || not wellness - 1 < 1:, or you can push through and trade 1 Health and 1 Wellness for 1 Energy right now}.
+ [▼]
-
+ [Borrow Energy{statHints: \\n<size={statSize}>(+1 Energy)\\n(-2 Energy Tomorrow)</size>}]
    ~ borrowedEnergy = 2
    ~ energy += 1
    You borrowed 2 Energy from tomorrow and gained 1 Energy today.
    You now have {energy} Energy. 
    ++ [▼] 
+ {not health - 1 < 1 || not wellness - 1 < 1} [Trade Health and Wellness{statHints: \\n<size={statSize}>(+1 Energy)\\n(-1 Health / -1 Wellness)</size>}]
    You lost 1 Health and 1 Wellness in exchange for 1 Energy.
    ~ health -= 1
    ~ wellness -= 1
    ~ energy += 1
    You now have {energy} Energy.
    ++ [▼] 
- <>
->->
    
= lowEnergyHome
You're at home, so you should just go to bed. 
+ [▼]
-
+ [Head to Bed Early] -> morning
+ [Borrow Energy Instead] -> borrowEnergy
->->


=== healthCheck === 
{health < 1: -> lowHealth ->} ->->

= lowHealth
Wait? Everything seems to be going hazzy. You only have {health} Health. You pass out. 
+ [▼] 
~health += 1
-> morning



=== wellnessCheck ===
{wellness < 1: -> lowWellness ->} ->->

= lowWellness
Wait? Everything seems to be going hazzy. You only have {wellness} Wellness. You pass out. 
+ [▼] 
~wellness += 1 
-> morning