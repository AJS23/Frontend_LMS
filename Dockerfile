FROM node:14-alpine as build
RUN mkdir /LMS-FRONT-END
WORKDIR /LMS-FRONT-END
COPY . /LMS-FRONT-END
RUN npm install -g @angular/cli
RUN npm install -f
RUN ng build --prod

FROM amazon/aws-cli
RUN mkdir /LMS
WORKDIR /LMS
COPY --from=build /LMS-FRONT-END/public /LMS
RUN aws s3 cp /LMS s3://9876543456789 --recursive
EXPOSE 3000
