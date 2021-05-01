=== store ===
~ costBreakfastPrepackagedMeal = 5.00
~ costBreakfastIngredients = 3.00
~ costLunchPrepackagedMeal = 5.00
~ costLunchIngredients = 3.00
~ costDinnerPrepackagedMeal = 5.00
~ costDinnerIngredients = 3.00
~ costToiletries = 2.25
~ costCleaningSupplies = 2.99
~ costNewspaper = 1.79
You've arrived at the convenience store.
+ [▼]
-
+ [Go Inside]
You go inside. -> insideStore
+ [Go Home] -> goHome

= insideStore
~ background = "convenienceStoreEvening"
~ locationMusic = "store"

You see rows and rows of items and a bored cashier at the register. 
+ [▼]
-
+ [Shop]
~ storePrompt = true
~ purchaseResponse = "Please select your items."
-> insideStore

+ (goHome) [Go Home]
-
{ExitStore()}
You can ride the bus home or walk home. You'll have to pay the fare again, but it might be worth it to not have to walk the whole way with any purchases you've made.

+ [▼]
-
+ (storeWalkHome) [Walk{statHints: \\n<size={statSize}>(-1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>})</size>}]
    You leave the store and begin the short walk home.  
    ++ [▼]
    --
    ~ loadingAnimation = "walking"
    ~ locationMusic = "walking"
    ~ startLoadingAnimation = true
    You walked. 
    ++ [▼]
    --
    ~ time = Evening
    ~ location = "Apartment"
    ~ background = "apartmentEvening"
    ~ locationMusic = "apartmentMorning"
    ~ startLoadingAnimation = false
    You lost 1 {coloredText:<color=\#89a15c>}Energy{coloredText:</color>} walking.
    {UpdateEnergy(-1)}
    ++ [▼] -> energyCheck ->
    -- 
+ [Bus{statHints: \\n<size={statSize}>(-$2.00)</size>}]
{money - 2.00 < 0.01: Oops, looks like you don't have enough money to ride the bus. Guess you're walking. -> storeWalkHome}
    You decide to travel by bus. You head back to wait at the bus stop. 
    ++ [▼]
    --
    ~ loadingAnimation = "bus"
    ~ locationMusic = "bus"
    ~ startLoadingAnimation = true
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
- -> endofday

=== function ExitStore
~ storePrompt = false


=== function PurchaseItems(breakfastPrepackagedPurchaseCount, breakfastIngredientsPurchaseCount, lunchPrepackagedPurchaseCount, lunchIngredientsPurchaseCount, dinnerPrepackagedPurchaseCount, dinnerIngredientsPurchaseCount, toiletriesPurchaseCount, cleaningSuppliesPurchaseCount, newspaperPurchaseCount)
{
    - breakfastPrepackagedPurchaseCount < 0:
        ~ purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You can't buy negative of an item. Try again."
        ~ return false
    - breakfastIngredientsPurchaseCount < 0:
        ~ purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You can't buy negative of an item. Try again."
        ~ return false
    - lunchPrepackagedPurchaseCount < 0:
        ~ purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You can't buy negative of an item. Try again."
        ~ return false
    - lunchIngredientsPurchaseCount < 0:
        ~ purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You can't buy negative of an item. Try again."
        ~ return false
    - dinnerPrepackagedPurchaseCount < 0:
        ~ purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You can't buy negative of an item. Try again."
        ~ return false
    - dinnerIngredientsPurchaseCount < 0:
        ~ purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You can't buy negative of an item. Try again."
        ~ return false
    - toiletriesPurchaseCount < 0:
        ~ purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You can't buy negative of an item. Try again."
        ~ return false
    - cleaningSuppliesPurchaseCount < 0:
        ~ purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You can't buy negative of an item. Try again."
        ~ return false
    - newspaperPurchaseCount < 0:
        ~ purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You can't buy negative of an item. Try again."
        ~ return false
    - newspaperPurchaseCount == 0 and breakfastPrepackagedPurchaseCount == 0 and breakfastIngredientsPurchaseCount == 0 and lunchPrepackagedPurchaseCount == 0 and lunchIngredientsPurchaseCount == 0 and dinnerPrepackagedPurchaseCount == 0 and dinnerIngredientsPurchaseCount == 0 and cleaningSuppliesPurchaseCount == 0 and toiletriesPurchaseCount == 0:
        ~ purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You didn't select anything to purchase. Try again."
        ~ return false
}


~ temp totalCost = (breakfastIngredientsPurchaseCount * costBreakfastIngredients) + (breakfastPrepackagedPurchaseCount * costBreakfastPrepackagedMeal) + (lunchIngredientsPurchaseCount * costLunchIngredients) + (lunchPrepackagedPurchaseCount * costLunchPrepackagedMeal) + (dinnerIngredientsPurchaseCount * costDinnerIngredients) + (dinnerPrepackagedPurchaseCount * costDinnerPrepackagedMeal) + (toiletriesPurchaseCount * costToiletries) + (cleaningSuppliesPurchaseCount * costCleaningSupplies) + (newspaperPurchaseCount * costNewspaper)

{ 
    - totalCost <= money:
        ~ breakfastIngredientsCount += breakfastIngredientsPurchaseCount
        ~ breakfastPrepackagedMealCount += breakfastPrepackagedPurchaseCount
        ~ lunchIngredientsCount += lunchIngredientsPurchaseCount
        ~ lunchPrepackagedMealCount += lunchPrepackagedPurchaseCount
        ~ dinnerIngredientsCount += dinnerIngredientsPurchaseCount
        ~ dinnerPrepackagedMealCount += dinnerPrepackagedPurchaseCount
        ~ toiletriesCount += toiletriesPurchaseCount
        ~ cleaningSuppliesCount += cleaningSuppliesPurchaseCount
        ~ newspaperCount += newspaperPurchaseCount
        ~ money -= totalCost

        ~ purchaseResponse = "{closedCaptions: [register ding]\\n\\n}Purchase Successful!"
        {AddTransaction(fullDateNumbers, "Store", -totalCost, money)}
        ~ return true
        
    - else:
        ~purchaseResponse = "{closedCaptions: [error chime]\\n\\n}You don't have enough money to buy what you have selected."
       ~ return false
}