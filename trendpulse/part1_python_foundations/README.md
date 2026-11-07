# Part 1: Python Foundations & Data Structures

## Overview
This folder contains foundational Python scripts utilizing standard data structures (lists, dictionaries, tuples, sets), custom cleaning functions, string operations, and rule-based classification logic without external machine learning packages[cite: 3, 4].

## Run Instructions
1. Open `trendpulse_part1.ipynb` in Google Colab[cite: 2, 3].
2. Ensure all required country CSVs (`USvideos.csv`, `GBvideos.csv`, `INvideos.csv`) and `categories.csv` are placed inside the `part1_python_foundations/data/` folder[cite: 2, 3].
3. Run all cells sequentially from top to bottom[cite: 2].

## Data Cleaning & Thresholds
* **Missing Values**: Handled using `try/except` blocks to safely parse integer counts for views, likes, dislikes, and comments.
* **Classification Rules**: Videos are classified as *Viral Hit*, *Steady Performer*, *Divisive*, *Low Engagement*, or *Unrated* based on explicit view and like-ratio thresholds.