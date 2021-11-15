-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2021 a las 06:19:08
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mocoag5`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `idEmpresa` int(11) NOT NULL,
  `nombreEmpresa` varchar(100) NOT NULL,
  `NIT` varchar(100) NOT NULL,
  `actividad` varchar(100) NOT NULL,
  `empleados` int(11) NOT NULL,
  `vacantes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`idEmpresa`, `nombreEmpresa`, `NIT`, `actividad`, `empleados`, `vacantes`) VALUES
(1, 'Ninguna', '0', 'Desempleado', 0, 0),
(2, 'Presidencia', '0', 'Gobierno', 5, 1),
(3, 'Alcaldia', '0', 'Gobierno', 10, 1),
(4, 'Instituto Tecnologico del Putumayo', '0', 'Educacion', 50, 5),
(5, 'ECSALUD', '0', 'Educacion', 25, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `social`
--

CREATE TABLE `social` (
  `idSocial` int(11) NOT NULL,
  `tipoPoblacion` varchar(100) NOT NULL,
  `conyugue` varchar(10) NOT NULL,
  `hijos` varchar(10) NOT NULL,
  `desplazado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `social`
--

INSERT INTO `social` (`idSocial`, `tipoPoblacion`, `conyugue`, `hijos`, `desplazado`) VALUES
(100, 'Indigena', 'No', 'No', 'No'),
(101, 'Indigena', 'No', 'No', 'Si'),
(102, 'Indigena', 'No', 'Si', 'Si'),
(103, 'Indigena', 'Si', 'Si', 'Si'),
(104, 'Indigena', 'Si', 'Si', 'No'),
(105, 'Indigena', 'Si', 'No', 'No'),
(106, 'Indigena', 'Si', 'No', 'Si'),
(107, 'Indigena', 'No', 'Si', 'No'),
(108, 'Afrodescendiente', 'No', 'No', 'No'),
(109, 'Afrodescendiente', 'No', 'No', 'Si'),
(110, 'Afrodescendiente', 'No', 'Si', 'Si'),
(111, 'Afrodescendiente', 'Si', 'Si', 'Si'),
(112, 'Afrodescendiente', 'Si', 'Si', 'No'),
(113, 'Afrodescendiente', 'Si', 'No', 'No'),
(114, 'Afrodescendiente', 'Si', 'No', 'Si'),
(115, 'Afrodescendiente', 'No', 'Si', 'No'),
(116, 'Ninguna', 'No', 'No', 'No'),
(117, 'Ninguna', 'No', 'No', 'Si'),
(118, 'Ninguna', 'No', 'Si', 'Si'),
(119, 'Ninguna', 'Si', 'Si', 'Si'),
(120, 'Ninguna', 'Si', 'Si', 'No'),
(121, 'Ninguna', 'Si', 'No', 'No'),
(122, 'Ninguna', 'Si', 'No', 'Si'),
(123, 'Ninguna', 'No', 'Si', 'No');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(100) CHARACTER SET latin2 NOT NULL,
  `tipoDocumento` varchar(100) CHARACTER SET latin2 NOT NULL,
  `documentoUsuario` varchar(100) CHARACTER SET latin2 NOT NULL,
  `tipoPerfil` varchar(100) CHARACTER SET latin2 NOT NULL,
  `edad` int(11) NOT NULL,
  `municipio` varchar(100) CHARACTER SET latin2 NOT NULL,
  `telefono` varchar(100) CHARACTER SET latin2 NOT NULL,
  `email` varchar(100) CHARACTER SET latin2 DEFAULT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idSocial` int(11) NOT NULL DEFAULT 116,
  `usuario` varchar(100) CHARACTER SET latin2 NOT NULL,
  `contrasenia` varchar(100) CHARACTER SET latin2 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombreUsuario`, `tipoDocumento`, `documentoUsuario`, `tipoPerfil`, `edad`, `municipio`, `telefono`, `email`, `idEmpresa`, `idSocial`, `usuario`, `contrasenia`) VALUES
(100, 'Alejando Jose Sanchez', 'CC', '80564879', 'ADMINISTRADOR', 33, 'Mocoa', '3105648975', 'administracion@social.gov.co', 2, 116, 'Alejandro100', '12345'),
(101, 'Martina Rodriguez', 'CC', '53654789', 'ADMINISTRADOR', 29, 'Mocoa', '3158964566', 'administracion2@social.gov.co', 2, 116, 'Martina101', '45678'),
(102, 'Diego Fernando Arce', 'CC', '80564321', 'JAC', 45, 'Mocoa', '316547896', 'jacmocoa@mocoa.gov.co', 3, 116, 'Diego102', '01020'),
(103, 'Lucia Martinez', 'CC', '80245654', 'JAC', 25, 'San Luis', '3156254789', 'jacmocoa@mocoa.gov.co', 3, 116, 'Lucia103', 'perro45'),
(104, 'Pedro Juan  Ramirez', 'CC', '80564859', 'JAC', 35, 'San Luis', '3112546333', 'jacmocoa2@mocoa.gov.co', 3, 100, 'Pedro104', 'gatico2015'),
(106, 'Nina Maria Lopez', 'CC', '52145698', 'JAC', 24, 'Mocoa', '3005689874', 'jacmocoa4@mocoa.gov.co', 3, 100, 'Nina106', '12456'),
(107, 'Francisco Jose Barbosa', 'CC', '25654789', 'JAC', 55, 'Mocoa', '3002568974', 'pacho4567@gmail.com', 3, 116, 'Francisco107', '12345'),
(108, 'Pedro Perez', 'CC', '19564231', 'USUARIO', 65, 'Mocoa', '3165478965', 'notiene@nomail.com', 1, 100, 'Pedro108', 'tucan45');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `social`
--
ALTER TABLE `social`
  ADD PRIMARY KEY (`idSocial`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `usuarios_FK` (`idEmpresa`),
  ADD KEY `usuarios_FK_1` (`idSocial`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `social`
--
ALTER TABLE `social`
  MODIFY `idSocial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_FK` FOREIGN KEY (`idEmpresa`) REFERENCES `empresas` (`idEmpresa`),
  ADD CONSTRAINT `usuarios_FK_1` FOREIGN KEY (`idSocial`) REFERENCES `social` (`idSocial`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
