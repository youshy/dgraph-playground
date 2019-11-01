docker exec -it dgraph dgraph alpha --lru_mb 2048 --zero localhost:5080
osascript -e 'tell application "System Events" to key code 2 using command down'
docker exec -it dgraph dgraph-ratel
