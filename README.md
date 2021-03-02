# Data dive:

 This repository contains scripts and data for the ODM data dive.
 

## Scoot loop data:

Open Data Manchester have been scraping data on Greater Manchester's SCOOT (Split Cycle Offset Optimisation Technique) loop system from the [TfGM developer portal](https://developer.tfgm.com). 

 - You can download the database as a .bacpac file [here](https://odmblob.blob.core.windows.net/dbdumps/odm-2021-2-18-19-0.bacpac).

 - `loop_info.csv` contains information on the location and ID of each loop.

 - `Creating Shapefiles.R` contains code for creating shapefiles from the loop info.
 
 - `scoot_linestring` contains shapefiles for all the SCOOT loops in Greater Manchester, represented as linestrings. 
 
 - `loop_map.html` is an interactive map of the SCOOT network.

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

