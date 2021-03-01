# Data dive:

 This repository contains scripts and data for the ODM data dive.
 

## Scoot loop data:

Open Data Manchester have been scraping data on Greater Manchester's SCOOT (Split Cycle Offset Optimisation Technique) loop system from the [TfGM developer portal](https://developer.tfgm.com) 

 - You can download the database as a .bacpac file [here](https://odmblob.blob.core.windows.net/dbdumps/odm-2021-2-18-19-0.bacpac).

 - `loop_info.csv` contains information on the location and ID of each loop.

 - `Creating Shapefiles.R` contains code for creating shapefiles from the loop info.
 
 - `scoot_linestring` contains shapefiles for all the SCOOT loops in Greater Manchester, represented as linestrings. 

**Data collected:**

Scoot name,
Description,
Time,
Congestion percentage,
Current flow,
Average speed,
Link travel time,
Start latitude,
Start longitude,
End latitude,
End longitude

## Air quality data:

- `air_quality.csv` contains cleaned data on air quality, you can find the raw data [here](https://github.com/OpenDataManchester/data/tree/master/themes/Our%20Streets%20Chorlton/Air%20Quality) and more information on the units [here](https://www.earthsense.co.uk/zephyr).
 
- `Cleaning_AQ.Rmd` contains the scripts for cleaning the raw data.

Open Data Manchester have installed two Earthsense Zephyr solar-powered air quality sensors to measure air quality at selected locations in Chorlton and Chorlton Park during 2021 as part of the Our Streets Chorlton project.

The sensors will be measuring Nitrous Oxide (NO), Nitrous Dioxide (NO2), Ozone (O3) and other microscopic particles that come from industry, traffic and fires, all of which are known to have an impact on our health if we are exposed to high concentrations.

One unit will be permanently located at Chorlton’s ‘Four Banks’ crossroad of Wilbraham Road and Barlow Moor Road, with the other rotated between the three chosen ‘mini project’ locations of a school, a trading area and a residential street.

All data collected will be made openly available for everyone to access, explore, use and share.

The sensors only measure air-quality data and do not collect personally identifiable information.

**Data collected:**

Temperature (C),
Humidity (%RH),
NO2 (ug/m3),
O3 (ug/m3),
NO (ug/m3),
PM1 (ug/m3),
PM2.5 (ug/m3),
PM10 (ug/m3),
Ambient temp (C),
Ambient humidity (%RH),
Ambient pressure (hPa)

NO2 = Nitrogen Dioxide | O3 = Ozone | NO = Nitric Oxide | PM = Particulate Matter
