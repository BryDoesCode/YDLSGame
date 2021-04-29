// Includes

INCLUDE CharacterCreation.ink
INCLUDE CoworkerCreation.ink
INCLUDE ParentCreation.ink
INCLUDE ManagerCreation.ink
INCLUDE Inventory.ink
INCLUDE Apartment.ink
INCLUDE OfficeWork.ink
INCLUDE ConvenienceStore.ink
INCLUDE NeedsCheck.ink
INCLUDE Introduction.ink
INCLUDE FirstWorkDay.ink
INCLUDE SaturdayWithPhoneCall.ink
INCLUDE Hospital.ink

// External Functions for Unity

EXTERNAL EndGame()
EXTERNAL UpdateNPCs()
EXTERNAL AddTransaction(dateNumber, desc, amount, transactionBalance)
EXTERNAL UpdateEnergySummary(start, used)
EXTERNAL UpdateHealthSummary(start, used)
EXTERNAL UpdateWellnessSummary(start, used)
EXTERNAL ShowStatSummary(showBills)


/*--------------------------------------------------------------------------------

	Variables
	
--------------------------------------------------------------------------------*/


// Stat Variables

VAR needMax = 10
VAR energy = 8
VAR health = 6
VAR wellness = 7
VAR borrowedEnergy = 0
VAR energyAtStart = 0
VAR healthAtStart = 0
VAR wellnessAtStart = 0
VAR energyUsedToday = 0
VAR healthUsedToday = 0
VAR wellnessUsedToday = 0


// Date Variables 

VAR month = "July"
VAR monthNumber = 7
VAR date = 7
VAR fullDate = ""
VAR fullDateNumbers = ""


// Day Variables

LIST day = Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
VAR yesterday = Wednesday
VAR today = Thursday
VAR tomorrow = Friday


// Time Variables

LIST timeSlots = Morning, Midday, Evening, Night
VAR time = Morning


// Location Variables

VAR location = "New Life"
VAR background = "black"
VAR locationMusic = "startMenu"


// Difficulty Variable

VAR statHints = true
VAR coloredText = true
VAR closedCaptions = true

// Apartment / Job Choices
VAR apartmentChoosen = false
VAR jobChoosen = false

// UI Variables

VAR statSize = 40
VAR showInventoryButton = false
VAR showContactsButton = false
VAR showNeedsButton = false
VAR showBankingButton = false
VAR showCalendarButton = false
VAR showSignNameContainer = false
VAR showCharacterCreationContainer = false
VAR characterCreationCompleted = false

VAR showEnergySlider = false
VAR showHealthSlider = false
VAR showWellnessSlider = false

VAR showRentBill = false
VAR showElectricBill = false
VAR showPhoneBill = false
VAR showAnyBills = false

// Store Variables

VAR storePrompt = false
VAR purchaseResponse = ""

// Bank Variables
VAR interestRate = 0.01
VAR earnedInterest = 0.0
VAR rentBillDueDate = "5/1" // Due Dates Must Come First
VAR rentBill = 0.0
VAR electricBillDueDate = "5/1" // Due Dates Must Come First
VAR electricBill = 0.0
VAR phoneBillDueDate = "5/1"  // Due Dates Must Come First
VAR phoneBill = 0.0
VAR paycheck = 300.31

VAR phoneBillPaid = false
VAR electricBillPaid = false
VAR rentBillPaid = false

// Conversation Variables
VAR conversationActive = false
VAR activeNPCID = 99
LIST conversationParticipants = Player, NPC
VAR conversationFocus = Player 

// Loading Animations
VAR loadingAnimation = ""
VAR startLoadingAnimation = false

// Other Variables
VAR randomNumber = 0
VAR freeLunch = false
VAR lunchToWork = false
VAR hospitalVisit = false
VAR passedOut = false

// Initialize Unity UI

~ needMax = 10
~ energy = 8
~ health = RANDOM(5, 9)
~ wellness = RANDOM(5, 9)
~ borrowedEnergy = 0

~ fullDate = month + " " + date
~ fullDateNumbers = monthNumber + "/" + date
~ yesterday = Monday
~ today = Tuesday
~ tomorrow = Wednesday
~ time = Evening
~ location = "New Life"
~ background = "black"
~ locationMusic = "startMenu"

~ conversationActive = false

~ money += 10
{AddTransaction("7/3", "Allowance", 10, money)}
~ money -= 2.99
{AddTransaction("7/4", "Store", -2.99, money)}
~ money -= 4.89
{AddTransaction("7/5", "Store", -4.89, money)}
~ earnedInterest = 0.0
~ interestRate = 0.01

~ rentBillDueDate = "8/31"
~ rentBill = 600.00
~ electricBillDueDate = "8/18"
~ electricBill = 54.23
~ phoneBillDueDate = "8/06"
~ phoneBill = 78.25


~ paycheck = 300.31

~ breakfastIngredientsCount = 0
~ breakfastPrepackagedMealCount = 0
~ lunchPrepackagedMealCount = 0
~ lunchIngredientsCount = 0
~ dinnerPrepackagedMealCount = 0
~ dinnerIngredientsCount = 0
~ toiletriesCount = 0
~ cleaningSuppliesCount = 0
~ newspaperCount = 0

~ costBreakfastPrepackagedMeal = 5.00
~ costBreakfastIngredients = 3.00
~ costLunchPrepackagedMeal = 5.00
~ costLunchIngredients = 3.00
~ costDinnerPrepackagedMeal = 5.00
~ costDinnerIngredients = 3.00
~ costToiletries = 2.25
~ costCleaningSupplies = 2.99
~ costNewspaper = 1.79

~ storePrompt = false

~ loadingAnimation = ""
~ startLoadingAnimation = false

~ showInventoryButton = false
~ showContactsButton = false
~ showNeedsButton = false
~ showBankingButton = false
~ showCalendarButton = false
~ showSignNameContainer = false
~ showCharacterCreationContainer = false
~ showEnergySlider = false
~ showHealthSlider = false
~ showWellnessSlider = false

~ showRentBill = false
~ showElectricBill = false
~ showPhoneBill = false



/*--------------------------------------------------------------------------------

	Start the demo!

--------------------------------------------------------------------------------*/

-> introduction

=== oldintroduction ===
Character creation in progress.
+ [▼]
-
You are a recent high school graduate living in a small city apartment. 
You currently work at a clothing boutique. 
+ [▼]
-
You have a chronic illness and hidden disability.
Balance your energy, health, and wellness to make it through the next two days. 
+ [▼]
-
Your life will save after each choice you make. 
There's no redo button, so please think carefully about your decisions.
Are you ready to begin?
+ [Begin]
-
-> morning


/*--------------------------------------------------------------------------------

    Stat Update Functions

--------------------------------------------------------------------------------*/

=== function StatHintToggle(state) 
~ statHints = state

=== function CaptionToggle(state)
~ closedCaptions = state

=== function ColorText(state)
~ coloredText = state

=== function UpdateStatSummary() 
{UpdateEnergySummary(energyAtStart, energyUsedToday)}
{UpdateHealthSummary(healthAtStart, healthUsedToday)}
{UpdateWellnessSummary(wellnessAtStart, wellnessUsedToday)}
{ShowStatSummary(showAnyBills)}

=== function UpdateEnergy(amount)
~ energy += amount
~ energyUsedToday += amount
{
- energy < 0:
~ energy = 0
}

=== function UpdateHealth(amount)
~ health += amount
~ healthUsedToday += amount

=== function UpdateWellness(amount)
~ wellness += amount
~ wellnessUsedToday += amount

=== function ResetStatTracking()
~ energyAtStart = energy
~ healthAtStart = health
~ wellnessAtStart = wellness
~ energyUsedToday = 0
~ healthUsedToday = 0
~ wellnessUsedToday = 0

/*--------------------------------------------------------------------------------

    Time Passage Functions

--------------------------------------------------------------------------------*/

=== function AdvanceWeekday
{ 
    - today == Sunday:
        ~ yesterday ++
        ~ today = Monday
        ~ tomorrow ++
    - today == Saturday:
        ~ yesterday ++
        ~ today ++
        ~ tomorrow = Monday
    - today == Monday:
        ~ yesterday = Monday
        ~ today ++
        ~ tomorrow ++
    - else:
        ~ yesterday ++
        ~ today ++
        ~ tomorrow ++
}

=== function CalculateInterest
    VAR interestCalculation = 0.0
    ~ interestCalculation = money * interestRate
    ~ interestCalculation = interestCalculation * 100
    ~ interestCalculation = FLOOR(interestCalculation)
    ~ interestCalculation = interestCalculation / 100
    ~ earnedInterest = interestCalculation
    {date == 14: {PayInterest()}}

=== function PayInterest
    ~ money += earnedInterest
    {AddTransaction(fullDateNumbers, "Interest", earnedInterest, money)}
    ~ earnedInterest = 0.0

=== function PayBill(billName)
    VAR billAmount = 0.0

    { 
        - billName == "Rent":
            ~ billAmount = rentBill
        - billName == "Electric":
            ~ billAmount = electricBill
            ~ billName = "Electric Bill"
        - billName == "Phone":
            ~ billAmount = phoneBill
            ~ billName = "Phone Bill"
    }
    
    { 
        - billAmount <= money:
            ~ money -= billAmount
            {AddTransaction(fullDateNumbers, billName, -billAmount, money)}
            { 
                - billName == "Rent":
                    ~ rentBillPaid = true
                - billName == "Electric":
                    ~ electricBillPaid = true
                - billName == "Phone":
                    ~ phoneBillPaid = true
            }
            ~ return true
        - else:
           ~ return false
    }

    

=== function EarnPaycheck
    {
        - date == 13: 
            ~ money += paycheck
            {AddTransaction(fullDateNumbers, "Paycheck", paycheck, money)}
        - date == 20: 
            ~ money += paycheck
            {AddTransaction(fullDateNumbers, "Paycheck", paycheck, money)}
        - date == 27:
            ~ money += paycheck
            {AddTransaction(fullDateNumbers, "Paycheck", paycheck, money)}
    }


/*--------------------------------------------------------------------------------

    Conversation Functions

--------------------------------------------------------------------------------*/

=== function ChangeConversationFocus (Focus, NPCName)
{ 
    - Focus == Player:
        ~ location = "{firstName}"
        ~ conversationFocus = Player
    - Focus == NPC:
        ~ location = NPCName
        ~ conversationFocus = NPC
    - else:
        ~ location = "Conversation Error"
        
}

/*--------------------------------------------------------------------------------

	Fallback External Functions

--------------------------------------------------------------------------------*/


=== function EndGame()
~ return

=== function UpdateNPCs()
~ return

=== function AddTransaction(dateNumber, desc, amount, transactionBalance)
~ return

=== function UpdateEnergySummary(start, used)
~return

=== function UpdateHealthSummary(start, used)
~return

=== function UpdateWellnessSummary(start, used)
~return

=== function ShowStatSummary(showBills)
~return