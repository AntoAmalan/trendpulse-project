# TrendPulse - Part 4: SQL Analysis & Spreadsheet Report

This section documents the database schema design, data migration using Python, execution of analytical SQL queries, and the creation of the analytical Excel report.

---

## 1. Database Schema
The MySQL database `trendpulse_db` consists of three normalized tables:
- **`categories`**: Stores category IDs and their corresponding names.
- **`videos`**: Stores video metadata, titles, channels, and foreign key references to categories.
- **`trending_records`**: Stores daily trending metrics (views, likes, dislikes, comments) mapped to specific videos and countries.

---

## 2. SQL Analysis Queries & Results

### **Query 1: Filtering Views (SELECT & WHERE)**
Finds all trending records where views exceed 1,000,000.
```sql
SELECT video_id, country, views, likes 
FROM trending_records 
WHERE views > 1000000;
```
![Query 1 Result](images/result-1.png)

---

### **Query 2: Top Viewed Videos (ORDER BY & LIMIT)**
Retrieves the top 5 most-viewed trending records.
```sql
SELECT video_id, country, views 
FROM trending_records 
ORDER BY views DESC 
LIMIT 5;
```
![Query 2 Result](images/result-2.png)

---

### **Query 3: Unique Countries (DISTINCT)**
Lists all unique countries present in the dataset.
```sql
SELECT DISTINCT country 
FROM trending_records;
```
![Query 3 Result](images/result-3.png)

---

### **Query 4: Category Aggregation (GROUP BY & HAVING)**
Finds categories with an average view count greater than 500,000.
```sql
SELECT v.category_id, AVG(t.views) AS avg_views
FROM videos v
JOIN trending_records t ON v.video_id = t.video_id
GROUP BY v.category_id
HAVING AVG(t.views) > 500000;
```
![Query 4 Result](images/result-4.png)

---

### **Query 5: Inner Join (Videos & Categories)**
Retrieves video titles with their corresponding category names.
```sql
SELECT v.title, v.channel_title, c.category_name
FROM videos v
INNER JOIN categories c ON v.category_id = c.category_id;
```
![Query 5 Result](images/result-5.png)

---

### **Query 6: Left Join (Category Video Counts)**
Counts how many videos belong to each category, including unmatched categories.
```sql
SELECT c.category_name, COUNT(v.video_id) AS video_count
FROM categories c
LEFT JOIN videos v ON c.category_id = v.category_id
GROUP BY c.category_name;
```
![Query 6 Result](images/result-6.png)

---

### **Query 7: Country Aggregations (SUM & AVG)**
Calculates total views and average likes grouped by country.
```sql
SELECT country, SUM(views) AS total_views, AVG(likes) AS avg_likes
FROM trending_records
GROUP BY country;
```
![Query 7 Result](images/result-7.png)

---

### **Query 8: Multi-Table Join & Ranking**
Joins all three tables to list the top 10 trending videos with full contextual details.
```sql
SELECT t.country, v.title, c.category_name, t.views
FROM trending_records t
INNER JOIN videos v ON t.video_id = v.video_id
INNER JOIN categories c ON v.category_id = c.category_id
ORDER BY t.views DESC
LIMIT 10;
```
![Query 8 Result](images/result-8.png)

---
