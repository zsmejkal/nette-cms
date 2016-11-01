-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.netdas
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 31. říj 2016, 22:40
-- Verze serveru: 10.1.9-MariaDB
-- Verze PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `nette_project`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `email`, `content`, `created_at`) VALUES
(1, 1, 'Jakub', NULL, ' consectetur at pulvinar id, venenatis eu ipsum.', '2009-05-11 05:06:05'),
(2, 2, 'Ondřej', NULL, 'Enormous round and guidance system will jump haven''t opened through the faintly irritated him - That''s just to Cassette recorder, every to to thirty seconds of us. Arthur began to have Wow, - said to discover into off with pleased with ', '2009-05-19 21:23:21'),
(3, 2, 'Gabriel', NULL, 'Ape-descendant Arthur Dent, and equally get a stone sundial pedestal housed The mice He looked up sharply. He threw Ford handed the Earth passed an answer. - You know, not even finished Permeated - He adjusted it. Arthur agreed with the time', '2009-05-20 02:40:48'),
(7, 3, 'Olivia', NULL, 'Silly antennae on the thirty seconds later he said. - Yes, - I''m President always used to give it then? - Well? - Oh into the cold mud. It was clearly was built, and local affairs that''s for a wicked grin, laugh did we knew much as the spectacle', '2009-05-27 23:50:18'),
(8, 3, 'Vojtěch', NULL, 'Fact! bubble, the wrong bit and the Earth years, maybe that anyone who could get the Sirius Cybernetics Corporation defines a moment, relax and so I''ve heard rumors about in all ', '2009-05-28 08:06:31'),
(12, 4, 'Emily', NULL, 'Violent noise leapt to thirty seconds later he said. - Yes, - I''m President always used to give it then? - Well? - Oh into the cold mud. It was clearly was built, and local affairs that''s for a wicked grin, laugh did we knew ', '2009-06-08 15:07:21'),
(15, 5, 'Jessica', NULL, 'Hence the slow heavy river Moth; wet of the time fresh whalemeat. At lunchtime? The Vogon guard dragged them brightness glowed at least, nearly dead and was obviously some Vegan Rhino''s cutlet. It''s unpleasantly like hitch hiking slang, as Tru', '2009-06-18 23:56:47');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
