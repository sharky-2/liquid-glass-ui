-- ======================== Baza ========================
DROP DATABASE IF EXISTS prodajalna_avto;
CREATE DATABASE prodajalna_avto;
USE prodajalna_avto;

-- ======================== Prodajalna ========================
-- ===== Tabela: Lastnik ======
DROP TABLE IF EXISTS Lastnik;
CREATE TABLE Lastnik (
    id_lastnik INT AUTO_INCREMENT PRIMARY KEY,
    ime VARCHAR(50),
    priimek VARCHAR(50)
);

INSERT INTO Lastnik (ime, priimek) VALUES
('Janez', 'Novak'),
('Maja', 'Kranjc'),
('Luka', 'Zupančič'),
('Tina', 'Kos'),
('Peter', 'Horvat'),
('Alenka', 'Mlakar'),
('Žan', 'Vidmar'),
('Katarina', 'Erjavec'),
('Marko', 'Petrovčič'),
('Barbara', 'Kranjc'),
('Jure', 'Zupan'),
('Maja', 'Hribar'),
('Igor', 'Kovač'),
('Tina', 'Novak'),
('Luka', 'Vidmar'),
('Sara', 'Potočnik'),
('Nejc', 'Kos'),
('Aljaž', 'Mlakar'),
('Katarina', 'Rozman'),
('Rok', 'Medved'),
('Petra', 'Lesjak'),
('Žan', 'Turk'),
('Ana', 'Pintar');

-- ====== Tabela: Prodajalna ======
DROP TABLE IF EXISTS Prodajalna;
CREATE TABLE Prodajalna (
	id_prodajalna INT AUTO_INCREMENT PRIMARY KEY,
	ime VARCHAR(50),
	velikost FLOAT,
	lastnik_id INT,
	lokacija_id INT
);

INSERT INTO Prodajalna (ime, velikost, lastnik_id, lokacija_id) VALUES
('Porsche Inter Auto Ljubljana', 1200.0, 1, 1),  
('Avtohiša Vrtač Maribor', 850.0, 2, 2),           
('Avto Triglav Koper', 700.5, 3, 3),             
('AC Trobec Celje', 950.75, 4, 4),                  
('Avto Krka Novo mesto', 600.0, 5, 5),
('Avto Planet Ljubljana', 1100.0, 6, 1),
('Avto Center Murska Sobota', 780.0, 7, 2),
('Avto Maribor Servis', 920.25, 8, 3),
('Avto Dom Kranj', 640.5, 9, 4),
('Avto Servis Celje', 870.0, 10, 5),
('Avto Studio Ptuj', 730.75, 11, 1),
('Avto Servis Nova Gorica', 890.0, 12, 2),
('Avto Center Novo mesto', 660.0, 13, 3),
('Avto Hiša Ljubljana', 1050.5, 14, 4),
('Avto Servis Maribor', 715.0, 15, 5);    

ALTER TABLE Prodajalna
ADD COLUMN logo_url VARCHAR(255);

UPDATE Prodajalna SET logo_url = 'https://static2.mojedelo.com/Images/EmployerLogoFullPicture/9f4f4f5fc3ba46f4b8c4cb543183c169' WHERE id_prodajalna = 1;
UPDATE Prodajalna SET logo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgkBcsNHB8R56ybkwu9r5hBuRTiDcfFmn2cQ&s' WHERE id_prodajalna = 2;
UPDATE Prodajalna SET logo_url = 'https://www.parkvojaskezgodovine.si/wp-content/uploads/2017/02/triglav-logo-Converted.jpg' WHERE id_prodajalna = 3;
UPDATE Prodajalna SET logo_url = 'https://static2.mojedelo.com/Images/EmployerLogoFullPicture/0dd72b55fb0b42d0adeab6e2d0a32da6' WHERE id_prodajalna = 4;
UPDATE Prodajalna SET logo_url = 'https://img.mojaobcina.si/img/1/H_MAX_1024x768/12746_1725343624_avtokrka.jpg' WHERE id_prodajalna = 5;
UPDATE Prodajalna SET logo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREqCD1GrP8CL7ZcecpcAKGEV_N91mDEyD0yw&s' WHERE id_prodajalna = 6;
UPDATE Prodajalna SET logo_url = 'https://www.mojponudnik.si/wp-content/uploads/2023/12/AVS-avtocenter-RENT-A-CAR-ASISTENCA-servis-logo.jpg' WHERE id_prodajalna = 7;
UPDATE Prodajalna SET logo_url = 'https://avtoservis-mb.com/wp-content/uploads/2020/04/logo2.jpg' WHERE id_prodajalna = 8;
UPDATE Prodajalna SET logo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUbtTrbIDgtjHsrJ9-_k8z6gZG2Zh9SJPG4w&s' WHERE id_prodajalna = 9;
UPDATE Prodajalna SET logo_url = 'https://autopark.si/wp-content/uploads/2021/02/logo-autopark-sticky-black.png' WHERE id_prodajalna = 10;
UPDATE Prodajalna SET logo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw6oPffBm9nd-V5_24cBx2dvfF4nqE-Pypkg&s' WHERE id_prodajalna = 11;
UPDATE Prodajalna SET logo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEm1VNTRv9rYXqwHXWq65iRSdNpFnkm4dH1A&s' WHERE id_prodajalna = 12;
UPDATE Prodajalna SET logo_url = 'https://www.supernova-novomesto.si/fileadmin/_processed_/8/4/csm_avtopralnica-novo-mesto-logo_c4401c4f73.jpg' WHERE id_prodajalna = 13;
UPDATE Prodajalna SET logo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQODzMz4Wcg2QKEJSXI3NVY_jCihzGMR63W637bN3fbL1T2p17KRHtoc3xTRp2P1blTi88&usqp=CAU' WHERE id_prodajalna = 14;
UPDATE Prodajalna SET logo_url = 'https://avtoservis-mb.com/wp-content/uploads/2020/04/logo2.jpg' WHERE id_prodajalna = 15;

-- ====== Tabela: Lokacija ======
DROP TABLE if EXISTS Lokacija;
CREATE TABLE Lokacija (
    id_lokacija INT AUTO_INCREMENT PRIMARY KEY,
    ime VARCHAR(50),
    naslov VARCHAR(100),
    mesto VARCHAR(75),
    drzava VARCHAR(50)
);

INSERT INTO Lokacija (id_lokacija, ime, naslov, mesto, drzava) VALUES
(1, 'Ljubljana', 'Dunajska 1', 'Ljubljana', 'Slovenija'),
(2, 'Maribor', 'Glavni trg 5', 'Maribor', 'Slovenija'),
(3, 'Koper', 'Pristaniška 10', 'Koper', 'Slovenija'),
(4, 'Celje', 'Kidričeva 3', 'Celje', 'Slovenija'),
(5, 'Novo mesto', 'Seidlova 20', 'Novo mesto', 'Slovenija'),
(6, 'New York', '5th Avenue 101', 'New York', 'USA'),
(7, 'Berlin', 'Unter den Linden 15', 'Berlin', 'Germany'),
(8, 'Tokyo', 'Shibuya 2-24-12', 'Tokyo', 'Japan'),
(9, 'Paris', 'Champs-Élysées 50', 'Paris', 'France'),
(10, 'Sydney', 'George Street 300', 'Sydney', 'Australia'),
(11, 'Toronto', 'Queen Street 200', 'Toronto', 'Canada'),
(12, 'Moscow', 'Tverskaya 7', 'Moscow', 'Russia'),
(13, 'Rome', 'Via del Corso 45', 'Rome', 'Italy'),
(14, 'São Paulo', 'Avenida Paulista 1500', 'São Paulo', 'Brazil'),
(15, 'Cape Town', 'Long Street 22', 'Cape Town', 'South Africa'),
(16, 'Mexico City', 'Reforma 120', 'Mexico City', 'Mexico'),
(17, 'Amsterdam', 'Dam Square 10', 'Amsterdam', 'Netherlands'),
(18, 'Dubai', 'Sheikh Zayed Road 300', 'Dubai', 'UAE'),
(19, 'Seoul', 'Gangnam 3-9', 'Seoul', 'South Korea'),
(20, 'Singapore', 'Orchard Road 50', 'Singapore', 'Singapore'),
(21, 'Buenos Aires', 'Avenida Corrientes 900', 'Buenos Aires', 'Argentina'),
(22, 'Istanbul', 'Istiklal Caddesi 100', 'Istanbul', 'Turkey'),
(23, 'Hong Kong', 'Nathan Road 150', 'Hong Kong', 'China'),
(24, 'Bangkok', 'Sukhumvit 55', 'Bangkok', 'Thailand'),
(25, 'Copenhagen', 'Strøget 12', 'Copenhagen', 'Denmark'),
(26, 'Vienna', 'Mariahilfer Straße 5', 'Vienna', 'Austria'),
(27, 'Lisbon', 'Avenida da Liberdade 180', 'Lisbon', 'Portugal'),
(28, 'Athens', 'Ermou Street 25', 'Athens', 'Greece'),
(29, 'Oslo', 'Karl Johans gate 14', 'Oslo', 'Norway'),
(30, 'Helsinki', 'Aleksanterinkatu 10', 'Helsinki', 'Finland'),
(31, 'Stockholm', 'Drottninggatan 30', 'Stockholm', 'Sweden'),
(32, 'Melbourne', 'Collins Street 123', 'Melbourne', 'Australia'),
(33, 'Lima', 'Jirón de la Unión 200', 'Lima', 'Peru'),
(34, 'Kuala Lumpur', 'Jalan Bukit Bintang 8', 'Kuala Lumpur', 'Malaysia'),
(35, 'Manila', 'Roxas Boulevard 5', 'Manila', 'Philippines');

-- ======================== Osebje ========================
-- ====== Tabela: Zaposleni ======
DROP TABLE if EXISTS Zaposleni;
CREATE TABLE Zaposleni (
	id_zaposlen INT AUTO_INCREMENT PRIMARY KEY,
	ime VARCHAR(50),
	priimek VARCHAR(50),
	pozicija VARCHAR(50)
);

INSERT INTO Zaposleni (ime, priimek, pozicija) VALUES
('Matej', 'Kovač', 'Prodajalec'),
('Ana', 'Breznik', 'Svetovalka'),
('Gregor', 'Mlakar', 'Vodja'),
('Simona', 'Potočnik', 'Mehanik'),
('David', 'Erjavec', 'Prodajalec'),
('Nika', 'Prelog', 'Svetovalka'),
('Tomaž', 'Kolar', 'Serviser'),
('Eva', 'Oblak', 'Administratorka'),
('Luka', 'Hribar', 'Prodajalec'),
('Jana', 'Kos', 'Svetovalka'),
('Miha', 'Novak', 'Serviser'),
('Petra', 'Zupan', 'Administratorka'),
('Andrej', 'Kranjc', 'Mehanik'),
('Barbara', 'Vidmar', 'Vodja'),
('Rok', 'Štrukelj', 'Prodajalec'),
('Katja', 'Petek', 'Svetovalka'),
('Nejc', 'Zajc', 'Serviser'),
('Tina', 'Marolt', 'Administratorka'),
('Žiga', 'Klemenčič', 'Mehanik'),
('Sandra', 'Majer', 'Svetovalka'),
('Blaž', 'Rozman', 'Prodajalec'),
('Monika', 'Šuštar', 'Administratorka'),
('Aljaž', 'Lovše', 'Serviser'),
('Urška', 'Kocjan', 'Svetovalka'),
('Denis', 'Turk', 'Mehanik'),
('Kaja', 'Lesjak', 'Prodajalec'),
('Sašo', 'Medved', 'Vodja'),
('Larisa', 'Pintar', 'Svetovalka');

-- ====== Tabela: Kupec ======
DROP TABLE if EXISTS Kupec;
CREATE TABLE Kupec (
    id_kupec INT AUTO_INCREMENT PRIMARY KEY,
    ime VARCHAR(50),
    priimek VARCHAR(50),
    email VARCHAR(50),
    telefon VARCHAR(100)
);

INSERT INTO Kupec (ime, priimek, email, telefon) VALUES
('Miha', 'Zajc', 'miha.zajc@email.com', '041123456'),
('Eva', 'Kotnik', 'eva.k@email.com', '040987654'),
('Nejc', 'Klinar', 'nejc.k@email.si', '031654987'),
('Nina', 'Rozman', 'nina.r@email.com', '070112233'),
('Andrej', 'Zupan', 'andrej.z@email.com', '030567891'),
('Tanja', 'Marolt', 'tanja.m@email.si', '051234567'),
('Luka', 'Kovač', 'luka.kovac@email.com', '041555666'),
('Maja', 'Petrović', 'maja.p@email.si', '040333444'),
('Borut', 'Novak', 'borut.novak@email.com', '031777888'),
('Sara', 'Vidmar', 'sara.vidmar@email.si', '070999000'),
('Žan', 'Hribar', 'zan.hribar@email.com', '030123789'),
('Katarina', 'Potočnik', 'katarina.p@email.com', '051987654'),
('Neža', 'Bizjak', 'neza.bizjak@email.si', '041222333'),
('Marko', 'Lavrič', 'marko.lavric@email.com', '040456789'),
('Jure', 'Prezelj', 'jure.prezelj@email.com', '031321654'),
('Tina', 'Jeraj', 'tina.jeraj@email.si', '070654321'),
('Vid', 'Košir', 'vid.kosir@email.com', '030876543'),
('Aljaž', 'Kranjc', 'aljaz.kranjc@email.com', '051765432'),
('Klemen', 'Bizjak', 'klemen.bizjak@email.com', '041876543'),
('Petra', 'Koren', 'petra.koren@email.si', '040543210'),
('Janja', 'Tomšič', 'janja.tomsic@email.com', '031987321'),
('Matej', 'Štrukelj', 'matej.strukelj@email.com', '041987654'),
('Lucija', 'Kramberger', 'lucija.k@email.si', '040876543'),
('Nejc', 'Kobal', 'nejc.kobal@email.com', '031234567'),
('Tina', 'Bizjak', 'tina.bizjak@email.si', '070345678'),
('Alenka', 'Horvat', 'alenka.horvat@email.com', '030456789'),
('Gregor', 'Miklavčič', 'gregor.m@email.com', '051234890'),
('Barbara', 'Novak', 'barbara.novak@email.si', '041345678'),
('Jure', 'Kranjc', 'jure.kranjc@email.com', '040234567'),
('Nina', 'Zupančič', 'nina.zupancic@email.com', '031876543'),
('Marko', 'Korošec', 'marko.koros@email.com', '070456789'),
('Anja', 'Kovač', 'anja.kovac@email.si', '030987654'),
('Žiga', 'Petrovič', 'ziga.p@email.com', '051345678'),
('Maja', 'Hrovat', 'maja.hrovat@email.com', '041654321'),
('Luka', 'Mlinar', 'luka.mlinar@email.com', '040765432'),
('Petra', 'Zajc', 'petra.zajc@email.si', '031123987'),
('Bojan', 'Krašovec', 'bojan.k@email.com', '070234567'),
('Tanja', 'Snoj', 'tanja.snoj@email.si', '030543210'),
('Žan', 'Zupan', 'zan.zupan@email.com', '051987123'),
('Katja', 'Jeraj', 'katja.jeraj@email.si', '041432198'),
('Rok', 'Vidmar', 'rok.vidmar@email.com', '040321987'),
('Simona', 'Marolt', 'simona.marolt@email.si', '031654123'),
('David', 'Kralj', 'david.kralj@email.com', '070876543'),
('Manca', 'Lavrič', 'manca.lavric@email.si', '030789456'),
('Neža', 'Prezelj', 'neza.prezelj@email.com', '051654789'),
('Peter', 'Jeraj', 'peter.jeraj@email.com', '041987321');

-- ======================== VOZILA ========================
-- ====== Tabela: Dobavitelji ======
DROP TABLE IF EXISTS Dobavitelji;
CREATE TABLE Dobavitelji (
    id_dobavitelj INT AUTO_INCREMENT PRIMARY KEY,
    naziv VARCHAR(100) NOT NULL,
    naslov VARCHAR(100),
    posta VARCHAR(10),
    drzava VARCHAR(50)
);

LOAD DATA INFILE 'E:/Prodajalna Avtov - Blaz Kolaric 3.Rb/sql/.txt/seznam_Dobavitelji.txt'
INTO TABLE Dobavitelji
CHARACTER SET utf8
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- ====== Tabela: Vozila ======
DROP TABLE IF EXISTS Vozila;
CREATE TABLE Vozila (
    id_vozila INT AUTO_INCREMENT PRIMARY KEY,
    znamka VARCHAR(50),
    model VARCHAR(50),
    letnik YEAR,
    cena INT,
    zaloga INT,

    opis VARCHAR(255),
    motor VARCHAR(50),
    menjalnik VARCHAR(20),
    gorivo VARCHAR(20),
    pogon VARCHAR(20),
    kilometri INT,
    notranjost VARCHAR(30),
    oprema VARCHAR(100),
    stanje VARCHAR(30),

    dobavitelj_id INT,
    prodajalna_id INT
);


LOAD DATA INFILE 'E:/Prodajalna Avtov - Blaz Kolaric 3.Rb/sql/.txt/seznam_vozil.txt'
INTO TABLE Vozila
CHARACTER SET utf8
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

ALTER TABLE Vozila
ADD COLUMN prodajalna_id VARCHAR(255);

UPDATE Vozila SET prodajalna_id = 7 WHERE id_vozila = 1;
UPDATE Vozila SET prodajalna_id = 13 WHERE id_vozila = 2;
UPDATE Vozila SET prodajalna_id = 9 WHERE id_vozila = 3;
UPDATE Vozila SET prodajalna_id = 2 WHERE id_vozila = 4;
UPDATE Vozila SET prodajalna_id = 15 WHERE id_vozila = 5;
UPDATE Vozila SET prodajalna_id = 11 WHERE id_vozila = 6;
UPDATE Vozila SET prodajalna_id = 5 WHERE id_vozila = 7;
UPDATE Vozila SET prodajalna_id = 1 WHERE id_vozila = 8;
UPDATE Vozila SET prodajalna_id = 6 WHERE id_vozila = 9;
UPDATE Vozila SET prodajalna_id = 14 WHERE id_vozila = 10;
UPDATE Vozila SET prodajalna_id = 8 WHERE id_vozila = 11;
UPDATE Vozila SET prodajalna_id = 10 WHERE id_vozila = 12;
UPDATE Vozila SET prodajalna_id = 3 WHERE id_vozila = 13;
UPDATE Vozila SET prodajalna_id = 12 WHERE id_vozila = 14;
UPDATE Vozila SET prodajalna_id = 4 WHERE id_vozila = 15;
UPDATE Vozila SET prodajalna_id = 15 WHERE id_vozila = 16;
UPDATE Vozila SET prodajalna_id = 7 WHERE id_vozila = 17;
UPDATE Vozila SET prodajalna_id = 2 WHERE id_vozila = 18;
UPDATE Vozila SET prodajalna_id = 9 WHERE id_vozila = 19;
UPDATE Vozila SET prodajalna_id = 13 WHERE id_vozila = 20;

ALTER TABLE Vozila
ADD COLUMN slika VARCHAR(255);

UPDATE Vozila SET slika = 'https://media.ed.edmunds-media.com/toyota/corolla-hatchback/2020/oem/2020_toyota_corolla-hatchback_4dr-hatchback_nightshade-edition_fq_oem_1_1600.jpg' WHERE id_vozila = 1;
UPDATE Vozila SET slika = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOCuTCvnj30GT6nWojDc0i5s9-ZFMF0MsjrQ&s' WHERE id_vozila = 2;
UPDATE Vozila SET slika = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJi4XL0txY72tkzfuOcAF4vReMoZhHSEEZJQ&s' WHERE id_vozila = 3;
UPDATE Vozila SET slika = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaN5dQ0lRx3W_g5rfvnup6_Z1ygQJmhmrmBg&s' WHERE id_vozila = 4;
UPDATE Vozila SET slika = 'https://hips.hearstapps.com/hmg-prod/images/2021-audi-a4-45-tfsi-quattro-106-1607927016.jpg?crop=0.678xw:0.572xh;0.138xw,0.334xh&resize=2048:*' WHERE id_vozila = 5;
UPDATE Vozila SET slika = 'https://di-uploads-pod5.dealerinspire.com/waltersmercedesbenz/uploads/2019/11/2020-mercedes-benz-c-300-sedan-exterior.jpg' WHERE id_vozila = 6;
UPDATE Vozila SET slika = 'https://media.autoexpress.co.uk/image/private/s--X-WVjvBW--/f_auto,t_content-image-full-desktop@1/v1615560537/autoexpress/2021/03/Volkswagen%20Golf%20GTD-17.jpg' WHERE id_vozila = 7;
UPDATE Vozila SET slika = 'https://media.ed.edmunds-media.com/nissan/altima/2020/oem/2020_nissan_altima_sedan_25-platinum_fq_oem_1_1600.jpg' WHERE id_vozila = 8;
UPDATE Vozila SET slika = 'https://hips.hearstapps.com/hmg-prod/images/2019-chevrolet-malibu-rs-117-1568289288.jpg?crop=0.830xw:0.678xh;0.0913xw,0.202xh&resize=1200:*' WHERE id_vozila = 9;
UPDATE Vozila SET slika = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf1RCKIWWxz_tlLuRBOQqhZloNCTQWJPa6ag&s' WHERE id_vozila = 10;
UPDATE Vozila SET slika = 'https://p6.focus.de/img/fotos/id_5109312/artikel18827-bild09.jpg?im=Resize%3D%28800%2C533%29&impolicy=perceptual&quality=mediumHigh&hash=867284e0f3ad39e6ba697cf5210776535511fde9cf6f32cd35462d9e9fa18d01' WHERE id_vozila = 11;
UPDATE Vozila SET slika = 'https://media.ed.edmunds-media.com/subaru/impreza/2020/oem/2020_subaru_impreza_4dr-hatchback_sport_fq_oem_1_1600.jpg' WHERE id_vozila = 12;
UPDATE Vozila SET slika = 'https://hips.hearstapps.com/hmg-prod/images/2020-mazda-3-hatchback-1569347781.jpg?crop=0.968xw:0.726xh;0.00321xw,0.262xh&resize=1200:*' WHERE id_vozila = 13;
UPDATE Vozila SET slika = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7O79UcOYj3Kvu7GzS8lm1mZKM5LuyrKWdsQ&s' WHERE id_vozila = 14;
UPDATE Vozila SET slika = 'https://cdn.jdpower.com/JDP_2022%20Porsche%20Macan%20S%20Volcano%20Gray%20Front%20Quarter%20View.jpg' WHERE id_vozila = 15;
UPDATE Vozila SET slika = 'https://cdn.prod.website-files.com/5b4a3b3971d099f78f362505/66e87f0bd65ba0390b7473d1_6552f553e53e73ecff130946_2016-Nissan-GT-R-Nismo-Black-JN1AR5EF0GM290251_082.webp' WHERE id_vozila = 16;
UPDATE Vozila SET slika = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnNbcufAo4DrmBYudUIFqwaGutTf6jDFd6HQ&s' WHERE id_vozila = 17;
UPDATE Vozila SET slika = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQHqPJtSuaTibD-Hi6rFnEb0LU0_eqREiT6g&s' WHERE id_vozila = 18;
UPDATE Vozila SET slika = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI-sV4qYOlrvUuRDcXm_4x6KMqV5V8vVUMYQ&s' WHERE id_vozila = 19;
UPDATE Vozila SET slika = 'https://hips.hearstapps.com/hmg-prod/images/2020-toyta-camry-mmp-1-1566921359.jpg?crop=0.878xw:0.737xh;0.0554xw,0.263xh&resize=2048:*' WHERE id_vozila = 20;

-- ======================== Servis ========================
-- ====== Tabela: Avto_servis ======
DROP TABLE if EXISTS Avto_servis;
CREATE TABLE Avto_servis (
    id_servus INT AUTO_INCREMENT PRIMARY KEY,
    naziv VARCHAR(50),
    cena INT,
    opis VARCHAR(50)
);

INSERT INTO Avto_servis (naziv, cena, opis) VALUES
('Menjava olja', 50, 'Redna menjava motornega olja'),
('Pregled zavor', 70, 'Pregled in menjava zavor'),
('Servis klime', 60, 'Polnjenje in čiščenje klime'),
('Menjava pnevmatik', 80, 'Zimske/letne pnevmatike'),
('Diagnostika motorja', 100, 'Računalniška diagnostika'),
('Čiščenje vozila', 40, 'Notranje in zunanje čiščenje'),
('Menjava zavornih ploščic', 90, 'Zamenjava obrabljenih zavornih ploščic'),
('Popravilo izpušnega sistema', 110, 'Popravilo ali menjava izpušne cevi'),
('Menjava zračnih filtrov', 35, 'Zamenjava filtrov za čist zrak'),
('Servis menjalnika', 150, 'Preverjanje in servis menjalnika'),
('Polnjenje akumulatorja', 45, 'Polnjenje in testiranje akumulatorja'),
('Menjava svečk', 55, 'Zamenjava vžigalnih svečk'),
('Preverjanje amortizerjev', 65, 'Testiranje in menjava amortizerjev'),
('Nastavitev svetlobnih žarometov', 30, 'Pravilna nastavitev žarometov'),
('Popravilo hladilnega sistema', 120, 'Servis in popravilo hladilnega sistema'),
('Menjava zavorne tekočine', 50, 'Zamenjava in polnjenje zavorne tekočine'),
('Preverjanje in polnjenje tekočin', 40, 'Preverjanje nivoja in polnjenje tekočin'),
('Popravilo električnih sistemov', 130, 'Diagnoza in popravilo električnih napak'),
('Menjava oljnega filtra', 45, 'Zamenjava filtra motornega olja'),
('Čiščenje injektorjev', 85, 'Profesionalno čiščenje vbrizgalnih šob'),
('Preverjanje sistema ABS', 75, 'Diagnoza in popravilo sistema ABS'),
('Menjava kolesnih ležajev', 100, 'Zamenjava obrabljenih kolesnih ležajev'),
('Popravilo klimatske naprave', 140, 'Popravilo in servis klimatske naprave'),
('Menjava jermenov', 90, 'Zamenjava pogonskih jermenov'),
('Nastavitev zavore ročne zavore', 50, 'Pravilna nastavitev ročne zavore'),
('Testiranje emisij izpušnih plinov', 60, 'Merjenje in test emisij plinov');

-- ====== Tabela: Zaposleni_avto_servis ======
DROP TABLE if EXISTS Zaposleni_avto_servis;
CREATE TABLE Zaposleni_avto_servis (
    id_zaposleni INT AUTO_INCREMENT PRIMARY KEY,
    ime VARCHAR(50),
    priimek VARCHAR(50),
    delo VARCHAR(50),
    servis_id INT
);

INSERT INTO Zaposleni_avto_servis (ime, priimek, delo, servis_id) VALUES
('Marko', 'Bizjak', 'Mehanik', 1),
('Sara', 'Vidmar', 'Serviserka', 2),
('Igor', 'Pirc', 'Električar', 3),
('Nina', 'Logar', 'Tehnik', 4),
('Rok', 'Oblak', 'Čistilec', 6),
('Andraž', 'Mali', 'Mehanik', 5),
('Ana', 'Kovač', 'Serviserka', 1),
('Tomaž', 'Šmid', 'Mehanik', 2),
('Lara', 'Vrhovec', 'Električarka', 3),
('David', 'Horvat', 'Tehnik', 4),
('Maja', 'Štular', 'Čistilka', 6),
('Aljaž', 'Kranjc', 'Mehanik', 5),
('Nina', 'Zupančič', 'Serviserka', 1),
('Matej', 'Kos', 'Električar', 2),
('Klara', 'Petek', 'Tehnik', 3),
('Žan', 'Novak', 'Mehanik', 4),
('Eva', 'Mrak', 'Serviserka', 5),
('Miha', 'Hribar', 'Čistilec', 6),
('Sara', 'Breznik', 'Tehnik', 1),
('Jan', 'Kralj', 'Električar', 2),
('Petra', 'Golob', 'Serviserka', 3),
('Luka', 'Kos', 'Mehanik', 4),
('Tina', 'Zajc', 'Čistilka', 5),
('Marko', 'Kralj', 'Tehnik', 6),
('Jana', 'Vidmar', 'Serviserka', 1),
('Rok', 'Potočnik', 'Električar', 2),
('Klemen', 'Jelen', 'Mehanik', 3),
('Alenka', 'Novak', 'Čistilka', 4),
('Bojan', 'Zupan', 'Tehnik', 5),
('Maja', 'Kovačič', 'Serviserka', 6),
('Žiga', 'Petrič', 'Mehanik', 1),
('Nika', 'Štrukelj', 'Električarka', 2),
('Miha', 'Vidic', 'Tehnik', 3),
('Ana', 'Marolt', 'Serviserka', 4),
('Gregor', 'Škof', 'Mehanik', 5),
('Tina', 'Jelen', 'Čistilka', 6);

-- ======================== Račun ========================
-- ====== Tabela: Račun ======
DROP TABLE if EXISTS Racun;
CREATE TABLE Racun (
    id_račun INT AUTO_INCREMENT PRIMARY KEY,
    prodajalna_id INT,
    kupec_id INT,
    cena INT,
    popust VARCHAR(50),
    datum_nakupa DATE,
    servis_povezava_id INT
);

INSERT INTO Racun (prodajalna_id, kupec_id, cena, popust, datum_nakupa, servis_povezava_id) VALUES
(14, 31, 23000, '15%', '2024-05-20', 12),
(3, 10, 26000, '12%', '2024-05-21', 4),
(8, 44, 19000, '7%', '2024-05-22', 19),
(11, 2, 34000, '3%', '2024-05-23', 7),
(1, 20, 41000, '10%', '2024-05-24', 23),
(13, 5, 21500, '0%', '2024-05-25', 15),
(6, 27, 27000, '6%', '2024-05-26', 1),
(9, 35, 18500, '2%', '2024-05-27', 26),
(2, 43, 32000, '8%', '2024-05-28', 9),
(10, 8, 43000, '5%', '2024-05-29', 3),
(15, 29, 22500, '4%', '2024-05-30', 20),
(4, 17, 25500, '0%', '2024-05-31', 11),
(5, 1, 19500, '10%', '2024-06-01', 17),
(7, 36, 30000, '7%', '2024-06-02', 24),
(1, 24, 44000, '3%', '2024-06-03', 6),
(12, 13, 23500, '0%', '2024-06-04', 18),
(3, 41, 28000, '5%', '2024-06-05', 10),
(11, 6, 17500, '4%', '2024-06-06', 13),
(6, 14, 35000, '0%', '2024-06-07', 21),
(15, 33, 42000, '6%', '2024-06-08', 2),
(7, 4, 21000, '8%', '2024-06-09', 14),
(9, 40, 26000, '0%', '2024-06-10', 8),
(5, 16, 18500, '3%', '2024-06-11', 25),
(13, 30, 33000, '10%', '2024-06-12', 22),
(2, 37, 40000, '0%', '2024-06-13', 5),
(14, 22, 22000, '7%', '2024-06-14', 16),
(10, 26, 25000, '5%', '2024-06-15', 7),
(8, 39, 17000, '0%', '2024-06-16', 19),
(4, 28, 31000, '4%', '2024-06-17', 1),
(12, 7, 45000, '2%', '2024-06-18', 26),
(1, 18, 20500, '6%', '2024-06-19', 20),
(2, 25, 27000, '11%', '2025-01-02', 3),
(13, 12, 19000, '3%', '2025-01-03', 8),
(5, 15, 34000, '8%', '2025-01-04', 15),
(11, 23, 43000, '10%', '2025-01-05', 24),
(1, 38, 21500, '0%', '2025-01-06', 6),
(7, 21, 26000, '6%', '2025-01-07', 12),
(14, 11, 18000, '5%', '2025-01-08', 19),
(9, 42, 32000, '4%', '2025-01-09', 22),
(4, 3, 41000, '2%', '2025-01-10', 11),
(10, 34, 23000, '7%', '2025-01-11', 1),
(8, 19, 24000, '1%', '2025-01-12', 18),
(3, 9, 17500, '9%', '2025-01-13', 20),
(15, 44, 20000, '0%', '2025-01-14', 9),
(6, 45, 22500, '12%', '2025-01-15', 4),
(12, 31, 25000, '10%', '2025-01-16', 13),
(1, 10, 19500, '5%', '2025-01-17', 16),
(14, 32, 30000, '3%', '2025-01-18', 25),
(2, 20, 35000, '6%', '2025-01-19', 14),
(9, 13, 27000, '8%', '2025-01-20', 7),
(7, 27, 22000, '0%', '2025-01-21', 5),
(5, 1, 21000, '7%', '2025-01-22', 21),
(11, 16, 26000, '4%', '2025-01-23', 2),
(8, 4, 18000, '10%', '2025-01-24', 23),
(4, 22, 33000, '3%', '2025-01-25', 17),
(6, 43, 40000, '9%', '2025-01-26', 10),
(3, 7, 22000, '0%', '2025-01-27', 24),
(10, 18, 25000, '6%', '2025-01-28', 15),
(15, 41, 17000, '2%', '2025-01-29', 13),
(2, 29, 31000, '5%', '2025-01-30', 8),
(13, 35, 45000, '8%', '2025-01-31', 19),
(1, 6, 20500, '4%', '2025-02-01', 6);

-- ======================== Foreign Key ========================
-- ====== Prodajalna ======
ALTER TABLE Prodajalna
ADD FOREIGN KEY (lastnik_id) REFERENCES Lastnik(id_lastnik),
ADD FOREIGN KEY (lokacija_id) REFERENCES Lokacija(id_lokacija);

-- ====== Vozila ======
ALTER TABLE Vozila
ADD FOREIGN KEY (dobavitelj_id) REFERENCES Dobavitelji(id_dobavitelj);

-- ====== Zaposleni_avto_servis ======
ALTER TABLE Zaposleni_avto_servis
ADD FOREIGN KEY (servis_id) REFERENCES Avto_servis(id_servus);

-- ====== Racun ======
ALTER TABLE Racun
ADD FOREIGN KEY (prodajalna_id) REFERENCES Prodajalna(id_prodajalna),
ADD FOREIGN KEY (kupec_id) REFERENCES Kupec(id_kupec),
ADD FOREIGN KEY (servis_povezava_id) REFERENCES Avto_servis(id_servus);

-- ======================== Index ========================
-- ====== Kupec ======
CREATE INDEX idx_email ON kupec(email);
SHOW INDEXES FROM kupec;

-- ====== Prodajalna ======
CREATE INDEX idx_lastnik_id ON Prodajalna(lastnik_id);
CREATE INDEX idx_lokacija_id ON Prodajalna(lokacija_id);
SHOW INDEXES FROM Prodajalna;

-- ====== Vozila ======
CREATE INDEX idx_dobavitelj_id ON Vozila(dobavitelj_id);
CREATE INDEX idx_prodajalna_id ON Vozila(prodajalna_id);
CREATE INDEX idx_znamka_model ON Vozila(znamka, model);
CREATE INDEX idx_letnik ON Vozila(letnik);
SHOW INDEXES FROM Vozila;

-- ====== Racun ======
CREATE INDEX idx_prodajalna_id_racun ON Racun(prodajalna_id);
CREATE INDEX idx_kupec_id_racun ON Racun(kupec_id);
CREATE INDEX idx_datum_nakupa ON Racun(datum_nakupa);
SHOW INDEXES FROM Racun;

-- ====== Zaposleni_avto_servis ======
CREATE INDEX idx_servis_id ON Zaposleni_avto_servis(servis_id);
SHOW INDEXES FROM Zaposleni_avto_servis;

-- ====== Avto_servis ======
CREATE INDEX idx_naziv_servis ON Avto_servis(naziv);
SHOW INDEXES FROM Avto_servis;

-- ======================== Select ========================
-- ====== Racun ======
CREATE OR REPLACE VIEW racun_view AS
SELECT 
    r.id_račun,
    CONCAT(k.ime, ' ', k.priimek) AS kupec,
    p.ime AS prodajalna,
    r.cena,
    r.popust,
    r.datum_nakupa,
    s.naziv AS servis,
    s.cena AS cena_servisa,
    v.slika AS car_img
FROM Racun r
JOIN Kupec k ON r.kupec_id = k.id_kupec
JOIN Prodajalna p ON r.prodajalna_id = p.id_prodajalna
JOIN Avto_servis s ON r.servis_povezava_id = s.id_servus
LEFT JOIN Vozila v ON v.prodajalna_id = p.id_prodajalna;

-- ====== Racun vozil ======
CREATE OR REPLACE VIEW racun_vozilo_view AS
SELECT
    r.id_račun,
    CONCAT(k.ime, ' ', k.priimek) AS kupec,
    p.ime AS prodajalna,
    v.znamka,
    v.model,
    v.letnik,
    r.cena,
    r.popust,
    r.datum_nakupa
FROM Racun r
JOIN Kupec k ON r.kupec_id = k.id_kupec
JOIN Prodajalna p ON r.prodajalna_id = p.id_prodajalna
LEFT JOIN Vozila v ON v.prodajalna_id = p.id_prodajalna
ORDER BY r.datum_nakupa DESC;

-- ====== Prodajalna ======
CREATE OR REPLACE VIEW prodajalna_view AS
SELECT 
    p.ime AS prodajalna,
    COUNT(r.id_račun) AS stevilo_prodaj,
    SUM(r.cena) AS skupni_prihodek
FROM Racun r
JOIN Prodajalna p ON r.prodajalna_id = p.id_prodajalna
GROUP BY p.ime
ORDER BY skupni_prihodek DESC;

-- ====== Kupec total spent ======
CREATE OR REPLACE VIEW kupec_spent_view AS
SELECT 
    CONCAT(k.ime, ' ', k.priimek) AS kupec,
    SUM(r.cena) AS skupni_znesek,
    p.ime
FROM Racun r
JOIN Kupec k ON r.kupec_id = k.id_kupec
JOIN prodajalna p ON p.id_prodajalna = r.prodajalna_id
GROUP BY r.kupec_id
ORDER BY skupni_znesek DESC;

-- ====== Servis Zaposleni ======
CREATE OR REPLACE VIEW servis_zaposelni_view AS
SELECT 
    s.naziv AS servis,
    CONCAT(z.ime, ' ', z.priimek) AS zaposleni,
    z.delo
FROM Avto_servis s
JOIN Zaposleni_avto_servis z ON s.id_servus = z.servis_id
ORDER BY s.naziv;

-- ====== Povprečna cena prodaje ======
CREATE OR REPLACE VIEW povprecna_cena_prodaje_view AS
SELECT 
    p.ime AS prodajalna,
    CONCAT(l.ime, ' ', l.priimek) AS lastnik,
    ROUND(AVG(r.cena), 2) AS povprecna_cena
FROM Racun r
JOIN Prodajalna p ON r.prodajalna_id = p.id_prodajalna
JOIN Lastnik l ON p.lastnik_id = l.id_lastnik
GROUP BY p.id_prodajalna;

-- ====== Popusti ======
CREATE OR REPLACE VIEW popust_view AS
SELECT 
    k.ime, k.priimek, r.cena, r.popust
FROM Racun r
JOIN Kupec k ON r.kupec_id = k.id_kupec
WHERE CAST(REPLACE(r.popust, '%', '') AS UNSIGNED) > 0;

-- ====== Servis ======
CREATE OR REPLACE VIEW servis_view AS
SELECT 
    s.naziv,
    COUNT(r.id_račun) AS stevilo_uporabe,
    p.ime AS prodajalna
FROM Avto_servis s
LEFT JOIN Racun r ON r.servis_povezava_id = s.id_servus
JOIN prodajalna p ON p.id_prodajalna = r.prodajalna_id
GROUP BY s.id_servus
ORDER BY stevilo_uporabe DESC;

-- ====== Zaloga vozil v prodajalni ======
CREATE OR REPLACE VIEW vozila_zaloga_prodajalna_view AS
SELECT 
    p.ime AS prodajalna,
    v.znamka,
    v.model,
    v.letnik,
    v.zaloga
FROM Vozila v
JOIN Prodajalna p ON v.prodajalna_id = p.id_prodajalna
WHERE v.zaloga > 0
ORDER BY p.ime, v.znamka, v.model;



-- ====== Dobavitelji po državi za vsako prodajalno ======
CREATE OR REPLACE VIEW dobavitelji_drzava_view AS
SELECT 
    naziv,
    naslov,
    posta,
    drzava
FROM Dobavitelji
GROUP BY naziv
ORDER BY drzava;

-- ====== Dobavitelji po državi za vsako prodajalno ======
CREATE OR REPLACE VIEW dobavitelji_drzava_view AS
SELECT 
    naziv,
    drzava
FROM Dobavitelji
ORDER BY drzava, naziv;







