using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MenuController : MonoBehaviour
{
    [Header("Containers")]
    public GameObject menuContainer;
    public GameObject homeScreen;
    public GameObject inventoryScreen;
    public GameObject contactScreen;
    public GameObject needsScreen;
    public GameObject bankScreen;
    public GameObject calendarScreen;
    public GameObject settingsContainer;
    public GameObject narrativeLogContainer;

    [Header("Button Containers")]
    
    /*public GameObject homeButton;
    public GameObject inventoryButton;
    public GameObject bankButton;
    public GameObject contactsButton;
    public GameObject calendarButton;
    public GameObject settingsButton;*/

    public RectTransform homeRect;
    public RectTransform inventoryRect;
    public RectTransform bankRect;
    public RectTransform contactsRect;
    public RectTransform calendarRect;


    [Header("Game Controllers")]
    public SettingsController SettingsController;
    public SFXController SFXController;

    private Vector2 pressedSize = new Vector2 (170, 170);
    private Vector2 originalSize = new Vector2(140, 140);

    private void Start()
    {
        homeRect.sizeDelta = pressedSize;
    }
    
    public void HomeOnClick()
    {
        
        inventoryScreen.SetActive(false);
        contactScreen.SetActive(false);
        needsScreen.SetActive(false);
        settingsContainer.SetActive(false);
        calendarScreen.SetActive(false);
        bankScreen.SetActive(false);
        narrativeLogContainer.SetActive(false);

        homeRect.sizeDelta = pressedSize;
        inventoryRect.sizeDelta = originalSize;
        bankRect.sizeDelta = originalSize;
        contactsRect.sizeDelta = originalSize;
        calendarRect.sizeDelta = originalSize;
        
        SFXController.PlayButtonClick();

    }

    public void InventoryOnClick()
    {        
        inventoryScreen.SetActive(true);
        contactScreen.SetActive(false);
        needsScreen.SetActive(false);
        settingsContainer.SetActive(false);
        calendarScreen.SetActive(false);
        bankScreen.SetActive(false);
        narrativeLogContainer.SetActive(false);
                        
        homeRect.sizeDelta = originalSize;
        inventoryRect.sizeDelta = pressedSize;
        bankRect.sizeDelta = originalSize;
        contactsRect.sizeDelta = originalSize;
        calendarRect.sizeDelta = originalSize;
        
        SFXController.PlayButtonClick();
    }
        
    public void ContactsOnClick()
    {
        inventoryScreen.SetActive(false);
        contactScreen.SetActive(true);
        needsScreen.SetActive(false);
        settingsContainer.SetActive(false);
        calendarScreen.SetActive(false);
        bankScreen.SetActive(false);
        narrativeLogContainer.SetActive(false);

        SFXController.PlayButtonClick();

        homeRect.sizeDelta = originalSize;
        inventoryRect.sizeDelta = originalSize;
        bankRect.sizeDelta = originalSize;
        contactsRect.sizeDelta = pressedSize;
        calendarRect.sizeDelta = originalSize;
    }


    public void NeedsOnClick()
    {
        inventoryScreen.SetActive(false);
        contactScreen.SetActive(false);
        needsScreen.SetActive(true);
        settingsContainer.SetActive(false);
        calendarScreen.SetActive(false);
        bankScreen.SetActive(false);
        narrativeLogContainer.SetActive(false);

        SFXController.PlayButtonClick();

        homeRect.sizeDelta = originalSize;
        inventoryRect.sizeDelta = originalSize;
        bankRect.sizeDelta = originalSize;
        contactsRect.sizeDelta = originalSize;
        calendarRect.sizeDelta = originalSize;
    }

    public void SettingsOnClick()
    {
        homeScreen.SetActive(false);
        settingsContainer.SetActive(true);
        settingsContainer.transform.GetChild(0).gameObject.SetActive(false);
        SettingsController.inGameMenu = true;

        SFXController.PlayButtonClick();
    }

    public void BankOnClick()
    {
        inventoryScreen.SetActive(false);
        contactScreen.SetActive(false);
        needsScreen.SetActive(false);
        settingsContainer.SetActive(false);
        calendarScreen.SetActive(false);
        bankScreen.SetActive(true);
        narrativeLogContainer.SetActive(false);

        SFXController.PlayButtonClick();

        homeRect.sizeDelta = originalSize;
        inventoryRect.sizeDelta = originalSize;
        bankRect.sizeDelta = pressedSize;
        contactsRect.sizeDelta = originalSize;
        calendarRect.sizeDelta = originalSize;
    }


    public void CalendarOnClick()
    {
        inventoryScreen.SetActive(false);
        contactScreen.SetActive(false);
        needsScreen.SetActive(false);
        settingsContainer.SetActive(false);
        calendarScreen.SetActive(true);
        bankScreen.SetActive(false);
        narrativeLogContainer.SetActive(false);

        SFXController.PlayButtonClick();

        homeRect.sizeDelta = originalSize;
        inventoryRect.sizeDelta = originalSize;
        bankRect.sizeDelta = originalSize;
        contactsRect.sizeDelta = originalSize;
        calendarRect.sizeDelta = pressedSize;
    }

    public void NarrativeLogOnClick()
    {
        narrativeLogContainer.SetActive(true);
        SFXController.PlayButtonClick();
    }

    public void NarrativeLogExitOnClick()
    {
        narrativeLogContainer.SetActive(false);
        SFXController.PlayButtonClick();
    }

}
