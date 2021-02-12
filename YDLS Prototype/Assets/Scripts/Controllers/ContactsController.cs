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
    public void UpdateRelationship (int score, int indexID)
    {
        Debug.Log("WHY? Index: " + indexID);
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
        Debug.Log("Knowing Player: " + knows);
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
            portrait.transform.localScale = new Vector3(.2f, .2f, 1f);
            portrait.transform.localPosition = new Vector3(20, -90);
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
}
