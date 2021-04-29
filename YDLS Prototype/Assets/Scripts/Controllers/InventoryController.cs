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
    public GameObject medicationContainer;
    public TextMeshProUGUI medicationQuantityText;

    [Header("Modal Containers")]
    public GameObject mainModalContainer;
    public GameObject ingredientsModalContainer;
    public TextMeshProUGUI modalLabel;
    public TextMeshProUGUI modalDesc;
    public TextMeshProUGUI modalStat;

    [Header("Game Controllers")]
    public SFXController SFXController;

    private int prepackagedBreakfastQuantity;
    private int breakfastIngredientsQuantity;
    private int prepackagedLunchQuantity;
    private int lunchIngredientsQuantity;
    private int prepackagedDinnerQuantity;
    private int dinnerIngredientsQuantity;
    private int toiletriesQuantity;
    private int cleaningSuppliesQuantity;
    private int newspaperQuantity;
    private int medicationQuantity;

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

    public void UpdateMedicationQuantity(int quantity)
    {
        medicationQuantityText.text = quantity.ToString();
        medicationQuantity = quantity;
    }

    public void OnClickInventoryModal(string item)
    {       
        
        switch (item)
        {
            case "Breakfast Ingredients":
                modalLabel.text = "Breakfast Ingredients";
                modalDesc.text = "Breakfast Ingredients allow you to cook things like pancakes, waffles, and omelettes." +
                    "\n\nThey require some energy to make, but restore health and wellness.";
                modalStat.text = "You have " + breakfastIngredientsQuantity + " sets of Breakfast Ingredients.";
                break;
            case "Prepackaged Breakfast":
                modalLabel.text = "Prepackaged Breakfast";
                modalDesc.text = "Prepackaged Breakfasts are easy and quick to make items that don't require a lot of mixing and cooking. Like cereal, breakfast bars, and toast." +
                    "\n\nTypically they give a small amount of health and take no energy to make.";
                modalStat.text = "You have " + prepackagedBreakfastQuantity + " Prepackaged Breakfast meals.";
                break;
            case "Lunch Ingredients":
                modalLabel.text = "Lunch Ingredients";
                modalDesc.text = "Lunch Ingredients allow you to cook things like fried egg sandwiches, fancy salads, and wraps." +
                    "\n\nThey require some energy to make, but restore health and wellness.";
                modalStat.text = "You have " + lunchIngredientsQuantity + " sets of Lunch Ingredients.";
                break;
            case "Prepackaged Lunch":
                modalLabel.text = "Prepackaged Lunch";
                modalDesc.text = "Prepackaged Lunches are easy and quick to make items that don't require a lot of mixing and cooking. Like prewrapped sandwiches, and premixed salad containers." +
                    "\n\nTypically they give a small amount of health and take no energy to make.";
                modalStat.text = "You have " + prepackagedLunchQuantity + " Prepackaged Lunch meals.";
                break;
            case "Dinner Ingredients":
                modalLabel.text = "Dinner Ingredients";
                modalDesc.text = "Dinner Ingredients allow you to cook things like spaghetti and meatballs, baked potatoes, and tacos." +
                    "\n\nThey require some energy to make, but restore health and wellness.";
                modalStat.text = "You have " + dinnerIngredientsQuantity + " sets of Dinner Ingredients.";
                break;
            case "Prepackaged Dinner":
                modalLabel.text = "Prepackaged Dinner";
                modalDesc.text = "Prepackaged Dinners are easy and quick to make items that don't require a lot of mixing and cooking. Like frozen meals." +
                    "\n\nTypically they give a small amount of health and take no energy to make.";
                modalStat.text = "You have " + prepackagedDinnerQuantity + " Prepackaged Dinner meals.";
                break;
            case "Toiletries":
                modalLabel.text = "Toiletries";
                modalDesc.text = "Toiletries include things like shampoo, conditioner, toothpaste and so on. They are used to keep your body clean." +
                    "\n\nOne toiletries set is used each time you brush your teeth or shower.";
                modalStat.text = "You have " + toiletriesQuantity + " sets of Toiletries.";
                break;
            case "Cleaning Supplies":
                modalLabel.text = "Cleaning Supplies";
                modalDesc.text = "Cleaning Supplies include things like sponges, dish soap, and paper towels. They are used to keep your house clean." +
                    "\n\nOne cleaning supplies set is used each time you wash dishes or clean the house.";
                modalStat.text = "You have " + cleaningSuppliesQuantity + " sets of Cleaning Supplies.";
                break;
            case "Newspaper":
                modalLabel.text = "Newspaper";
                modalDesc.text = "Newspapers are used to keep up to date on local occurences and the general news. They also have classifieds.";
                modalStat.text = "You have " + newspaperQuantity + " Newspapers.";
                break;
            case "Medication":
                modalLabel.text = "Medication";
                modalDesc.text = "You take a variety of medications in the morning for your various symptoms. One dose is used each morning.";
                modalStat.text = "You have " + medicationQuantity + " doses of Medication.";
                break;
            case "Debit Card":
                modalLabel.text = "Debit Card";
                modalDesc.text = "You take your debit card with you everywhere you go. It's directly connected to your bank account and used to pay for things." +
                    "\n\nIt will be declined if you don't have enough money in your account.";
                modalStat.text = "You have 1 Debit Card.";
                break;

            default:
                Debug.Log("Unknown Inventory Modal Item: " + item);
                break;

        }
        mainModalContainer.SetActive(true);
        ingredientsModalContainer.SetActive(true);
        SFXController.PlayButtonClick();
    }

    public void OnClickCloseModal()
    {
        mainModalContainer.SetActive(false);
        ingredientsModalContainer.SetActive(false);
        SFXController.PlayButtonClick();
    }
}
