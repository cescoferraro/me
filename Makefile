gh:
	hugo
	git commit -am "Publish new verision to github"	
	git push

me:
	hugo -b http://www.cescoferraro.xyz
	cp 18E988A9C144977FE6AC7BBF0919B0C3.txt docs/
	docker build -t cescoferraro/me:latest .
	docker push cescoferraro/me:latest
	kubectl replace -f kubernetes.yaml
