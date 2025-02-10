#!/bin/bash

# File containing the list of domains
DOMAIN_FILE="domains.txt"
# Output file to store the IP ranges
OUTPUT_FILE="ip_ranges.txt"
# Temporary file to accumulate unique IP ranges
TEMP_FILE="temp_ip_ranges.txt"

# Function to query RIPE NCC database for IP range
query_ripe() {
  ip=$(dig +short "$1" | grep '^[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+$' | head -n 1)
  if [ -n "$ip" ]; then
    ripe_result=$(whois -h whois.ripe.net "$ip" | grep -i 'inetnum')
    echo "$ripe_result"
  else
    echo "No IP address found for $1"
  fi
}

# Write a comment to the output file
echo "# List of IP ranges for firewall" > "$OUTPUT_FILE"

# Process each domain in the file
while IFS= read -r domain; do
  echo "Processing domain: $domain"
  
  # Add a comment with the origin domain to the output file
  echo "# Origin domain: $domain" >> "$OUTPUT_FILE"
  
  # Get the IP range for the domain
  ripe_result=$(query_ripe "$domain")
  
  # Add the IP range to the temporary file
  echo "$ripe_result" >> "$TEMP_FILE"
  
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
