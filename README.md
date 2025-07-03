
# Death Row Meal Request Analysis

##  Project Overview
This project explores trends and patterns in last meal requests from US death row inmates. Using a publicly sourced dataset of recorded meal requests, I aimed to uncover which types of meals were most commonly requested. I gave myself a budget of 24 hours to see what I could achive with a tight timeframe. 

##  Data Source
The data for this project was sourced from the publicly available dataset on **Intro to Statistics**:  
[https://introstat.weebly.com/death-row-meals.html](https://introstat.weebly.com/death-row-meals.html)

##  Tools & Technologies
 **Excel** - for handling raw data and basic data cleaning
- **PostgreSQL** — for advanced data cleaning, categorisation, and analysis
- **Tableau** — for building interactive dashboards and data visualisation
- **CSV files** — for storing query results and transferring data between tools

##  Project Process
1. **Data Cleaning**
   - Removed irrelevant or duplicate entries. Also removed the states from the data.
   - Corrected incorrect year values in the dataset
2. **Data Categorisation**
   - Categorised free-text meal requests into groups like:
     - Refused Meal
     - Dessert
     - Fried Food
     - Main Meal
     - Drink
     - Starter/Side
     - Breakfast Item
     - Other
3. **SQL Analysis**
   - Calculated total requests per year
   - Identified most popular categories overall and by year
   - Tracked trends like refusal rates and category popularity shifts
4. **Exported Clean Results**
   - Saved cleaned, aggregated data as CSV files
5. **Dashboard Build**
   - Designed and built an interactive Tableau dashboard to visualise:
     - Total requests and top-request years
     - Category popularity and % of total requests
     - Top 3 requested years
     - Category counts over time
     - Trends comparing Fried Food vs Desserts
     - Refusal rates over time

##  Key Insights
- Desserts saw a notable rise in popularity after 2000.
- 2013 had the highest refusal rate of any recorded year.
- Fried Food and Desserts consistently outperformed other categories in requests.
- The most popular category overall was 'Main Meal'.

##  Project Deliverables
- Cleaned CSV data files (`/data`)
- SQL query scripts (`/Queries`)
- Tableau dashboard packaged workbook 
- Dashboard screenshots (find attached at the bottle of the README file)
- This README file summarising the full project workflow and findings

##  Future Improvements
- Incorporate additional data like inmate demographics, state details, or execution type (if available)
- Build a live PostgreSQL-Tableau connection to allow dynamic dashboards without manual CSV exports
- Add interactive filters by category or year on the dashboard for deeper exploration
- - Build more KPIs to understand the data better than before
 
### My Opinion & Thoughts
- Overall, I'm really happy with how this project turned out — and I had a lot of fun with it, especially given the quirky nature of the dataset and the personal challenge I set myself to complete it within 24 hours. The time constraint added a bit of pressure, but it made the process even more engaging and rewarding.
Interestingly, one of my strongest parts of the project ended up being the categorisation of the meal request data. It became the foundation for almost every metric, insight, and visualisation I produced. Without effective categorisation, this dataset would’ve remained a list of free-text meal requests with little analytical value. I’m proud of how well this section held up and how it enabled the rest of the project to work. I was also pleased with my time management, successfully delivering a complete end-to-end workflow — from sourcing and cleaning the data, writing SQL queries, exporting results, building a dashboard, and documenting everything on GitHub.
That said, I was a little gutted to have to leave out some of the potentially interesting variables like State data and eventually Date information at a granular level. Including those could have added extra dimensions to the analysis and more storytelling opportunities. Also my SQL queries being very CTE heavy. let's just say I'm a CTE pro now. In future iterations or similar projects, I’d love to incorporate richer datasets with more contextual details. This project has been a great reminder of how even unusual, lighthearted datasets can sharpen real data analysis skills — from SQL query structuring and query building to dashboard design and storytelling.

####  Project Preview

### 📊 Tableau Dashboard — Full View  
![raw_data_screenshot](https://github.com/user-attachments/assets/815877fd-ceb1-4cbb-97f1-4bccc7288b8b)

![Dashboard Full View] ![full_dashboard](https://github.com/user-attachments/assets/605eef80-23db-412c-ac81-4b9afb4b56b0)






