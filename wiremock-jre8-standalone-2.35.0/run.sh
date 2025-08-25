#!/bin/bash

java -cp "wiremock-jre8-standalone-2.35.0.jar:custom-transformer.jar" \
    com.github.tomakehurst.wiremock.standalone.WireMockServerRunner \
    --port 8080 \
    --verbose > wiremock.log \
    --extensions com.example.transformer.CustomAuthTransformer
