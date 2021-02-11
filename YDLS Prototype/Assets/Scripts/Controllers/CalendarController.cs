using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CalendarController : MonoBehaviour
{
    public GameObject noEvent;
    public GameObject rentDue;
    public GameObject phoneDue;
    public GameObject electricDue;

    [Header("Game Controllers")]
    public SFXController SFXController;

    public void OnClickNoEvent()
    {
        noEvent.SetActive(true);
        rentDue.SetActive(false);
        phoneDue.SetActive(false);
        electricDue.SetActive(false);

        SFXController.PlayButtonClick();
    }
   public void OnClickRentDue()
    {
        noEvent.SetActive(false);
        rentDue.SetActive(true);
        phoneDue.SetActive(false);
        electricDue.SetActive(false);

        SFXController.PlayButtonClick();
    }

    public void OnClickPhoneDue()
    {
        noEvent.SetActive(false);
        rentDue.SetActive(false);
        phoneDue.SetActive(true);
        electricDue.SetActive(false);

        SFXController.PlayButtonClick();
    }
    public void OnClickElectricDue()
    {
        noEvent.SetActive(false);
        rentDue.SetActive(false);
        phoneDue.SetActive(false);
        electricDue.SetActive(true);

        SFXController.PlayButtonClick();
    }
}
