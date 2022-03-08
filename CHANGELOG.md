# Changelog
This file contains the notable changes to the project

## Version 2022-03-07

### New
    - Checked bike types and count
    - Added ride duration mins
    - Added day of week
    - Query descriptive analysis
    - Add categories by ride duration
    - Query ride duration distribution
    - Query rideable type percentage
    - Query usage by hour, day and month
    - Assigned peak season (May to Oct) and off season (Nov to Apr)
    - Query station usage according to season in different user group
    - Plot viz in Tableau

### Fixes
    - Re-upload July tripdata, due to wrong file was uploaded.
    - Fixed negative ride duration. Assuming started_at and ended_at was mixed in source file.

## Version 2022-03-06

### New
    - Loaded tripdata tables to BigQuery by upload or via Google Drive (for CSV > 100 MB)

### Changes
    -  Union all monthly tripdata tables
