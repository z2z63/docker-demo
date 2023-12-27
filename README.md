# 如何运行
进入项目根目录，执行
```shell
docker compose up -d
```
然后打开<http://127.0.0.1:8000>即可看到登录页面  

# 如何连接数据库
compose.yaml将mysql端口映射到127.0.0.1:3307,连接参数见BookManager2/src/main/resources/application.properties，用户名为root,
密码为abc123，数据库名为book_manager  
容器内已经导入了数据，使用任意数据库客户端(navicat, datagrip等)连接到容器内的数据库

# 整体架构
## frontend
frontend容器使用nginx分发静态文件，同时反代后端接口  
静态文件由vue项目打包形成
## backend
backend容器使用openjdk运行后端项目打包形成的jar文件，需要连接到mysql和redis
## mysql
mysql将数据挂载到了./database下，通过docker网络与backend容器通信，可以不暴露端口，为了方便查看数据库的表所以暴露了端口
## redis
redis没有配置持久化，通过docker网络与backend容器通信，没有暴露端口