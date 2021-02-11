using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoadingScreenController : MonoBehaviour
{   
    public GameObject loadingScreenContainer;
    public GameController GameController;
    [Header("Loading Animations")]
    public GameObject busLoading;
    public GameObject sleepLoading;

    public void ChangeLoadingImage(string animationName)
    {
        busLoading.SetActive(false);
        sleepLoading.SetActive(false);

        switch (animationName)
        {
            case "bus":
                busLoading.SetActive(true);
                break;
            case "sleep":
                sleepLoading.SetActive(true);
                break;
            default:
                Debug.Log("Unknown Loading Animation: " + animationName);
                break;
        }
    }
    public void PlayLoadingAnimation(int startLoading)
    {
        if (startLoading == 1)
        {
            StartCoroutine("LoadingAnimation");
        }
    }
    public IEnumerator LoadingAnimation()
    {
        loadingScreenContainer.SetActive(true);
        yield return new WaitForSeconds(2);
        loadingScreenContainer.SetActive(false);
        GameController.OnClickContinueButton();
    }
}