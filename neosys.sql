-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 09 avr. 2020 à 09:29
-- Version du serveur :  10.1.35-MariaDB
-- Version de PHP :  7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `neosys`
--

-- --------------------------------------------------------

--
-- Structure de la table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `blog`
--

INSERT INTO `blog` (`id`, `created_by_id`, `titre`, `contenu`, `created_at`, `updated_at`, `image_id`, `visible`) VALUES
(2, 13, 'Histoire du pay', '<p>OK JAZZ</p>', '2018-11-12 09:53:50', '2018-11-12 09:53:52', NULL, 0),
(3, 13, 'Histoire du pay', '<p>OK JAZZ</p>', '2018-11-12 09:54:14', '2018-11-12 09:54:16', NULL, 1),
(5, 13, 'test06', '<p>test</p>', '2019-04-01 13:06:38', '2019-04-07 20:31:10', 30, 0),
(6, 13, 'test07', '<p>test07</p>', '2019-04-01 14:52:52', '2019-04-01 14:52:52', 31, 0),
(7, 13, 'blog1', '<p>Blog1</p>', '2019-04-07 20:20:27', '2019-04-07 20:20:27', 34, 1),
(8, 13, 'blog2', '<p>Blog2</p>', '2019-04-07 20:47:27', '2019-04-08 11:21:54', 35, 1),
(9, 13, 'blog3', '<p>Blog3</p>', '2019-04-08 11:25:56', '2019-04-08 11:28:27', 36, 1);

-- --------------------------------------------------------

--
-- Structure de la table `blog_category_blog`
--

CREATE TABLE `blog_category_blog` (
  `blog_id` int(11) NOT NULL,
  `category_blog_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `blog_category_blog`
--

INSERT INTO `blog_category_blog` (`blog_id`, `category_blog_id`) VALUES
(2, 5),
(3, 5),
(5, 2),
(5, 3),
(6, 4),
(7, 3),
(8, 3),
(9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `category_blog`
--

CREATE TABLE `category_blog` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_blog`
--

INSERT INTO `category_blog` (`id`, `created_by_id`, `titre`, `created_at`, `updated_at`) VALUES
(1, 14, 'Sport', '2018-11-09 00:00:00', '2018-11-09 00:00:00'),
(2, 15, 'Finance', '2018-11-09 00:00:00', '2018-11-09 00:00:00'),
(3, 15, 'Informatique', '2018-11-09 00:00:00', '2018-11-09 00:00:00'),
(4, 15, 'Ecologie', '2018-11-09 00:00:00', '2018-11-09 00:00:00'),
(5, 14, 'Culture', '2018-11-09 00:00:00', '2018-11-09 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sended_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `blog_id`, `nom`, `email`, `website`, `message`, `sended_at`, `type`) VALUES
(1, 3, 'eminem', 'yvon.ndong@gmail.com', NULL, 'Je suis tout a fait d\'accord avec vous', '2018-11-12 00:00:00', 'externe'),
(2, 3, 'toto07', 'yvon.ndong@gmail.com', NULL, 'Je suis tout a fait d\'accord avec vous', '2018-11-12 00:00:00', 'interne'),
(3, 3, 'NEOSYS TECHNOLOGIE SUPPORT', 'infos@neosystechnologie.ga', 'neosystechnologie.ga', 'je suis bien la', '2019-04-01 21:02:28', 'interne'),
(4, 3, 'NEOSYS TECHNOLOGIE SUPPORT', 'infos@neosystechnologie.ga', 'neosystechnologie.ga', '<a href=\'#commentaire_2\' class=\'commentaire-message\' selected=\'commentaire_2\'>@toto07</a> ok jazz', '2019-04-01 21:03:52', 'interne');

-- --------------------------------------------------------

--
-- Structure de la table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_site` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `type_imprimante` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orientation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siteweb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `googleplus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `configuration`
--

INSERT INTO `configuration` (`id`, `email`, `nom_site`, `image_name`, `image_size`, `updated_at`, `type_imprimante`, `orientation`, `adresse`, `bp`, `telephone`, `siteweb`, `facebook`, `twitter`, `googleplus`, `instagram`, `pinterest`) VALUES
(1, 'infos@neosystechnologie.ga', 'Neosys Technologie', '5bcc517040a1d299199731.png', 34523, '2018-10-21 12:14:08', '0,0,209.76,297.64', 'portrait', 'Ancienne SOBRAGA', NULL, '+24107454754', NULL, 'facebook.com', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`id`, `document_id`, `nom`, `created_at`) VALUES
(13, 13, 'Test 01 12', '2019-04-01 21:55:32'),
(14, 14, 'test01', '2019-04-01 21:57:20'),
(15, 15, 'test02', '2019-04-01 22:00:06'),
(16, 16, 'attestation de bourse', '2019-04-02 12:44:35'),
(17, 17, 'attestation', '2019-04-16 00:10:34');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `num_bourse` int(11) NOT NULL,
  `nom_prenom` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL,
  `cat_bourse` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `place` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id`, `created_by_id`, `titre`, `description`, `updated_at`, `created_at`, `place`, `date_debut`, `date_fin`) VALUES
(2, 13, 'Mon Evenement 1', 'Tout va bien se passer dans ce pays', '2018-11-01 00:00:00', '2018-11-01 00:00:00', 'Hotel de la CAN', '2018-11-03 09:00:00', '2018-11-03 18:00:00'),
(4, 14, 'Mon Evenement 3', 'Tout va bien se passer dans ce pays', '2018-11-01 00:00:00', '2018-11-01 00:00:00', 'Hotel de la CAN', '2018-11-03 10:00:00', '2018-11-03 18:00:00'),
(6, 14, 'Mon Evenement 5', 'Tout va bien se passer dans ce pays', '2018-11-01 00:00:00', '2018-11-01 00:00:00', 'Hotel de la CAN', '2018-11-03 11:00:00', '2018-11-03 18:00:00'),
(7, 14, 'Mon Evenement 6', 'Tout va bien se passer dans ce pays', '2018-11-01 00:00:00', '2018-11-01 00:00:00', 'Hotel de la CAN', '2018-11-03 12:00:00', '2018-11-03 18:00:00'),
(8, 13, 'Campus Code', 'Evenement de code', '2018-11-09 12:56:34', '2018-11-09 12:56:34', 'Radison Blue', '2018-11-10 08:00:00', '2018-11-17 18:30:00'),
(10, 13, 'support dev site web', 'support dev site web', '2018-11-09 16:59:07', '2018-11-09 16:59:07', 'ONOMO Hotel', '2019-01-06 16:58:00', '2019-01-19 16:58:00'),
(11, 13, 'Test evenements', 'Grand retrouvaille', '2019-04-23 17:18:37', '2019-04-23 17:18:37', 'Hotel de la CAN', '2019-04-23 08:00:00', '2019-04-23 19:00:00'),
(12, 13, 'Formation bureautique', '<p>Formation bureautique word et excel 2016</p>', '2019-04-26 14:32:53', '2019-04-26 14:32:53', 'Neosys Technologie', '2019-03-31 08:00:00', '2019-04-24 20:30:00'),
(13, 13, 'Formation bureautique', '<p>Formation bureautique word et excel 2016</p>', '2019-04-26 14:33:19', '2019-04-26 14:33:19', 'Neosys Technologie', '2019-03-31 00:00:00', '2019-04-24 00:00:00'),
(14, 13, 'test 06', '<p>test 06</p>', '2019-04-26 14:50:24', '2019-04-26 14:50:24', 'hotel de la CAN', '2019-04-26 08:00:00', '2019-04-27 17:30:00'),
(15, 13, '141926042019', '<p>141926042019</p>', '2019-04-26 15:20:47', '2019-04-26 15:20:47', 'hotel de la CAN', '2019-04-30 14:19:00', '2019-04-26 14:19:00'),
(16, 13, 'evenement 1447260429', '<p>evenement 141826042019</p>', '2019-04-26 15:48:24', '2019-04-26 15:48:24', 'Hotel de la CAN', '2019-04-26 14:47:00', '2019-05-03 14:47:00'),
(17, 13, '194026042019', '<p>194026042019</p>', '2019-04-26 20:45:51', '2019-04-26 20:45:51', 'Hotel de la CAN', '2019-04-26 19:31:00', '2019-04-26 19:31:00');

-- --------------------------------------------------------

--
-- Structure de la table `evenement_image`
--

CREATE TABLE `evenement_image` (
  `evenement_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `evenement_image`
--

INSERT INTO `evenement_image` (`evenement_id`, `image_id`) VALUES
(12, 39),
(12, 40),
(13, 41),
(14, 43),
(16, 44),
(16, 45),
(17, 47);

-- --------------------------------------------------------

--
-- Structure de la table `fichier`
--

CREATE TABLE `fichier` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fichier`
--

INSERT INTO `fichier` (`id`, `file_name`, `file_size`, `updated_at`) VALUES
(1, '5ca1eb252ffbc771680372.jpg', 14270, '2019-04-01 12:42:45'),
(13, '5ca26cb4c0ee7_coursCsharpMysql.pdf', 108726, '2019-04-01 21:55:32'),
(14, '5ca26d2171acd_HTTP_1.1_ Response.pdf', 189161, '2019-04-01 21:57:21'),
(15, '5ca26dc6a65b9_carnaval-2019.png', 385076, '2019-04-01 22:00:06'),
(16, '5ca33d149cb9c_HTTP_1.1_ Response.pdf', 189161, '2019-04-02 12:44:36'),
(17, '5cb50160dd23a_attestation-owoumi.pdf', 127171, '2019-04-16 00:10:41');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `image_name`, `image_size`, `updated_at`) VALUES
(1, '5bfc80c427fc0643710092.jpg', '83301', '2018-11-27 00:24:52'),
(2, '5bfc80ea8c878014881670.png', '34523', '2018-11-27 00:25:30'),
(3, '5bfc81605648c188751103.jpg', '73574', '2018-11-27 00:27:28'),
(4, '5bfc83934a1b3656767451.jpg', '90439', '2018-11-27 00:36:51'),
(5, '5bfc89e136779951597910.jpg', '73574', '2018-11-27 01:03:45'),
(6, '5c01c89f179a5775070837.jpg', '2953', '2018-12-01 00:32:47'),
(7, '5c01c8cb314b8413353884.jpg', '10202', '2018-12-01 00:33:31'),
(8, '5c050be603da7041759621.PNG', '26668', '2018-12-03 11:56:38'),
(9, '5c050c88931cc225078376.PNG', '44828', '2018-12-03 11:59:20'),
(10, '5c050d3269c5a424969223.PNG', '38299', '2018-12-03 12:02:10'),
(11, '5c050dfd316cc938313665.PNG', '34550', '2018-12-03 12:05:33'),
(12, '5c050ec32ce5e275086531.PNG', '23451', '2018-12-03 12:08:51'),
(13, '5c050f391a76b623603292.PNG', '27608', '2018-12-03 12:10:49'),
(14, '5c050f94a08a1241088729.PNG', '26602', '2018-12-03 12:12:20'),
(15, '5c0510067215d832364037.PNG', '53045', '2018-12-03 12:14:14'),
(16, '5c10e36cb687d387743887.jpg', '7142', '2018-12-12 11:31:08'),
(17, '5c10f793636ff313374810.jpg', '381643', '2018-12-12 12:57:07'),
(18, '5c10fdaf88e6d426148953.jpg', '165194', '2018-12-12 13:23:11'),
(19, '5c11036b14163948632540.jpg', '3652', '2018-12-12 13:47:39'),
(20, '5c1302e695fa8637087837.jpg', '13744', '2018-12-14 02:09:58'),
(21, '5c136f444e6ce844806177.jpg', '12104', '2018-12-14 09:52:20'),
(22, '5c1370217ceae245616640.jpg', '119189', '2018-12-14 09:56:01'),
(23, '5c1addac507b9721648128.jpg', '14270', '2018-12-20 01:09:16'),
(24, '5c2a2c1789189113348084.jpg', '33026', '2018-12-31 15:47:51'),
(25, '5c352fde73d5e563411050.jpg', '14166', '2019-01-09 00:18:54'),
(26, '5c3532712422c612839668.jpg', '2890', '2019-01-09 00:29:53'),
(27, '5c3532eaeead8040158320.jpg', '7669', '2019-01-09 00:31:54'),
(28, '5c3ce25ba9ea7863500604.jpg', '11454', '2019-01-14 20:26:19'),
(29, '5ca199089a24c956877766.jpg', '90439', '2019-04-01 06:52:24'),
(30, '5caa41ee49010197559993.jpg', '14802', '2019-04-07 20:31:10'),
(31, '5ca209a6cdcb1547311122.png', '385076', '2019-04-01 14:52:54'),
(34, '5caa3f6c11d01719994754.jpg', '14802', '2019-04-07 20:20:28'),
(35, '5caa45c00f490288054077.jpg', '39899', '2019-04-07 20:47:28'),
(36, '5cab13a6185e6945560713.jpg', '391509', '2019-04-08 11:25:58'),
(39, '5cc2fa76462dc226270667.jpg', '55468', '2019-04-26 14:32:54'),
(40, '5cc2fa764de37878995655.jpg', '88344', '2019-04-26 14:32:54'),
(41, '5cc2fa904bfc5679476918.jpg', '55468', '2019-04-26 14:33:20'),
(42, '5cc2fa9053c08043104341.jpg', '88344', '2019-04-26 14:33:20'),
(43, '5cc2fe918ae49624841846.jpg', '55468', '2019-04-26 14:50:25'),
(44, '5cc30c29b935e059140094.jpg', '50380', '2019-04-26 15:48:25'),
(45, '5cc30c29c0f18015170515.jpg', '55468', '2019-04-26 15:48:25'),
(46, '5cc30c29c519d790098045.jpg', '205886', '2019-04-26 15:48:25'),
(47, '5cc352412b2b7067793010.jpg', '88344', '2019-04-26 20:47:29');

-- --------------------------------------------------------

--
-- Structure de la table `import`
--

CREATE TABLE `import` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `import`
--

INSERT INTO `import` (`id`, `file_name`, `file_size`, `updated_at`) VALUES
(1, '5ca316127cca1_Connecting a MySQL table to a DataGridView control in C# _ Source libre.pdf', 559720, '2019-04-02 09:58:10'),
(2, '5ca3198f3af73_etudiant.xlsx', 9618, '2019-04-02 10:13:03'),
(3, '5ca38655c78e6_etudiant.xlsx', 9679, '2019-04-02 17:57:09'),
(4, '5ca387959d287_etudiant.xlsx', 9679, '2019-04-02 18:02:29'),
(5, '5ca387f9ca22e_etudiant.xlsx', 9679, '2019-04-02 18:04:09'),
(6, '5ca38d9fcf9c7_etudiant.xlsx', 9679, '2019-04-02 18:28:15');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20190423134008'),
('20190430170858'),
('20190908061557');

-- --------------------------------------------------------

--
-- Structure de la table `partenaire`
--

CREATE TABLE `partenaire` (
  `id` int(11) NOT NULL,
  `adresse` longtext NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `bp` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `siteweb` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `partenaire`
--

INSERT INTO `partenaire` (`id`, `adresse`, `telephone`, `bp`, `email`, `siteweb`, `image_name`, `image_size`, `created_at`, `updated_at`, `nom`) VALUES
(1, 'Ancienne SOBRAGA, en face de Multipresse', '+24107454754', NULL, 'infos@neosystechnologie.ga', 'http://neosystechnologie.ga', '5bf5438e23c8c152199283.png', 47602, '2018-11-21 12:36:28', '2018-11-21 12:37:50', 'Neosys Technologie'),
(2, 'Nzeng Ayong', '02720810', NULL, 'hpo@gmail.com', NULL, '5caccf53700dc054092306.jpg', 17548, '2019-04-09 18:58:58', '2019-04-09 18:58:59', 'HPO MATA'),
(3, 'Louis, En Face de la GaboPrix', '04872231', NULL, 'gtaci@yahoo.fr', NULL, NULL, NULL, '2019-04-19 18:36:38', '2019-04-19 18:36:38', 'Cabinet GTACI'),
(4, 'Boulevard Hassa II', '07290011, 02451472', NULL, 'hac@gmail.com', NULL, NULL, NULL, '2019-04-19 18:40:58', '2019-04-19 18:40:58', 'Haute Autorite de la Communication (HAC)');

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `realized_at` datetime NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`id`, `created_by_id`, `service_id`, `titre`, `description`, `created_at`, `updated_at`, `image_name`, `image_size`, `realized_at`, `visible`) VALUES
(10, 13, 8, 'Espace COWORKING', '<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">C&acirc;blage r&eacute;seau informatique &ndash; Espace COWORKING</span></span></p>', '2019-09-08 11:55:02', '2019-09-08 13:18:21', '5d74e37d33ce2204962257.jpg', 43653, '2019-09-07 00:00:00', 1),
(11, 13, 8, 'DATACENTER - HAC', '<p><u><strong>Mise en place d&#39;un Datacenter Audio Visuel</strong></u></p>\r\n\r\n<ul>\r\n	<li>Modules Analogiques Haute Frequences</li>\r\n	<li>Multiplexer Qbit</li>\r\n	<li>Serveur Streaming</li>\r\n	<li>Serveur Multi Streaming</li>\r\n	<li>NAS 16 To</li>\r\n</ul>', '2019-09-08 12:17:11', '2019-09-08 12:31:00', '5d74d8642df45817061121.jpg', 58300, '2016-07-16 00:00:00', 1),
(12, 13, 6, 'Monitoring Audio - Visuel', '<p>Monitoring Audio Visuel</p>', '2019-09-08 13:36:15', '2019-09-08 13:36:16', '5d74e7b0aaac5021315062.jpg', 78091, '2016-07-16 00:00:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `projet_partenaire`
--

CREATE TABLE `projet_partenaire` (
  `projet_id` int(11) NOT NULL,
  `partenaire_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `icone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `titre`, `user_id`, `description`, `created_at`, `updated_at`, `icone`, `image_name`, `image_size`, `visible`) VALUES
(3, 'Audits et Conseils', 13, '<p><strong>Le syst&egrave;me d&rsquo;information occupe une place strat&eacute;gique dans votre soci&eacute;t&eacute;.</strong></p>\r\n\r\n<p>C&rsquo;est pourquoi <strong>NeoSys Technologie</strong>&nbsp;met &agrave; votre disposition ses &eacute;quipes de consultants et techniciens en vue de r&eacute;aliser des missions d&rsquo;&eacute;tudes de l&rsquo;existant afin de vous proposer des solutions adapt&eacute;es &agrave; votre structure et votre organisation.</p>\r\n\r\n<p>Nous analyserons de mani&egrave;re d&eacute;taill&eacute;e, avec vos &eacute;quipes, vos besoins afin de d&eacute;finir ensemble un cahier des charges. Nous vous proposerons des &eacute;volutions et des solutions en ad&eacute;quation avec les besoins exprim&eacute;s.</p>\r\n\r\n<p>Nous vous accompagnerons tout au long de la mise en place de ces nouvelles solutions.</p>', '2019-04-07 13:42:33', '2019-09-08 15:33:10', 'fa fa-info-circle', '5d750316c33e3288821067.jpg', 33770, 1),
(4, 'Formation', 13, '<p><strong>Neosys Technologie&nbsp;</strong>forme vos utilisateurs en environnement Windows.</p>\r\n\r\n<p><strong>Neosys Technologie&nbsp;</strong>propose, dans le cadre de votre projet et pour une meilleure prise en main de votre outil informatique du transfert de comp&eacute;tences.</p>\r\n\r\n<p>Vous accompagnez et vous aidez &agrave; trouver la r&eacute;ponse adapt&eacute;e en mati&egrave;re de formation est notre priorit&eacute;.</p>\r\n\r\n<p>Nous construisons la solution qui tient compte de votre organisation et vous apporte la valeur ajout&eacute;e attendue.</p>\r\n\r\n<p>Que ce soit en&nbsp;<a href=\"http://www.atp-formation.com/formations-inter-entreprises.html\" title=\"Plus d\'informations sur les formations inter-entreprises\">inter</a>&nbsp;ou&nbsp;<a href=\"http://www.atp-formation.com/formations-intra-entreprise.html\" title=\"Plus d\'informations sur les formations intra-entreprise\">intra-entreprise</a>, nous constituons des groupes de niveau homog&egrave;ne selon les objectifs des participants. Ainsi gr&acirc;ce &agrave; la synergie de groupe, un &eacute;change permanent se met en place avec le formateur.</p>\r\n\r\n<p>L&#39;&eacute;nergie du groupe, l&#39;interaction avec le formateur et la prise en compte des attentes individuelles, sont pour nous les cl&eacute;s du succ&egrave;s d&#39;une formation.</p>\r\n\r\n<ul>\r\n	<li>Formations BASE DE DONNEES</li>\r\n	<li>Formations BUREAUTIQUE</li>\r\n	<li>Formations BUSINESS INTELLIGENCE</li>\r\n	<li>Formations CAO - DAO</li>\r\n	<li>Formations DEVELOPPEMENT et METHODES</li>\r\n	<li>Formations GESTION DE PROJETS</li>\r\n	<li>Formations INTERNET - RESEAUX SOCIAUX</li>\r\n	<li>Formations PAO - CREATION WEB - MULTIMEDIA</li>\r\n	<li>Formations SYSTEME D&#39;EXPLOITATION RESEAUX&nbsp;</li>\r\n</ul>', '2019-04-07 13:50:22', '2019-09-08 15:41:36', 'fa fa-book', '5d7505108f04e021528988.jpg', 45790, 1),
(5, 'Sécurité', 13, '<p>S&rsquo;informatiser c&rsquo;est bien. S&eacute;curiser son syst&egrave;me informatique c&rsquo;est mieux!</p>\r\n\r\n<p><strong>NeoSys Technologie&nbsp;</strong>prot&egrave;ge votre Syst&egrave;me d&rsquo;information &agrave; tous les niveaux&nbsp;(Solutions UTM, Firewall, Antivirus, Anti spam, sauvegardes, PRA,&hellip;)</p>', '2019-04-07 13:55:37', '2019-09-08 15:44:21', 'fa fa-lock', '5d7505b554b8a579893615.jpg', 39174, 1),
(6, 'Développement', 13, '<p>Notre service d&eacute;veloppement r&eacute;alise des d&eacute;veloppements sp&eacute;cifiques afin de r&eacute;pondre &agrave; plusieurs besoins autour du d&eacute;ploiement et de l&#39;utilisation de vos solutions de gestion Sage.</p>\r\n\r\n<p>- Reprise des donn&eacute;es issues d&#39;un autre applicatif et retraitement pour int&eacute;gration dans Sage.<br />\r\n- D&eacute;veloppement d&#39;un module fonctionnel, d&#39;une vue compl&eacute;mentaire non existant nativement dans Sage.<br />\r\n- D&eacute;veloppement de flux descendants et/ou montants pour tout type de passerelle (WEB, inter-logiciels...).<br />\r\nPassionn&eacute;s et toujours d&eacute;sireux de r&eacute;pondre &agrave; vos attentes, nos d&eacute;veloppeurs travaillent en &eacute;troite collaboration avec l&#39;&eacute;quipe consulting qui remonte le besoin identifi&eacute;.</p>\r\n\r\n<p>Le service consulting saura d&#39;ailleurs vous conseiller sur l&#39;opportunit&eacute; du d&eacute;veloppement sp&eacute;cifique envisag&eacute; en mettant en regard sa compl&eacute;xit&eacute; et le b&eacute;n&eacute;fice apport&eacute;.</p>\r\n\r\n<p>En effet, gr&acirc;ce &agrave; notre expertise et nos 6&nbsp;ann&eacute;es d&#39;exp&eacute;rience, nous vous proposerons&nbsp;<strong>des sp&eacute;cifiques r&eacute;alistes aussi bien dans leur mise en oeuvre que dans leur maintenance.</strong></p>\r\n\r\n<p><strong>Optimiser tout en fiablisant</strong>&nbsp;vos outils de gestion, tel est notre leitmotiv.</p>', '2019-04-07 14:04:34', '2019-09-08 15:53:30', 'fa fa-pencil', '5d7507dae558f745011235.jpg', 24077, 1),
(8, 'Administration Systèmes et Réseaux', 13, '<p><strong>NeoSys Technologie</strong> une &eacute;quipe de techniciens, administrateurs r&eacute;seaux et ing&eacute;nieurs syst&egrave;mes pour vous accompagner dans vos projets d&rsquo;infrastructure informatique.</p>\r\n\r\n<ul>\r\n	<li>Solutions mat&eacute;riels et logiciels</li>\r\n	<li>Audit de parcs informatiques</li>\r\n	<li>C&acirc;blage r&eacute;seau</li>\r\n	<li>Virtualisation</li>\r\n	<li>Messagerie</li>\r\n</ul>', '2019-04-07 14:25:54', '2019-09-08 15:54:26', 'fa fa-usb', '5d750812697f1105305769.jpg', 21065, 1),
(9, 'Infogérance', 13, '<p>De l&rsquo;assistance utilisateur &agrave; l&rsquo;infog&eacute;rance totale de votre parc informatique,&nbsp;<strong>NeoSys technologie</strong>&nbsp;vous propose des services &laquo;&nbsp;&agrave; la carte&nbsp;&raquo; int&eacute;grant&nbsp;: support hotline, t&eacute;l&eacute;maintenance, supervision, visites pr&eacute;ventives.</p>\r\n\r\n<p>Pour mieux r&eacute;pondre&nbsp;&agrave; vos besoins&nbsp;et &agrave; votre organisation !</p>', '2019-04-07 14:31:12', '2019-09-08 15:56:11', 'fa fa-desktop', '5d75087b48afd505994504.jpg', 25580, 1);

-- --------------------------------------------------------

--
-- Structure de la table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sous_titre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `priorite` int(11) NOT NULL,
  `sous_titre1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `slider`
--

INSERT INTO `slider` (`id`, `titre`, `sous_titre`, `image_name`, `image_size`, `updated_at`, `url`, `visible`, `priorite`, `sous_titre1`, `url1`) VALUES
(2, 'autre cours', 'aures cours', '5bc78ecdd5809423493146.png', 34523, '2018-10-17 21:34:37', NULL, 0, 0, NULL, NULL),
(3, 'je suis bien la', 'voici toi', '5bc78988d66ac458777285.jpg', 73574, '2018-10-17 21:12:08', 'http://anbg.local/admin/blog/', 0, 0, NULL, NULL),
(4, 'Slider 2', NULL, '5ca8a25e8cc6b263323439.jpg', 119189, '2019-04-06 14:58:06', NULL, 0, 0, NULL, NULL),
(5, 'Slider 3', NULL, '5ca89e2a67e4f566410719.jpg', 90439, '2019-04-06 14:40:10', NULL, 0, 0, NULL, NULL),
(6, 'NEOSYS TECHNOLOGIE', 'Integrateur de solutions informatiques', '5cc44dea926ec663252670.jpg', 260818, '2019-04-27 14:41:14', 'http://neosys.local/services', 1, 0, NULL, NULL),
(7, 'Innovation et Créativité', 'Neosys realise des projets innovants et compatible avec les nouvelles normes', '5cc454748a223573521646.jpg', 133040, '2019-04-27 15:09:08', 'http://neosys.local/projets', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `prenom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `roles` longtext CHARACTER SET utf8 NOT NULL COMMENT '(DC2Type:array)',
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `fonction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `googleplus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `configuration_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `username`, `created_on`, `updated_on`, `password`, `is_active`, `roles`, `image_name`, `image_size`, `fonction`, `facebook`, `googleplus`, `twitter`, `linkedin`, `configuration_id`) VALUES
(13, 'NDONG OTOGUE', 'Yvon Paul Brice', 'nopya2@gmail.com', 'admin', '2018-09-30 13:57:13', '2019-01-22 21:08:41', '$2y$13$Q4JgwnhHT43x/EmQt4G6zuumVtRhZJhgLyB3ryn8acHLxvIOnv2MO', 1, 'a:2:{i:0;s:9:\"ROLE_USER\";i:1;s:10:\"ROLE_ADMIN\";}', '5c47784930117316350318.jpg', 14166, 'Responsable Technique', NULL, NULL, NULL, NULL, 1),
(14, 'KOMBILA EKANG', 'Donald', 'donald.kombila@neosystechnologie.ga', 'donald.kombila', '2018-09-30 14:59:22', '2018-09-30 14:59:29', '$2y$13$FHj/kph8/Wa74XaAzUfQVuY6YqDOiDFCj4ZaAZ61ai/t84v8WGQ46', 1, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', '5bb0c8b1a69db035235807.png', 34523, 'Manager Général', NULL, NULL, NULL, NULL, 1),
(15, 'MISSEVOU', 'Aude Cheryle', 'missevouc@gmail.com', 'aude.missevou', '2018-10-17 22:58:45', '2018-10-18 10:34:13', '$2y$13$Km6wThk1KR3JPKMyG/DoROASvpdZ04.PhWLkn5cVJb06e9FcedEMe', 0, 'a:1:{i:0;s:9:\"ROLE_USER\";}', '5bc84585270bc368875281.png', 24471, 'Responsable Commercial', NULL, NULL, NULL, NULL, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C01551433DA5256D` (`image_id`),
  ADD KEY `IDX_C0155143B03A8386` (`created_by_id`);

--
-- Index pour la table `blog_category_blog`
--
ALTER TABLE `blog_category_blog`
  ADD PRIMARY KEY (`blog_id`,`category_blog_id`),
  ADD KEY `IDX_3808E168DAE07E97` (`blog_id`),
  ADD KEY `IDX_3808E1681D383EE9` (`category_blog_id`);

--
-- Index pour la table `category_blog`
--
ALTER TABLE `category_blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4B8E2B04B03A8386` (`created_by_id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BCDAE07E97` (`blog_id`);

--
-- Index pour la table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D8698A76C33F7837` (`document_id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B26681EB03A8386` (`created_by_id`);

--
-- Index pour la table `evenement_image`
--
ALTER TABLE `evenement_image`
  ADD PRIMARY KEY (`evenement_id`,`image_id`),
  ADD KEY `IDX_5697A8A7FD02F13` (`evenement_id`),
  ADD KEY `IDX_5697A8A73DA5256D` (`image_id`);

--
-- Index pour la table `fichier`
--
ALTER TABLE `fichier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `import`
--
ALTER TABLE `import`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `partenaire`
--
ALTER TABLE `partenaire`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_32FFA373E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_32FFA3736C6E55B5` (`nom`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_50159CA9B03A8386` (`created_by_id`),
  ADD KEY `IDX_50159CA9ED5CA9E6` (`service_id`);

--
-- Index pour la table `projet_partenaire`
--
ALTER TABLE `projet_partenaire`
  ADD PRIMARY KEY (`projet_id`,`partenaire_id`),
  ADD KEY `IDX_B3624B59C18272` (`projet_id`),
  ADD KEY `IDX_B3624B5998DE13AC` (`partenaire_id`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E19D9AD2A76ED395` (`user_id`);

--
-- Index pour la table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8D93D64973F32DD8` (`configuration_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `category_blog`
--
ALTER TABLE `category_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `fichier`
--
ALTER TABLE `fichier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `import`
--
ALTER TABLE `import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `partenaire`
--
ALTER TABLE `partenaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `projet`
--
ALTER TABLE `projet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `FK_C01551433DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_C0155143B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `blog_category_blog`
--
ALTER TABLE `blog_category_blog`
  ADD CONSTRAINT `FK_3808E1681D383EE9` FOREIGN KEY (`category_blog_id`) REFERENCES `category_blog` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3808E168DAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `category_blog`
--
ALTER TABLE `category_blog`
  ADD CONSTRAINT `FK_4B8E2B04B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BCDAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`);

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK_D8698A76C33F7837` FOREIGN KEY (`document_id`) REFERENCES `fichier` (`id`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `FK_B26681EB03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `evenement_image`
--
ALTER TABLE `evenement_image`
  ADD CONSTRAINT `FK_5697A8A73DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5697A8A7FD02F13` FOREIGN KEY (`evenement_id`) REFERENCES `evenement` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `FK_50159CA9B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_50159CA9ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);

--
-- Contraintes pour la table `projet_partenaire`
--
ALTER TABLE `projet_partenaire`
  ADD CONSTRAINT `FK_B3624B5998DE13AC` FOREIGN KEY (`partenaire_id`) REFERENCES `partenaire` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B3624B59C18272` FOREIGN KEY (`projet_id`) REFERENCES `projet` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK_E19D9AD2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D64973F32DD8` FOREIGN KEY (`configuration_id`) REFERENCES `configuration` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
