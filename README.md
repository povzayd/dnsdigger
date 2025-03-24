🚀 Domain Information Gathering Script 🚀

🤔 What does this script do?
This script is designed to gather various information about a domain, including:

- Resolving the domain name to an IP address 📊
- Retrieving the Autonomous System Number (ASN) 📈
- Fetching the Classless Inter-Domain Routing (CIDR) block 📊
- Converting the CIDR block to IP ranges 📈
- Performing a Reverse DNS lookup on the IP ranges 🔍

📊 Comparison with Existing Tools:
This script outperforms existing tools in several ways:

*🔍 Nmap:*
- Nmap is a powerful network scanning tool, but it requires multiple commands to gather the same information as this script.
- This script provides a more streamlined and user-friendly experience.

*🔍 Dig:*
- Dig is a DNS lookup tool that can resolve domain names to IP addresses, but it doesn't provide ASN or CIDR information.
- This script builds upon the functionality of Dig and adds additional features.

*🔍 Whois:*
- Whois is a tool for retrieving domain registration information, but it can be cumbersome to use and requires manual parsing of the output.
- This script automates the Whois lookup process and extracts the relevant information.

*🔍 Other Scripts:*
- Other scripts may provide some of the same functionality, but they often require manual configuration and can be difficult to use.
- This script is designed to be easy to use and provides a comprehensive set of features.

📈 Features:
- Resolves domain names to IP addresses using Dig
- Retrieves ASN information using Whois
- Fetches CIDR blocks using Whois
- Converts CIDR blocks to IP ranges using Prips
- Performs Reverse DNS lookups on IP ranges
- Saves output to files for easy reference
- Provides a user-friendly interface for selecting which information to gather

🚀 Benefits:
- Saves time by automating the process of gathering domain information
- Provides a comprehensive set of features for domain analysis
- Easy to use and requires minimal configuration
- Outputs are saved to files for easy reference

📝 Installation Steps:
1️⃣ Install the required tools:

- `dig` for DNS resolution
- `whois` for ASN and CIDR retrieval
- `prips` for CIDR to IP range conversion (optional)

On Ubuntu-based systems:

```
bash
sudo apt install dnsutils whois prips
```

2️⃣ Download the script:

```
bash
git clone https://github.com/povzayd/dnsdigger.git
cd dnsdigger
```

3️⃣ Make the script executable:

```
bash
chmod +x dnsdigger ptrcleaner
```

🚀 Usage:
1️⃣ Run the script with the domain name as an argument:

```
bash
./dnsdigger example.com
```

2️⃣ Follow the prompts to choose which information to gather:

- Fetch CIDR block? (y/n)
- Convert CIDR to IP ranges? (y/n)
- Perform Reverse DNS lookup? (y/n)

📄 Output:
The script will save the output to the following files:

- `${domain}_ip.txt`: Resolved IP address
- `${domain}_asn.txt`: ASN number
- `${domain}_cidr.txt`: CIDR block (if fetched)
- `${domain}_ip_ranges.txt`: IP ranges (if converted)
- `${domain}_reverse_dns.txt`: Reverse DNS results (if performed)

