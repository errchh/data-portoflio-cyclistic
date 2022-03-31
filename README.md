# Cyclistic Marketing Bike Share User Behaviour Case Study

Eric Chan 2022-03-03

# Case background

This is the capstone project of the Google Data Analytics Professional Certificate.

Cyclistic Bike Share is a ficitonal company, as a proxy of Divvy Bikes, for this capstone project. The company is based in Chicago. It has 2 pricing tiers - Casual (day-pass users) and Member (Annual membership). Management believes maximising annual members is the key to growth. Marketing team is designing strategies converting casual riders into annual members.

[Divvy Bikes](https://ride.divvybikes.com/how-it-works)

# 1. Ask

## Business task

Find how do casual riders and annual members use Cyclistic Bikes differently?

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

    Key:

    Pink                 Bike route
    Beige                Central business district
    Yellow               Enterprise zone
    Black                University
    Green                Tube stations (CTA 'L')

Good availibility of bike routes in Chicago central business district and enterprise zone. There are also tube stations (CTA 'L') and universities along the way.

![Fig 2. Household income by district](/figure/fig-cyclistic-household-income.jpg)

The district at the north of central business district has the highest household income, and is well paved with bike routes.

### Rideable type

![Fig 3. Percentage of rideable types by number of rides](/figure/fig-cyclistic-rideable-type.jpg)

Classic bike is most popular in annual members with 64% of rides in them.

About one-third of both groups use electric bikes.

Casual riders is the only group uses docked bikes.

### Ride duration

![Fig 4. Distribution of ride duration](/figure/fig-cyclistic-ride-durations.jpg)

Mean ride duration minutes (Member) = 13 minutes

Mean ride duration minutes (Casual) = 32 minutes

Over 71% of annual members finish their rides under 15 minutes. 93% finish under 30 minutes.

Casual riders has longer rides on average and almost 24% are over 45 minutes.

### Usage patterns

![Fig 5. Usage pattern by hour](/figure/fig-cyclistic-hour.jpg)

Peak usage of member is at 8 am and 5 pm, with 5 pm almost doubled the number of rides. This shows members use Cyclistic bikes to commute to work. Assuming some would take public transport to the office, and ride a bike to home.

Casual riders has a high usage in the afternoon and peaked at 5 pm.

![Fig 6. Usage pattern by day](/figure/fig-cyclistic-day.jpg)

    Key:

    1 = Sunday, 2 = Monday, ... 7 = Saturday

Member shows a higher usage during the weekdays. Casual riders has higher usage during the weekends.

This confirms annual members use Cyclistic bikes to commute to work, while casual riders mainly use it for leisure.

![Fig 7. Usage pattern by month](/figure/fig-cyclistic-month.jpg)

For both groups, the peak season is from May to October. Off season is from November to April.

Number of rides of annual members peaks across the summer. Casual riders peaks in July and having a higher number of rides than annual members.

Usage in winter remains low for both groups.

### Station usage - Peak season vs Off season

![Fig ](/figure/fig-cyclistic-peak-season-member.jpg)

In peak season, the highest activity of annual member rides are in the central business district.

![Fig ](/figure/fig-cyclistic-off-season-member.jpg)

In off season, the highest activity of annual member rides are pretty much the same locations as those in the peak season.

This suggests annual members use the service as a way to commute to work.

![Fig ](/figure/fig-cyclistic-peak-season-casual.jpg)

In peak season, casual riders has the highest activity near the central business district shore area.

With the fact they are active on weekend afternoons, this suggests leisure may be the reason casual riders use the service.

![Fig ](/figure/fig-cyclistic-off-season-casual.jpg)

In off season, top activities of casual riders spreads across the central business district, and to the north and northwest area next the CBD.

This may suggest casual riders, who use single ride or 1-day pass, use the service as an ad-hoc way to travel across the city in the winter.

## Marketing v2 -- what's next?

The data shows, annual members use Cyclistic bike to commute to office, mainly in the central business district.

In order to convert casual riders to annual members,

1. Location

   - Target casual riders who work in the enterprise zone, and could use Cyclistic bikes to connect tube stations and their offices.

   - Target university students, to bike from tube stations to universities.

2. Pricing

   - The current pricing tier is free rides under 45 minutes.

   - Increase annual member base: New pricing tier of free rides under 30 minutes. Having a lower annual fee, to lower the entrance barrier.

   - Maximise customer lifetime value (CLV): New pricing tier of free rides under 1 hour. Having a higher annual fee, but with a better value per minute charge.

=====

Thank you for reading.

If you have any questions, please feel free to contact me via GitHub or Linkedin.
