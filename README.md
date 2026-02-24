Automatización API Petstore – Karate Framework

Este proyecto consiste en la automatización de pruebas para los servicios REST del API Petstore utilizando Karate Framework y Maven.

El objetivo es validar el correcto funcionamiento de los endpoints relacionados con la gestión de usuarios y órdenes del store, verificando códigos de respuesta HTTP y estructura de las respuestas JSON.

🏗 Estructura del Proyecto

Runners (src/test/java/runners):
Clases Java encargadas de ejecutar los escenarios automatizados (UserTest, StoreTest, TodosTest).

Features (src/test/resources/features):
Escenarios escritos en Gherkin organizados por módulos:

store: Crear orden, eliminar orden, consultar orden e inventario.

user: Crear usuario, actualizar usuario, eliminar usuario, login/logout y obtener usuario.

karate-config.js:
Archivo de configuración global donde se define la URL base y variables del entorno.

pom.xml:
Archivo de Maven que gestiona dependencias y permite la ejecución automática del proyecto.
