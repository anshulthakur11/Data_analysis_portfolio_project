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

