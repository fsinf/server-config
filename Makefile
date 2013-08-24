BUNDLE=usr/local/share/ca-certificates/StartCom_Certification_Authority_Bundle.crt
CLASS1=usr/local/share/ca-certificates/StartCom_Certification_Authority_class1.crt
CLASS2=usr/local/share/ca-certificates/StartCom_Certification_Authority_class2.crt
CLASS3=usr/local/share/ca-certificates/StartCom_Certification_Authority_class3.crt
CLASS4=usr/local/share/ca-certificates/StartCom_Certification_Authority_class4.crt

update-bundle:
	curl https://www.startssl.com/certs/ca-bundle.pem -o ${BUNDLE}
	curl https://www.startssl.com/certs/sub.class1.server.ca.pem -o ${CLASS1}
	curl https://www.startssl.com/certs/sub.class2.server.ca.pem -o ${CLASS2}
	curl https://www.startssl.com/certs/sub.class3.server.ca.pem -o ${CLASS3}
	curl https://www.startssl.com/certs/sub.class4.server.ca.pem -o ${CLASS4}

push-upstream:
	git push upstream upstream:master

push-origin:
	git push --tags origin master
	git push --tags origin upstream
	git push --tags origin pristine-tar
