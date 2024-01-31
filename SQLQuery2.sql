WITH hotels AS (
    SELECT *
    FROM dbo.[hotel_revenue_historical_full-2 2019]
    UNION
    SELECT *
    FROM dbo.[hotel_revenue_historical_full-2 2018]
    UNION
    SELECT *
    FROM dbo.[hotel_revenue_historical_full-2 2020]
)

SELECT COALESCE(stays_in_week_nights, 0) + COALESCE(stays_in_weekend_nights, 0) AS total_stays
FROM hotels;

WITH hotels AS (
    SELECT *
    FROM dbo.[hotel_revenue_historical_full-2 2019]
    UNION
    SELECT *
    FROM dbo.[hotel_revenue_historical_full-2 2018]
    UNION
    SELECT *
    FROM dbo.[hotel_revenue_historical_full-2 2020]
)

SELECT
    arrival_date_year,
    COALESCE(stays_in_week_nights, 0) + COALESCE(stays_in_weekend_nights, 0) AS total_stays,
    SUM((COALESCE(stays_in_week_nights, 0) + COALESCE(stays_in_weekend_nights, 0)) * CAST(adr AS DECIMAL(10, 2))) AS total_revenue
FROM
    hotels
GROUP BY
    arrival_date_year;



WITH hotels AS (
    SELECT *
    FROM dbo.[hotel_revenue_historical_full-2 2019]
    UNION
    SELECT *
    FROM dbo.[hotel_revenue_historical_full-2 2018]
    UNION
    SELECT *
    FROM dbo.[hotel_revenue_historical_full-2 2020]
)

SELECT * from hotels
left join dbo.[hotel_revenue_historical_full-2 market_segment]
on hotels.market_segment=[hotel_revenue_historical_full-2 market_segment].market_segment

left join dbo.[hotel_revenue_historical_full-2 meal_cost]
on [hotel_revenue_historical_full-2 meal_cost].meal=hotels.meal

