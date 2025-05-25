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
('Katarina', 'Erjavec');

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
('Avto Krka Novo mesto', 600.0, 5, 5);              

ALTER TABLE Prodajalna
ADD COLUMN logo_url VARCHAR(255);

UPDATE Prodajalna SET logo_url = 'https://static2.mojedelo.com/Images/EmployerLogoFullPicture/9f4f4f5fc3ba46f4b8c4cb543183c169' WHERE id_prodajalna = 1;
UPDATE Prodajalna SET logo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgkBcsNHB8R56ybkwu9r5hBuRTiDcfFmn2cQ&s' WHERE id_prodajalna = 2;
UPDATE Prodajalna SET logo_url = 'https://www.parkvojaskezgodovine.si/wp-content/uploads/2017/02/triglav-logo-Converted.jpg' WHERE id_prodajalna = 3;
UPDATE Prodajalna SET logo_url = 'https://static2.mojedelo.com/Images/EmployerLogoFullPicture/0dd72b55fb0b42d0adeab6e2d0a32da6' WHERE id_prodajalna = 4;
UPDATE Prodajalna SET logo_url = 'https://img.mojaobcina.si/img/1/H_MAX_1024x768/12746_1725343624_avtokrka.jpg' WHERE id_prodajalna = 5;

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
(5, 'Novo mesto', 'Seidlova 20', 'Novo mesto', 'Slovenija');

-- ======================== Osebje ========================
-- ====== Tabela: Zaposleni ======
DROP TABLE if EXISTS Zaposleni;
CREATE TABLE zaposleni (
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
('Tanja', 'Marolt', 'tanja.m@email.si', '051234567');

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

LOAD DATA INFILE 'C:/xampp/htdocs/GearRush/sql/.txt/seznam_Dobavitelji.txt'
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


LOAD DATA INFILE 'C:/xampp/htdocs/GearRush/sql/.txt/seznam_vozil.txt'
INTO TABLE Vozila
CHARACTER SET utf8
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

ALTER TABLE Vozila
ADD COLUMN prodajalna_id VARCHAR(255);

UPDATE Vozila SET prodajalna_id = 3 WHERE id_vozila = 1;
UPDATE Vozila SET prodajalna_id = 1 WHERE id_vozila = 2;
UPDATE Vozila SET prodajalna_id = 5 WHERE id_vozila = 3;
UPDATE Vozila SET prodajalna_id = 2 WHERE id_vozila = 4;
UPDATE Vozila SET prodajalna_id = 4 WHERE id_vozila = 5;
UPDATE Vozila SET prodajalna_id = 1 WHERE id_vozila = 6;
UPDATE Vozila SET prodajalna_id = 3 WHERE id_vozila = 7;
UPDATE Vozila SET prodajalna_id = 2 WHERE id_vozila = 8;
UPDATE Vozila SET prodajalna_id = 5 WHERE id_vozila = 9;
UPDATE Vozila SET prodajalna_id = 1 WHERE id_vozila = 10;
UPDATE Vozila SET prodajalna_id = 4 WHERE id_vozila = 11;
UPDATE Vozila SET prodajalna_id = 2 WHERE id_vozila = 12;
UPDATE Vozila SET prodajalna_id = 3 WHERE id_vozila = 13;
UPDATE Vozila SET prodajalna_id = 5 WHERE id_vozila = 14;
UPDATE Vozila SET prodajalna_id = 1 WHERE id_vozila = 15;
UPDATE Vozila SET prodajalna_id = 4 WHERE id_vozila = 16;
UPDATE Vozila SET prodajalna_id = 2 WHERE id_vozila = 17;
UPDATE Vozila SET prodajalna_id = 3 WHERE id_vozila = 18;
UPDATE Vozila SET prodajalna_id = 4 WHERE id_vozila = 19;
UPDATE Vozila SET prodajalna_id = 5 WHERE id_vozila = 20;

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
('Čiščenje vozila', 40, 'Notranje in zunanje čiščenje');

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
('Andraž', 'Mali', 'Mehanik', 5);

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
(1, 1, 20500, '5%', '2024-05-01', 1),
(2, 2, 22000, '0%', '2024-05-03', 2),
(3, 3, 18000, '10%', '2024-05-04', 3),
(4, 4, 33000, '7%', '2024-05-07', 4),
(5, 5, 40000, '3%', '2024-05-08', 1),
(1, 6, 21000, '0%', '2024-05-10', 6);

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
    COUNT(r.id_račun) AS stevilo_racunov,
    SUM(r.cena) AS skupni_prihodek
FROM Racun r
JOIN Prodajalna p ON r.prodajalna_id = p.id_prodajalna
GROUP BY p.ime
ORDER BY skupni_prihodek DESC;

-- ====== Kupec total spent ======
CREATE OR REPLACE VIEW kupec_spent_view AS
SELECT 
    CONCAT(k.ime, ' ', k.priimek) AS kupec,
    SUM(r.cena) AS skupni_znesek
FROM Racun r
JOIN Kupec k ON r.kupec_id = k.id_kupec
GROUP BY r.kupec_id
ORDER BY skupni_znesek DESC
LIMIT 3;

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
    COUNT(r.id_račun) AS stevilo_uporabe
FROM Avto_servis s
LEFT JOIN Racun r ON r.servis_povezava_id = s.id_servus
GROUP BY s.id_servus
ORDER BY stevilo_uporabe DESC;

-- ====== Vozila v prodajalni ======
CREATE OR REPLACE VIEW vozila_v_prodajalni_view AS
SELECT 
    v.prodajalna_id,
    v.znamka,
    v.model,
    v.letnik,
    p.ime AS prodajalna
FROM Vozila v
JOIN Prodajalna p ON v.prodajalna_id = p.id_prodajalna;

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

-- ====== Zaposleni ======
CREATE OR REPLACE VIEW zaposleni_pozicija_view AS
SELECT 
    pozicija,
    COUNT(*) AS stevilo_zaposlenih
FROM zaposleni













GROUP BY pozicija
ORDER BY stevilo_zaposlenih DESC;

-- ====== Dobavitelji po državi za vsako prodajalno ======
CREATE OR REPLACE VIEW dobavitelji_drzava_view AS
SELECT 
    naziv,
    drzava
FROM Dobavitelji
ORDER BY drzava, naziv;
