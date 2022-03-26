default: build release
build:
	docker build -t cse578-project .

clean-build:
	docker build -t cse578-project . --no-cache=true

run:
	#docker run cse578-project
	docker run -it -p 8888:8888 \
	--volume=$PWD:/home/CSE578/ \
	cse578-project bash

release:
	docker tag cse578-project kpaigwar/cse578-project
	docker push kpaigwar/cse578-project