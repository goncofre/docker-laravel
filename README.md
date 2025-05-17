# Docker + Laravel + MySQL + phpMyAdmin  

1- Crear carpeta donde contendra su aplicacion laravel  
2- Copiar los archivos Dockerfile y docker-compose-dev.yml  
3- Ejecutar el siquiente comando:  
```
  docker compose -f .\docker-compose-dev.yml up -d
```
4- Finalizada la creacion de los contenedores, se debe ingresar al contenedor php-1  
5- En la pestaña Exec, ejecutar el siguiente comando:  
```
  composer create-project laravel/laravel proyecto "11.*"
``` 
6- Una vez finalizada la descarga de los archivos del proyecto, corte los archivos de la carpeta "proyecto", peguelos en la raiz y elimine la carpeta "proyecto"  
7- Modifique el archivo .env de la siguiente manera, asegurese de tener los mismos datos que en el archivo docker-compose-dev.yml 
```
  DB_CONNECTION=mysql  
  DB_HOST=db-mysql  
  DB_PORT=3306  
  DB_DATABASE=db_practica  
  DB_USERNAME=root  
  DB_PASSWORD=1234
```
8- Ejecute el comando *php artisan migrate* para crear las tablas, la base de datos ya fue creada con anterioridad  
9- Inicie el contenedor api-app-1 y comience a trabajar en su aplicación  
