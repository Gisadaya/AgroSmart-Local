# README - Cambios realizados en las tablas de Sensores y Lecturas

1. Descripción

En esta etapa del proyecto se realizaron diferentes modificaciones y pruebas en la base de datos relacionadas con el almacenamiento de información de **sensores** y sus respectivas **lecturas**.

El objetivo fue permitir registrar los sensores utilizados en el sistema y almacenar los datos obtenidos por ellos, manteniendo una relación entre ambas tablas.



2. Tablas modificadas

Las principales tablas trabajadas fueron:

- `Sensores`
- `Lecturas`

La tabla `Sensores` almacena la información de cada sensor utilizado en el sistema.

La tabla `Lecturas` almacena los valores obtenidos por los sensores, junto con la fecha y hora en que fueron registrados.

---

3. Tabla `Sensores`

La tabla de sensores contiene la información necesaria para identificar y administrar cada sensor.

### Información almacenada

Entre los datos manejados se encuentran:

- Identificador del sensor.
- Nombre o tipo de sensor.
- Estado del sensor.
- Información relacionada con su funcionamiento.

Función

Esta tabla permite identificar qué sensores están registrados en el sistema y mantener un control sobre ellos.



4. Tabla `Lecturas`

La tabla `Lecturas` almacena los datos obtenidos mediante los sensores.

Información almacenada

Las lecturas pueden contener información como:

- Identificador de la lectura.
- Identificador del sensor.
- Valor obtenido.
- Fecha y hora de la lectura.

Función

Permite guardar un historial de los valores registrados por los sensores para posteriormente realizar consultas y monitoreo.

---

5. Relación entre las tablas

Se estableció una relación entre:

`Sensores` → `Lecturas`

Un sensor puede tener **muchas lecturas**, mientras que cada lectura pertenece a **un sensor específico**.

La relación se realiza mediante una clave foránea (`FOREIGN KEY`) en la tabla `Lecturas`.

Representación

```text
Sensores
   |
   | 1
   |
   | N
Lecturas
