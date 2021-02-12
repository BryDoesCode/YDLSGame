=== store ===
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
+ [Go Inside]
You go inside. -> insideStore

+ [Go Home]
-> endofday

= insideStore
~ background = "convenienceStoreEvening"
~ locationColor = "convenienceStoreEvening"
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


=== function PurchaseItems(prepackagedCount, ingredientsCount, newspaperpurchaseCount)
{
    - prepackagedCount < 0:
        ~ purchaseResponse = "You can't buy negative of an item. Try again."
        ~ return false
    - ingredientsCount < 0:
        ~ purchaseResponse = "You can't buy negative of an item. Try again."
        ~ return false
    - newspaperpurchaseCount < 0:
        ~ purchaseResponse = "You can't buy negative of an item. Try again."
        ~ return false
    - newspaperpurchaseCount == 0 and prepackagedCount == 0 and ingredientsCount == 0:
        ~ purchaseResponse = "You didn't select anything to purchase. Try again."
        ~ return false
}


~ temp totalCost = (prepackagedCount * costPrepackagedMeal) + (ingredientsCount * costFoodIngredients) + (newspaperpurchaseCount * costNewspaper)

{ 
    - totalCost <= money:
        ~ prepackagedMealCount += prepackagedCount
        ~ foodIngredientsCount += ingredientsCount
        ~ newspaperCount += newspaperpurchaseCount
        ~ money -= totalCost

        ~ purchaseResponse = "Purchase Successful!"
        {AddTransaction(fullDateNumbers, "Store", -totalCost, money)}
        ~ return true
      
        
    - else:
        ~purchaseResponse = "You don't have enough money to buy everything. You should check your balance using the Banking App."
       ~ return false
}