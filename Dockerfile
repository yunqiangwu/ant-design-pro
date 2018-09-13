FROM node
MAINTAINER qiangyun.wu 842269153@qq.com

# RUN npm install -g yarn --registry=https://registry.npm.taobao.org

COPY ./ /workspace/
WORKDIR /workspace/
RUN yarn install

ENV PORT 8000

EXPOSE 8000

CMD yarn start

