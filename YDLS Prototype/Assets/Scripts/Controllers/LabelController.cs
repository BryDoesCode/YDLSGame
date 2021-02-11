using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using System;

public class LabelController : MonoBehaviour
{
    public BackgroundController BackgroundController;

    //public TextMeshProUGUI timeLabel;
    //public TextMeshProUGUI locationLabel;
    //public TextMeshProUGUI dateLabel;
    //public TextMeshProUGUI dayLabel;
    public TextMeshProUGUI topText;
    public TextMeshProUGUI labelText;

    private string date;
    private string day;
    private string time;
    private string location;
    //private string background;

    public void UpdateDate(string date)
    {
        //dateLabel.text = "<b>" + date + "</b>";
        this.date = date;
        UpdateTopText();
    }

    public void UpdateWeekday(object day)
    {
        //dayLabel.text = "<b>" + day + "</b>";
        //Debug.Log("Day: " + day);
        this.day = day.ToString();
        UpdateTopText();
    }

    public void UpdateTimeSlot(object time, bool conversationActive)
    {
        //timeLabel.text = "<b>" + time + "</b>";
        this.time = time.ToString();
        UpdateLabelText(conversationActive);
    }

    public void UpdateLocation(string location, bool conversationActive)
    {
        this.location = location;
        //locationLabel.text = "<b>" + location + "</b>";
        UpdateLabelText(conversationActive);
    }

    private void UpdateTopText()
    {
        //topText.text = date + " - " + day + " - " + time + " - " + location;
        topText.text = date + " - " + day;
    }

    private void UpdateLabelText(bool conversationActive)
    {
        //Debug.Log("<b>Conversation Active: </b>" + conversationActive);
        //Debug.Log("Location / Time: " + location + " - " + time);
        if (!conversationActive)
        {
            labelText.text = location + " - " + time;
        }
        else
        {
            labelText.text = location;
        }
    }

    public void UpdateBackground(string background)
    {
        BackgroundController.ChangeBackgroundImage(background);
    }
    public void UpdateContainerColor(string color)
    {
        BackgroundController.ChangeContainerColor(color);
    }
}
