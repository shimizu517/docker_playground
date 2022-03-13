# Execude following command to check how multi stage build works. 
# $ make multi_(aaa|bbb|ccc) && docker run pg-multi-(aaa|bbb|ccc) ls /code
.PHONY: multi_aaa
multi_aaa:
	@docker build --target aaa -t pg-multi-aaa -f ./multi_stage/MultiStageDockerfile .

.PHONY: multi_bbb
multi_bbb:
	@docker build --target bbb -t pg-multi-bbb -f ./multi_stage/MultiStageDockerfile .

.PHONY: multi_ccc
multi_ccc:
	@docker build --target ccc -t pg-multi-ccc -f ./multi_stage/MultiStageDockerfile .

# You can add some packages to ./buildkit_cache/requirements.txt and execute $ make buildkit_cache. You'll see you don't download packages that had already existed in it but use cache prepared by pip located at /root/.cache
# If you remove --mount=type=cache,target=/root/.cache from buildkit_cache/Dockerfile, you'll see it downloads packages that are not newly added.
.PHONY: all buildkit_cache clean
buildkit_cache:
	@docker build -t pg-buildkit-cache --progress=plain ./buildkit_cache
