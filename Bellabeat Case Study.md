1.  **Background**

    1.  About the company

        1.  Bellabeat is a high-tech manufacturer of health-focused
            > smart devices for women. The devices that they produce
            > collect health and fitness data with the intention to
            > educate and empower women on their own habits. While
            > Bellabeat is a highly successful company they intend to
            > grow their presence in the smart device market.

    2.  Key stakeholders

        1.  Urška Sršen, Bellabeat’s cofounder and Chief Creative
            > Officer; Sando Mur, Mathematician and Bellabeat’s
            > cofounder; And the rest of the Bellabeat marketing
            > analytics team.

    3.  Business task

        1.  Analyze smart device usage from non-Bellabeat products in
            > order to gain insight into how customers use their
            > devices. Compare and apply those insights to one of the
            > Bellabeat products and deliver high-level recommendations
            > to the Bellabeat marketing strategy.

        2.  How can Bellabeat increase their presence in the smart
            > device market?

2.  **Data Preparation**

    1.  Dataset information

        1.  The data source is from an online public dataset on kaggle
            > uploaded and owned by user Mobius. By inspecting the
            > metadata of the dataset we can tell it is usable under the
            > public domain. After downloading the 18 CSV files, they
            > are stored both on my personal computer as well as on my
            > google drive.

        2.  The data was collected from an optional survey conducted by
            > Amazon Mechanical Turk between 03-12-2016 and 05-12-2016
            > on thirty fitbit users. The personal fitness trackers
            > collected data on physical activity, heart rate, sleep
            > monitoring, and weight changes.

    2.  Data structure

        1.  The data set is organized into 18 different CSV files, of
            > which the majority would be classified as long data. There
            > are 3 files of those 18 which are in a wide format
            > instead.

        2.  All of those 18 tables contain a primary key **Id** in
            > addition to other table specific variables such as
            > **Steps, Calories, Weight, ActivityDate, Sleep,** etc.
            > While all of the data contains some kind of date variable,
            > we would like to focus on the tables that contain day and
            > hour values rather than the tables containing minutes.

        3.  The dataset specifies that the sample size of users is 30
            > users for all tables. Upon initial inspection we find that
            > the activity table has a user size of 33, sleep having a
            > size of 24, heart rate having a sample size of 7, and
            > finally the weight table having a sample size of 8.

3.  **Data Processing and Analysis**

<!-- -->

1.  Tools used

    1.  I chose to use SQL as my primary data exploration, cleaning, and
        > analysis within Microsoft SQL server. I also used google
        > sheets for some additional cleaning and validation as well as
        > Tableau for my data visualization.

2.  Importing data

    1.  After downloading the dataset to my computer as well as my
        > google drive I then imported all of them into Microsoft SQL
        > server. Although I tried to import them into google sheets as
        > well, some of the larger tables were not compatible with
        > google sheets.

3.  Formatting

    1.  In order to have consistency and accuracy some of the data types
        > will need to be converted. Within the hourlycalories table we
        > will update the **ActivityHour** to a DATETIME format so that
        > we will be able to group the calories burned by hour of the
        > day. Within the daily_activity table the **ActivityDate** must
        > be converted to a DATE format as well. Finally from the
        > hourlySteps table the **ActivityHour** must be converted to a
        > DATETIME format.

4.  Analysis and visualization

    1.  First I wanted to group the users from the daily_activity table
        > by user type. The user types are as follows; Sedentary,
        > Lightly Active, Fairly Active, and Very Active. I calculated
        > this with the following query, which groups the users into
        > each category based on what type of activity is the most
        > common while wearing their smart device.

<img src="media/image3.png" style="width:6.5in;height:3.22222in" />

-   This shows the distribution of users that of which a majority are
    > classified as sedentary while using their smart device. Although
    > it is understandable for many users who work from a desk or a more
    > sedentary lifestyle this is an area where many users can progress.

    1.  Next I wanted to understand the distribution of steps and
        > calories burned throughout the day. I did this by creating a
        > view which calculates the average calories and steps by each
        > hour of the day. Then import that data into excel so it will
        > be compatible with Tableau public. The following graph shows
        > the relationship between the number of calories burned and the
        > number of steps recorded that hour.

<img src="media/image2.png" style="width:6.5in;height:3.19444in" />

-   What we can infer from this graph is that as you take more steps
    > within any given hour you burn more calories. While this may seem
    > like an obvious point we find that there are a decent amount of
    > data points where there were few or zero steps taken but far more
    > calories burned than expected. If we were to speculate we could
    > imagine that perhaps this person was swimming, on an exercise bike
    > or perhaps their device simply did not record their steps
    > correctly.

    1.  Lastly I wanted to look at the distribution of steps and
        > calories by the hour to see when users are active and when
        > they are not. I used a query to create a view that shows the
        > number of calories burned and steps taken by each user and
        > each hour. We then imported that data into a google sheet
        > which allows us to create a visualization in Tableau. The
        > following graph represents the averages by hour for both
        > calories and steps so that we can gain insights on user
        > activity.

<img src="media/image1.png" style="width:6.5in;height:3.22222in" />

-   From this graph we can tell that users get up and moving as early as
    > 5 am where we begin to see the average steps as well as average
    > calories burned each hour begin to increase. We see gradual rise
    > in both average steps and calories throughout the day until we hit
    > the 5 pm mark when we see a slight drop. We can infer that this is
    > generally when people commute home from work thus are sitting in a
    > car or public transit. You can also see that there are a few bumps
    > around noon and from 7pm - 9pm. Again we can infer that these are
    > more active times because of lunch at noon and possibly the gym or
    > social activities in the evening bump.

**4. Summary and recommendations**

1.  Insights

    1.  Upon analyzing the data from the fitbit users we have found some
        > insights and information that could be applied to the
        > Bellabeat marketing strategy. First I would like to address
        > any limitations that we found while working with the data and
        > explain how they affect recommendations.

    2.  The dataset we were provided does lack demographic information
        > such as age and gender. While Bellabeats products are focused
        > on empowering women we can still try to apply our insights to
        > the marketing strategy. We can also infer from the hourly
        > analysis that many of the users from the survey are living a
        > traditional lifestyle working a 9-5 or at least adhering to a
        > similar schedule.

2.  Bellabeat mission and target demographic

    1.  Bellabeat is a company that intends on empowering and educating
        > women on how to live a healthy lifestyle by collecting health
        > and activity data from their smart devices. Judging by the
        > dataset analyzed I would recommend focusing on working women
        > who spend large parts of their day sitting at a computer or
        > women who want more insight on their fitness activity.

    2.  It is imperative to remember that Bellabeat wants to add support
        > to women in their lifestyle choices as well as how active they
        > are throughout the day. In order to do this I think that
        > framing Bellabeat products as a measure of support rather than
        > a way to scrutinize and quantify their activity would be
        > helpful for many already busy women.

3.  Recommendations

    1.  I recommend a feature within the Bellabeat app that analyzes
        > previously recorded activity to create reminders to stretch,
        > stand, or walk briefly during common sedentary periods
        > throughout the day.

    2.  Like I previously mentioned I think framing the Bellabeat
        > products and companion app as a system of support could be
        > potentially helpful. This could look like a social network
        > within the app so that you can encourage friends and strangers
        > alike through their fitness journey.

    3.  Finally I think that setting goals such as step count, activity
        > time, and calories burned for each user based on initial data
        > collected could be helpful for many women to stay motivated.
        > This could look like minigames, leaderboards, and time based
        > challenges that users could participate in leading to better
        > engagement.
