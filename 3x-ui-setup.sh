apt update && apt upgrade -y

VERSION=v2.8.4 && bash <(curl -Ls "https://raw.githubusercontent.com/mhsanaei/3x-ui/$VERSION/install.sh") $VERSION
bash <(curl -Ls https://raw.githubusercontent.com/ZERDICORP/3x-ui-setup/master/auto-ssl.sh)
bash <(curl -Ls https://raw.githubusercontent.com/ZERDICORP/3x-ui-setup/master/apply-patch.sh)

x-ui restart

