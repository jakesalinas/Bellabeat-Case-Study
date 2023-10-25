# Bellabeat-Case-Study
<p style="margin-top:0pt; margin-bottom:0pt;">&nbsp;</p>
<ol type="1" style="margin:0pt; padding-left:0pt;">
    <li style="margin-left:32.17pt; padding-left:3.83pt; font-weight:bold;">Background<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:32.17pt; padding-left:3.83pt; font-weight:normal;">About the company<ol type="a" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
                    <li style="margin-left:23pt; padding-left:13pt;">Bellabeat is a high-tech manufacturer of health-focused smart devices for women. The devices that they produce collect health and fitness data to educate and empower women on their habits. While Bellabeat is a highly successful company it intends to grow its presence in the smart device market.</li>
                </ol>
            </li>
        </ol>
    </li>
</ol>
<p style="margin-top:0pt; margin-left:108pt; margin-bottom:0pt;">&nbsp;</p>
<ol start="2" type="a" style="margin:0pt; padding-left:0pt;">
    <li style="margin-left:68.17pt; padding-left:3.83pt;">Key stakeholders<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:23pt; padding-left:13pt;">&nbsp;Urska Srsen, Bellabeat&apos;s co-founder and Chief Creative Officer; Sando Mur, Mathematician, and Bellabeat&apos;s cofounder; And the rest of the Bellabeat marketing analytics team.</li>
        </ol>
    </li>
</ol>
<p style="margin-top:0pt; margin-left:108pt; margin-bottom:0pt;">&nbsp;</p>
<ol start="3" type="a" style="margin:0pt; padding-left:0pt;">
    <li style="margin-left:67.56pt; padding-left:4.44pt;">Business task<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:23pt; padding-left:13pt;">Analyze smart device usage from non-Bellabeat products to gain insight into how customers use their devices. Compare and apply those insights to one of the Bellabeat products and deliver high-level recommendations to the Bellabeat marketing strategy.</li>
        </ol>
    </li>
</ol>
<p style="margin-top:0pt; margin-left:108pt; margin-bottom:0pt;">&nbsp;</p>
<ol start="2" type="i" style="margin:0pt; padding-left:0pt;">
    <li style="margin-left:67.56pt; padding-left:13pt;">How can Bellabeat increase its presence in the smart device market?</li>
</ol>
<p style="margin-top:0pt; margin-left:108pt; margin-bottom:0pt;">&nbsp;</p>
<ol start="2" type="1" style="margin:0pt; padding-left:0pt;">
    <li style="margin-left:32.17pt; padding-left:3.83pt; font-weight:bold;">Data Preparation<ol type="a" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:32.17pt; padding-left:3.83pt; font-weight:normal;">Dataset information<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
                    <li style="margin-left:23pt; padding-left:13pt;">The data source is from an online public dataset on Kaggle uploaded and owned by user Mobius. By inspecting the metadata of the dataset we can tell it is usable under the public domain. After downloading the 18 CSV files, they are stored both on my personal computer as well as on my Google Drive.</li>
                    <li style="margin-left:23pt; padding-left:13pt;">The data was collected from an optional survey conducted by Amazon Mechanical Turk between 03-12-2016 and 05-12-2016 on thirty Fitbit users. The personal fitness trackers collected data on physical activity, heart rate, sleep monitoring, and weight changes.</li>
                </ol>
            </li>
            <li style="margin-left:32.17pt; padding-left:3.83pt; font-weight:normal;">Data structure<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
                    <li style="margin-left:23pt; padding-left:13pt;">The data set is organized into 18 different CSV files, of which the majority would be classified as long data. There are 3 files of those 18 which are in a wide format instead.</li>
                                </ol>
            </li>
                    <li style="margin-left:23pt; padding-left:13pt;">All of those 18 tables contain a primary key <strong>Id</strong> in addition to other table-specific variables such as <strong>Steps, Calories, Weight, ActivityDate, Sleep,&nbsp;</strong>etc. While all of the data contains some kind of date variable, we would like to focus on the tables that contain day and hour values rather than the tables containing minutes.</li>
                        </ol>
            </li>
                    <li style="margin-left:23pt; padding-left:13pt;">The dataset specifies that the sample size of users is 30 users for all tables. Upon initial inspection, we find that the activity table has a user size of 33, sleep has a size of 24, heart rate has a sample size of 7, and finally, the weight table has a sample size of 8.</li>
                </ol>
            </li>
        </ol>
    </li>
</ol>
<p style="margin-top:0pt; margin-left:108pt; margin-bottom:0pt;">&nbsp;</p>
<ol start="3" type="1" style="margin:0pt; padding-left:0pt;">
    <li style="margin-left:32.17pt; padding-left:3.83pt; font-weight:bold;">Data Processing and Analysis</li>
</ol>
<ol type="a" style="margin:0pt; padding-left:0pt;">
    <li style="margin-left:68.17pt; padding-left:3.83pt;">Tools used<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:23pt; padding-left:13pt;">I chose to use SQL as my primary data exploration, cleaning, and analysis within Microsoft SQL server. I also used Google Sheets for some additional cleaning and validation as well as Tableau for my data visualization.</li>
        </ol>
    </li>
    <li style="margin-left:68.17pt; padding-left:3.83pt;">Importing data<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:23pt; padding-left:13pt;">After downloading the dataset to my computer as well as my Google Drive I then imported all of them into Microsoft SQL server. Although I tried to import them into Google Sheets as well, some of the larger tables were not compatible with Google Sheets.</li>
        </ol>
    </li>
    <li style="margin-left:67.56pt; padding-left:4.44pt;">Formatting<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:23pt; padding-left:13pt;">To have consistency and accuracy some of the data types will need to be converted. Within the hourlycalories table, we will update the <strong>ActivityHour&nbsp;</strong>to a DATETIME format so that we will be able to group the calories burned by the hour of the day. Within the daily_activity table, the <strong>ActivityDate&nbsp;</strong>must be converted to a DATE format as well. Finally from the hourlySteps table, the <strong>ActivityHour</strong> must be converted to a DATETIME format.</li>
        </ol>
    </li>
    <li style="margin-left:68.17pt; padding-left:3.83pt;">Analysis and visualization<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:23pt; padding-left:13pt;">First I wanted to group the users from the daily_activity table by user type. The user types are as follows; Sedentary, Lightly Active, Fairly Active, and Very Active. I calculated this with the following query, which groups the users into each category based on what type of activity is the most common while wearing their smart device.</li>
        </ol>
    </li>
</ol>
<p style="margin-top:0pt; margin-bottom:0pt;"><img <img src="https://github.com/jakesalinas/Bellabeat-Case-Study/assets/116672106/93fe2b70-5d1a-442e-b207-546557e64947" alt="User pie chart">
</p>

<p style="margin-top:0pt; margin-left:36pt; margin-bottom:0pt; text-indent:-18pt;">-<span style="width:14.34pt; font:7pt 'Times New Roman'; display:inline-block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>This shows the distribution of users of which a majority are classified as sedentary while using their smart device. Although it is understandable for many users who work from a desk or a more sedentary lifestyle this is an area where many users can progress.</p>
<p style="margin-top:0pt; margin-left:36pt; margin-bottom:0pt;">&nbsp;</p>
<ol start="2" type="i" style="margin:0pt; padding-left:0pt;">
    <li style="margin-left:95pt; padding-left:13pt;">Next, I wanted to understand the distribution of steps and calories burned throughout the day. I did this by creating a view that calculates the average calories and steps by each hour of the day. Then import that data into Excel so it will be compatible with Tableau public. The following graph shows the relationship between the number of calories burned and the number of steps recorded that hour.</li>
</ol>
<p style="margin-top:0pt; margin-bottom:0pt;"><img src="https://github.com/jakesalinas/Bellabeat-Case-Study/assets/116672106/41aa1e09-9dc2-4f81-9383-69cb9103b208" alt="Calories vs steps per hour">
</p>

<p style="margin-top:0pt; margin-left:36pt; margin-bottom:0pt; text-indent:-18pt;">-<span style="width:14.34pt; font:7pt 'Times New Roman'; display:inline-block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>What we can infer from this graph is that as you take more steps within any given hour you burn more calories. While this may seem like an obvious point we find that there are a decent amount of data points where there were few or zero steps taken but far more calories burned than expected. If we were to speculate we could imagine that perhaps this person was swimming, on an exercise bike, or perhaps their device simply did not record their steps correctly.</p>
<p style="margin-top:0pt; margin-bottom:0pt;">&nbsp;</p>
<ol start="3" type="i" style="margin:0pt; padding-left:0pt;">
    <li style="margin-left:95pt; padding-left:13pt;">Lastly, I wanted to look at the distribution of steps and calories by the hour to see when users are active and when they are not. I used a query to create a view that shows the number of calories burned and steps taken by each user and each hour. We then imported that data into a Google sheet which allows us to create a visualization in Tableau. The following graph represents the averages by the hour for both calories and steps so that we can gain insights into user activity.</li>
</ol>
<p style="margin-top:0pt; margin-bottom:0pt;"><img <img src="https://github.com/jakesalinas/Bellabeat-Case-Study/assets/116672106/a21e02a5-ac0f-41c5-a092-13d1b9d9f6cc" alt="Hourly avg of steps and calories">
</p>

<p style="margin-top:0pt; margin-left:36pt; margin-bottom:0pt; text-indent:-18pt;">-<span style="width:14.34pt; font:7pt 'Times New Roman'; display:inline-block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>From this graph, we can tell that users get up and moving as early as 5 a.m. where we begin to see the average steps as well as the average calories burned each hour begin to increase. We see a gradual rise in both average steps and calories throughout the day until we hit the 5 p.m. mark when we see a slight drop. We can infer that this is generally when people commute home from work and thus are sitting in a car or public transit. You can also see that there are a few bumps around noon and from 7 p.m. - 9 p.m. Again we can infer that these are more active times because of lunch at noon and possibly the gym or social activities in the evening bump.</p>
<p style="margin-top:0pt; margin-bottom:0pt;">&nbsp;</p>
<p style="margin-top:0pt; margin-bottom:0pt;"><strong>4. Summary and recommendations&nbsp;</strong></p>
<ol type="a" style="margin:0pt; padding-left:0pt;">
    <li style="margin-left:68.17pt; padding-left:3.83pt;">Insights<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:23pt; padding-left:13pt;">Upon analyzing the data from the Fitbit users we have found some insights and information that could be applied to the Bellabeat marketing strategy. First I would like to address any limitations that we found while working with the data and explain how they affect recommendations.</li>
            <li style="margin-left:23pt; padding-left:13pt;">The dataset we were provided does lack demographic information such as age and gender. While Bellabeats products are focused on empowering women we can still try to apply our insights to the marketing strategy. We can also infer from the hourly analysis that many of the users from the survey are living a traditional lifestyle working a 9-5 or at least adhering to a similar schedule.</li>
        </ol>
    </li>
    <li style="margin-left:68.17pt; padding-left:3.83pt;">Bellabeat mission and target demographic<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:23pt; padding-left:13pt;">Bellabeat is a company that intends to empower and educate women on how to live a healthy lifestyle by collecting health and activity data from their smart devices. Judging by the dataset analyzed I would recommend focusing on working women who spend large parts of their day sitting at a computer or women who want more insight on their fitness activity.</li>
            <li style="margin-left:23pt; padding-left:13pt;">It is imperative to remember that Bellabeat wants to add support to women in their lifestyle choices as well as how active they are throughout the day. To do this I think that framing Bellabeat products as a measure of support rather than a way to scrutinize and quantify their activity would be helpful for many already busy women.</li>
        </ol>
    </li>
    <li style="margin-left:67.56pt; padding-left:4.44pt;">Recommendations<ol type="i" style="margin-right:0pt; margin-left:0pt; padding-left:0pt;">
            <li style="margin-left:23pt; padding-left:13pt;">I recommend a feature within the Bellabeat app that analyzes previously recorded activity to create reminders to stretch, stand, or walk briefly during common sedentary periods throughout the day.</li>
            <li style="margin-left:23pt; padding-left:13pt;">As I previously mentioned I think framing the Bellabeat products and companion app as a system of support could be potentially helpful. This could look like a social network within the app so that you can encourage friends and strangers alike through their fitness journey.</li>
            <li style="margin-left:23pt; padding-left:13pt;">Finally, I think that setting goals such as step count, activity time, and calories burned for each user based on initial data collected could be helpful for many women to stay motivated. This could look like minigames, leaderboards, and time-based challenges that users could participate in leading to better engagement.</li>
        </ol>
    </li>
</ol>
