if [ ! -d api ]; then
  git clone "https://ZERDICORP:$GTHBTKN@github.com/ZERDICORP/VillainVPN-UnitAPI.git" api
fi
cd api
git pull origin main
docker compose up -d --build
