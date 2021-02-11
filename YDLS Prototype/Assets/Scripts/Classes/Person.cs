using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Person
{
    // Character Appearance

    public int Face { get; protected set; }
    public int SkinColor { get; protected set; }
    public int HairFront { get; protected set; }
    public int HairBack { get; protected set; }
    public int HairColor { get; protected set; }
    public int Eyes { get; protected set; }
    public int EyeColor { get; protected set; }



    // Basic Info
    public string FirstName { get; protected set; }
    public string LastName { get; protected set; }
    public bool KnowsPlayerCharacter { get; set; }
    public int RelationshipScore { get; set; }
    public int IndexID { get; protected set; }

    // Avatars
    public GameObject ConversationPortrait { get; protected set; }
    public GameObject AdditionalPortrait { get; protected set; }

    public Person(string firstName, string lastName, int face, int skinColor, int hairFront, int hairBack, int hairColor, int eyes, int eyeColor, 
        GameObject conversationPortrait, GameObject additionalPortrait, int relationshipScore, int knowsPlayer, int indexID)
    {
        FirstName = firstName;
        LastName = lastName;

        Face = face;
        SkinColor = skinColor;
        HairFront = hairFront;
        HairBack = hairBack;
        HairColor = hairColor;
        Eyes = eyes;
        EyeColor = eyeColor;

        ConversationPortrait = conversationPortrait;
        AdditionalPortrait = additionalPortrait;

        RelationshipScore = relationshipScore;
        if (knowsPlayer == 1)
        {
            KnowsPlayerCharacter = true;
        }
        IndexID = indexID;

        //UpdateAvatar(avatar);
    }


    /*public void UpdateAvatar(GameObject avatar)
    {
        Image faceImage = avatar.transform.Find("Face").GetComponent<Image>();
        Image hairImage = avatar.transform.Find("Hair").GetComponent<Image>();
        Image eyeImage = avatar.transform.Find("Eyes").GetComponent<Image>();
        Image mouthImage = avatar.transform.Find("Mouth").GetComponent<Image>();

        faceImage.sprite = FaceShape;
        faceImage.color = SkinColor;
        hairImage.sprite = HairShape;
        hairImage.color = HairColor;
        eyeImage.sprite = EyeShape;
        eyeImage.color = EyeColor;
        mouthImage.sprite = MouthShape;
        
    }*/
}
