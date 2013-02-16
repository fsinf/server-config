push-upstream:
	git push upstream upstream:master

push-origin:
	git push --tags origin master
	git push --tags origin upstream
	git push --tags origin pristine-tar
