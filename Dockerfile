# pull the base image
FROM node:lts-alpine as build-deps

# set the working direction
WORKDIR /usr/src/app

# Install some depenendencies
RUN apk update && apk add git

# Copy and build the project
COPY . .
RUN yarn install && yarn build

FROM httpd:2.4
COPY --from=build-deps /usr/src/app/build /usr/local/apache2/htdocs/

EXPOSE 80