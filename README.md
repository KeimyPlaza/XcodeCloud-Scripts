# XcodeCloud-Scripts

Este repositorio contiene scripts **vitaminados** :mechanical_arm: para Xcode Cloud para dar respuesta a esos proyectos más complejos donde herramientas como SonarQube, SwiftLint, Fastlane, etc. actúan en los procesos de CI/CD.

## Empezando

### Prerequisitos

* XcodeCloud funcionando (1 workflow para CI y 1 workflow para CD)
* Xcode 15.x

### Instala y configura

1. Clona el repositorio
2. Copia en tu proyecto (carpeta raíz) los siguientes elementos:
   - Carpeta `ci_script`
   - Carpeta `fastlane`
   - Fichero `sonar-project.properties`
   - Fichero `xccov-to-sonarqube-generic.sh` (Dale permisos de ejecución)
3. Configura estas opciones:


| Name | Description | File |
|---|---|---|
| `SONARQUBE_GENERAL_TOKEN_OR_APP_TOKEN ` | SonarCube token para identificarse. | `ci_scripts/sonar/run_sonar_analysis.sh` |
| `SCHEME_UNIT_TESTING` | Nombre del Scheme de Unit Testing. | `ci_scripts/ci_post_xcodebuild.sh` |
| `main_folder_of_code` | Carpeta raíz del código del proyecto. | `fastlane/Fastfile` |
| `target_name` | Nombre del Target. | `fastlane/Fastfile` |
| `company_name` | Nombre de la compañía para SonarCube. | `fastlane/Fastfile` |
| `custom_message_push` | Mensaje asociado al commit de actualización del build number en el proyecto con el número que ha generado XcodeCloud. | `fastlane/Fastfile` |
| `sonar.projectKey` | Código del proyecto en SonarCube. | `sonar-project.properties` |
| `sonar.projectName` | Nombre del proyecto en SonarCube. | `sonar-project.properties` |
| `sonar.host.url` | Dirección del SonarCube. | `sonar-project.properties` |
| `sonar.projectDescription` | Descripción del proyecto en SonarCube. | `sonar-project.properties` |
| `sonar.swift.project` | Nombre del fichero .xcodeproj. | `sonar-project.properties` |
| `sonar.swift.appScheme` | Nombre del Scheme de la app. | `sonar-project.properties` |
| `sonar.swift.testScheme` | Nombre del Scheme de Unit Testing. | `sonar-project.properties` |


## Y porqué estos scripts?

A día de hoy, noviembre 2023, Apple considera que las cosas en este ámbito deben hacerse de una manera, no seré yo quien les contradiga, pero puede que no cuadre del todo con la necesidad de este tipo de proyectos complejos.

![](resources/writing_customs_build_scripts.png)

Os cuento algunas cosas que he vivido y he tenido que ir adaptando según se presentaban.

### Unit testing y coverage en Sonar

Cuando defines un worflow sencillo para la CI, donde lo que quieres es que compile y ejecute unit testing, tendrías una definición como la siguiente imagen y unos resultados de unit testing parecidos a estos. Hasta aquí todo bien.

![](resources/workflow_step.png)

![](resources/workflow_result_unit_testing.png)


La cosa se complica cuando después de estos resultados de Unit Testing quieres enviarlos a un Sonar y por tanto debes extraer la información de los test passados, su resultado y el Coverage.


![](resources/empty_workspace.png)


### Control del build number

Una de las cosas buenas


## LICENSE

Estos trabajos están disponibles bajo la licencia MIT. Mira el fichero [LICENSE](license) para más información.
