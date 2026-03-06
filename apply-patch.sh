apt-get update && apt-get install -y python3-pip > /dev/null 2>&1

curl -fsSL -o patch.py https://raw.githubusercontent.com/ZERDICORP/3x-ui-setup/master/patch.py
curl -fsSL -o requirements.txt https://raw.githubusercontent.com/ZERDICORP/3x-ui-setup/master/requirements.txt
pip3 install -r requirements.txt
python3 patch.py
rm patch.py
rm requirements.txt