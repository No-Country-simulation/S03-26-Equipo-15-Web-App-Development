
-- ROLES
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE,
    descripcion TEXT
);


-- USUARIOS
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    password_hash VARCHAR(255),
    avatar_url VARCHAR(500),
    id_rol INT,
    activo TINYINT,
    fecha_creacion DATETIME,
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);


-- ESTADOS FUNNEL
CREATE TABLE estados_funnel (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE,
    descripcion TEXT,
    orden INT,
    activo TINYINT
);


-- CONTACTOS
CREATE TABLE contactos (
    id_contacto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(255),
    telefono VARCHAR(50),
    empresa VARCHAR(200),
    observaciones TEXT,
    estado ENUM('activo', 'inactivo', 'archivado'),
    id_estado_funnel INT,
    id_usuario_responsable INT NULL,
    fecha_creacion DATETIME,
    FOREIGN KEY (id_estado_funnel) REFERENCES estados_funnel(id_estado),
    FOREIGN KEY (id_usuario_responsable)
        REFERENCES usuarios(id_usuario)
        ON DELETE SET NULL
);


-- ETIQUETAS
CREATE TABLE etiquetas (
    id_etiqueta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE,
    color VARCHAR(7)
);


-- CONTACTO - ETIQUETAS
CREATE TABLE contacto_etiquetas (
    id_contacto INT,
    id_etiqueta INT,
    PRIMARY KEY (id_contacto, id_etiqueta),
    FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto) ON DELETE CASCADE,
    FOREIGN KEY (id_etiqueta) REFERENCES etiquetas(id_etiqueta) ON DELETE CASCADE
);


-- CANALES
CREATE TABLE canales (
    id_canal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE
);


-- CONVERSACIONES
CREATE TABLE conversaciones (
    id_conversacion INT AUTO_INCREMENT PRIMARY KEY,
    id_contacto INT,
    id_canal INT,
    estado ENUM('abierta', 'cerrada'),
    fecha_inicio DATETIME,
    fecha_ultimo_mensaje DATETIME,
    FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto) ON DELETE CASCADE,
    FOREIGN KEY (id_canal) REFERENCES canales(id_canal)
);


-- MENSAJES
CREATE TABLE mensajes (
    id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    id_conversacion INT,
    remitente_tipo ENUM('agente', 'cliente', 'sistema'),
    id_usuario INT NULL,
    contenido TEXT,
    tipo_contenido VARCHAR(50),
    fecha_hora_envio DATETIME,
    estado ENUM('enviado', 'entregado', 'leido', 'fallido'),
    externo_id VARCHAR(255),
    FOREIGN KEY (id_conversacion) REFERENCES conversaciones(id_conversacion) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE SET NULL
);

-- TAREAS
CREATE TABLE tareas (
    id_tarea INT AUTO_INCREMENT PRIMARY KEY,
    id_contacto INT,
    id_usuario_asignado INT NULL,
    titulo VARCHAR(255),
    descripcion TEXT,
    fecha_vencimiento DATETIME,
    estado ENUM('pendiente', 'en_progreso', 'completada', 'cancelada'),
    prioridad ENUM('baja', 'media', 'alta'),
    fecha_creacion DATETIME,
    FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario_asignado)
        REFERENCES usuarios(id_usuario)
        ON DELETE SET NULL
);

-- SOLICITUDES ADMIN
CREATE TABLE solicitudes_admin (
    id_solicitud INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_solicitante INT,
    id_usuario_admin INT NULL,
    id_contacto INT,
    asunto VARCHAR(255),
    mensaje TEXT,
    estado ENUM('pendiente', 'aprobado', 'rechazado'),
    respuesta_admin TEXT,
    fecha_creacion DATETIME,
    fecha_resolucion DATETIME,
    FOREIGN KEY (id_usuario_solicitante) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_usuario_admin)
        REFERENCES usuarios(id_usuario)
        ON DELETE SET NULL,
    FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto) ON DELETE CASCADE
);

-- HISTORIAL ASIGNACIONES
CREATE TABLE historial_asignaciones_contacto (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_contacto INT,
    id_usuario_anterior INT NULL,
    id_usuario_nuevo INT NULL,
    id_usuario_admin INT NULL,
    motivo VARCHAR(100),
    fecha_cambio DATETIME,
    FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario_anterior)
        REFERENCES usuarios(id_usuario)
        ON DELETE SET NULL,
    FOREIGN KEY (id_usuario_nuevo)
        REFERENCES usuarios(id_usuario)
        ON DELETE SET NULL,
    FOREIGN KEY (id_usuario_admin)
        REFERENCES usuarios(id_usuario)
        ON DELETE SET NULL
);

-- IMPORTACIONES CONTACTOS
CREATE TABLE importaciones_contactos (
    id_importacion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_admin INT,
    nombre_archivo VARCHAR(255),
    cantidad_registros INT,
    cantidad_exitosos INT,
    cantidad_fallidos INT,
    fecha_importacion DATETIME,
    FOREIGN KEY (id_usuario_admin) REFERENCES usuarios(id_usuario)
);


-- PLANTILLAS EMAIL
CREATE TABLE plantillas_email (
    id_plantilla INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    asunto VARCHAR(255),
    contenido TEXT,
    fecha_creacion DATETIME
);