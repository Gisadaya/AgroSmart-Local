# AgroSmart Local — Usuarios y Parcelas

## Sobre esta rama

Esta rama, **`usuarios-parcelas`**, fue creada y desarrollada por **Gissel Díaz** como parte del trabajo colaborativo del proyecto **AgroSmart Local**.

En esta rama se desarrolló y documentó la parte correspondiente a la gestión de **Usuarios y Parcelas**, incluyendo la creación de tablas, registros de prueba, consultas SQL, modificaciones, validaciones y correcciones de datos.

## Trabajo realizado

### Base de datos

- Creación y organización de las tablas `Usuarios` y `Parcelas`.
- Implementación de la relación entre `Usuarios` y `Parcelas` mediante claves foráneas.
- Registro de datos de prueba para la tabla `Parcelas`.
- Elaboración de consultas SQL utilizando:
  - `SELECT`
  - `WHERE`
  - `ORDER BY`
  - `INNER JOIN`
  - `LEFT JOIN`
  - `GROUP BY`
  - `HAVING`
  - `COUNT`
  - `SUM`
  - `MAX`
  - `MIN`
- Modificación de registros mediante `UPDATE`.
- Eliminación de registros de prueba mediante `DELETE`.

### Validación y corrección de datos

Durante la revisión de los datos se identificaron y corrigieron inconsistencias relacionadas con las parcelas y los usuarios:

- Duplicación de nombres de parcelas dentro de un mismo usuario.
- Corrección de la escritura de `Huerto Terceario` a `Huerto Terciario`.
- Normalización de los correos electrónicos de los usuarios mediante `LOWER()`.
- Elaboración de consultas para verificar que las correcciones realizadas fueran correctas.

### Consultas de la Semana 3

Se desarrollaron consultas para analizar la relación entre las parcelas y otros componentes de la base de datos, incluyendo:

- Relación entre `Parcelas` y `Sensores`.
- Relación entre `Usuarios` y `Parcelas`.
- Cantidad total de parcelas.
- Cantidad de sensores asociados a los usuarios mediante sus parcelas.
- Valor máximo y mínimo de `id_parcela`.
- Cantidad de parcelas agrupadas por tipo de cultivo.
- Detección de posibles nombres de parcelas duplicados.

## Trabajo de integración

Como parte de la actividad de preparación para la integración entre la aplicación y la base de datos, esta rama también contiene el aporte correspondiente a **Usuarios y Parcelas**.

El trabajo de integración contempla el análisis de:

- Funciones de la aplicación relacionadas con usuarios y parcelas.
- Correspondencia entre las funciones de la aplicación y las tablas PostgreSQL.
- Operaciones SQL relacionadas con dichas funciones.
- Flujo de información entre la aplicación, una futura API o servicio web y PostgreSQL.

El proyecto plantea una futura arquitectura de comunicación:

**Aplicación AgroSmart Local → API/Servicio Web → PostgreSQL**

En esta etapa no se desarrolla una conexión directa entre App Inventor y PostgreSQL ni una API funcional.

## Archivos de esta rama

| Archivo | Contenido |
|---|---|
| `database/01_estructura.sql` | Estructura de la base de datos y relaciones. |
| `database/02_datos_prueba.sql` | Datos de prueba utilizados para la tabla `Parcelas`. |
| `database/03_consultas.sql` | Consultas SQL, modificaciones, eliminación y validaciones de datos. |
| `database/04_seguridad.sql` | Configuración relacionada con usuarios y permisos de la base de datos. |
| `integracion/diagrama_integracion.png` | Diagrama de la futura comunicación entre la aplicación, la API o servicio web y PostgreSQL. |
| `modelo/modelo_fisico.png` | Modelo físico de la base de datos AgroSmart Local. |
| `evidencias/` | Evidencias correspondientes al trabajo realizado. |


### Responsable:

**Gissel Díaz**  
Creadora y responsable de la rama `usuarios-parcelas`.
