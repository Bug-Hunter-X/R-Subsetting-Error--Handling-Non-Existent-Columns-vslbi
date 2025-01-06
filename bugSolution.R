```R
# This improved code checks for the existence of columns before subsetting
# and handles cases where columns are missing more gracefully.

data <- data.frame(a = 1:3, b = 4:6, c = 7:9)
cols_to_select <- c("a", "d")

# Check if all columns exist
existing_cols <- cols_to_select %in% names(data)

if(all(existing_cols)){
  subset_data <- data[, cols_to_select]
} else {
  # Handle missing columns (e.g. select only existing columns or return warning)
  missing_cols <- cols_to_select[!existing_cols]
  warning(paste("Columns", paste(missing_cols, collapse = ", "), "do not exist in the data frame."))
  subset_data <- data[, cols_to_select[existing_cols]]
}
print(subset_data)
```