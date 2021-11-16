# mocoaTukui
Solucion web, para registro de datos de personas en el Municipio de Mocoa- Colombia

![logoPro](https://user-images.githubusercontent.com/30559996/141877310-cd81e2c2-a5b0-4e25-bd12-d1d3d96b9121.png)



Desarrollado en NetBeans 12, servidor TomCat,  Base de Datos MySQL.

Credenciales de acceso a la base de datos ubicadas en logica.persistencia.ConexionDB .... username  y password   (Adecuar a sus credenciales locales)

El backEnd desarrollado enteramente en Java, clases definidas para cada tabla y los metodos de conexion a la base de datos para el CRUD.
El Front End esta basado en el sistema SPA (single page application), con archivos JSP, unos de conexion a la capa de persistencia, llamados peticionxxxxx.
Los JSP FE tienen funciones de conexion en AngularJS desde los cuales se hacen las peticiones GET y POST para consumir el CRUD de la capa persistencia.

La pagina principal del proyecto es index.jsp

Usuarios de prueba:
usuario : Alejandro100   password: 12345   ------> Administrador
usuario : Lucia103       password: perro45 ------> Funcionario
usuario : Susana109      password: zanahoria2008 --> Usuario

Sin embargo despues de entrar como administrador puede usar cualquiera de los usuarios listados en la base de datos.
