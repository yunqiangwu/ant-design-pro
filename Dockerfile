MAINTAINER qiangyun.wu 842269153@qq.com
FROM node

RUN npm install -g yarn --registry=https://registry.npm.taobao.org

COPY ./ /workspace/
WORKDIR /workspace/
RUN yarn install

CMD yarn build

FROM nginx

COPY --from=0 /workspace/build/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
