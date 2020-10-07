FROM node
RUN git clone https://github.com/tosdr/tosback2
RUN git clone https://github.com/ambanum/CGUs
RUN apt update && apt install -yq \
  libpq-dev \
  vim
RUN cd CGUs && npm install
ADD . /app
WORKDIR /app
RUN npm install
CMD node --unhandled-rejections=strict tosback-import.js
