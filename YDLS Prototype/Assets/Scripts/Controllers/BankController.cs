using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using System;

public class BankController : MonoBehaviour
{
    public float Balance { get; set; }
    public float InterestRate { get; set; }
    public float EarnedInterest { get; set; }

    public List<string> Transactions;

    private float rentBill = 0;
    private string rentBillDate = "";

    private float phoneBill = 0;
    private string phoneBillDate = "";

    private float electricBill = 0;
    private string electricBillDate = "";


    [Header("UI Objects")]
    public GameObject transactionContent;
    public GameObject transactionContainerPrefab;
    public TextMeshProUGUI balanceText;
    public TextMeshProUGUI interestRateText;
    public TextMeshProUGUI earnedInterestText;

    public GameObject rentBillContainer;
    public TextMeshProUGUI rentBillText;
    public TextMeshProUGUI rentBillDateText;

    public GameObject electricBillContainer;
    public TextMeshProUGUI electricBillText;
    public TextMeshProUGUI electricBillDateText;


    public GameObject phoneBillContainer;
    public TextMeshProUGUI phoneBillText;
    public TextMeshProUGUI phoneBillDateText;

    public GameObject noBillsContainer;


    [Header("Controllers")]
    public GameController GameController;
    public SFXController SFXController;


    private void Start()
    {
        if (Transactions == null)
        {
            Transactions = new List<string>();
        }

        //AddTransaction("8/10", "Paycheck", 1000f);
        //AddTransaction("8/12", "Rent", -500f);
        //AddTransaction("8/12", "Electric", -50f);
        //AddTransaction("8/12", "Store", -17f);

    }
    public void UpdateBalance (float amount)
    {
        Balance = amount;
        balanceText.text = Balance.ToString("C");
        //Debug.Log("MONEY UDPATED: " + amount);
    }

    public void UpdateInterestRate(float amount)
    {
        InterestRate = amount;
        interestRateText.text = InterestRate.ToString("#0.00%");
    }
    public void UpdateEarnedInterest(float amount)
    {
        EarnedInterest = amount;
        earnedInterestText.text = EarnedInterest.ToString("C");
    }

    public void UpdateRentBill(float amount, string date)
    {
        rentBill = amount;
        rentBillDate = date;
        rentBillText.text = rentBill.ToString("C");
        rentBillDateText.text = rentBillDate;
    }
    public void UpdatePhoneBill(float amount, string date)
    {
        phoneBill = amount;
        phoneBillDate = date;
        phoneBillText.text = phoneBill.ToString("C");
        phoneBillDateText.text = phoneBillDate;
    }
    public void UpdateElectricBill(float amount, string date)
    {
        electricBill = amount;
        electricBillDate = date;
        electricBillText.text = electricBill.ToString("C");
        electricBillDateText.text = electricBillDate;
    }
    public void AddTransaction (string date, string desc, float amount, float transactionBalance)
    {
        // Update Amounts and Create Transaction GameObject
        //float transactionBalance = Balance + amount;
        //Balance = transactionBalance;

        GameObject newTransaction = Instantiate(transactionContainerPrefab);
        foreach(TextMeshProUGUI text in newTransaction.GetComponentsInChildren<TextMeshProUGUI>())
        {
            switch(text.text)
            {
                case "date":
                    text.text = date;
                    break;
                case "desc":
                    text.text = desc;
                    break;
                case "amount":
                    if (amount >= 0)
                    {
                        text.text = amount.ToString("C");
                    }
                    else
                    {
                        text.text = "(" + Mathf.Abs(amount).ToString("C") + ")";
                    }
                    break;
                case "balance":
                    text.text = transactionBalance.ToString("C");
                    break;
                default: 
                    break;
            }
        }
        newTransaction.transform.SetParent(transactionContent.transform, false);
        newTransaction.transform.SetAsFirstSibling();
        RectTransform transactionContentRect = transactionContent.GetComponent<RectTransform>();
        transactionContentRect.sizeDelta = new Vector2(transactionContentRect.sizeDelta.x, transactionContentRect.sizeDelta.y + 150f);


        // Add to List
        string transactionContainer = date + "," + desc + "," + amount + "," + transactionBalance;

        if (Transactions == null)
        {
            Transactions = new List<string>();
        }
        Transactions.Add(transactionContainer);
        //SaveTransactionList(); // Moved to GameController
    }

    public void SaveTransactionList()
    {
        for (int i = 0; i < Transactions.Count; i++)
        {
            
            PlayerPrefs.SetString("transaction" + i, Transactions[i]);
            Debug.Log("Saved Transaction " + i + " :" + Transactions[i]);
            
        }
        /*if (Transactions.Count > 1)
        {
            GameController.SaveStoryState(); // This breaks the flow a bit. 
        }
        */
    }

    public void LoadTransactions ()
    {
        ClearTransactions();       
        Transactions = new List<string>();
        
        for (int i = 0; PlayerPrefs.HasKey("transaction" + i); i++)
        {
            //Debug.Log("PlayerPref Key " + i + ": " + PlayerPrefs.HasKey("transaction" + i));
            //Transactions.Add(PlayerPrefs.GetString("transaction" + i));
            string[] tempTransactionContainer = PlayerPrefs.GetString("transaction" + i).Split(',');
            //Debug.Log("TempTransactionContainer THING: " + tempTransactionContainer[0] + ", " + tempTransactionContainer[1] + ", " + tempTransactionContainer[2]);
            AddTransaction(tempTransactionContainer[0], tempTransactionContainer[1], float.Parse(tempTransactionContainer[2]), float.Parse(tempTransactionContainer[3]));
        }
        Debug.Log("Loaded Transactions");        
    }
    public void SaveBills()
    {
        PlayerPrefs.SetFloat("rentBill", rentBill);
        PlayerPrefs.SetFloat("phoneBill", phoneBill);
        PlayerPrefs.SetFloat("electricBill", electricBill);
    }
    public void LoadBills()
    {
        if (PlayerPrefs.HasKey("rentBill") && PlayerPrefs.GetFloat("rentBill") <= 0)
        {
            rentBillContainer.SetActive(false);
            rentBill = 0;
        }
        if (PlayerPrefs.HasKey("phoneBill") && PlayerPrefs.GetFloat("phoneBill") <= 0)
        {
            phoneBillContainer.SetActive(false);
            phoneBill = 0;
        }
        if (PlayerPrefs.HasKey("electricBill") && PlayerPrefs.GetFloat("electricBill") <= 0)
        {
            electricBillContainer.SetActive(false);
            electricBill = 0;
        }
    }

    public void ClearTransactions ()
    {
        Transactions = null;
        if (transactionContent.transform.childCount > 0) {
            foreach (Transform child in transactionContent.transform)
            {
                Destroy(child.gameObject);
            }
        }
    }

    public void PayBill (string billName)
    {
        if (GameController.CallInkPayBillFunction(billName))
        {
            switch(billName)
            {
                case "Rent":
                    rentBillContainer.SetActive(false);
                    //PlayerPrefs.SetInt("rentBill", 0);
                    rentBill = 0;
                    break;
                case "Phone":
                    phoneBillContainer.SetActive(false);
                    //PlayerPrefs.SetInt("phoneBill", 0);
                    phoneBill = 0;
                    break;
                case "Electric":
                    electricBillContainer.SetActive(false);
                    //PlayerPrefs.SetInt("electricBill", 0);
                    electricBill = 0;
                    break;
                default:
                    Debug.Log("Unknown Bill: " + billName);
                    break;
            }
            SFXController.PlayRegisterDing();
        }
    }

    public void ShowRentBill(int value)
    {
        if (value == 1)
        {
            rentBillContainer.SetActive(true);
            noBillsContainer.SetActive(false);
        }
        else
        {
            rentBillContainer.SetActive(false);
        }
    }

    public void ShowElectricBill(int value)
    {
        if (value == 1)
        {
            electricBillContainer.SetActive(true);
            noBillsContainer.SetActive(false);
        }
        else
        {
            electricBillContainer.SetActive(false);
        }
    }

    public void ShowPhoneBill(int value)
    {
        if (value == 1)
        {
            phoneBillContainer.SetActive(true);
            noBillsContainer.SetActive(false);
        }
        else
        {
            phoneBillContainer.SetActive(false);
        }
    }
}
