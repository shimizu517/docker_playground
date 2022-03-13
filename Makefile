# Execude following command to check how multi stage build works. 
# $ make multi_(aaa|bbb|ccc) && docker run pg-multi-(aaa|bbb|ccc) ls /code
PHONY: multi_aaa
multi_aaa:
	@docker build --target aaa -t pg-multi-aaa -f ./multi_stage/MultiStageDockerfile .

PHONY: multi_bbb
multi_bbb:
	@docker build --target bbb -t pg-multi-bbb -f ./multi_stage/MultiStageDockerfile .

PHONY: multi_ccc
multi_ccc:
	@docker build --target ccc -t pg-multi-ccc -f ./multi_stage/MultiStageDockerfile .
