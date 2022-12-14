FROM node:14-alpine as build
RUN mkdir /captain
WORKDIR /captain
COPY . /captain
RUN npm install -g @angular/cli
Run npm install -f
RUN ng build --prod

FROM amazon/aws-cli
RUN mkdir /front
WORKDIR /front
COPY --from=build /captain/public /front
RUN aws s3 cp /front s3://9876543456789 --recursive
EXPOSE 3000
