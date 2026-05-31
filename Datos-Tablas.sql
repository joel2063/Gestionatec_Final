INSERT INTO USUARIO (id_usuario, email, contrasena, rol) 
VALUES
('USR001', 'admin1@gmail.com',  'admin123',   'ADMIN'),
('USR002', 'admin2@gmail.com',  'admin456',   'ADMIN'),
('USR003', 'juan@gmail.com',    'juan123',    'EMPLEADO'),
('USR004', 'maria@gmail.com',   'maria123',   'EMPLEADO'),
('USR005', 'carlos@gmail.com',  'carlos123',  'EMPLEADO'),
('USR006', 'ana@gmail.com',     'ana123',     'EMPLEADO'),
('USR007', 'luis@gmail.com',    'luis123',    'EMPLEADO'),
('USR008', 'pedro@gmail.com',   'pedro123',   'EMPLEADO'),
('USR009', 'sofia@gmail.com',   'sofia123',   'EMPLEADO'),
('USR010', 'diego@gmail.com',   'diego123',   'EMPLEADO'),
('USR011', 'valeria@gmail.com', 'valeria123', 'EMPLEADO'),
('USR012', 'andres@gmail.com',  'andres123',  'EMPLEADO');
 
INSERT INTO HORARIO (id_horario, entrada_matutina, salida_matutina, entrada_vespertina, salida_vespertina)
VALUES
('HOR-001', '08:05:00', '12:05:00', '13:05:00', '18:05:00');

INSERT INTO CARGO (id_cargo, nombre_cargo, sueldo)
VALUES
('CAR001', 'Gerente',  1200.50),
('CAR002', 'Supervisor',  950.75),
('CAR003', 'Contador',   850.00),
('CAR004', 'Secretaria', 700.25),
('CAR005', 'Cajero', 650.00),
('CAR006', 'Recepcionista', 600.00),
('CAR007', 'Tecnico', 750.00),
('CAR008', 'Vendedor', 680.00),
('CAR009', 'Mensajero', 550.00),
('CAR010', 'Asistente', 620.00);

INSERT INTO EMPLEADO (id_empleado, nombre, cedula, telefono, id_usuario, id_horario, id_cargo)
VALUES
('EMP001', 'Juan Perez',      '1101111111', '0991111111', 'USR003', 'HOR-001', 'CAR001'),
('EMP002', 'Maria Lopez',     '1102222222', '0992222222', 'USR004', 'HOR-001', 'CAR002'),
('EMP003', 'Carlos Ramirez',  '1103333333', '0993333333', 'USR005', 'HOR-001', 'CAR003'),
('EMP004', 'Ana Torres',      '1104444444', '0994444444', 'USR006', 'HOR-001', 'CAR004'),
('EMP005', 'Luis Mendoza',    '1105555555', '0995555555', 'USR007', 'HOR-001', 'CAR005'),
('EMP006', 'Pedro Castillo',  '1106666666', '0996666666', 'USR008', 'HOR-001', 'CAR006'),
('EMP007', 'Sofia Herrera',   '1107777777', '0997777777', 'USR009', 'HOR-001', 'CAR007'),
('EMP008', 'Diego Morales',   '1108888888', '0998888888', 'USR010', 'HOR-001', 'CAR008'),
('EMP009', 'Valeria Suarez',  '1109999999', '0999999999', 'USR011', 'HOR-001', 'CAR009'),
('EMP010', 'Andres Villacis', '1100000000', '0990000000', 'USR012', 'HOR-001', 'CAR010');

INSERT INTO ASISTENCIA (id_asistencia, fecha, entrada_matutina, salida_matutina, entrada_vespertina, salida_vespertina, estado_asistencia, id_empleado)
VALUES
('ASI001', '2025-05-04', '08:15:00', '12:05:00', '13:12:00', '18:00:00', 'ATRASADO', 'EMP001'),
('ASI002', '2025-05-04', '08:00:00', '12:05:00', '13:00:00', '18:05:00', 'PRESENTE', 'EMP002'),
('ASI003', '2025-05-01', '08:10:00', '12:05:00', '13:05:00', '18:00:00', 'ATRASADO', 'EMP003'),
('ASI004', '2025-05-01', '08:05:00', '12:05:00', '13:05:00', '18:05:00', 'PRESENTE', 'EMP004'),
('ASI005', '2025-05-04',  NULL,       NULL,        NULL,        NULL,      'FALTA',   'EMP005'),
('ASI006', '2025-05-05', '07:10:00', '11:00:00', '12:00:00', '16:00:00', 'ATRASADO', 'EMP006'),
('ASI007', '2025-05-05', '09:00:00', '13:00:00', '14:00:00', '18:00:00', 'PRESENTE', 'EMP007'),
('ASI008', '2025-05-06', '06:30:00', '10:30:00', '11:30:00', '15:30:00', 'PRESENTE', 'EMP008'),
('ASI009', '2025-05-06', '08:20:00', '12:00:00', '13:00:00', '17:00:00', 'ATRASADO', 'EMP009'),
('ASI010', '2025-05-07',  NULL,       NULL,        NULL,        NULL,      'FALTA',   'EMP010');

INSERT INTO HORASEXTRA (id_horaextra, fecha, hora_inicio_extra, hora_fin_extra, id_asistencia)
VALUES
('HEX001', '2025-05-01', '18:10:00', '20:10:00', 'ASI003'),
('HEX002', '2025-05-01', '18:05:00', '19:05:00', 'ASI004'),
('HEX003', '2025-05-04', '18:15:00', '21:15:00', 'ASI005'),
('HEX004', '2025-05-05', '16:05:00', '18:05:00', 'ASI006'),
('HEX005', '2025-05-05', '18:00:00', '20:00:00', 'ASI007'),
('HEX006', '2025-05-06', '15:30:00', '17:30:00', 'ASI008'),
('HEX007', '2025-05-06', '17:00:00', '19:00:00', 'ASI009'),
('HEX008', '2025-05-07', '18:00:00', '21:00:00', 'ASI010');
 
INSERT INTO DESCUENTO (id_descuento, motivo, tipo, monto, fecha, id_asistencia)
VALUES
('DES001', 'Atraso matutino',   'HORAS',  5.00, '2025-05-01', 'ASI003'),
('DES002', 'Falta completa',    'DIA',   20.00, '2025-05-04', 'ASI005'),
('DES003', 'Atraso matutino',   'HORAS',  4.50, '2025-05-05', 'ASI006'),
('DES004', 'Atraso vespertino', 'HORAS',  2.50, '2025-05-05', 'ASI007'),
('DES005', 'Atraso matutino',   'HORAS',  5.00, '2025-05-06', 'ASI008'),
('DES006', 'Atraso matutino',   'HORAS',  3.00, '2025-05-06', 'ASI009'),
('DES007', 'Falta completa',    'DIA',   20.00, '2025-05-07', 'ASI010');
 
INSERT INTO JUSTIFICACION (id_justificacion, tipo_justificacion, motivo, horas_justificadas, fecha_registro, id_asistencia)
VALUES
('JUS001', 'FALTA',  'Consulta medica', 8, '2025-05-04', 'ASI005'),
('JUS002', 'ATRASO', 'Problemas de transporte', 2, '2025-05-04', 'ASI003'),
('JUS003', 'ATRASO', 'Trafico vehicular', 1, '2025-05-01', 'ASI001'),
('JUS004', 'ATRASO', 'Accidente de transito', 1, '2025-05-05', 'ASI006'),
('JUS005', 'ATRASO', 'Cita medica familiar', 1, '2025-05-06', 'ASI009'),
('JUS006', 'FALTA',  'Enfermedad con certificado', 8, '2025-05-07', 'ASI010'),
('JUS007', 'ATRASO', 'Corte de agua en domicilio', 1, '2025-05-05', 'ASI007'),
('JUS008', 'ATRASO', 'Lluvia intensa', 1, '2025-05-06', 'ASI008');
 
INSERT INTO REPORTE (id_reporte, total_horas, total_horas_extra, total_atrasos, total_descuento, sueldo_final, mes, anio, fecha_generacion, id_empleado)
VALUES
('REP001', 160, 2, 1,  5.00,  1195.50, 5, 2025, '2025-05-31', 'EMP001'),
('REP002', 160, 1, 0,  0.00,   950.75, 5, 2025, '2025-05-31', 'EMP002'),
('REP003', 160, 2, 1,  5.00,   845.00, 5, 2025, '2025-05-31', 'EMP003'),
('REP004', 160, 1, 0,  0.00,   700.25, 5, 2025, '2025-05-31', 'EMP004'),
('REP005', 152, 3, 0, 20.00,   630.00, 5, 2025, '2025-05-31', 'EMP005'),
('REP006', 159, 2, 1,  4.50,   595.50, 5, 2025, '2025-05-31', 'EMP006'),
('REP007', 160, 2, 0,  2.50,   747.50, 5, 2025, '2025-05-31', 'EMP007'),
('REP008', 160, 2, 0,  5.00,   745.00, 5, 2025, '2025-05-31', 'EMP008'),
('REP009', 159, 2, 1,  3.00,   547.00, 5, 2025, '2025-05-31', 'EMP009'),
('REP010', 152, 3, 0, 20.00,   530.00, 5, 2025, '2025-05-31', 'EMP010');
