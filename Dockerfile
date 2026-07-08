# Stage 1
FROM node:20 AS build

WORKDIR /app

COPY package*.json ./
# Python 
#requirement .txt

# pip install -r requirements.txt

RUN npm install

COPY . .
# 

RUN npm run build

# Stage 2
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx","-g","daemon off;"]