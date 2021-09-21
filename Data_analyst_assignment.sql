use e_commerce;
SELECT * from sellers_dataset;
SELECT * from leads;

select distinct business_segment from sellers_dataset;
select distinct lead_type from sellers_dataset;
select distinct lead_behaviour_profile from sellers_dataset;
select distinct business_type from sellers_dataset;
select signup_date from leads;
select distinct mkt_origin from leads;

# Displaying sellers unique id and business segmwnt from 'reseller','manufacturer' business type
SELECT 
    seller_id,
    business_segment,
    COUNT(business_segment) AS no_of_sellers_from_business_segment
FROM
    sellers_dataset
WHERE
    business_type IN ('reseller' , 'manufacturer')
GROUP BY business_segment;

# Displaying lead_id,landing_page_id wrt its signup_date 
SELECT 
    lead_id, landing_page_id, signup_date
FROM
    leads

order by signup_date asc;

# Displaying avg_onboarding time with their business segment and business type
SELECT 
    business_segment, business_type,
    (seller_onboarded_at - signup_date) AS avg_onboarding_time
FROM
    leads AS l
        INNER JOIN
    sellers_dataset AS s ON l.lead_id = s.lead_id;


# Displaying leads with their origin from they came and converted to sellers.
SELECT 
    l.lead_id, mkt_origin
FROM
    leads AS l
        INNER JOIN
    sellers_dataset AS s ON l.lead_id = s.lead_id;


# Displaying signup date on which signups are happened
SELECT 
    count(lead_id) as number_of_signups_per_date, signup_date
FROM
    leads
GROUP BY signup_date
ORDER BY count(lead_id) desc;



# Displaying no. of sellers wrt business segment
SELECT 
    COUNT(seller_id) AS sellers, business_segment
FROM
    sellers_dataset
GROUP BY business_segment;


# Displaying most popular landing page with its market origin
SELECT 
    landing_page_id,
    COUNT(landing_page_id) AS no_of_most_visited_landing_page,
    mkt_origin
FROM
    leads
GROUP BY landing_page_id
ORDER BY COUNT(landing_page_id) DESC
limit 10;


# most popular landing page which conversion is higher from lead to seller
SELECT 
    landing_page_id, (COUNT(s.seller_id) / COUNT(l.lead_id)) * 100 as percentage
FROM
    sellers_dataset AS s
        right JOIN
    leads AS l ON s.lead_id = l.lead_id
group BY landing_page_id 
order by percentage desc limit 40;


# signup conversion rate for every mkt region
SELECT 
    landing_page_id, (COUNT(s.seller_id) / COUNT(l.lead_id)) * 100 as percentage_of_conversion_for_mkt_origin ,mkt_origin
FROM
    sellers_dataset AS s
        right JOIN
    leads AS l ON s.lead_id = l.lead_id
group BY mkt_origin 
order by percentage_of_conversion_for_mkt_origin  desc;

