# Autotune en Docker

En este repositorio encontrará los siguientes archivos:

* [Dockerfile](Dockerfile) este archivo le permitirá construir su contenedor de Autotune. Para construir este contenedor usted debe tener [instalado Docker](https://docs.docker.com/engine/installation/) en su computador. Una vez lo tenga instalado puede ejecutar el siguiente comando para crear su contenedor con Autotune `docker build -t autotune .`.

* [run.sh](run.sh) Este archivo le permitirá correr el contenedor de la siguiente manera `./run.sh example_runs.json` donde el archivo .json tiene la configuración de la ejecución que se desea hacer.
