gh:
	rm -rf docs/
	hugo
	git commit -am "Publish new verision to github"	
	git push

kube:
	rm -rf docs/
	hugo -b http://www.cescoferraro.xyz
	cp 18E988A9C144977FE6AC7BBF0919B0C3.txt docs/
	docker build -t cescoferraro/me:latest .
	docker push cescoferraro/me:latest
	kubectl -n me delete --all pods 
	kubectl -n nginx-ingress delete --all pods 

dev:
	hugo server --renderToDisk
