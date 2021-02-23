using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class CharacterCreationController : MonoBehaviour
{
    public GameObject characterAvatar;

    public TabGroup characterCreationTabGroup;

    public List<Person> Characters;

    [Header("Selection Boxes")]
    public TMP_Dropdown pronounSelected;

    [Header("Text Boxes")]
    public TMP_InputField firstName;
    public TMP_InputField lastName;
    public TextMeshProUGUI firstNameLabel;
    public TextMeshProUGUI lastNameLabel;

    [Header("GameObjects")]
    public GameObject avatarContainer;
    public TextMeshProUGUI nameLabel;
    public GameObject playerPortraitContainer;
    public GameObject playerPortraitOverlay;
    public GameObject NPCPortraitContainer;
    public GameObject characterCreationContainer;
    public GameObject signNameContainer;
    public GameObject mainTextContainer;
    public GameController GameController;
    public ContactsController ContactsController;
    public ConversationController ConversationController;

    [Header("Creation Controllers")]
    public CharacterCreationGroup FaceController;
    public CharacterCreationGroup EarController;
    public CharacterCreationGroup BodyController;
    public CharacterCreationGroup SkinColorController;

    public CharacterCreationGroup HairFrontController;
    public CharacterCreationGroup HairBackController;
    public CharacterCreationGroup HairBaseController;
    public CharacterCreationGroup HairSideLeftController;
    public CharacterCreationGroup HairSideRightController;
    public CharacterCreationGroup HairColorController;

    public CharacterCreationGroup EyesController;
    public CharacterCreationGroup RightEyeColorController;
    public CharacterCreationGroup LeftEyeColorController;

    public CharacterCreationGroup EyebrowController;
    public CharacterCreationGroup EyebrowColorController;

    public CharacterCreationGroup NoseController;

    public CharacterCreationGroup MouthController;
    public CharacterCreationGroup MouthColorController;

    public CharacterCreationGroup ClothingController;
    public CharacterCreationGroup ClothingColorController;


    private void Start()
    {
        if (Characters == null)
        {
            Characters = new List<Person>();
        }

    }


    public void Update()
    {
        if (firstName.isFocused || lastName.isFocused)
        {
            characterCreationTabGroup.UpdateInputFieldFocus(true);
        }
        else
        {
            characterCreationTabGroup.UpdateInputFieldFocus(false);
        }
        
    }

    public void ContinueToGame()
    {
        string savedFirstName = "";
        string savedLastName = "";
            
        if(PlayerPrefs.HasKey("firstName"))
        {
            savedFirstName = PlayerPrefs.GetString("firstName");
        }
        else
        {
            savedFirstName = firstName.text;
        }
        if (PlayerPrefs.HasKey("lastName"))
        {
            savedLastName = PlayerPrefs.GetString("lastName");
        }
        else
        {
            savedLastName = lastName.text;
        }
        // Update info in Ink
        GameController.UpdatePlayerInformation(savedFirstName, savedLastName, 
            FaceController.selectedButtonIndex, EarController.selectedButtonIndex, BodyController.selectedButtonIndex, SkinColorController.selectedButtonIndex,
            HairFrontController.selectedButtonIndex, HairBackController.selectedButtonIndex, HairBaseController.selectedButtonIndex, 
            HairSideLeftController.selectedButtonIndex, HairSideRightController.selectedButtonIndex, HairColorController.selectedButtonIndex, 
            EyesController.selectedButtonIndex, RightEyeColorController.selectedButtonIndex, LeftEyeColorController.selectedButtonIndex,
            EyebrowController.selectedButtonIndex, EyebrowColorController.selectedButtonIndex, NoseController.selectedButtonIndex,
            MouthController.selectedButtonIndex, MouthColorController.selectedButtonIndex, ClothingController.selectedButtonIndex, ClothingColorController.selectedButtonIndex);

        CreatePlayer(savedFirstName, savedLastName);

        characterCreationContainer.SetActive(false);
        GameController.OnClickContinueButton();
        
    }

    public void ShowCharacterCreationContainer(int value)
    {
        if (value == 1)
        {
            characterCreationContainer.SetActive(true);
        }
        else
        {
            characterCreationContainer.SetActive(false);
        }
    }
    public void ShowSignNameContainer(int value)
    {
        if (value == 1)
        {
            signNameContainer.SetActive(true);
            mainTextContainer.SetActive(false);
        }
        else
        {
            signNameContainer.SetActive(false);
            mainTextContainer.SetActive(true);
        }
    }

    public void SignName()
    {
        if (firstName.text.Length != 0 && lastName.text.Length != 0)
        {
            ShowSignNameContainer(0);
            GameController.OnClickContinueButton();
            PlayerPrefs.SetString("firstName", firstName.text);
            PlayerPrefs.SetString("lastName", lastName.text);
        }

        if (firstName.text.Length <= 0)
        {
            firstNameLabel.color = Color.red;
        }

        if (lastName.text.Length <= 0)
        {
            lastNameLabel.color = Color.red;
        }
    }

    public void LoadPlayerFromInk(string firstName, string lastName, int face, int ear, int body, int skinColor,
        int hairFront, int hairBack, int hairBase, int hairSideLeft, int hairSideRight, int hairColor, int eyes, int rightEyeColor, int leftEyeColor,
        int eyebrow, int eyebrowColor, int nose, int mouth, int mouthColor, int clothing, int clothingColor)
    {
        // Create Avatar
        FaceController.OnButtonSelected(FaceController.characterCreationButtons[face]);
        EarController.OnButtonSelected(EarController.characterCreationButtons[ear]);
        BodyController.OnButtonSelected(BodyController.characterCreationButtons[body]);
        SkinColorController.OnButtonSelected(SkinColorController.characterCreationButtons[skinColor]);

        HairFrontController.OnButtonSelected(HairFrontController.characterCreationButtons[hairFront]);
        HairBackController.OnButtonSelected(HairBackController.characterCreationButtons[hairBack]);
        HairBaseController.OnButtonSelected(HairBackController.characterCreationButtons[hairBase]);
        HairSideLeftController.OnButtonSelected(HairBackController.characterCreationButtons[hairSideLeft]);
        HairSideRightController.OnButtonSelected(HairBackController.characterCreationButtons[hairSideRight]);
        HairColorController.OnButtonSelected(HairColorController.characterCreationButtons[hairColor]);

        EyesController.OnButtonSelected(EyesController.characterCreationButtons[eyes]);
        RightEyeColorController.OnButtonSelected(RightEyeColorController.characterCreationButtons[rightEyeColor]);
        LeftEyeColorController.OnButtonSelected(LeftEyeColorController.characterCreationButtons[leftEyeColor]);

        EyebrowController.OnButtonSelected(EyebrowController.characterCreationButtons[eyebrow]);
        EyebrowColorController.OnButtonSelected(EyebrowColorController.characterCreationButtons[eyebrowColor]);
        NoseController.OnButtonSelected(NoseController.characterCreationButtons[nose]);
        MouthController.OnButtonSelected(MouthController.characterCreationButtons[mouth]);
        MouthColorController.OnButtonSelected(MouthColorController.characterCreationButtons[mouthColor]);

        ClothingController.OnButtonSelected(ClothingController.characterCreationButtons[clothing]);
        ClothingColorController.OnButtonSelected(ClothingColorController.characterCreationButtons[clothingColor]);

        CreatePlayer(firstName, lastName);
    }
    public void CreatePlayer(string firstName, string lastName)
    {
        
        // Instantiate needed copies. 
        GameObject playerCharacterConversationPortrait = Instantiate(characterAvatar);
        GameObject playerCharacterNeedsPortrait = Instantiate(characterAvatar);


        // Update Need Window Info
        nameLabel.text = firstName + " " + lastName;
        playerCharacterNeedsPortrait.transform.SetParent(avatarContainer.transform, false);
        playerCharacterNeedsPortrait.transform.localScale = new Vector3(.6f, .6f, 1f);
        playerCharacterNeedsPortrait.transform.localPosition = new Vector3(35f, -235f, 0);

        // Update Conversation Info
        playerCharacterConversationPortrait.transform.SetParent(playerPortraitContainer.transform, false);
        playerCharacterConversationPortrait.transform.localScale = new Vector3(.5f, .5f, 1f);
        playerCharacterConversationPortrait.transform.localPosition = new Vector3(-225, -300);
        playerCharacterConversationPortrait.gameObject.AddComponent<Mask>();
        playerCharacterConversationPortrait.gameObject.GetComponent<Mask>().showMaskGraphic = true;
        //playerPortraitOverlay.transform.SetParent(playerCharacterConversationPortrait.transform, false);

    }

    public void CreatePerson(string firstName, string lastName, int face, int ear, int body, int skinColor, 
        int hairFront, int hairBack, int hairBase, int hairSideLeft, int hairSideRight, int hairColor, int eyes, int rightEyeColor, int leftEyeColor, 
        int eyebrow, int eyebrowColor, int nose, int mouth, int mouthColor, int clothing, int clothingColor, 
        int relationshipScore, int knowsPlayer, int indexID)
    {
        if (Characters == null)
        {
            Characters = new List<Person>();
        }
        
        // Create Avatar
        FaceController.OnButtonSelected(FaceController.characterCreationButtons[face]);
        EarController.OnButtonSelected(EarController.characterCreationButtons[ear]);
        BodyController.OnButtonSelected(BodyController.characterCreationButtons[body]);
        SkinColorController.OnButtonSelected(SkinColorController.characterCreationButtons[skinColor]);

        HairFrontController.OnButtonSelected(HairFrontController.characterCreationButtons[hairFront]);
        HairBackController.OnButtonSelected(HairBackController.characterCreationButtons[hairBack]);
        HairColorController.OnButtonSelected(HairColorController.characterCreationButtons[hairColor]);
        HairBaseController.OnButtonSelected(HairBackController.characterCreationButtons[hairBase]);
        HairSideLeftController.OnButtonSelected(HairBackController.characterCreationButtons[hairSideLeft]);
        HairSideRightController.OnButtonSelected(HairBackController.characterCreationButtons[hairSideRight]);

        EyesController.OnButtonSelected(EyesController.characterCreationButtons[eyes]);
        RightEyeColorController.OnButtonSelected(RightEyeColorController.characterCreationButtons[rightEyeColor]);
        LeftEyeColorController.OnButtonSelected(LeftEyeColorController.characterCreationButtons[leftEyeColor]);

        EyebrowController.OnButtonSelected(EyebrowController.characterCreationButtons[eyebrow]);
        EyebrowColorController.OnButtonSelected(EyebrowColorController.characterCreationButtons[eyebrowColor]);
        NoseController.OnButtonSelected(NoseController.characterCreationButtons[nose]);
        MouthController.OnButtonSelected(MouthController.characterCreationButtons[mouth]);
        MouthColorController.OnButtonSelected(MouthColorController.characterCreationButtons[mouthColor]);

        ClothingController.OnButtonSelected(ClothingController.characterCreationButtons[clothing]);
        ClothingColorController.OnButtonSelected(ClothingColorController.characterCreationButtons[clothingColor]);

        // Instantiate needed copies. 
        GameObject characterConversationPortrait = Instantiate(characterAvatar);
        characterConversationPortrait.transform.localRotation = new Quaternion(0f, 180f, 0f, 0f);       
        GameObject characterAdditionalPortrait = Instantiate(characterAvatar);

        Characters.Add(new Person(firstName, lastName, face, skinColor, hairFront, hairBack, hairColor, eyes, rightEyeColor, 
            characterConversationPortrait, characterAdditionalPortrait, relationshipScore, knowsPlayer, indexID));
        
        characterConversationPortrait.transform.SetParent(NPCPortraitContainer.transform, false);
        characterConversationPortrait.transform.localScale = new Vector3(.5f, .5f, 1f);
        characterConversationPortrait.transform.localPosition = new Vector3(225, -300);
        characterConversationPortrait.name = firstName + "ConversationPortrait";
        ConversationController.AddContainerToList(characterConversationPortrait);

        ContactsController.UpdateNameLabel(firstName, lastName, indexID);
        ContactsController.UpdateRelationship(relationshipScore, indexID);
        ContactsController.UpdatePortrait(characterAdditionalPortrait, indexID);

    }
}
