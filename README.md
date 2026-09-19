<p align="center">
  <img src="Banner_AgroSmart_Local.png" alt="AgroSmart Local" width="100%">
</p>

<h1 align="center">AgroSmart Local</h1>

<p align="center">
  Base de datos del proyecto AgroSmart Local
</p>

---

## Descripción

AgroSmart Local es un sistema de monitoreo agrícola desarrollado para facilitar el seguimiento de las condiciones de un cultivo. El proyecto permite registrar información relacionada con usuarios, parcelas, sensores, lecturas, riegos y alertas.

La base de datos de AgroSmart Local está diseñada para almacenar y administrar la información utilizada por la aplicación AgroSmart.
---

## Objetivo

Diseñar y administrar una base de datos que permita organizar la información generada por el sistema AgroSmart, manteniendo relacionadas las diferentes entidades del proyecto.

---

## Tecnologías utilizadas

| Tecnología | Uso dentro del proyecto |
|---|---|
| PostgreSQL | Gestión y almacenamiento de la base de datos |
| pgAdmin 4 | Administración y manejo de la base de datos |
| GitHub | Control de versiones y trabajo colaborativo |

---

## Estructura de la base de datos

La base de datos está compuesta por seis tablas principales:

| Tabla | Función |
|---|---|
| **Usuarios** | Información de los usuarios registrados |
| **Parcelas** | Información de las parcelas y cultivos |
| **Sensores** | Sensores asociados a las parcelas |
| **Lecturas** | Datos obtenidos de los sensores |
| **Riegos** | Registro de los riegos realizados |
| **Alertas** | Registro de alertas generadas |

---

## Modelo físico

El modelo físico representa la estructura de la base de datos, sus campos, claves y relaciones entre las diferentes tablas.

<p align="center">
  <img src="modelo_fisico.png" alt="Modelo físico de la base de datos" width="90%">
</p>

---
## Integrantes

- Gissel Adaryai Díaz López
- Leonardo Abisaí Funez Zetino
- Ariana Valeria Arias Henríquez

## Trabajo colaborativo

El proyecto se desarrolla mediante GitHub utilizando ramas independientes para distribuir las tareas entre los integrantes.

| Integrante | Rama | Entregables principales |
|---|---|---|
| Gissel Díaz | `usuarios-parcelas` | Datos de prueba, consultas y documentación correspondiente a Usuarios y Parcelas |
| Leonardo Funes | `sensores-lecturas` | Datos de prueba, consultas y documentación correspondiente a Sensores y Lecturas |
| Valeria Arias | `riegos-alertas` | Datos de prueba, consultas y documentación correspondiente a Riegos y Alertas |

