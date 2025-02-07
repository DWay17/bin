#!/bin/bash

# File containing the list of domains
DOMAIN_FILE="domains.txt"
# Output file to store the IP ranges
OUTPUT_FILE="ip_ranges.txt"

# Function to convert IP to CIDR notation
ip_to_cidr() {
  IFS=. read -r i1 i2 i3 i4 <<< "$1"
  echo "$i1.$i2.$i3.0/24"
}

# Process each domain in the file
while IFS= read -r domain; do
  echo "Processing domain: $domain"
  
  # Get the list of IP addresses for the domain
  ip_addresses=$(dig +short "$domain" | grep '^[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+$')
  
  # Convert IP addresses to CIDR notation and add to output file
  for ip in $ip_addresses; do
    cidr=$(ip_to_cidr "$ip")
    echo "$cidr" >> "$OUTPUT_FILE"
  done
done < "$DOMAIN_FILE"

# Remove duplicate CIDR entries
sort -u "$OUTPUT_FILE" -o "$OUTPUT_FILE"

echo "IP ranges collected and saved to $OUTPUT_FILE"
