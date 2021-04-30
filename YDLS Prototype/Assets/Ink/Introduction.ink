=== introduction ===
~ time = Midday
~ today = Tuesday
~ fullDate = month + " " + date
~ fullDateNumbers = monthNumber + "/" + date
~ location = "Daydream"
~ background = "black"
~ locationMusic = "startMenu"
When was the last time you felt healthy? It's such a strange thing to think about. What even is "healthy?" 
+ [▼]
-
Is it not worrying about forgetting your medication each morning? Perhaps.
+ [▼]
-
To be fair, it's not like you're "sick", at least not officially. You're undiagnosed. You have the symptoms but not the disease.
+ [▼]
-
Or, at least, they don't know what disease you have. You certainly feel like you have one. 
+ [▼]
-
It's there with you, every day, looming. Just waiting for the right moment to strike. 
+ [▼]
-
~ energy = 5
~ health = 6
~ wellness = 6
{ResetStatTracking()}
~ location = "Kitchen"
~ background = "parentKitchen"
~ locationMusic = "parentKitchen"
{closedCaptions: [door knocks]\\n}
#knockingSFX
Suddenly, there's a knock on the door. You startle out of your thoughts and remember you're the only one home right now. 
+ [Answer Door]
-
A mail carrier greets you. They politely ask for your signature and hand you an electronic device with a plastic stylus.
+ [Take Stylus]
-
~ showSignNameContainer  = true
You sign your name. 
+ [Sign Name]
-
~ showSignNameContainer = false
{closedCaptions: [scratchy writing]\\n}
#writingSFX
With a quick, "Thank you!" they hand over a large, thin envelope and return to their car. You close the door and return to the kitchen.
+ [▼]
-
You open the package at the kitchen table and stare in awe at the final piece of the puzzle: your high school diploma. 
+ [▼]
-
Congratulations! You did it. The person who stayed home sick at least once a week managed to successfully graduate. 
+ [▼]
-
You're officially an adult. At least, according to your parents' logic. 
+ [▼]
-
They both promised that once you graduated you could move out on your own, get a job, and prove your independence. 
+ [▼]
-
With no time to waste, you head to your room to grab a coat. Before rushing out the door, you take a moment to look at yourself in the hallway mirror. 
+ [Adjust Appearance]
-
~ showCharacterCreationContainer = true
+ [▼]
-
~ showCharacterCreationContainer = false
~ characterCreationCompleted = true
<>That's better. You feel ready to head out into the world. Or, at least, to go to the local convenience store to grab a newspaper. 
{GenerateMother()}
{GenerateFather()}
{GenerateCoworker()}
{GenerateManager()}
{UpdateNPCs()}
+ [▼]
-
It's a bit old fashion, but you heard the best place to find apartments and jobs in the nearby city was in the newspaper classifieds. 
+ [▼]
-
Just as you're about to leave, you pause for a second to check-in with yourself. When you're excited, it's easy to lose track of how you're actually feeling. 
+ [▼]
-
~ showEnergySlider = true
Your current {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} is {energy}. It reprents the general {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} you have to accomplish tasks and exist in the world. 
+ [▼]
-
If you run out of {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} you can push yourself further, for a price. It is shown using a {coloredText:<color=\#89a15c>}green color{coloredText:</color>}.
+ [▼]
-
~ showHealthSlider = true
Your current {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} is {health}. It represents your physical {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>}. The lower your {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} the sicker you feel. 
+ [▼]
-
If you run out of {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} you pass out. It is shown using a {coloredText:<color=\#9f4d3a>}red color{coloredText:</color>}. 
+ [▼]
-
~ showWellnessSlider = true
Your current {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} is {wellness}. It represents your mental {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>}. The lower your {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} the worse you feel emotionally. 
+ [▼]
-
If you run out of {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} you pass out. It is shown using a {coloredText:<color=\#7a8f8b>}blue color{coloredText:</color>}. 
+ [▼]
-
~ showNeedsButton = true
You can check-in with yourself at any time by viewing the Needs menu by clicking on your avatar in the top-left corner. Or looking at the numbers at the top of the screen.
+ [▼]
-
You're not feeling the best, but you should have enough {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} to make it to the store and back. 
+ [▼]
-
{closedCaptions: [door slam]\\n}
You lock the door behind you and make your way to the local bus stop. 
#doorCloseSFX
+ [Ride Bus]
-
-> introductionConvenienceStore


=== introductionConvenienceStore ===
~loadingAnimation = "bus"
~startLoadingAnimation = true
~ locationMusic = "bus"
You traveled by bus.
+ [▼]
-
~ location = "Store"
~ background = "convenienceStoreEveningExterior"
~ time = Evening
~ locationMusic = "exteriorCity"
~ startLoadingAnimation = false

~ costBreakfastPrepackagedMeal = 5.00
~ costBreakfastIngredients = 3.00
~ costLunchPrepackagedMeal = 5.00
~ costLunchIngredients = 3.00
~ costDinnerPrepackagedMeal = 5.00
~ costDinnerIngredients = 3.00
~ costToiletries = 2.25
~ costCleaningSupplies = 2.99
~ costNewspaper = 1.79

{closedCaptions: [city sounds]\\n}
You've arrived at the convenience store.
+ [▼]
-
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from riding the bus. 
{UpdateEnergy(-1)}
+ [Go Inside]
-
-> introductionInsideStore
= introductionInsideStore
~ background = "convenienceStoreEvening"
~ locationMusic = "store"

You see rows and rows of items and a bored cashier at the register.
+ [▼]
-
Before you buy anything, you should probably check how much money you have in your bank account.
+ [▼]
-
~ showBankingButton = true
You can view your banking in the menu below. It keeps track of your expenses and has a bill-pay option. Not that you have bills, yet. 
+ [▼]
-
Looks like you have ${money} right now. Should be enough for a newspaper. 
+ [Shop]
-
-> introductionShop
= introductionShop
~ storePrompt = true
~ purchaseResponse = "Please select your items."
~ showInventoryButton = true
<>You make your purchases. 
+ [▼]
-
You can view any item you've purchased by viewing the Inventory app in the menu.
+ {newspaperCount <= 0} [▼]
    Looks like you forgot to grab the newspaper. Better go back to the register.
    ++ [Shop] -> introductionShop
+ {newspaperCount >= 1} [▼]
    Once you have the newspaper in hand, you start to leave the store to wait for the return bus.
-
+ [Go Home]
-
-> introductionKitchenEvening

=== introductionKitchenEvening ===

~ loadingAnimation = "bus"
~ startLoadingAnimation = true
~ locationMusic = "bus"
You traveled by bus.
+ [▼]
-
~ startLoadingAnimation = false
~ time = Evening
~ location = "Kitchen"
~ background = "parentKitchen"
~ locationMusic = "rain"
{closedCaptions: [rain drops]\\n}
By the time you make it home, you're exhausted. The bus was late, and it started to rain while you waited. Because of course it started to rain.
+ [▼]
-
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from standing while waiting.
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from riding the bus. 
You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from getting soaked. 
{UpdateEnergy(-2)}
{UpdateHealth(-1)}
+ [▼]
-
~ locationMusic = "parentKitchen"
~ background = "parentKitchenNewspaper"
You managed to protect the newspaper from getting soaked, somehow. You set it down on the kitchen table, next to your diploma. 
+ [▼]
-
You only have {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} left. Looking for your first apartment and first job will have to wait until tomorrow. 
+ [▼]
-
You use your remaining {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} to get out of the wet clothes and get ready for bed. 
+ [Sleep]
-
{UpdateStatSummary()}
Stat Summary Updated.
+ [▼]
-
-> introductionDayTwo

=== introductionDayTwo ===
~ loadingAnimation = "sleep"
~ startLoadingAnimation = true
{AdvanceWeekday()}
~ date ++
~ time = Morning
~ fullDate = month + " " + date
~ fullDateNumbers = monthNumber + "/" + date
~ energy = 6
~ location = "Bedroom"
~ background = "black"
~ locationMusic = "parentKitchen"
{ResetStatTracking()}
You slept.
+ [▼]
-
~ startLoadingAnimation = false
You wake up feeling a little sore, but it could be worse.
+ [▼]
-
The light from your window is too strong at the moment, so you were keeping your eyes squeezed shut.
+ [▼]
-
~ background = "bedroomAtParents"
You slowly open them, letting your eyes adjust to the new morning. 
+ [▼]
-
You seem to have {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} today, better make it count. 
+ [▼]
-
Speaking of your {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} level, the events of yesterday flood back into your mind just as the smell of pancakes floods into your nose.
+ [▼]
-
After grabbing your medication, you take an extra minute to brush your teeth before letting your sense of smell guide you to the kitchen.
+ [▼]
-
You lose 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from brushing your teeth. 
{UpdateEnergy(-1)}
+ [▼]
-
~ location = "Kitchen"
~ background = "parentKitchenNewspaper"
~ locationMusic = "parentKitchen"
Your mother is sitting at the table, while your father flips pancakes in a pan on the stove. Each flip sends another wave of the sweet smell in your direction. 
+ [▼]
-
Your mother lightly taps the diploma you left on the table yesterday to get your attention. 
+ [▼]
-
~ conversationActive = true
~ activeNPCID = 0
{ChangeConversationFocus(NPC, "{motherFirstName}")}
"Congratulations {firstName}! We're both so proud of you!"

+ [Respond]
{ChangeConversationFocus(Player, "{motherFirstName}")}
-
+ ["Thanks so much!" {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{motherFirstName}")}
    "You're welcome. I know things haven't been easy, especially with your doctors still trying to find a suitable diagnosis. You really earned this."
    ++ [▼]
    Your relationship with your mother, {motherFirstName}, increased by 1. 
    ~ motherRelationshipWithPlayer += 1
+ ["You know what that means." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{motherFirstName}")}
    "What I do know is things haven't been easy, especially with your doctors still trying to find a suitable diagnosis. You really earned this."
    ++ [▼]
    Your relationship with your mother, {motherFirstName}, increased by 1. 
    ~ motherRelationshipWithPlayer += 1
+ ["No thanks to you." {statHints: \\n<size={statSize}>(-2 Relationship)</size>}]
    {ChangeConversationFocus(NPC, "{motherFirstName}")}
    "It hasn't been easy, especially with your doctors still trying to find a suitable diagnosis. But that's no excuse to be rude."
    ++ [▼]
    Your relationship with your mother, {motherFirstName}, decreased by 2. 
    ~ motherRelationshipWithPlayer -= 2
-
+ [▼]
- 
~showContactsButton = true
You can view your relationships with people and other information about them in your Contacts app.
+ [▼]
- 
Your mother sighs, then turns her attention to the newspaper. 
+ [▼]
- 
"I think I know what you really want to talk about, though."
+ [Respond]
{ChangeConversationFocus(Player, "{motherFirstName}")}
-
+ ["You promised, once I had my diploma." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
 {ChangeConversationFocus(NPC, "{motherFirstName}")}
    "We did promise. Shall we look at the paper together?"
    ++ [▼]
    Your relationship with your mother, {motherFirstName}, increased by 1. 
    ~ motherRelationshipWithPlayer += 1
+ ["Of course, I'm an adult now." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
 {ChangeConversationFocus(NPC, "{motherFirstName}")}
    "You are indeed. You grew up so fast, too fast. But we did promise you."
    ++ [▼]
    Your relationship with your mother, {motherFirstName}, increased by 1. 
    ~ motherRelationshipWithPlayer += 1
+ [Grab the paper and say nothing. {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]
 {ChangeConversationFocus(NPC, "{motherFirstName}")}
    "Come now. I know you're excited, but a little patience goes a long way. We did promise you, after all."
    ++ [▼]
    Your relationship with your mother, {motherFirstName}, decreased by 1. 
    ~ motherRelationshipWithPlayer -= 1
-
+ [▼]
- 
"Now, before we start looking, we did have a few ground rules. We'll cover your first month of rent, the security deposit, and any utility start-up costs, but the rest of the bills will be up to you."
+ [▼]
- 
"We can't forget to deposit the graduation money you got from your grandparents. That should be enough to get you started." 
+ [▼]
- 
~ conversationActive = false
~ activeNPCID = 99
~ location = "Kitchen"
You and your mother open the newspaper to the classifieds section while your father continues to quietly flip pancakes. He seems to have a subtle smile on his face. 
+ [▼]
- 
What would you like to look at first? 
+ [Choose]
- 
-> classifieds
= classifieds
{apartmentChoosen: <>Looks like you found an apartment, better look at jobs now.}
{jobChoosen: <>Looks like you found a job, better look at apartments now.}
+ {not apartmentChoosen} [Apartments Section]
    You start skimming the apartment section and find the following options. 
    ++ (apartments) [▼]
        +++ [Basic City Apartment]
            The Basic City Apartment is located just inside the city limits in an older building. It's a bit rundown but the rent is only $600 a month. It comes already furnished.
            ++++ [▼]
            ----
            It's also close to the bus stop, and the convenience store you visited for the paper yesterday. The train station takes a bit of a walk, though. 
            ++++ [Look At Another Apartment]
            -> apartments
            ++++ {not jobChoosen} [Look At All Listings]
            -> classifieds
            ++++ [Choose Apartment]
            You pause your search to call about the Basic City Apartment. It's still available, so you set up a time to look at it. 
            ~ apartmentChoosen = true
            {not jobChoosen: -> classifieds}
        +++ [Suburban Apartment]
            The Suburban Apartment is outside the city limits, in an affordable neighborhood. It's quite cute. The rent is $900 a month. It comes already furnished.
            ++++ [▼]
            ----
            It's close to the bus stop, but the train station is quite a walk. No stores are nearby.
            ++++ [Look At Another Apartment]
            -> apartments
            ++++ {not jobChoosen} [Look At All Listings]
            -> classifieds
            ++++ [Choose Apartment]
            You pause your search to call about the Suburban Apartment. It seems to be no longer available. 
        +++ [High-rise Apartment]
            The High-rise Apartment is right in downtown, in one of the smaller high-rise buildings. It's as fancy as can get but is $1200 a month. It comes already furnished.
            ++++ [▼]
            ----
            It's close to both a bus stop and a train station. You can also walk to most city jobs.
            ++++ [Look At Another Apartment]
            -> apartments
            ++++ {not jobChoosen} [Look At All Listings]
            -> classifieds
            ++++ [Choose Apartment]
            You pause your search to call about the High-rise Apartment. It seems to be no longer available.
+ {not jobChoosen} [Jobs Section]
    You start skimming the job section and find the following options. 
    ++ (jobs) [▼]
        +++ [Office Worker]
            The office is in one of the downtown high-rise buildings. It's an entry level position focused on entering data and typing up meeting notes. 
            ++++ [▼]
            ----
            The building is close to both a bus stop and a train station. It contains elevators and the job wouldn't require a lot of standing. 
            ++++ [Look At Another Job]
            -> jobs
            ++++ {not apartmentChoosen} [Look At All Listings]
            -> classifieds
            ++++ [Choose Job]
            You pause your search to call about the Office Worker position. It's still available, so you set up a time to drop off your resume and have an interview. 
            ~ jobChoosen = true
            {not apartmentChoosen: -> classifieds}
        +++ [Restaurant Server]
            The restaurant is in one of the more residential districts in the city. Skills required include working the register, bussing tables, taking orders, and serving customers. 
            ++++ [▼]
            ----
            It's close to a train station, but the bus stop is quite a walk. The job itself is on the first floor but will require a lot of standing and moving around. 
            ++++ [Look At Another Job]
            -> jobs
            ++++ {not apartmentChoosen} [Look At All Listings]
            -> classifieds
            ++++ [Choose Job]
            You pause your search to call about the Restaurant Server position. It seems the job has already been filled. 
        +++ [Retail Clerk]
            The retail store is in the heart of the shopping district. It's a fairly upscale boutique that would require a lot of customer interaction, register work, and general cleaning of the store.   
            ++++ [▼]
            ----
            It's close to a bus stop, but the train station is quite a walk. The job would require a lot of standing and some heavy lifting but doesn't seem too stressful otherwise.
            ++++ [Look At Another Job]
            -> jobs
            ++++ {not apartmentChoosen} [Look At All Listings]
            -> classifieds
            ++++ [Choose Job]
            You pause your search to call about the Retail Clerk position. It seems the job has already been filled. 
-
+ [▼]
-
{not jobChoosen and not apartmentChoosen: -> classifieds}
{not jobChoosen and apartmentChoosen: -> jobs}
{jobChoosen and not apartmentChoosen: -> apartments}
After a bit of reading and some phone calls, you have both an apartment showing, and a job interview scheduled. 
+ [▼]
-
You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from making phone calls.
You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from feeling accomplished. 
{UpdateEnergy(-2)}
{UpdateWellness(1)}
+ [▼]
-
Your mother folds up the newspaper and puts it to the side, a smile on her face.
~newspaperCount -= 1
+ [▼]
-
Your father sets a plate of pancakes in front of you, where the newspaper was previously. 
+ [▼]
-
~ conversationActive = true
~ activeNPCID = 1
{ChangeConversationFocus(NPC, "{fatherFirstName}")}
"Sounds like you found a good place, huh {firstName}?"
+ [▼]
-
Instead of waiting for a reply, he continues talking. "Like your mother said, we'll be helping you with the initial costs."
+ [▼]
-
"And I'll drive the moving van to get your stuff to your new home. We really are so proud of you."
+ [Respond]
-
{ChangeConversationFocus(Player, "{fatherFirstName}")}
-
+ ["Thank you so much." {statHints: \\n<size={statSize}>(+1 Relationship)</size>}]
 {ChangeConversationFocus(NPC, "{fatherFirstName}")}
    "Of course, dear. You're very precious to us. Now eat up!"
    ++ [▼]
    Your relationship with your father, {fatherFirstName}, increased by 1. 
    ~ fatherRelationshipWithPlayer += 1
+ ["You better help out. You are my parents, after all." {statHints: \\n<size={statSize}>(-1 Relationship)</size>}]
 {ChangeConversationFocus(NPC, "{fatherFirstName}")}
    "Of course, we'll do what we can. Because we love you, not because it's an expectation. "
    ++ [▼]
    Your relationship with your father, {fatherFirstName}, decreased by 1. 
    ~ fatherRelationshipWithPlayer -= 1
+ [Just start eating with a smile. {statHints: \\n<size={statSize}>(No Change)</size>}]
 {ChangeConversationFocus(NPC, "{fatherFirstName}")}
    "Haha. I bet all those calls were exhausting. Eat up."
-
+ [▼]
- 
~ conversationActive = false
~ activeNPCID = 99
~ location = "Kitchen"
You dig into the pancakes, excited for your new future. 
+ [▼]
- 
You spend the rest of the morning discussing what your new job might be like, what stuff you'll want to bring with you, and overall, how happy you to be hitting this milestone in your life. 
+ [▼]
- 
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from having a long conversation.
{UpdateEnergy(-1)}
+ [▼]
- 
~ time = Midday
~ background = "parentKitchen"
~ locationMusic = "parentKitchen"
By the time it hits the afternoon, you're exhausted and ready for the day to be over. 
+ [▼]
- 
Your parents look concerned but understanding when you say you're going to head to bed early. After all, you have the apartment showing tomorrow and the job interview the day after. Better rest up.
+ [Sleep]
-
{UpdateStatSummary()}
Stat Summary Updated.
+ [▼]
-
- -> movingDay
=== movingDay ===
~ month = "August"
~ monthNumber = 8
~ date = 1
~ today = Saturday
~ yesterday = Friday
~ tomorrow = Sunday
~ time = Morning
~ fullDate = month + " " + date
~ fullDateNumbers = monthNumber + "/" + date
~ location = "Bedroom"
~ background = "bedroomAtParents"
~ locationMusic = "parentKitchen"
~ loadingAnimation = "sleep"
~ startLoadingAnimation = true
~ energy = 7
{ResetStatTracking()}
You slept.
+ [▼]
-
~ startLoadingAnimation = false
It's finally here! The day is finally here! 
+ [▼]
-
It's been a hectic week, so you're starting today with only {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} but it doesn't even matter right now. It's today!
+ [▼]
-
You jump out of bed, and in an uncharacteristically smooth minute manage to take your medicine, brush your teeth, and get dressed. You then rush out to the kitchen. 
+ [▼]
-
You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} getting ready. 
{UpdateEnergy(-2)}
+ [▼]
-
~ background = "parentKitchen"
~ location = "Kitchen"
Once you're in the kitchen, your parents both give you a smile, acknowledging your excitement. 
+ [▼]
-
The rest of the day is spent loading boxes into the moving van, taking careful breaks, and eating snacks. Finally, it's official time to drive to your new place. 
+ [▼]
-
You lost 3 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} packing everything and rushing around. 
{UpdateEnergy(-3)}
+ [▼]
-
{closedCaptions: [door slam]\\n}
With a final glance at your parent's kitchen, you head out the door and begin your new life as an independant adult. 
#doorCloseSFX
+ [Move In]
- -> newPlace
=== newPlace
~ loadingAnimation = "van"
~ startLoadingAnimation = true
~ locationMusic = "van"
You rode in the moving van to your new place. 
+ [▼]
-
~ time = Evening
~ location = "Apartment"
~ background = "apartmentEvening"
~ locationMusic = "apartmentMorning"
~ startLoadingAnimation = false
Upon reaching your new place, your parents insisted on moving everything in themselves and wouldn't let you lift a finger.
+ [▼]
-
By the time evening rolls around, all the additional furniture is set up and ready for use. 
+ [▼]
-
You barely had time to take anything in the last few hours. It all went so fast. 
+ [▼]
-
But now your parents have left (leaving you with some leftover pizza from dinner) and it's just you, alone in your new apartment. 
+ [▼]
-
~ showCalendarButton = true
~ showRentBill = true
~ showElectricBill = true
~ showPhoneBill = true
~ showAnyBills = true
~ toiletriesCount += 17
~ cleaningSuppliesCount += 5
~ medicationCount += 14
Before you forget, you should probably check the calendar your mom gave you for when your bills are due. How exciting! Bills! 
+ [▼]
-
They should also show up in your banking app now, which is how you'll pay them. 
+ [▼]
-
Your paycheck from your new job, which starts on Monday, will be direct deposited so it's a win-win in terms of convenience. 
+ [▼]
-
Your parents also said they would deposit some extra money into your account on their way home, so that should be available tomorrow. 
+ [▼]
-
With that settled you take a moment to check in with yourself. 
+ [▼]
-
You have {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} remaining. Better just brush your teeth and head to bed.
+ [▼]
-
It looks like your parents brought along enough sets of Toiletries to last you about a week. You'll need these to brush your teeth or take showers. How nice of them!
+ [▼]
-
It's basically nighttime anyway. And you can start tomorrow refreshed and ready to finish moving in. 
+ [▼]
-
~ background = "apartmentBathroom"
You take the time to brush your teeth and get ready for bed. 
+ [▼]
-
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} getting ready.
You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from feeling refreshed.
You used up 1 Set of Toiletries brushing your teeth. 
~ toiletriesCount -=1
{UpdateEnergy(-1)}
{UpdateHealth(1)}
{UpdateWellness(1)}
+ [▼]
-
~ background = "apartmentNight"
~ time = Night
~ location = "Apartment"
This is it. Your first night in your new apartment. If you weren't exhausted, you'd be too excited to even lay down. 
+ [Sleep]
-
{UpdateStatSummary()}
Stat Summary Updated.
+ [▼]
-
- -> firstSunday
=== firstSunday ===
{AdvanceWeekday()}
~ date ++
~ time = Morning
~ fullDate = month + " " + date
~ fullDateNumbers = monthNumber + "/" + date
~ energy = RANDOM(7, 9)
~ location = "Apartment"
~ background = "apartmentMorning"
~ locationMusic = "apartmentMorning"
~ money += 150
{AddTransaction("8/2", "Gift", 150, money)}
~ loadingAnimation = "sleep"
~ startLoadingAnimation = true
{ResetStatTracking()}
You slept.
+ [▼]
- 
~ startLoadingAnimation = false
You wake up feeling invigorated, which is kind of a first for you. 
+ [▼]
-
It looks like you have {energy} {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} today. Should be enough to get everything done. 
+ [▼]
-
You push yourself up out of bed and take your medication. Then head to the bathroom to brush your teeth.
+ [▼]
-
You used up one dose of medication. You still have plenty left in your container but you'll want to keep track so you can refill your prescription when you need to. Your parents always used to do it for you, but now you're on your own.  
~ medicationCount -= 1
+ [▼]
-
~ background = "apartmentBathroom"
You brush your teeth, taking your time to really freshen up your mouth. Can't have bad breath on your first real day in your aprtment. 
+ [▼]
-
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from getting ready.
{UpdateEnergy(-1)}
You used up 1 Set of Toiletries brushing your teeth. 
~ toiletriesCount -=1
+ [▼] -> energyCheck ->
-
~ background = "apartmentKitchenMorning"
You head to the kitchen to grab the leftovers from last night and realize that you haven't unpacked anything in your kitchen yet. 
+ [▼]
-
Your parents left you some Cleaning Supplies as well, but the packed dishes should be clean enough already (your mother used a very sanitary packing method) so you can save the supplies for later.
+ [▼]
-
+ [Eat {statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>})</size>}]
    You decide to eat first, using the pizza box as a plate. You're forced to balance it a bit awkward and eat quickly so you don't spill anything. 
    ++ [▼]
    --
    You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating.
	{UpdateHealth(1)}
	You used up your leftovers. 
	++ [▼]
    --
    You should probably put away those dishes now. 
    ++ [Unpack Dishes] -> energyCheck ->
    --
    You take the time to put the dishes away. It feels good to have everything unpacked but you're feeling a bit nauseous from pushing yourself so soon after eating. 
    ++ [▼]
    --
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from exertion. 
    You lost 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from nausea. 
    ~ energy -= 1
    ~ health -= 1
    {UpdateEnergy(-1)}
    {UpdateHealth(-1)}
    ++ [▼] -> energyCheck -> healthCheck ->
    --
+ [Unpack Dishes {statHints: \\n<size={statSize}>(-2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})\\n(+1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
    You decide you should power-through and unpack before having breakfast, otherwise you'll forget to unpack later. 
    ++ [▼]
    --
    You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from exertion. 
    You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from cleaning up. 
    {UpdateEnergy(-2)}
    {UpdateWellness(1)}
    ++ [▼] -> energyCheck ->
    --
    With that done, it's time to eat. You put the pizza on a plate and return to the bedroom area to eat comfortably. 
    ++ [▼]
    --
    ~ background = "apartmentMorning"
    You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from eating.
    You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from enjoying eating in your new place. 
    {UpdateHealth(1)}
    {UpdateWellness(1)}
    ++ [▼]
    --
-
~ background = "apartmentMidday"
~ time = Midday
~ location = "Apartment"
Eating and putting things away managed to take your whole morning, and now it's midday. 
+ [▼]
-
You have two more things you wanted to accomplish today. Shopping so you have something to eat tomorrow before work and taking a shower because you still feel a bit gross from moving everything yesterday. 
+ [▼]
-
Since you don't have to worry about work today, you can probably fit both in just fine. You just have to decide which you'd like to do first. 
+ [▼]
-
+ [Go Shopping] -> firstDayShopping
+ [Shower{statHints: \\n<size={statSize}>(-3 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} / +1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} / +1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
    You decided to take a shower first. You grab your stuff then head into the bathroom for your shower. 
    ++ [▼]
    --
    ~ background = "apartmentBathroom"
    {closedCaptions: [water drops and splashes]\\n}
    The first shower in a new place is always weird, or so you've heard. But this one just felt right. 
    #showerSFX
    ~ background = "apartmentMorning"
    ++ [▼]
    --
    You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from taking a shower.
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} from getting dressed again.
    {UpdateEnergy(-3)}
    You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from having a good shower.
    {UpdateHealth(1)}
    {UpdateWellness(1)}
    You used up one Set of Toiletries taking a shower. 
    ~ toiletriesCount -= 1
    ++ [▼] -> energyCheck ->
    --
    Now that you're refreshed, would you still like to go shopping today? You can always put it off until after work. But then you won't have anything for breakfast.
    ++ [▼]
    --
    ++ [Go Shopping] -> firstDayShopping
    ++ [Skip Shopping]
    --
    ~ background = "apartmentEvening"
    ~ time = Evening
    ~ location = "Apartment"
    If you're not shopping today, you could spend some time decorating, read one of your favorite books, or even just go to bed early (it is already early evening). 
    ++ [▼]
    --
-
+ [Decorate{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})\\n(+2 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
    You spend the rest of the evening decorating your new home. It's a subtle difference, but you feel accomplished. And only a little tired. 
    ++ [▼]
    --
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} decorating.
    You gained 2 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} for feeling accomplished. 
    {UpdateEnergy(-1)}
    {UpdateWellness(2)}
    ++ [▼] -> energyCheck ->
    -- 
    It feels so late already, you should probably head to bed. 
    ++ [▼]
    --
+ [Read{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>})</size>}]
    You spend the rest of the evening reading. It's very relaxing. 
    ++ [▼]
    --
    You gained 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from being relaxed.
    {UpdateWellness(1)}
    ++ [▼]
    --
    You're already cozy in bed, but you'd better actually get ready for bed before you just fall asleep. 
    ++ [▼]
    --
+ [Go to Bed{statHints: \\n<size={statSize}>(+1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>})</size>}]
    You decide to just call it a night. It's better to be well rested for your first day tomorrow. Not that going to bed early means you'll be rested, but you can dream. 
    ++ [▼]
    --
    You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} from resting early.
    {UpdateHealth(1)}
    ++ [▼]
    --
-
~ background = "apartmentBathroom"
You casually get ready for bed, taking your time. 
+ [▼]
-
You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} getting ready.
You gained 1 {coloredText:<color=\#9f4d3a>}Health{coloredText:</color>} and 1 {coloredText:<color=\#7a8f8b>}Wellness{coloredText:</color>} from feeling refreshed. 
{UpdateEnergy(-1)}
{UpdateHealth(1)}
{UpdateWellness(1)}
You used up one Set of Toiletries brushing your teeth. 
~toiletriesCount -= 1
+ [▼]
-
~ background = "apartmentNight"
~ time = Night
~ location = "Apartment"
With a quick stretch, you lay down and drift off. 
+ [Sleep]
- 
{UpdateStatSummary()}
Stat Summary Updated.
+ [▼]
-
-> firstOfficeWorkDay

=== firstDayShopping === 
The Convenience Store is nearby, so you can either wait for the bus or just walk there. 
+ [▼]
-
Walking is free but takes energy. The bus was free when you were a student (and a little while after) but now you'll have to pay bus fare if you want to ride it. 
+ [▼]
-
+ [Walk{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    ~ loadingAnimation = "walking"
    ~ locationMusic = "walking"
    You decide to walk. You leave your apartment and begin the short walk to the store.  
    ++ [▼]
    --
    ~ startLoadingAnimation = true
    You walked. 
    ++ [▼]
    --
    ~ time = Evening
    ~ location = "Store"
    ~ background = "convenienceStoreEveningExterior"
    ~ locationMusic = "exteriorCity"
    ~ startLoadingAnimation = false
    {closedCaptions: [city sounds]\\n}
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} walking.
    {UpdateEnergy(-1)}
    ++ [▼] -> energyCheck ->
    -- 
+[Bus{statHints: \\n<size={statSize}>(-$2.00)</size>}]
    ~loadingAnimation = "bus"
    You decide to travel by bus. You leave your apartment to go wait at the bus stop. 
    ++ [▼]
    --
    ~ startLoadingAnimation = true
    ~ locationMusic = "bus"
    You traveled by bus. 
    ++ [▼]
    --
    ~ money -= 2
    {AddTransaction(fullDateNumbers, "Bus Fare", 2, money)}
    ~ time = Evening
    ~ location = "Store"
    ~ background = "convenienceStoreEveningExterior"
    ~ locationMusic = "exteriorCity"
    ~ startLoadingAnimation = false
    You spent $2.00 on bus fare.
    ++ [▼]
    --
-
~ costBreakfastPrepackagedMeal = 5.00
~ costBreakfastIngredients = 3.00
~ costLunchPrepackagedMeal = 5.00
~ costLunchIngredients = 3.00
~ costDinnerPrepackagedMeal = 5.00
~ costDinnerIngredients = 3.00
~ costToiletries = 2.25
~ costCleaningSupplies = 2.99
~ costNewspaper = 1.79

You've arrived at the convenience store. By the time you got here it's already evening. Time sure flies. 
+ [Go Inside]
You go inside. -> firstInsideStore

= firstInsideStore
~ background = "convenienceStoreEvening"
~ locationMusic = "store"
You see rows and rows of items and a bored cashier at the register. 
+ [▼]
-
+ [Shop]
~ storePrompt = true
~ purchaseResponse = "Please select your items."
-> firstInsideStore

+ [Go Home]
-
{ExitStore()}
You can ride the bus home or walk home. You'll have to pay the fare again, but it might be worth it to not have to walk the whole way with any purchases you've made.

+ [▼]
-
+ [Walk{statHints: \\n<size={statSize}>(-2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    ~ loadingAnimation = "walking"
    ~ locationMusic = "walking"
    You decide to walk. You leave the store and begin the short walk home.  
    ++ [▼]
    --
    ~ startLoadingAnimation = true
    You walked. 
    ++ [▼]
    --
    ~ time = Evening
    ~ location = "Apartment"
    ~ background = "apartmentEvening"
    ~ locationMusic = "apartmentMorning"
    ~ startLoadingAnimation = false
    You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} walking.
    {UpdateEnergy(-2)}
    ++ [▼] -> energyCheck ->
    -- 
+ [Bus{statHints: \\n<size={statSize}>(-$2.00)</size>}]
    ~ loadingAnimation = "bus"
    ~ locationMusic = "bus"
    You decide to travel by bus. You head back to wait at the bus stop. 
    ++ [▼]
    --
    ~startLoadingAnimation = true
    You traveled by bus. 
    ++ [▼]
    --
    ~ money -= 2
    {AddTransaction(fullDateNumbers, "Bus Fare", 2, money)}
    ~ time = Evening
    ~ location = "Apartment"
    ~ background = "apartmentEvening"
    ~ locationMusic = "apartmentMorning"
    ~ startLoadingAnimation = false
    You spent $2.00 on bus fare.
    ++ [▼]
    --
-
By the time you get home you're exhausted. The weight of the whole trip just suddenly hits you. 
+ [▼]
-
You lost 2 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} shopping. 
{UpdateEnergy(-2)}
+ [▼] -> energyCheck ->
-
You should probably just head to bed. You have to be up early for work tomorrow. You barely manage to get ready for bed before laying down. 
+ [▼]
-
You used up one Set of Toiletries brushing your teeth. 
~toiletriesCount -= 1
+ [Sleep]
- 
{UpdateStatSummary()}
Stat Summary Updated.
+ [▼]
-
-> firstOfficeWorkDay