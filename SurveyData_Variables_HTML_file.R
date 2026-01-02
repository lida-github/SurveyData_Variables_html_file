## Libraries ####

library(haven)
library(sjPlot)

## Dirs ####

setwd("...") # Set a working directory

# Set general information ----

dataset.citation <- '' # Add citation information for a dataset to which a data file belongs (e.g.: Butkevičienė, Eglė; Bryer, Thomas; Jurkevičienė, Jurgita; Morkevičius, Vaidas; Valentinavičius, Vytautas, 2025, "ISSP 2022: Family and Changing Gender Roles V, Lithuania, May - July 2024", https://hdl.handle.net/21.12137/W2HMFW, Lithuanian Data Archive for SSH (LiDA), V3)
dataset.id.lida <- '' # Add LiDA ID of a dataset (e.g.: LiDA_SurveyData_0566)
file.version <- '' # Add version of a data file (e.g.: v1.0)
files.dir <- 'files/' # Directory where a data file is stored

# Import an SPSS data file ----

file <- read_sav(paste0(files.dir,dataset.id.lida,"_Data_",file.version,".sav")) # Title of an SPSS data file should be as follows: LiDA_SurveyData_0566_Data_v1.0.sav

# Save an HTML file of data variables and their values with various additional information ----

sjPlot::view_df(file,
                alternate.rows=TRUE,
                show.id=TRUE,
                show.type=TRUE,
                show.values=TRUE,
                show.string.values=TRUE,
                show.labels=TRUE,
                show.frq=TRUE, # Comment, when access to an SPSS data file is restricted (or embargo is applied)
                show.prc=TRUE, # Comment, when access to an SPSS data file is restricted (or embargo is applied)
                show.wtd.frq=FALSE,
                show.wtd.prc=FALSE,
                show.na=TRUE,
                max.len=9999,
                sort.by.name=FALSE,
                wrap.labels=200,
                verbose=FALSE,
                encoding=NULL,
                file=paste0(files.dir,dataset.id.lida,"_Variables_",file.version,".html"), # Title of the produced HTML file: LiDA_SurveyData_0566_Variables_v1.0.html
                use.viewer=TRUE,
                remove.spaces=TRUE)

# Add citation information to the produced HTML file ----

html.file <- readLines(paste0(files.dir,dataset.id.lida,"_Variables_",file.version,".html"),-1)
# head(html.file)
html.file[2] <- paste0("<caption><b>Dataset</b>: ",dataset.citation,"<br/><br/><b>Data file</b>: ",dataset.id.lida,"_Data_",file.version,".sav</caption>")
writeLines(html.file,paste0(files.dir,dataset.id.lida,"_Variables_",file.version,".html"))

## End ####


