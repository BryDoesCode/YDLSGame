using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class ConversationController : MonoBehaviour
{
    public GameObject conversationContainer;
    public GameObject playerAvatar;
    public GameObject NPCAvatar;
    public List<GameObject> NPCConversationContainers;


    private void Start()
    {
        if (NPCConversationContainers == null)
        {
            NPCConversationContainers = new List<GameObject>();
        }
    }
    public void ShowConversation(bool conversationActive, int indexID)
    {
        if (conversationActive)
        {
            conversationContainer.SetActive(true);
            if (indexID < NPCConversationContainers.Count)
            {
                NPCConversationContainers[indexID].SetActive(true);
            }
        }
        else
        {
            conversationContainer.SetActive(false);
            foreach(GameObject container in NPCConversationContainers)
            {
                container.SetActive(false);
            }
        }
    }

    public void ConversationFocusToggle(string focus)
    {
        if (focus.Contains("Player"))
        {
            playerAvatar.transform.SetAsLastSibling();
            NPCAvatar.transform.SetAsFirstSibling();
            //Debug.Log("Player Focus");
        }
        else
        {
            playerAvatar.transform.SetAsFirstSibling();
            NPCAvatar.transform.SetAsLastSibling();
            //Debug.Log("NPC Focus");
        }

    }
    public void AddContainerToList(GameObject container)
    {
        if(NPCConversationContainers == null)
        {
            NPCConversationContainers = new List<GameObject>();
        }
        container.SetActive(false);
        NPCConversationContainers.Add(container);
        Debug.Log(container.name + " added to NPCConversationContainers List");
    }
}
