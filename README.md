# 🗳️ Election Data Analysis — SQL Server

## 📌 Project Overview

This project focuses on analyzing **election data using Microsoft SQL Server**. The objective is to extract meaningful insights from election-related data using SQL queries and analytical techniques.

The project demonstrates practical SQL skills including **data exploration, filtering, aggregation, joins, subqueries, CTEs, window functions, ranking, and analytical calculations**.

---

## 🎯 Project Objectives

* Analyze election results using SQL Server
* Identify top-performing candidates and parties
* Calculate votes and vote percentages
* Compare election performance across different regions
* Analyze winning and losing candidates
* Use advanced SQL techniques to answer business-style questions
* Generate meaningful insights from raw election data

---

## 🛠️ Tools & Technologies

* **Microsoft SQL Server**
* **SQL Server Management Studio (SSMS)**
* **SQL**

### SQL Concepts Used

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* CASE WHEN
* Aggregate Functions
* JOINs
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* RANK()
* ROW_NUMBER()
* LAG()
* SUM() OVER()
* Percentage Calculations
* NULL Handling
* Date Functions

---

## 📊 Analysis Performed

The project includes SQL analysis such as:

### 🏆 Election Winners

* Identify winning candidates
* Find candidates with the highest number of votes
* Determine winners by constituency/region

### 🗳️ Party Performance

* Calculate total votes received by each party
* Rank parties based on vote count
* Compare party performance across regions

### 📈 Vote Analysis

* Calculate vote percentages
* Analyze vote distribution
* Compare candidates within the same constituency
* Identify high and low vote counts

### 📍 Regional Analysis

* Analyze election results by state/region
* Find the highest-performing parties in different regions
* Compare regional voting patterns

---

## 🧠 Key SQL Techniques

Example of ranking candidates based on votes:

```sql
SELECT
    Candidate,
    Party,
    Votes,
    RANK() OVER (
        PARTITION BY Constituency
        ORDER BY Votes DESC
    ) AS Candidate_Rank
FROM ElectionResults;
```

Example of calculating vote contribution:

```sql
SELECT
    Party,
    SUM(Votes) AS Total_Votes,
    ROUND(
        SUM(Votes) * 100.0 /
        SUM(SUM(Votes)) OVER (),
        2
    ) AS Vote_Percentage
FROM ElectionResults
GROUP BY Party;
```

---

## 📁 Project Structure

```text
Election-SQL-Project/
│
├── README.md
│
├── SQLScript.sql
│
└── Dataset/
    └── election_data.csv
```

---

## 🔍 Key Insights

The SQL analysis can be used to identify:

* 🏆 Winning candidates and parties
* 📊 Total votes received by each party
* 📈 Vote share percentages
* 🗺️ Regional election performance
* 🥇 Top-ranked candidates
* 📉 Candidates with comparatively lower vote counts

---

## 💡 Skills Demonstrated

This project demonstrates my ability to:

* Write efficient SQL queries
* Work with relational datasets
* Perform exploratory data analysis using SQL
* Use advanced SQL techniques
* Apply window functions for analytical problems
* Build complex queries using CTEs and subqueries
* Transform raw data into meaningful insights

---

## 🚀 Future Improvements

* Build an interactive **Power BI Election Dashboard**
* Connect Power BI directly to SQL Server
* Perform advanced statistical analysis
* Add year-over-year election comparisons
* Automate the data pipeline
* Create stored procedures and views for reusable analysis

---

## 👨‍💻 Author

**Mohd Razi**

Aspiring **Data Engineer | SQL | Python | Power BI**

---

⭐ If you find this project useful, feel free to explore the SQL scripts and analysis.
