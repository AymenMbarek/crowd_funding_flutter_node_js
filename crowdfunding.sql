-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 08 jan. 2024 à 19:44
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `crowdfunding`
--

-- --------------------------------------------------------

--
-- Structure de la table `cagnotte`
--

CREATE TABLE `cagnotte` (
  `nom` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `photo_url` text DEFAULT NULL,
  `data_de_creation` varchar(45) DEFAULT NULL,
  `idutilisateur` int(11) DEFAULT NULL,
  `idcatégories` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cagnotte`
--

INSERT INTO `cagnotte` (`nom`, `description`, `prix`, `photo_url`, `data_de_creation`, `idutilisateur`, `idcatégories`, `id`) VALUES
('cagnotte 2 ', NULL, 20000, NULL, NULL, 2, 2, 1),
('Ma Cagnotte Testtttt', 'Description de ma cagnotte testttt', 50, NULL, NULL, NULL, NULL, 2),
('Ma Cagnotte', 'Description de ma cagnotte', 50, NULL, NULL, NULL, NULL, 3),
('ttt', 'tt', 23, 'test', NULL, 23, 23, 4),
('Ma Cagnotte Testtttt', 'Description de ma cagnotte testttt', 50, NULL, NULL, NULL, NULL, 5),
('Ma Cagnotte Testtttt', 'Description de ma cagnotte testttt', 50, NULL, NULL, NULL, NULL, 6),
('Ma Cagnotte Testtttt', 'Description de ma cagnotte testttt', 50, NULL, NULL, NULL, NULL, 7),
('te', 'te', 234, NULL, NULL, NULL, NULL, 8),
('test12', 'test12', 250.2, NULL, NULL, NULL, NULL, 9);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nom_Categories` varchar(45) DEFAULT NULL,
  `id_cagnotte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom_Categories`, `id_cagnotte`) VALUES
(1, 'des dons', 1),
(2, 'Sante', 2),
(3, 'technologie', 3);

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `montant` float DEFAULT NULL,
  `numero_carte` int(11) DEFAULT NULL,
  `data_création` date DEFAULT NULL,
  `idutilisateur` int(11) DEFAULT NULL,
  `idcagnotte` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`montant`, `numero_carte`, `data_création`, `idutilisateur`, `idcagnotte`, `id`) VALUES
(23, 23, '2024-01-17', 23, 25, 1),
(12, 11221122, '2024-01-09', 2, 0, 2),
(NULL, 23, '2024-01-09', 2, 23, 3),
(50, 1234, NULL, NULL, NULL, 4),
(234, 11221122, NULL, NULL, NULL, 5),
(22, 22113311, NULL, NULL, NULL, 6),
(50, 1234, NULL, NULL, NULL, 7),
(2341, 11001100, NULL, NULL, NULL, 8),
(250, 11221122, NULL, NULL, NULL, 9);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `cin` int(11) DEFAULT NULL,
  `Nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `mot_de_passe` varchar(45) DEFAULT NULL,
  `type_de_utilisateur` varchar(45) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `confirmermot_de_passe` varchar(45) DEFAULT NULL,
  `categorie` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`cin`, `Nom`, `prenom`, `mot_de_passe`, `type_de_utilisateur`, `adresse`, `telephone`, `email`, `confirmermot_de_passe`, `categorie`, `id`) VALUES
(12121, 'John', 'Doe', 'password123', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1234567890, 'salah', 'tounsi', '6504a5c3', 'administrateur', '123 Rue A, Ville ', 555123456, NULL, NULL, NULL, 2),
(1234567890, 'fatma', 'tozri', '7f53', 'donneur', '123 Rue B, Ville ', 555123498, NULL, NULL, NULL, 3),
(1234567890, 'mohamed', 'nafti', '4c3a', 'porteur de projet', '123 Rue C, Ville ', 555123478, NULL, NULL, NULL, 4),
(11111111, 'dark', 'dark', 'dark', NULL, NULL, NULL, NULL, NULL, NULL, 5),
(NULL, 'test', 'test', 'AZER', NULL, NULL, NULL, NULL, NULL, NULL, 6),
(NULL, 'aymen', 'aymen', 'aymen', NULL, NULL, NULL, NULL, NULL, NULL, 7);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cagnotte`
--
ALTER TABLE `cagnotte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cagnotte`
--
ALTER TABLE `cagnotte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
