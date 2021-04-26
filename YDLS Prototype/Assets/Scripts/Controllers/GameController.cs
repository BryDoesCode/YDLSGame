using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;
using TMPro;
using System;
using Febucci.UI;
using UnityEngine.UI.ProceduralImage;

public class GameController : MonoBehaviour
{
    // ------------------ Variables
    // Ink Specific
    [Header("Ink Specific")]
    public TextAsset inkAsset;
    public GameObject choiceButton;
    public TextMeshProUGUI storyText;
    public TextAnimatorPlayer storyTextAnimator;
    public GameObject choiceButtonContainer;
    public TextMeshProUGUI singleChoiceButtonText;
    public GameObject singleChoiceButtonContainer;
    public ProceduralImage singleChoiceButtonImage;
    public GameObject mainTextContainer;
    public TextMeshProUGUI narrativeLogText;

    private Story story;


    // Conversation
    [Header("Conversation")]
    private bool conversationActive = false;        


    // Controllers
    [Header("Controllers")]
    public StatController StatController;
    public SFXController SFXController;
    public MusicController MusicController;
    public LabelController LabelController;
    public InventoryController InventoryController;
    public StoreController StoreController;
    public CharacterCreationController CharacterCreationController;
    public ContactsController ContactsController;
    public BankController BankController;
    public BackgroundController BackgroundController;
    public LoadingScreenController LoadingScreenController;
    public UIUnlockController UIUnlockController;
    public ConversationController ConversationController;
    public SettingsController SettingsController;

    //Variables
    List<string> ingredientsCostList;
    private string narrativeLog = "";

    void Start()
    {
        // Use to fully reset player prefs during testing. 
        /*
        #if UNITY_EDITOR
        PlayerPrefs.DeleteAll();
        Debug.Log("Prefs Deleted");
        #endif
          */    

        story = new Story(inkAsset.text);

        #region Observable Variables
        // ------------------ Observeable Variables
        // Stats
        story.ObserveVariable("energy", (string varName, object newValue) => {
            StatController.UpdateEnergyStat((int)newValue);
        });
        story.ObserveVariable("health", (string varName, object newValue) => {
            StatController.UpdateHealthStat((int)newValue);
        });
        story.ObserveVariable("wellness", (string varName, object newValue) => {
            StatController.UpdateWellnessStat((int)newValue);
        });
        story.ObserveVariable("needMax", (string varName, object newValue) => { 
            StatController.UpdateNeedMax((int)newValue); 
        });

        // Date / UI Stuff
        story.ObserveVariable("fullDate", (string varName, object newValue) => {
            LabelController.UpdateDate((string)newValue);
        });
        story.ObserveVariable("today", (string varName, object newValue) => {
            LabelController.UpdateWeekday(newValue);
        });
        story.ObserveVariable("time", (string varName, object newValue) => {
            LabelController.UpdateTimeSlot(newValue, conversationActive);
        });
        story.ObserveVariable("location", (string varName, object newValue) => {
            LabelController.UpdateLocation((string)newValue, conversationActive);
        });
        story.ObserveVariable("background", (string varName, object newValue) => {
            LabelController.UpdateBackground((string)newValue);
        });
        /*story.ObserveVariable("locationColor", (string varName, object newValue) => {
            LabelController.UpdateContainerColor((string)newValue);
        });*/

        // Audio
        story.ObserveVariable("locationMusic", (string varName, object newValue) => {
            MusicController.MusicPlayer((string)newValue);
        });

        // Inventory
        
        story.ObserveVariable("prepackagedMealCount", (string varName, object newValue) => {
            InventoryController.UpdatePrepackagedFoodQuantity((int)newValue);
        });
        story.ObserveVariable("foodIngredientsCount", (string varName, object newValue) => {
            InventoryController.UpdateIngredientsSet((int)newValue);
        });
        story.ObserveVariable("newspaperCount", (string varName, object newValue) => {
            InventoryController.UpdateNewspaperQuantity((int)newValue);
        });

        // Banking
        story.ObserveVariable("money", (string varName, object newValue) => {
            BankController.UpdateBalance((float)newValue);
        });
        story.ObserveVariable("interestRate", (string varName, object newValue) => {
            BankController.UpdateInterestRate((float)newValue);
        });
        story.ObserveVariable("earnedInterest", (string varName, object newValue) => {
            BankController.UpdateEarnedInterest((float)newValue);
        });

        story.ObserveVariable("rentBill", (string varName, object newValue) => {
            BankController.UpdateRentBill((float)newValue, story.variablesState["rentBillDueDate"].ToString());
        });
        story.ObserveVariable("electricBill", (string varName, object newValue) => {
            BankController.UpdateElectricBill((float)newValue, story.variablesState["electricBillDueDate"].ToString());
        });
        story.ObserveVariable("phoneBill", (string varName, object newValue) => {
            BankController.UpdatePhoneBill((float)newValue, story.variablesState["phoneBillDueDate"].ToString());
        });

        // Store
        ingredientsCostList = new List<string> { "costPrepackagedMeal", "costFoodIngredients", "costNewspaper" };
        story.ObserveVariable("storePrompt", (string varName, object newValue) => {
            StoreController.StoreState((int)newValue);
                });
        story.ObserveVariable("purchaseResponse", (string varName, object newValue) => {
            StoreController.UpdatePurchaseResponse((string)newValue);
                });
        story.ObserveVariables(ingredientsCostList, (string varName, object newValue) =>
        {
            StoreController.UpdatePrices(varName, float.Parse(newValue.ToString()));
        });
        
        // Conversation
             story.ObserveVariable("conversationActive", (string varName, object newValue) => {
                 SetConversationActive((int)newValue);
             });
        story.ObserveVariable("conversationFocus", (string varName, object newValue) => {
            ConversationController.ConversationFocusToggle(newValue.ToString());
            });
        story.ObserveVariable("activeNPCID", (string varName, object newValue) => {
            ConversationController.ShowConversation(conversationActive, (int)newValue);
        });

        // Mother NPC
        story.ObserveVariable("motherRelationshipWithPlayer", (string varName, object newValue) => {
            ContactsController.UpdateRelationship((int)newValue, 0);
        });
        story.ObserveVariable("motherKnowsPlayer", (string varName, object newValue) => {
            ContactsController.UpdateKnowingPlayer((int)newValue, 0);
        });

        // Father NPC
        story.ObserveVariable("fatherRelationshipWithPlayer", (string varName, object newValue) => {
            ContactsController.UpdateRelationship((int)newValue, 1);
        });
        story.ObserveVariable("fatherKnowsPlayer", (string varName, object newValue) => {
            ContactsController.UpdateKnowingPlayer((int)newValue, 1);
        });

        // Coworker NPC
        story.ObserveVariable("coworkerRelationshipWithPlayer", (string varName, object newValue) => {
            ContactsController.UpdateRelationship((int)newValue, 2);
        });
        story.ObserveVariable("coworkerKnowsPlayer", (string varName, object newValue) => {
            ContactsController.UpdateKnowingPlayer((int)newValue, 2);
        });

        // Loading Screen
        story.ObserveVariable("loadingAnimation", (string varName, object newValue) => {
            LoadingScreenController.ChangeLoadingImage(newValue.ToString());
            });
        story.ObserveVariable("startLoadingAnimation", (string varName, object newValue) => {
            LoadingScreenController.PlayLoadingAnimation((int)newValue);
        });

        // UI Toggle
        story.ObserveVariable("showInventoryButton", (string varName, object newValue) => {
            UIUnlockController.ShowInventoryButton((int)newValue);
        });
        story.ObserveVariable("showContactsButton", (string varName, object newValue) => {
            UIUnlockController.ShowContactsButton((int)newValue);
        });
        story.ObserveVariable("showNeedsButton", (string varName, object newValue) => {
            UIUnlockController.ShowNeedsButton((int)newValue);
        });
        story.ObserveVariable("showBankingButton", (string varName, object newValue) => {
            UIUnlockController.ShowBankingButton((int)newValue);
        });
        story.ObserveVariable("showCalendarButton", (string varName, object newValue) => {
            UIUnlockController.ShowCalendarButton((int)newValue);
        });
        story.ObserveVariable("showEnergySlider", (string varName, object newValue) => {
            UIUnlockController.ShowEnergySlider((int)newValue);
        });
        story.ObserveVariable("showHealthSlider", (string varName, object newValue) => {
            UIUnlockController.ShowHealthSlider((int)newValue);
        });
        story.ObserveVariable("showWellnessSlider", (string varName, object newValue) => {
            UIUnlockController.ShowWellnessSlider((int)newValue);
        });
        story.ObserveVariable("showSignNameContainer", (string varName, object newValue) => {
            CharacterCreationController.ShowSignNameContainer((int)newValue);
        });
        story.ObserveVariable("showCharacterCreationContainer", (string varName, object newValue) => {
            CharacterCreationController.ShowCharacterCreationContainer((int)newValue);
        });
        story.ObserveVariable("showRentBill", (string varName, object newValue) => {
            BankController.ShowRentBill((int)newValue);
        });
        story.ObserveVariable("showElectricBill", (string varName, object newValue) => {
            BankController.ShowElectricBill((int)newValue);
        });
        story.ObserveVariable("showPhoneBill", (string varName, object newValue) => {
            BankController.ShowPhoneBill((int)newValue);
        });
        #endregion

        //  ------------------ External Functions
        story.BindExternalFunction("EndGame", () => EndGame());
        story.BindExternalFunction("UpdateNPCs", () => UpdateNPCs());
        story.BindExternalFunction("AddTransaction", (string date, string desc, float amount, float transactionBalance) => BankController.AddTransaction(date, desc, amount, transactionBalance));
        
        if (PlayerPrefs.HasKey("inkSaveState"))
        {
            string savedState = PlayerPrefs.GetString("inkSaveState");
            story.state.LoadJson(savedState);
            
            if ((int)story.variablesState["characterCreationCompleted"] == 1)
            {                
                CharacterCreationController.LoadPlayerFromInk(story.variablesState["firstName"].ToString(), story.variablesState["lastName"].ToString(),
                (int)story.variablesState["face"], (int)story.variablesState["ear"], (int)story.variablesState["body"], (int)story.variablesState["skinColor"],
                (int)story.variablesState["hairFront"], (int)story.variablesState["hairBack"], (int)story.variablesState["hairBase"], (int)story.variablesState["hairSideLeft"], (int)story.variablesState["hairSideRight"], (int)story.variablesState["hairColor"],
                (int)story.variablesState["hijab"], (int)story.variablesState["hijabColor"],
                (int)story.variablesState["eyes"], (int)story.variablesState["rightEyeColor"], (int)story.variablesState["leftEyeColor"],
                (int)story.variablesState["eyebrow"], (int)story.variablesState["eyebrowColor"], (int)story.variablesState["nose"],
                (int)story.variablesState["mouth"], (int)story.variablesState["mouthColor"], 
                (int)story.variablesState["mustache"], (int)story.variablesState["mustacheColor"], (int)story.variablesState["beard"], (int)story.variablesState["beardColor"],
                (int)story.variablesState["freckles"], (int)story.variablesState["moles"],
                (int)story.variablesState["glasses"], (int)story.variablesState["glassesColor"], (int)story.variablesState["glassesLensColor"],
                (int)story.variablesState["earring"], (int)story.variablesState["earringColor"],
                (int)story.variablesState["nosePiercing"], (int)story.variablesState["nosePiercingColor"],
                (int)story.variablesState["eyebrowPiercing"], (int)story.variablesState["eyebrowPiercingColor"],
                (int)story.variablesState["mouthPiercing"], (int)story.variablesState["mouthPiercingColor"],
                (int)story.variablesState["clothing"], (int)story.variablesState["clothingColor"], (int)story.variablesState["clothingExtraColor"]);
                UpdateNPCs();
            }
        }
        //else { StoryLoop(); }

    }

    public void StoryLoop()
    {
        ClearUI();
        storyText.text = GetNextStoryBlock();
        
        //Debug.Log(narrativeLog);

        if (story.currentTags.Count > 0)
        {
            foreach (string tag in story.currentTags)
            {
                Debug.Log("Current Tags: " + tag);
                EvaluateTag(tag);
            }
        }
        //Debug.Log("Choices" + story.currentChoices.Count);

        if (story.currentChoices.Count > 1)
        {
            foreach (Choice choice in story.currentChoices)
            {
                GameObject choiceSelectionButton;                           

                choiceSelectionButton = Instantiate(choiceButton) as GameObject;

                choiceSelectionButton.transform.SetParent(choiceButtonContainer.transform, false);
                    

                TextMeshProUGUI choiceText = choiceSelectionButton.GetComponentInChildren<TextMeshProUGUI>();
                    

                choiceText.text = choice.text.Replace("\\n", "\n"); // Allows for newlines during choices.
                //choiceText.gameObject.GetComponentInParent<ProceduralImage>(true).color = BackgroundController.CurrentColor;

                choiceSelectionButton.GetComponentInChildren<Button>().onClick.AddListener(delegate { OnClickChoiceButton(choice); });
                choiceButtonContainer.SetActive(true);
                mainTextContainer.SetActive(false);
            }

        }
        else
        {
            foreach (Choice choice in story.currentChoices)
            {
                //Debug.Log("Choice Name: " + choice.text);
                singleChoiceButtonText.text = choice.text.Replace("\\n", "\n");
                //singleChoiceButtonImage.color = BackgroundController.CurrentColor;
            }
        }

    }

    void ClearUI()
    {
        int childCount = 0;
        
            childCount = choiceButtonContainer.transform.childCount;
            for (int i = childCount - 1; i >= 0; --i)
            {
                GameObject.Destroy(choiceButtonContainer.transform.GetChild(i).gameObject);
            }
        
        singleChoiceButtonContainer.SetActive(false);
    }

    string GetNextStoryBlock()
    {
        PlayerPrefs.SetString("NarrativeLog", narrativeLog);
        narrativeLogText.text = narrativeLog;

        string text = "";
        if (story.canContinue)
        {
            text = story.ContinueMaximally().Replace("\\n", "\n");
            if (text.Length > 0)
            {
                narrativeLog += (text + "\n");
            }
        }

        return text;
    }

    void EvaluateTag(string tag)
    {
        if (tag.Contains("SFX"))
        {
            SFXController.SFXPlayer(tag);
        }
    }

    public void ShowContinueButton()
    {
        singleChoiceButtonContainer.SetActive(true);
    }

    void OnClickChoiceButton(Choice choice)
    {
        SFXController.PlayButtonClick();

        story.ChooseChoiceIndex(choice.index);
        narrativeLog += (choice.text.Replace("\\n", "\n") + "\n\n");
        choiceButtonContainer.SetActive(false);
        mainTextContainer.SetActive(true);
        SaveStoryState();
        StoryLoop(); 
    }

    public void OnClickContinueButton()
    {
        SFXController.PlayButtonClick();

        if (story.currentChoices.Count > 1)
            {
                choiceButtonContainer.SetActive(true);
                mainTextContainer.SetActive(false);
            }
            else
            {
                story.ChooseChoiceIndex(0);
                SaveStoryState();
                StoryLoop();
            }              
    }

    public void SaveStoryState()
    {        
        string savedState = story.state.ToJson();
        PlayerPrefs.SetString("inkSaveState", savedState);
        PlayerPrefs.Save();
        //Debug.Log("Story Saved");
        BankController.SaveTransactionList();
        //Debug.Log("Transactions Saved");
        BankController.SaveBills();
        //Debug.Log("Bills Saved");
        Debug.Log("Save Successful.");
    }

    public void ResetStoryState()
    {

        PlayerPrefs.DeleteKey("inkSaveState");
        //Debug.Log("Ink Save State Deleted");

        if (PlayerPrefs.HasKey("NarrativeLog"))
        {
            PlayerPrefs.DeleteKey("NarrativeLog");            
        }
        narrativeLog = "";

        for (int i = 0; PlayerPrefs.HasKey("transaction" + i); i++)
        {
            PlayerPrefs.DeleteKey("transaction" + i);
            //Debug.Log("Deleted Transaction Key: " + i);
        }
        BankController.ClearTransactions();
        //Debug.Log("Transactions List Cleared");

        // Delete Bills
        if (PlayerPrefs.HasKey("rentBill")) 
        {
            PlayerPrefs.DeleteKey("rentBill");
        }
        if (PlayerPrefs.HasKey("phoneBill"))
        {
            PlayerPrefs.DeleteKey("phoneBill");
        }
        if (PlayerPrefs.HasKey("electricBill"))
        {
            PlayerPrefs.DeleteKey("electricBill");
        }
        Debug.Log("Bill Prefs Deleted");

        // Delete Saved Names
        if (PlayerPrefs.HasKey("firstName"))
        {
            PlayerPrefs.DeleteKey("firstName");
        }
        if (PlayerPrefs.HasKey("lastName"))
        {
            PlayerPrefs.DeleteKey("lastName");
        }

        story.ResetState();
        Debug.Log("Ink Story State Reset");
        if (PlayerPrefs.HasKey("StatToggle")) 
        {
            CallInkStatHintFunction(PlayerPrefs.GetInt("StatToggle"));
            Debug.Log("Stat Toggle Updated");
        }
        //StoryLoop();
    }

    public void OnClickSkipTypewriter()
    {
        storyTextAnimator.SkipTypewriter();

        if(singleChoiceButtonContainer.activeInHierarchy)
        {
            OnClickContinueButton();
        }
    }

    void SetConversationActive(int value)
    {
        if (value == 1)
        {
            conversationActive = true;
        }
        else
        {
            conversationActive = false;
        }
    }

    public void CallInkFunction(string functionName)
    {
        story.EvaluateFunction(functionName);
    }

    public bool CallInkPurchaseFunction(int prepackagedQuantity, int ingredientsQuantity, int newspaperQuantity)
    {
        if ((int)story.EvaluateFunction("PurchaseItems", prepackagedQuantity, ingredientsQuantity, newspaperQuantity) == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public bool CallInkPayBillFunction (string billName)
    {
        if ((int)story.EvaluateFunction("PayBill", billName) == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public void CallInkStatHintFunction (int state)
    {
        story.EvaluateFunction("StatHintToggle", state);
    }

    public void UpdateNPCs()
    {
        // Mother
        CharacterCreationController.CreatePerson(story.variablesState["motherFirstName"].ToString(), story.variablesState["motherLastName"].ToString(),
            (int)story.variablesState["motherFace"], (int)story.variablesState["motherEar"], (int)story.variablesState["motherBody"], (int)story.variablesState["motherSkinColor"],
                (int)story.variablesState["motherHairFront"], (int)story.variablesState["motherHairBack"], (int)story.variablesState["motherHairBase"],
                (int)story.variablesState["motherHairSideLeft"], (int)story.variablesState["motherHairSideRight"], (int)story.variablesState["motherHairColor"],
                (int)story.variablesState["motherHijab"], (int)story.variablesState["motherHijabColor"],
                (int)story.variablesState["motherEyes"], (int)story.variablesState["motherRightEyeColor"], (int)story.variablesState["motherLeftEyeColor"],
                (int)story.variablesState["motherEyebrow"], (int)story.variablesState["motherEyebrowColor"], (int)story.variablesState["motherNose"],
                (int)story.variablesState["motherMouth"], (int)story.variablesState["motherMouthColor"],
                (int)story.variablesState["motherMustache"], (int)story.variablesState["motherMustacheColor"], (int)story.variablesState["motherBeard"], (int)story.variablesState["motherBeardColor"],
                (int)story.variablesState["motherFreckles"], (int)story.variablesState["motherMoles"],
                (int)story.variablesState["motherGlasses"], (int)story.variablesState["motherGlassesColor"], (int)story.variablesState["motherGlassesLensColor"],
                (int)story.variablesState["motherEarring"], (int)story.variablesState["motherEarringColor"],
                (int)story.variablesState["motherNosePiercing"], (int)story.variablesState["motherNosePiercingColor"],
                (int)story.variablesState["motherEyebrowPiercing"], (int)story.variablesState["motherEyebrowPiercingColor"],
                (int)story.variablesState["motherMouthPiercing"], (int)story.variablesState["motherMouthPiercingColor"],
                (int)story.variablesState["motherClothing"], (int)story.variablesState["motherClothingColor"], (int)story.variablesState["motherClothingExtraColor"],
            (int)story.variablesState["motherRelationshipWithPlayer"], (int)story.variablesState["motherKnowsPlayer"], (int)story.variablesState["motherIndexID"]);

        // Father
        CharacterCreationController.CreatePerson(story.variablesState["fatherFirstName"].ToString(), story.variablesState["fatherLastName"].ToString(),
            (int)story.variablesState["fatherFace"], (int)story.variablesState["fatherEar"], (int)story.variablesState["fatherBody"], (int)story.variablesState["fatherSkinColor"],
                (int)story.variablesState["fatherHairFront"], (int)story.variablesState["fatherHairBack"], (int)story.variablesState["fatherHairBase"],
                (int)story.variablesState["fatherHairSideLeft"], (int)story.variablesState["fatherHairSideRight"], (int)story.variablesState["fatherHairColor"],
                (int)story.variablesState["fatherHijab"], (int)story.variablesState["fatherHijabColor"],
                (int)story.variablesState["fatherEyes"], (int)story.variablesState["fatherRightEyeColor"], (int)story.variablesState["fatherLeftEyeColor"],
                (int)story.variablesState["fatherEyebrow"], (int)story.variablesState["fatherEyebrowColor"], (int)story.variablesState["fatherNose"],
                (int)story.variablesState["fatherMouth"], (int)story.variablesState["fatherMouthColor"],
                (int)story.variablesState["fatherMustache"], (int)story.variablesState["fatherMustacheColor"], (int)story.variablesState["fatherBeard"], (int)story.variablesState["fatherBeardColor"],
                (int)story.variablesState["fatherFreckles"], (int)story.variablesState["fatherMoles"],
                (int)story.variablesState["fatherGlasses"], (int)story.variablesState["fatherGlassesColor"], (int)story.variablesState["fatherGlassesLensColor"],
                (int)story.variablesState["fatherEarring"], (int)story.variablesState["fatherEarringColor"],
                (int)story.variablesState["fatherNosePiercing"], (int)story.variablesState["fatherNosePiercingColor"],
                (int)story.variablesState["fatherEyebrowPiercing"], (int)story.variablesState["fatherEyebrowPiercingColor"],
                (int)story.variablesState["fatherMouthPiercing"], (int)story.variablesState["fatherMouthPiercingColor"],
                (int)story.variablesState["fatherClothing"], (int)story.variablesState["fatherClothingColor"], (int)story.variablesState["fatherClothingExtraColor"],
            (int)story.variablesState["fatherRelationshipWithPlayer"], (int)story.variablesState["fatherKnowsPlayer"], (int)story.variablesState["fatherIndexID"]);

        // Coworker
        CharacterCreationController.CreatePerson(story.variablesState["coworkerFirstName"].ToString(), story.variablesState["coworkerLastName"].ToString(),
            (int)story.variablesState["coworkerFace"], (int)story.variablesState["coworkerEar"], (int)story.variablesState["coworkerBody"], (int)story.variablesState["coworkerSkinColor"],
                (int)story.variablesState["coworkerHairFront"], (int)story.variablesState["coworkerHairBack"], (int)story.variablesState["coworkerHairBase"], 
                (int)story.variablesState["coworkerHairSideLeft"], (int)story.variablesState["coworkerHairSideRight"], (int)story.variablesState["coworkerHairColor"],
                (int)story.variablesState["coworkerHijab"], (int)story.variablesState["coworkerHijabColor"],
                (int)story.variablesState["coworkerEyes"], (int)story.variablesState["coworkerRightEyeColor"], (int)story.variablesState["coworkerLeftEyeColor"],
                (int)story.variablesState["coworkerEyebrow"], (int)story.variablesState["coworkerEyebrowColor"], (int)story.variablesState["coworkerNose"],
                (int)story.variablesState["coworkerMouth"], (int)story.variablesState["coworkerMouthColor"],
                (int)story.variablesState["coworkerMustache"], (int)story.variablesState["coworkerMustacheColor"], (int)story.variablesState["coworkerBeard"], (int)story.variablesState["coworkerBeardColor"],
                (int)story.variablesState["coworkerFreckles"], (int)story.variablesState["coworkerMoles"],
                (int)story.variablesState["coworkerGlasses"], (int)story.variablesState["coworkerGlassesColor"], (int)story.variablesState["coworkerGlassesLensColor"],
                (int)story.variablesState["coworkerEarring"], (int)story.variablesState["coworkerEarringColor"],
                (int)story.variablesState["coworkerNosePiercing"], (int)story.variablesState["coworkerNosePiercingColor"],
                (int)story.variablesState["coworkerEyebrowPiercing"], (int)story.variablesState["coworkerEyebrowPiercingColor"],
                (int)story.variablesState["coworkerMouthPiercing"], (int)story.variablesState["coworkerMouthPiercingColor"],
                (int)story.variablesState["coworkerClothing"], (int)story.variablesState["coworkerClothingColor"], (int)story.variablesState["coworkerClothingExtraColor"],
            (int)story.variablesState["coworkerRelationshipWithPlayer"], (int)story.variablesState["coworkerKnowsPlayer"], (int)story.variablesState["coworkerIndexID"]);

        // Manager
        CharacterCreationController.CreatePerson(story.variablesState["managerFirstName"].ToString(), story.variablesState["managerLastName"].ToString(),
            (int)story.variablesState["managerFace"], (int)story.variablesState["managerEar"], (int)story.variablesState["managerBody"], (int)story.variablesState["managerSkinColor"],
                (int)story.variablesState["managerHairFront"], (int)story.variablesState["managerHairBack"], (int)story.variablesState["managerHairBase"],
                (int)story.variablesState["managerHairSideLeft"], (int)story.variablesState["managerHairSideRight"], (int)story.variablesState["managerHairColor"],
                (int)story.variablesState["managerHijab"], (int)story.variablesState["managerHijabColor"],
                (int)story.variablesState["managerEyes"], (int)story.variablesState["managerRightEyeColor"], (int)story.variablesState["managerLeftEyeColor"],
                (int)story.variablesState["managerEyebrow"], (int)story.variablesState["managerEyebrowColor"], (int)story.variablesState["managerNose"],
                (int)story.variablesState["managerMouth"], (int)story.variablesState["managerMouthColor"],
                (int)story.variablesState["managerMustache"], (int)story.variablesState["managerMustacheColor"], (int)story.variablesState["managerBeard"], (int)story.variablesState["managerBeardColor"],
                (int)story.variablesState["managerFreckles"], (int)story.variablesState["managerMoles"],
                (int)story.variablesState["managerGlasses"], (int)story.variablesState["managerGlassesColor"], (int)story.variablesState["managerGlassesLensColor"],
                (int)story.variablesState["managerEarring"], (int)story.variablesState["managerEarringColor"],
                (int)story.variablesState["managerNosePiercing"], (int)story.variablesState["managerNosePiercingColor"],
                (int)story.variablesState["managerEyebrowPiercing"], (int)story.variablesState["managerEyebrowPiercingColor"],
                (int)story.variablesState["managerMouthPiercing"], (int)story.variablesState["managerMouthPiercingColor"],
                (int)story.variablesState["managerClothing"], (int)story.variablesState["managerClothingColor"], (int)story.variablesState["managerClothingExtraColor"],
            (int)story.variablesState["managerRelationshipWithPlayer"], (int)story.variablesState["managerKnowsPlayer"], (int)story.variablesState["managerIndexID"]);
    }

    public void UpdatePlayerInformation(string firstName, string lastName, int face, int ear, int body, int skinColor,
        int hairFront, int hairBack, int hairBase, int hairSideLeft, int hairSideRight, int hairColor, int eyes, int rightEyeColor, int leftEyeColor,
        int eyebrow, int eyebrowColor, int hijab, int hijabColor, int nose, int mouth, int mouthColor, int mustache, int mustacheColor, 
        int beard, int beardColor, int freckles, int moles, int glasses, int glassesColor, int glassesLensColor, 
        int earring, int earringColor, int nosePiercing, int nosePiercingColor, int eyebrowPiercing, int eyebrowPiercingColor,
        int mouthPiercing, int mouthPiercingColor,
        int clothing, int clothingColor, int clothingExtraColor)
    {
        story.EvaluateFunction("CreatePlayerCharacter", firstName, lastName, face, ear, body, skinColor, 
            hairFront, hairBack, hairBase, hairSideLeft, hairSideRight, hairColor, eyes, rightEyeColor, leftEyeColor,
            eyebrow, eyebrowColor, hijab, hijabColor, nose, mouth, mouthColor, mustache, mustacheColor, beard, beardColor,
            freckles, moles, glasses, glassesColor, glassesLensColor, earring, earringColor, nosePiercing, nosePiercingColor, eyebrowPiercing, eyebrowPiercingColor,
            mouthPiercing, mouthPiercingColor, clothing, clothingColor, clothingExtraColor);        
    }

    public void UpdateLoadedVariables()
    {
        // Stats
        StatController.UpdateNeedMax((int)story.variablesState["needMax"]);
        StatController.UpdateEnergyStat((int)story.variablesState["energy"]);
        StatController.UpdateHealthStat((int)story.variablesState["health"]);
        StatController.UpdateWellnessStat((int)story.variablesState["wellness"]);

        // Conversation
        SetConversationActive((int)story.variablesState["conversationActive"]);
        ConversationController.ConversationFocusToggle(story.variablesState["conversationFocus"].ToString());
        ConversationController.ShowConversation(conversationActive, (int)story.variablesState["activeNPCID"]);

        // Date/UI Stuff
        LabelController.UpdateDate(story.variablesState["fullDate"].ToString());
        LabelController.UpdateWeekday(story.variablesState["today"].ToString());
        LabelController.UpdateTimeSlot(story.variablesState["time"].ToString(), conversationActive);
        LabelController.UpdateLocation(story.variablesState["location"].ToString(), conversationActive);
        LabelController.UpdateBackground(story.variablesState["background"].ToString());
        //LabelController.UpdateContainerColor(story.variablesState["locationColor"].ToString());

        UIUnlockController.ShowInventoryButton((int)story.variablesState["showInventoryButton"]);
        UIUnlockController.ShowContactsButton((int)story.variablesState["showContactsButton"]);
        UIUnlockController.ShowNeedsButton((int)story.variablesState["showNeedsButton"]);
        UIUnlockController.ShowBankingButton((int)story.variablesState["showBankingButton"]);
        UIUnlockController.ShowCalendarButton((int)story.variablesState["showCalendarButton"]);
        UIUnlockController.ShowEnergySlider((int)story.variablesState["showEnergySlider"]);
        UIUnlockController.ShowHealthSlider((int)story.variablesState["showHealthSlider"]);
        UIUnlockController.ShowWellnessSlider((int)story.variablesState["showWellnessSlider"]);
        CharacterCreationController.ShowSignNameContainer((int)story.variablesState["showSignNameContainer"]);
        CharacterCreationController.ShowCharacterCreationContainer((int)story.variablesState["showCharacterCreationContainer"]);


        // Inventory
        InventoryController.UpdatePrepackagedFoodQuantity((int)story.variablesState["prepackagedMealCount"]);
        InventoryController.UpdateIngredientsSet((int)story.variablesState["foodIngredientsCount"]);
        InventoryController.UpdateNewspaperQuantity((int)story.variablesState["newspaperCount"]);

        // Store
        StoreController.StoreState((int)story.variablesState["storePrompt"]);
        foreach (string cost in ingredientsCostList)
        {
            StoreController.UpdatePrices(cost, (float)(story.variablesState[cost]));
        }

        // Music
        MusicController.MusicPlayer(story.variablesState["locationMusic"].ToString());

        // Banking
        BankController.UpdateBalance((float)story.variablesState["money"]);
        BankController.UpdateEarnedInterest((float)story.variablesState["earnedInterest"]);

        BankController.ShowRentBill((int)story.variablesState["showRentBill"]);
        BankController.ShowElectricBill((int)story.variablesState["showElectricBill"]);
        BankController.ShowPhoneBill((int)story.variablesState["showPhoneBill"]);

        BankController.UpdateElectricBill((float)story.variablesState["electricBill"], story.variablesState["electricBillDueDate"].ToString());
        BankController.UpdateRentBill((float)story.variablesState["rentBill"], story.variablesState["rentBillDueDate"].ToString());
        BankController.UpdatePhoneBill((float)story.variablesState["phoneBill"], story.variablesState["phoneBillDueDate"].ToString());
        BankController.LoadTransactions();
        BankController.LoadBills();

        // Settings
        SettingsController.UpdateStatToggle((int)story.variablesState["statHints"]);

        if (PlayerPrefs.HasKey("NarrativeLog"))
        {
            narrativeLog = PlayerPrefs.GetString("NarrativeLog");
            narrativeLogText.text = narrativeLog;
        }
    }

    public void AddNarrativeLogLabel(string label)
    {
        narrativeLog += "<b>" + label + "</b> \n\n";
    }

    public void NarrativeLogNewDay()
    {
        narrativeLog = "";
    }

    void EndGame()
    {
        Debug.Log("QUIT");
        Application.Quit();
    }
}
