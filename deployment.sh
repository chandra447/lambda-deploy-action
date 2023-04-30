#!/bin/sh

docker build --build-arg AWS_ACCESS_KEY_ID=AKIAUQPASYCXUUFBT3E6 --build-arg AWS_SECRET_ACCESS_KEY=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 --build-arg AWS_region=ap-southeast-2 -t lambda_testdeploy deployment/.

docker run --name deploy -e filenameordirectory=$1 lambda_testdeploy

docker container rm -f deploy