#!/bin/bash

exit 1 # doesn't work

# Function to convert an IP address to binary
ip_to_binary() {
  IFS=. read -r a b c d <<< "$1"
  printf "%08d%08d%08d%08d" $(bc <<< "obase=2;$a") $(bc <<< "obase=2;$b") $(bc <<< "obase=2;$c") $(bc <<< "obase=2;$d")
}

# Function to convert binary to CIDR notation
binary_to_cidr() {
  local binary=$1
  local length=${#binary}
  local cidr=0
  for ((i=0; i<$length; i++)); do
    if [[ ${binary:$i:1} == 1 ]]; then
      ((cidr++))
    else
      break
    fi
  done
  echo "$cidr"
}

# Function to convert IP range to CIDR notation
ip_range_to_cidr() {
  local start_ip=$1
  local end_ip=$2

  if [[ "$start_ip" == "$end_ip" ]]; then
    end_ip="$start_ip"
  fi

  start_binary=$(ip_to_binary "$start_ip")
  end_binary=$(ip_to_binary "$end_ip")
  
  local cidr
  while [[ "$start_binary" != "$end_binary" ]]; do
    start_binary=${start_binary%1*}
    end_binary=${end_binary%1*}
  done
  cidr=$(binary_to_cidr "$start_binary")

  IFS=. read -r a b c d <<< "$start_ip"
  local base_ip="$a.$b.$c.$d"
  echo "$base_ip/$cidr"
}

# Main function
main() {
  if [[ "$#" -lt 1 ]]; then
    echo "Usage: $0 ip_range"
    exit 1
  fi

  input="$1"
  IFS='-' read -r start_ip end_ip <<< "$input"
  if [[ -z "$end_ip" ]]; then
    IFS=' ' read -r start_ip end_ip <<< "$input"
  fi
  if [[ -z "$end_ip" ]]; then
    end_ip="$start_ip"
  fi

  if [[ "$start_ip" == "$end_ip" ]]; then
    echo "$start_ip/30"
  else
    ip_range_to_cidr "$start_ip" "$end_ip"
  fi
}

main "$@"
