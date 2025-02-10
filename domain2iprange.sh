#!/bin/bash
# replace whois with WHOIS_BIN
WHOIS_BIN=/usr/bin/whois

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
    ripe_result=$($WHOIS_BIN -h whois.ripe.net "$ip" | grep -i 'inetnum')
    echo "$ripe_result"
  else
    echo "No IP address found for $1"
  fi
}

# Function to convert IP range to CIDR notation
ip_range_to_cidr() {
  IFS='-' read -r start_ip end_ip <<< "$1"
  octet1=$(echo "$start_ip" | cut -d '.' -f 1)
  octet2=$(echo "$start_ip" | cut -d '.' -f 2)
  octet3=$(echo "$start_ip" | cut -d '.' -f 3)
  octet4_start=$(echo "$start_ip" | cut -d '.' -f 4)
  octet4_end=$(echo "$end_ip" | cut -d '.' -f 4)
  subnet_size=$(($octet4_end - $octet4_start + 1))
  echo "$octet1.$octet2.$octet3.$octet4_start/$subnet_size"
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
  
  # Convert IP range to CIDR notation and add to temporary file
  if [[ $ripe_result == *"-"* ]]; then
    cidr=$(ip_range_to_cidr "$ripe_result")
    echo "$cidr" >> "$TEMP_FILE"
  else
    echo "No valid IP range found for $domain" >> "$TEMP_FILE"
  fi
  
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
