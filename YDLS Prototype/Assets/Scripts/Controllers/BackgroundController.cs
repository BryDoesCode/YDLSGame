using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.UI.ProceduralImage;


public class BackgroundController : MonoBehaviour
{
    [Header("Parents")]
    public Sprite parentKitchen;
    public Color parentKitchenColor;

    [Header("Apartment Bedroom")]
    public Sprite apartmentMorning;
    public Color apartmentMorningColor;    
    public Sprite apartmentMidday;
    public Color apartmentMiddayColor;
    public Sprite apartmentEvening;
    public Color apartmentEveningColor;    
    public Sprite apartmentNight;
    public Color apartmentNightColor;
    

    [Header("Apartment Kitchen")]
    public Sprite apartmentKitchenMorning;
    public Color apartmentKitchenMorningColor;
    public Sprite apartmentKitchenMidday;
    public Color apartmentKitchenMiddayColor;
    public Sprite apartmentKitchenEvening;
    public Color apartmentKitchenEveningColor;
    public Sprite apartmentKitchenNight;
    public Color apartmentKitchenNightColor;

    [Header("Apartment Bathroom")]
    public Sprite apartmentBathroom;
    public Color apartmentBathroomColor;

    [Header("Work")]
    public Sprite retailWorkFront;
    public Color retailWorkFrontColor;
    public Sprite retailWorkRegister;
    public Color retailWorkRegisterColor;

    public Sprite officeWorkRoom;
    public Color officeWorkRoomColor;
    public Sprite officeWorkComputer;
    public Color officeWorkComputerColor;
    public Sprite officeWorkBreakroom;
    public Color officeWorkBreakroomColor;
    public Sprite officeWorkExterior;

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
            case "officeWorkRoom;":
                backgroundImage.sprite = officeWorkRoom;
                break;
            case "officeWorkComputer;;":
                backgroundImage.sprite = officeWorkComputer;
                break;
            case "officeWorkBreakroom;;":
                backgroundImage.sprite = officeWorkBreakroom;
                break;
            default:
                Debug.Log("Unknown Image: " + imageName);
                break;
        }
        backgroundScrollContainer.horizontalNormalizedPosition = .5f;
    }

    /*public void ChangeContainerColor(string colorName)
    {
        switch (colorName)
        {
            case "apartmentMorning":
                CurrentColor = apartmentMorningColor;
                labelContainerImage.color = apartmentMorningColor;
                topBarAccentImage.color = apartmentMorningColor;
                mainScrollbarImage.color = apartmentMorningColor;


                break;
            case "apartmentKitchenMorning":
                CurrentColor = apartmentKitchenMorningColor;
                labelContainerImage.color = apartmentKitchenMorningColor;
                topBarAccentImage.color = apartmentKitchenMorningColor;
                mainScrollbarImage.color = apartmentKitchenMorningColor;


                break;
            case "apartmentBathroom":
                CurrentColor = apartmentBathroomColor;
                labelContainerImage.color = apartmentBathroomColor;
                topBarAccentImage.color = apartmentBathroomColor;
                mainScrollbarImage.color = apartmentBathroomColor;


                break;
            case "retailWorkFront":
                CurrentColor = retailWorkFrontColor;
                labelContainerImage.color = retailWorkFrontColor;
                topBarAccentImage.color = retailWorkFrontColor;
                mainScrollbarImage.color = retailWorkFrontColor;


                break;
            case "retailWorkRegister":
                CurrentColor = retailWorkRegisterColor;
                labelContainerImage.color = retailWorkRegisterColor;
                topBarAccentImage.color = retailWorkRegisterColor;
                mainScrollbarImage.color = retailWorkRegisterColor;


                break;
            case "apartmentMidday":
                CurrentColor = apartmentMiddayColor;
                labelContainerImage.color = apartmentMiddayColor;
                topBarAccentImage.color = apartmentMiddayColor;
                mainScrollbarImage.color = apartmentMiddayColor;


                break;
            case "apartmentEvening":
                CurrentColor = apartmentEveningColor;
                labelContainerImage.color = apartmentEveningColor;
                topBarAccentImage.color = apartmentEveningColor;
                mainScrollbarImage.color = apartmentEveningColor;


                break;
            case "apartmentKitchenMidday":
                CurrentColor = apartmentKitchenMiddayColor;
                labelContainerImage.color = apartmentKitchenMiddayColor;
                topBarAccentImage.color = apartmentKitchenMiddayColor;
                mainScrollbarImage.color = apartmentKitchenMiddayColor;


                break;
            case "apartmentKitchenEvening":
                CurrentColor = apartmentKitchenEveningColor;
                labelContainerImage.color = apartmentKitchenEveningColor;
                topBarAccentImage.color = apartmentKitchenEveningColor;
                mainScrollbarImage.color = apartmentKitchenEveningColor;


                break;
            case "apartmentKitchenNight":
                CurrentColor = apartmentKitchenNightColor;
                labelContainerImage.color = apartmentKitchenNightColor;
                topBarAccentImage.color = apartmentKitchenNightColor;
                mainScrollbarImage.color = apartmentKitchenNightColor;


                break;
            case "apartmentNight":
                CurrentColor = apartmentNightColor;
                labelContainerImage.color = apartmentNightColor;
                topBarAccentImage.color = apartmentNightColor;
                mainScrollbarImage.color = apartmentNightColor;


                break;
            case "convenienceStoreEveningExterior":
                CurrentColor = convenienceStoreEveningExteriorColor;
                labelContainerImage.color = convenienceStoreEveningExteriorColor;
                topBarAccentImage.color = convenienceStoreEveningExteriorColor;
                mainScrollbarImage.color = convenienceStoreEveningExteriorColor;


                break;
            case "convenienceStoreEvening":
                CurrentColor = convenienceStoreEveningColor;
                labelContainerImage.color = convenienceStoreEveningColor;
                topBarAccentImage.color = convenienceStoreEveningColor;
                mainScrollbarImage.color = convenienceStoreEveningColor;


                break;            
            case "black":
                CurrentColor = blackColor;
                labelContainerImage.color = blackColor;
                topBarAccentImage.color = blackColor;
                mainScrollbarImage.color = blackColor;


                break;
            case "parentKitchen":
                CurrentColor = parentKitchenColor;
                labelContainerImage.color = parentKitchenColor;
                topBarAccentImage.color = parentKitchenColor;
                mainScrollbarImage.color = parentKitchenColor;

                break;
            default:
                Debug.Log("Unknown Color: " + colorName);
                break;
        }
    }
    */
}
