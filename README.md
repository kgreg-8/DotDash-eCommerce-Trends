# DotDash's Background
Founded at the end of 2018, DotDash provides customers around the world with high-tech electronics and accessories. With a wealth of order, customer, and geographic data, DotDash is now prioritizing analysis to uncover valuable insights. These insights will be pivotal in identifying opportunities for improvement and providing actionable next steps to support growth in a competitive landscape. 


## Overview
From 2019 - 2022 over 108K orders were placed, generating $28.1M in sales. Across these 4 years, sales and order count are up 28%. Not to be overlooked is DotDash's meteoric sales boom in 2020 (163%). A signficant portion of this rise can be attributed to the paradigm shift in customer behavior, to order online, observed during the start of the pandemic. However beginning in 2022, the trend in sales, average order value (aov) and order count has taken a sharp dive. Hence, the battle lies in finding ways to maintain the value captured during 2020 and 2021, which should outline our path to longer-term growth.

The ERD for this project is as follows:
![ERD_DotDash](https://github.com/kgreg-8/SQL-DotDash-Analysis/assets/148907539/f8d7559c-0c7c-4030-b749-64a7f8e24398)

## Summary of Insights

### Seasonality 
DotDash sees a holiday sales surge, each year in November (18%) and December (23%). Additionally, a bounceback in sales of roughly 18% MoM is experienced in March, after sharp declines in sales occur in February. The worst months are February and October, where sales fall around -27% on average during these months. While DotDash's sales trend follows common seasonality for companies selling electronics, these figures offer insights into consumer behavior. For example, the ‘best’ deals in consumers' eyes start to run through the holiday season so customers in October may be waiting for ‘deal season’ to start in November or are finding deals elsewhere.


<img width="827" alt="Screenshot 2024-02-25 at 10 17 54 AM" src="https://github.com/kgreg-8/DotDash-eCommerce-Trends/assets/148907539/9038b66a-870f-41f9-b778-cf58b7ef12c8">


### Product Performance
Apple Airpods are DotDash's most popular product by order count, comprising 45% of all orders (45K+). The 27in 4K Gaming Monitor is DotDash's top revenue generating product, generating almost $10M (35% of total sales). Paired with the Gaming Monitor and Airpods, the Macbook Air and ThinkPad Laptops generate 96% of revenue. DotDash should prioritize the marketing of these top 4 products (Airpods, Gaming Monitor, Macbook Air & ThinkPad) over the rest of its current catalog to maintain market presence. 

Of importance to note, DotDash sees a significant amount of orders of the Samsung Charging Cable Pack (20%). Even though this product generates 2% of total sales, an opportunity to capture more value by offering a bundle version of this product, with a relevant device, exists. 

<img width="699" alt="Screenshot 2024-02-25 at 10 04 56 AM" src="https://github.com/kgreg-8/DotDash-eCommerce-Trends/assets/148907539/5c8c89b7-9502-4444-b279-22622000248c">


### Global Reach
DotDash had customers place orders from 191 countries. Of these countries, 17 countries drive 85% of total sales (shown below). Maintaining strong presences in these countires should be a top priority, especially as DotDash angles to maintain some of the excess value captured from 2020. Further, it would serve DotDash well to identify similarities between countries because this analysis can be used to identify new market opportunities. Countries in the APAC region appear to be a solid option to start this analysis. On a high level, even though the APAC region provides 12% of total sales, customers in this region have the highest AOV by a significant margin. Thus suggesting experimentation with efforts to increase brand reach within these countries may drive future sales growth. 

![Screenshot 2024-02-25 at 9 24 47 AM](https://github.com/kgreg-8/DotDash-eCommerce-Trends/assets/148907539/8ca674c1-4072-409d-92e6-358c71071896)


### Loyalty Program
The loyalty program seems to serve as another viable avenue to maintain some of the value captured in 2020's boom. After it's rollout in 2019, significant customer adoption did not occur until the beginning of 2021. Sales and order count from loyalty customers exceeded that of non-loyalty customers in 2021. This trend has continued through 2022 with the AOV of loyalty customers now also exceeding that of non-loyalty customers. 

Looking into our marketing efforts and how it translates to loyalty program signups:
- The direct marketing channel has the highest number of loyalty participants: 23.5K signups (40% signup rate)
- The email marketing channel has the highest average signup rate: 59% signup rate (~8K signups)

Doing a deeper assessment of the loyalty program to breakdown what consumers are using or seeming to enjoy the most will provide clarity on ways to grow this program in a manner aligned with DotDash's customers. 



![Screenshot 2024-02-25 at 10 26 19 AM](https://github.com/kgreg-8/DotDash-eCommerce-Trends/assets/148907539/624299e5-5039-46bc-b46b-2ebd4861b308)




## Recommendations

### Product Performance
1) 96% of current sales come from products in these categories:
-- Wireless In-Ear Headphones
-- High-End Gaming Monitors
-- Lighterweight Laptop
DotDash should expand its product catalog to offer similar, in-class products. Doing so *will* improve sales performance and brand reach.

### Global Presence
1) Knowing 85% orders and sales come from 17 countires, DotDash should concentrate marketing efforts on maintaining market penetration in these countries in the short-term. To create growth opportunities over the longer term, DotDash should create a project to identify 'similar' countries, to its top performers.

2) It is also in DotDash's best interest to prioritize experimenting in the APAC region. Even though this region accounts for 12% of sales, it has the highest AOV. Pairing that with an understanding that consumer tendencies in this region are to purchase higher-priced "status symbols", efforts to penetrate this market should provide a significant boost in sales.

### Loyalty Program
There is a cause for concern that should be noted and monitored for a set amount of time before decisions to continue or cut the program are made.
- From Sep through Dec ‘22, non-loyalty customer sales, aov and order count has surpassed the metrics of loyalty customers. This is the first time since Dec ‘20 order count of non-loyalty customers has exceeded that of loyalty customers.
-- Until these most recent micro trends, there has been evidence to support the loyalty program as a key way to maintaining captured value, given DotDash's overall sales have been declining since ‘20 (add a part about AOV).

Due to this concerning recent trend in the loyalty program, DotDash should cut affiliate channel marketing efforts and focus efforts on reaching customers through the direct and email channels. These channels have led to the most signups and have a significant signup rate:
- Direct Marketing Channel: 40% signup rate | 23.5K signups
- Email Marketing Channel: 59% signup rate | 8K signups



_Final Note: The pivot tables and charts outlining this analysis can be found in the attached workbooks._
