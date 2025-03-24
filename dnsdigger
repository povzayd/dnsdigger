#!/bin/bash

# Check if a domain name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <domain-name>"
    exit 1
fi

domain=$1

echo "Fetching ASN for domain: $domain"

# Get the IP address of the domain
ip=$(dig +short $domain | tail -n1)

# Check if IP was retrieved
if [ -z "$ip" ]; then
    echo "Could not resolve domain to an IP address."
    exit 1
fi

echo "Resolved IP: $ip"
echo "Resolved IP: $ip" > "${domain}_ip.txt"

# Get ASN information using whois
asn=$(whois -h whois.cymru.com " -v $ip" | tail -n1 | awk '{print $1}')

# Check if ASN was retrieved
if [ -z "$asn" ]; then
    echo "Could not retrieve ASN information."
    exit 1
fi

echo "ASN Number: $asn"
echo "ASN Number: $asn" > "${domain}_asn.txt"

# Ask the user if they want to fetch CIDR from ASN
read -p "Do you want to fetch CIDR from ASN? (y/n): " fetch_cidr
if [ "$fetch_cidr" == "y" ]; then
    cidr=$(whois -h whois.radb.net -- "-i origin AS$asn" | grep -oE '[0-9.]+/[0-9]+')
    if [ -z "$cidr" ]; then
        echo "No CIDR block found."
        exit 1
    fi
    echo "CIDR: $cidr"
    echo "$cidr" > "${domain}_cidr.txt"

    # Ask the user if they want to convert CIDR to IP ranges
    read -p "Do you want to convert CIDR to IP ranges? (y/n): " convert_ip
    if [ "$convert_ip" == "y" ]; then
        if ! command -v prips &> /dev/null; then
            echo "Error: prips is not installed. Install it using: sudo apt install prips"
            exit 1
        fi
        echo "Converting CIDR to IP ranges..."
        for range in $cidr; do
            prips $range >> "${domain}_ip_ranges.txt"
        done
        echo "IP Ranges saved to ${domain}_ip_ranges.txt"
    fi

    # Ask the user if they want to perform Reverse DNS lookup
    read -p "Do you want to perform Reverse DNS lookup? (y/n): " reverse_dns
    if [ "$reverse_dns" == "y" ]; then
        if [ ! -f "${domain}_ip_ranges.txt" ]; then
            echo "Error: IP ranges file not found. Cannot perform reverse DNS lookup."
            exit 1
        fi
        for ip in $(cat "${domain}_ip_ranges.txt"); do
            host $ip >> "${domain}_reverse_dns.txt"
        done
        echo "Reverse DNS results saved to ${domain}_reverse_dns.txt"
    fi
fi

echo "Process completed. All outputs saved to respective files."
                                                                    
