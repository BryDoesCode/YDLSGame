using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.UI.ProceduralImage;
using TMPro;

[ExecuteInEditMode]
public class ProgressBar : MonoBehaviour
{
    private int maximum = default;    
    private int current = default;
    [SerializeField]
    private ProceduralImage fill = default;
    [SerializeField]
    private ProceduralImage labelMask = default;
    [SerializeField]
    private TextMeshProUGUI fillColorLabel = default;
    [SerializeField]
    private TextMeshProUGUI altColorLabel = default;
    
    public Color fillColor;
    public Color alternativeTextColor;

    void Start()
    {
        fillColorLabel.color = fillColor;
        altColorLabel.color = alternativeTextColor;
    }
    public void SetMaximum(int maximum)
    {
        this.maximum = maximum;
    }

    public void UpdateCurrentFill(int currentFill)
    {
        this.current = currentFill;
        fillColorLabel.text = current + " / " + maximum;
        altColorLabel.text = current + " / " + maximum; 
        GetCurrentFill();
    }

    void GetCurrentFill()
    {
        float fillAmount = (float)current / (float)maximum;
        fill.fillAmount = fillAmount;
        labelMask.fillAmount = fillAmount;

    }
}
