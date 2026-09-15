#!/usr/bin/env python3
import csv
import argparse
from collections import Counter

def detect_separator(line):
    # Count occurrences of common delimiters in the line
    potential_separators = [",", ";", "|", "\t"]
    separator_counts = Counter({sep: line.count(sep) for sep in potential_separators})

    # Return the separator with the highest count
    detected_separator = separator_counts.most_common(1)[0][0] if separator_counts else ","
    return detected_separator

def analyze_csv(filename, separator=None, output_separator="\t"):
    print("==> " + filename + " <==")
    # Open the file and detect the separator if not provided
    with open(filename, "r") as file:
        first_line = file.readline().strip()
        if separator is None:
            separator = detect_separator(first_line)

    # Initialize variables
    col_names = []
    col_types = []
    empty_counts = []
    min_nums = []
    max_nums = []
    sum = []
    min_alphas = []
    max_alphas = []
    distinct_counts = []
    top_3_values = []

    # Re-open the file for processing
    with open(filename, "r") as file:
        reader = csv.reader(file, delimiter=separator)
        for row_index, row in enumerate(reader):
            if row_index == 0:
                # Header row
                col_names = row
                col_types = ["empty"] * len(col_names)
                empty_counts = [0] * len(col_names)
                filled_counts = [0] * len(col_names)
                num_counts = [0] * len(col_names)
                alpha_counts = [0] * len(col_names)
                alphanum_counts = [0] * len(col_names)
                min_nums = [None] * len(col_names)
                max_nums = [None] * len(col_names)
                sum = [0] * len(col_names)
                min_alphas = [None] * len(col_names)
                max_alphas = [None] * len(col_names)
                distinct_counts = [{} for _ in col_names]
                top_3_values = [[] for _ in col_names]
                continue

            # Analyze each cell
            for i, cell in enumerate(row):
                cell = cell.strip()  # Remove leading/trailing whitespace
                if cell == "":
                    empty_counts[i] += 1 
                    cell_type = "empty"
                else:
                    filled_counts[i] += 1
                    # Detect cell type
                    if cell.replace(".", "", 1).isdigit() and cell.count(".") <= 1:  # Numeric
                        cell_type = "num"
                        num_counts[i] += 1
                        value = float(cell) if "." in cell else int(cell)  # Use int if no decimal
                        sum[i] += value
                        if min_nums[i] is None or value < min_nums[i]:
                            min_nums[i] = value
                        if max_nums[i] is None or value > max_nums[i]:
                            max_nums[i] = value
                    elif cell.isalpha():  # Alphabetic
                        alpha_counts[i] += 1
                        cell_type = "alpha"
                    else:  # Alphanumeric or mixed
                        alphanum_counts[i] += 1
                        cell_type = "alphanum"

                # Calculate min and max for alphas (length-based)
                length = len(cell)
                if min_alphas[i] is None or length < min_alphas[i]:
                    min_alphas[i] = length
                if max_alphas[i] is None or length > max_alphas[i]:
                    max_alphas[i] = length

                # Count distinct values
                if cell not in distinct_counts[i]:
                    distinct_counts[i][cell] = 0
                distinct_counts[i][cell] += 1

                # Evolve column type
                if col_types[i] == "empty":
                    col_types[i] = cell_type
                elif col_types[i] != "alphanum" and col_types[i] != cell_type:
                    col_types[i] = "alphanum"

    # Compute top 3 values for each column
    for i in range(len(col_names)):
        sorted_values = sorted(distinct_counts[i].items(), key=lambda x: (-x[1], x[0]))
        top_3_values[i] = sorted_values[:3]  # Includes value and count

    # Output the results
    # Print column names
    print(f"{'Column Names':<16}" + output_separator + output_separator.join(f"{col:<16}" for col in col_names))

    # Print column types
    print(f"{'Column Types':<16}" + output_separator + output_separator.join(f"{typ:<16}" for typ in col_types))

    # Print empty cell counts
    print(f"{'Empty Counts':<16}" + output_separator + output_separator.join(f"{count:<16}" for count in empty_counts))

    # Print filled cell counts
    print(f"{'Filled Counts':<16}" + output_separator + output_separator.join(f"{count:<16}" for count in filled_counts))


    # Print num cell counts
    print(f"{'num Counts':<16}" + output_separator + output_separator.join(f"{count:<16}" for count in num_counts))

    # Print alpha cell counts
    print(f"{'alpha Counts':<16}" + output_separator + output_separator.join(f"{count:<16}" for count in alpha_counts))

    # Print alphanum cell counts
    print(f"{'alphanum Counts':<16}" + output_separator + output_separator.join(f"{count:<16}" for count in alphanum_counts))

    # Print min values
    min_values = []
    for i, col_type in enumerate(col_types):
        if col_type == "num":
            min_values.append(str(min_nums[i]) if min_nums[i] is not None else "")
        else:  # For alpha and alphanum
            min_values.append(str(min_alphas[i]) if min_alphas[i] is not None else "")
    print(f"{'Min Values':<16}" + output_separator + output_separator.join(f"{val:<16}" for val in min_values))

    # Print max values
    max_values = []
    for i, col_type in enumerate(col_types):
        if col_type == "num":
            max_values.append(str(max_nums[i]) if max_nums[i] is not None else "")
        else:  # For alpha and alphanum
            max_values.append(str(max_alphas[i]) if max_alphas[i] is not None else "")
    print(f"{'Max Values':<16}" + output_separator + output_separator.join(f"{val:<16}" for val in max_values))
    
    # print average values
    # Calculate averages
    averages = []
    for i in range(len(col_names)):
        if num_counts[i] > 0:  # Only calculate average if there are numeric values
            averages.append(str(round(sum[i] / num_counts[i], 2)))  # Rounded to 2 decimal places
        else:
            averages.append("")  # No average if there are no numeric values
    print(f"{'Averages':<16}" + output_separator + output_separator.join(f"{val:<16}" for val in averages))
    

    # Print distinct value counts
    distinct_values_count = [str(len(distinct_counts[i])) for i in range(len(col_names))]
    print(f"{'Distinct Values':<16}" + output_separator + output_separator.join(f"{count:<16}" for count in distinct_values_count))

    # Print top 3 values with their counts
    for rank in range(3):  # Top 1, Top 2, Top 3
        row_label = f"Top{rank + 1}"
        row_values = []
        for i in range(len(col_names)):
            if rank < len(top_3_values[i]):
                value, count = top_3_values[i][rank]
                row_values.append(f"{value} : {count}")
            else:
                row_values.append("")
        print(f"{row_label:<16}" + output_separator + output_separator.join(f"{val:<16}" for val in row_values))

if __name__ == "__main__":
    # Set up argument parser
    parser = argparse.ArgumentParser(description="Analyze a CSV file.")
    parser.add_argument("filename", help="Path to the input CSV file")
    parser.add_argument(
        "--separator", "-s", help="Column separator (auto-detects if not provided)"
    )
    parser.add_argument(
        "--output_separator",
        "-o",
        default="\t",
        help="Output separator (default: tab)",
    )
    
    # Parse command-line arguments
    args = parser.parse_args()
    
    # Call the function with parsed arguments
    analyze_csv(args.filename, args.separator, args.output_separator)
