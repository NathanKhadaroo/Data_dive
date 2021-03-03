# Data dive:

 This repository contains scripts and data for the ODM data dive.
 

## Scoot loop data:

Open Data Manchester have been scraping data on Greater Manchester's SCOOT (Split Cycle Offset Optimisation Technique) loop system from the [TfGM developer portal](https://developer.tfgm.com). 

 - You can download the database as a .bacpac file [here](https://odmblob.blob.core.windows.net/dbdumps/odm-2021-2-18-19-0.bacpac).
 
 - [Sam](https://github.com/sam-odm) has queried the db for some sample scoot data available in csv files, which you can find [here](https://github.com/OpenDataManchester/data/tree/master/themes/Our%20Streets%20Chorlton/TfGM%20Scoot%20Loop/Data).
 
 - `cleaned_scoots.csv` is the above data merged, cleaned, and with loop information added.

 - `Cleaning_scoots.R` contains the code for automating merging, cleaning, and adding loop info used to generate `cleaned_scoots.csv`. I t may be usefull if you want to query the db yourself. 

 - `loop_info.csv` contains information on the location and ID of each loop, you can also find usefull diagrams as pdf files [here](https://github.com/OpenDataManchester/data/tree/master/themes/Our%20Streets%20Chorlton/TfGM%20Scoot%20Loop)

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

