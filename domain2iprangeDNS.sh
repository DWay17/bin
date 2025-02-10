#!/bin/bash

# File containing the list of domains
DOMAIN_FILE="domains.txt"
# Output file to store the IP ranges
OUTPUT_FILE="ip_ranges.txt"
# Temporary file to accumulate unique IP ranges
TEMP_FILE="temp_ip_ranges.txt"

# Function to convert IP to CIDR notation
ip_to_cidr() {
  IFS=. read -r i1 i2 i3 i4 <<< "$1"
  echo "$i1.$i2.$i3.0/24"
}

# Write a comment to the output file
echo "# List of IP ranges for firewall" > "$OUTPUT_FILE"

# Process each domain in the file
while IFS= read -r domain; do
  echo "Processing domain: $domain"
  
  # Add a comment with the origin domain to the output file
  echo "# Origin domain: $domain" >> "$OUTPUT_FILE"
  
  # Get the list of IP addresses for the domain and its subdomains
  ip_addresses=$(dig +short ANY "$domain" | grep '^[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+$')
  
  # Convert IP addresses to CIDR notation and add to temporary file
  for ip in $ip_addresses; do
    cidr=$(ip_to_cidr "$ip")
    echo "$cidr" >> "$TEMP_FILE"
  done
  
  # Append unique IP ranges to the output file
  sort -u "$TEMP_FILE" | while IFS= read -r cidr; do
    echo "$cidr" >> "$OUTPUT_FILE"
  done

  # Clear temporary file for the next domain
  > "$TEMP_FILE"
done < "$DOMAIN_FILE"

# Clean up temporary file
rm -f "$TEMP_FILE"

echo "IP ranges collected and saved to $OUTPUT_FILE"
