-- Crearea unor secvente ce vor fi folosite in incrementarea automata a id-ului
-- a fiecarei date in momentul inregistrariilor

CREATE SEQUENCE CATEGORII_SEQ START WITH 1;
CREATE SEQUENCE PRODUSE_SEQ START WITH 1;
CREATE SEQUENCE FACTURI_SEQ START WITH 1;
CREATE SEQUENCE CURIERI_SEQ START WITH 1;
CREATE SEQUENCE TARA_SEQ START WITH 1;
CREATE SEQUENCE ORAS_SEQ START WITH 1;
CREATE SEQUENCE ADRESA_SEQ START WITH 1;
CREATE SEQUENCE CLIENTI_SEQ START WITH 1;
CREATE SEQUENCE VANZATORI_SEQ START WITH 1;
CREATE SEQUENCE COMENZI_SEQ START WITH 1;
CREATE SEQUENCE TRANSPORT_SEQ START WITH 1;
CREATE SEQUENCE DEPOZITE_SEQ START WITH 1;



--Creeare tabele

CREATE TABLE CATEGORII(
    id_categorii INT DEFAULT CATEGORII_SEQ.NEXTVAL PRIMARY KEY,
    denumire VARCHAR(30)
);

-- Inserare in tabelul CATEGORII
INSERT INTO CATEGORII (denumire)
VALUES ('Beauty & Make-Up');

INSERT INTO CATEGORII (denumire)
VALUES ('Fitness');

INSERT INTO CATEGORII (denumire)
VALUES ('Nutritie');

INSERT INTO CATEGORII (denumire)
VALUES ('Scoala & Office');

INSERT INTO CATEGORII (denumire)
VALUES ('Jocuri video & Media');

INSERT INTO CATEGORII (denumire)
VALUES ('Mobila');

-- Select from CATEGORII
SELECT * FROM CATEGORII
ORDER BY id_categorii;


-- Creeare tabel curieri

CREATE TABLE CURIERI
(
    id_curieri INT DEFAULT FACTURI_SEQ.NEXTVAL PRIMARY KEY,
    nume       VARCHAR(30),
    prenume    VARCHAR(30),
    email      VARCHAR(90),
    nr_contact VARCHAR(12)
);



-- Inserare in tabelul CURIERI

INSERT INTO CURIERI(nume,prenume,email,nr_contact)
VALUES ('Predescu', 'Dorin', 'dorinpredescu@gmail.com', '0735355678');

INSERT INTO CURIERI(nume,prenume,email,nr_contact)
VALUES ('Corneliu', 'Vadim', 'corneliuvadim@gmail.com', '0765646567');

INSERT INTO CURIERI(nume,prenume,email,nr_contact)
VALUES ('Duinea', 'Dorel', 'duineadorel@yahoo.com', '0746473923');

INSERT INTO CURIERI(nume,prenume,email,nr_contact)
VALUES ('Lazarescu', 'Corina', 'lazarescucorina@yahoo.com', '0753738391');

INSERT INTO CURIERI(nume,prenume,email,nr_contact)
VALUES ('Pop', 'Gheorghe', 'gheorghepop@gmail.com', '0746637388');

INSERT INTO CURIERI(nume,prenume,email,nr_contact)
VALUES ('Capraru', 'Stefan', 'stefancapraru@gmail.com', '0748392008');

INSERT INTO CURIERI(nume,prenume,email,nr_contact)
VALUES ('Constantinescu', 'Vlad', 'vladconstantinescu@gmail.com', '0739930204');

INSERT INTO CURIERI(nume,prenume,email,nr_contact)
VALUES ('Todoran', 'Razvan', 'todoranrrazvan@outlook.com', '0737729200');

INSERT INTO CURIERI(nume,prenume,email,nr_contact)
VALUES ('Udrea', 'Sara', 'saraudrea@gmail.com', '0743782903');

INSERT INTO CURIERI(nume,prenume,email,nr_contact)
VALUES ('Ducu', 'Daria', 'ducudaria@gmail.com', '0747389488');


-- Select from CURIERI
SELECT * FROM CURIERI
ORDER BY id_curieri;


-- Creeare tabel tara

CREATE TABLE TARA(
    id_tara INT DEFAULT TARA_SEQ.NEXTVAL PRIMARY KEY,
    nume VARCHAR(30)
);

-- Inserare in tabelul TARA

INSERT INTO TARA(nume)
VALUES ('Romania');

INSERT INTO TARA(nume)
VALUES ('Belgia');

INSERT INTO TARA(nume)
VALUES ('Olanda');

INSERT INTO TARA(nume)
VALUES ('Germania');

INSERT INTO TARA(nume)
VALUES ('SUA');

INSERT INTO TARA(nume)
VALUES ('Armenia');

INSERT INTO TARA(nume)
VALUES ('Italia');

INSERT INTO TARA(nume)
VALUES ('Cipru');

INSERT INTO TARA(nume)
VALUES ('China');

INSERT INTO TARA(nume)
VALUES ('Ucraina');


-- Select from TARA
SELECT * FROM TARA
ORDER BY id_tara;



-- Creeare tabel oras

CREATE TABLE ORAS(
    id_oras INT DEFAULT ORAS_SEQ.NEXTVAL PRIMARY KEY,
    nume VARCHAR(30),
    tara_id INT,
    FOREIGN KEY (tara_id) REFERENCES TARA(id_tara)
);

--Inserare in tabelul ORAS

INSERT INTO ORAS(nume, tara_id)
VALUES ('Barlad', 1);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Bacau', 1);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Ramnicu Valcea', 1);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Ramnicu Sarat', 1);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Cluj', 1);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Bruxelles', 2);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Bruges', 2);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Charleroi', 2);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Châtelet', 2);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Amsterdam', 3);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Rotterdam', 3);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Berlin', 4);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Hamburg', 4);

INSERT INTO ORAS(nume, tara_id)
VALUES ('New York', 5);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Chicago', 5);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Michigan', 5);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Goris', 6);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Yerevan', 6);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Roma', 7);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Florenta', 7);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Milano', 7);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Paphos', 8);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Nikosia', 8);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Lefka', 8);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Beijing', 9);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Shanghai', 9);

INSERT INTO ORAS(nume, tara_id)
VALUES ('Kiev', 10);

-- Select from ORAS
SELECT * FROM ORAS
ORDER BY id_oras;




-- Creeare tabel adresa

CREATE TABLE ADRESA(
    id_adresa INT DEFAULT ADRESA_SEQ.NEXTVAL PRIMARY KEY,
    oras_id INT,
    strada VARCHAR(90),
    numar VARCHAR(30),
    FOREIGN KEY (oras_id) REFERENCES ORAS(id_oras)
);































-- Inserare in tabelul ADRESA

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (1, 'Calea lui Traian', '186');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (1, 'Mosilor', '31A');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (1, 'Academiei', '96');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (2, 'Hemmingstreet', '186');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (2, 'Lemmingstreet', '22E');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (2, 'Flemmingstreet', '32');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (3, 'Amsterdamstreet', '313');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (3, 'The most amsterdam street ever', '69');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (4, 'Amsterdamstreet', '32');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (5, '5th Avenue', '22');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (6, 'Armeniastreet', '7');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (8, 'Beachstreet', '3');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (8, 'Nodogsstreet', '63F');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (9, 'Riverstreet', '66');

INSERT INTO ADRESA(oras_id,strada, numar)
VALUES (10, 'Amsterdamstreet', '32');


-- Select from ADRESA
SELECT * FROM ADRESA
ORDER BY id_adresa;


-- Creeare tabel clienti

CREATE TABLE CLIENTI(
    id_clienti INT DEFAULT CLIENTI_SEQ.NEXTVAL PRIMARY KEY,
    nume VARCHAR(30),
    prenume VARCHAR(30),
    email VARCHAR(90),
    adresa_id INT,
    FOREIGN KEY (adresa_id) REFERENCES ADRESA(id_adresa)
);

-- Inserare in tabelul CLIENTI

INSERT INTO CLIENTI(nume, prenume, email, adresa_id)
VALUES('Damian', 'Draghici', 'damiandraghici@gmail.com', 1);

INSERT INTO CLIENTI(nume, prenume, email, adresa_id)
VALUES('Nikola', 'Tesla', 'nikolatesla@gmail.com', 2);

INSERT INTO CLIENTI(nume, prenume, email, adresa_id)
VALUES('Nicolae', 'Ceausescu', 'nicolaeceausescu@gmail.com', 3);

INSERT INTO CLIENTI(nume, prenume, email, adresa_id)
VALUES('Patrick', 'Bateman', 'patrickbateman@yahoo.com', 4);

INSERT INTO CLIENTI(nume, prenume, email, adresa_id)
VALUES('Bruce', 'Wayne', 'brucewayne@gmail.com', 5);

INSERT INTO CLIENTI(nume, prenume, email, adresa_id)
VALUES('Wonder', 'Woman', 'wonderwoman@gmail.com', 6);

INSERT INTO CLIENTI(nume, prenume, email, adresa_id)
VALUES('Mickey', 'Mouse', 'mickeymouse@gmail.com', 7);

INSERT INTO CLIENTI(nume, prenume, email, adresa_id)
VALUES('Marcel', 'Marian', 'marcelmarian@gmail.com', 8);

INSERT INTO CLIENTI(nume, prenume, email, adresa_id)
VALUES('Aleco', 'Tafo', 'alecotafo@gmail.com', 9);

INSERT INTO CLIENTI(nume, prenume, email, adresa_id)
VALUES('Georgian', 'Ioan', 'georgianioan@gmail.com', 10);


-- Select from CLIENTI
SELECT * FROM CLIENTI
ORDER BY id_clienti;


-- Creeare tabel vanzatori

CREATE TABLE VANZATORI(
    id_vanzatori INT DEFAULT VANZATORI_SEQ.NEXTVAL PRIMARY KEY,
    nume VARCHAR(30),
    prenume VARCHAR(30),
    email VARCHAR(90),
    nr_contact VARCHAR(12),
    adresa_id INT,
    FOREIGN KEY (adresa_id) REFERENCES ADRESA(id_adresa)
);


















-- Inserare in tabelul VANZATORI

INSERT INTO VANZATORI(nume,prenume,email,nr_contact,adresa_id)
VALUES('Petrescu', 'Miriam','petrescumiriam@gmail.com','0735356366', 1);

INSERT INTO VANZATORI(nume,prenume,email,nr_contact,adresa_id)
VALUES('Georgescu', 'Ramona','georgescuramona@gmail.com','0737839301', 2);

INSERT INTO VANZATORI(nume,prenume,email,nr_contact,adresa_id)
VALUES('Mateescu', 'Corina','mateescucorina@yahoo.com','0737389920', 3);

INSERT INTO VANZATORI(nume,prenume,email,nr_contact,adresa_id)
VALUES('Livian', 'Petre','livianpetre@gmail.com','0737628930', 4);

INSERT INTO VANZATORI(nume,prenume,email,nr_contact,adresa_id)
VALUES('Mark', 'Twain','marktwain@gmail.com','42678930203', 5);

INSERT INTO VANZATORI(nume,prenume,email,nr_contact,adresa_id)
VALUES('Mark', 'Ruffalo','markruffalo@gmail.com','37238290472', 6);

INSERT INTO VANZATORI(nume,prenume,email,nr_contact,adresa_id)
VALUES('Scarlett', 'Johanson','scarlettjohanson@gmail.com','4473839943', 7);

INSERT INTO VANZATORI(nume,prenume,email,nr_contact,adresa_id)
VALUES('Downey', 'Robert Jr','robertdowneyjr@gmail.com','3883920102', 8);

INSERT INTO VANZATORI(nume,prenume,email,nr_contact,adresa_id)
VALUES('Baiasu', 'David','davidbaiasu@yahoo.com','073535636', 9);

INSERT INTO VANZATORI(nume,prenume,email,nr_contact,adresa_id)
VALUES('Radita', 'Rebeca','rebecaradita@gmail.com','073535636', 10);


-- Select from VANZATORI
SELECT * FROM VANZATORI
ORDER BY id_vanzatori;



-- Creeare tabel produse

CREATE TABLE PRODUSE(
    id_produse INT DEFAULT PRODUSE_SEQ.NEXTVAL PRIMARY KEY,
    denumire VARCHAR(30),
    categorie_id INT,
    vanzator_id INT,
    cantitate INT,
    volum DECIMAL(5,2),
    pret DECIMAL(5, 2),
    FOREIGN KEY (categorie_id) REFERENCES CATEGORII(id_categorii),
    FOREIGN KEY (vanzator_id) REFERENCES VANZATORI(id_vanzatori)
);

















-- Inserare in tabelul PRODUSE

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('Fond de ten', 1, 2, 163, 12.00, 13.00);

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('Gantere', 2, 6, 1639, 23.00, 125.00);

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('Haltera', 2, 6, 235, 43.00, 232.00);

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('Pudra proteica', 3, 3, 89, 21.00, 100.00);

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('Top de coli', 4, 5, 2080, 16.00, 8.00);

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('The Witcher 3: Wild Hunt', 5, 8, 16390, 8.00, 124.00);

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('Consola Playstation 5', 5, 8, 5345, 24.00, 842.00);

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('Boxa JBL Go 3', 5, 8, 928, 7.00, 89.00);

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('Scaun alb', 6, 10, 181, 136.00, 242.00);

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('Pat matrimonial rosu', 6, 10, 89, 324.00, 896.00);

-- Select from PRODUSE
SELECT * FROM PRODUSE
ORDER BY id_produse;



-- Creeare tabel facturi

CREATE TABLE FACTURI(
    id_facturi INT DEFAULT FACTURI_SEQ.NEXTVAL PRIMARY KEY,
    garantie INT
);


--Inserare in tabelul FACTURI
INSERT INTO FACTURI(garantie)
VALUES(2435656);

INSERT INTO FACTURI(garantie)
VALUES(5748499);

INSERT INTO FACTURI(garantie)
VALUES(5733002);

INSERT INTO FACTURI(garantie)
VALUES(5839490);

INSERT INTO FACTURI(garantie)
VALUES(5930473);

INSERT INTO FACTURI(garantie)
VALUES(2526378);

INSERT INTO FACTURI(garantie)
VALUES(8573783);

INSERT INTO FACTURI(garantie)
VALUES(4849274);

INSERT INTO FACTURI(garantie)
VALUES(1526199);

INSERT INTO FACTURI(garantie)
VALUES(4384992);


-- Select from FACTURI
SELECT * FROM FACTURI
ORDER BY id_facturi;



-- Creeare tabel comenzi

CREATE TABLE COMENZI(
    id_comenzi INT DEFAULT COMENZI_SEQ.NEXTVAL PRIMARY KEY,
    client_id INT,
    data_initiere DATE,
    data_finalizare DATE,
    factura_id INT,
    FOREIGN KEY (client_id) REFERENCES CLIENTI(id_clienti),
    FOREIGN KEY (factura_id) REFERENCES FACTURI(id_facturi)
);


-- Inserare in tabelul COMENZI

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(3,'23-05-2024','24-06-2024',11);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(7,'29-10-2024','31-10-2024',13);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(7,'12-12-2024','14-12-2024',16);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(9,'06-05-2024','13-06-2024',20);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(1,'08-10-2024','11-10-2024',19);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(2,'08-09-2024','09-09-2024',12);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(3,'01-02-2024','03-02-2024',17);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(3,'23-05-2024','24-06-2024',18);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(2,'12-06-2024','14-07-2024',14);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(9,'09-08-2024','11-08-2024',15);


-- Select from COMENZI
SELECT * FROM COMENZI
GROUP BY id_comenzi, client_id, data_initiere, data_finalizare, factura_id;


-- Creeare tabel transport

CREATE TABLE TRANSPORT(
    id_transport INT DEFAULT TRANSPORT_SEQ.NEXTVAL PRIMARY KEY,
    comanda_id INT,
    curier_id INT,
    status VARCHAR(30) NOT NULL CHECK (STATUS IN ('Finalizata', 'Nefinalizata')),
    FOREIGN KEY (comanda_id) REFERENCES COMENZI(id_comenzi),
    FOREIGN KEY (curier_id) REFERENCES CURIERI(id_curieri)
);




-- Inserarea inregistrarilor

INSERT INTO TRANSPORT(comanda_id, curier_id, status)
VALUES(2,1,'Finalizata');

INSERT INTO TRANSPORT(comanda_id, curier_id, status)
VALUES(3,2,'Nefinalizata');

INSERT INTO TRANSPORT(comanda_id, curier_id, status)
VALUES(4,1,'Finalizata');

INSERT INTO TRANSPORT(comanda_id, curier_id, status)
VALUES(5,8,'Finalizata');

INSERT INTO TRANSPORT(comanda_id, curier_id, status)
VALUES(6,3,'Nefinalizata');

INSERT INTO TRANSPORT(comanda_id, curier_id, status)
VALUES(7,7,'Nefinalizata');

INSERT INTO TRANSPORT(comanda_id, curier_id, status)
VALUES(8,4,'Finalizata');

INSERT INTO TRANSPORT(comanda_id, curier_id, status)
VALUES(9,6,'Finalizata');

INSERT INTO TRANSPORT(comanda_id, curier_id, status)
VALUES(10,2,'Finalizata');

INSERT INTO TRANSPORT(comanda_id, curier_id, status)
VALUES(9,10,'Finalizata');


-- Select from TRANSPORT
SELECT * FROM TRANSPORT
ORDER BY id_transport;



-- Creeare tabel depozite
CREATE TABLE DEPOZITE
(
    id_depozite  INT DEFAULT DEPOZITE_SEQ.NEXTVAL PRIMARY KEY,
    denumire     VARCHAR(30),
    adresa_id    INT,
    FOREIGN KEY (adresa_id) REFERENCES ADRESA (id_adresa)
);



-- Inserare in tabelul DEPOZITE

INSERT INTO DEPOZITE(denumire, adresa_id)
VALUES('Depozitul Wallstreet', 1);

INSERT INTO DEPOZITE(denumire, adresa_id)
VALUES('Depozitul Manhattan', 2);

INSERT INTO DEPOZITE(denumire, adresa_id)
VALUES('Depozitul Bucegi', 6);

INSERT INTO DEPOZITE(denumire, adresa_id)
VALUES('Depozitul Dumbrava', 3);

INSERT INTO DEPOZITE(denumire, adresa_id)
VALUES('Depozitul Corbeanca', 4);

INSERT INTO DEPOZITE(denumire, adresa_id)
VALUES('Depozitul Zetarilor', 5);

INSERT INTO DEPOZITE(denumire, adresa_id)
VALUES('Depozitul Montblanc', 7);

INSERT INTO DEPOZITE(denumire, adresa_id)
VALUES('Depozitul Winchester', 9);

INSERT INTO DEPOZITE(denumire, adresa_id)
VALUES('Depozitul Carpati', 10);

INSERT INTO DEPOZITE(denumire, adresa_id)
VALUES('Depozitul Tarnaveni', 8);




-- Select from DEPOZITE
SELECT * FROM DEPOZITE
ORDER BY ID_DEPOZITE;


--Creeare tabel comenzi_produse

CREATE TABLE COMENZI_PRODUSE(
    id_comenzi INT,
    id_produse INT,
    PRIMARY KEY(id_comenzi, id_produse),
    FOREIGN KEY (id_comenzi) REFERENCES COMENZI(id_comenzi),
    FOREIGN KEY (id_produse) REFERENCES PRODUSE(id_produse)
);


-- Inserare in tabelul COMENZI_PRODUSE

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(1,6);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(1,2);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(1,4);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(2,4);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(2,7);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(3,6);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(4,2);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(4,4);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(4,9);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(4,10);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(5,8);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(5,10);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(6,3);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(6,4);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(6,9);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(7,2);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(8,1);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(9,6);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(9,8);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(9,9);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(10,1);

INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
VALUES(10,10);


-- Select from COMENZI_PRODUSE

SELECT * FROM COMENZI_PRODUSE
ORDER BY ID_COMENZI;

-- Creearea tabelului DEPOZITE_PRODUSE
CREATE TABLE DEPOZITE_PRODUSE(
    id_depozite INT,
    id_produse INT,
    PRIMARY KEY(id_depozite, id_produse),
    FOREIGN KEY (id_depozite) REFERENCES DEPOZITE(id_depozite),
    FOREIGN KEY(id_produse) REFERENCES PRODUSE(id_produse)
);

-- Inserarea in tabelul DEPOZITE_PRODUSE

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(1,2);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(1,6);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(1,8);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(2,2);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(3,2);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(3,1);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(4,6);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(4,7);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(5,2);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(5,3);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(5,5);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(5,7);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(6,9);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(7,2);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(7,7);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(8,1);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(8,6);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(8,9);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(9,4);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(9,1);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(10,2);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(10,5);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(10,7);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(10,8);

INSERT INTO DEPOZITE_PRODUSE(id_depozite, id_produse)
VALUES(10,10);

-- Select from DEPOZITE_PRODUSE
SELECT * FROM DEPOZITE_PRODUSE
ORDER BY ID_DEPOZITE;



-- Creearea tabelului DEPOZITE_VANZATORI

CREATE TABLE DEPOZITE_VANZATORI(
    id_depozite INT,
    id_vanzatori INT,
    PRIMARY KEY(id_depozite, id_vanzatori),
    FOREIGN KEY(id_depozite) REFERENCES DEPOZITE(id_depozite),
    FOREIGN KEY(id_vanzatori) REFERENCES VANZATORI(id_vanzatori)
);

-- Inserarea in tabelul DEPOZITE_VANZATORI

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(1,2);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(1,4);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(1,6);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(1,9);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(2,7);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(2,9);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(3,1);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(3,2);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(3,3);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(4,4);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(4,2);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(4,7);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(4,9);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(5,6);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(5,8);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(5,10);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(6,3);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(6,4);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(6,7);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(7,7);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(7,6);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(8,8);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(8,9);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(8,1);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(9,6);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(9,3);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(9,4);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(9,8);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(10,7);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(10,8);

INSERT INTO DEPOZITE_VANZATORI(id_depozite, id_vanzatori)
VALUES(10,10);

-- Select from DEPOZITE_VANZATORI

SELECT * FROM DEPOZITE_VANZATORI
ORDER BY ID_DEPOZITE;


-- Creearea tabelului COMENZI_VANZATORI

CREATE TABLE COMENZI_VANZATORI(
    id_comenzi INT,
    id_vanzatori INT,
    PRIMARY KEY(id_comenzi,id_vanzatori),
    FOREIGN KEY(id_comenzi) REFERENCES COMENZI(id_comenzi),
    FOREIGN KEY(id_vanzatori) REFERENCES VANZATORI(id_vanzatori)
);



-- Inserarea in tabelul COMENZI_VANZATORI

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(1,3);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(1,6);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(1,8);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(2,3);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(2,8);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(3,8);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(4,6);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(4,3);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(4,10);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(5,8);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(5,10);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(6,3);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(6,6);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(6,10);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(7,6);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(8,2);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(9,8);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(9,10);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(10,2);

INSERT INTO COMENZI_VANZATORI(id_comenzi,id_vanzatori)
VALUES(10,10);


-- Select from COMENZI_VANZATORI
SELECT * FROM COMENZI_VANZATORI
ORDER BY ID_COMENZI;




UPDATE FACTURI
SET garantie = CAST(garantie as VARCHAR(30));




-- Cerinta 6:
-- Se doreste realizarea unui subprogram care sa organizeze
-- si sa afiseze informatii despre clienti, produsele comandate si curierul asociat
-- fiecarei comenzi. Subprogramul trebuie sa preia aceste informatii din baza de date, sa le 
-- structureze intr-un mod logic si sa le afiseze intr-un format clar si usor de inteles.

CREATE OR REPLACE PROCEDURE afiseaza_comenzi_clienti_curieri
IS 
    TYPE tabel_produse IS TABLE OF VARCHAR(50);

    v_produse tabel_produse;
    CURSOR cursor_comenzi IS 
        SELECT DISTINCT C.id_comenzi, CL.nume || ' ' || CL.prenume AS client,
                CU.nume || ' ' || CU.prenume AS curier 
        FROM COMENZI C 
        JOIN CLIENTI CL ON C.client_id = CL.id_clienti
        JOIN TRANSPORT T ON C.id_comenzi = T.comanda_id
        JOIN CURIERI CU ON T.curier_id = CU.id_curieri;


    CURSOR cursor_produse(p_comanda_id COMENZI.id_comenzi%TYPE) IS 
        SELECT P.denumire
        FROM COMENZI_PRODUSE CP 
        JOIN PRODUSE P ON CP.id_produse = P.id_produse
        WHERE CP.id_comenzi = p_comanda_id;

    v_comanda_id COMENZI.id_comenzi%TYPE;
    v_client VARCHAR2(50);
    v_curier VARCHAR2(50);
    v_produs VARCHAR2(50);
    v_nicio_comanda BOOLEAN := TRUE; -- Flag pentru verificarea existentei comenzilor

    BEGIN
    OPEN cursor_comenzi;

    LOOP
        FETCH cursor_comenzi INTO v_comanda_id, v_client, v_curier;
        EXIT WHEN cursor_comenzi%NOTFOUND;

        v_nicio_comanda := FALSE; -- Am gasit cel putin o comanda

        -- Afisam clientul
        DBMS_OUTPUT.PUT_LINE('ID Comanda: ' || v_comanda_id);
        DBMS_OUTPUT.PUT_LINE('Client: ' || v_client);
        DBMS_OUTPUT.PUT_LINE('Produse comandate:');

        -- Procesam lista de produse
        OPEN cursor_produse(v_comanda_id);
        LOOP
            FETCH cursor_produse INTO v_produs;
            EXIT WHEN cursor_produse%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE('- ' || v_produs);
        END LOOP;
        CLOSE cursor_produse;
        
        -- Afisam curierul
        DBMS_OUTPUT.PUT_LINE('Curier: ' || v_curier);
        DBMS_OUTPUT.PUT_LINE('----------------------');
    END LOOP;


    CLOSE cursor_comenzi;

    -- Verificam daca nu exista nicio comanda
    IF v_nicio_comanda THEN 
       DBMS_OUTPUT.PUT_LINE('Eroare: Nu exista niciun produs comandat in baza de date.');
    END IF;


 EXCEPTION
   WHEN OTHERS THEN   
        DBMS_OUTPUT.PUT_LINE('A aparut o eroare necunoscuta.');
END afiseaza_comenzi_clienti_curieri;

-- Cerinta 7:
-- Se doreste realizarea unui subprogram care sa evidentieze relatia dintre
-- depozitele din sistem, vanzatorii care furnizeaza produse in fiecare depozit 
-- si produsele disponibile. Subprogramul trebuie sa afiseze, pentru fiecare depozit, 
-- o lista cu vanzatorii care furnizeaza produse si denumirea produselor asociate acestora.
-- Datele trebuie organizate astfel incat sa evidentieze clar legatura dintre depozite,
-- vanzatori si produse.
CREATE OR REPLACE PROCEDURE afiseaza_depozite_vanzatori_produse
IS     
   CURSOR cursor_depozite IS 
       SELECT id_depozite, denumire
       FROM DEPOZITE;

   CURSOR cursor_vanzatori(p_depozit_id DEPOZITE.id_depozite%TYPE) IS   
       SELECT V.nume || ' ' || V.prenume AS vanzator, P.denumire AS produs 
       FROM DEPOZITE_VANZATORI DV 
       JOIN VANZATORI V ON DV.id_vanzatori = V.id_vanzatori
       JOIN DEPOZITE_PRODUSE DP ON DV.id_depozite = DP.id_depozite
       JOIN PRODUSE P ON DP.id_produse = P.id_produse
       WHERE DV.id_depozite = p_depozit_id;

   v_depozit_id DEPOZITE.id_depozite%TYPE;
   v_depozit_denumire DEPOZITE.denumire%TYPE;
   v_vanzator VARCHAR2(100);
   v_produs VARCHAR2(100);

BEGIN
   OPEN cursor_depozite;

   LOOP
      FETCH cursor_depozite INTO v_depozit_id, v_depozit_denumire;
      EXIT WHEN cursor_depozite%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Depozit: ' || v_depozit_denumire || ' (ID: ' || v_depozit_id || ')');
      DBMS_OUTPUT.PUT_LINE('Vanzatori si produse disponibile:');

      -- Deschidem cursorul parametrizat pentru vanzatori si produse
      OPEN cursor_vanzatori(v_depozit_id);
      LOOP
         FETCH cursor_vanzatori INTO v_vanzator, v_produs;
         EXIT WHEN cursor_vanzatori%NOTFOUND;

         DBMS_OUTPUT.PUT_LINE('- Vanzator: ' || v_vanzator || ', Produs: ' || v_produs);
      END LOOP;
      CLOSE cursor_vanzatori;

      DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;

    CLOSE cursor_depozite;
END afiseaza_depozite_vanzatori_produse;


-- Cerinta 8:
-- Se doreste crearea unui subprogram care sa calculeze suma totala a comenzilor efectuate de un anumit
-- client, integrand date din mai multe tabele relevante. Subprogramul trebuie sa gestioneze toate situatiile
-- posibile, cum ar fi lipsa datelor sau erorile neasteptate, si sa returneze rezultate corecte si clare. 

CREATE OR REPLACE FUNCTION total_comenzi_client(p_client_id INT)
RETURN NUMBER 
IS 
   v_total NUMBER := 0;
   
   -- Declaram o exceptie proprie
   ex_data_too_large EXCEPTION;
   
   -- Asociem codul de  eroare 'ORA-01401' cu exceptia proprie
   PRAGMA EXCEPTION_INIT(ex_data_too_large, -1401);
BEGIN
   SELECT SUM(P.pret * CP.id_comenzi)
   INTO v_total
   FROM PRODUSE P 
   JOIN COMENZI_PRODUSE CP ON P.id_produse = CP.id_produse
   JOIN COMENZI C ON CP.id_comenzi = C.id_comenzi
   WHERE C.client_id = P_client_id;


EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Nu exista comenzi pentru acest client.');
        v_total := 0;
    WHEN TOO_MANY_ROWS THEN 
        DBMS_OUTPUT.PUT_LINE('Sunt mai multe randuri decat asteptat. Verificati integritatea datelor. ');
        v_total := -1;
    WHEN VALUE_ERROR THEN 
        DBMS_OUTPUT.PUT_LINE('Eroare de conversie sau valoare prea mare. ');
        v_total := -2;
    WHEN INVALID_CURSOR THEN 
        DBMS_OUTPUT.PUT_LINE('Cursor valid utilizat. ');
        v_total := -4;
    WHEN ex_data_too_large THEN 
        DBMS_OUTPUT.PUT_LINE('Datele prelucrate sunt prea mari pentru campul definit. ');
        v_total := -5;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('O eroare neasteptata a aparut. ');
        v_total := -99;


RETURN v_total;
END total_comenzi_client;

-- Cerinta 9:
-- Se doreste dezvoltarea unui subprogram care sa genereze detalii complete despre 
-- o comanda specifica. Aceste detalii trebuie sa includa informatii despre client, produse,
-- categoria produselor si comanda propriu-zisa, utilizand datele disponibile in baza de date. Subprogramul
-- trebuie sa gestioneze situatiile exceptionale si sa ofere un raspuns detaliat pentru fiecare caz.

CREATE OR REPLACE PROCEDURE detalii_comanda(
    p_comanda_id IN INT,
    p_result OUT VARCHAR2
)
IS  
    v_client VARCHAR2(100);
    v_curier VARCHAR2(100);
    v_produse VARCHAR2(4000); -- Lista concatenata de produse
BEGIN 
    -- Preluam clientul si curierul asociat comenzii
    SELECT CL.nume || ' ' || CL.prenume AS client,
           CU.nume || ' ' || CU.prenume AS curier 
    INTO v_client, v_curier
    FROM COMENZI C         
    JOIN CLIENTI CL ON C.client_id = CL.id_clienti
    JOIN TRANSPORT T ON C.id_comenzi = T.comanda_id 
    JOIN CURIERI CU ON T.curier_id = CU.id_curieri
    WHERE C.id_comenzi = p_comanda_id;

    -- Construim lista de produse comandate 
    SELECT LISTAGG(P.denumire, ', ') WITHIN GROUP (ORDER BY P.denumire)
    INTO v_produse
    FROM COMENZI_PRODUSE CP 
    JOIN PRODUSE P ON CP.id_produse = P.id_produse
    WHERE CP.id_comenzi = p_comanda_id;

    -- Generam rezultatul complet
    p_result := 'Comanda ID: ' || p_comanda_id || CHR(10) ||
                'Client: ' || v_client || CHR(10) ||
                'Produse: ' || v_produse || CHR(10) ||
                'Curier: ' || v_curier;

EXCEPTION
   WHEN NO_DATA_FOUND THEN 
       p_result := 'Nu exista detalii pentru comanda specificata.';
   WHEN OTHERS THEN 
       p_result := 'A aparut o eroare necunoscuta.';
END;

-- Cerinta 10: Trigger de tip LMD la nivel de comanda

CREATE OR REPLACE TRIGGER trg_update_comenzi
AFTER UPDATE ON COMENZI
BEGIN
   DBMS_OUTPUT.PUT_LINE('Comanda a fost actualizata.');
END;

-- Cerinta 11: Trigger de tip LMD la nivel de linie.

CREATE OR REPLACE TRIGGER trg_insert_produse
AFTER INSERT ON PRODUSE 
FOR EACH ROW 
BEGIN 
   DBMS_OUTPUT.PUT_LINE('Produs nou adaugat: ' || :NEW.denumire);
END;

-- Cerinta 12: Trigger de tip LDD.

CREATE OR REPLACE TRIGGER trg_drop_table 
BEFORE DROP ON SCHEMA 
BEGIN 
   DBMS_OUTPUT.PUT_LINE('Tabelul va fi sters. ');
END;

-- Exemple de apeluri

-- Cerinta 6:
-- Apelul procedurii:
BEGIN 
   afiseaza_comenzi_clienti_curieri;
END;


-- Procedura este executata. Informatiile despre comenzile clientilor, produsele
-- comandate si curierii asociati sunt afisate in consola Oracle. In cazul in care nici o
-- comanda nu a fost plasata pana acum, exceptia este tratata si este afisat un mesaj corespunzator.

-- Cerinta 7:
-- Apelul procedurii:
BEGIN
   afiseaza_depozite_vanzatori_produse;
END;

-- Procedura parcurge toate depozitele din baza de date, afiseaza numele fiecarui depozit si,
-- pentru fiecare depozit, listeaza vanzatorii si produsele asociate.


-- Cerinta 8:
-- Apel al procedurii:


DECLARE 
   v_total NUMBER;
BEGIN
   v_total := total_comenzi_client(1); -- ID-ul unui client cu comenzi
   
   -- Afisam doar daca valoarea este pozitiva sau 0 (nu este o eroare)
   IF v_total >= 0 THEN 
       DBMS_OUTPUT.PUT_LINE('Total comenzi: ' || v_total);
   ELSE
      DBMS_OUTPUT.PUT_LINE('Calculul totalului nu a fost posibil din cauza unei erori.');
   END IF;
END;
---------------------------
DECLARE 
   v_total NUMBER;
BEGIN
   v_total := total_comenzi_client(99); -- ID-ul unui client fara comenzi
   
   -- Afisam doar daca valoarea este pozitiva sau 0 (nu este o eroare)
       DBMS_OUTPUT.PUT_LINE('Total comenzi: ' || v_total);
END;
----------------------------
DECLARE 
   v_total NUMBER;
BEGIN
   v_total := total_comenzi_client(NULL); -- ID invalid
   
   -- Afisam doar daca valoarea este pozitiva sau 0 (nu este o eroare)
   IF v_total >= 0 THEN 
       DBMS_OUTPUT.PUT_LINE('Total comenzi: ' || v_total);
   ELSE
      DBMS_OUTPUT.PUT_LINE('Calculul totalului nu a fost posibil din cauza unei erori.');
   END IF;
END;

-- In acest tip de apel sunt tratate cazurile in care clientul selectat a initiat 
-- cel putin o comanda sau nu. In plus, in functie de valoarea introdusa, se pot afisa mesaje
-- corespunzatoare specifice fiecarei exceptii.

-- Exemple de rezultat:

-- 1. Client valid cu comenzi:
-- Total comenzi: 450.00

-- 2. Client fara comenzi:
-- Clientul cu ID-ul 99 nu are nicio comanda plasata.
-- Total comenzi: 0

-- 3. Client invalid (NULL):
-- A aparut o eroare necunoscuta.
-- Calculul totalului nu a fost posibil din cauza unei erori.


-- Cerinta 9:
-- Apel al procedurii:

DECLARE 
   v_result VARCHAR2(4000);
BEGIN
   detalii_comanda(1, v_result); 
   DBMS_OUTPUT.PUT_LINE(v_result);
END;

-- Cazuri posibile:

-- 1. Caz valid: v_result va stoca toate datele asociate unei comenzi

-- 2. Caz invalid (comanda care nu exista): v_result va stoca mesajul corespunzator 
-- exceptiei declansate


-- Cerinta 10:
-- Trigger-ul va fi declansat printr-o operatie de tip UPDATE asupra tabelei COMENZI.

BEGIN
   UPDATE COMENZI
   SET data_finalizare = SYSDATE
   WHERE id_comenzi = 1; -- ID al unei comenzi existente
END;

-- Rezultatul in DBMS_OUTPUT: "Comanda a fost actualizata."

-- Cerinta 11:
-- Trigger-ul va fi declansat printr-o operatie de tip INSERT asupra tabelei PRODUSE.

BEGIN
  INSERT INTO PRODUSE (denumire, categorie_id, vanzator_id, cantitate, volum, pret)
  VALUES ('Televizor', 5, 8, 10, 15.00, 1200.00); -- Produs nou
END;

-- Rezultatul in DBMS_OUTPUT: "Produs nou adaugat: Televizor".

-- Cerinta 12:
-- Trigger-ul va fi declansat printr-o operatie de tip DROP TABLE.

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE TEST_TABLE'; -- Unde TEST_TABLE va fi inlocuit cu o tabela temporara
END;

-- Rezultatul in DBMS_OUTPUT: "Tabelul va fi sters. ".



