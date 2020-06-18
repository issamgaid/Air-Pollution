pollutantmean <- function(directory, pollutant = "nitrate", id= 1:332)  
{
  ##here ho to use this function
  ##pollutantmean("specdata", "sulfate", 1:10)
  ## [1] 4.064128
  
  ##pollutantmean("specdata", "nitrate", 70:72)
  ## [1] 1.706047
  
  ##pollutantmean("specdata", "nitrate", 23)
  ## [1] 1.280833
  
  wd<- getwd() 
  fullPath<-paste0(wd,"/",directory,"/")
  mean_polldata <- c()
  files <- list.files(fullPath)
  for(i in id) 
  {
    ##read the current file
    curr_file <- read.csv(paste0(fullPath,files[i]), header = T, sep = ",")
    
    ##remove na from the current file for the selected pollutant
    remove_na <- curr_file[!is.na(curr_file[, pollutant]), pollutant]
    
    ##add new values to the same vector mean_polldata
    mean_polldata <- c(mean_polldata, remove_na)
  }
  {
    mean_results <- mean(mean_polldata)
    ##return(round(mean_results, 3))
    return(mean_results)
  }
} 
