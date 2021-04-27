using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using System;

public class StoreController : MonoBehaviour
{
    [Header("Game Controllers")]
    public GameController GameController;
    public SFXController SFXController;
    public GameObject storeContainer;

    [Header("Item Containers")]
    public GameObject newspaperContainer;

    [Header("Item Info")]

    public TextMeshProUGUI breakfastIngredientsPriceLabel;
    public TextMeshProUGUI breakfastIngredientsQuantity;

    public TextMeshProUGUI breakfastPrepackagedPriceLabel;
    public TextMeshProUGUI breakfastPrepackagedQuantity;

    public TextMeshProUGUI lunchIngredientsPriceLabel;
    public TextMeshProUGUI lunchIngredientsQuantity;

    public TextMeshProUGUI lunchPrepackagedPriceLabel;
    public TextMeshProUGUI lunchPrepackagedQuantity;

    public TextMeshProUGUI dinnerIngredientsPriceLabel;
    public TextMeshProUGUI dinnerIngredientsQuantity;

    public TextMeshProUGUI dinnerPrepackagedPriceLabel;
    public TextMeshProUGUI dinnerPrepackagedQuantity;

    public TextMeshProUGUI toiletriesPriceLabel;
    public TextMeshProUGUI toiletriesQuantity;

    public TextMeshProUGUI cleaningSuppliesPriceLabel;
    public TextMeshProUGUI cleaningSuppliesQuantity;

    public TextMeshProUGUI newspaperPriceLabel;
    public TextMeshProUGUI newspaperQuantity;

    public TextMeshProUGUI calculatedCosts;
    public TextMeshProUGUI purchaseResponseText;


    private float breakfastIngredientsPrice = 3;
    private float breakfastPrepackedPrice = 5;
    private float lunchIngredientsPrice = 3;
    private float lunchPrepackedPrice = 5;
    private float dinnerIngredientsPrice = 3;
    private float dinnerPrepackedPrice = 5;
    private float toiletriesPrice = 1.25f;
    private float cleaningSuppliesPrice = 2.99f;
    private float newspaperPrice = 1.79f;


    private int breakfastIngredientsQuantityInt;
    private int breakfastPrepackagedQuantityInt;
    private int lunchIngredientsQuantityInt;
    private int lunchPrepackagedQuantityInt;
    private int dinnerIngredientsQuantityInt;
    private int dinnerPrepackagedQuantityInt;
    private int toiletriesQuantityInt;
    private int cleaningSuppliesQuantityInt;
    private int newspaperQuantityInt;


    private bool muteSFX;

    void Start()
    {
        calculatedCosts.text = "Total: $0";
        muteSFX = true;
    }

    public void OnClickIncreaseQuantity(int index)
    {
        SFXController.PlayButtonClick();
        switch (index)
        {
            case 0:
                if ((breakfastIngredientsQuantityInt + 1) < 100)
                {
                    breakfastIngredientsQuantityInt += 1;
                    breakfastIngredientsQuantity.text = breakfastIngredientsQuantityInt.ToString();
                }
                break;
            case 1:
                if ((breakfastPrepackagedQuantityInt + 1) < 100)
                {
                    breakfastPrepackagedQuantityInt += 1;
                    breakfastPrepackagedQuantity.text = breakfastPrepackagedQuantityInt.ToString();
                }
                break;
            case 2:
                if ((lunchIngredientsQuantityInt + 1) < 100)
                {
                    lunchIngredientsQuantityInt += 1;
                    lunchIngredientsQuantity.text = lunchIngredientsQuantityInt.ToString();
                }
                break;
            case 3:
                if ((lunchPrepackagedQuantityInt + 1) < 100)
                {
                    lunchPrepackagedQuantityInt += 1;
                    lunchPrepackagedQuantity.text = lunchPrepackagedQuantityInt.ToString();
                }
                break;
            case 4:
                if ((dinnerIngredientsQuantityInt + 1) < 100)
                {
                    dinnerIngredientsQuantityInt += 1;
                    dinnerIngredientsQuantity.text = dinnerIngredientsQuantityInt.ToString();
                }
                break;
            case 5:
                if ((dinnerPrepackagedQuantityInt + 1) < 100)
                {
                    dinnerPrepackagedQuantityInt += 1;
                    dinnerPrepackagedQuantity.text = dinnerPrepackagedQuantityInt.ToString();
                }
                break;
            case 6:
                if ((toiletriesQuantityInt + 1) < 100)
                {
                    toiletriesQuantityInt += 1;
                    toiletriesQuantity.text = toiletriesQuantityInt.ToString();
                }
                break;
            case 7:
                if ((cleaningSuppliesQuantityInt + 1) < 100)
                {
                    cleaningSuppliesQuantityInt += 1;
                    cleaningSuppliesQuantity.text = cleaningSuppliesQuantityInt.ToString();
                }
                break;
            case 8:
                if ((newspaperQuantityInt + 1) < 100)
                {
                    newspaperQuantityInt += 1;
                    newspaperQuantity.text = newspaperQuantityInt.ToString();
                }
                break;
            default:
                Debug.Log("Unknown Increase Quantity Index: " + index);
                break;
        }
        CalculateCost();
    }
    public void OnClickDecreaseQuantity(int index)
    {
        SFXController.PlayButtonClick();
        switch (index)
        {
            case 0:
                if ((breakfastIngredientsQuantityInt - 1) > -1)
                {
                    breakfastIngredientsQuantityInt -= 1;
                    breakfastIngredientsQuantity.text = breakfastIngredientsQuantityInt.ToString();
                }
                break;
            case 1:
                if ((breakfastPrepackagedQuantityInt - 1) > -1)
                {
                    breakfastPrepackagedQuantityInt -= 1;
                    breakfastPrepackagedQuantity.text = breakfastPrepackagedQuantityInt.ToString();
                }
                break;
            case 2:
                if ((lunchIngredientsQuantityInt - 1) > -1)
                {
                    lunchIngredientsQuantityInt -= 1;
                    lunchIngredientsQuantity.text = lunchIngredientsQuantityInt.ToString();
                }
                break;
            case 3:
                if ((lunchPrepackagedQuantityInt - 1) > -1)
                {
                    lunchPrepackagedQuantityInt -= 1;
                    lunchPrepackagedQuantity.text = lunchPrepackagedQuantityInt.ToString();
                }
                break;
            case 4:
                if ((dinnerIngredientsQuantityInt - 1) > -1)
                {
                    dinnerIngredientsQuantityInt -= 1;
                    dinnerIngredientsQuantity.text = dinnerIngredientsQuantityInt.ToString();
                }
                break;
            case 5:
                if ((dinnerPrepackagedQuantityInt - 1) > -1)
                {
                    dinnerPrepackagedQuantityInt -= 1;
                    dinnerPrepackagedQuantity.text = dinnerPrepackagedQuantityInt.ToString();
                }
                break;
            case 6:
                if ((toiletriesQuantityInt - 1) > -1)
                {
                    toiletriesQuantityInt -= 1;
                    toiletriesQuantity.text = toiletriesQuantityInt.ToString();
                }
                break;
            case 7:
                if ((cleaningSuppliesQuantityInt - 1) > -1)
                {
                    cleaningSuppliesQuantityInt -= 1;
                    cleaningSuppliesQuantity.text = cleaningSuppliesQuantityInt.ToString();
                }
                break;
            case 8:
                if ((newspaperQuantityInt - 1) > -1)
                {
                    newspaperQuantityInt -= 1;
                    newspaperQuantity.text = newspaperQuantityInt.ToString();
                }
                break;
            default:
                Debug.Log("Unknown Decrease Quantity Index: " + index);
                break;
        }

        CalculateCost();
    }

    public void PurchaseItems()
    {
 
        if (GameController.CallInkPurchaseFunction(breakfastPrepackagedQuantityInt, breakfastIngredientsQuantityInt, 
            lunchPrepackagedQuantityInt, lunchIngredientsQuantityInt,
            dinnerPrepackagedQuantityInt, dinnerIngredientsQuantityInt,
            toiletriesQuantityInt, cleaningSuppliesQuantityInt, newspaperQuantityInt))
        {
            breakfastIngredientsQuantity.text = "0";
            breakfastPrepackagedQuantity.text = "0";
            lunchIngredientsQuantity.text = "0";
            lunchPrepackagedQuantity.text = "0";
            dinnerIngredientsQuantity.text = "0";
            dinnerPrepackagedQuantity.text = "0";
            toiletriesQuantity.text = "0";
            cleaningSuppliesQuantity.text = "0";
            newspaperQuantity.text = "0";

            calculatedCosts.text = "Total: $0";
            SFXController.PlayRegisterDing();
        }

    }

    public void CalculateCost()
    {
        calculatedCosts.text = "Total: $" + ((breakfastIngredientsQuantityInt * breakfastIngredientsPrice) + (breakfastPrepackagedQuantityInt * breakfastPrepackedPrice) +
            (lunchIngredientsQuantityInt * lunchIngredientsPrice) + (lunchPrepackagedQuantityInt * lunchPrepackedPrice) +
            (dinnerIngredientsQuantityInt * dinnerIngredientsPrice) + (dinnerPrepackagedQuantityInt * dinnerPrepackedPrice) +
            (toiletriesQuantityInt * toiletriesPrice) + (cleaningSuppliesQuantityInt * cleaningSuppliesPrice) +
            (newspaperQuantityInt * newspaperPrice));
    }

    public void UpdatePrices(string itemType, object itemPrice)
    {
             switch(itemType)
        {
            case "costBreakfastPrepackagedMeal":
                breakfastPrepackedPrice = float.Parse(itemPrice.ToString());
                breakfastPrepackagedPriceLabel.text = "$" + breakfastPrepackedPrice;
                break;
            case "costBreakfastIngredients":
                breakfastIngredientsPrice = float.Parse(itemPrice.ToString());
                breakfastIngredientsPriceLabel.text = "$" + breakfastIngredientsPrice;
                break;
            case "costLunchPrepackagedMeal":
                lunchPrepackedPrice = float.Parse(itemPrice.ToString());
                lunchPrepackagedPriceLabel.text = "$" + lunchPrepackedPrice;
                break;
            case "costLunchIngredients":
                lunchIngredientsPrice = float.Parse(itemPrice.ToString());
                lunchIngredientsPriceLabel.text = "$" + lunchIngredientsPrice;
                break;
            case "costDinnerPrepackagedMeal":
                dinnerPrepackedPrice = float.Parse(itemPrice.ToString());
                dinnerPrepackagedPriceLabel.text = "$" + dinnerPrepackedPrice;
                break;
            case "costDinnerIngredients":
                dinnerIngredientsPrice = float.Parse(itemPrice.ToString());
                dinnerIngredientsPriceLabel.text = "$" + dinnerIngredientsPrice;
                break;
            case "costToiletries":
                toiletriesPrice = float.Parse(itemPrice.ToString());
                toiletriesPriceLabel.text = "$" + toiletriesPrice;
                break;
            case "costCleaningSupplies":
                cleaningSuppliesPrice = float.Parse(itemPrice.ToString());
                cleaningSuppliesPriceLabel.text = "$" + cleaningSuppliesPrice;
                break;
            case "costNewspaper":
                newspaperPrice = float.Parse(itemPrice.ToString());
                newspaperPriceLabel.text = "$" + newspaperPrice;
                break;
            default:
                Debug.Log("Unrecognized Store Item: " + itemType);
                break;
        }
    }

    public void UpdatePurchaseResponse(string text)
    {
        purchaseResponseText.text = text;
    }


    public void CloseStore()
    {
        storeContainer.SetActive(false);
        GameController.CallInkFunction("ExitStore");
        if (!muteSFX)
        {
            SFXController.PlayButtonClick();
        }
    }

    public void OpenStore()
    {
        storeContainer.SetActive(true);
    }

    public void StoreState(int state)
    {
        if (state == 1)
        {
            OpenStore();
        }
        else
        {
            CloseStore();
        }
    }
    public void MuteSFX(bool condition)
    {
        muteSFX = condition;
    }
}
