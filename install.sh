docker pull sdag/sdag_testnet_dev
docker cp sdag_testnet_dev: ./config.json ~/sdag
docker run --rm -d --name sdag -p 6615:6615 -p 8080:8080 sdag/sdag_testnet_dev