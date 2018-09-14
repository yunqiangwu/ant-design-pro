FROM node as node-build
MAINTAINER qiangyun.wu 842269153@qq.com

RUN npm install -g yarn --registry=https://registry.npm.taobao.org

COPY ./ /workspace/
WORKDIR /workspace/
RUN yarn install

CMD yarn build

FROM nginx
MAINTAINER qiangyun.wu 842269153@qq.com

COPY --from=node-build /workspace/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
