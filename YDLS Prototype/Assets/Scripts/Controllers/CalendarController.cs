using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI.ProceduralImage;
using TMPro;

public class CalendarController : MonoBehaviour
{
    public GameObject noEvent;
    public GameObject rentDue;
    public GameObject phoneDue;
    public GameObject electricDue;
    public GameObject workDay;
    public GameObject paycheckDay;
    public TextMeshProUGUI todayText;

    public List<ProceduralImage> days;
    public Color todayColor;
    public Color generalColor;

    [Header("Game Controllers")]
    public SFXController SFXController;

    public void OnClickNoEvent()
    {
        noEvent.SetActive(true);
        rentDue.SetActive(false);
        phoneDue.SetActive(false);
        electricDue.SetActive(false);
        workDay.SetActive(false);
        paycheckDay.SetActive(false);

        SFXController.PlayButtonClick();
    }
   public void OnClickRentDue()
    {
        noEvent.SetActive(false);
        rentDue.SetActive(true);
        phoneDue.SetActive(false);
        electricDue.SetActive(false);
        workDay.SetActive(false);
        paycheckDay.SetActive(false);

        SFXController.PlayButtonClick();
    }

    public void OnClickPhoneDue()
    {
        noEvent.SetActive(false);
        rentDue.SetActive(false);
        phoneDue.SetActive(true);
        electricDue.SetActive(false);
        workDay.SetActive(false);
        paycheckDay.SetActive(false);

        SFXController.PlayButtonClick();
    }
    public void OnClickElectricDue()
    {
        noEvent.SetActive(false);
        rentDue.SetActive(false);
        phoneDue.SetActive(false);
        electricDue.SetActive(true);
        workDay.SetActive(false);
        paycheckDay.SetActive(false);

        SFXController.PlayButtonClick();
    }
    public void OnClickWorkDay()
    {
        noEvent.SetActive(false);
        rentDue.SetActive(false);
        phoneDue.SetActive(false);
        electricDue.SetActive(false);
        workDay.SetActive(true);
        paycheckDay.SetActive(false);

        SFXController.PlayButtonClick();
    }

    public void OnClickPaycheckDay()
    {
        noEvent.SetActive(false);
        rentDue.SetActive(false);
        phoneDue.SetActive(false);
        electricDue.SetActive(false);
        workDay.SetActive(false);
        paycheckDay.SetActive(true);

        SFXController.PlayButtonClick();
    }

    public void UpdateToday(int date)
    {
        todayText.text = date.ToString();
        // Reset colors/styles of all dates.
        foreach(ProceduralImage day in days)
        {
            day.color = generalColor;
            day.GetComponentInChildren<TextMeshProUGUI>().fontStyle = FontStyles.Normal;
        }

        // Change color/style of today.
        ProceduralImage today = days[date - 1];
        today.color = todayColor;
        today.GetComponentInChildren<TextMeshProUGUI>().fontStyle = FontStyles.Bold;
    }
}
