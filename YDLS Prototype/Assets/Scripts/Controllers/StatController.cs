using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class StatController : MonoBehaviour
{
    public ProgressBar energySlider;
    public ProgressBar topEnergySlider;

    public ProgressBar healthSlider;
    public ProgressBar topHealthSlider;

    public ProgressBar wellnessSlider;
    public ProgressBar topWellnessSlider;

    private int energyStat;
    private int healthStat;
    private int wellnessStat;
    private int energyAtStart;
    private int energyUsedToday;
    private int healthAtStart;
    private int healthUsedToday;
    private int wellnessAtStart;  
    private int wellnessUsedToday;

    private bool phonePaid = false;
    private bool rentPaid = false;
    private bool electricPaid = false; 

    [Header("Modal Containers")]
    public GameObject mainModalContainer;
    public GameObject energyModalContainer;
    public TextMeshProUGUI energyModalStat;

    public GameObject healthModalContainer;
    public TextMeshProUGUI healthModalStat;

    public GameObject wellnessModalContainer;
    public TextMeshProUGUI wellnessModalStat;

    [Header("Stat Summary Containers")]
    public GameObject statSummaryContainer;
    public TextMeshProUGUI energyStartText;
    public TextMeshProUGUI energyUsedText;
    public TextMeshProUGUI energyEndText;
    public TextMeshProUGUI healthStartText;
    public TextMeshProUGUI healthUsedText;
    public TextMeshProUGUI healthEndText;
    public TextMeshProUGUI wellnessStartText;
    public TextMeshProUGUI wellnessUsedText;
    public TextMeshProUGUI wellnessEndText;
    public TextMeshProUGUI billsPaidText;
    public TextMeshProUGUI billsUnpaidText;
    public List<GameObject> billContainers;

    [Header("Game Controllers")]
    public SFXController SFXController;
    public GameController GameController;

    public void UpdateEnergyStat(int energy)
    {        
        energySlider.UpdateCurrentFill(energy);
        topEnergySlider.UpdateCurrentFill(energy);
        energyStat = energy;
    }

    public void UpdateHealthStat(int health)
    {
        healthSlider.UpdateCurrentFill(health);
        topHealthSlider.UpdateCurrentFill(health);
        healthStat = health;
    }

    public void UpdateWellnessStat(int wellness)
    {
        wellnessSlider.UpdateCurrentFill(wellness);
        topWellnessSlider.UpdateCurrentFill(wellness);
        wellnessStat = wellness;
    }

    public void UpdateNeedMax(int maximum)
    {
        energySlider.SetMaximum(maximum);
        healthSlider.SetMaximum(maximum);
        wellnessSlider.SetMaximum(maximum);
        topEnergySlider.SetMaximum(maximum);
        topHealthSlider.SetMaximum(maximum);
        topWellnessSlider.SetMaximum(maximum);
    }

    public void OnClickCloseModal()
    {
        mainModalContainer.SetActive(false);
        energyModalContainer.SetActive(false);
        healthModalContainer.SetActive(false);
        wellnessModalContainer.SetActive(false);
        SFXController.PlayButtonClick();
    }

    public void OnClickEnergyModal()
    {
        energyModalStat.text = "Your current <color=#89a15c>Energy</color> is " + energyStat + ".";

        mainModalContainer.SetActive(true);
        energyModalContainer.SetActive(true);        

        SFXController.PlayButtonClick();
    }

    public void OnClickHealthModal()
    {
        healthModalStat.text = "Your current <color=#9f4d3a>Health</color> is " + healthStat + ".";

        mainModalContainer.SetActive(true);
        healthModalContainer.SetActive(true);
              
        SFXController.PlayButtonClick();
    }

    public void OnClickWellnessModal()
    {
        wellnessModalStat.text = "Your current <color=#7a8f8b>Wellness</color> is " + wellnessStat + ".";

        mainModalContainer.SetActive(true);
        wellnessModalContainer.SetActive(true);       

        SFXController.PlayButtonClick();
    }

    public void UpdateBillStatus()
    {
        // Check if bills are paid. 
        if (PlayerPrefs.HasKey("rentBill") && PlayerPrefs.GetFloat("rentBill") <= 0)
        {
            rentPaid = true;
        }
        if (PlayerPrefs.HasKey("phoneBill") && PlayerPrefs.GetFloat("phoneBill") <= 0)
        {
            phonePaid = true;
        }
        if (PlayerPrefs.HasKey("electricBill") && PlayerPrefs.GetFloat("electricBill") <= 0)
        {
            electricPaid = true;
        }
    }

    public void UpdateEnergySummary(int start, int used)
    {
        energyAtStart = start;
        energyUsedToday = used;
    }

    public void UpdateHealthSummary(int start, int used)
    {
        healthAtStart = start;
        healthUsedToday = used;
    }

    public void UpdateWellnessSummary(int start, int used)
    {
        wellnessAtStart = start;
        wellnessUsedToday = used;
    }

    public void ShowStatSummary(int showBills)
    {
        // Stat Portion
        energyStartText.text = energyAtStart.ToString();
        energyUsedText.text = energyUsedToday.ToString();
        energyEndText.text = energyStat.ToString();
        healthStartText.text = healthAtStart.ToString();
        healthUsedText.text = healthUsedToday.ToString();
        healthEndText.text = healthStat.ToString();
        wellnessStartText.text = wellnessAtStart.ToString();
        wellnessUsedText.text = wellnessUsedToday.ToString();
        wellnessEndText.text = wellnessStat.ToString();

        // Bills Portion
        if (showBills == 1)
        {
            foreach (GameObject container in billContainers)
            {
                container.SetActive(true);
            }

            UpdateBillStatus();

            billsPaidText.text = "";
            billsUnpaidText.text = "";

            if (phonePaid)
            {
                billsPaidText.text += "Phone\n";
            }
            else
            {
                billsUnpaidText.text += "Phone\n";
            }

            if (electricPaid)
            {
                billsPaidText.text += "Electric\n";
            }
            else
            {
                billsUnpaidText.text += "Electric\n";
            }

            if (rentPaid)
            {
                billsPaidText.text += "Rent\n";
            }
            else
            {
                billsUnpaidText.text += "Rent\n";
            }

            if (!rentPaid && !phonePaid && !electricPaid)
            {
                billsPaidText.text += "None";
            }
            else if (rentPaid && phonePaid && electricPaid)
            {
                billsUnpaidText.text += "None";
            }
        }
        else
        {
            foreach(GameObject container in billContainers)
            {
                container.SetActive(false);
            }
        }

        statSummaryContainer.SetActive(true);
    }
    public void CloseStatSummary()
    {
        statSummaryContainer.SetActive(false);
        GameController.OnClickContinueButton();
    }
}
