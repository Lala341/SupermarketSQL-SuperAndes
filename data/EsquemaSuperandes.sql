--- Sentencias SQL para la creacion del esquema de parranderos
--- Las tablas tienen prefijo A_ para facilitar su acceso desde SQL Developer

-- USO
-- Copie el contenido de este archivo en una pestana SQL de SQL Developer
-- Ejecutelo como un script - Utilice el boton correspondiente de la pestana utilizada

-- Creacion del secuenciador
create sequence superandes_sequence;


	


CREATE TABLE CIUDAD 
   (ID NUMBER, 
	NOMBRE VARCHAR2(255 BYTE) NOT NULL, 
	CONSTRAINT CIUDAD_PK PRIMARY KEY (ID));
ALTER TABLE CIUDAD
ADD CONSTRAINT UQ_ciudad_NOMBRE
    UNIQUE (NOMBRE)
ENABLE;

CREATE TABLE SUCURSAL
   (ID NUMBER, 
	TAMANHO NUMBER NOT NULL, 
	TIPOMERCADO VARCHAR2(255 BYTE) NOT NULL, 
	VENTASTOTALES NUMBER NOT NULL, 
	CIUDAD NUMBER NOT NULL,
    DIRECCION VARCHAR2(255 BYTE) NOT NULL,
	CONSTRAINT SUCURSAL_PK PRIMARY KEY (ID));
	 
ALTER TABLE SUCURSAL
ADD CONSTRAINT fk_ciudad
    FOREIGN KEY (ciudad)
    REFERENCES CIUDAD(id)
ENABLE;


CREATE TABLE ADMINISTRADOR
   (ID NUMBER, 
    CANTIDADRECOMPRA NUMBER, 
	USUARIO VARCHAR2(255 BYTE), 
    CONTRASENHA VARCHAR2(255 BYTE),
	CONSTRAINT ADMINISTRAOR_PK PRIMARY KEY (ID));
ALTER TABLE ADMINISTRADOR
ADD CONSTRAINT UQ_ADMINISTRADOR_USUARIO
    UNIQUE (USUARIO)
ENABLE;

CREATE TABLE ADMINISTRADORSUCURSAL
   (ADMINISTRADOR NUMBER, 
    SUCURSAL NUMBER NOT NULL, 
	CONSTRAINT ADMINISTRADORSUCURSAL_PK PRIMARY KEY (ADMINISTRADOR));
ALTER TABLE ADMINISTRADORSUCURSAL
ADD CONSTRAINT fk_ADMINISTRADORSUCURSAL_A
    FOREIGN KEY (ADMINISTRADOR)
    REFERENCES ADMINISTRADOR(id)
ENABLE;
ALTER TABLE ADMINISTRADORSUCURSAL
ADD CONSTRAINT fk_ADMINISTRADORSUCURSAL_S
    FOREIGN KEY (SUCURSAL)
    REFERENCES SUCURSAL(id)
ENABLE;
ALTER TABLE ADMINISTRADORSUCURSAL
ADD CONSTRAINT UQ_ADMINISTRADORSUCURSAL_S
   UNIQUE(SUCURSAL)
ENABLE;

CREATE TABLE BODEGA
   (ID NUMBER, 
	CANTIDADPRODUCTOS NUMBER NOT NULL, 
	CAPACIDADTOTAL NUMBER NOT NULL, 
	TIPOPRODUCTO VARCHAR2(255 BYTE) NOT NULL, 
    PESO NUMBER NOT NULL, 
	VOLUMEN NUMBER NOT NULL, 
	NIVELREORDEN NUMBER, 
	SUCURSAL NUMBER NOT NULL, 

	CONSTRAINT BODEGA_PK PRIMARY KEY (ID));

ALTER TABLE BODEGA
	ADD CONSTRAINT CK_BODEGA_TIPOPRODUCTO 
        CHECK (TIPOPRODUCTO IN ('ASEO', 'ABARROTES', 'PRENDASDEVESTIR', 'MUEBLES', 'HERRAMIENTAS', 'ELECTRODOMESTICOS', 'CONGELADOS'))
ENABLE;

ALTER TABLE BODEGA
	ADD CONSTRAINT FK_BODEGA_SUCURSAL
        FOREIGN KEY (SUCURSAL)
        REFERENCES SUCURSAL(id)
ENABLE;



CREATE TABLE ESTANTE
   (ID NUMBER, 
	CANTIDADPRODUCTOS NUMBER NOT NULL, 
	CAPACIDADTOTAL NUMBER NOT NULL, 
	TIPOPRODUCTO VARCHAR2(255 BYTE) NOT NULL, 
    PESO NUMBER NOT NULL, 
	VOLUMEN NUMBER NOT NULL, 
	NIVELREORDEN NUMBER, 
    NIVELABASTECIMIENTO NUMBER NOT NULL, 
	SUCURSAL NUMBER NOT NULL, 

	CONSTRAINT ESTANTE_PK PRIMARY KEY (ID));

ALTER TABLE ESTANTE
	ADD CONSTRAINT CK_ESTANTE_TIPOPRODUCTO 
        CHECK (TIPOPRODUCTO IN ('ASEO', 'ABARROTES', 'PRENDASDEVESTIR', 'MUEBLES', 'HERRAMIENTAS', 'ELECTRODOMESTICOS', 'CONGELADOS'))
ENABLE;

ALTER TABLE ESTANTE
	ADD CONSTRAINT FK_ESTANTE_SUCURSAL
        FOREIGN KEY (SUCURSAL)
        REFERENCES SUCURSAL(id)
ENABLE;



CREATE TABLE CATEGORIA
   (ID NUMBER, 
	NOMBRE VARCHAR2(255 BYTE) NOT NULL, 
    TIPOALMACENAMIENTO VARCHAR2(255 BYTE) NOT NULL, 
	TIPOMANEJO VARCHAR2(255 BYTE), 
	
	CONSTRAINT CATEGORIA_PK PRIMARY KEY (ID));

ALTER TABLE CATEGORIA
	ADD CONSTRAINT CK_CATEGORIA_NOMBRE 
        CHECK (NOMBRE IN ('PERECEDERO', 'NOPERECEDERO'))
ENABLE;



CREATE TABLE PERECEDERO
(
  ID NUMBER,
  CATEGORIA NUMBER NOT NULL,
  FECHAVENCIMIENTO VARCHAR2(255 BYTE) NOT NULL,
  TIPOCATEGORIAP VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT PERECEDERO_PK PRIMARY KEY (ID));

ALTER TABLE PERECEDERO
ADD CONSTRAINT FK_PERECEDERO_CATEGORIA
    FOREIGN KEY (CATEGORIA)
    REFERENCES CATEGORIA(id)
ENABLE;
    


CREATE TABLE NOPERECEDERO
(
  ID NUMBER,
  CATEGORIA NUMBER NOT NULL,
  TIPOCATEGORIANP VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT NOPERECEDERO_PK PRIMARY KEY (ID));

ALTER TABLE NOPERECEDERO
ADD CONSTRAINT FK_NOPERECEDERO_CATEGORIA
    FOREIGN KEY (CATEGORIA)
    REFERENCES CATEGORIA(id)
ENABLE;
    


CREATE TABLE PRODUCTO 
(
  ID NUMBER,
  NOMBRE NUMBER NOT NULL,
  CANTIDAD NUMBER NOT NULL, 
  CODIGOBARRAS VARCHAR2(255 BYTE) NOT NULL,
  ESPECIFICACIONESEMPAQUETADO VARCHAR2(255 BYTE),
  ESTADO VARCHAR2(255 BYTE) NOT NULL,
  MARCA VARCHAR2(255 BYTE) NOT NULL,
  PRECIOPORUNIDADMEDIDA NUMBER NOT NULL,
  PRECIOUNITARIO NUMBER NOT NULL,
  PRESENTACION VARCHAR2(255 BYTE),
  UNIDADMEDIDA NUMBER NOT NULL,
  CATEGORIA NUMBER NOT NULL,
  CONSTRAINT PRODUCTO_PK PRIMARY KEY (ID));

ALTER TABLE PRODUCTO
ADD CONSTRAINT FK_PRODUCTO_CATEGORIA
    FOREIGN KEY (CATEGORIA)
    REFERENCES CATEGORIA(id)
ENABLE;
    


CREATE TABLE PRODUCTOESTANTE
(
  ESTANTE NUMBER,
  PRODUCTO NUMBER,
  CONSTRAINT PRODUCTOESTANTE_PK PRIMARY KEY (ESTANTE, PRODUCTO));

ALTER TABLE PRODUCTOESTANTE
ADD CONSTRAINT FK_PRODUCTOESTANTE_ESTANTE
    FOREIGN KEY (ESTANTE)
    REFERENCES ESTANTE(id)
ENABLE;
    
ALTER TABLE PRODUCTOESTANTE
ADD CONSTRAINT FK_PRODUCTOESTANTE_PRODUCTO
    FOREIGN KEY (PRODUCTO)
    REFERENCES PRODUCTO(id)
ENABLE;


CREATE TABLE PRODUCTOBODEGA
(
  BODEGA NUMBER,
  PRODUCTO NUMBER,
  CONSTRAINT PRODUCTOBODEGA_PK PRIMARY KEY (BODEGA, PRODUCTO));

ALTER TABLE PRODUCTOBODEGA
ADD CONSTRAINT FK_PRODUCTOBODEGA_BODEGA
    FOREIGN KEY (BODEGA)
    REFERENCES BODEGA(id)
ENABLE;
    
ALTER TABLE PRODUCTOBODEGA
ADD CONSTRAINT FK_PRODUCTOBODEGA_PRODUCTO
    FOREIGN KEY (PRODUCTO)
    REFERENCES PRODUCTO(id)
ENABLE;


CREATE TABLE CONSUMIDOR
(
  ID NUMBER,
  NOMBRE VARCHAR2(255 BYTE) NOT NULL,
  CORREOELECTRONICO VARCHAR2(255 BYTE) NOT NULL,
  TIPOCONSUMIDOR VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT CONSUMIDOR_PK PRIMARY KEY (ID));

ALTER TABLE CONSUMIDOR
    ADD CONSTRAINT CK_CONSUMIDOR_TIPOCONSUMIDOR
    CHECK (TIPOCONSUMIDOR IN ('PNATURAL', 'EMPRESA'))
ENABLE;





CREATE TABLE PERSONANATURAL
(
  IDCONSUMIDOR NUMBER,
  DOCUMENTOIDENTIDAD NUMBER,
  CONSTRAINT PERSONANATURAL_PK PRIMARY KEY (IDCONSUMIDOR, DOCUMENTOIDENTIDAD));

ALTER TABLE PERSONANATURAL
ADD CONSTRAINT FK_PERSONANATURAL_IDC
    FOREIGN KEY (IDCONSUMIDOR)
    REFERENCES CONSUMIDOR(id)
ENABLE;
    


CREATE TABLE EMPRESA
(
  IDCONSUMIDOR NUMBER,
  NIT NUMBER,
  DIRECCION VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT EMPRESA_PK PRIMARY KEY (IDCONSUMIDOR, NIT));

ALTER TABLE EMPRESA
ADD CONSTRAINT FK_EMPRESA_IDCONSUMIDOR
    FOREIGN KEY (IDCONSUMIDOR)
    REFERENCES CONSUMIDOR(id)
ENABLE;
    




CREATE TABLE FIDELIZACION
(
  IDCONSUMIDOR NUMBER,
  CANTIDADPUNTOS NUMBER NOT NULL,
  CONSTRAINT FIDELIZACION_PK PRIMARY KEY (IDCONSUMIDOR));

ALTER TABLE FIDELIZACION
ADD CONSTRAINT FK_FIDELIZACION_IDCONSUMIDOR
    FOREIGN KEY (IDCONSUMIDOR)
    REFERENCES CONSUMIDOR(id)
ENABLE;







CREATE TABLE VENTA
(
  ID NUMBER,
  FECHA VARCHAR2(255 BYTE) NOT NULL,
  FORMAPAGO VARCHAR2(255 BYTE) NOT NULL,
  VALORTOTAL NUMBER NOT NULL,
  CONSUMIDOR NUMBER NOT NULL,
  CONSTRAINT VENTA_PK PRIMARY KEY (ID));

ALTER TABLE VENTA
ADD CONSTRAINT FK_VENTA_CONSUMIDOR
    FOREIGN KEY (CONSUMIDOR)
    REFERENCES CONSUMIDOR(id)
ENABLE;



CREATE TABLE FACTURA
(
  ID NUMBER,
  TEXTOFACTURA VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT FACTURA_PK PRIMARY KEY (ID));
ALTER TABLE FACTURA
ADD CONSTRAINT FK_VENTA_FACTURA
    FOREIGN KEY (id)
    REFERENCES venta(id)
ENABLE;









CREATE TABLE CARRITOCOMPRAS
(
  ID NUMBER,
  ESTADO VARCHAR2(255 BYTE) NOT NULL,
  CONSUMIDOR NUMBER NOT NULL,
  CONSTRAINT CARRITOCOMPRAS_PK PRIMARY KEY (ID));

ALTER TABLE CARRITOCOMPRAS
ADD CONSTRAINT FK_CARRITOCOMPRAS_CONSUMIDOR
    FOREIGN KEY (CONSUMIDOR)
    REFERENCES CONSUMIDOR(id)
ENABLE;





CREATE TABLE PRODUCTOVENTA
(
  VENTA NUMBER,
  PRODUCTO NUMBER,
  CANTIDADPRODUCTO NUMBER NOT NULL,
  UNIDADMEDIDA VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT PRODUCTOVENTA_PK PRIMARY KEY (VENTA,PRODUCTO));

ALTER TABLE PRODUCTOVENTA
ADD CONSTRAINT FK_PRODUCTOVENTA_VENTA
    FOREIGN KEY (VENTA)
    REFERENCES VENTA(id)
ENABLE;

ALTER TABLE PRODUCTOVENTA
ADD CONSTRAINT FK_PRODUCTOVENTA_PRODUCTO
    FOREIGN KEY (PRODUCTO)
    REFERENCES PRODUCTO(id)
ENABLE;



CREATE TABLE PRODUCTOCARRITOCOMPRAS
(
  CARRITOCOMPRAS NUMBER,
  PRODUCTO NUMBER,
  CANTIDADPRODUCTO NUMBER NOT NULL,
  UNIDADMEDIDA VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT PCARRITOCOMPRAS_PK PRIMARY KEY (CARRITOCOMPRAS,PRODUCTO));

ALTER TABLE PRODUCTOCARRITOCOMPRAS
ADD CONSTRAINT FK_PCCOMPRAS_CC
    FOREIGN KEY (CARRITOCOMPRAS)
    REFERENCES CARRITOCOMPRAS(id)
ENABLE;

ALTER TABLE PRODUCTOCARRITOCOMPRAS
ADD CONSTRAINT FK_PCARRITOCOMPRAS_PRODUCTO
    FOREIGN KEY (PRODUCTO)
    REFERENCES PRODUCTO(id)
ENABLE;




CREATE TABLE PROMOCION
(
  ID NUMBER,
  NOMBRE VARCHAR2(255 BYTE) NOT NULL,
  DESCRIPCION VARCHAR2(255 BYTE) NOT NULL,
  TIPO VARCHAR2(255 BYTE) NOT NULL,
  FECHAINICIO DATE NOT NULL,
  FECHAFINALIZACION DATE NOT NULL,
  ESTADO VARCHAR2(255 BYTE) NOT NULL,
  CONSTRAINT PROMOCION_PK PRIMARY KEY (ID));

ALTER TABLE PROMOCION
    ADD CONSTRAINT CK_PROMOCION_TIPO
    CHECK (TIPO IN ('PROMODESCUENTO', 'PROMOUNIDAD','PROMOCANTIDAD', 'PROMOPARTEDESCUENTO' ))
ENABLE;
ALTER TABLE PROMOCION
    ADD CONSTRAINT CK_PROMOCION_ES
    CHECK (ESTADO IN ('VIGENTE', 'FINALIZADO'))
ENABLE;


CREATE TABLE PROMOCIONDESCUENTO
(
  IDPROMOCION NUMBER,
  DESCUENTO NUMBER NOT NULL,
  CONSTRAINT PROMOCIONDESCUENTO_PK PRIMARY KEY (IDPROMOCION));

ALTER TABLE PROMOCIONDESCUENTO
	ADD CONSTRAINT FK_PROMOCIONDESCUENTO_PRO
        FOREIGN KEY (IDPROMOCION)
        REFERENCES PROMOCION(id)
ENABLE;


CREATE TABLE PROMOCIONPARTEDESCUENTO
(
  IDPROMOCION NUMBER,
  UVENDIDAS NUMBER NOT NULL,
  DESCUENTO NUMBER NOT NULL,
  CONSTRAINT PPDESCUENTO_PK PRIMARY KEY (IDPROMOCION));

ALTER TABLE PROMOCIONPARTEDESCUENTO
	ADD CONSTRAINT FK_PPDESCUENTO_PRO
        FOREIGN KEY (IDPROMOCION)
        REFERENCES PROMOCION(id)
ENABLE;


CREATE TABLE PROMOCIONUNIDAD
(
  IDPROMOCION NUMBER,
  UVENDIDAS NUMBER,
  UPAGADAS NUMBER NOT NULL,
  CONSTRAINT PROMOCIONUNIDAD_PK PRIMARY KEY (IDPROMOCION));

ALTER TABLE PROMOCIONUNIDAD
	ADD CONSTRAINT FK_PROMOCIONUNIDAD_PRO
        FOREIGN KEY (IDPROMOCION)
        REFERENCES PROMOCION(id)
ENABLE;


CREATE TABLE PROMOCIONCANTIDAD
(
  IDPROMOCION NUMBER,
  CVENDIDAS NUMBER,
  CPAGADAS NUMBER NOT NULL,
  CONSTRAINT PROMOCIONCANTIDAD_PK PRIMARY KEY (IDPROMOCION));

ALTER TABLE PROMOCIONCANTIDAD
	ADD CONSTRAINT FK_PROMOCIONCANTIDAD_PRO
        FOREIGN KEY (IDPROMOCION)
        REFERENCES PROMOCION(id)
ENABLE;



CREATE TABLE PROMOCIONPRODUCTO
   (PROMOCION NUMBER, 
	PRODUCTO NUMBER, 

	CONSTRAINT PROMOCIONPRODUCTO_PK PRIMARY KEY (PROMOCION));


ALTER TABLE PROMOCIONPRODUCTO
	ADD CONSTRAINT FK_PROMOCIONPRODUCTO_PRODUCTO
        FOREIGN KEY (PRODUCTO)
        REFERENCES PRODUCTO(id)
ENABLE;

ALTER TABLE PROMOCIONPRODUCTO
	ADD CONSTRAINT FK_PROMOCIONPRODUCTO_PRO
        FOREIGN KEY (PROMOCION)
        REFERENCES PROMOCION(id)
ENABLE;


CREATE TABLE PROVEEDORES
   (NIT NUMBER, 
	NOMBRE VARCHAR2(255 BYTE) NOT NULL, 

	CONSTRAINT PROVEEDORES_PK PRIMARY KEY (NIT));





CREATE TABLE PRODUCTOOFRECIDO
   (ID NUMBER, 
	PRECIOPROVEEDOR NUMBER NOT NULL,
    CALIFICACIONTOTAL NUMBER,
    CALIDAD VARCHAR2(255 BYTE) NOT NULL,
    CUMPLIMIENTO VARCHAR2(255 BYTE) NOT NULL,
    PRODUCTOID NUMBER NOT NULL,
    PROVEEDOR NUMBER NOT NULL,
	CONSTRAINT POFRECIDO_PK PRIMARY KEY (ID));


ALTER TABLE PRODUCTOOFRECIDO
	ADD CONSTRAINT FK_POFRECIDO_PRODUCTOID
        FOREIGN KEY (PRODUCTOID)
        REFERENCES PRODUCTO(id)
ENABLE;

ALTER TABLE PRODUCTOOFRECIDO
	ADD CONSTRAINT FK_POFRECIDO_PROVEE
        FOREIGN KEY (PROVEEDOR)
        REFERENCES PROVEEDORES(nit)
ENABLE;


CREATE TABLE ORDENPEDIDO
   (ID NUMBER, 
    ESTADO VARCHAR2(255 BYTE) NOT NULL,
    CALIFICACION NUMBER NOT NULL,
    FECHA VARCHAR2(255 BYTE) NOT NULL,
    FECHAENTREGA VARCHAR2(255 BYTE) NOT NULL,
    PROVEEDOR NUMBER NOT NULL,
    PRODUCTOOFRECIDO NUMBER NOT NULL,
    CANTIDADPRODUCTO NUMBER NOT NULL,
    UNIDADMEDIDA VARCHAR2(255 BYTE) NOT NULL,
    SUCURSAL NUMBER NOT NULL,
    CONSTRAINT ORDENPEDIDO_PK PRIMARY KEY (ID));


ALTER TABLE ORDENPEDIDO
	ADD CONSTRAINT FK_ORDENPEDIDO_PROVEEDOR
        FOREIGN KEY (PROVEEDOR)
        REFERENCES PROVEEDORES(nit)
ENABLE;
ALTER TABLE ORDENPEDIDO
	ADD CONSTRAINT FK_ORDENPEDIDO_SUCURSAL
        FOREIGN KEY (SUCURSAL)
        REFERENCES SUCURSAL(id)
ENABLE;
ALTER TABLE ORDENPEDIDO
	ADD CONSTRAINT FK_ORDENPEDIDO_POFRECIDO
        FOREIGN KEY (PRODUCTOOFRECIDO)
        REFERENCES PRODUCTOOFRECIDO(id)
ENABLE;

COMMIT;
