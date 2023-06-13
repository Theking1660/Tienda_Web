CREATE PROCEDURE Tienda.InsertComentario
    @Comentario_id INT,
    @Producto_id INT,
    @Perfil_id INT,
    @Estrella SMALLINT,
    @Comentario NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Comentario (Comentario_id, Producto_id, Perfil_id, Estrella, Comentario)
    VALUES (@Comentario_id, @Producto_id, @Perfil_id, @Estrella, @Comentario);
END


CREATE PROCEDURE Tienda.InsertComentarioProducto
    @Producto_id INT,
    @Comentario_id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Comentario_Producto (Producto_id, Comentario_id)
    VALUES (@Producto_id, @Comentario_id);
END

CREATE PROCEDURE Tienda.InsertCuenta
    @Cuenta_id INT,
    @Perfil_id INT,
    @MetodoP_id INT,
    @Direccion_id INT,
    @Cuenta CHAR(5),
    @Fecha_creacion DATETIME,
    @Fecha_actualizacion DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Cuenta (Cuenta_id, Perfil_id, MetodoP_id, Direccion_id, Cuenta, Fecha_creacion, Fecha_actualizacion)
    VALUES (@Cuenta_id, @Perfil_id, @MetodoP_id, @Direccion_id, @Cuenta, @Fecha_creacion, @Fecha_actualizacion);
END

CREATE PROCEDURE Tienda.InsertCupones
    @Producto_id INT,
    @Codigo CHAR(8),
    @Descuento DECIMAL(3, 2),
    @Activado BIT,
    @Fecha_inicio DATETIME,
    @Fecha_fin DATETIME,
    @Fecha_creacion DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Cupones (Producto_id, Codigo, Descuento, Activado, Fecha_inicio, Fecha_fin, Fecha_creacion)
    VALUES (@Producto_id, @Codigo, @Descuento, @Activado, @Fecha_inicio, @Fecha_fin, @Fecha_creacion);
END

CREATE PROCEDURE Tienda.InsertDireccion
    @Pais_id CHAR(2),
    @Cuidad_id CHAR(2),
    @Ubicacion NVARCHAR(200),
    @Codigo_Postal INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Direccion (Pais_id, Cuidad_id, Ubicacion, Codigo_Postal)
    VALUES (@Pais_id, @Cuidad_id, @Ubicacion, @Codigo_Postal);
END

CREATE PROCEDURE Tienda.InsertMetodoPago
    @MetodoP_id INT,
    @Metodo NVARCHAR(25)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Metodo_Pago (MetodoP_id, Metodo)
    VALUES (@MetodoP_id, @Metodo);
END


CREATE PROCEDURE Tienda.InsertPais
    @Pais_id CHAR(2),
    @Pais NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Pais (Pais_id, Pais)
    VALUES (@Pais_id, @Pais);
END

CREATE PROCEDURE Tienda.InsertPedido
    @Cuenta_id INT,
    @Producto_id INT,
    @MetodoP_id INT,
    @Direccion_id INT,
    @Pedido NVARCHAR(6),
    @Precio_total DECIMAL(10, 2),
    @Precio_envio DECIMAL(10, 2),
    @ITBIS DECIMAL(10, 2),
    @Descuento DECIMAL(10, 2) = NULL,
    @Fpedido_realizado DATETIME,
    @FPEDIDO_enviado DATETIME,
    @Reembolsado BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Pedido (Cuenta_id, Producto_id, MetodoP_id, Direccion_id, Pedido, Precio_total, Precio_envio, ITBIS, Descuento, Fpedido_realizado, FPEDIDO_enviado, Reembolsado)
    VALUES (@Cuenta_id, @Producto_id, @MetodoP_id, @Direccion_id, @Pedido, @Precio_total, @Precio_envio, @ITBIS, @Descuento, @Fpedido_realizado, @FPEDIDO_enviado, @Reembolsado);
END


CREATE PROCEDURE Tienda.InsertPerfil
    @Tipo_perfil_id INT,
    @Nombre NVARCHAR(50),
    @Apellidos NVARCHAR(50),
    @Numero INT,
    @Correo NVARCHAR(100),
    @Contraseña NVARCHAR(16),
    @Fecha_Nacimiento DATE,
    @ActivacionDP BIT = NULL,
    @Membresia BIT = NULL,
    @Fecha_creacion DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Perfil (Tipo_perfil_id, Nombre, Apellidos, Numero, Correo, Contraseña, Fecha_Nacimiento, ActivacionDP, Membresia, Fecha_creacion)
    VALUES (@Tipo_perfil_id, @Nombre, @Apellidos, @Numero, @Correo, @Contraseña, @Fecha_Nacimiento, @ActivacionDP, @Membresia, @Fecha_creacion);
END


CREATE PROCEDURE Tienda.InsertProducto
    @Categoria_id INT,
    @Producto NVARCHAR(100),
    @Precio DECIMAL(10, 2),
    @Descuento DECIMAL(10, 2) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Producto (Categoria_id, Producto, Precio, Descuento)
    VALUES (@Categoria_id, @Producto, @Precio, @Descuento);
END


CREATE PROCEDURE Tienda.InsertSubcategoria
    @Categoria_id INT,
    @Subcategoria NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Subcategoria (Categoria_id, Subcategoria)
    VALUES (@Categoria_id, @Subcategoria);
END


CREATE PROCEDURE Tienda.InsertTipoPerfil
    @Tipo_perfil NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Tipo_Perfil (Tipo_perfil)
    VALUES (@Tipo_perfil);
END


CREATE PROCEDURE Tienda.InsertVendedor
    @Vendedor_id INT,
    @Perfil_id INT,
    @Producto_id INT,
    @Precio DECIMAL(10, 2),
    @Informacion NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Vendedor (Vendedor_id, Perfil_id, Producto_id, Precio, Informacion)
    VALUES (@Vendedor_id, @Perfil_id, @Producto_id, @Precio, @Informacion);
END


CREATE PROCEDURE Tienda.InsertCategoria
    @Categoria NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Categoria (Categoria)
    VALUES (@Categoria);
END


CREATE PROCEDURE Tienda.InsertCiudad
    @Ciudad_id CHAR(2),
    @Pais_id CHAR(2),
    @Ciudad NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Tienda.Ciudad (Ciudad_id, Pais_id, Ciudad)
    VALUES (@Ciudad_id, @Pais_id, @Ciudad);
END
