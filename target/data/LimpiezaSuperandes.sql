--- Sentencias SQL para la creacion del esquema de parranderos
--- Las tablas tienen prefijo A_ para facilitar su acceso desde SQL Developer

-- USO
-- Copie el contenido deseado de este archivo en una pestana SQL de SQL Developer
-- Ejecutelo como un script - Utilice el boton correspondiente de la pestana utilizada
    
-- Eliminar todas las tablas de la base de datos
DROP TABLE "SUPERANDES" CASCADE CONSTRAINTS;
DROP TABLE "CIUDAD" CASCADE CONSTRAINTS;
DROP TABLE "SUCURSAL" CASCADE CONSTRAINTS;
DROP TABLE "BODEGA" CASCADE CONSTRAINTS;
DROP TABLE "ESTANTE" CASCADE CONSTRAINTS;
DROP TABLE "CATEGORIA" CASCADE CONSTRAINTS;
DROP TABLE "PERECEDERO" CASCADE CONSTRAINTS;
DROP TABLE "NOPERECEDERO" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCTO" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCTOESTANTE" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCTOBODEGA" CASCADE CONSTRAINTS;
DROP TABLE "PERSONANATURAL" CASCADE CONSTRAINTS;
DROP TABLE "EMPRESA" CASCADE CONSTRAINTS;
DROP TABLE "CONSUMIDOR" CASCADE CONSTRAINTS;
DROP TABLE "FIDELIZACION" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCTOTRANSACCION" CASCADE CONSTRAINTS;
DROP TABLE "VENTA" CASCADE CONSTRAINTS;
DROP TABLE "FACTURA" CASCADE CONSTRAINTS;
DROP TABLE "CARRITOCOMPRAS" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCTOVENTA" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCTOCARRITOCOMPRAS" CASCADE CONSTRAINTS;
DROP TABLE "PROMOCION" CASCADE CONSTRAINTS;
DROP TABLE "PROMOCIONSUCURSAL" CASCADE CONSTRAINTS;
DROP TABLE "PROVEEDORES" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCTOOFRECIDO" CASCADE CONSTRAINTS;
DROP TABLE "ORDENPEDIDO" CASCADE CONSTRAINTS;
COMMMIT;

-- Eliminar el contenido de todas las tablas de la base de datos
-- El orden es importante. 
delete from SUPERANDES;
delete from CIUDAD;
delete from SUCURSAL;
delete from BODEGA;
delete from ESTANTE;
delete from CATEGORIA;
delete from PERECEDERO;
delete from NOPERECEDERO;
delete from PRODUCTO;
delete from PRODUCTOESTANTE;
delete from PRODUCTOBODEGA;
delete from PERSONANATURAL;
delete from EMPRESA;
delete from CONSUMIDOR;
delete from FIDELIZACION;
delete from PRODUCTOTRANSACCION;
delete from VENTA;
delete from FACTURA;
delete from CARRITOCOMPRAS;
delete from PRODUCTOVENTA;
delete from PRODUCTOCARRITOCOMPRAS;
delete from PROMOCION;
delete from PROMOCIONSUCURSAL;
delete from PROVEEDORES;
delete from PRODUCTOOFRECIDO;
delete from ORDENPEDIDO;
commit;

