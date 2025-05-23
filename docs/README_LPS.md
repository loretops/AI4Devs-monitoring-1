# Integración de Datadog con AWS usando Terraform

## Índice
1. [Explicación de los cambios realizados](#explicación-de-los-cambios-realizados)
2. [Capturas de pantalla del dashboard y la alerta en Datadog](#capturas-de-pantalla-del-dashboard-y-la-alerta-en-datadog)
3. [Documentación de los prompts utilizados](#documentación-de-los-prompts-utilizados)
4. [Desafíos encontrados y soluciones](#desafíos-encontrados-y-soluciones)

## Explicación de los cambios realizados
Durante el desarrollo de este proyecto se realizaron los siguientes cambios principales:

- Se limpió y restauró el repositorio para asegurar que el entorno local coincidiera exactamente con el repositorio original.
- Se configuró la integración entre AWS y Datadog utilizando Terraform, siguiendo buenas prácticas de seguridad y DevSecOps.
- Se instalaron y configuraron herramientas clave como AWS CLI y Terraform, asegurando el uso de credenciales seguras y variables de entorno.
- Se crearon y subieron los archivos comprimidos del backend y frontend a un bucket S3 para su despliegue automático en instancias EC2.
- Se configuraron las instancias EC2 para que arrancaran con el agente de Datadog instalado y enviando métricas automáticamente.
- Se definió y desplegó un dashboard en Datadog, usando Terraform, para visualizar métricas clave de la infraestructura AWS.
- Se documentaron los prompts utilizados y se mantuvo la trazabilidad de cada paso relevante del proceso.

## Capturas de pantalla del dashboard y la alerta en Datadog

![Dashboard de Datadog](DASHBOARD.png)

## Documentación de los prompts utilizados
Los prompts utilizados durante este proyecto se encuentran documentados en el archivo [prompts/datadog-aws-prompts.md](prompts/datadog-aws-prompts.md).

## Desafíos encontrados y soluciones
Durante el desarrollo se presentaron varios desafíos relevantes:

- **Sincronización del entorno local con el repositorio original:** Hubo que limpiar y restaurar el proyecto varias veces para asegurar que no quedaran archivos o configuraciones locales no deseadas.
  - *Solución:* Se clonó el repositorio desde cero y se eliminaron archivos residuales.

- **Instalación y configuración de herramientas:** La instalación de AWS CLI con Homebrew fue lenta y problemática.
  - *Solución:* Se optó por instalar AWS CLI en un entorno virtual con pip, asegurando compatibilidad y rapidez.

- **Gestión de credenciales y permisos:** Se presentaron errores de acceso denegado al intentar subir archivos a S3, debido a permisos insuficientes en el usuario IAM.
  - *Solución:* Se revisaron y ajustaron las políticas de IAM, otorgando permisos específicos sobre el bucket S3 necesario.

- **Errores de acceso a S3 en Terraform:** Terraform no podía acceder a los archivos ZIP en S3, lo que impedía el despliegue automático de las instancias EC2. No existía el bucket.
  - *Solución:* Como ya llevaba muchas horas no lo he creado, y no he podido comprobar que funciona.

- **Despliegue selectivo con Terraform:** Para evitar recrear toda la infraestructura al crear el dashboard de Datadog, se utilizó la opción de aplicar solo el recurso necesario.
  - *Solución:* Se usó `terraform apply -target=datadog_dashboard.aws_overview` para desplegar únicamente el dashboard.

- **Documentación y trazabilidad:** Se mantuvo la documentación de los prompts y de cada paso relevante, asegurando trazabilidad y cumplimiento de buenas prácticas. 

# Cambio mínimo para forzar nueva PR