apt update && apt upgrade -y

bash <(curl -Ls https://raw.githubusercontent.com/ZERDICORP/docker-compose-setup/master/docker-compose-setup.sh)

VERSION=v2.8.4 && bash <(curl -Ls "https://raw.githubusercontent.com/mhsanaei/3x-ui/$VERSION/install.sh") $VERSION
bash <(curl -Ls https://raw.githubusercontent.com/ZERDICORP/3x-ui-setup/master/auto-ssl.sh)

curl -fsSL -o patch.py https://raw.githubusercontent.com/ZERDICORP/3x-ui-setup/master/patch.py
pip install -r requirements.txt
python3 patch.py
rm patch.py

x-ui restart
