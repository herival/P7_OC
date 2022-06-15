-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 15 juin 2022 à 06:22
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `groupomania3`
--

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `user`, `date`, `img`, `text`) VALUES
(83, 8, '2022-06-14 16:44:02', NULL, 'Publication de gérard'),
(84, 7, '2022-06-14 16:59:36', 'post7962-1655218776905.jpg', NULL),
(85, 9, '2022-06-14 17:14:36', 'post4867-1655219676864.png', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `post_comment`
--

CREATE TABLE `post_comment` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post_comment`
--

INSERT INTO `post_comment` (`id`, `user`, `msg`, `date`, `id_post`) VALUES
(70, 9, 'Commentaire de Pierre', '2022-06-14 17:16:10', 84);

-- --------------------------------------------------------

--
-- Structure de la table `post_like`
--

CREATE TABLE `post_like` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `statut` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post_like`
--

INSERT INTO `post_like` (`id`, `user`, `statut`, `date`, `id_post`) VALUES
(65, 7, 1, '2022-06-14 16:59:59', 84),
(66, 8, 1, '2022-06-14 17:01:16', 83),
(68, 9, 1, '2022-06-14 17:15:52', 83),
(69, 9, 1, '2022-06-14 17:15:59', 84);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastname` varchar(40) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `img_profil` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `lastname`, `firstname`, `img_profil`, `description`, `role`) VALUES
(7, 'heri@test.com', '$2b$10$D6bMlhzGKGDW.F8ZSqwyu.vBHaRHsWc175AasQljLMj6lWet6gnZu', 'VALISOA', 'Herimalala', 'profile4329-1655213852925.png', 'Changer ma description', 1),
(8, 'gerard@test.com', '$2b$10$tRk/j2xhp9RxamyaBJV6POafIiNdpWyrRXqqUMPwTHO.XdZww2BD6', 'DEPARDIEU', 'Gérard', NULL, NULL, 0),
(9, 'pierre@richard.com', '$2b$10$EEf/sQAxJMsAFl9So71R0eJNEPLwHDqx7ODCi64gjCp8KvS6mDzPC', 'RICHARD', 'Pierre', 'profile9048-1655219742958.jpg', NULL, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PostUser` (`user`);

--
-- Index pour la table `post_comment`
--
ALTER TABLE `post_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `PostcommentUser` (`user`);

--
-- Index pour la table `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `PostlikeUser` (`user`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT pour la table `post_comment`
--
ALTER TABLE `post_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `post_like`
--
ALTER TABLE `post_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `PostUser` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post_comment`
--
ALTER TABLE `post_comment`
  ADD CONSTRAINT `PostcommentUser` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_comment_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `post_like`
--
ALTER TABLE `post_like`
  ADD CONSTRAINT `PostlikeUser` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_like_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
