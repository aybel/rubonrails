
# rubonrails

Proyecto Ruby on Rails 7.1.6 con Docker y PostgreSQL

## Requisitos
- Docker
- Docker Compose

## Instalación y uso
1. Clona el repositorio:
	```
	git clone https://github.com/aybel/rubonrails.git
	cd rubonrails
	```
2. Levanta los servicios:
	```
	docker-compose up --build
	```
3. Crea la base de datos:
	```
	docker-compose run --rm web bin/rails db:create
	```
4. Accede a la app en [http://localhost:3000](http://localhost:3000)

## Configuración
Las variables de entorno principales están en `docker-compose.yml`.

## Estructura
- Ruby version: 3.2.2
- Rails version: 7.1.6
- Base de datos: PostgreSQL

## Comandos útiles
- Migraciones:
  ```
  docker-compose run --rm web bin/rails db:migrate
  ```
- Consola Rails:
  ```
  docker-compose run --rm web bin/rails console
  ```

## Test
Para crear la base de datos de test:
```
docker-compose run --rm web bin/rails db:create RAILS_ENV=test
```

## Despliegue
Configura las variables de entorno y la base de datos en producción según tus necesidades.
