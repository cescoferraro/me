docker rm -f "$(docker ps -aq)"
docker build -t cescoferraro/blog:latest .
docker run -p 1313:1313 cescoferraro/blog:latest
