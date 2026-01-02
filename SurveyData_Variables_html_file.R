## Libraries ####

library(haven)
library(sjPlot)

## Dirs ####

setwd("C:/Users/vaimork/OneDrive - Kaunas University of Technology/DAtA centras/Dataverse/R_scripts/SurveyData_Variables_html_file/")
dir()

# Set general info ----

dataset.citation <- 'Butkevičienė, Eglė; Bryer, Thomas; Jurkevičienė, Jurgita; Morkevičius, Vaidas; Valentinavičius, Vytautas, 2025, "ISSP 2022: Family and Changing Gender Roles V, Lithuania, May - July 2024", https://hdl.handle.net/21.12137/W2HMFW, Lithuanian Data Archive for SSH (LiDA), V3'
dataset.id.lida <- "LiDA_SurveyData_0566"
file.version <- "v1.0"
files.dir <- "files/"

# Import data file ----

file <- read_sav(paste0(files.dir,dataset.id.lida,"_Data_",file.version,".sav"))
# names(file);dim(file)

# Save data file labels ----

sjPlot::view_df(file,
                alternate.rows=TRUE,
                show.id=TRUE,
                show.type=TRUE,
                show.values=TRUE,
                show.string.values=TRUE,
                show.labels=TRUE,
                show.frq=TRUE, # Užkomentuoti, jei prie duomenų prieiga apribota (ar taikomas embargas)
                show.prc=TRUE, # Užkomentuoti, jei prie duomenų prieiga apribota (ar taikomas mbargas)
                #show.wtd.frq=FALSE,
                #show.wtd.prc=FALSE,
                show.na=TRUE,
                max.len=9999,
                sort.by.name=FALSE,
                wrap.labels=200,
                verbose=FALSE,
                #CSS=NULL,
                encoding=NULL,
                file=paste0(files.dir,dataset.id.lida,"_Variables_",file.version,".html"),
                use.viewer=TRUE,
                remove.spaces=TRUE)

# Add citation info ----

html.file <- readLines(paste0(files.dir,dataset.id.lida,"_Variables_",file.version,".html"),-1)
# head(html.file)
html.file[2] <- paste0("<caption><b>Dataset</b>: ",dataset.citation,"<br/><br/><b>Data file</b>: ",dataset.id.lida,"_Data_",file.version,".sav</caption>")
writeLines(html.file,paste0(files.dir,dataset.id.lida,"_Variables_",file.version,".html"))

## End ####
