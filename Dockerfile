FROM node
MAINTAINER qiangyun.wu 842269153@qq.com

# RUN npm install -g yarn --registry=https://registry.npm.taobao.org

COPY ./ /workspace/
WORKDIR /workspace/
RUN yarn install

CMD yarn build

EXPOSE 80


FROM nginx

CMD ["nginx", "-g", "daemon off;"]
