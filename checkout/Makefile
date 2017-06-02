build:
	docker build -t checkout .

clean:
	git clean -x -d -f

test: build
	docker run -it checkout "rspec"

.PHONY: build clean test
