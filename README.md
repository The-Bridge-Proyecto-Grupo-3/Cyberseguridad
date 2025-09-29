# 🛡️ Proyecto de Auditoría y Seguridad Automatizada

Este repositorio centraliza la **auditoría de código y generación de SBOMs** de varios proyectos del grupo, integrando herramientas de análisis estático, detección de secretos y trazabilidad de dependencias.  
El objetivo es disponer de un **pipeline CI/CD robusto** que garantice seguridad, cumplimiento normativo y visibilidad completa de riesgos.

---
<img width="1774" height="1156" alt="image" src="https://github.com/user-attachments/assets/88e779b0-31d1-464a-9721-db5fc0dd289c" />


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
<img width="1050" height="790" alt="image" src="https://github.com/user-attachments/assets/a69c6220-6162-4c49-8e53-c9dbed5b2778" />

En el diagrama se muestra cómo:

En el se despliega el contenedor de dependency-Track para funcionar de runner para github el proposito es hacer ejecuciones que no pueda hacer via cloud

Todo el servidor está protegido por:
  NordVPN → capa de red segura y cifrada.
  Suricata → IDS/IPS para detectar intrusiones y tráfico sospechoso.
  UFW → firewall que controla accesos y puertos.

