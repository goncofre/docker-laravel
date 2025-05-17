# Docker + Laravel + MySQL + phpMyAdmin  

## Configuración del Entorno de Desarrollo con Docker

Estos pasos te guiarán para configurar el entorno de desarrollo de tu aplicación Laravel utilizando Docker.

1.  **Crear el directorio del proyecto:**
    Comienza creando una carpeta donde residirán los archivos de tu aplicación Laravel.

2.  **Copiar archivos de Docker:**
    Copia los archivos `Dockerfile` y `docker-compose-dev.yml` a la raíz del directorio de tu proyecto.

3.  **Iniciar los contenedores Docker:**
    Ejecuta el siguiente comando en tu terminal, dentro del directorio del proyecto:

    ```bash
    docker compose -f .\docker-compose-dev.yml up -d
    ```

    Este comando creará e iniciará los contenedores definidos en el archivo `docker-compose-dev.yml` en segundo plano.

4.  **Acceder al contenedor PHP:**
    Una vez que los contenedores estén en funcionamiento, ingresa al contenedor llamado `php-1`. Puedes hacerlo utilizando la interfaz de tu software de gestión de Docker (por ejemplo, Docker Desktop) y seleccionando la opción "Exec" o "Ejecutar".

5.  **Crear el proyecto Laravel:**
    Dentro de la terminal del contenedor `php-1`, ejecuta el siguiente comando para crear un nuevo proyecto Laravel:

    ```bash
    composer create-project laravel/laravel proyecto "11.*"
    ```

    Este comando descargará los archivos de la versión 11 de Laravel en una subcarpeta llamada `proyecto`.

6.  **Mover archivos del proyecto a la raíz:**
    Una vez que Composer haya finalizado, corta todos los archivos y carpetas contenidos dentro de la carpeta `proyecto` y pégalos directamente en la raíz del directorio de tu proyecto. Luego, elimina la carpeta vacía `proyecto`.

7.  **Configurar las variables de entorno (.env):**
    Modifica el archivo `.env` en la raíz de tu proyecto con la siguiente información de la base de datos. Asegúrate de que los valores coincidan con la configuración definida en tu archivo `docker-compose-dev.yml`:

    ```
    DB_CONNECTION=mysql
    DB_HOST=db-mysql
    DB_PORT=3306
    DB_DATABASE=db_practica
    DB_USERNAME=root
    DB_PASSWORD=1234
    ```

8.  **Ejecutar las migraciones de Laravel:**
    Dentro de la terminal del contenedor `php-1`, ejecuta el siguiente comando para crear las tablas en la base de datos (la base de datos `db_practica` ya debería haber sido creada por Docker):

    ```bash
    php artisan migrate
    ```

9.  **Iniciar el contenedor de la aplicación:**
    Asegúrate de que el contenedor `api-app-1` esté en ejecución. Una vez que lo esté, puedes comenzar a trabajar en tu aplicación Laravel.
