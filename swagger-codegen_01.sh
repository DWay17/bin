#!/bin/sh
cd ~/git/swagger-codegen/
pwd
java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
     -i http://petstore.swagger.io/v2/swagger.json \
     -l java \
     -o output/
