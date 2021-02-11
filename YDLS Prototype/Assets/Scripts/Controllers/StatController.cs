using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class StatController : MonoBehaviour
{
    public ProgressBar energySlider;
    public TextMeshProUGUI energyTopLabel;

    public ProgressBar healthSlider;
    public TextMeshProUGUI healthTopLabel;

    public ProgressBar wellnessSlider;
    public TextMeshProUGUI wellnessTopLabel;


    public void UpdateEnergyStat(int energy)
    {
        energySlider.UpdateCurrentFill(energy);
        energyTopLabel.text = energy.ToString();
    }

    public void UpdateHealthStat(int health)
    {
        healthSlider.UpdateCurrentFill(health);
        healthTopLabel.text = health.ToString();
    }

    public void UpdateWellnessStat(int wellness)
    {
        wellnessSlider.UpdateCurrentFill(wellness);
        wellnessTopLabel.text = wellness.ToString();
    }

    public void UpdateNeedMax(int maximum)
    {
        energySlider.SetMaximum(maximum);
        healthSlider.SetMaximum(maximum);
        wellnessSlider.SetMaximum(maximum);
    }

}
