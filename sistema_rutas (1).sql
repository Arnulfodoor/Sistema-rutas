-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2022 a las 20:47:32
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_rutas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ud_articles`
--

CREATE TABLE `ud_articles` (
  `id_article` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `url` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `description_a` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `images` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `videos` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `ahutor` int(11) NOT NULL,
  `visitors` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `like_points` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ud_articles`
--

INSERT INTO `ud_articles` (`id_article`, `title`, `url`, `description_a`, `images`, `videos`, `ahutor`, `visitors`, `comments`, `like_points`, `created`) VALUES
(1, 'Estudiante1', 'http://localhost/estudiante1', 'Aquí aparecerá la información de Estudiante1', '', '', 1, 0, 1, 0, '2022-10-23 18:17:13'),
(2, 'Estudiante2', 'http://localhost/estudiante2', 'Aquí aparecerá la información del Estudiante2', '', '', 2, 0, 0, 0, '2022-10-23 16:14:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ud_comments`
--

CREATE TABLE `ud_comments` (
  `id` int(11) NOT NULL,
  `idarticle` int(11) NOT NULL,
  `ahutor` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ud_comments`
--

INSERT INTO `ud_comments` (`id`, `idarticle`, `ahutor`, `comment`, `status`, `created`) VALUES
(16, 1, 1, 'El estudiante ha sido entregado 23/10/2022', 1, '2022-10-23 18:17:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ud_like`
--

CREATE TABLE `ud_like` (
  `id` int(11) NOT NULL,
  `idarticle` int(11) NOT NULL,
  `ahutor` int(11) NOT NULL,
  `like_point` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ud_like`
--

INSERT INTO `ud_like` (`id`, `idarticle`, `ahutor`, `like_point`, `created`) VALUES
(16, 1, 1, 1, '2022-10-23 15:41:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ud_notifications`
--

CREATE TABLE `ud_notifications` (
  `id_notification` int(11) NOT NULL,
  `idarticle` int(11) NOT NULL,
  `ahutor_comment` int(11) NOT NULL,
  `ahutor_article` int(11) NOT NULL,
  `status_notifications` int(11) NOT NULL,
  `token_status` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ud_notifications`
--

INSERT INTO `ud_notifications` (`id_notification`, `idarticle`, `ahutor_comment`, `ahutor_article`, `status_notifications`, `token_status`, `created`) VALUES
(7, 2, 1, 2, 1, '7dcb6cbcf32b6f04c4e1cf9d8562a32a', '2022-10-23 15:40:13'),
(8, 1, 1, 1, 0, '7e87375b0100aa78aedf356ed4ae174f', '2022-10-23 18:17:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ud_users`
--

CREATE TABLE `ud_users` (
  `id` int(11) NOT NULL,
  `user_name` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `email` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `description` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `picture` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `banner` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `token` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ud_users`
--

INSERT INTO `ud_users` (`id`, `user_name`, `email`, `password`, `description`, `picture`, `banner`, `status`, `token`, `created`) VALUES
(1, 'Ruta1', 'ruta1@colegio.com', '202cb962ac59075b964b07152d234b70', '', '', '', 1, 'faca382e80ac90616d4a1993446437b7', '2022-10-23 15:49:01'),
(2, 'ruta2', 'ruta2@colegio.com', '202cb962ac59075b964b07152d234b70', '', '', '', 1, '8b416f0f57f7b6c69382b0394a847fa4', '2022-10-23 15:34:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ud_visitors`
--

CREATE TABLE `ud_visitors` (
  `id` int(11) NOT NULL,
  `idarticle` int(11) NOT NULL,
  `ip_location` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ud_visitors`
--

INSERT INTO `ud_visitors` (`id`, `idarticle`, `ip_location`, `created`) VALUES
(17, 1, '::1', '2022-10-23 15:36:19'),
(18, 2, '::1', '2022-10-23 15:38:57');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ud_articles`
--
ALTER TABLE `ud_articles`
  ADD PRIMARY KEY (`id_article`);

--
-- Indices de la tabla `ud_comments`
--
ALTER TABLE `ud_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ud_like`
--
ALTER TABLE `ud_like`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ud_notifications`
--
ALTER TABLE `ud_notifications`
  ADD PRIMARY KEY (`id_notification`);

--
-- Indices de la tabla `ud_users`
--
ALTER TABLE `ud_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ud_visitors`
--
ALTER TABLE `ud_visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ud_articles`
--
ALTER TABLE `ud_articles`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `ud_comments`
--
ALTER TABLE `ud_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ud_like`
--
ALTER TABLE `ud_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ud_notifications`
--
ALTER TABLE `ud_notifications`
  MODIFY `id_notification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ud_users`
--
ALTER TABLE `ud_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ud_visitors`
--
ALTER TABLE `ud_visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
