java -cp "wiremock-body-transformer-1.1.6.jar:wiremock-standalone-3.4.2.jar" \
wiremock.Run \
--port 8080 \
--verbose > wiremock.log \
--extensions com.opentable.extension.BodyTransformer
