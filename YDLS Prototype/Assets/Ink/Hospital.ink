=== hospital ===
~ loadingAnimation = "ambulance"
~ startLoadingAnimation = true
You were taken to the hospital. 
+ [▼]
-
{AdvanceWeekday()}
~ date ++
~ time = Midday
~ fullDate = month + " " + date
~ fullDateNumbers = monthNumber + "/" + date
~ energy = 2
~ location = "Hospital"
~ background = "hospital"
~ locationMusic = "hospital"
~ startLoadingAnimation = false
{ResetStatTracking()}
{CalculateInterest()}
{EarnPaycheck()}
~ hospitalVisit = true
You wake up slowly, in a place you don't really recognize. 
+ [▼]
-
It comes flooding back to you slowly between pangs of a headache. You passed out. 
+ [▼]
-
As your eyes focus, you recgonize the location for what it is: a hospital room. 
+ [▼]
-
You look at your phone, on the side table and see that the date has changed. You passed out for a long time. 
+ [▼]
-
Just as you're taking in this information, a nurse and doctor walk in the room. 
+ [▼]
-
They bustle about checking your vitals and asking you basic questions. It's very quick but feels like it takes forever. 
+ [▼]
-
After you sign some additional paperwork and confirm you insurance information, they say you're free to go. 
+ [▼]
-
The nurse calls a taxi for you and instructs you to go straight to bed when you get home.
+ [▼]
-
Well, so much for not being "sick". 
+ [▼]
-
You take the taxi home when it arrives. 
+ [▼]
-
~ loadingAnimation = "taxi"
~ startLoadingAnimation = true
~ locationMusic = "taxi"
You ride in the taxi. 
+ [▼] -> afterHospitalEndOfDay
