SISTEMA DE APARCAMIENTO INTELIGENTE 🚗

Logo


📕 RESUMEN
Como los sistemas computarizados son una parte integral de la era actual, un sistema de estacionamiento automatizado es una de sus aplicaciones más utilizadas. El objetivo de este modelo es construir e implementar un sistema de estacionamiento automático que detectará el espacio de estacionamiento con la ayuda de la técnica de procesamiento de imágenes del estacionamiento y reducirá la energía humana. El sistema de estacionamiento inteligente podrá tener menos interacción de humanos. Además de eso, tiene un sistema de guía de estacionamiento que puede mostrar y guiar al usuario hacia un espacio de estacionamiento. Con los problemas de la creciente congestión del tráfico urbano y la creciente escasez de espacio, los estacionamientos deben estar bien equipados con detección de espacios de estacionamiento. El sistema propuesto ayuda a contar la cantidad de vehículos estacionados e identificar la cantidad de lugares disponibles. El sistema detecta automóviles a través de imágenes en lugar de sensores electrónicos integrados en los pisos. Se instala una cámara en una posición alta y fija en el estacionamiento. Se toma una imagen de estacionamiento vacío como referencia y luego se toma una imagen de estacionamiento con autos. Ambas imágenes se restan para encontrar la cantidad de espacios de estacionamiento disponibles.
📜 INTRODUCCIÓN
Hoy en día, el automóvil se ha convertido en una necesidad; ya no es un lujo, especialmente para los trabajadores. La gente incluso compra un coche a plazos. Cuando se habla de metropolitano, los atascos de tráfico se han vuelto bastante comunes recientemente durante una gran cantidad de vehículos. Además, no podemos negar la existencia de los coches en nuestra vida diaria. Siempre que salimos en coche, nos encontramos con problemas para encontrar una plaza de aparcamiento disponible. Cuando el conductor ingresa a un determinado estacionamiento, lo primero que hace es buscar alguna señal que indique si el estacionamiento está totalmente ocupado, parcialmente ocupado o vacío. . Tampoco sabe cuántos espacios de estacionamiento hay y dónde encontrar una división de estacionamiento para su automóvil. Algunas de las divisiones de estacionamiento pueden permanecer desocupadas incluso cuando la ocupación total es alta. Esto provoca un uso ineficaz de las divisiones de estacionamiento, así como atascos de tráfico alrededor de la entrada del estacionamiento. Por lo tanto, ofrecer a los conductores información relevante sobre el estacionamiento mientras ingresan al estacionamiento se convierte en un tema importante. Cuando el conductor ingresa a un determinado estacionamiento, el conductor tarda mucho tiempo en encontrar un lugar de estacionamiento disponible. Contar el espacio de estacionamiento disponible mediante el procesamiento de imágenes ayuda a resolver el problema que enfrenta el conductor a bajo costo. El sistema utiliza el procesamiento de imágenes para detectar la existencia del automóvil y también proporciona información como el número de plazas de aparcamiento disponibles. El sistema captura la imagen usando cámaras CCTV y procesa la imagen para contar el espacio de estacionamiento disponible. El sistema básicamente se implementa para planificar, analizar, diseñar, desarrollar y probar. El desarrollo de este sistema utilizará técnicas de procesamiento de imágenes que se implementarán en cada fase de la metodología. Este sistema proporciona información sobre el número de plazas de aparcamiento disponibles. Beneficiará a todos los conductores cuando ingresen al estacionamiento. El sistema utiliza procesamiento de imágenes, ya que toda el área del estacionamiento se puede observar con relativamente pocas cámaras. Aparte de eso, el sistema es compacto y el costo no es alto. La imagen de un estacionamiento es tomada por una cámara de vigilancia colocada a cierta altura en el estacionamiento. MATLAB se utiliza como plataforma de software en este proyecto. El sistema utiliza procesamiento de imágenes, ya que toda el área del estacionamiento se puede observar con relativamente pocas cámaras. Aparte de eso, el sistema es compacto y el costo no es alto. La imagen de un estacionamiento es tomada por una cámara de vigilancia colocada a cierta altura en el estacionamiento. MATLAB se utiliza como plataforma de software en este proyecto. El sistema utiliza procesamiento de imágenes, ya que toda el área del estacionamiento se puede observar con relativamente pocas cámaras. Aparte de eso, el sistema es compacto y el costo no es alto. La imagen de un estacionamiento es tomada por una cámara de vigilancia colocada a cierta altura en el estacionamiento. MATLAB se utiliza como plataforma de software en este proyecto.


📃 MODELO Y METODLOGÍA PROPUESTOS
El flujo principal del marco se muestra en la Fig-1. Los videos se adquieren desde la vista superior del área de estacionamiento con la ayuda de una cámara fija. El video está segmentado en cuadros. Luego, de cada segmento se extrae un fotograma clave y se aplica un procesamiento adicional en este fotograma clave, para reducir la complejidad computacional.


Diagrama de bloques


1) Inicialización del sistema
Imagen de fondoEn la etapa inicial, una cámara CCTV fija captura una imagen en el momento de la instalación, que es la imagen de referencia de fondo. Esta imagen de referencia no contiene ningún coche. El objetivo principal es identificar las plazas de aparcamiento en la imagen. La cámara que se utiliza para tomar las imágenes está fija en una posición determinada y está orientada en una dirección fija todo el tiempo.


2) Adquisición de imágenes
Imagen de estacionamientoEn este paso, la imagen del espacio de estacionamiento que contiene automóviles se toma con la ayuda de una cámara de alta definición.
El marco de la imagen que contiene la imagen de seis carriles está dividido por carriles.
Luego, los datos de la imagen se suministran al software MATLAB para su posterior procesamiento.


3) Umbral de imagen
La imagen RGB adquirida se convierte luego en una imagen en escala de grises y luego se crea una imagen binaria en el módulo de segmentación de imágenes. La ecuación utilizada para la conversión a una imagen en escala de
grises es Gray = 0.229R + 0.587G + 0.11B
La imagen en escala de grises del espacio de estacionamiento con automóviles. A partir de la imagen en escala de grises resultante, se obtiene una imagen binaria utilizando la técnica de umbralización. La imagen binaria contiene toda la información sobre la posición y la forma de interés. El nivel de umbral se establece de tal manera que los objetos de interés se convierten en blanco y el resto de la imagen en negro.


4) Mejora de la imagen
La imagen binaria contiene mucho ruido que se elimina mediante operaciones morfológicas y filtros como el filtro Weiner. Los agujeros se eliminan con la ayuda de la función de relleno y apertura.


Mejora de la imagen


5) Detección de imágenes
Para detectar los coches, el análisis de blobs se realiza mediante funciones predefinidas en MATLAB y se cuenta el número de coches.


Detección de imágenes


📄 ALGORITMO DEL SISTEMA PROPUESTO
Los principales pasos del algoritmo propuesto para la detección de plazas de aparcamiento son:

El sistema obtendrá una transmisión de video en vivo del estacionamiento desde la cámara.
Las imágenes se capturan cuando un automóvil ingresa al estacionamiento.
Las imágenes RGB se convierten en imágenes binarias.
El marco se recorta en el carril y se considera secuencial e individualmente en un bucle.
Los espacios vacíos con su carril respectivo se conocen calculando el número de automóviles.
Y luego proporciona una navegación adecuada al vehículo.

Algoritmo


📑 CONCLUSIÓN
Hay muchos sistemas de aparcamiento automatizados ya disponibles que utilizan tecnologías como GSM, transmisor inalámbrico, etc. Este proyecto fue elegido especialmente con el propósito de aprender más sobre el procesamiento de imágenes, ya que es una de las tecnologías más relevantes de nuestro tiempo y se utiliza en muchas otras aplicaciones. Se diseñó y probó el sistema de detección de plazas de aparcamiento basado en el procesamiento de imágenes en MATLAB. Es posible administrar un área grande con solo usar varios CCTV. Es consistente en la detección de autos entrantes porque usa imágenes reales de autos. Es económico y de fácil instalación debido al equipo simple. Los conductores pueden obtener información útil sobre el estacionamiento en tiempo real de este sistema mediante la pantalla de información de orientación.


📸 CAPTURA DE PANTALLA
Ventana de comandos de MATLAB después de la ejecución del código.


Salida de MATLAB


Hay dos cifras de salida después de la ejecución del código.
Figura 1 - Observación de toda el área de estacionamiento.
Figura 2 - Se muestra la observación de cada carril en el área de estacionamiento y el carril vacío.


Figura 1


Figura 2


📜 LICENCIA
MIT
