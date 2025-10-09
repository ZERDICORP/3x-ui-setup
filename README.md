# x3-ui-setup

#### Script for quickly setting up x3-ui on a Linux server.

## How to run?

```bash
bash <(curl -Ls https://raw.githubusercontent.com/ZERDICORP/x3-ui-setup/master/x3-ui-setup.sh)
```

## Ads DNS Blocking

```
curl -L https://4st.li/hosty/install.sh | sh
mkdir /etc/hosty
cd /etc/hosty
wget https://raw.githubusercontent.com/ewpratten/youtube_ad_blocklist/refs/heads/master/blocklist.txt
mv blocklist.txt blacklist
cd
hosty
```
