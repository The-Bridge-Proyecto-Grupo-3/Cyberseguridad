# 🛡️ Proyecto de Auditoría y Seguridad Automatizada

Este repositorio centraliza la **auditoría de código y generación de SBOMs** de varios proyectos del grupo, integrando herramientas de análisis estático, detección de secretos y trazabilidad de dependencias.  
El objetivo es disponer de un **pipeline CI/CD robusto** que garantice seguridad, cumplimiento normativo y visibilidad completa de riesgos.

---
[
](https://sdmntprnortheu.oaiusercontent.com/files/00000000-8290-61f4-a4d5-3d7de83558dd/raw?se=2025-09-29T11%3A55%3A45Z&sp=r&sv=2024-08-04&sr=b&scid=0ea1f70f-c31e-5c2b-86a8-256044567aac&skoid=82a3371f-2f6c-4f81-8a78-2701b362559b&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-09-28T13%3A13%3A43Z&ske=2025-09-29T13%3A13%3A43Z&sks=b&skv=2024-08-04&sig=kBOjO0bauBYgp5kEPFWtnn9a1NIG%2BkyWTkWZ%2BTn8oxI%3D)<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/a95ffc28-dc17-45ed-ab28-dcf52e73fc51" />
## 🚀 Funcionalidades principales

### 🔍 Auditorías de código
- **ESLint**: análisis de calidad y estilo en proyectos Node.js/JavaScript.
- **Semgrep**: reglas de seguridad y patrones de vulnerabilidades en múltiples lenguajes.
- **Gitleaks**: detección de secretos expuestos en el código (tokens, claves, contraseñas).

Cada herramienta genera un informe en formato **JSON**, versionado en la carpeta [`sbom/`](./sbom).

---

### 📦 Generación de SBOMs
- **Syft**: genera *Software Bill of Materials* (SBOM) en formato **CycloneDX JSON** para cada repositorio.
- Permite trazabilidad de dependencias y facilita la integración con herramientas de gestión de vulnerabilidades (ej. Dependency-Track).

---

### 📂 Repositorios auditados
Actualmente el pipeline integra los siguientes proyectos:

- **Cyberseguridad** (este repo principal)
- **FS-Backend** → [The-Bridge-Proyecto-Grupo-3/FS-Backend](https://github.com/The-Bridge-Proyecto-Grupo-3/FS-Backend)
- **FS-Frontend** → [The-Bridge-Proyecto-Grupo-3/FS-Frontend](https://github.com/The-Bridge-Proyecto-Grupo-3/FS-Frontend)
- **Data Science Group** → [The-Bridge-Proyecto-Grupo-3/data_science_group](https://github.com/The-Bridge-Proyecto-Grupo-3/data_science_group)

Cada ejecución del workflow clona estos repos, ejecuta las auditorías y genera sus SBOMs.

---

### ⚙️ Automatización CI/CD
- Workflow en **GitHub Actions**:
  - Se ejecuta en cada `push` o `pull_request`.
  - Corre auditorías (ESLint, Semgrep, Gitleaks).
  - Genera SBOMs con Syft.
  - Copia todos los informes a la carpeta [`sbom/`](./sbom).
  - Realiza **commit automático** con `GITHUB_TOKEN` para mantener un histórico versionado.

---

### 📊 Integración con observabilidad
- Los informes JSON se almacenan en el repo y pueden ser enviados a un servidor central:
  - **Promtail** → ingesta de logs.
  - **Loki** → almacenamiento y consultas.
  - **Grafana** → dashboards y visualización de hallazgos.

Esto permite tener un **panel centralizado de seguridad** con métricas en tiempo real.

---

## 📁 Estructura del repositorio

Cyberseguridad/
├── .github/
│   └── workflows/
│       └── auditoria.yml        # Workflow CI/CD con ESLint, Semgrep, Gitleaks y SBOMs
│
├── sbom/                        # Carpeta donde se guardan los informes versionados
│   ├── eslint_cyber.json
│   ├── semgrep_cyber.json
│   ├── gitleaks_cyber.json
│   ├── sbom_cyber.json
│   ├── eslint_fs_backend.json
│   ├── semgrep_fs_backend.json
│   ├── gitleaks_fs_backend.json
│   ├── sbom_fs_backend.json
│   ├── eslint_fs_frontend.json
│   ├── semgrep_fs_frontend.json
│   ├── gitleaks_fs_frontend.json
│   ├── sbom_fs_frontend.json
│   ├── semgrep_data.json
│   ├── gitleaks_data.json
│   └── sbom_data.json
│
├── src/                         # Código fuente del proyecto principal (Cyberseguridad)
│   ├── ...                      # Scripts, módulos, etc.
│
├── README.md                    # Documentación del proyecto
└── package.json / requirements   # Dependencias del proyecto principal

---

## 📝 Ejemplo de informes generados
- `sbom/eslint_cyber.json`
- `sbom/semgrep_fs_backend.json`
- `sbom/gitleaks_fs_frontend.json`
- `sbom/sbom_data.json`

---

## ✅ Beneficios
- **Automatización completa** de auditorías en múltiples repos.
- **Versionado histórico** de informes para trazabilidad.
- **Cobertura transversal**: calidad de código, seguridad, secretos y dependencias.
- **Integración con observabilidad** para monitorizar riesgos en tiempo real.
- **Cumplimiento normativo** alineado con ISO/IEC 27001, OWASP y buenas prácticas de seguridad.

---

## 🚀 Próximos pasos
- Extender reglas personalizadas de Semgrep para casos específicos del grupo.
- Integrar análisis de dependencias con **Trivy**.
- Añadir dashboards preconfigurados en Grafana para cada tipo de informe.

# Estructura detallada del servidor 
https://copilot.microsoft.com/th/id/BCO.b4fad127-c773-4877-b718-1aabf06eab50.png<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/0a1ee981-a618-42ea-8174-f787ccb116e5" />

En el diagrama se muestra cómo:
GitHub Actions genera los informes JSON (ESLint, Semgrep, Gitleaks, SBOMs).
  Estos llegan al servidor de auditoría, donde Promtail los recoge.
  Loki los almacena y Grafana los visualiza en dashboards.

Todo el servidor está protegido por:
  NordVPN → capa de red segura y cifrada.
  Suricata → IDS/IPS para detectar intrusiones y tráfico sospechoso.
  UFW → firewall que controla accesos y puertos.

