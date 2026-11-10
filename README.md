# Tarea 2 – Análisis del protocolo FTP

## 1. Descripción del proyecto

El presente proyecto tiene como objetivo estudiar el funcionamiento del protocolo FTP (File Transfer Protocol), esto mediante la implementación de una arquitectura cliente-servidor utilizando contenedores Docker.

Se utiliza **Pure-FTPd** como servidor FTP y **LFTP** como cliente, permitiendo establecer comunicaciones, realizar operaciones de transferencia de archivos y analizar el tráfico generado mediante Wireshark.

El trabajo corresponde a la Tarea 2 de la asignatura Taller de Redes y Servicios de la Universidad Diego Portales.

## 2. Integrantes

- **Michel Soto**
- **Mateo Panes**

## 3. Tecnologías utilizadas

| Tecnología | Descripción |
|---|---|
| Docker | Implementación de contenedores. |
| Docker Compose | Configuración y despliegue de los servicios. |
| Pure-FTPd | Servidor FTP. |
| LFTP | Cliente FTP. |
| Wireshark | Análisis del tráfico de red. |
| tcpdump | Captura de paquetes de red. |

## 4. Estructura del repositorio

```text
tarea2-ftp/
│
├── client/
│   └── Dockerfile
│
├── server/
│   ├── Dockerfile
│   └── start.sh
│
├── docker-compose.yml
├── ftp-activo.pcap
└── ftp-pasivo.pcap
```

## 5. Instalación y requisitos

Para ejecutar el proyecto se requiere:

- Docker instalado.
- Docker Compose.
- Conexión a Internet para descargar las dependencias necesarias durante la construcción de las imágenes.

## 6. Ejecución del proyecto

Clonar el repositorio:

```bash
git clone https://github.com/mateopanes-oss/tarea2-ftp.git
```

Ingresar al directorio:

```bash
cd tarea2-ftp
```

Construir e iniciar los contenedores:

```bash
docker compose up -d --build
```

Consultar el estado de los contenedores:

```bash
docker compose ps
```

Para detener los servicios:

```bash
docker compose down
```

## 7. Pruebas de funcionamiento

Se realizaron pruebas de comunicación entre el cliente LFTP y el servidor Pure-FTPd, considerando las siguientes operaciones:

- Autenticación del usuario FTP.
- Consulta y listado de directorios.
- Creación de directorios.
- Subida de archivos mediante STOR.
- Descarga de archivos mediante RETR.
- Pruebas de transferencia en modo activo y pasivo.

## 8. Análisis de tráfico

Se realizaron capturas de paquetes para estudiar el comportamiento del protocolo FTP y sus conexiones TCP.

Se incluyen los siguientes archivos:

- `ftp-activo.pcap`: captura correspondiente al modo activo.
- `ftp-pasivo.pcap`: captura correspondiente al modo pasivo.

Los archivos pueden analizarse mediante Wireshark utilizando filtros como:

```text
ftp || ftp-data
```

El análisis permite identificar comandos, respuestas del servidor, autenticación, establecimiento de conexiones y transferencia de archivos.

## 9. Documentación

El informe escrito de la Tarea 2 contiene el marco teórico del protocolo FTP, la descripción del entorno implementado, el análisis del tráfico observado y las hipótesis sobre posibles modificaciones del tráfico.

## 10. Asignatura

**Universidad Diego Portales**  
Escuela de Informática y Telecomunicaciones  
Taller de Redes y Servicios  
Tarea 2 – Análisis del protocolo FTP

**Profesor:** Jonas Elías Peñailillo
