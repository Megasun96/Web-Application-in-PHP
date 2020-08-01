-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 30, 2020 at 11:00 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retrogaming`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

DROP TABLE IF EXISTS `kategorije`;
CREATE TABLE IF NOT EXISTS `kategorije` (
  `KATEGORIJA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAZIV_KATEGORIJE` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `slika` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KATEGORIJA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`KATEGORIJA_ID`, `NAZIV_KATEGORIJE`, `link`, `slika`) VALUES
(1, 'ZX Spectrum', 'zx.php', 'ZX Spectrum.png'),
(2, 'RETRO_GAMING_SERBIA', 'index.php', 'RGS.png'),
(3, 'Commodore', 'commodore.php', 'Commodore 64.png'),
(4, 'Terminator', 'terminator.php', 'Teminator 2.png'),
(5, 'Sega', 'sega.php', 'Sega Mega Drive 2.png'),
(6, 'Sony', 'sony.php', 'Sony Playstation.png');

-- --------------------------------------------------------

--
-- Table structure for table `komentari`
--

DROP TABLE IF EXISTS `komentari`;
CREATE TABLE IF NOT EXISTS `komentari` (
  `KOMENTAR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SADRZAJ_KOMENTARA` text COLLATE utf8_unicode_ci NOT NULL,
  `VREME` timestamp NOT NULL DEFAULT current_timestamp(),
  `ID_KORISNIKA` int(11) NOT NULL,
  `ID_KATEGORIJE` int(11) NOT NULL,
  PRIMARY KEY (`KOMENTAR_ID`),
  KEY `ID_KORISNIKA` (`ID_KORISNIKA`),
  KEY `ID_KATEGORIJE` (`ID_KATEGORIJE`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `komentari`
--

INSERT INTO `komentari` (`KOMENTAR_ID`, `SADRZAJ_KOMENTARA`, `VREME`, `ID_KORISNIKA`, `ID_KATEGORIJE`) VALUES
(32, 'Predobra je, to je igra za moje dece\r\n', '2020-07-30 21:39:11', 2, 1),
(33, 'Odličan', '2020-07-30 21:39:30', 2, 5),
(34, 'Valentina, molim te da mi kupiš za mene, mama.', '2020-07-30 21:40:44', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
CREATE TABLE IF NOT EXISTS `korisnici` (
  `KORISNIK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `IME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `PREZIME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` tinyint(3) NOT NULL,
  PRIMARY KEY (`KORISNIK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`KORISNIK_ID`, `USERNAME`, `PASSWORD`, `IME`, `PREZIME`, `EMAIL`, `STATUS`) VALUES
(1, 'admin', '0354c4e41c13462ae44a51065665fa3a', 'Stefan', 'Dimitrijević', 'stefdimitrovski96@gmail.com', 1),
(2, 'Valentina1925', '63876d97d43cb8b26cf3516fedc35b03', 'Valentina', 'Dimitrijević-Mičkal', 'valentinusdimitrovska@seznam.cz', 1),
(3, 'Viktor1925', 'd20d08b7ae3b39babfe2e99a0b022fcd', 'Viktor', 'Mičkal', 'viktormičkal@seznam.cz', 1),
(4, 'Violeta1925', '698d51a19d8a121ce581499d7b701668', 'Violeta', 'Dimitrijević', 'violeta.viki1@gmail.com', 0),
(5, 'Ilo1925', 'bed4b2a1da9c795bf3ecbfbecefa4eb1', 'Ilo', 'Dimitrijević', 'ilo.dimitrijevic42@gmail.com', 0),
(8, 'Verka1925', 'b59c67bf196a4758191e42f76670ceba', 'Verka', 'Jarić', 'verkajaric@seznam.cz', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vesti`
--

DROP TABLE IF EXISTS `vesti`;
CREATE TABLE IF NOT EXISTS `vesti` (
  `VEST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NASLOV_VESTI` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `SADRZAJ_VESTI` text COLLATE utf8_unicode_ci NOT NULL,
  `ID_KATEGORIJE` int(11) NOT NULL,
  `slike` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`VEST_ID`),
  KEY `ID_KATEGORIJE` (`ID_KATEGORIJE`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vesti`
--

INSERT INTO `vesti` (`VEST_ID`, `NASLOV_VESTI`, `SADRZAJ_VESTI`, `ID_KATEGORIJE`, `slike`) VALUES
(7, '<h1>ZX Spectrum</h1>', '\n<p>ZX Spectrum je računar koji je napravila firma Sinclair Research Ltd. U Ujedinjenom Kraljevstvu 1982. godine. Prvi naziv je glasio ZX82, međutim kasnije mu je ime promenjeno u ZX Spectrum, što se odnosilo na njegove sposobnosti prikazivanja boja na ekranu, za razliku od njegovog prethodnika, ZX81.\nZX Spectrum je prvi komercijalni računar za kućnu upotrebu na britanskom tržištu, kao što je to bio Commodore 64 na američkom tržištu, i uopšte mu je predstavljao glavnog konkurenta na tržištu računara osamdesetih.</p>\n<p>\nZX Spectrum je računar koji je napravila firma Sinclair Research Ltd. u Ujedinjenom Kraljevstvu 1982. godine. Prvi naziv je glasio ZX82, međutim kasnije mu je ime promenjeno u ZX Spectrum, što se odnosilo na njegove sposobnosti prikazivanja boja na ekranu, za razliku od njegovog prethodnika, ZX81.\nZX Spectrum je prvi komercijalni računar za kućnu upotrebu na britanskom tržištu, kao što je to bio Commodore 64 na američkom tržištu, i uopšte mu je predstavljao glavnog konkurenta na tržištu računara osamdesetih. \nSpektrumov hardver je dizajnirao Ričard Altvaser iz kompanije Sinclair research. Za spoljašnji izgled je bio zadužen dizajner Rik Dikinson. Pokretao ga je procesor Zilog Z80 brzine 3.5 Mhz. Prvi model je pravljen u dve verzije, sa 16 ili 48 kb RAM memorije. Obe su imale po 16 kb ROM memorije.</p>\n<p>Spektrum je imao video izlaz preko koga se povezivao sa standardnim televizorom. Tekst se prikazivao u 32 vrste i 24 reda. Korišćen je Spektrumov skup znakova, a postojala je i mogućnost za izbor do 8 boja teksta, kao i za odabir posvetljavanja teksta u dva nivoa. Rezolucija ekrana je bila 256x192 piksela. Spektrum je imao poseban način rada sa bojama. On je, da bi sačuvao memoriju, boje čuvao odvojeno od mreže piksela - svaki deo ekrana veličine 8x8 piksela imao je jedinstveno određenu boje ispisa i pozadine (16 za jedno, 16 za drugo, što se smeštalo u jedan bajt), što se nazivalo „atributom“. Međutim, ovo nije predstavljalo najsrećnije rešenje, jer je dolazilo do jakog mešanja boja, naročito u video-igrama.</p>\n<img src=\"slike/zx1.jpg\" width=\"284\" height=\"177\"  alt=\"x\"/>\n<p>Spektrumov zvuk se reprodukovao preko ugrađenog zvučnika, koji je imao jedan kanal sa deset oktava i tonova (iz bejzika). Zapravo, elektronika koja je pokretala zvučnik je mogla da odašilje samo pravougaone zvučne signale, a zvučnik je imao izvesnu inerciju, što je kasnije korišćeno i za dobijanje semplovanih zvukova. Računar je imao i mogućnost povezivanja sa kasetofonom i posebnim uređajem zvanim „mikrodrajv“ radi čuvanja podataka na običnim audio-kasetama\n</p>\n\n\n\n<table width=\"600\" border=\"1\" cellspacing=\"2px\" cellpadding=\"3px\">\n  <tr>\n    <th height=\"41\" colspan=\"2\" scope=\"col\"><img src=\"slike/SpectrumPlus.jpg\" width=\"590\" height=\"368\"  alt=\"x\"/> </th>\n    </tr>\n  <tr>\n    <th colspan=\"2\" scope=\"col\">Technical specs </th>\n    </tr>\n  <tr>\n    <th width=\"182\" scope=\"row\">CPU</th>\n    <td width=\"286\">Zilog Z80A, 3.54 MHz</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">ROM</th>\n    <td>16 KB</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">RAM</th>\n    <td>48 KB </td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Text mode</th>\n    <td>32 x 22 </td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Graphical mode</th>\n    <td>256 X 192</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Colours</th>\n    <td>8</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Sound</th>\n    <td>1 channel, 5 octaves</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Storage</th>\n    <td>External tape </td>\n  </tr>\n</table>\n<br>\n<h2>Iz RGS ugla</h2>\n<p>Spektrum je bio računar koji je nastao u Evropi, tako da je mogao lakse da se donese u Jugoslaviju. Spektrum je i bio prvi kućni računar iz inostranstva koje je mogao da se priušti, pre toga je postojao računar Galaxy, domaće proizvodnje koji je mogao da se naruči iz istoimenog časopisa. Jedna od boljih strana Spektruma jeste ta sto on za rayliku od Komodor računara nije zahtevao specijalan čitač audio kaseta, vec ste mogli da ga prikačite na bilo koji kasetofon sa audio izlazom.</p>\n<p>\nKako je piraterija vladala i presnimavanje kaseta bilo u punom jeku nalaženje video igrica nije bio nikakav problem. Neki od domaćih programera su takođe su programirali i dizajnirali igre za ovaj računar. Na njega je mogao da se priključi bilo koji dzojstik sa devetopinskim portom, ali mana je bila sto se za računar morali da kupujete dotatni adapter na koji bi ste priključili na računar, a u koji bi se priključili dzojstici.</p>\n\n<strong>Najpopularnije igre na ZX Spectrum-u</strong> <br>\n	\n    \n<ul>   \n	<li> Elite – Firebird Games </li>\n	<li>R-Type – Electric Dreams Software</li>\n	<li>Chuckie Egg - A\'n\'F Software</li>\n	<li>Manic Miner - Bug-Byte Software Ltd </li>\n	<li>Knight Lore - Ultimate Play The Game</li>\n	<li>Back to Skool - Microsphere </li>\n	<li>Football Manager - Addictive Games Ltd</li>\n	<li>Lunar Jetman - Ultimate Play The Game </li>\n	<li>Horace Goes Skiing – Beam Software</li>\n	<li>Boulder Dash – Front Runner</li>\n    \n</ul>', 1, 'ZX Spectrum.png'),
(8, '<h1>Commodore 64</h1>', '<p>Predstavljen od strane firme Komodor Biznis Mašin (Commodore Business Machines) avgusta 1982. godine po ceni od 595 dolara, Komodor 64 je ponudio solidne zvučne i grafičke performanse u poređenju sa ondašnjim standardom. Tokom života Komodora 64 (između 1982. i 1993.) ukupna prodaja je premašila 22 miliona primeraka. Prema Ginisovoj knjizi rekorda, Komodor 64 još uvek ostaje naprodavaniji računar svih vremena.<p>\n\n<img src=\"slike/commodore1.jpg\" width=\"300\" height=\"199\"  alt=\"x\"/>\n<p>\nZa razliku od računara koji su bili distribuirani samo preko ovlašćenih posrednika, Komodor se prodavao i u prodavnicama sa igračkama. Računar se mogao direktno priključiti na televizor, dajući time mnogo draži običnih konzola za video-igre kao što je Atari 2600. malim hardverskim promenama pod nazivom Commodore 64C.</p>\n<img src=\"slike/commodore2.jpg\" width=\"450\" height=\"323\"  alt=\"x\"/>\n<br><br>\n<p>\nCommodore 1530 (C2N) Datasette (telećak podataka i kasete), bio je posvećen Commodore magnetna traka za skladištenje podataka uređaja. Koristeći kompaktnih kaseta kao mediju za skladištenje, ona pod uslovom jeftine skladištenje da Commodore je 8-bitni home / personalnih računara, pre svega preko PET, VIC-20, i C64.Fizički sličan model Commodore 1531 je napravljen za Commodore 16 i plus / 4 serija računara.</p>\n\n<strong>Najpopularnije igre na Commodore 64</strong>\n\n<ul>\n	<li>Elite</li>\n	<li>Project Firestart</li>\n	<li>Neuromancer</li>\n	<li> Last Ninja 3</li>\n	<li> M.U.L.E.</li>\n	<li> Creatures</li>\n	<li> Mayhem in Monsterland</li>\n	<li> BAT 2 – The Koshan Conspiracy</li>\n	<li> Pirates!</li>\n	<li> Test Drive 2</li>\n</ul>\n\" placeholder=\"Mozete upisati vest\">', 3, 'Commodore 64.png'),
(10, '<h1>Terminator 2</h1>', '\n<p>\nTerminator 2 (pravo ime konzola super Dizajn Ending-man BS-500 AS) je konzolu za video igre prodaje u Poljskoj, Srbiji, Hrvatskoj, Bugarskoj, Rumuniji, Bosni i Hercegovini, Albaniji, Indiji i Mađarske (gde je bio poznat kao Sargakazettas Nintendo - Nintendo sa žutim kertridža). Takođe je prodato u Španiji, a u Italiji, sa imenom \"top consolle\". Bilo je hardverska klon Nintendo Famicom.<p>\n<p>\nU ranim 1990, sistem Terminator 2 stekao masovnu popularnost u Istočnoj Evropi, verovatno zbog činjenice da je do kasnih 1990-ih nije bilo zvanični distributer Nintendo proizvoda u toj oblasti. The Terminator 2 konzole su masovno prodali po većini glavnih i manjih elektronskih prodavnica.\n\nOvo posebno Nintendo-klon bio izuzetno popularan u Poljskoj, Srbiji, Hrvatskoj, Bugarskoj, Rumuniji, Pakistana, Indije, Irana i Bosne, gde je stekao kultni status, a još uvek široko dostupna na aukcije sajtovima i buvljacima. Zbog ekonomskih ograničenja, četvrta generacija konzola kao što su Mega Drive ili SNES nisu bili popularni u ovim zemljama.Prethodna generacija ostala veoma popularna, posebno Terminator 2 koja je bila najuspešnija NSZ klon. Ona je ostavio trag u pop kulture i 1990-tih mladih, postavljajući se kao Antonomazija za 8-bitnom video igara, do tačke u kojoj više popularniji od originala.</p><p>\nTerminator 2, kao i većina poznatih Famicom klonova, bio kompatibilan sa 60-pin Famicom kertridža, a delimično kompatibilan sa nekim NSZ igara, koje se mogu igrali pomoću specijalnog konvertor. Original Nintendo igre nisu bili popularni međutim, zbog piraterije i besni nedostatak zvanično licenciranih proizvoda na tržištu. Većina igara prodatih sa i za sistem bili jeftini piratske kopije, proizvedeni uglavnom u Rusiji i Kini. Igre za Terminator 2 su široko dostupan u Istočnoj Evropi do danas, uglavnom o uličnih prodavaca i u malim prodavnicama igračaka.</p> <br>\n\n\n\n<table width=\"200\" border=\"1\" cellspacing=\"2px\" cellpadding=\"3px\">\n  <tr>\n    <th colspan=\"3\" scope=\"col\">Hardware specifications</th>\n    </tr>\n  <tr>\n    <th width=\"176\" scope=\"row\">Processor</th>\n    <td colspan=\"2\">8-bit MOS 6502 1.79 MHz</td>\n    </tr>\n  <tr>\n    <th rowspan=\"4\" scope=\"row\">Video</th>\n    <td width=\"149\">Clock</td>\n    <td width=\"133\">5.37 MHz</td>\n  </tr>\n  <tr>\n    <td>Resolution</td>\n    <td>256 x 240</td>\n  </tr>\n  <tr>\n    <td>Color Palette</td>\n    <td>25 on screen</td>\n  </tr>\n  <tr>\n    <td>Standard</td>\n    <td>NTSC (&quot;forced&quot; to PAL standard, 50 Hz refresh rate)<br>\n      Sound</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Sound</th>\n    <td>5-channel mono</td>\n    <td>1 channel noise<br>\n      1 PCM<br>\n      3 channels for sounds</td>\n  </tr>\n</table>\n<table class=\"strana\" border=\"1\" cellspacing=\"2px\" cellpadding=\"3px\">\n  <tr>\n    <td height=\"57\" colspan=\"2\"> <img src=\"slike/consolepirate_terminator8.jpg\" width=\"270\" height=\"251\"  alt=\"x\"/> </td>\n    </tr>\n  <tr>\n    <td colspan=\"2\">Super Design Ending-Man BS-500 AS</td>\n    </tr>\n  <tr>\n    <td width=\"123\">Manufacturer</td>\n    <td width=\"125\">?</td>\n  </tr>\n  <tr>\n    <td>Release date</td>\n    <td>1992 (EU)</td>\n  </tr>\n  <tr>\n    <td>Media type</td>\n    <td>ROM cartridge</td>\n  </tr>\n  <tr>\n    <td>Compatibility</td>\n    <td>Famicom cartridges and NES (with adapter)</td>\n  </tr>\n  <tr>\n    <td>Input</td>\n    <td>2 controller ports</td>\n  </tr>\n</table>\n<br><br>\n\n<img src=\"slike/terminator1.jpg\" width=\"230\" height=\"119\"  alt=\"c\"/>\n', 4, 'Teminator 2.png'),
(11, '<h1>Sega Mega</h1>', '\n<p>\nSega Genesis, poznat kao Mega Drive (Japanese: メ カ ト ラ イ フ Hepbern:? Mega Doraibu) u većini regiona van Severne Amerike, je 16-bitni konzola dom video igra koja je razvijena i prodala Sega preduzeća, Ltd Postanak je Sega je Treći konzola i naslednik Master Sistem. Sega prvi put objavljen konzolu kao Mega Drive u Japanu 1988. godine, nakon čega sledi Sjeverne Amerike debi pod Genesis Moniker 1989. U 1990., konzola je pušten kao Mega Drive Virgin Mastertronicova u Evropi, po Ozisoft u Australiji, i bi TEC igračka u Brazilu. U Južnoj Koreji je distribuiran biSamsung i bio prvi poznati kao super Gam * Boi i kasnije kao super Aladdin Boi.</p>\n<p>Dizajniran sa R & D tim pod nadzorom Hideki Sato i Masami Ishikava, Genesis hardver je prilagođen iz Sega je sistem 16. arkada odbora, usmerena na Motorola 68000 procesor kao glavnog procesora i Zilog Z80 kao sekundarni procesor.Sistem podržava biblioteku od preko 900 gamescreated i od Sege i velikim nizom nezavisnih izdavača i dati na ROM-based kaseta. Takođe možete igrati Master Sistem igre kada se instalira odvojeno prodala Snaga Base Converter.Geneza takođe koristi od brojnih periferija i nekoliko mrežnih servisa, kao i višestrukim prvi strana i trećih strana varijacijama konzole koja se fokusirala na proširuje svoju funkcionalnost.</p>\n<img src=\"slike/sega1.jpg\" width=\"429\" height=\"303\"  alt=\"x\"/>\n<p>U Japanu, Mega Drive nisu prošle dobro protiv svoje dve glavne konkurente, Nintendo Super Famicom i NECov PC Engine. Međutim, da je ostvario značajan uspeh u Severnoj Americi i Evropi, hvatanje većinu 16-bit tržišni udeo u nekoliko teritorija, uključujući SAD i Velikoj Britaniji. Doprinos za njen uspeh su njegova biblioteka arkadnih gameports, popularnost Postanje-ekskluzivni Sonic The Hedgehog serije, nekoliko franšiza popularni sportovi igra, i agresivnog marketinga mladih koji pozicionirana sistem kao kul konzole za adolescente. Iako Sega dominirali 16-bitni tržište u Severnoj Americi i Evropi, o oslobađanju Super Nintendo Entertainment Sistem dve godine nakon Postanje rezultirao žestokoj borbi za tržišni udeo u onim teritorijama koje je često nazivaju kao \"konzole rata\" od novinari i istoričari. Kako ovaj konkurs skrenuo veću pažnju na video igara industrije u javnosti, Geneza i nekoliko njegovih najviše profila igara privukla značajnu pravnu nadzor na pitanjima koja se tiču obrnuti inženjering i video igre nasilje. kontroverze koja okružuje nasilne naslove kao što su Night Trap Mortal i Kombatled Sega da stvori Videogame Rating Savet, prethodnica theEntertainment Softvare Rating Board.\n</p>\n<p>\nDo kraja 1994. godine, kada nova generacija 32-bitnim konzolama pružene sistem tehnološki zastareo, Postanje je prodala 29 miliona jedinica širom sveta, a do kraja svog života Sega je prodao oko 40 miliona jedinica.Konzola i njeni igre i dalje biti popularan među navijačima, kolekcionara, Video Game Music fanove, i emulacije entuzijasta. Od 2014. godine, licencirani ponovljenih izdanja treće strane na konzoli se još uvek proizvodi AtGames u Severnoj Americi, Evropi, Blaže i Tec Toi godine u Brazilu. Takođe nekoliko indie programeri igra nastavi da proizvodi igre za njega. Mnoge igre su takođe ponovo pušten u kompilacije za novijim konzole i ponudio za preuzimanje na raznim Internet servise kao što su Vii Virtual Console, Ksbok Live Arcade, PlaiStation Netvork i Steam.Genesis je nasledio Sega Saturn.\n</p>\n\n<h2>Iz RGS ugla</h2>\n<p>Sticajem nesrećnih okolnosti a pre svega sankcija i činjenice da je na ovim prostorima igranje na konzolama dugo bilo gotovo nepoznat pojam, Sega Mega Drive 2 je kod nas stigao tek sredinom devedesetih, dok je bio na vrhuncu svoje popularnosti. Zahvaljujući agresivnoj reklami ali i svojim neospornim kvalitetima, konzola je ubrzo osvojila igrače i ušunjala se u mnoge domove. Igraonice u kojima ste mogli da odigrate mnogobrojne naslove (takozvane Segateke) počele su da niču širom zemlje, a samim tim sistem je dobio prostor u domaćim časopisima posvećenim igrama, čak i u onima koji su se do tada isključivo bavili kompjuterima.</p>\n<p>\nDodatnu popularnost SMD2 je dobio kroz kviz »Sega klinci« koji se dosta dugo prikazivao na Pinku, tada ubedljivo najgledanijoj domaćoj televiziji. Iako su mnoge igre stekle kultni status, titulu neprikosnovenog kralja sigurno je držao neverovatno popularni Mortal Kombat serijal.</p>\n\n\n<p>\nVelika prednost Sege bio je džojped i to pre svega verzija sa 6 tastera koja je dolazila uz drugu verziju konzole. Za razliku od SNES-a, on je bio savršeno pogodan za igre svih žanrova i do dan danas važi za jedan od najbolje dizajniranih igračkih kontrolera.\nNa našem prostoru su se takođe pojavile i bootleg kasetice, tačnije ilegalne kopije originalnih kasetica, koje su bile dosta jeftinije, ali takodje nisu bile tako idealne. Pojedine kasetice sui male vise usnimljenih igrica, ali pojedine nisu bile savrsene. Imale su lose slike na kaseticama, a neke i slike drugih igrica. Tako da moyete kupiti jednu igru, a u stvari dobijete sasvim drugu…\n</p>\n<br>\n\n<table class=\"strana\" border=\"1\" cellspacing=\"2px\" cellpadding=\"3px\">\n  \n  <tr>\n    <th height=\"52\" colspan=\"2\" scope=\"col\"><img src=\"slike/sega_side.jpg\" width=\"270\" height=\"202\"  alt=\"x\"/></th>\n    </tr>\n  <tr>\n    <th colspan=\"2\" scope=\"col\">Technical Specs</th>\n    </tr>\n  <tr>\n    <th width=\"115\" scope=\"row\">CPU</th>\n    <td width=\"133\">16-bit Motorolla 68000 (7.68MHz)</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">RAM</th>\n    <td>64KB</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Graphics</th>\n    <td>Dedicated graphics processor</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Colors</th>\n    <td>512 (64 on screen)</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Sprites</th>\n    <td>80</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Resolution</th>\n    <td>320x224 pixels</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Sound</th>\n    <td>6 channel stereo.  TI 76489 PSG, Yamaha YM 2612 FM chips </td>\n  </tr>\n</table>\n\n<p><strong>29. oktobra 1988.</strong> Megadrive je predstavljen u Japanu, zajedno sa 4 igre – Super Thunderblade, Alex Kidd and the Enchanted Castle, Altered Beast i Space Harrier 2. Taktika se ovaj put promenila, tako da Sega više nije čekala potez svog velikog rivala Nintenda ili bilo kog drugog konkurenta, već je odlučila da prva pridobije igrače na svoju stranu. Međutim, početak nije bio slavan. Iako je konzola bila tehnički daleko superiornija i od NES-a i od PC Engine-a, prodaja u matičnoj zemlji je bila veoma slaba.</p>\n\n<p><strong>14. avgusta 1989.</strong> sistem je konačno predstavljen i u Severnoj Americi gde je u početku prodavan za 190 dolara, i to sa ogromnim uspehom. Američki igrači znali su mnogo više da cene očiglednu tehničku superiornost sistema i sjajnu ponudu akcionih i sportskih igara.</p>\n<img src=\"slike/sega2.jpg\" width=\"300\" height=\"199\"  alt=\"x\"/>\n<p>\nNa kraju, <strong>30. novembra 1990.</strong> konzola je stigla u Evropu i to kao nova, poboljšana verzija originalnog sistema, pod imenom Sega Mega Drive 2. S obzirom da je ovo i najpoznatiji i najpopularniji naziv konzole kod nas ali i šire, njega ćemo koristiti u daljem tekstu, kao što to činimo i na čitavom sajtu.\nPrve godine za Segu su bile veoma teške, jer je 8-bitni NES bio na vrhuncu slave, a Sega je pokušavala da povrati poverenje igrača u sopstvene proizvode. Ovoga puta su sklopljeni ugovori sa velikim brojem najpoznatijih softverskih kompanija kojim su se one obavezale da izrađuju igre za SMD2, kako bi se izbegao problem sa ponudom naslova koji je uništio Master System.</p>\n<p>\nSega Mega Drive 2 je najpoznatija, tj. najprodavanija verzija konzole za koju i nas vezuju najlepša sećanja\nI polako, stvari su krenule na bolje. Agresivna i veoma kreativna marketinška kampanja i pre svega kvalitetan izbor igara, definitivno su napravili mesta za Sega Mega Drive 2 u Severnoj i Južnoj Americi ali i u Evropi, gde će konzola vladati bez prave konkurencije više od pola decenije. U matičnom Japanu, stvari se ipak nisu micale sa mrtve tačke. Sega nije mnogo marila za RPG, kao što je to učinio Nintendo, ali mlak prijem na ovom tržištu nimalo nije mogao da poljulja svetsku popularnost koju je konzola postigla. </p>\n\n\n<strong>Najpopularnije igre na Sega Megadrajvu:</strong>\n<ul>\n	<li>Sonic 2</li>\n 	<li>Phantasy Star 4</li>\n 	<li>Streets Of Rage 2</li>\n	 <li>Castlevania: Bloodlines</li>\n 	<li>Comix Zone</li>\n 	<li>Quack Shot</li>\n	 <li>Phantasy Star II</li>\n 	<li>Shining Force II</li>\n 	<li>Gunstar Heroes</li>\n 	<li>Vectorman</li>\n</ul>', 5, 'Sega Mega Drive 2.png'),
(12, '<h1>Sony Playstation</h1>', '\n<p>Plaistation (zvanično skraćeno PS i nezvanično, ali poznatiji kao PS1) razvijen i nudi Soni Computer Entertainment.Konzola je pušten u Japanu 3. decembra 1994., , a objavljen je u Severnoj Americi i Evropi u septembru 1995 Plaistation bila prva na PlaiStation serije konzola i handheld uređaje igre. Kao deo pete generacije od igranja, prvenstveno takmičila sa Nintendo 64 i Sega Saturn. Godine 2000, \"tanak\" verzija redizajniranu zove PSone pušten, zamenjujući originalnu sivu konzolu i imenovan na odgovarajući način da se izbegne zabuna sa njegovog pravnog naslednika, PlaiStation 2.</p><p>\nPlaistation bila prva \"Computer Entertainment platforma\" za isporuku 100 miliona jedinica, koja je postigla 9 godina i 6 meseci nakon prvobitnog lansiranja Reakcije na konzoli na lansiranje bila povoljna.; kritičari pohvalili konzolu za kvalitet svojih 3-dimensional grafikom. ThenMicrosoft predsednik, Bil Gejts, poželjna konzolu na Soni na konkurenciju iz SEGA je Saturn, rekavši \"naša igra dizajner voli Soni mašinu\". </p><p>\nNaslednik PlaiStation je PlaiStation 2 koji je kompatibilan i sa svojim prethodnikom iz koje može da igra skoro svaku PlaiStation igru. U poslednjih PSOne jedinica je prodato u zimu 2004. pre nego što je konačno prekida, za ukupno 102 miliona isporučenih od svog lansiranja 10 godina ranije. Igre za PlaiStation nastavili da prodaju sve dok Samsung prestala proizvodnja PlaiStation igara 31. marta 2006. godine - preko 11 godina nakon što je pušten, a manje od godinu dana pre debija na PlaiStation 3.</p>\n<p>\nBaš pred premijeru Playstationa 2, Sony je predstavio i novu, redizajniranu varijantu prvog Playstationa koju je krstio kao PlayStation One, ili skraćeno PSOne.\nU odnosu na standardni sivi PSX koji je zamenio, PSOne je vizuelno daleko atraktivniji i mnogo manjih dimenzija koje se mogu porediti sa kutijom za DVD naslove dvostruke dubine, što ga je učinilo daleko pogodnijim za prenošenje. Zbog nepostojanja hlađenja PSOne se mnogo više zagreva od stare varijante konzole, ali ima i daleko tiši, gotovo nečujan mehanizam za čitanje diskova. Uz PSOne Sony je opciono ponudio i i LCD displej od 4 inča, ali to ne znači da PSOne može da radi na baterije, već mu je dalje potrebno klasično strujno napajanje. Što se tiče softverskog dela on je ostao gotovo isti, osim što je BIOS redizajniran. Naravno, kompatibilnost sa starim igrama je 100%.\n</p>\n\n<h2>Iz RGS ugla</h2>\n<p>\nNažalost, zbog mnogo razloga koje smo već ko zna koliko puta navodili na ovom sajtu, igranje na konzolama kod nas postaje popularno tek sredinom devedesetih, gotovo isključivo zaslugom Sega Mega Drive 2 sistema. Od 1996. i Playstation dolazi u našu zemlju i automatski stiče ogromnu popularnost zbog svojih fenomenalnih tehničkih karakteristika i kvaliteta igara. Problem nije predstavljala ni prilično visoka cena sistema – naime, zahvaljujući mod čipovima konzole su bile u stanju da čitaju igre iz svih regiona kao i kopirane diskove, što je za naše siromašno tržište bilo i najbitnije.</p>\n\n<table class=\"strana\" border=\"1\" cellspacing=\"2px\" cellpadding=\"3px\">\n  <tr>\n    <th height=\"28\" colspan=\"2\" scope=\"col\"><img src=\"slike/sony_side.jpg\" width=\"270\" height=\"101\"  alt=\"x\"/> </th>\n    </tr>\n  <tr>\n    <th colspan=\"2\" scope=\"row\">Technical specifications</th>\n    </tr>\n  <tr>\n    <th scope=\"row\">CPU</th>\n    <td>CPU: 32-bit RISC (33.8688 MHz)</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">RAM</th>\n    <td>2 MB main, 1 MB video</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Graphics</th>\n    <td>3D Geometry Engine, with 2D rotation, scaling, transparency and 		fading, and 3D texture mapping and shading</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Colors</th>\n    <td>16.7 million</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Sprites</th>\n    <td>4,000</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Polygons</th>\n    <td>180,000 per second (textured), 360,000 per second (flat-shaded)</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Resolution</th>\n    <td> 256×224 to 640×480 pixels</td>\n  </tr>\n  <tr>\n    <th scope=\"row\">Sound</th>\n    <td>16-bit, 24 channel PCM</td>\n  </tr>\n</table>\n<br>\n\n<img src=\"slike/soni1.jpg\" width=\"300\" height=\"255\"  alt=\"v\"/>\n\n\n<p> U naredne 3-4 godine PSX je bio možda i najpopularnija igračka platforma pa je gotovo nemoguće nabrojati sve one igre koje su ostavile velike trag. U tu elitnu grupu svakako spada Crash Bandicoot serijal, Gran Turismo 1-2, Tekken 1-3, Resident Evil serija, Final Fantasy VII-IX, Medal Of Honor i još mnoge, mnoge druge igre. Posebno treba pomenuti gotovo neverovatnu popularnost Konamijevih fudbalskih simulacija koje su se sa jednakom fanatičnošću igrale više od pola decenije – praktično je bilo nemoguće da uđete u igraonicu i na bar nekoliko ekrana ne vidite neku od mnogobrojnih igara iz ovog serijala.</p>\n<br>\n<strong>Najpopularnije igre za PlayStation</strong>\n<ul>\n<li>Final Fantasy VII</li>\n<li>Final Fantasy VIII</li>\n<li>Final Fantasy IX</li>\n <li>Chrono Cross</li>\n<li> Metal Gear Solid</li>\n<li>Tomb Raider</li>\n <li>Resident Evil Director’s Cut</li>\n<li>Tekken 3</li>\n<li>Gran Turismo 2</li>\n<li>Castlevania Symphony Of The Night</li>\n</ul>\n', 6, 'Sony Playstation.png');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentari`
--
ALTER TABLE `komentari`
  ADD CONSTRAINT `fk_komentari_kategorije1` FOREIGN KEY (`ID_KATEGORIJE`) REFERENCES `kategorije` (`KATEGORIJA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_komentari_korisnici1` FOREIGN KEY (`ID_KORISNIKA`) REFERENCES `korisnici` (`KORISNIK_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vesti`
--
ALTER TABLE `vesti`
  ADD CONSTRAINT `vesti_ibfk_1` FOREIGN KEY (`ID_KATEGORIJE`) REFERENCES `kategorije` (`KATEGORIJA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
