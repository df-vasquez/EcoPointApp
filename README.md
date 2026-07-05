# 🌿 EcoPoint App

¡Bienvenido a **EcoPoint**! Una aplicación móvil moderna desarrollada con **Flutter** orientada a la gestión y concientización ecológica (reciclaje, incentivos y geolocalización de puntos verdes).

Este repositorio contiene el código fuente base actualizado, limpio y listo para producción o continuación del desarrollo.

---

## Requisitos Previos

Antes de arrancar el proyecto, asegúrate de tener instalado en tu entorno local:

* **Flutter SDK:** `>=3.19.0` (Canal Stable)
* **Dart SDK:** `>=3.3.0`
* **Android Studio / Xcode:** Configurados para emulación móvil.
* **Cocoapods:** (Solo para despliegues en macOS/iOS).

---

## Instalación y Configuración rápida

Sigue estos pasos en orden para levantar el entorno de desarrollo desde cero:

1.  **Clonar el repositorio:**
    ```bash
    git clone [https://github.com/df-vasquez/ecopoint-app.git](https://github.com/df-vasquez/ecopoint-app.git)
    cd ecopoint-app
    ```

2.  **Limpiar la caché del compilador (Recomendado):**
    ```bash
    flutter clean
    ```

3.  **Instalar dependencias del proyecto:**
    Este comando descargará automáticamente todos los paquetes definidos en el `pubspec.yaml` (Firebase, UI components, Geolocalización, etc.):
    ```bash
    flutter pub get
    ```

4.  **Verificar la salud del entorno:**
    Asegúrate de que no existan conflictos de dependencias o configuraciones pendientes de Android/iOS:
    ```bash
    flutter doctor
    ```

---

## Ejecución del Proyecto

Una vez que `flutter doctor` te dé luz verde, puedes inicializar la aplicación en modo Debug seleccionando tu plataforma objetivo:

* **Ejecutar en un dispositivo específico (Web / Móvil / Desktop):**
    ```bash
    flutter run -d <nombre-del-dispositivo>
    ```
    *Ejemplo para Chrome:* `flutter run -d chrome`
    *Ejemplo para macOS:* `flutter run -d macos`

* **Desplegar menú interactivo de dispositivos:**
    ```bash
    flutter run
    ```

---

## Arquitectura del Proyecto

El código fuente está estructurado bajo las mejores prácticas de Flutter dentro del directorio `/lib`:

* `main.dart`: Punto de entrada de la aplicación.
* `/screens` o `/views`: Vistas de la interfaz de usuario (UI).
* `/src`: Integración con APIs externas y Backend (Firebase).

---
