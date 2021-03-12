using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoadingScreenController : MonoBehaviour
{
    [Header("Containers")]
    public GameObject loadingScreenContainer;

    [Header("Controllers")]
    public GameController GameController;

    [Header("Loading Animations")]
    public GameObject ambulanceLoading;
    public GameObject busLoading;
    public GameObject carLoading;
    public GameObject sleepLoading;
    public GameObject taxiLoading;
    public GameObject trainLoading;
    public GameObject vanLoading;
    public GameObject walkingLoading;

    public void ChangeLoadingImage(string animationName)
    {
        ambulanceLoading.SetActive(false);
        busLoading.SetActive(false);
        carLoading.SetActive(false);
        sleepLoading.SetActive(false);
        taxiLoading.SetActive(false);
        trainLoading.SetActive(false);
        vanLoading.SetActive(false);
        walkingLoading.SetActive(false); 

        switch (animationName)
        {
            case "ambulance":
                ambulanceLoading.SetActive(true);
                break;
            case "bus":
                busLoading.SetActive(true);
                break;
            case "car":
                carLoading.SetActive(true);
                break;
            case "sleep":
                sleepLoading.SetActive(true);
                break;
            case "taxi":
                taxiLoading.SetActive(true);
                break;
            case "train":
                trainLoading.SetActive(true);
                break;
            case "van":
                vanLoading.SetActive(true);
                break;
            case "walking":
                walkingLoading.SetActive(true);
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
        GameController.OnClickContinueButton();
        loadingScreenContainer.SetActive(false);
    }
}