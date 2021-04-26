using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIUnlockController : MonoBehaviour
{    
    [Header("Menu Buttons")]
    public GameObject inventoryButton;
    public GameObject contactsButton;
    public GameObject needsButton;
    public GameObject bankingButton;
    public GameObject calendarButton;

    [Header("Stats")]
    public GameObject energyStat;
    public GameObject healthStat;
    public GameObject wellnessStat;


    // Start is called before the first frame update
    void Start()
    {
        ShowInventoryButton(0);
        ShowContactsButton(0);
        ShowNeedsButton(0);
        ShowBankingButton(0);
        ShowCalendarButton(0);

        ShowEnergySlider(0);
        ShowHealthSlider(0);
        ShowWellnessSlider(0);
    }

    public void ShowInventoryButton(int value)
    {
        if (value == 1)
        {
            inventoryButton.SetActive(true);
        }
        else
        {
            inventoryButton.SetActive(false);
        }
    }

    public void ShowContactsButton(int value)
    {
        if (value == 1)
        {
            contactsButton.SetActive(true);
        }
        else
        {
            contactsButton.SetActive(false);
        }
    }

    public void ShowNeedsButton(int value)
    {
        if (value == 1)
        {
            needsButton.SetActive(true);
        }
        else
        {
            needsButton.SetActive(false);
        }

    }

    public void ShowEnergySlider(int value)
    {
        if (value == 1)
        {
            energyStat.SetActive(true);
        }
        else
        {
            energyStat.SetActive(false);
        }
    }

    public void ShowHealthSlider(int value)
    {
        if (value == 1)
        {
            healthStat.SetActive(true);
        }
        else
        {
            healthStat.SetActive(false);
        }
    }

    public void ShowWellnessSlider(int value)
    {
        if (value == 1)
        {
            wellnessStat.SetActive(true);
        }
        else
        {
            wellnessStat.SetActive(false);
        }
    }

    public void ShowBankingButton(int value)
    {
        if (value == 1)
        {
            bankingButton.SetActive(true);
        }
        else
        {
            bankingButton.SetActive(false);
        }
    }

    public void ShowCalendarButton(int value)
    {
        if (value == 1)
        {
            calendarButton.SetActive(true);
        }
        else
        {
            calendarButton.SetActive(false);
        }
    }
}
