#Loading the Workiz Jobs sheet (2021&2022)
df_jobs = read.csv('Downloads/cleaned_data_workiz_jobs(2)(1).csv')

#Formatting the date
library(lubridate)
parsed_date <- as.POSIXct(df_jobs$Created, format = "%Y-%m-%d %H:%M:%S")
df_jobs$Created <- format(parsed_date, "%b %Y")

#Changing names in the sources column of the jobs sheet
df_jobs$Source[df_jobs$Source %in% c("GLSA_P", "GLSA_S", "GLSA_V", "Google Local Service Ad - Portland", "Google Local Service Ad - Salem", "Google Local Service Ad - Vancouver", "Google")] <- c("            Google Local Service Ads")
df_jobs$Source[df_jobs$Source %in% c("Comcast", "TV Commercial", "Fox12", "KPTV Commercial")] <- c("            Television")
df_jobs$Source[df_jobs$Source %in% c("Business Card", "Yardsign", "Yard Sign PDX")] <- c("            Print/Promo")
df_jobs$Source[df_jobs$Source %in% c("Our Website", "Company Website")] <- c("         Advertising & Marketing")
df_jobs$Source[df_jobs$Source %in% c("BNI Chapter", "Thumbtack", "Yelp", "Text Blast")] <- c("            Paid Networking Groups")
df_jobs$Source[df_jobs$Source %in% c("DuckDuckGo")] <-c("            Lead Generator (deleted)")
df_jobs$Source[df_jobs$Source %in% c("Facebook", "FB paid Portland", "FB paid Vancouver")] <-c("            Facebook Ads")
df_jobs$Source[df_jobs$Source %in% c("GMB_P", "GMB - Portland", "GMB - Salem","Google PPC Salem", "Google PPC Portland", "Google PPC KWQ", "GMB_S", "GPPC_P", "GPPC_S", "GPPC_K", "GPPC_V", "GPPC_V_calls", "GPPC_P_calls", "GMB_V")] <- c("            Google PPC")


#Null specific entries in source column
df_jobs$Source[df_jobs$Source == "Returning Client"] <- NA
df_jobs$Source[df_jobs$Source == "Friend Recommended"] <- NA
df_jobs$Source[df_jobs$Source == "Metro.gov"] <- NA
df_jobs$Source[df_jobs$Source == "No Source Listed"] <- NA
df_jobs$Source[df_jobs$Source == "Word of Mouth/ Referral"] <- NA
df_jobs$Source[df_jobs$Source == "Net Vendor"] <- NA
df_jobs$Source[df_jobs$Source == "Saw Vehicle"] <- NA
df_jobs$Source[df_jobs$Source == "Legacy"] <- NA
df_jobs$Source[df_jobs$Source == "Instagram"] <- NA
df_jobs$Source[df_jobs$Source == "Yahoo"] <- NA
df_jobs$Source[df_jobs$Source == "JenVanZee"] <- NA

Cleaned_JOBS_FP = df_jobs
write.csv(Cleaned_JOBS_FP, file = "Cleaned JOBS file FP.csv")




