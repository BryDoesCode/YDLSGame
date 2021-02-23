// Includes

INCLUDE CharacterCreation.ink
INCLUDE CoworkerCreation.ink
INCLUDE ParentCreation.ink
INCLUDE Inventory.ink
INCLUDE Apartment.ink
INCLUDE RetailWork.ink
INCLUDE ConvenienceStore.ink
INCLUDE NeedsCheck.ink
INCLUDE Introduction.ink




// External Functions for Unity

EXTERNAL EndGame()
EXTERNAL UpdateNPCs()
EXTERNAL AddTransaction(dateNumber, desc, amount, transactionBalance)

/*--------------------------------------------------------------------------------

	Variables
	
--------------------------------------------------------------------------------*/


// Stat Variables

VAR needMax = 10
VAR energy = 8
VAR health = 6
VAR wellness = 7
VAR borrowedEnergy = 0


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

LIST timeSlots = Morning, Midday, Evening
VAR time = Morning


// Location Variables

VAR location = "New Life"
VAR background = "black"
VAR locationColor = "black"
VAR locationMusic = "startMenu"


// Difficulty Variable

VAR statHints = true


// Apartment / Job Choices
VAR apartmentChoosen = false
VAR jobChoosen = false

// UI Variables

VAR statSize = 42
VAR showInventoryButton = false
VAR showContactsButton = false
VAR showNeedsButton = false
VAR showBankingButton = false
VAR showCalendarButton = false
VAR showSignNameContainer = false
VAR showCharacterCreationContainer = false
VAR characterCreationCompleted = false

VAR showRentBill = false
VAR showElectricBill = false
VAR showPhoneBill = false


// Store Variables

VAR storePrompt = false
VAR purchaseResponse = ""

// Bank Variables
VAR interestRate = 0.01
VAR earnedInterest = 0.0
VAR rentBillDueDate = "5/31" // Due Dates Must Come First
VAR rentBill = 750.00
VAR electricBillDueDate = "5/20" // Due Dates Must Come First
VAR electricBill = 54.23
VAR phoneBillDueDate = "5/25"  // Due Dates Must Come First
VAR phoneBill = 78.25
VAR paycheck = 300.31

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
~ locationColor = "black"
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

~ rentBill = 600.00
~ rentBillDueDate = "8/31"
~ electricBill = 54.23
~ electricBillDueDate = "8/18"
~ phoneBill = 78.25
~ phoneBillDueDate = "8/23"
~ paycheck = 300.31

~ foodIngredientsCount = 0
~ prepackagedMealCount = 0

~ costPrepackagedMeal = 5.00
~ costFoodIngredients = 3.00
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


=== function ResetStats
~ energy = 8
~ health = 6
~ wellness = 7
~ borrowedEnergy = 0

~ month = "May"
~ monthNumber = 5
~ date = 11
~ fullDate = month + " " + date
~ fullDateNumbers = monthNumber + "/" + date
~ today = Tuesday
~ time = Evening
~ location = "Apartment"
~ background = "apartmentMorning"
~ locationColor = "apartmentMorning"
~ locationMusic = "apartmentMorning"

~ foodIngredientsCount = 2
~ prepackagedMealCount = 1
~ money = 50.00
~ storePrompt = false

{GenerateCoworker()}

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
    {date == 11: {PayInterest()}}

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
        - billName == "Phone":
            ~ billAmount = phoneBill
    }
    
    { 
    - billAmount <= money:
        ~ money -= billAmount
        {AddTransaction(fullDateNumbers, billName, -billAmount, money)}
        ~ return true
    - else:
       ~ return false
}

    

=== function EarnPaycheck
    {date == 10: 
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