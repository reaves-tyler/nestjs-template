FROM "node:current-alpine" as build
WORKDIR /usr/src/app
ADD . .
RUN yarn install
RUN yarn build

FROM "node:current-alpine"
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/ ./
EXPOSE 3000
CMD ["yarn", "start:prod"]