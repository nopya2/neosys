-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 18 nov. 2018 à 09:21
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
-- Base de données :  `ecommerce_yvan`
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
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `blog`
--

INSERT INTO `blog` (`id`, `created_by_id`, `titre`, `contenu`, `created_at`, `updated_at`, `image_name`, `image_size`) VALUES
(1, 13, 'retour du coach', 'Solari a pris le pouvoir et sempble relance madrid', '2018-11-09 22:16:33', '2018-11-11 11:43:34', '5be807d632b65095350447.jpg', 73574),
(2, 13, 'Histoire du pay', '<p>OK JAZZ</p>', '2018-11-12 09:53:50', '2018-11-12 09:53:52', '5be93fa01d7a9141752172.jpg', 7142),
(3, 13, 'Histoire du pay', '<p>OK JAZZ</p>', '2018-11-12 09:54:14', '2018-11-12 09:54:16', '5be93fb83a066201032428.jpg', 7142);

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
(1, 3),
(1, 4),
(2, 5),
(3, 5);

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
(2, 3, 'toto07', 'yvon.ndong@gmail.com', NULL, 'Je suis tout a fait d\'accord avec vous', '2018-11-12 00:00:00', 'interne');

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
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `configuration`
--

INSERT INTO `configuration` (`id`, `email`, `nom_site`, `image_name`, `image_size`, `updated_at`) VALUES
(1, 'infos@neosystechnologie.ga', 'Neosys Technologie', '5bcc517040a1d299199731.png', 34523, '2018-10-21 12:14:08');

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
(11, 13, 'Test support MOS', 'Test support MOS', '2018-11-09 18:57:31', '2018-11-09 18:57:31', 'IAI', '2019-02-09 18:56:00', '2019-02-16 18:56:00');

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
('20181030122850'),
('20181109200443'),
('20181109203812'),
('20181109204555'),
('20181109205508'),
('20181112094041'),
('20181115082140');

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
  `realized_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`id`, `created_by_id`, `service_id`, `titre`, `description`, `created_at`, `updated_at`, `image_name`, `image_size`, `realized_at`) VALUES
(1, 13, 1, 'Support du pays', '<p>jkfsdkjfsd</p>', '2018-10-02 00:22:49', '2018-11-11 11:42:26', '5be807920d3d4489838879.jpg', 83301, '2018-10-17 00:00:00'),
(2, 13, 1, 'Developpement site web', '<p>test type</p>', '2018-10-17 12:19:22', '2018-10-17 12:19:24', '5bc70cac244f4238382443.jpg', 73574, '2018-02-02 00:00:00'),
(3, 13, 1, 'Developpement site web', '<p>test type</p>', '2018-10-17 12:20:07', '2018-10-17 12:20:08', '5bc70cd886025063782320.jpg', 73574, '2018-02-02 00:00:00');

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
  `image_size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `titre`, `user_id`, `description`, `created_at`, `updated_at`, `icone`, `image_name`, `image_size`) VALUES
(1, 'le support de l\'humanite', 13, '<p>Je suis bien la</p>\r\n\r\n<div class=\"videoEmbed\">&nbsp;</div>', '2018-10-01 23:57:56', '2018-10-08 13:36:03', 'fa fa-star', '5bb42c40b34fd299618546.jpg', 73574),
(2, 'le support du pays', 13, '<p>le debut du commencement de ce monde</p>', '2018-10-03 03:41:07', '2018-10-08 10:18:29', 'fa fa-plus', '5bbb12d54c9d1883312392.png', 24471);

-- --------------------------------------------------------

--
-- Structure de la table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sous_titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `slider`
--

INSERT INTO `slider` (`id`, `titre`, `sous_titre`, `image_name`, `image_size`, `updated_at`) VALUES
(2, 'autre cours', 'aures cours', '5bc78ecdd5809423493146.png', 34523, '2018-10-17 21:34:37'),
(3, 'je suis bien la', 'voici toi', '5bc78988d66ac458777285.jpg', 73574, '2018-10-17 21:12:08');

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
  `image_size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `username`, `created_on`, `updated_on`, `password`, `is_active`, `roles`, `image_name`, `image_size`) VALUES
(13, 'NDONG OTOGUE', 'Yvon Paul Brice', 'nopya2@gmail.com', 'admin', '2018-09-30 13:57:13', '2018-10-25 22:55:14', '$2y$13$pGVEPk58YGOILIyaMLz1T.TNKps9y/y.OO3aRyCTcbYPpz8V2URhy', 1, 'a:2:{i:0;s:9:\"ROLE_USER\";i:1;s:10:\"ROLE_ADMIN\";}', '5bd22db226d01491087055.png', 24471),
(14, 'user1', 'user1', 'user1@yahoo.fr', 'user1', '2018-09-30 14:59:22', '2018-09-30 14:59:29', '$2y$13$FHj/kph8/Wa74XaAzUfQVuY6YqDOiDFCj4ZaAZ61ai/t84v8WGQ46', 1, 'a:1:{i:0;s:9:\"ROLE_USER\";}', '5bb0c8b1a69db035235807.png', 34523),
(15, 'user2', 'user2', 'user2@yahoo.fr', 'user2', '2018-10-17 22:58:45', '2018-10-18 10:34:13', '$2y$13$HVqSjzzXasRYBXYshxeVVOsHphPZRV03mzOTKl/d7TzRWSkcQ..f2', 0, 'a:1:{i:0;s:9:\"ROLE_USER\";}', '5bc84585270bc368875281.png', 24471);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
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
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B26681EB03A8386` (`created_by_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_50159CA9B03A8386` (`created_by_id`),
  ADD KEY `IDX_50159CA9ED5CA9E6` (`service_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `category_blog`
--
ALTER TABLE `category_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `projet`
--
ALTER TABLE `projet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `FK_B26681EB03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `FK_50159CA9B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_50159CA9ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK_E19D9AD2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
