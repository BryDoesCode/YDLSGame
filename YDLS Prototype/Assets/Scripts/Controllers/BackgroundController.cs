using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.UI.ProceduralImage;


public class BackgroundController : MonoBehaviour
{
    [Header("Parents")]
    public Sprite parentKitchen;
    public Sprite bedroomAtParents;
    public Sprite parentKitchenNewspaper;

    [Header("Apartment Bedroom")]
    public Sprite apartmentMorning;
    public Sprite apartmentMidday;
    public Sprite apartmentEvening;
    public Sprite apartmentNight;
    

    [Header("Apartment Kitchen")]
    public Sprite apartmentKitchenMorning;
    public Sprite apartmentKitchenMidday;
    public Sprite apartmentKitchenEvening;
    public Sprite apartmentKitchenNight;

    [Header("Apartment Bathroom")]
    public Sprite apartmentBathroom;

    [Header("Work")]
    public Sprite officeWorkRoom;
    public Sprite officeWorkComputer;
    public Sprite officeWorkBreakroom;
    public Sprite officeWorkExterior;

    [Header("Store")]
    public Sprite convenienceStoreEvening;
    public Sprite convenienceStoreEveningExterior;

    [Header("UI Components")]
    public Image backgroundImage;
    public ScrollRect backgroundScrollContainer;


    [Header("Placeholder")]
    public Sprite black;

    public Color CurrentColor { get; protected set; }

    public void ChangeBackgroundImage(string imageName)
    {
        switch (imageName)
        {
            case "apartmentMorning":
                backgroundImage.sprite = apartmentMorning;
                break;
            case "apartmentKitchenMorning":
                backgroundImage.sprite = apartmentKitchenMorning;
                break;
            case "apartmentKitchenMidday":
                backgroundImage.sprite = apartmentKitchenMidday;
                break;
            case "apartmentEvening":
                backgroundImage.sprite = apartmentEvening;
                break;
            case "apartmentKitchenEvening":
                backgroundImage.sprite = apartmentKitchenEvening;
                break;
            case "apartmentKitchenNight":
                backgroundImage.sprite = apartmentKitchenNight;
                break;
            case "apartmentMidday":
                backgroundImage.sprite = apartmentMidday;
                break;
            case "apartmentNight":
                backgroundImage.sprite = apartmentNight;
                break;
            case "apartmentBathroom":
                backgroundImage.sprite = apartmentBathroom;
                break;
            case "convenienceStoreEveningExterior":
                backgroundImage.sprite = convenienceStoreEveningExterior;
                break;
            case "convenienceStoreEvening":
                backgroundImage.sprite = convenienceStoreEvening;
                break;            
            case "officeWorkRoom":
                backgroundImage.sprite = officeWorkRoom;
                break;
            case "officeWorkComputer":
                backgroundImage.sprite = officeWorkComputer;
                break;
            case "officeWorkBreakroom":
                backgroundImage.sprite = officeWorkBreakroom;
                break;
            case "officeWorkExterior":
                backgroundImage.sprite = officeWorkExterior;
                break;
            case "black":
                backgroundImage.sprite = black;
                break;
            case "parentKitchen":
                backgroundImage.sprite = parentKitchen;
                break;
            case "bedroomAtParents":
                backgroundImage.sprite = bedroomAtParents;
                break;
            case "parentKitchenNewspaper":
                backgroundImage.sprite = parentKitchenNewspaper;
                break;
            default:
                Debug.Log("Unknown Image: " + imageName);
                break;
        }
        backgroundScrollContainer.horizontalNormalizedPosition = .5f;
    }
}
