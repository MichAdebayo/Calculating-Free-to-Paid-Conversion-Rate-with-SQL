# Choose the database to use for the project

USE db_course_conversions;

# Inspect database tables

select * from student_engagement;
select * from student_info;
select * from student_purchases;

# Create table for the new result dataset to be aggregated

CREATE TABLE db_course_conversions (
    student_id INT(11),
    date_registered DATE,
    first_date_watched DATE,
    first_date_purchased DATE NULL,
    date_diff_reg_watch INT(11),
    date_diff_watch_purch INT(11) NULL
);

# Create sub-query (the new result dataset) and insert into the db_course_conversions table created

Insert into db_course_conversions
Select 
a.*
from
    (SELECT 
        si.student_id,
            si.date_registered,
            MIN(se.date_watched) AS first_date_watched,
            MIN(sp.date_purchased) AS first_date_purchased,
            DATEDIFF(MIN(se.date_watched), si.date_registered) AS days_diff_reg_watch,
            DATEDIFF(MIN(sp.date_purchased), MIN(se.date_watched)) AS days_diff_watch_purch
    FROM
        student_info si
    JOIN student_engagement se ON si.student_id = se.student_id
    LEFT JOIN student_purchases sp ON se.student_id = sp.student_id
    GROUP BY si.student_id
    HAVING MIN(se.date_watched) <= MIN(sp.date_purchased)
        OR MIN(sp.date_purchased) IS NULL) AS a;
        
# Add Main Query to sub-query to calculate metrics such as the conversion rate, average registration-to-watch duration, and average watch-to-purchase duration  
# All metric values are rounded to two decimal places using the ROUND function

SELECT 
    ROUND(((COUNT(a.first_date_purchased) / COUNT(a.first_date_watched)) * 100),
            2) AS conversion_rate,
    ROUND(AVG(a.days_diff_reg_watch), 2) AS av_reg_watch,
    ROUND(AVG(a.days_diff_watch_purch), 2) AS av_watch_purch
FROM
    (SELECT 
        si.student_id,
            si.date_registered,
            MIN(se.date_watched) AS first_date_watched,
            MIN(sp.date_purchased) AS first_date_purchased,
            DATEDIFF(MIN(se.date_watched), si.date_registered) AS days_diff_reg_watch,
            DATEDIFF(MIN(sp.date_purchased), MIN(se.date_watched)) AS days_diff_watch_purch
    FROM
        student_info si
    JOIN student_engagement se ON si.student_id = se.student_id
    LEFT JOIN student_purchases sp ON se.student_id = sp.student_id
    GROUP BY si.student_id
    HAVING MIN(se.date_watched) <= MIN(sp.date_purchased)
        OR MIN(sp.date_purchased) IS NULL) AS a;
    
# Retrieve details about a specific student to  determine thier first watch date

Select * from db_course_conversions where student_id = 268727;
