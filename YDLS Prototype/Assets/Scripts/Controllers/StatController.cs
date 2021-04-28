using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class StatController : MonoBehaviour
{
    public ProgressBar energySlider;
    //public TextMeshProUGUI energyTopLabel;
    public ProgressBar topEnergySlider;

    public ProgressBar healthSlider;
    //public TextMeshProUGUI healthTopLabel;
    public ProgressBar topHealthSlider;

    public ProgressBar wellnessSlider;
    //public TextMeshProUGUI wellnessTopLabel;
    public ProgressBar topWellnessSlider;

    private int energyStat;
    private int healthStat;
    private int wellnessStat;

    [Header("Modal Containers")]
    public GameObject mainModalContainer;
    public GameObject energyModalContainer;
    public TextMeshProUGUI energyModalStat;

    public GameObject healthModalContainer;
    public TextMeshProUGUI healthModalStat;

    public GameObject wellnessModalContainer;
    public TextMeshProUGUI wellnessModalStat;

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
    }

    public void OnClickEnergyModal()
    {
        mainModalContainer.SetActive(true);
        energyModalContainer.SetActive(true);

        energyModalStat.text = "Your current <color=#89a15c>Energy</color> is " + energyStat + ".";
    }

    public void OnClickHealthModal()
    {
        mainModalContainer.SetActive(true);
        healthModalContainer.SetActive(true);

        healthModalStat.text = "Your current <color=#9f4d3a>Health</color> is " + healthStat + ".";
    }

    public void OnClickWellnessModal()
    {
        mainModalContainer.SetActive(true);
        wellnessModalContainer.SetActive(true);

        wellnessModalStat.text = "Your current <color=#7a8f8b>Wellness</color> is " + wellnessStat + ".";
    }
}
