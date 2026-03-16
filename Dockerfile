# BUILD STAGE
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# proje dosyalarını kopyala
COPY . .

# uygulamayı publish et
RUN dotnet publish -c Release -o /app/publish

# RUNTIME STAGE
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# build stage'den publish edilen dosyaları kopyala
COPY --from=build /app/publish .


# uygulama portu
EXPOSE 8080


# uygulamayı başlat
ENTRYPOINT ["dotnet", "Neues Projekt.dll"]