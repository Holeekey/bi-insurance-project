CREATE SCHEMA SEGURO_DW_G29829867;
CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.DIM_TIEMPO (
    sk_tiempo INTEGER PRIMARY KEY,
    fecha DATE NOT NULL,
    ano INTEGER NOT NULL,
    mes INTEGER NOT NULL,
    dia INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.DIM_SUCURSAL (
    sk_sucursal INTEGER PRIMARY KEY,
    cod_sucursal INTEGER NOT NULL,
    nb_sucursal VARCHAR(20) NOT NULL,
    cod_ciudad INTEGER NOT NULL,
    nb_ciudad VARCHAR(20) NOT NULL,
    cod_pais INTEGER NOT NULL,
    nb_pais VARCHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.DIM_CLIENTE (
    sk_cliente INTEGER PRIMARY KEY,
    cod_cliente INTEGER NOT NULL,
    nb_cliente VARCHAR(20) NOT NULL,
    ci_rif VARCHAR(10) NOT NULL,
    telefono VARCHAR(11) NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    sexo VARCHAR(1) NOT NULL
);
CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.DIM_SINIESTRO (
    sk_siniestro INTEGER PRIMARY KEY,
    nro_siniestro INTEGER NOT NULL,
    descrip_siniestro VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.DIM_CONTRATO (
    sk_contrato INTEGER PRIMARY KEY,
    nro_contrato INTEGER NOT NULL,
    descrip_contrato VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.DIM_ESTADO_CONTRATO (
    sk_estado_contrato INTEGER PRIMARY KEY,
    nb_estado VARCHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.DIM_EVALUACION_SERVICIO (
    sk_evaluacion_servicio INTEGER PRIMARY KEY,
    cod_evaluacion_servicio INTEGER NOT NULL,
    nb_descripcion VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.DIM_PRODUCTO (
    sk_producto INTEGER PRIMARY KEY,
    cod_producto INTEGER NOT NULL,
    nb_producto VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    cod_tipo_producto INTEGER NOT NULL,
    nb_tipo_producto VARCHAR(50) NOT NULL,
    calificacion INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.FACT_REGISTRO_CONTRATO (
    sk_dim_contrato INTEGER REFERENCES SEGURO_DW_G29829867.DIM_CONTRATO (sk_contrato),
    sk_dim_producto INTEGER REFERENCES SEGURO_DW_G29829867.DIM_PRODUCTO (sk_producto),
    sk_dim_cliente INTEGER REFERENCES SEGURO_DW_G29829867.DIM_CLIENTE (sk_cliente),
    sk_fecha_inicio INTEGER REFERENCES SEGURO_DW_G29829867.DIM_TIEMPO (sk_tiempo),
    sk_fecha_fin INTEGER REFERENCES SEGURO_DW_G29829867.DIM_TIEMPO (sk_tiempo),
    sk_estado_contrato INTEGER REFERENCES SEGURO_DW_G29829867.DIM_ESTADO_CONTRATO (sk_estado_contrato),
    cantidad INTEGER,
    monto DECIMAL(10,2) NOT NULL,
    cantidad_contrato INTEGER NOT NULL,
    cantidad_cliente INTEGER NOT NULL,
    cantidad_producto INTEGER NOT NULL,
    PRIMARY KEY (sk_dim_contrato,sk_dim_producto,sk_dim_cliente,sk_fecha_inicio,sk_fecha_fin,sk_estado_contrato)
);

CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.FACT_REGISTRO_SINIESTRO (
    sk_dim_producto INTEGER REFERENCES SEGURO_DW_G29829867.DIM_PRODUCTO (sk_producto),
    sk_dim_contrato INTEGER REFERENCES SEGURO_DW_G29829867.DIM_CONTRATO (sk_contrato),
    sk_dim_cliente INTEGER REFERENCES SEGURO_DW_G29829867.DIM_CLIENTE (sk_cliente),
    sk_fecha_siniestro INTEGER REFERENCES SEGURO_DW_G29829867.DIM_TIEMPO (sk_tiempo),
    sk_fecha_respuesta INTEGER REFERENCES SEGURO_DW_G29829867.DIM_TIEMPO (sk_tiempo),
    sk_dim_siniestro INTEGER REFERENCES SEGURO_DW_G29829867.DIM_SINIESTRO (sk_siniestro),
    sk_dim_sucursal INTEGER REFERENCES SEGURO_DW_G29829867.DIM_SUCURSAL (sk_sucursal),
    cantidad INTEGER,
    monto_reconocido DECIMAL(10,2) NOT NULL,
    monto_solicitado DECIMAL(10,2) NOT NULL,
    rechazado BOOLEAN NOT NULL,
    PRIMARY KEY (sk_dim_producto,sk_dim_contrato,sk_dim_cliente,sk_fecha_siniestro,sk_fecha_respuesta,sk_dim_siniestro)
);

CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.FACT_METAS (
    sk_dim_cliente INTEGER REFERENCES SEGURO_DW_G29829867.DIM_CLIENTE (sk_cliente),
    sk_dim_contrato INTEGER REFERENCES SEGURO_DW_G29829867.DIM_CONTRATO (sk_contrato),
    sk_fecha_inicio INTEGER REFERENCES SEGURO_DW_G29829867.DIM_TIEMPO (sk_tiempo),
    sk_fecha_fin INTEGER REFERENCES SEGURO_DW_G29829867.DIM_TIEMPO (sk_tiempo),
    sk_dim_producto INTEGER REFERENCES SEGURO_DW_G29829867.DIM_PRODUCTO (sk_producto),
    cantidad INTEGER,
    meta_ingresos DECIMAL(10,2) NOT NULL,
    meta_clientes_asegurados INTEGER NOT NULL,
    meta_clientes_renvados INTEGER NOT NULL,
    PRIMARY KEY (sk_dim_cliente,sk_dim_contrato,sk_fecha_inicio,sk_fecha_fin,sk_dim_producto)
);

CREATE TABLE IF NOT EXISTS SEGURO_DW_G29829867.FACT_EVALUACION_SERVICIO (
    sk_dim_cliente INTEGER REFERENCES SEGURO_DW_G29829867.DIM_CLIENTE (sk_cliente),
    sk_dim_producto INTEGER REFERENCES SEGURO_DW_G29829867.DIM_PRODUCTO (sk_producto),
    sk_dim_evaluacion_servicio INTEGER REFERENCES SEGURO_DW_G29829867.DIM_EVALUACION_SERVICIO(sk_evaluacion_servicio),
    cantidad INTEGER,
    recomienda_amigo BOOLEAN NOT NULL,
    PRIMARY KEY (sk_dim_cliente,sk_dim_producto,sk_dim_evaluacion_servicio)
);
