using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DanielLochner.Assets.SimpleScrollSnap;

public class TabGroup : MonoBehaviour
{
    public SFXController SFXController;

    public List<TabButton> tabButtons;
    public Color tabIdle;
    public Color tabHover;
    public Color tabActive;
    public TabButton selectedTab;
    public List<ScrollRectEx> swappableObjectScrolls;
    public ScrollRectEx selectedScroll;
    public SimpleScrollSnap objectsToSwap;
    public SimpleScrollSnap tabButtonContainer;

    bool scrollUpPressed;
    bool scrollDownPressed;


    public Scrollbar scrollbar;

    private bool inputDetection = false;
    private bool inputFieldInFocus = false;

    public void Start()
    {
        scrollUpPressed = false;
        scrollDownPressed = false;
        selectedTab.background.color = tabActive;
        swappableObjectScrolls = new List<ScrollRectEx>();
        for (int i = 0; i < objectsToSwap.NumberOfPanels; i++)
        {
            swappableObjectScrolls.Add(objectsToSwap.Content.GetChild(i).GetComponent<ScrollRectEx>());
        }
        
    }

    public void Subscribe(TabButton button)
    {
        if (tabButtons == null)
        {
            tabButtons = new List<TabButton>();
        }

        tabButtons.Add(button);
    }

    public void OnTabEnter(TabButton button)
    {
        ResetTabs();
        if (selectedTab == null || button != selectedTab) { 
        button.background.color = tabHover;
        }
    }

    public void OnTabExit(TabButton button)
    {
        ResetTabs();
    }

    public void OnTabSelected(TabButton button)
    {
        if (selectedTab != null)
        {
            selectedTab.Deselect();
        }

        selectedTab = button;

        SFXController.PlayButtonClick();
        selectedTab.Select();

        ResetTabs();
        button.background.color = tabActive;

        int index = button.transform.GetSiblingIndex();
        if (index < objectsToSwap.NumberOfPanels)
        {
            objectsToSwap.GoToPanel(index);
            
        }

        if (!(index < 1 || index > tabButtonContainer.NumberOfPanels -2))
        {
            tabButtonContainer.GoToPanel(index);
        }
        

        /*
         * for(int i =0; i<objectsToSwap.Count; i++)
        {
            if (i == index)
            {
                objectsToSwap[i].SetActive(true);
            }
            else
            {
                objectsToSwap[i].SetActive(false);
            }
        }
        */
    }

    public void ResetTabs()
    {
        foreach(TabButton button in tabButtons)
        {
            if (selectedTab != null && button == selectedTab) { continue; }
            button.background.color = tabIdle;
        }
    }

    public void ResetPanels()
    {
        foreach(ScrollRectEx scroll in swappableObjectScrolls)
        {
            scroll.verticalNormalizedPosition = 1;
        }
    }

    public void OnPanelScroll()
    {        
        int currentPanel = objectsToSwap.CurrentPanel;
        if (currentPanel < tabButtonContainer.NumberOfPanels)
        {
            //objectsToSwap.Content.GetChild(currentPanel).GetComponent<ScrollRectEx>().verticalNormalizedPosition = 1;
            tabButtonContainer.GoToPanel(currentPanel);
            selectedTab = tabButtons[currentPanel];
            selectedScroll = swappableObjectScrolls[currentPanel];
            ResetTabs();
            ResetPanels();
            selectedTab.background.color = tabActive;
        }
    }

    public void UpdateInputFieldFocus(bool inFocus)
    {
        inputFieldInFocus = inFocus;
    }

    public void OnClickScrollUp()
    {
        scrollUpPressed = true;        
    }
    public void OnReleaseScrollUp()
    {
        scrollUpPressed = false;
    }

    public void OnClickScrollDown()
    {
        scrollDownPressed = true;
    }
    public void OnReleaseScrollDown()
    {
        scrollDownPressed = false;
    }

    private void Update()
    {
        
        if(Input.GetAxis("Horizontal") < 0 && !inputFieldInFocus)
        {
            if(selectedTab.transform.GetSiblingIndex() > 0 && !inputDetection)
            {
                OnTabSelected(tabButtons[selectedTab.transform.GetSiblingIndex() - 1]);
            }
            inputDetection = true;
        }
        else if (Input.GetAxis("Horizontal") > 0 && !inputFieldInFocus)
        {

            if (selectedTab.transform.GetSiblingIndex() < (tabButtonContainer.NumberOfPanels - 1) && !inputDetection)
            {
                Debug.Log("Tab Switch?");
                OnTabSelected(tabButtons[selectedTab.transform.GetSiblingIndex() + 1]);
            }
            inputDetection = true;
        }
        else
        {
            inputDetection = false;
        }
        //Debug.Log(1f * Time.deltaTime);
        if (scrollUpPressed && selectedScroll.verticalNormalizedPosition + 1f * Time.deltaTime < 1)
        {
            selectedScroll.verticalNormalizedPosition += 1f * Time.deltaTime;
        }
        else if (scrollDownPressed && selectedScroll.verticalNormalizedPosition - 1f * Time.deltaTime > 0)
        {
            selectedScroll.verticalNormalizedPosition -= 1f * Time.deltaTime;
        }
    }
}
