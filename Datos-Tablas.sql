TABLA USUARIO
INSERT INTO USUARIO (email, contraseña, rol) 
VALUES
('admin1@gmail.com', 'admin123', 'ADMIN'),
('admin2@gmail.com', 'admin456', 'ADMIN'),
('juan@gmail.com', 'juan123', 'EMPLEADO'),
('maria@gmail.com', 'maria123', 'EMPLEADO'),
('carlos@gmail.com', 'carlos123', 'EMPLEADO'),
('ana@gmail.com', 'ana123', 'EMPLEADO'),
('luis@gmail.com', 'luis123', 'EMPLEADO');


TABLA HORARIO
INSERT INTO HORARIO (entrada_matutina,salida_matutina,entrada_vespertina,salida_vespertina)
VALUES
('08:05:00','12:05:00','13:05:00','18:05:00');


TABLA CARGO
INSERT INTO CARGO (nombre_cargo, sueldo)
VALUES
('Gerente', 1200.50),
('Supervisor', 950.75),
('Contador', 850.00);
('Secretaria', 700.25),
('Cajero', 650.00);


TABLA  EMPLEADO
INSERT INTO EMPLEADO (nombre, cedula, telefono, id_usuario, id_horario, id_cargo)
VALUES
('Juan Perez','1101111111','0991111111',3,1,1),
('María Lopez','1102222222','0992222222',4,1,2),
('Carlos Ramirez','1103333333','0993333333',5,1,3),
('Ana Torres','1104444444','0994444444',6,1,4),
('Luis Mendoza','1105555555','0995555555',7,1,5);


TABLA ASISTENCIA
INSERT INTO ASISTENCIA (fecha,entrada_matutina,salida_matutina,entrada_vespertina,salida_vespertina,estado_asistencia,id_empleado)
VALUES
('2025-05-04','08:15:00','12:05:00','13:12:00','18:00:00','ATRASADO',6),
('2025-05-04','08:00:00','12:05:00','13:00:00','18:05:00','PRESENTE',7),
('2025-05-01','08:10:00','12:05:00','13:05:00','18:00:00','ATRASADO',8),
('2025-05-01','08:05:00','12:05:00','13:05:00','18:05:00','PRESENTE',9);
('2025-05-04',NULL,NULL,NULL,NULL,'FALTA',10);


TABLA HORASEXTRA
INSERT INTO HORASEXTRA (fecha,hora_inicio_extra,hora_fin_extra,id_asistencia)
VALUES
('2025-05-01','18:10:00','20:10:00',8),
('2025-05-01','18:05:00','19:05:00',9),
('2025-05-04','18:15:00','21:15:00',10);


TABLA DESCUENTO
INSERT INTO DESCUENTO (motivo,tipo,monto,fecha,id_asistencia)
VALUES
('Atraso matutino','HORAS',5.00,'2025-05-01',8),
('Falta completa','DIA',20.00,'2025-05-04',10);


TABLA JUSTIFICACION
INSERT INTO JUSTIFICACION (tipo_justificacion,motivo,horas_justificadas,fecha_registro,id_asistencia)
VALUES
('FALTA','Consulta medica',8,'2025-05-04',10),
('ATRASO','Problemas de transporte',2,'2025-05-04',8),
('ATRASO','Trafico vehicular',1,'2025-05-01',6);

