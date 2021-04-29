using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class ContactsController : MonoBehaviour
{
    public List<GameObject> NPCContactContainers;
    public CharacterCreationController CharacterCreationController;

    public GameObject noContactContainer;

    public bool hasContacts;

    [Header("Modal Containers")]
    public GameObject mainModalContainer;
    public GameObject contactsModalContainer;
    public TextMeshProUGUI modalLabel;
    public TextMeshProUGUI modalDesc;
    public TextMeshProUGUI modalStat;

    [Header("Game Controllers")]
    public SFXController SFXController;
    public void UpdateRelationship (int score, int indexID)
    {
        if (indexID < CharacterCreationController.Characters.Count)
        {
            CharacterCreationController.Characters[indexID].RelationshipScore = score;
            NPCContactContainers[indexID].transform.GetChild(2).GetComponent<TextMeshProUGUI>().text = score.ToString();
            if (CharacterCreationController.Characters[indexID].KnowsPlayerCharacter)
            {
                ShowContact(indexID);
            }
        }
    }

    public void UpdateKnowingPlayer (int knows, int indexID)
    {
        if (knows == 1 && indexID < CharacterCreationController.Characters.Count)
        {
            CharacterCreationController.Characters[indexID].KnowsPlayerCharacter = true;
            ShowContact(indexID);
        }
    }

    public void UpdateNameLabel (string firstName, string lastName, int indexID)
    {
        if (indexID < NPCContactContainers.Count)
        {
            NPCContactContainers[indexID].transform.GetChild(1).GetComponent<TextMeshProUGUI>().text = firstName + " " + lastName;
        }
    }

    public void UpdatePortrait (GameObject portrait, int indexID)
    {
        if (indexID < NPCContactContainers.Count)
        {
            portrait.transform.SetParent(NPCContactContainers[indexID].transform.GetChild(0).GetChild(0).transform, false);
            portrait.transform.localScale = new Vector3(.19f, .19f, 1f);
            portrait.transform.localPosition = new Vector3(10, -90);
        }
    }

    public void ShowContact (int indexID)
    {
        if (indexID < NPCContactContainers.Count)
        {
            NPCContactContainers[indexID].SetActive(true);
            if (!hasContacts)
            {
                hasContacts = true;
                noContactContainer.SetActive(false);
            }
        }
    }

    public void OnClickContactsModal(string item)
    {
        switch (item)
        {
            case "Mom":
                modalLabel.text = NPCContactContainers[0].transform.GetChild(1).GetComponent<TextMeshProUGUI>().text;
                modalDesc.text = "You and your mother have always been fairly close. " +
                    "You don't always see eye to eye and she doesn't always understand how you feel, but you both love each other.";
                modalStat.text = "Your relationship score with your mother is " + NPCContactContainers[0].transform.GetChild(2).GetComponent<TextMeshProUGUI>().text + ".";
                break;
            case "Dad":
                modalLabel.text = NPCContactContainers[1].transform.GetChild(1).GetComponent<TextMeshProUGUI>().text;
                modalDesc.text = "You and your father have always gotten along. He makes the best pancakes and always knows how to cheer you up.";
                modalStat.text = "Your relationship score with your father is " + NPCContactContainers[1].transform.GetChild(2).GetComponent<TextMeshProUGUI>().text + ".";
                break;
            case "Coworker":
                modalLabel.text = NPCContactContainers[2].transform.GetChild(1).GetComponent<TextMeshProUGUI>().text;
                modalDesc.text = "You haven't known your coworker very long, but they seem nice enough.";
                modalStat.text = "Your relationship score with your coworker is " + NPCContactContainers[2].transform.GetChild(2).GetComponent<TextMeshProUGUI>().text + ".";
                break;
            case "Manager":
                modalLabel.text = NPCContactContainers[3].transform.GetChild(1).GetComponent<TextMeshProUGUI>().text;
                modalDesc.text = "You haven't known your manager long enought to have an opinion about them.";
                modalStat.text = "Your relationship score with your manager is " + NPCContactContainers[3].transform.GetChild(2).GetComponent<TextMeshProUGUI>().text + ".";
                break;
            default:
                Debug.Log("Unknown Contacts Modal Item: " + item);
                break;
        }

        mainModalContainer.SetActive(true);
        contactsModalContainer.SetActive(true);
        SFXController.PlayButtonClick();
    }

    public void OnClickCloseModal()
    {
        mainModalContainer.SetActive(false);
        contactsModalContainer.SetActive(false);
        SFXController.PlayButtonClick();
    }
}
