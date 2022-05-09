*** Settings ***
Documentation  Es un test de pruebas a la base de datos bdEjemplo
...
...  Palabras reservadas para importar archivos
Resource  sourcebd.robot
Suite Setup  Connect To Database  pymysql  ${DBNAME}  ${DBUSER}  ${DBPASS}  ${DBHOST}  ${DBPORT}


*** Test Cases ***

Ingresar datos a la base datos
  Insertar datos en la tabla persona

Verificar si existe el usuario Pedro Galvis
  Verificar si existe el registro en la base de datos  101018  Juan Sebastian

Verificar si existe 2 personas que contenga el nombre Sebastian
  Verificar si existe 2 registro que contenga el nombre Sebastian

Verificar si existe la tabla persona
  Verificar si existe la tabla persona

Crear tabla libros
  crear la tabla libros
Verificar si el numero de filas es 0
  Verificar si la cantidad de filas es 0

Verificar si el valor es nulo
  Verificar si el apellido es null