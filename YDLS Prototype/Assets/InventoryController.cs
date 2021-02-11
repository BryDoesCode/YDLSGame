using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class InventoryController : MonoBehaviour
{
    [Header("Prepackaged Meals")]
    public GameObject prepackagedMealContainer;
    public TextMeshProUGUI prepackagedMealQuantityText;
    [Header("Ingredients")]
    public GameObject ingredientsSetContainer;
    public TextMeshProUGUI ingredientsSetQuantityText;
    [Header("Newspaper")]
    public GameObject newspaperContainer;
    public TextMeshProUGUI newspaperQuantityText;

    //public TextMeshProUGUI moneyQuantityText;



    public void UpdatePrepackagedFoodQuantity(int quantity)
    {
        prepackagedMealQuantityText.text = quantity.ToString();
    }

    public void UpdateIngredientsSet(int quantity)
    {
        ingredientsSetQuantityText.text = quantity.ToString();
    }

    public void UpdateNewspaperQuantity(int quantity)
    {
        newspaperQuantityText.text = quantity.ToString();
    }
}
