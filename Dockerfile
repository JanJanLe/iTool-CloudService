FROM registry.cn-hangzhou.aliyuncs.com/newbe36524/aspnet:3.1-buster-slim

# ��װnodejs
RUN sed -i 's#http://deb.debian.org#https://mirrors.aliyun.com#g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y nodejs

WORKDIR /app
COPY . .

CMD ["-sql", "-rabbit", "-redis:","-debug:", "-advertisedip:", "-clusterid:", "-serviceId", "-dashboard"]

ENTRYPOINT ["dotnet", "Silo.CloudService.dll"]