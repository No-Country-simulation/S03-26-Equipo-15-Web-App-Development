# S03-26-Equipo-15-Web-App-Development
Startup CRM | Prototipo funcional con flujos básicos de usuario, comunicación y segmentación.

## STACK A DEFINIR

### NOTAS:

```python
**Objetivo**
Desarrollar un sistema CRM inteligente con integración nativa a WhatsApp y correo electrónico, diseñado para startups que gestionan relaciones con leads y clientes en tiempo real. La herramienta debe centralizar conversaciones, automatizar seguimientos y segmentar usuarios, priorizando una experiencia simple, colaborativa y asincrónica.

**Requerimientos funcionales**
* Gestión de contactos y segmentación por estado del funnel
* Integración de canales de comunicación
* Envío y registro de emails con etiquetas y plantillas.
* Recordatorios automáticos para tareas y seguimientos.
* Panel de métricas y analítica.
* Exportación de datos en CSV o PDF.
* Configuración de etiquetas, vistas y filtros guardados.

**Integraciones externas**
* WhatsApp Cloud API (Meta).
* API SMTP o Brevo para email.

**Entregables esperados**
* Prototipo funcional con flujos básicos de usuario, comunicación y segmentación.
* Panel de métricas con visualización de KPIs clave (contactos activos, mensajes enviados, tasa de respuesta).
* Documentación de endpoints y guía de instalación.
```

## Instalación y Uso (Frontend)

Para levantar el entorno de desarrollo del frontend, sigue estos pasos:

1. Clona el repositorio si aún no lo has hecho.
2. Asegúrate de tener instalado [Node.js](https://nodejs.org/) y [pnpm](https://pnpm.io/) en tu equipo.
3. Abre una terminal y navega a la carpeta principal, luego entra al directorio del frontend:
   ```bash
   cd frontend
   ```
4. Instala todas las dependencias del proyecto utilizando **pnpm**:
   ```bash
   pnpm install
   ```
5. Inicia el servidor de desarrollo:
   ```bash
   pnpm run dev
   ```
6. Abre tu navegador y dirígete a `http://localhost:3000` para ver la aplicación corriendo.
