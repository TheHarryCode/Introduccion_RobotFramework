*** Settings ***
Library  DatabaseLibrary
Library  OperatingSystem

*** Variables ***
${DBHOST}  127.0.0.1
${DBNAME}  bdejemplo
${DBPORT}  3306
${DBUSER}  root
${DBPass}  root

*** Keywords ***

Insertar datos en la tabla persona
  ${Output} =  Execute SQL String  Insert into persona values ('101019','Juan','Galvis');


Verificar si existe el registro en la base de datos
    [Arguments]  ${nid}  ${nombre}
  Check If Exists In Database  select * from persona where nid = '${nid}' and nombre = '${nombre}';

Verificar si existe 2 registro que contenga el nombre Sebastian
  Row Count Is Equal To X  select * from persona where nombre like '%Sebastian%';  2

Verificar si existe la tabla persona
    Table Must Exist    persona

crear la tabla libros
  ${output} =  Execute SQL String  create table libro (id integer unique, nombre_libro varchar(100), autor varchar(100));
  Log  ${output}
  Should Be Equal As Strings    ${output}    None

Verificar si la cantidad de filas es 0
  Row Count Is 0    select * from persona where nombre = 'Pedro'

Verificar si el apellido es null
    ${output} =  Query    Select apellido from persona where nid = 101017
    Log    ${output}
    Should Be Equal As Strings    ${output}    ((None,),)
