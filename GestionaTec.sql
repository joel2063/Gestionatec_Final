CREATE DATABASE GestionaTec;
USE GestionaTec;

CREATE TABLE USUARIO (
    id_usuario VARCHAR (50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    contraseña VARCHAR(20) NOT NULL,
    rol ENUM('ADMIN', 'EMPLEADO') NOT NULL,

    PRIMARY KEY (id_usuario)
);
CREATE TABLE HORARIO (
    id_horario VARCHAR(50) NOT NULL,
    entrada_matutina TIME NOT NULL,
    salida_matutina TIME NOT NULL,
    entrada_vespertina TIME NOT NULL,
    salida_vespertina TIME NOT NULL,

    PRIMARY KEY (id_horario)
);
CREATE TABLE CARGO (
    id_cargo VARCHAR(50) NOT NULL,
    nombre_cargo VARCHAR(100) NOT NULL,
    sueldo DOUBLE NOT NULL,

    PRIMARY KEY (id_cargo)
);
CREATE TABLE EMPLEADO (
    id_empleado VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    cedula VARCHAR(10) NOT NULL UNIQUE,
    direccion VARCHAR(10)NOT NULL,
    telefono VARCHAR(10),
     id_usuario VARCHAR(50) NOT NULL,   
    id_horario VARCHAR(50) NOT NULL,   
    id_cargo VARCHAR(50) NOT NULL,     
    
    PRIMARY KEY (id_empleado),
    
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_horario) REFERENCES HORARIO(id_horario),
    FOREIGN KEY (id_cargo) REFERENCES CARGO(id_cargo)
);
CREATE TABLE ASISTENCIA (
    id_asistencia VARCHAR (50) NOT NULL,
    fecha DATE NOT NULL,
    entrada_matutina TIME,
    salida_matutina TIME,
    entrada_vespertina TIME,
    salida_vespertina TIME,
    estado_asistencia ENUM('PRESENTE','ATRASADO','FALTA'),
    id_empleado VARCHAR(50) NOT NULL,

    PRIMARY KEY (id_asistencia),

    foreign key (id_empleado) references EMPLEADO(id_empleado)
);

CREATE TABLE DESCUENTO (
    id_descuento VARCHAR (50) NOT NULL,
    motivo VARCHAR(100) NOT NULL,
    tipo ENUM('HORAS', 'DIA') NOT NULL,
    monto DOUBLE NOT NULL,
    fecha DATE NOT NULL,
    id_asistencia VARCHAR(50) NOT NULL,

    PRIMARY KEY (id_descuento),

    foreign key (id_asistencia) references ASISTENCIA(id_asistencia)
);

CREATE TABLE JUSTIFICACION (
    id_justificacion VARCHAR (50) NOT NULL,
    tipo_justificacion ENUM('ATRASO', 'FALTA') NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    horas_justificadas INT NOT NULL,
    fecha_registro DATE NOT NULL,
    id_asistencia VARCHAR(50) NOT NULL UNIQUE,

    PRIMARY KEY (id_justificacion),

    foreign key (id_asistencia) references ASISTENCIA(id_asistencia)
);
CREATE TABLE HORASEXTRA (
    id_horaextra INT VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio_extra TIME NOT NULL,
    hora_fin_extra TIME NOT NULL,
    id_asistencia INT VARCHAR(50) NOT NULL,

    PRIMARY KEY (id_horaextra),

    foreign key (id_asistencia) references ASISTENCIA(id_asistencia)
);
CREATE TABLE REPORTE (
    id_reporte VARCHAR(50) NOT NULL,
    total_horas INT NOT NULL DEFAULT 0,
    total_horas_extra INT NOT NULL DEFAULT 0,
    total_atrasos INT NOT NULL DEFAULT 0,
    total_descuento DOUBLE NOT NULL DEFAULT 0,
    sueldo_final DOUBLE NOT NULL DEFAULT 0,
    mes INT NOT NULL CHECK (mes BETWEEN 1 AND 12),
    año INT NOT NULL,
    fecha_generacion DATE NOT NULL,
    id_empleado VARCHAR(50) NOT NULL,

    PRIMARY KEY (id_reporte),

    foreign key (id_empleado) references EMPLEADO(id_empleado)
);

