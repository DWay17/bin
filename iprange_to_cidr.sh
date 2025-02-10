#!/bin/bash

# Function to convert IP address to integer
ip_to_int() {
    local a b c d
    IFS=. read -r a b c d <<< "$1"
    echo $((a * 256**3 + b * 256**2 + c * 256 + d))
}

# Function to convert integer to IP address
int_to_ip() {
    local ip="$1"
    echo "$((ip >> 24 & 255)).$((ip >> 16 & 255)).$((ip >> 8 & 255)).$((ip & 255))"
}

# Function to calculate the appropriate subnet size
range_to_cidr() {
    local start end range size

    start=$(ip_to_int "$1")
    end=$(ip_to_int "$2")
    range=$((end - start + 1))

    size=32
    while (( range > 0 )); do
        (( size-- ))
        range=$((range >> 1))
    done

    echo "$1/$(32 - size)"
}

# Main script
if [ "$#" -eq 1 ]; then
    if [[ "$1" == *-* ]]; then
        IFS=- read -r ip1 ip2 <<< "$1"
        range_to_cidr "$ip1" "$ip2"
    else
        echo "$1/32"
    fi
elif [ "$#" -eq 2 ]; then
    ip1="$1"
    ip2="$2"
    range_to_cidr "$ip1" "$ip2"
else
    echo "Usage: $0 ip1-ip2 or $0 ip1 ip2 or $0 ip"
    exit 1
fi
