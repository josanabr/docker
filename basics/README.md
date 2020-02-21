# Fundamentos de los contenedores

Contenedores es una tecnología de virtualización liviana que ha tomado un gran auge gracias a herramientas como Docker que han mostrado su versatilidad, portabilidad y escalabilidad; en diferentes escenarios de cómputo.

En esta página se busca presentar algunas de las herramientas sobre las cuales se apoyan estas tecnologías de virtualización liviana conocidas también como tecnologías de virtualización a nivel del sistema operativo.
Para llevar a cabo el estudio de estas herramientas se usará como base el siguiente documento titulado [Containers from Scratch](https://ericchiang.github.io/post/containers-from-scratch/). 
En este documento no se dará una explicación detallada de estas herramientas sino que se buscará replicar lo que describe el documento. 
*¿Entonces por qué no remetirse al original?* 
Hay algunas razones para ello:

1- Validar que lo escrito en el [post original](https://ericchiang.github.io/post/containers-from-scratch/) todavía funciona. El archivo de donde se deriva este documento es del 2017 y lo que deseo con este post es revalidar que lo que está allí escrito funciona. 

2- Ampliar la audiencia de este tipo de información. El documento original escrito en inglés y dada lo técnico del tema puede alejar un poco a aquellos que solo entienden español o que el inglés técnico aún les resulta un poco complicado de entender.

3- Hacer una versión multimedia del contenido. Lo descrito en este documento no solo está en este texto sino que también se han creado videos que permitirán al lector acompañar su lectura con una ejecución en vivo de lo que aquí se dice. De hecho, se ha encontrado que hay algunos detalles en la versión original que a la fecha (2020-02-21) no funcionan adecuadamente.

# Requerimientos

Para llevar a cabo lo que se encuentra en este documento se hace necesario tener acceso a una máquina con el sistema Linux instalado y **tener permisos de superusuario/root** en dicha máquina.

Si usted tiene problemas para acceder a un sistema con estas condiciones es posible crearse una máquina virtual basada en Linux donde pueda seguir lo descrito en este documento.

## Vagrant + VirtualBox

Las herramientas Vagrant y VirtualBox son un par de herramientas que facilitarán tener un ambiente adecuado para llevar a cabo los pasos descritos en este documento. 
**Sugiero fuertemente** que si se van a usar estas herramientas se haga la instalación de estas herramientas desde los paquetes ofrecidos por el proveedor/fabricante del software para su plataforma de trabajo:

* [Vagrant](https://vagrantup.com) - [Download page](https://www.vagrantup.com/downloads.html)

* [VirtualBox](https://virtualbox.org) - [Download page](https://www.virtualbox.org/wiki/Downloads) 

### Validando la disponibilidad de estas herramientas

Para validar que las herramientas han sido instaladas adecuadamente ejecutar los siguientes comandos:

* Para Vagrant

```
vagrant version
```

* Para VirtualBox

```
VBoxManage -v
```

### Creando la máquina virtutal con Vagrant  bajo VirtualBox

Para crear la máquina virtual y acceder a ella ejecutar lo siguiente:

* Crear un directorio de trabajo y acceder a él:

```
mkdir VM && cd VM
```

* Creación del archivo `Vagrantfile`. Copiar y pegar las siguientes líneas:

```
cat << EOF > Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |vb|
    vb.customize [ 'modifyvm', :id, '--name', 'testvm' ]
  end
end
EOF
```

* Crear la máquina virtual:

```
vagrant up
```

* Ingresar via ssh la máquina virtual recien creada:

```
vagrant ssh
```


Con estas líneas ya ejecutadas podrá tener acceso a una máquina que le permitirá desarrollar la actividad aquí descrita.
