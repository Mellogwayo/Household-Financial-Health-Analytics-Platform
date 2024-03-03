# Install and load necessary packages
install.packages(c("readtext", "readr"))  # Install required packages
library(readtext)  # Load necessary functions from readtext
library(readr)     # Load necessary functions from readr

# Function to parse data dictionary from RTF file and write to CSV
parse_data_dictionary <- function(file_name, output_file_name) {
  # Read the RTF document
  doc <- readtext(file_name)
  
  # Extract content
  content <- doc$text
  
  # Convert the content into a suitable CSV format (e.g., split by lines)
  lines <- strsplit(content, "\n")[[1]]
  
  # Initialize empty data frame to store parsed values
  parsed_data <- data.frame(Pos. = character(),
                            Variable = character(),
                            `Variable label` = character(),
                            stringsAsFactors = FALSE)
  
  # Loop through each line of the data
  for (line in lines) {
    # Split the line by tabs
    split_content <- unlist(strsplit(line, "\t"))
    
    # Extract values after '=' sign
    values <- gsub(".*=\\s*", "", split_content)
    
    # If the length of values is less than the number of columns in parsed_data, pad it with NA values
    if (length(values) < ncol(parsed_data)) {
      values <- c(values, rep(NA, ncol(parsed_data) - length(values)))
    }
    
    # Assign values to respective columns
    parsed_data <- rbind(parsed_data, values)
  }
  
  # Remove the first row, which was just used for initialization
  parsed_data <- parsed_data[-1, ]
  
  # Rename the columns of the DataFrame
  colnames(parsed_data) <- c("Position", "Variable", "Variable label")
  
  # Remove rows with non-numeric values in the "Pos." column
  parsed_data <- parsed_data[grepl("^\\d+$", parsed_data$Position), ]
  
  # Write the parsed data to a new CSV file
  write.csv(parsed_data, output_file_name, row.names = FALSE)
}


# Parse "jkl_indresp_ukda_data_dictionary.rtf" and write to CSV
parse_data_dictionary("jkl_indresp_ukda_data_dictionary.rtf", "indresp_data_dictionary.csv")

# Parse "jkl_hhresp_ukda_data_dictionary.rtf" and write to CSV
parse_data_dictionary("jkl_hhresp_ukda_data_dictionary.rtf", "hhresp_data_dictionary.csv")
