FROM nginx:alpine

# 1. Change the default Nginx port from 80 to 3000
RUN sed -i 's/listen       80;/listen       3000;/g' /etc/nginx/conf.d/default.conf

# 2. Copy the built application files
COPY ./dist /usr/share/nginx/html

# 3. Inform Docker/AWS that we are using 3000
EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
