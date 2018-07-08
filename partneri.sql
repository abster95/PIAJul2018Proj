-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2018 at 04:07 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `partneri`
--

-- --------------------------------------------------------

--
-- Table structure for table `donacioni_ugovori`
--

CREATE TABLE `donacioni_ugovori` (
  `id` int(11) NOT NULL,
  `id_ugovora` int(11) NOT NULL,
  `opis` text NOT NULL,
  `kolicina` int(11) NOT NULL,
  `procenjena_vrednost` int(11) NOT NULL,
  `proecenjeni_tip` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kompanija`
--

CREATE TABLE `kompanija` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `adresa` varchar(255) NOT NULL,
  `grad` varchar(255) NOT NULL,
  `postanski_kod` varchar(20) NOT NULL,
  `drzava` varchar(255) NOT NULL,
  `ziro_racun` varchar(20) NOT NULL,
  `pib` varchar(20) NOT NULL,
  `logo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kontakti_kompanije`
--

CREATE TABLE `kontakti_kompanije` (
  `id_kontakta` int(11) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `id_kompanije` int(11) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `mobilni` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) NOT NULL,
  `ime` varchar(60) NOT NULL,
  `prezime` varchar(60) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `korisnicko_ime` varchar(60) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `pol` tinyint(1) NOT NULL,
  `rodjendan` date NOT NULL,
  `slika` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `tip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `ime`, `prezime`, `mail`, `korisnicko_ime`, `lozinka`, `pol`, `rodjendan`, `slika`, `linkedin`, `tip`) VALUES
(3, 'test', 'test', 'test', 'test', 'witcher1', 0, '2018-07-12', NULL, NULL, 1),
(4, 'nekki', 'jado', 'askjdaksjdh', 'aosdkoaskd', '123456789', 0, '2018-07-09', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oglas_kompanije`
--

CREATE TABLE `oglas_kompanije` (
  `id` int(11) NOT NULL,
  `id_kompanija` int(11) NOT NULL,
  `id_korisnika` int(11) NOT NULL,
  `naslov` varchar(50) NOT NULL,
  `sadrzaj` text NOT NULL,
  `posao` tinyint(1) NOT NULL,
  `praksa` tinyint(1) NOT NULL,
  `datum_ubacivanja` date NOT NULL,
  `fajl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paketi_tipovi`
--

CREATE TABLE `paketi_tipovi` (
  `id` int(11) NOT NULL,
  `naziv_tipa` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paketi_tip_veza`
--

CREATE TABLE `paketi_tip_veza` (
  `id` int(11) NOT NULL,
  `id_tipa_paketa` int(11) NOT NULL,
  `id_paketa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paket_osnovne`
--

CREATE TABLE `paket_osnovne` (
  `id` int(11) NOT NULL,
  `naziv` varchar(60) NOT NULL,
  `vrednost` int(11) NOT NULL,
  `trajanje_ugovora` int(11) NOT NULL,
  `maksimalan_broj_kompanija` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `placeni_ugovor`
--

CREATE TABLE `placeni_ugovor` (
  `id` int(11) NOT NULL,
  `id_kompanije` int(11) NOT NULL,
  `faktura_poslata` tinyint(1) NOT NULL,
  `isplata_poslata` tinyint(1) NOT NULL,
  `datum_placanja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `predavanja_kompanije`
--

CREATE TABLE `predavanja_kompanije` (
  `id` int(11) NOT NULL,
  `naziv_predavanja` varchar(60) NOT NULL,
  `id_kompanije` int(11) NOT NULL,
  `naslov` varchar(40) NOT NULL,
  `opis` text NOT NULL,
  `datum_odrzavanja` datetime NOT NULL,
  `sala` varchar(30) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `biografija_predavaca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `saradnici_veza`
--

CREATE TABLE `saradnici_veza` (
  `id` int(11) NOT NULL,
  `id_korisnik` int(11) NOT NULL,
  `id_kompanija` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_ugovora`
--

CREATE TABLE `status_ugovora` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stavka_paketa`
--

CREATE TABLE `stavka_paketa` (
  `id` int(11) NOT NULL,
  `naziv` varchar(60) NOT NULL,
  `opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stavka_paket_veza`
--

CREATE TABLE `stavka_paket_veza` (
  `id` int(11) NOT NULL,
  `id_paketa` int(11) NOT NULL,
  `id_stavke` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ugovor`
--

CREATE TABLE `ugovor` (
  `id` int(11) NOT NULL,
  `id_kompanije` int(11) NOT NULL,
  `id_statusa` int(11) NOT NULL,
  `datum_potpisivanja` date NOT NULL,
  `datum_isticanja` date NOT NULL,
  `id_paketa` int(11) NOT NULL,
  `komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donacioni_ugovori`
--
ALTER TABLE `donacioni_ugovori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_id` (`id_ugovora`);

--
-- Indexes for table `kompanija`
--
ALTER TABLE `kompanija`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kompanija_pib_uindex` (`pib`),
  ADD UNIQUE KEY `kompanija_ziro_racun_uindex` (`ziro_racun`),
  ADD UNIQUE KEY `kompanija_naziv_uindex` (`naziv`);

--
-- Indexes for table `kontakti_kompanije`
--
ALTER TABLE `kontakti_kompanije`
  ADD PRIMARY KEY (`id_kontakta`),
  ADD KEY `company_contacts_ibfk_1` (`id_kompanije`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`korisnicko_ime`);

--
-- Indexes for table `oglas_kompanije`
--
ALTER TABLE `oglas_kompanije`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`id_kompanija`),
  ADD KEY `user_id` (`id_korisnika`);

--
-- Indexes for table `paketi_tipovi`
--
ALTER TABLE `paketi_tipovi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paketi_tip_veza`
--
ALTER TABLE `paketi_tip_veza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_package_type` (`id_tipa_paketa`),
  ADD KEY `id_package` (`id_paketa`);

--
-- Indexes for table `paket_osnovne`
--
ALTER TABLE `paket_osnovne`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `placeni_ugovor`
--
ALTER TABLE `placeni_ugovor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_id` (`id_kompanije`);

--
-- Indexes for table `predavanja_kompanije`
--
ALTER TABLE `predavanja_kompanije`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`id_kompanije`);

--
-- Indexes for table `saradnici_veza`
--
ALTER TABLE `saradnici_veza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_korisnik`),
  ADD KEY `id_company` (`id_kompanija`);

--
-- Indexes for table `status_ugovora`
--
ALTER TABLE `status_ugovora`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stavka_paketa`
--
ALTER TABLE `stavka_paketa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stavka_paket_veza`
--
ALTER TABLE `stavka_paket_veza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_package` (`id_paketa`),
  ADD KEY `id_item` (`id_stavke`);

--
-- Indexes for table `ugovor`
--
ALTER TABLE `ugovor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`id_kompanije`),
  ADD KEY `id_status` (`id_statusa`),
  ADD KEY `id_package` (`id_paketa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donacioni_ugovori`
--
ALTER TABLE `donacioni_ugovori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kompanija`
--
ALTER TABLE `kompanija`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kontakti_kompanije`
--
ALTER TABLE `kontakti_kompanije`
  MODIFY `id_kontakta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oglas_kompanije`
--
ALTER TABLE `oglas_kompanije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paketi_tipovi`
--
ALTER TABLE `paketi_tipovi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paketi_tip_veza`
--
ALTER TABLE `paketi_tip_veza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paket_osnovne`
--
ALTER TABLE `paket_osnovne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `placeni_ugovor`
--
ALTER TABLE `placeni_ugovor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `predavanja_kompanije`
--
ALTER TABLE `predavanja_kompanije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saradnici_veza`
--
ALTER TABLE `saradnici_veza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_ugovora`
--
ALTER TABLE `status_ugovora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stavka_paketa`
--
ALTER TABLE `stavka_paketa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stavka_paket_veza`
--
ALTER TABLE `stavka_paket_veza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ugovor`
--
ALTER TABLE `ugovor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donacioni_ugovori`
--
ALTER TABLE `donacioni_ugovori`
  ADD CONSTRAINT `donacioni_ugovori_fk_1` FOREIGN KEY (`id_ugovora`) REFERENCES `ugovor` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kontakti_kompanije`
--
ALTER TABLE `kontakti_kompanije`
  ADD CONSTRAINT `kontakti_kompanije_ibfk_1` FOREIGN KEY (`id_kompanije`) REFERENCES `kompanija` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oglas_kompanije`
--
ALTER TABLE `oglas_kompanije`
  ADD CONSTRAINT `oglas_kompanije_fk_1` FOREIGN KEY (`id_kompanija`) REFERENCES `kompanija` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oglas_kompanije_fk_2` FOREIGN KEY (`id_korisnika`) REFERENCES `korisnici` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paketi_tip_veza`
--
ALTER TABLE `paketi_tip_veza`
  ADD CONSTRAINT `paketi_tip_veza_fk_1` FOREIGN KEY (`id_tipa_paketa`) REFERENCES `paketi_tipovi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paketi_tip_veza_fk_2` FOREIGN KEY (`id_paketa`) REFERENCES `paket_osnovne` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `placeni_ugovor`
--
ALTER TABLE `placeni_ugovor`
  ADD CONSTRAINT `placeni_ugovor_fk_1` FOREIGN KEY (`id_kompanije`) REFERENCES `ugovor` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `predavanja_kompanije`
--
ALTER TABLE `predavanja_kompanije`
  ADD CONSTRAINT `predavanja_kompanije_fk_1` FOREIGN KEY (`id_kompanije`) REFERENCES `kompanija` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saradnici_veza`
--
ALTER TABLE `saradnici_veza`
  ADD CONSTRAINT `saradnici_veza_fk_1` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnici` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saradnici_veza_fk_2` FOREIGN KEY (`id_kompanija`) REFERENCES `kompanija` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stavka_paket_veza`
--
ALTER TABLE `stavka_paket_veza`
  ADD CONSTRAINT `stavka_paket_veza_fk_1` FOREIGN KEY (`id_paketa`) REFERENCES `paket_osnovne` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stavka_paket_veza_fk_2` FOREIGN KEY (`id_stavke`) REFERENCES `stavka_paketa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ugovor`
--
ALTER TABLE `ugovor`
  ADD CONSTRAINT `ugovor_fk_1` FOREIGN KEY (`id_kompanije`) REFERENCES `kompanija` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ugovor_fk_2` FOREIGN KEY (`id_statusa`) REFERENCES `status_ugovora` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ugovor_fk_3` FOREIGN KEY (`id_paketa`) REFERENCES `paket_osnovne` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
