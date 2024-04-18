# Calculating-Free-to-Paid-Conversion-Rate-with-SQL

**Aim**

The aim of this project is to calculate the conversion rate of students who transition from being free users to paid users after engaging with a course. This involves determining the fraction of students who convert to paying ones after starting a course on the platform.


**Dataset**

The project utilizes the db_course_conversions database, consisting of three tables:

**student_engagement**: Contains data on student engagement, including the date of watching a lecture.

**student_info**: Stores information about students, including their registration date.

**student_purchases**: Records data related to student purchases, including the date of purchase.


**Approach**

(a) **Data Inspection**: First, the existing tables are inspected to understand their structure and content.

(b) **Dataset Creation:** a new result dataset is created, comprising the following columns:

**student_id** – (int) the unique identification of a student

**date_registered** – (date) the date on which the student registered on the 365 platform

**first_date_watched** – (date) the date of the first engagement

**first_date_purchased** – (date) the date of first-time purchase (NULL if they have no purchases)

**date_diff_reg_watch** – (int) the difference in days between the registration date and the date of first-time engagement

**date_diff_watch_purch** – (int) the difference in days between the date of first-time engagement and the date of first-time purchase (NULL if they have no purchases)

(c) **Table Creation:**  A new table named db_course_conversions is created to store this newly aggregated dataset.

(d) **SQL Query:** A main query (query to calculate desired metrics) and sub-query (query for the new dataset) are combined to calculate the required metrics such as conversion rate, average registration-to-watch duration, and average watch-to-purchase duration.

(e) **Execution:** The SQL query is executed to generate the desired metrics.

(f) **Data Interpretation:** The result of the analysis is interpreted.


**SQL Script Overview**

**Choose Database:** Selects the database db_course_conversions to use for the project.

**Inspect Tables:** Displays the contents of the existing tables student_engagement, student_info, and student_purchases.

**Create Table:** Creates a new table db_course_conversions with appropriate columns to store the aggregated data.

**Create Sub-query:** Aggregates new result dataset.

**Insert Results:** Inserts the results of the sub SQL query into the db_course_conversions table.

**Combine Main SQL Query & Sub-query:** Computes the conversion rate and other metrics using a complex SQL query involving joins, aggregations, and calculations.

**Data Retrieval:** Retrieves the data for student ID 268727 from the db_course_conversions table to determine the date of first engagement (i.e., first date watched).


**Main Results and Interpretation**

(1) **Conversion Rate:** The conversion rate of 11% indicates that approximately 11 out of every 100 students who engage with the 365 Data Science platform end up making a purchase. This suggests a moderate level of success in converting engaged users into paying customers.

(2) **Registration-to-Watch Duration:** The average duration of 3 days from registration to watching the first lecture indicates that users are relatively quick to engage with the platform content after signing up. This suggests strong initial interest and motivation among users.

(3) **Watch-to-Purchase Duration:** The average duration of 26 days from watching the first lecture to making a purchase suggests that there is a significant gap between engagement with the platform content and conversion to paying customers. This could indicate that users take time to evaluate the platform before deciding to make a purchase.

(4) The student with ID 268727 first watched a video on the 365 Data Science platform on the 27th of March 2022 but never made a purchase afterward.

**Recommendations & Conclusion**

Based on the results, the following actions are recommended to improve conversion rate and reduce the Watch-to-Purchase Duration: 

1. **Targeted Marketing:** Develop targeted marketing strategies to encourage more users to convert to paying customers. This could include personalized email campaigns, "hard-to-reject" promotional offers, or targeted advertisements based on user engagement behavior.

2. **Nurture Leads:** Implement lead nurturing strategies to engage users who have watched platform content but have not yet made a purchase. This could involve sending follow-up emails with additional resources, offering free trials or demos (for more days than currently offered), or providing incentives to encourage conversion.

3. **Optimize Content:** Analyze platform content to identify high-performing topics or courses that drive conversion and prioritize the creation of similar content. Additionally, optimize content placement and recommendations to guide users towards courses that are more likely to lead to conversion.

4. **Track and Analyze:** Continuously track and analyze user engagement metrics to identify trends, patterns, and areas for improvement. Use data-driven insights to refine marketing strategies, enhance the user experience, and optimize conversion funnels over time.
   
In conclusion, current conversion rate suggests that the 365 Data Science platform has a good free-to-paid conversion rate of students engaging with courses on the platform. However, focus needs to be turned on strategies to reduce the average Watch-to-Purchase Duration. Overall, the resulting metrics provide valuable insights into user behavior and the effectiveness of the platform's monetization strategy.
