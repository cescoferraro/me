gh:
	rm -rf out/
	hugo
	git commit -am "Publish new verision to github"	
	git push

new:
	rm -rf out/
	hugo -b https://www.cescoferraro.xyz
	cp 18E988A9C144977FE6AC7BBF0919B0C3.txt out/
	cp Dockerfile out/
	docker-compose build me
	make refresh

dev:
	hugo server --renderToDisk

refresh:
	docker-compose stop me
	docker-compose rm -f me
	docker-compose up -d me
