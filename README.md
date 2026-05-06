# Morse Code Learning Tool - iOS 📡

Una aplicación interactiva para iOS diseñada para aprender y practicar código Morse de manera visual y auditiva. Este proyecto replica la estética de una placa de circuito impreso (PCB) real, permitiendo al usuario navegar a través de un árbol dicotómico de letras mediante pulsaciones de telégrafo en tiempo real.

##  Características Principales

*   **Motor de Audio de Baja Latencia**: Utiliza `AVAudioSourceNode` para generar ondas senoidales en tiempo real, eliminando el retraso típico de los archivos de audio y permitiendo una respuesta instantánea a los "puntos" más rápidos.
*   **Diseño Basado en Hardware Real**: El mapa visual sigue estrictamente la distribución y orientación de un dispositivo de entrenamiento Morse físico, incluyendo la antena de raíz y la orientación vertical/horizontal de los nodos.
*   **Árbol Dicotómico Interactivo**: Los nodos se iluminan dinámicamente siguiendo la secuencia de entrada del usuario.
*   **Interfaz Adaptativa**: Diseño programático que se escala automáticamente para verse bien en cualquier iPhone, desde el SE hasta el Pro Max.
*   **Feedback Háptico**: Integración con `UIImpactFeedbackGenerator` para una sensación táctil de telégrafo real en el dispositivo.

##  Tech Stack

*   **Lenguaje**: Swift 6
*   **Framework**: SwiftUI
*   **Audio**: AVFoundation (AVAudioEngine)
*   **Gráficos**: SwiftUI Canvas para renderizado de alto rendimiento.

##  Estructura del Proyecto

*   **`Models/MorseNode.swift`**: Contiene la lógica del árbol y las coordenadas precisas de cada letra.
*   **`ViewModels/MorseViewModel.swift`**: Gestiona el estado de la secuencia actual y la lógica de tiempo para distinguir entre puntos (`.`) y rayas (`-`).
*   **`ViewModels/ToneGenerator.swift`**: El corazón del sonido instantáneo de la app.
*   **`Views/TreeMapView.swift`**: Renderizado personalizado del mapa Morse mediante el uso de coordenadas proporcionales.
*   **`Views/TelegraphButtonView.swift`**: Interfaz del botón táctil optimizada para detectar "Touch Down" y "Touch Up" sin retrasos del sistema.

##  Instalación

1.  Clona este repositorio.
2.  Abre el proyecto en **Xcode 15+**.
3.  Asegúrate de seleccionar un equipo de desarrollo en la pestaña *Signing & Capabilities*.
4.  Ejecuta en un **iPhone real** (recomendado para probar la latencia de audio y los hápticos).

##  Lógica de Entrada

La aplicación utiliza un umbral de tiempo preciso para mejorar la experiencia del usuario:
*   **Punto (`.`)**: Pulsación menor a **180ms**.
*   **Raya (`-`)**: Pulsación mayor a **180ms**.
*   **Reset**: La secuencia se reinicia automáticamente tras **1.2 segundos** de inactividad para facilitar la práctica de nuevas letras.

---

###  Vista Previa del Diseño
El mapa visual está organizado en filas y columnas que replican la jerarquía del código Morse:
- **Lado Izquierdo**: Comienza con Rayas (`-`).
- **Lado Derecho**: Comienza con Puntos (`.`).

---

**Desarrollado como parte de un proyecto de Ingeniería Electrónica y Computación.**
