FROM dart:stable AS build

WORKDIR /app
COPY . .

RUN dart pub get
RUN dart compile exe bin/server.dart -o bin/mock_api_server

FROM scratch AS export
COPY --from=build /app/bin/mock_api_server /mock_api_server
