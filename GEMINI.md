# GEMINI.md

## Reto | Creación de un Vision Board


---

## Objetivo

Diseñar la interfaz de una aplicación de vision board en SwiftUI que permita a los usuarios visualizar y organizar sus metas personales.

La app permitirá agregar, personalizar y clasificar aspiraciones, creando una experiencia interactiva y motivadora para facilitar la visualización de los objetivos que desean alcanzar.

---

## Introducción

Este vision board es una oportunidad para visualizar tus metas, enfocarte en aquello que puedes aportar y recordar que cada idea, por pequeña que parezca, tiene el potencial de hacer una diferencia.

Además, a través del diseño de esta aplicación, reforzarás los temas vistos en el curso, aplicando conocimientos de SwiftUI mientras construyes un espacio visual donde podrás organizar tus aspiraciones y sueños, manteniéndote inspirado mientras avanzas en tus objetivos.

---

# Instrucciones del reto

Desarrolla una aplicación en SwiftUI que funcione como un vision board digital, donde el usuario pueda visualizar y organizar sus metas mediante imágenes que representen sus sueños y aspiraciones.

La aplicación deberá permitir:

- Personalizar la vista del vision board.
- Elegir colores y categorías.
- Agregar un nombre personalizable.
- Aplicar elementos visuales e interacción utilizando SwiftUI.

---

# Pasos para realizar

## 1. Identifica tus metas y sueños

Haz una lista de 9 metas, sueños o frases motivadoras que representen aquello que deseas alcanzar
Estas metas deben reflejar aspiraciones personales que te inspiren y motiven.



## 2. Selecciona imágenes inspiradoras

Encuentra 9 imágenes que simbolicen tus metas y el futuro que deseas crear.

Las imágenes pueden incluir:

- Íconos
- Palabras
- Ilustraciones

Deben evocar emociones positivas y representar visualmente tus sueños. (Ya las tengo en Assets)

---

## 3. Dale un título significativo a tu vision board

Define un nombre que encapsule el espíritu de tus metas.

Ejemplos:

- “Mis Sueños”
- “Metas 2025”
- “Mi Futuro”

El título debe inspirarte cada vez que lo leas.

---

## 4. Organiza los elementos visuales en la interfaz

Utiliza:

- `Text`
- `Image`
- `VStack`
- `HStack`
- `ZStack`

Organiza las imágenes y frases de manera visualmente atractiva y fácil de navegar.

Puedes:

- Sobreponer texto sobre imágenes
- Utilizar íconos
- Crear cualquier diseño inspirador

---

## 5. Personaliza el fondo del vision board

Agrega un control `ColorPicker` para permitir que el usuario elija el color de fondo del vision board.

Esto debe mejorar la personalización y la experiencia visual.

---

## 6. Agrega una categoría a tu vision board

Implementa un `Picker` que permita seleccionar una categoría para el vision board.

Ejemplos:

- Salud
- Carrera
- Crecimiento Personal

Esto ayudará a clasificar el contenido y darle un propósito claro.

---

## 7. Añade una animación a un elemento del vision board

Selecciona un elemento visual como:

- Una imagen
- El título

Aplica una animación sutil pero atractiva para mejorar la experiencia del usuario.

---

## 8. Permite al usuario cambiar el título del vision board

Agrega un `TextField` que permita editar el título del vision board.

Confirma los cambios utilizando un `Alert` que notifique cuando el nuevo título haya sido guardado.

---

## 9. Asegura la accesibilidad en tu vision board

Utiliza modificadores de accesibilidad para que tecnologías como VoiceOver puedan interpretar el contenido.

Ejemplo:

```swift
.accessibilityLabel("Meta de Viaje")
```

Esto ayudará a que más usuarios puedan disfrutar del contenido.

---

# Sugerencias para seguimiento de metas

## 10. Añade lógica para Revisar tu vision board periódicamente

Visualiza tu vision board regularmente para recordar tus sueños y mantenerte enfocado en tus metas.

Muestra

- Tu progreso
- Cómo te sientes respecto a cada meta

---

El diseño debe ser hermoso, minimalista, apegado a las Human Interfaces Guidelines de Apple.
