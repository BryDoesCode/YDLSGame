using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.UI.ProceduralImage;


public class BackgroundController : MonoBehaviour
{
    [Header("Apartment")]
    public Sprite parentKitchen;
    public Color parentKitchenColor;
    public Sprite apartmentMorning;
    public Color apartmentMorningColor;
    public Sprite apartmentKitchenMorning;
    public Color apartmentKitchenMorningColor;
    public Sprite apartmentMidday;
    public Color apartmentMiddayColor;
    public Sprite apartmentEvening;
    public Color apartmentEveningColor;
    public Sprite apartmentKitchenEvening;
    public Color apartmentKitchenEveningColor;
    public Sprite apartmentNight;
    public Color apartmentNightColor;
    public Sprite apartmentBathroom;
    public Color apartmentBathroomColor;


    [Header("Work")]
    public Sprite retailWorkFront;
    public Color retailWorkFrontColor;
    public Sprite retailWorkRegister;
    public Color retailWorkRegisterColor;

    [Header("Store")]
    public Sprite convenienceStoreEvening;
    public Color convenienceStoreEveningColor;
    public Sprite convenienceStoreEveningExterior;
    public Color convenienceStoreEveningExteriorColor;

    [Header("Recreation Sprites")]
    public Sprite libraryAfternoon;
    public Sprite libraryEvening;

    [Header("UI Components")]
    public Image backgroundImage;
    public ScrollRect backgroundScrollContainer;
    public ProceduralImage labelContainerImage;
    public ProceduralImage mainScrollbarImage;
    public Image topBarAccentImage;
    public ProceduralImage inventoryButton;
    public ProceduralImage contactsButton;
    public ProceduralImage needsButton;
    public ProceduralImage bankingButton;
    public ProceduralImage calendarButton;
    public ProceduralImage settingsButton;

    [Header("Placeholder")]
    public Sprite black;
    public Color blackColor;

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
            case "retailWorkFront":
                backgroundImage.sprite = retailWorkFront;
                break;
            case "retailWorkRegister":
                backgroundImage.sprite = retailWorkRegister;
                break;
            case "apartmentEvening":
                backgroundImage.sprite = apartmentEvening;
                break;
            case "apartmentKitchenEvening":
                backgroundImage.sprite = apartmentKitchenEvening;
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
            case "libraryAfternoon":
                backgroundImage.sprite = libraryAfternoon;
                break;
            case "libraryEvening":
                backgroundImage.sprite = libraryEvening;
                break;
            case "black":
                backgroundImage.sprite = black;
                break;
            case "parentKitchen":
                backgroundImage.sprite = parentKitchen;
                break;
            default:
                Debug.Log("Unknown Image: " + imageName);
                break;
        }
        backgroundScrollContainer.horizontalNormalizedPosition = .5f;
    }

    public void ChangeContainerColor(string colorName)
    {
        switch (colorName)
        {
            case "apartmentMorning":
                CurrentColor = apartmentMorningColor;
                labelContainerImage.color = apartmentMorningColor;
                topBarAccentImage.color = apartmentMorningColor;
                mainScrollbarImage.color = apartmentMorningColor;

                inventoryButton.color = apartmentMorningColor;
                contactsButton.color = apartmentMorningColor;
                needsButton.color = apartmentMorningColor;
                bankingButton.color = apartmentMorningColor;
                calendarButton.color = apartmentMorningColor;
                settingsButton.color = apartmentMorningColor;

                break;
            case "apartmentKitchenMorning":
                CurrentColor = apartmentKitchenMorningColor;
                labelContainerImage.color = apartmentKitchenMorningColor;
                topBarAccentImage.color = apartmentKitchenMorningColor;
                mainScrollbarImage.color = apartmentKitchenMorningColor;

                inventoryButton.color = apartmentKitchenMorningColor;
                contactsButton.color = apartmentKitchenMorningColor;
                needsButton.color = apartmentKitchenMorningColor;
                bankingButton.color = apartmentKitchenMorningColor;
                calendarButton.color = apartmentKitchenMorningColor;
                settingsButton.color = apartmentKitchenMorningColor;

                break;
            case "apartmentBathroom":
                CurrentColor = apartmentBathroomColor;
                labelContainerImage.color = apartmentBathroomColor;
                topBarAccentImage.color = apartmentBathroomColor;
                mainScrollbarImage.color = apartmentBathroomColor;

                inventoryButton.color = apartmentBathroomColor;
                contactsButton.color = apartmentBathroomColor;
                needsButton.color = apartmentBathroomColor;
                bankingButton.color = apartmentBathroomColor;
                calendarButton.color = apartmentBathroomColor;
                settingsButton.color = apartmentBathroomColor;

                break;
            case "retailWorkFront":
                CurrentColor = retailWorkFrontColor;
                labelContainerImage.color = retailWorkFrontColor;
                topBarAccentImage.color = retailWorkFrontColor;
                mainScrollbarImage.color = retailWorkFrontColor;

                inventoryButton.color = retailWorkFrontColor;
                contactsButton.color = retailWorkFrontColor;
                needsButton.color = retailWorkFrontColor;
                bankingButton.color = retailWorkFrontColor;
                calendarButton.color = retailWorkFrontColor;
                settingsButton.color = retailWorkFrontColor;

                break;
            case "retailWorkRegister":
                CurrentColor = retailWorkRegisterColor;
                labelContainerImage.color = retailWorkRegisterColor;
                topBarAccentImage.color = retailWorkRegisterColor;
                mainScrollbarImage.color = retailWorkRegisterColor;

                inventoryButton.color = retailWorkRegisterColor;
                contactsButton.color = retailWorkRegisterColor;
                needsButton.color = retailWorkRegisterColor;
                bankingButton.color = retailWorkRegisterColor;
                calendarButton.color = retailWorkRegisterColor;
                settingsButton.color = retailWorkRegisterColor;

                break;
            case "apartmentMidday":
                CurrentColor = apartmentMiddayColor;
                labelContainerImage.color = apartmentMiddayColor;
                topBarAccentImage.color = apartmentMiddayColor;
                mainScrollbarImage.color = apartmentMiddayColor;

                inventoryButton.color = apartmentMiddayColor;
                contactsButton.color = apartmentMiddayColor;
                needsButton.color = apartmentMiddayColor;
                bankingButton.color = apartmentMiddayColor;
                calendarButton.color = apartmentMiddayColor;
                settingsButton.color = apartmentMiddayColor;

                break;
            case "apartmentEvening":
                CurrentColor = apartmentEveningColor;
                labelContainerImage.color = apartmentEveningColor;
                topBarAccentImage.color = apartmentEveningColor;
                mainScrollbarImage.color = apartmentEveningColor;

                inventoryButton.color = apartmentEveningColor;
                contactsButton.color = apartmentEveningColor;
                needsButton.color = apartmentEveningColor;
                bankingButton.color = apartmentEveningColor;
                calendarButton.color = apartmentEveningColor;
                settingsButton.color = apartmentEveningColor;

                break;
            case "apartmentKitchenEvening":
                CurrentColor = apartmentKitchenEveningColor;
                labelContainerImage.color = apartmentKitchenEveningColor;
                topBarAccentImage.color = apartmentKitchenEveningColor;
                mainScrollbarImage.color = apartmentKitchenEveningColor;

                inventoryButton.color = apartmentKitchenEveningColor;
                contactsButton.color = apartmentKitchenEveningColor;
                needsButton.color = apartmentKitchenEveningColor;
                bankingButton.color = apartmentKitchenEveningColor;
                calendarButton.color = apartmentKitchenEveningColor;
                settingsButton.color = apartmentKitchenEveningColor;

                break;
            case "apartmentNight":
                CurrentColor = apartmentNightColor;
                labelContainerImage.color = apartmentNightColor;
                topBarAccentImage.color = apartmentNightColor;
                mainScrollbarImage.color = apartmentNightColor;

                inventoryButton.color = apartmentNightColor;
                contactsButton.color = apartmentNightColor;
                needsButton.color = apartmentNightColor;
                bankingButton.color = apartmentNightColor;
                calendarButton.color = apartmentNightColor;
                settingsButton.color = apartmentNightColor;

                break;
            case "convenienceStoreEveningExterior":
                CurrentColor = convenienceStoreEveningExteriorColor;
                labelContainerImage.color = convenienceStoreEveningExteriorColor;
                topBarAccentImage.color = convenienceStoreEveningExteriorColor;
                mainScrollbarImage.color = convenienceStoreEveningExteriorColor;

                inventoryButton.color = convenienceStoreEveningExteriorColor;
                contactsButton.color = convenienceStoreEveningExteriorColor;
                needsButton.color = convenienceStoreEveningExteriorColor;
                bankingButton.color = convenienceStoreEveningExteriorColor;
                calendarButton.color = convenienceStoreEveningExteriorColor;
                settingsButton.color = convenienceStoreEveningExteriorColor;

                break;
            case "convenienceStoreEvening":
                CurrentColor = convenienceStoreEveningColor;
                labelContainerImage.color = convenienceStoreEveningColor;
                topBarAccentImage.color = convenienceStoreEveningColor;
                mainScrollbarImage.color = convenienceStoreEveningColor;

                inventoryButton.color = convenienceStoreEveningColor;
                contactsButton.color = convenienceStoreEveningColor;
                needsButton.color = convenienceStoreEveningColor;
                bankingButton.color = convenienceStoreEveningColor;
                calendarButton.color = convenienceStoreEveningColor;
                settingsButton.color = convenienceStoreEveningColor;

                break;            
            case "black":
                CurrentColor = blackColor;
                labelContainerImage.color = blackColor;
                topBarAccentImage.color = blackColor;
                mainScrollbarImage.color = blackColor;

                inventoryButton.color = blackColor;
                contactsButton.color = blackColor;
                needsButton.color = blackColor;
                bankingButton.color = blackColor;
                calendarButton.color = blackColor;
                settingsButton.color = blackColor;

                break;
            case "parentKitchen":
                CurrentColor = parentKitchenColor;
                labelContainerImage.color = parentKitchenColor;
                topBarAccentImage.color = parentKitchenColor;
                mainScrollbarImage.color = parentKitchenColor;

                inventoryButton.color = parentKitchenColor;
                contactsButton.color = parentKitchenColor;
                needsButton.color = parentKitchenColor;
                bankingButton.color = parentKitchenColor;
                calendarButton.color = parentKitchenColor;
                settingsButton.color = parentKitchenColor;

                break;
            default:
                Debug.Log("Unknown Color: " + colorName);
                break;
        }
    }
}
