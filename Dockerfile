FROM debian:12 AS nodejs-my-website

LABEL org.opencontainers.image.source="https://github.com/Cocostee/shiny-memory.git"

RUN apt-get update -yq \
  && apt-get install curl gnupg -yq \
  && curl -sL https://deb.nodesource.com/setup_22.x | bash \
  && apt-get install nodejs -yq \
  && apt-get clean -y

COPY . /app/

WORKDIR /app

RUN npm install
RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]