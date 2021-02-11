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

    [Header("Game Controllers")]
    public SettingsController SettingsController;
    public SFXController SFXController;

    public void MenuOnClick()
    {
        inventoryScreen.SetActive(false);
        contactScreen.SetActive(false);
        needsScreen.SetActive(false);
        settingsContainer.SetActive(false);
        homeScreen.SetActive(true);
        calendarScreen.SetActive(false);
        bankScreen.SetActive(false);

        menuContainer.SetActive(!menuContainer.activeSelf);

        SFXController.PlayButtonClick();
    }

    public void InventoryOnClick()
    {
        homeScreen.SetActive(false);
        inventoryScreen.SetActive(true);

        SFXController.PlayButtonClick();
    }

    public void InventoryExitOnClick()
    {
        homeScreen.SetActive(true);
        inventoryScreen.SetActive(false);

        SFXController.PlayButtonClick();
    }

    public void ContactsOnClick()
    {
        homeScreen.SetActive(false);
        contactScreen.SetActive(true);

        SFXController.PlayButtonClick();
    }

    public void ContactExitOnClick()
    {
        homeScreen.SetActive(true);
        contactScreen.SetActive(false);

        SFXController.PlayButtonClick();
    }

    public void NeedsOnClick()
    {
        homeScreen.SetActive(false);
        needsScreen.SetActive(true);

        SFXController.PlayButtonClick();
    }

    public void NeedsExitOnClick()
    {
        homeScreen.SetActive(true);
        needsScreen.SetActive(false);

        SFXController.PlayButtonClick();
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
        homeScreen.SetActive(false);
        bankScreen.SetActive(true);

        SFXController.PlayButtonClick();
    }

    public void BankExitOnClick()
    {
        homeScreen.SetActive(true);
        bankScreen.SetActive(false);

        SFXController.PlayButtonClick();
    }

    public void CalendarOnClick()
    {
        homeScreen.SetActive(false);
        calendarScreen.SetActive(true);

        SFXController.PlayButtonClick();
    }

    public void CalendarExitOnClick()
    {
        homeScreen.SetActive(true);
        calendarScreen.SetActive(false);

        SFXController.PlayButtonClick();
    }
}
