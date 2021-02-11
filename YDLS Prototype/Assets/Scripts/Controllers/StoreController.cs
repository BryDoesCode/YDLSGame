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
    public TextMeshProUGUI prepackagedPriceLabel;
    public TMP_InputField prepackagedQuantity;

    public TextMeshProUGUI ingredientsPriceLabel;
    public TMP_InputField ingredientsQuantity;

    public TextMeshProUGUI newspaperPriceLabel;
    public TMP_InputField newspaperQuantity;

    public TextMeshProUGUI calculatedCosts;
    public TextMeshProUGUI purchaseResponseText;

    private float ingredientsPrice = 3;
    private float prepackedPrice = 5;
    private float newspaperPrice = 1.79f;

    private bool muteSFX;

    void Start()
    {
        calculatedCosts.text = "Total Cost: $0";
        muteSFX = true;
    }

    public void PurchaseItems()
    {

        int ingredientsQuantityInt = Int32.Parse(ingredientsQuantity.text);

        int prepackagedQuantityInt = Int32.Parse(prepackagedQuantity.text);

        int newspaperQuantityInt = Int32.Parse(newspaperQuantity.text);


        if (GameController.CallInkPurchaseFunction(prepackagedQuantityInt, ingredientsQuantityInt, newspaperQuantityInt))
        {
            ingredientsQuantity.text = "0";
            prepackagedQuantity.text = "0";
            newspaperQuantity.text = "0";
            calculatedCosts.text = "Total Cost: $0";
            SFXController.PlayRegisterDing();
        }

    }

    public void CalculateCost()
    {
        int ingredientsQuantityInt = Int32.Parse(ingredientsQuantity.text);
        int prepackagedQuantityInt = Int32.Parse(prepackagedQuantity.text);
        int newspaperQuantityInt = Int32.Parse(newspaperQuantity.text);

        SFXController.PlayButtonClick();

        calculatedCosts.text = "Total Cost: $" + ((ingredientsQuantityInt * ingredientsPrice) + (prepackagedQuantityInt * prepackedPrice) + 
            (newspaperQuantityInt * newspaperPrice));
    }

    public void UpdatePrices(string itemType, object itemPrice)
    {
             switch(itemType)
        {
            case "costPrepackagedMeal":
                prepackedPrice = float.Parse(itemPrice.ToString());
                prepackagedPriceLabel.text = "$" + prepackedPrice;
                break;
            case "costFoodIngredients":
                ingredientsPrice = float.Parse(itemPrice.ToString());
                ingredientsPriceLabel.text = "$" + ingredientsPrice;
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
