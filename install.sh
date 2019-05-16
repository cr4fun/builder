docker pull sdag/sdag_testnet_dev
docker run --rm -d --name sdag -p 6615:6615 -p 8080:8080 -v $PWD/config.json:/sdag/explorer/static/config.json sdag/sdag_testnet_dev
