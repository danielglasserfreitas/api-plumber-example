#install.packages("data.table")
library("data.table")
fn_create_frame_by_url <- function(url){
    df_frame_csv <- fread(url, encoding = "UTF-8")
    return(df_frame_csv)
}
