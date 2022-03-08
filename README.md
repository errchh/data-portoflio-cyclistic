# Cyclistic Marketing Bike Share Usage Case Study

Eric Chan 2022-03-03

# Case background

This is the capstone project of the Google Data Analytics Professional Certificate.

Cyclistic Bike Share is a ficitonal company, as a proxy of Divvy Bikes, for this capstone project. The company is based in Chicago. It has 2 pricing tiers - Casual (day-pass users) and Member (Annual membership). Management believes maximising annual members is the key to growth. Marketing team is designing strategies converting casual riders into annual members.

[Divvy Bikes](https://ride.divvybikes.com/how-it-works)

# 1. Ask

## Business task

Find how do casual riders and annual members use Cyclistic bikes differently?

## Key stakeholders

- Lily Moreno, Marketing Director
- Cyclistic marketing analytics team
- Cyclistic executive team

# 2. Prepare

## Description of data source used

### Trip data

The specific dataset used is the Divvy historic trip data ([licensed](https://ride.divvybikes.com/data-license-agreement) by Lyft Bikes and Scooters, LLC)


Data source -- [Divvy trip data](https://ride.divvybikes.com/system-data) (Mar 2021 to Feb 2022)


Reliability --
Second-party data, collected by Chicago Divvy Bikes. Trip data by staff as they service, inspect the system, or under 60 sec (e.g. false start, re-dock) are removed.

Original --
System data from Divvy Bikes

Comprehensive --
Includes the time and GPS location of every trip

Current --
Mar 2021 to Feb 2022 data was used in this analysis

Not cited --
No warranty to be error free

### Map data

Provided by Chicago Data Portal of City of Chicago

[Boundaries of central business district](https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Central-Business-District/tksj-nvsw)

[Boundaries of enterprise zones](https://data.cityofchicago.org/Community-Economic-Development/Boundaries-Enterprise-Zones/64xf-pyvh)

[Bike routes (Jan 2022)](https://data.cityofchicago.org/Transportation/Bike-Routes/3w5d-sru8)

[CTA - 'L' (Rail) Stations - kml](https://data.cityofchicago.org/Transportation/CTA-L-Rail-Stations-kml/4qtv-9w43)

# 3. Process

Documented in [cyclistic-query.sql](cyclistic-query.sql)

# 4. Analyse

Documented in [cyclistic-query.sql](cyclistic-query.sql)

# 5. Visualise and share

## Support visualisations and key findings

[Link to Tableau public](https://public.tableau.com/app/profile/errchh/viz/Cyclisticbikeshare-CasualridersvsAnnualmembers/Casestudy)

### Chicago city overview

![Fig 1. Districts along bike routes](/figure/fig-cyclistic-districts.jpg)

![Fig 2. Household income by district](/figure/fig-cyclistic-household-income.jpg)

### Rideable type

![Fig 3. Percentage of rideable types by number of rides](/figure/fig-cyclistic-rideable-type.jpg)

### Ride duration

![Fig 4. Distribution of ride duration](/figure/fig-cyclistic-ride-durations.jpg)

### Usage patterns

![Fig 5. Usage pattern by hour](/figure/fig-cyclistic-hour.jpg)
![Fig 6. Usage pattern by day](/figure/fig-cyclistic-day.jpg)
![Fig 7. Usage pattern by month](/figure/fig-cyclistic-month.jpg)

### Station usage - Peak season vs Off season

![Fig ](/figure/fig-cyclistic-peak-season-member.jpg)
![Fig ](/figure/fig-cyclistic-off-season-member.jpg)
![Fig ](/figure/fig-cyclistic-peak-season-casual.jpg)
![Fig ](/figure/fig-cyclistic-off-season-casual.jpg)

## Marketing v2 -- what's next?
