INSERT INTO SEGURO_G29827867.PAIS (nb_pais)
VALUES
    ('Argentina'),
    ('Colombia'),
    ('Venezuela');

INSERT INTO SEGURO_G29827867.CIUDAD (nb_ciudad,cod_pais)
VALUES
    ('Buenos Aires',(SELECT cod_pais FROM SEGURO_G29827867.PAIS WHERE nb_pais = 'Argentina')),
    ('Mar del Plata',(SELECT cod_pais FROM SEGURO_G29827867.PAIS WHERE nb_pais = 'Argentina')),
    ('Bogota',(SELECT cod_pais FROM SEGURO_G29827867.PAIS WHERE nb_pais = 'Colombia')),
    ('Caracas',(SELECT cod_pais FROM SEGURO_G29827867.PAIS WHERE nb_pais = 'Venezuela')),
    ('Lechería',(SELECT cod_pais FROM SEGURO_G29827867.PAIS WHERE nb_pais = 'Venezuela')),
    ('Maracay',(SELECT cod_pais FROM SEGURO_G29827867.PAIS WHERE nb_pais = 'Venezuela'));

INSERT INTO SEGURO_G29827867.SUCURSAL (nb_sucursal,cod_ciudad)
VALUES
    ('Calle Gorostiaga',(SELECT cod_ciudad FROM SEGURO_G29827867.CIUDAD WHERE nb_ciudad = 'Buenos Aires')),
    ('Avenida Caseros',(SELECT cod_ciudad FROM SEGURO_G29827867.CIUDAD WHERE nb_ciudad = 'Buenos Aires')),
    ('Villa La Angostura',(SELECT cod_ciudad FROM SEGURO_G29827867.CIUDAD WHERE nb_ciudad = 'Mar del Plata')),
    ('Avenida Boyacá',(SELECT cod_ciudad FROM SEGURO_G29827867.CIUDAD WHERE nb_ciudad = 'Bogota')),
    ('Altamira',(SELECT cod_ciudad FROM SEGURO_G29827867.CIUDAD WHERE nb_ciudad = 'Caracas')),
    ('Hatillo',(SELECT cod_ciudad FROM SEGURO_G29827867.CIUDAD WHERE nb_ciudad = 'Caracas')),
    ('Santa Mónica',(SELECT cod_ciudad FROM SEGURO_G29827867.CIUDAD WHERE nb_ciudad = 'Caracas')),
    ('Avenida Andrés Bello',(SELECT cod_ciudad FROM SEGURO_G29827867.CIUDAD WHERE nb_ciudad = 'Lechería')),
    ('Calle Paez',(SELECT cod_ciudad FROM SEGURO_G29827867.CIUDAD WHERE nb_ciudad = 'Maracay'));

INSERT INTO SEGURO_G29827867.TIPO_PRODUCTO (nb_tipo_producto)
VALUES
    ('Prestación de Servicios'),
    ('Personales'),
    ('Patrimoniales'),
    ('Daños');

INSERT INTO SEGURO_G29827867.PRODUCTO (nb_producto,descripcion,cod_tipo_producto,calificacion)
VALUES
    ('Automóvil','Aseguramiento de vehículo',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Patrimoniales'),4),
    ('Crédito y Caución','Cubre los riesgos de impago de las empresas',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Patrimoniales'),4),
    ('Incendios','Ofrece indemnización por los daños materiales causados a los bienes asegurados',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Daños'),3),
    ('Salud','Cubre necesidades de salud',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Personales'),4),
    ('Vida','Ahorros, rentas vitalicias y fallecimiento',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Personales'),4),
    ('Accidentes Personales','Cubre gastos de operaciones de fractura, paralización parcial o total',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Personales'),4),
    ('Agricultura','Aseguramiento cosechas, ganado y maquinaria',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Patrimoniales'),3),
    ('Terreno','Aseguramiento de fincas, solares, lotes baldíos',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Patrimoniales'),2),
    ('Asitencia de viajes','Cubre asistencia médica y pérdida de equipaje',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Prestación de Servicios'),3),
    ('Asitencia jurídica','Cubre asesoría legal, representación legal y fianzas',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Prestación de Servicios'),3),
    ('Asitencia escolar','Brinda ayuda a estudiantes en caso de accidente, enfermedad o problemas académicos.',(SELECT cod_tipo_producto FROM SEGURO_G29827867.TIPO_PRODUCTO WHERE nb_tipo_producto = 'Prestación de Servicios'),2);

INSERT INTO SEGURO_G29827867.CLIENTE (nb_cliente,ci_rif,telefono,direccion,sexo,email,cod_sucursal)
VALUES
    ('Lionel Messi','1523648793','1486593247','Rosario','M','mesi@mesi.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Calle Gorostiaga')),
    ('Paulo Dybala','789632145','7854632145','Rosario','M','dybala@mesi.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Calle Gorostiaga')),
    ('Alejandro Gómez','1002345687','897412300','Belgrano','M','papu@mesi.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Avenida Caseros')),
    ('Emiliano Martínez','787463215','8894563211','Belgrano','M','dibu@mesi.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Avenida Caseros')),
    ('Sergio Romero','1234567890','1023654788','Bostero','M','romero@mesi.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Villa La Angostura')),
    ('Pablo Zabalera','987456321','789654123','Bostero','M','zaba@mesi.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Villa La Angostura')),
    ('Karely Ruiz','5879566','7452369875','Av. Bolívar','F','kary@gmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Avenida Boyacá')),
    ('Oriana Roldán','4658973','4432611987','Av. Bolívar','F','oriana@gmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Avenida Boyacá')),
    ('José Pérez','30567893','4120221152','Altamira','M','josep@hotmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Altamira')),
    ('María Delgado','5684123','4128766432','Altamira','F','marythin@hotmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Altamira')),
    ('Samuel Calonzo','29696969','4243145600','Mercedes','M','sammmm@gmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Hatillo')),
    ('Daniela Martínez','28777333','4241359783','Chacao','F','daniela@gmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Hatillo')),
    ('Gabriela Reyes','32477689','4242368975','Chacao','F','gabyyy@gmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Santa Mónica')),
    ('Indigo Flores','7846999','4247896543','Chacao','F','indigo@gmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Santa Mónica')),
    ('Samuel Subato','30878989','4260297746','Calle Serrano','M','samsubway@gmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Avenida Andrés Bello')),
    ('Mery Maguiles','7456321','4245877713','Calle Serrano','F','mery@gmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Avenida Andrés Bello')),
    ('David Cuahonte','15877763','4247412345','Guanana','M','teriotge@gmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Calle Paez')),
    ('Marisol Gutiérrez','10978432','4244412343','San Mateo','F','marisol@gmail.com',(SELECT cod_sucursal FROM SEGURO_G29827867.SUCURSAL WHERE nb_sucursal = 'Calle Paez'));

INSERT INTO SEGURO_G29827867.EVALUACION_SERVICIO (nb_descripcion)
VALUES
    ('Malo'),
    ('Regular'),
    ('Bueno'),
    ('Muy bueno'),
    ('Excelente');

INSERT INTO SEGURO_G29827867.SINIESTRO (descrip_siniestro)
VALUES
    ('Siniestro 1'),
    ('Siniestro 2'),
    ('Siniestro 3'),
    ('Siniestro 4'),
    ('Siniestro 5'),
    ('Siniestro 6'),
    ('Siniestro 7'),
    ('Siniestro 8'),
    ('Siniestro 9'),
    ('Siniestro 10');

INSERT INTO SEGURO_G29827867.CONTRATO (descrip_contrato)
VALUES
    ('Contrato 1'),
    ('Contrato 2'),
    ('Contrato 3'),
    ('Contrato 4'),
    ('Contrato 5'),
    ('Contrato 6'),
    ('Contrato 7'),
    ('Contrato 8'),
    ('Contrato 9'),
    ('Contrato 10');

INSERT INTO SEGURO_G29827867.REGISTRO_CONTRATO (cod_cliente, nro_contrato, cod_producto, fecha_inicio, fecha_fin, estado_contrato, monto)
VALUES
    ((SELECT cod_cliente FROM SEGURO_G29827867.CLIENTE WHERE nb_cliente = 'Lionel Messi'),
    1,(SELECT cod_producto FROM SEGURO_G29827867.PRODUCTO WHERE nb_producto = 'Salud'),
    '2020-01-01','2020-12-31','ACTIVO',300000
    ),
    ((SELECT cod_cliente FROM SEGURO_G29827867.CLIENTE WHERE nb_cliente = 'Paulo Dybala'),
    2,(SELECT cod_producto FROM SEGURO_G29827867.PRODUCTO WHERE nb_producto = 'Vida'),
    '2020-01-01','2020-12-31','VENCIDO',200000
    ),
    ((SELECT cod_cliente FROM SEGURO_G29827867.CLIENTE WHERE nb_cliente = 'Alejandro Gómez'),
    3,(SELECT cod_producto FROM SEGURO_G29827867.PRODUCTO WHERE nb_producto = 'Automóvil'),
    '2020-01-01','2020-12-31','SUSPENDIDO',250000
    );