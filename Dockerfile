FROM ubuntu
ENV MY_NAME="Latheef"
ENV MY_COMPANY="ABJ"
LABEL Designedby="Latheef" Email="dlatheef@gmail.com"
RUN apt update -y && apt install -y wget unzip net-tools tree curl  vim nginx
RUN mkdir html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page293/bricker.zip
RUN rm -rf /var/www/html
RUN unzip bricker.zip -d /var/www/html
CMD ["nginx","-g","daemon off;"]

