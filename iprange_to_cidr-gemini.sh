#!/bin/bash

# Script name: iprange_to_cidr.sh
# Description: Converts IP ranges (e.g., ip1-ip2, ip1 ip2, ip1) into CIDR notation.
#              Calculates the smallest CIDR block that encompasses the provided IP range.
#              Handles single IP addresses by adding /30.

exit 1 # doesn't work

# Function to convert IP address to integer
ip_to_int() {
  local ip=$1
  local IFS=.
  local -a octets
  read -r -a octets <<< "$ip"
  printf "%d" $(( (octets[0] << 24) + (octets[1] << 16) + (octets[2] << 8) + octets[3] ))
}

# Function to convert integer to IP address
int_to_ip() {
  local ip_int=$1
  printf "%d.%d.%d.%d" \
    $(( (ip_int >> 24) & 255 )) \
    $(( (ip_int >> 16) & 255 )) \
    $(( (ip_int >> 8) & 255 )) \
    $(( ip_int & 255 ))
}

# Function to calculate CIDR from IP range
ip_range_to_cidr() {
  local start_ip_str=$1
  local end_ip_str=$2

  local start_ip_int=$(ip_to_int "$start_ip_str")
  local end_ip_int=$(ip_to_int "$end_ip_str")

  if [[ "$start_ip_int" == "$end_ip_int" ]]; then
    echo "$start_ip_str/30"
    return
  fi

  local prefix_len
  for prefix_len in $(seq 30 -1 0); do
    local mask=$(( 0xFFFFFFFF << (32 - prefix_len) ))
    local network_address=$(( start_ip_int & mask ))
    local broadcast_address=$(( network_address | (~mask & 0xFFFFFFFF) ))

    if [[ "$network_address" -le "$start_ip_int" ]] && [[ "$end_ip_int" -le "$broadcast_address" ]]; then
      local cidr_ip=$(int_to_ip "$network_address")
      echo "$cidr_ip/$prefix_len"
      return
    fi
  done
}

# Input processing and main logic
if [[ $# -eq 1 ]]; then
  if [[ "$1" =~ - ]]; then
    IFS='-' read -r start_ip end_ip <<< "$1"
    ip_range_to_cidr "$start_ip" "$end_ip"
  else
    ip_range_to_cidr "$1" "$1" # Handle single IP by treating start and end as same
  fi
elif [[ $# -eq 2 ]]; then
  ip_range_to_cidr "$1" "$2"
else
  echo "Usage: $0 <ip_range>"
  echo "       $0 <start_ip>-<end_ip>"
  echo "       $0 <start_ip> <end_ip>"
  exit 1
fi
