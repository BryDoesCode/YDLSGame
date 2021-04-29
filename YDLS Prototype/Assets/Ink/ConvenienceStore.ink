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

+ [Go Home]



-> endofday

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

+ [Go Home]
{ExitStore()}
-> endofday

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