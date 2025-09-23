# 🛡️ Servidor de Auditoría Técnica y Seguridad

Este servidor Ubuntu está diseñado como un entorno centralizado para la **auditoría continua de seguridad**, integrando herramientas de análisis de dependencias, escaneo de vulnerabilidades y trazabilidad normativa.  
Su objetivo es automatizar la detección temprana de riesgos y facilitar la generación de informes alineados con estándares como **ISO/IEC 27001**, **OWASP** y **RGPD/LOPDGDD**.

---

## ⚙️ Funciones principales

- **Generación de SBOMs (Software Bill of Materials)**  
  - Uso de **Syft** para catalogar dependencias y componentes del código fuente.
  - Exportación en formato **CycloneDX** para compatibilidad con herramientas de análisis.

- **Gestión y análisis de dependencias**  
  - Integración con **Dependency-Track** para:
    - Almacenamiento histórico de SBOMs.
    - Detección de vulnerabilidades (CVEs) en tiempo real.
    - Seguimiento de cambios y trazabilidad técnica.

- **Automatización de auditorías**  
  - Script Bash (`enviar_sbom.sh`) que:
    - Actualiza el repositorio (`git pull`).
    - Genera el SBOM con Syft.
    - Envía el SBOM a Dependency-Track mediante su API REST.
  - Ejecución programada diaria mediante **cron**.

- **Control de versiones y sincronización de código**  
  - Clonación y actualización automática del repositorio GitHub del proyecto.
  - Integración directa con la carpeta de trabajo del servidor.

---



---

## 🔄 Flujo de trabajo

1. **Actualización del código**  
   El servidor ejecuta `git pull` para obtener la última versión del repositorio.

2. **Generación del SBOM**  
   Syft analiza el código y produce un archivo CycloneDX JSON.

3. **Envío a Dependency-Track**  
   El SBOM se envía a la API REST (`/api/v1/bom`) usando el UUID del proyecto y la API Key.

4. **Análisis y trazabilidad**  
   Dependency-Track procesa el SBOM, detecta vulnerabilidades y actualiza el historial del proyecto.

5. **Automatización**  
   Cron ejecuta el script diariamente a las 10:00, dejando constancia en `sbom.log`.

---

## 📊 Beneficios

- Auditoría continua y automatizada.
- Centralización de resultados y trazabilidad.
- Integración con estándares de seguridad y cumplimiento normativo.
- Reducción de riesgos mediante detección temprana de vulnerabilidades.

---

## 🛠️ Herramientas integradas

- **Syft** – Generación de SBOMs.
- **Dependency-Track** – Gestión y análisis de dependencias.
- **Git** – Control de versiones y sincronización.
- **Cron** – Automatización de tareas periódicas.

