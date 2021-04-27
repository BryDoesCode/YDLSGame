using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class InventoryController : MonoBehaviour
{
    [Header("Prepackaged Meals")]
    public GameObject breakfastPrepackagedMealContainer;
    public TextMeshProUGUI breakfastPrepackagedMealQuantityText;
    public GameObject lunchPrepackagedMealContainer;
    public TextMeshProUGUI lunchPrepackagedMealQuantityText;
    public GameObject dinnerPrepackagedMealContainer;
    public TextMeshProUGUI dinnerPrepackagedMealQuantityText;

    [Header("Ingredients")]
    public GameObject breakfastIngredientsContainer;
    public TextMeshProUGUI breakfastIngredientsQuantityText;
    public GameObject lunchIngredientsContainer;
    public TextMeshProUGUI lunchIngredientsQuantityText;
    public GameObject dinnerIngredientsContainer;
    public TextMeshProUGUI dinnerIngredientsQuantityText;

    [Header("Other")]
    public GameObject toiletriesContainer;
    public TextMeshProUGUI toiletriesQuantityText;
    public GameObject cleaningSuppliesContainer;
    public TextMeshProUGUI cleaningSuppliesQuantityText;
    public GameObject newspaperContainer;
    public TextMeshProUGUI newspaperQuantityText;

    [Header("Modal Containers")]
    public GameObject mainModalContainer;
    public GameObject ingredientsModalContainer;
    public TextMeshProUGUI modalLabel;
    public TextMeshProUGUI modalDesc;
    public TextMeshProUGUI modalStat;

    private int prepackagedBreakfastQuantity;
    private int breakfastIngredientsQuantity;
    private int prepackagedLunchQuantity;
    private int lunchIngredientsQuantity;
    private int prepackagedDinnerQuantity;
    private int dinnerIngredientsQuantity;
    private int toiletriesQuantity;
    private int cleaningSuppliesQuantity;
    private int newspaperQuantity;

    public void UpdateBreakfastPrepackagedFoodQuantity(int quantity)
    {
        breakfastPrepackagedMealQuantityText.text = quantity.ToString();
        prepackagedBreakfastQuantity = quantity;
    }

    public void UpdateBreakfastIngredientsQuantity(int quantity)
    {
        breakfastIngredientsQuantityText.text = quantity.ToString();
        breakfastIngredientsQuantity = quantity;
    }

    public void UpdateLunchPrepackagedFoodQuantity(int quantity)
    {
        lunchPrepackagedMealQuantityText.text = quantity.ToString();
        prepackagedLunchQuantity = quantity;
    }

    public void UpdateLunchIngredientsQuantity(int quantity)
    {
        lunchIngredientsQuantityText.text = quantity.ToString();
        lunchIngredientsQuantity = quantity;
    }

    public void UpdateDinnerPrepackagedFoodQuantity(int quantity)
    {
        dinnerPrepackagedMealQuantityText.text = quantity.ToString();
        prepackagedDinnerQuantity = quantity;
    }

    public void UpdateDinnerIngredientsQuantity(int quantity)
    {
        dinnerIngredientsQuantityText.text = quantity.ToString();
        dinnerIngredientsQuantity = quantity;
    }

    public void UpdateToiletriesQuantity(int quantity)
    {
        toiletriesQuantityText.text = quantity.ToString();
        toiletriesQuantity = quantity;
    }
    public void UpdateCleaningSuppliesQuantity(int quantity)
    {
        cleaningSuppliesQuantityText.text = quantity.ToString();
        cleaningSuppliesQuantity = quantity;
    }
    public void UpdateNewspaperQuantity(int quantity)
    {
        newspaperQuantityText.text = quantity.ToString();
        newspaperQuantity = quantity;
    }

    public void OnClickInventoryModal(string item)
    {
        mainModalContainer.SetActive(true);
        ingredientsModalContainer.SetActive(true);

        switch(item)
        {
            case "Breakfast Ingredients":
                modalLabel.text = "Breakfast Ingredients";
                modalDesc.text = "Breakfast ingredients allow you to cook things like pancakes, waffles, and omelettes." +
                    "They require some energy to make, but restore health and wellness.";
                modalStat.text = "You have " + breakfastIngredientsQuantity + "sets of breakfast ingredients.";
                break;
            case "Prepackaged Breakfast":
                modalLabel.text = "Prepackaged Breakfast";
                modalDesc.text = "Prepackaged breakfasts are easy and quick to make items that don't require a lot of mixing and cooking. Like cereal, breakfast bars, and toast." +
                    "Typically they give a small amount of health and take no energy to make.";
                modalStat.text = "You have " + prepackagedBreakfastQuantity + " prepackaged breakfast meals.";
                break;
            default:
                Debug.Log("Unknown Inventory Modal Item: " + item);
                break;
        }
    }

    public void OnClickCloseModal()
    {
        mainModalContainer.SetActive(false);
        ingredientsModalContainer.SetActive(false);
    }
}
