=== introduction ===
~ time = Midday
~ fullDate = month + " " + date
~ fullDateNumbers = monthNumber + "/" + date
~ energy = 5
~ health = 6
~ wellness = 6
~ location = "Kitchen"
~ background = "parentKitchen"
~ locationColor = "parentKitchen"
~ locationMusic = "parentKitchen"

#knockingSFX
There's a knock on the door. You're the only one home right now. 
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
#writingSFX
With a quick, "Thank you!" they hand over a large, thin envelope and return to their car. You close the door and return to the kitchen.
+ [▼]
-
You open the package at the kitchen table and stare in awe at the final piece of the puzzle: your high school diploma. 
+ [▼]
-
Congratulations! You did it. You're officially an adult. At least, according to your parents' logic. 
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
That's better. You feel ready to head out into the world. Or, at least, to go to the local convenience store to grab a newspaper. 
{GenerateMother()}
{GenerateFather()}
{GenerateCoworker()}
{UpdateNPCs()}
+ [▼]
-
It's a bit old fashion, but you heard the best place to find apartments and jobs in the nearby city was in the newspaper classifieds. 
+ [▼]
-
Just as you're about to leave, you pause for a second to check-in with yourself. When you're excited, it's easy to lose track of how you're actually feeling. 
+ [▼]
-
~ showNeedsButton = true
Your current Energy is {energy}. 
Your current Health is {health}.
Your current Wellness is {wellness}.
+ [▼]
-
You can check-in with yourself at any time by viewing the Needs app in the menu. Or looking at the numbers in the top-right corner of the screen. 
+ [▼]
-
You're not feeling the best, but you should have enough energy to make it to the store and back. 
+ [▼]
-
You lock the door behind you and make your way to the local bus stop. 
#doorCloseSFX
+ [Ride Bus]
-
-> introductionConvenienceStore


=== introductionConvenienceStore ===
~loadingAnimation = "bus"
~startLoadingAnimation = true
You traveled by bus.
+ [▼]
-
~ location = "Store"
~ background = "convenienceStoreEveningExterior"
~ time = Evening
~ locationColor = "convenienceStoreEveningExterior"
~ locationMusic = "exteriorCity"
~ startLoadingAnimation = false

~ costPrepackagedMeal = 5.00
~ costFoodIngredients = 3.00
~ costNewspaper = 1.79

You've arrived at the convenience store.
+ [▼]
-
You lost 1 Energy from riding the bus. 
~ energy -= 1
+ [Go Inside]
-
-> introductionInsideStore
= introductionInsideStore
~ background = "convenienceStoreEvening"
~ locationColor = "convenienceStoreEvening"
~ locationMusic = "store"

You see rows and rows of items and a bored cashier at the register.
+ [▼]
-
Before you buy anything, you should probably check how much money you have in your bank account.
+ [▼]
-
~ showBankingButton = true
You can view your banking app in the menu. It keeps track of your expenses and has a bill-pay option. Not that you have bills, yet. 
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

~loadingAnimation = "bus"
~startLoadingAnimation = true
~ locationMusic = "rain"
You traveled by bus.
+ [▼]
-
~ startLoadingAnimation = false
~ time = Evening
~ location = "Kitchen"
~ background = "parentKitchen"
~ locationColor = "parentKitchen"
~ locationMusic = "parentKitchen"
By the time you make it home, you're exhausted. The bus was late, and it started to rain while you waited. Because of course it started to rain.
+ [▼]
-
You lost 1 Energy from standing while waiting.
You lost 1 Energy from riding the bus. 
You lost 1 Health from getting soaked. 
~ energy -= 2
~ health -= 1
+ [▼]
-
You managed to protect the newspaper from getting soaked, somehow. You set it down on the kitchen table, next to your diploma. 
+ [▼]
-
You only have {energy} Energy left. Looking for your first apartment and first job will have to wait until tomorrow. 
+ [▼]
-
You use your remaining Energy to get out of the wet clothes and get ready for bed. 
+ [Sleep]
-
-> introductionDayTwo

=== introductionDayTwo ===
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
~ energy = 6
~ location = "Bedroom"
~ background = "black"
~ locationColor = "black"
~ locationMusic = "parentKitchen"
~ startLoadingAnimation = false
You wake up feeling a little sore, but it could be worse.
+ [▼]
-
The light from your window is too strong at the moment, so you keep your eyes squeezed shut.
You seem to have {energy} Energy today, better make it count. 
+ [▼]
-
Speaking of your energy level, the events of yesterday flood back into your mind just as the smell of pancakes floods into your nose.
+ [▼]
-
After grabbing your medication, you take an extra minute to brush your teeth before letting your sense of smell guide you to the kitchen.
+ [▼]
-
You lose 1 Energy from brushing your teeth. 
~energy -= 1
+ [▼]
-
~ location = "Kitchen"
~ background = "parentKitchen"
~ locationColor = "parentKitchen"
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

~showContactsButton = true
You can view your relationships with people and other information about them in your Contacts app.
~ conversationActive = false
~ activeNPCID = -1
~ location = "Kitchen"
+ [▼]
- 
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
    ++ [▼]
        +++ [Basic City Apartment]
            The Basic City Apartment is located just inside the city limits in an older building. It's a bit rundown but the rent is only $600 a month. It comes already furnished.
            ++++ [▼]
            It's also close to the bus stop, and the convenience store you visited for the paper yesterday. The train station takes a bit of a walk, though. 
        +++ [Suburban Apartment]
            The Suburban Apartment is outside the city limits, in an affordable neighborhood. It's quite cute. The rent is $900 a month. It comes already furnished.
            ++++ [▼]
            It's close to the bus stop, but the train station is quite a walk. No stores are nearby.
        +++ [High-rise Apartment]
            The High-rise Apartment is right in downtown, in one of the smaller high-rise buildings. It's as fancy as can get but is $1200 a month. It comes already furnished.
            ++++ [▼]
            It's close to both a bus stop and a train station. You can also walk to most city jobs.
    --
    ++ [▼]
    --
    ++ [Look At Another Listing]
        -> classifieds
    ++ [Choose Apartment]
        +++ [Basic City Apartment]
            You pause your search to call about the Basic City Apartment. It's still available, so you set up a time to look at it. 
            ~ apartmentChoosen = true
        +++ [Suburban Apartment]
            You pause your search to call about the Suburban Apartment. It seems to be no longer available. 
        +++ [High-rise Apartment]
            You pause your search to call about the High-rise Apartment. It seems to be no longer available.     
+ {not jobChoosen} [Jobs Section]
    You start skimming the job section and find the following options. 
    ++ [▼]
        +++ [Office Worker]
            The office is in one of the downtown high-rise buildings. It's an entry level position focused on entering data and typing up meeting notes. 
            ++++ [▼]
            The building is close to both a bus stop and a train station. It contains elevators and the job wouldn't require a lot of standing. 
        +++ [Restaurant Server]
            The restaurant is in one of the more residential districts in the city. Skills required include working the register, bussing tables, taking orders, and serving customers. 
            ++++ [▼]
            It's close to a train station, but the bus stop is quite a walk. The job itself is on the first floor but will require a lot of standing and moving around. 
        +++ [Retail Clerk]
            The retail store is in the heart of the shopping district. It's a fairly upscale boutique that would require a lot of customer interaction, register work, and general cleaning of the store.   
            ++++ [▼]
            It's close to a bus stop, but the train station is quite a walk. The job would require a lot of standing and some heavy lifting but doesn't seem too stressful otherwise. 
    --
    ++ [▼]
    --
    ++ [Look At Another Listing]
        -> classifieds
    ++ [Choose Job]
        +++ [Office Worker]
            You pause your search to call about the Office Worker position. It seems the job has already been filled. 
        +++ [Restaurant Server]
            You pause your search to call about the Restaurant Server position. It seems the job has already been filled. 
        +++ [Retail Clerk]
            You pause your search to call about the Retail Clerk position. It's still available, so you set up a time to drop off your resume and have an interview. 
            ~ jobChoosen = true
-
+ [▼]
-
{not jobChoosen or not apartmentChoosen: -> classifieds}
After a bit of reading and some phone calls, you have both an apartment showing, and a job interview scheduled. 
+ [▼]
-
You lost 2 Energy from making phone calls.
You gained 1 Wellness from feeling accomplished. 
~energy -= 2
~wellness += 1
+ [▼]
-
Your mother folds up the newspaper and puts it to the side, a smile on her face. 
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
Instead of waiting for a reply, he continues talking. "Like your mother said, we'll be helping you with the initial costs. And I'll drive the moving van to get your stuff to your new home. We really are so proud of you."
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
~ activeNPCID = -1
~ location = "Kitchen"
You dig into the pancakes, excited for your new future. 
+ [▼]
- 
You spend the rest of the morning discussing what your new job might be like, what stuff you'll want to bring with you, and overall, how happy you to be hitting this milestone in your life. 
+ [▼]
- 
You lost 1 Energy from having a long conversation.
~energy -= 1
+ [▼]
- 
~ time = Midday
~ background = "parentKitchen"
~ locationColor = "parentKitchen"
~ locationMusic = "parentKitchen"
By the time it hits the afternoon, you're exhausted and ready for the day to be over. 
+ [▼]
- 
Your parents look concerned but understanding when you say you're going to head to bed early. After all, you have the apartment showing tomorrow and the job interview the day after. Better rest up. 
+ [Sleep]
- 
(Continuing beyond this point brings you to our previous prototype cycle and breaks story continuity. You have been warned, but are also highly encouraged to explore the story.)
~ showCalendarButton = true
~ showRentBill = true
~ showElectricBill = true
~ showPhoneBill = true
+ [▼]
-
-> morning