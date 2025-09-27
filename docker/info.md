# 🚀 Levantar entorno con Docker

Este proyecto incluye un entorno de desarrollo basado en **Docker** para levantar el backend y la base de datos sin necesidad de instalaciones manuales.

----------------------------------------------------

## 📦 Requisitos previos
- Tener instalado **Docker** y **Docker Compose**.
- Verificar instalación:
  ```bash
  docker -v
  docker compose version
  3. Construir y levantar los contenedores
Desde la carpeta docker/:
bash
docker compose up --build
----------------------------------------------------
## Verificar que todo funciona
Backend disponible en: http://localhost:3000
Swagger UI en: http://localhost:3000/docs
MySQL accesible en localhost:3306 con:
Usuario: fs_user
Password: MiClaveSegura123!
Base de datos: fs_backend
-----------------------------------------------------
Para detener y borrar volúmenes (incluyendo datos de la DB):

docker compose down -v
