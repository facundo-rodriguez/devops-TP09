# TP09 - Despliegue en Kubernetes (K3d + WSL2)

## 👤 Información del Estudiante
* **Nombre:** Rodriguez Facundo
* **Proyecto:** API Node.js + Frontend Nginx + MySQL (Clever Cloud)
* **Entorno:** WSL2 (Ubuntu) + K3d (Kubernetes)

---

## 🚀 Descripción del Proyecto
Este trabajo práctico consiste en la orquestación de una aplicación web mediante **Kubernetes**. A diferencia de la propuesta base, este proyecto mantiene una arquitectura de **Node.js** para el backend, conectándose de forma segura a una base de datos **MySQL remota en Clever Cloud**, y un servidor **Nginx** para el frontend.

### Componentes Clave:
* **Cluster Local:** Desplegado con `k3d` mapeando el puerto `30080`.
* **Backend:** 2 Réplicas de la API Node.js con inyección de secretos.
* **Frontend:** Nginx sirviendo contenido estático y actuando como Proxy Inverso.
* **Namespace:** Todo el despliegue se encuentra aislado en el espacio de nombres `tp09-facundo`.

---

## 📂 Estructura del Repositorio
```text
devops-TP09/
├── manifests/
│   ├── base/
│   │   └── namespace.yml      # Definición del entorno aislado
│   ├── db/
│   │   └── secrets.yml        # Credenciales Base64 para Clever Cloud
│   ├── backend/
│   │   ├── configmap.yml      # Variables de entorno no sensibles
│   │   └── backend.yml        # Deployment (2 réplicas) y Service
│   └── frontend/
│       └── frontend.yml       # Deployment y Service NodePort (30080)
└── scripts/
    ├── deploy.sh              # Script de despliegue automatizado
    └── verificar.sh           # Script de monitoreo y logs




💡 Notas Técnicas
Se utilizó Secrets de Kubernetes para manejar la seguridad de la base de datos remota.

Se configuró un Proxy Inverso en el pod de Nginx para redirigir las peticiones /api/ al backend-service:3000 de forma interna.

El uso de ConfigMaps permitió desacoplar la configuración del servidor web del ciclo de vida de la imagen de Docker.
