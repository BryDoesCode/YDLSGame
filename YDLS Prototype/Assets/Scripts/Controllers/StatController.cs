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


    public void UpdateEnergyStat(int energy)
    {
        energySlider.UpdateCurrentFill(energy);
        //energyTopLabel.text = energy.ToString();
        topEnergySlider.UpdateCurrentFill(energy);
    }

    public void UpdateHealthStat(int health)
    {
        healthSlider.UpdateCurrentFill(health);
        //healthTopLabel.text = health.ToString();
        topHealthSlider.UpdateCurrentFill(health);
    }

    public void UpdateWellnessStat(int wellness)
    {
        wellnessSlider.UpdateCurrentFill(wellness);
        //wellnessTopLabel.text = wellness.ToString();
        topWellnessSlider.UpdateCurrentFill(wellness);
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

}
