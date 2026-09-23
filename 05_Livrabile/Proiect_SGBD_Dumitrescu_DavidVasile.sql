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
    denumire VARCHAR2(30)
);

-- Inserare in tabelul CATEGORII
INSERT INTO CATEGORII (denumire)
-- VALUES ('Beauty & Make-Up');
--
-- INSERT INTO CATEGORII (denumire)
-- VALUES ('Fitness');
--
-- INSERT INTO CATEGORII (denumire)
-- VALUES ('Nutritie');
--
-- INSERT INTO CATEGORII (denumire)
-- VALUES ('Scoala & Office');
--
-- INSERT INTO CATEGORII (denumire)
-- VALUES ('Jocuri video & Media');
--
-- INSERT INTO CATEGORII (denumire)
-- VALUES ('Mobila');
--
-- -- Select from CATEGORII
-- SELECT * FROM CATEGORII
-- ORDER BY id_categorii;
--








-- Creeare tabel curieri

CREATE TABLE CURIERI
(
    id_curieri INT DEFAULT CURIERI_SEQ.NEXTVAL PRIMARY KEY,
    nume       VARCHAR2(30),
    prenume    VARCHAR2(30),
    email      VARCHAR2(90),
    nr_contact VARCHAR2(14)
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
    nume VARCHAR2(30)
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
    nume VARCHAR2(30),
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
VALUES ('Chatelet', 2);

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
    strada VARCHAR2(90),
    numar VARCHAR2(30),
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
    nume VARCHAR2(30),
    prenume VARCHAR2(30),
    email VARCHAR2(90),
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
    nume VARCHAR2(30),
    prenume VARCHAR2(30),
    email VARCHAR2(90),
    nr_contact VARCHAR2(14),
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
    denumire VARCHAR2(30),
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

-- INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
-- VALUES('Scaun alb', 6, 10, 181, 136.00, 242.00);
--
-- INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
-- VALUES('Pat matrimonial rosu', 6, 10, 89, 324.00, 896.00);
--
-- -- Select from PRODUSE
-- SELECT * FROM PRODUSE
-- ORDER BY id_produse;
























-- Creeare tabel facturi

CREATE TABLE FACTURI(
    id_facturi INT DEFAULT FACTURI_SEQ.NEXTVAL PRIMARY KEY,
    garantie VARCHAR2(30)
);































--Inserare in tabelul FACTURI
INSERT INTO FACTURI(garantie)
VALUES('2435656');

INSERT INTO FACTURI(garantie)
VALUES('5748499');

INSERT INTO FACTURI(garantie)
VALUES('5733002');

INSERT INTO FACTURI(garantie)
VALUES('5839490');

INSERT INTO FACTURI(garantie)
VALUES('5930473');

INSERT INTO FACTURI(garantie)
VALUES('2526378');

INSERT INTO FACTURI(garantie)
VALUES('8573783');

INSERT INTO FACTURI(garantie)
VALUES('4849274');

INSERT INTO FACTURI(garantie)
VALUES('1526199');

INSERT INTO FACTURI(garantie)
VALUES('4384992');







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
VALUES(3,TO_DATE('23-05-2024', 'DD-MM-YYYY'), TO_DATE('24-06-2024', 'DD-MM-YYYY'), 1);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(7, TO_DATE('29-10-2024', 'DD-MM-YYYY'), TO_DATE('31-10-2024', 'DD-MM-YYYY'), 2);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(7, TO_DATE('12-12-2024', 'DD-MM-YYYY'), TO_DATE('14-12-2024', 'DD-MM-YYYY'), 3);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(9, TO_DATE('06-05-2024', 'DD-MM-YYYY'), TO_DATE('13-06-2024', 'DD-MM-YYYY'), 4);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(1, TO_DATE('08-10-2024', 'DD-MM-YYYY'), TO_DATE('11-10-2024', 'DD-MM-YYYY'), 5);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(2, TO_DATE('08-09-2024', 'DD-MM-YYYY'), TO_DATE('09-09-2024', 'DD-MM-YYYY'), 6);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(3, TO_DATE('01-02-2024', 'DD-MM-YYYY'), TO_DATE('03-02-2024', 'DD-MM-YYYY'), 7);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(3, TO_DATE('23-05-2024', 'DD-MM-YYYY'), TO_DATE('24-06-2024', 'DD-MM-YYYY'), 8);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(2, TO_DATE('12-06-2024', 'DD-MM-YYYY'), TO_DATE('14-07-2024', 'DD-MM-YYYY'), 9);

INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
VALUES(9, TO_DATE('09-08-2024', 'DD-MM-YYYY'), TO_DATE('11-08-2024', 'DD-MM-YYYY'), 10);








-- Select from COMENZI
SELECT * FROM COMENZI
ORDER BY id_comenzi;


-- Creeare tabel transport

CREATE TABLE TRANSPORT(
    id_transport INT DEFAULT TRANSPORT_SEQ.NEXTVAL PRIMARY KEY,
    comanda_id INT,
    curier_id INT,
    status VARCHAR2(30) NOT NULL CHECK (STATUS IN ('Finalizata', 'Nefinalizata')),
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
    denumire     VARCHAR2(30),
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












-- Cerinta 6:
-- Se doreste realizarea unui subprogram care sa organizeze
-- si sa afiseze informatii despre clienti, produsele comandate si curierul asociat
-- fiecarei comenzi. Subprogramul trebuie sa preia aceste informatii din baza de date, sa le
-- structureze intr-un mod logic si sa le afiseze intr-un format clar si usor de inteles.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE afiseaza_comenzi_clienti_curieri IS
    TYPE lista_produse IS VARRAY(50) OF VARCHAR2(100);
    produse_comandate lista_produse := lista_produse();

    TYPE lista_comenzi IS TABLE OF COMENZI.id_comenzi%TYPE;
    comenzi_inregistrate lista_comenzi := lista_comenzi();

    TYPE mapare_clienti IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
    clienti_pe_comenzi mapare_clienti;


    CURSOR cursor_comenzi IS
       SELECT C.id_comenzi, CL.nume || ' ' || CL.prenume AS nume_client,
              CU.nume || ' ' || CU.prenume AS nume_curier
       FROM COMENZI C
       JOIN CLIENTI CL ON C.client_id = CL.id_clienti
       JOIN TRANSPORT T ON T.comanda_id = C.id_comenzi
       JOIN CURIERI CU ON CU.id_curieri = T.curier_id;

    CURSOR cursor_produse(id_comanda INT) IS
        SELECT P.denumire
        FROM COMENZI_PRODUSE CP
        JOIN PRODUSE P ON P.id_produse = CP.id_produse
        WHERE CP.id_comenzi = id_comanda;

    comanda_id COMENZI.id_comenzi%TYPE;
    nume_client VARCHAR2(100);
    nume_curier VARCHAR2(100);
    denumire_produs VARCHAR2(100);
    pozitie PLS_INTEGER := 0;
    comenzi_gasite BOOLEAN := FALSE;

BEGIN
    OPEN cursor_comenzi;

    LOOP
        FETCH cursor_comenzi INTO comanda_id, nume_client, nume_curier;
        EXIT WHEN cursor_comenzi%NOTFOUND;

        comenzi_gasite := TRUE;
        pozitie := pozitie + 1;

        comenzi_inregistrate.EXTEND;
        comenzi_inregistrate(pozitie) := comanda_id;

        clienti_pe_comenzi(comanda_id) := nume_client;

        produse_comandate := lista_produse();

        OPEN cursor_produse(comanda_id);
        LOOP
            FETCH cursor_produse INTO denumire_produs;
            EXIT WHEN cursor_produse%NOTFOUND;
            produse_comandate.EXTEND;
            produse_comandate(produse_comandate.COUNT) := denumire_produs;

        end loop;
        CLOSE cursor_produse;

        DBMS_OUTPUT.PUT_LINE('Comanda ID: ' || comanda_id);
        DBMS_OUTPUT.PUT_LINE('Client: ' || nume_client);
        DBMS_OUTPUT.PUT_LINE('Curier: ' || nume_curier);
        DBMS_OUTPUT.PUT_LINE('Produse comandate:');
        FOR i IN 1 .. produse_comandate.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('- ' || produse_comandate(i));

        end loop;
        DBMS_OUTPUT.PUT_LINE('----------------------------');

    end loop;

    CLOSE cursor_comenzi;

    IF NOT comenzi_gasite THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista nicio comanda inregistrata in sistem.');
    end if;

EXCEPTION
   WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('A aparut o eroare: ' || SQLERRM);
END afiseaza_comenzi_clienti_curieri;


-- Cerinta 7:
-- Se doreste realizarea unui subprogram care sa evidentieze relatia dintre
-- depozitele din sistem, vanzatorii care furnizeaza produse in fiecare depozit
-- si produsele disponibile. Subprogramul trebuie sa afiseze, pentru fiecare depozit,
-- o lista cu vanzatorii care furnizeaza produse si denumirea produselor asociate acestora.
-- Datele trebuie organizate astfel incat sa evidentieze clar legatura dintre depozite,
-- vanzatori si produse.


CREATE OR REPLACE PROCEDURE afiseaza_depozite_vanzatori_produse IS

   CURSOR c_depozite IS
       SELECT d.id_depozite, d.denumire
       FROM DEPOZITE d
       ORDER BY d.id_depozite;




   CURSOR c_vanz_prod (p_id_depozit DEPOZITE.id_depozite%TYPE) IS
       SELECT DISTINCT
           v.nume || ' ' || v.prenume AS vanzator,
           p.denumire                 AS produs
       FROM DEPOZITE_VANZATORI dv
       JOIN VANZATORI v       ON v.id_vanzatori = dv.id_vanzatori
       JOIN DEPOZITE_PRODUSE dp ON dp.id_depozite = dv.id_depozite
       JOIN PRODUSE p           ON p.id_produse = dp.id_produse
       WHERE dv.id_depozite = p_id_depozit
       ORDER BY vanzator, produs;

   v_id_depozit DEPOZITE.id_depozite%TYPE;
   v_denumire DEPOZITE.denumire%TYPE;
   exista_depozit BOOLEAN := FALSE;
   are_inregistrari       BOOLEAN;

BEGIN
    OPEN c_depozite;
    LOOP
        FETCH c_depozite INTO v_id_depozit, v_denumire;
        EXIT WHEN c_depozite%NOTFOUND;

        exista_depozit := TRUE;

        DBMS_OUTPUT.PUT_LINE('Depozit: ' || v_denumire || ' (ID: ' || v_id_depozit || ')');
        DBMS_OUTPUT.PUT_LINE('Vanzatori si produse disponibilie:');

        are_inregistrari := FALSE;
        FOR r IN c_vanz_prod(v_id_depozit) LOOP
            are_inregistrari := TRUE;
            DBMS_OUTPUT.PUT_LINE('- Vanzator: ' || r.vanzator || '  | Produs: ' || r.produs);
        end loop;

        IF NOT are_inregistrari THEN
            DBMS_OUTPUT.PUT_LINE('(fara inregistrari pentru acest depozit)');
        end if;

        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    end loop;
    CLOSE c_depozite;

    IF NOT exista_depozit THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista niciun depozit inregistrat.');
    end if;

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('A aparut o eroare: ' || SQLERRM);
end afiseaza_depozite_vanzatori_produse;


-- Cerinta 8:
-- Se doreste crearea unui subprogram care sa calculeze suma totala a comenzilor efectuate de un anumit
-- client, integrand date din mai multe tabele relevante. Subprogramul trebuie sa gestioneze toate situatiile
-- posibile, cum ar fi lipsa datelor sau erorile neasteptate, si sa returneze rezultate corecte si clare.

CREATE OR REPLACE FUNCTION total_valoare_comenzi_client
    (
        p_client_id IN CLIENTI.id_clienti%TYPE
    )
RETURN NUMBER
IS
   v_total NUMBER := 0;
   v_factura_unica COMENZI.factura_id%TYPE;
BEGIN
    SELECT DISTINCT c.factura_id
    INTO v_factura_unica
    FROM COMENZI c
    WHERE c.client_id = p_client_id;

    SELECT NVL(SUM(p.pret), 0)
    INTO v_total
    FROM COMENZI c
    JOIN COMENZI_PRODUSE cp ON cp.id_comenzi = c.id_comenzi
    JOIN PRODUSE P          ON p.id_produse = cp.id_produse
    WHERE c.client_id  = p_client_id;

    RETURN v_total;

EXCEPTION
   WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('INFO: Clientul nu are comenzi inregistrate.');
       RETURN 0;

   WHEN TOO_MANY_ROWS THEN
       DBMS_OUTPUT.PUT_LINE('INFO: Clientul are mai multe facturi. Se calculeaza totalul tuturor comenzilor.');
       SELECT NVL(SUM(p.pret), 0)
        INTO v_total
        FROM COMENZI c
        JOIN COMENZI_PRODUSE cp ON cp.id_comenzi = c.id_comenzi
        JOIN PRODUSE P          ON p.id_produse = cp.id_produse
        WHERE c.client_id = p_client_id;
       RETURN v_total;

   WHEN VALUE_ERROR THEN
       DBMS_OUTPUT.PUT_LINE('EROARE: Parametru invalid (VALUE_ERROR).');
       RETURN -2;

   WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('EROARE neasteptata: ' || SQLERRM);
       RETURN -99;

end total_valoare_comenzi_client;



-- Cerinta 9:
-- Se doreste dezvoltarea unui subprogram care sa genereze detalii complete despre
-- o comanda specifica. Aceste detalii trebuie sa includa informatii despre client, produse,
-- categoria produselor si comanda propriu-zisa, utilizand datele disponibile in baza de date. Subprogramul
-- trebuie sa gestioneze situatiile exceptionale si sa ofere un raspuns detaliat pentru fiecare caz.

CREATE OR REPLACE PROCEDURE detalii_comanda_extinsa
(
    p_id_comanda IN COMENZI.id_comenzi%TYPE,
    p_rezultat   OUT CLOB
)
IS

   e_fara_produse             EXCEPTION;
   e_date_client_incomplete   EXCEPTION;


   v_id           COMENZI.id_comenzi%TYPE;
   v_client       VARCHAR2(200);
   v_email        CLIENTI.email%TYPE;
   v_curier       VARCHAR2(200);
   v_status       TRANSPORT.status%TYPE;
   v_produse      VARCHAR2(4000);

BEGIN
    SELECT
        c.id_comenzi,
        cl.nume || ' ' || cl.prenume AS client,
        cl.email                     AS email_client,
        cu.nume || ' ' || cu.prenume AS curier,
        t.status,
        LISTAGG(p.denumire, ', ') WITHIN GROUP (ORDER BY p.denumire) AS produse
    INTO
        v_id, v_client, v_email, v_curier, v_status, v_produse
    FROM COMENZI c
    JOIN CLIENTI cl     ON cl.id_clienti = c.client_id
    JOIN TRANSPORT t    ON t.comanda_id = c.id_comenzi
    JOIN CURIERI cu     ON cu.id_curieri = t.curier_id
    LEFT JOIN COMENZI_PRODUSE cp ON cp.id_comenzi = c.id_comenzi
    LEFT JOIN PRODUSE p          ON p.id_produse = cp.id_produse
    WHERE c.id_comenzi = p_id_comanda
    GROUP BY c.id_comenzi, cl.nume, cl.prenume, cl.email, cu.nume, cu.prenume, t.status;

    IF v_produse IS NULL THEN
        RAISE e_fara_produse;
    end if;

    IF v_email IS NULL OR TRIM(v_email) IS NULL THEN
        RAISE e_date_client_incomplete;
    end if;

    p_rezultat := 'Comanda ID: ' || v_id || CHR(10) ||
                  'Client: '     || v_client || ' (' || v_email || ')' || CHR(10) ||
                  'Curier: '     || v_curier || CHR(10) ||
                  'Status: '     || v_status || CHR(10) ||
                  'Produse: '    || v_produse;

EXCEPTION
   WHEN NO_DATA_FOUND THEN
       p_rezultat := 'Nu exista nicio comanda cu ID-ul ' || p_id_comanda || '.';

   WHEN TOO_MANY_ROWS THEN
       p_rezultat := 'Au fost gasite mai multe inregistrari pentru comanda ' || p_id_comanda ||
                     ' - verificati integritatea datelor.';

   WHEN e_fara_produse THEN
       p_rezultat := 'Comanda ' || p_id_comanda || ' exista, dar nu are produse asociate.';

   WHEN e_date_client_incomplete THEN
       p_rezultat := 'Comanda ' || p_id_comanda ||
                     ' are date client incomplete (ex: email lipsa).';

   WHEN OTHERS THEN
       p_rezultat := 'A aparut o eroare neasteptata: ' || SQLERRM;
end detalii_comanda_extinsa;

-- Cerinta 10: Trigger de tip LMD la nivel de comanda

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE AUDIT_COMENZI_LOG (
       id_audit         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
       data_eveniment   DATE   DEFAULT SYSDATE,
       utilizator       VARCHAR2(128) DEFAULT SYS_CONTEXT(''USERENV'', ''SESSION_USER''),
       eveniment        VARCHAR2(30),
       obiect           VARCHAR2(128)
    )';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;

CREATE OR REPLACE TRIGGER trg_audit_update_comenzi
AFTER UPDATE ON COMENZI
BEGIN
    INSERT INTO AUDIT_COMENZI_LOG(eveniment, obiect)
    VALUES (ORA_SYSEVENT, 'COMENZI');
END;

-- Cerinta 11: Trigger de tip LMD la nivel de linie.

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE AUDIT_PRODUSE_INS (
      id_audit         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
      data_eveniment   DATE  DEFAULT SYSDATE,
      utilizator       VARCHAR2(128) DEFAULT SYS_CONTEXT(''USERENV'',''SESSION_USER''),
      id_produs        NUMBER,
      denumire         VARCHAR2(100),
      pret             NUMBER(10, 2)
    )';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;

CREATE OR REPLACE TRIGGER trg_audit_insert_produse
AFTER INSERT ON PRODUSE
FOR EACH ROW
BEGIN
    INSERT INTO AUDIT_PRODUSE_INS(id_produs, denumire, pret)
    VALUES (:NEW.id_produse, :NEW.denumire, :NEW.pret);
END;

-- Cerinta 12: Trigger de tip LDD.

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE AUDIT_DDL (
      id_audit        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
      data_eveniment  DATE   DEFAULT SYSDATE,
      utilizator      VARCHAR2(128) DEFAULT SYS_CONTEXT(''USERENV'',''SESSION_USER''),
      eveniment       VARCHAR2(30),
      obiect          VARCHAR2(128),
      tip_obiect      VARCHAR2(30)
    )';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;

CREATE OR REPLACE TRIGGER trg_audit_ddl_drop
BEFORE DROP ON SCHEMA
BEGIN
    INSERT INTO AUDIT_DDL(eveniment, obiect, tip_obiect)
    VALUES (ORA_SYSEVENT, ORA_DICT_OBJ_NAME, ORA_DICT_OBJ_TYPE);
END;

-- Cerinta 13:
-- Se dorește crearea unui pachet PL/SQL care sa permita gestionarea si interogarea comenzilor,
-- clientilor si produselor din baza de date, oferind functionalitati precum obtinerea listelor
-- de produse comandate, calculul valorilor totale ale comenzilor, identificarea clientilor care
-- au comandat produse dintr-o anumita categorie sau intr-o anumita perioada, precum si extragerea
-- altor informatii relevante pentru analiza activitatii comerciale.
-- Acest pachet centralizeaza intr-un singur loc proceduri si functii utile pentru analiza si administrarea
-- datelor, astfel incat sa fie mai usor de reutilizat in diverse scenarii.

CREATE OR REPLACE TYPE tip_produs_obj AS OBJECT
(
    id_produse NUMBER,
    denumire   VARCHAR2(100),
    pret       NUMBER(10, 2)
);


CREATE OR REPLACE TYPE tip_lista_produse AS TABLE OF tip_produs_obj;

CREATE OR REPLACE TYPE tip_lista_numere AS TABLE OF NUMBER;


CREATE OR REPLACE PACKAGE pkg_comenzi_ops AS
    PROCEDURE creeaza_comanda(
        p_client_id    IN CLIENTI.id_clienti%TYPE,
        p_id_produse   IN tip_lista_numere,
        p_id_comanda   OUT COMENZI.id_comenzi%TYPE,
        p_id_factura   OUT FACTURI.id_facturi%TYPE
    );

    PROCEDURE aloca_sau_update_curier(
        p_id_comanda IN COMENZI.id_comenzi%TYPE,
        p_id_curier  IN CURIERI.id_curieri%TYPE,
        p_status     IN TRANSPORT.status%TYPE DEFAULT 'Nefinalizata'
    );

    PROCEDURE afiseaza_sinteza_comanda(
        p_id_comanda IN COMENZI.id_comenzi%TYPE
    );

    FUNCTION total_comanda(
        p_id_comanda IN COMENZI.id_comenzi%TYPE
    ) RETURN NUMBER;

    FUNCTION produse_comanda_pipelined(
        p_id_comanda IN COMENZI.id_comenzi%TYPE
    ) RETURN tip_lista_produse PIPELINED;
  END pkg_comenzi_ops;


  CREATE OR REPLACE PACKAGE BODY pkg_comenzi_ops AS
      e_lista_produse_goala EXCEPTION;
      e_client_inexistent   EXCEPTION;
      e_produs_inexistent   EXCEPTION;
      PRAGMA EXCEPTION_INIT(e_produs_inexistent, -2291);

      PROCEDURE creeaza_comanda(
          p_client_id   IN CLIENTI.id_clienti%TYPE,
          p_id_produse  IN tip_lista_numere,
          p_id_comanda  OUT COMENZI.id_comenzi%TYPE,
          p_id_factura  OUT FACTURI.id_facturi%TYPE
      ) IS
          v_cnt_client NUMBER;
    BEGIN
        IF p_id_produse IS NULL OR p_id_produse.COUNT = 0 THEN
            RAISE e_lista_produse_goala;
        end if;

        SELECT COUNT(*) INTO v_cnt_client
        FROM CLIENTI
        WHERE id_clienti = p_client_id;
        IF v_cnt_client = 0 THEN
            RAISE e_client_inexistent;
        end if;

        INSERT INTO FACTURI(garantie) VALUES (ABS(DBMS_RANDOM.RANDOM));
        SELECT MAX(id_facturi) INTO p_id_factura FROM FACTURI;

        INSERT INTO COMENZI(client_id, data_initiere, data_finalizare, factura_id)
        VALUES (p_client_id, SYSDATE, NULL, p_id_factura)
        RETURNING id_comenzi INTO p_id_comanda;

        FOR i IN 1 .. p_id_produse.COUNT LOOP
            INSERT INTO COMENZI_PRODUSE(id_comenzi, id_produse)
            VALUES (p_id_comanda, p_id_produse(i));
        end loop;

        COMMIT;

    EXCEPTION
       WHEN e_lista_produse_goala THEN
          ROLLBACK;
          RAISE_APPLICATION_ERROR(-20001, 'Lista de produse este goala.');

       WHEN e_client_inexistent THEN
          ROLLBACK;
          RAISE_APPLICATION_ERROR(-20002, 'Clientul nu exista.');

       WHEN e_produs_inexistent THEN
          ROLLBACK;
          RAISE_APPLICATION_ERROR(-20003, 'Unul sau mai multe produse nu exista (FK).');

       WHEN OTHERS THEN
          ROLLBACK;
          RAISE;
    end creeaza_comanda;

    PROCEDURE aloca_sau_update_curier(
        p_id_comanda IN COMENZI.id_comenzi%TYPE,
        p_id_curier  IN CURIERI.id_curieri%TYPE,
        p_status     IN TRANSPORT.status%TYPE
    ) IS
        v_exist NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_exist
        FROM TRANSPORT
        WHERE comanda_id = p_id_comanda;

        IF v_exist = 0 THEN
            INSERT INTO TRANSPORT(comanda_id, curier_id, status)
            VALUES (p_id_comanda, p_id_curier, p_status);
        ELSE
            UPDATE TRANSPORT
                SET curier_id = p_id_curier,
                    status = p_status
            WHERE comanda_id = p_id_comanda;
        end if;

        COMMIT;

    EXCEPTION
      WHEN OTHERS THEN
         ROLLBACK;
         RAISE;
    END aloca_sau_update_curier;

    PROCEDURE afiseaza_sinteza_comanda(
        p_id_comanda IN COMENZI.id_comenzi%TYPE
    ) IS
      v_client  VARCHAR2(200);
      v_curier  VARCHAR2(200);
      v_status  TRANSPORT.status%TYPE;
      v_total   NUMBER;
    BEGIN
        SELECT cl.nume || ' ' || cl.prenume,
               NVL(cu.nume || ' ' || cu.prenume, '-'),
               NVL(t.status, '-')
        INTO v_client, v_curier, v_status
        FROM COMENZI c
        JOIN CLIENTI cl ON cl.id_clienti = c.client_id
        LEFT JOIN TRANSPORT t ON t.comanda_id = c.id_comenzi
        LEFT JOIN CURIERI cu ON cu.id_curieri = t.curier_id
        WHERE c.id_comenzi = p_id_comanda;

        v_total := total_comanda(p_id_comanda);

        DBMS_OUTPUT.PUT_LINE('Comanda ID: ' || p_id_comanda);
        DBMS_OUTPUT.PUT_LINE('Client: ' || v_client);
        DBMS_OUTPUT.PUT_LINE('Curier: ' || v_curier);
        DBMS_OUTPUT.PUT_LINE('Status: ' || v_status);
        DBMS_OUTPUT.PUT_LINE('Total: ' || TO_CHAR(v_total, 'FM999G999D00'));
        DBMS_OUTPUT.PUT_LINE('Produse:');

        FOR r IN (SELECT * FROM TABLE(produse_comanda_pipelined(p_id_comanda))) LOOP
            DBMS_OUTPUT.PUT_LINE(' - ' || r.denumire || ' (' || TO_CHAR(r.pret, 'FM999G999D00') || ')');
        end loop;

    EXCEPTION
       WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('Nu exista comanda cu ID ' || p_id_comanda || '.');
    END afiseaza_sinteza_comanda;

    FUNCTION total_comanda(
        p_id_comanda IN COMENZI.id_comenzi%TYPE
    ) RETURN NUMBER IS
      v_total NUMBER;
    BEGIN
        SELECT NVL(SUM(p.pret), 0)
            INTO v_total
            FROM COMENZI_PRODUSE cp
            JOIN PRODUSE p ON p.id_produse = cp.id_produse
           WHERE cp.id_comenzi = p_id_comanda;
          RETURN v_total;
        END total_comanda;


        FUNCTION produse_comanda_pipelined(
            p_id_comanda IN COMENZI.id_comenzi%TYPE
        ) RETURN tip_lista_produse PIPELINED IS
      BEGIN
          FOR r IN (
              SELECT p.id_produse, p.denumire, p.pret
              FROM COMENZI_PRODUSE cp
              JOIN PRODUSE p ON p.id_produse = cp.id_produse
              WHERE cp.id_comenzi = p_id_comanda
              ORDER BY p.denumire
            ) LOOP
              PIPE ROW ( tip_produs_obj(r.id_produse, r.denumire, r.pret) );

            end loop;
            RETURN;
    end produse_comanda_pipelined;

  END pkg_comenzi_ops;

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

SELECT total_valoare_comenzi_client(1) FROM dual;
SELECT total_valoare_comenzi_client(7) FROM dual;
SELECT total_valoare_comenzi_client(99) FROM dual;



-- Cerinta 9:

DECLARE x CLOB;
BEGIN detalii_comanda_extinsa(4, x);
DBMS_OUTPUT.PUT_LINE(x);
END;

-- Cerinta 10:
-- Trigger-ul va fi declansat printr-o operatie de tip UPDATE asupra tabelei COMENZI.

UPDATE COMENZI SET data_finalizare = NVL(data_finalizare, data_initiere) WHERE id_comenzi = 1; COMMIT;
SELECT * FROM AUDIT_COMENZI_LOG ORDER BY id_audit DESC;

-- Cerinta 11:
-- Trigger-ul va fi declansat printr-o operatie de tip INSERT asupra tabelei PRODUSE.

INSERT INTO PRODUSE(denumire, categorie_id, vanzator_id, cantitate, volum, pret)
VALUES('Produs audit demo',1,2,10,1,9.99); COMMIT;
SELECT * FROM AUDIT_PRODUSE_INS ORDER BY id_audit DESC;


-- Cerinta 12:
-- Trigger-ul va fi declansat printr-o operatie de tip DROP TABLE.

CREATE TABLE T_TEST_DROP (id NUMBER);
DROP TABLE T_TEST_DROP PURGE;
SELECT * FROM AUDIT_DDL ORDER BY id_audit DESC;


-- Cerinta 13:

VARIABLE v_id_comanda NUMBER
VARIABLE v_id_factura NUMBER
VARIABLE v_total      NUMBER

-- 13.a Creare comanda noua
BEGIN
    pkg_comenzi_ops.creeaza_comanda(
       p_client_id  => 1,
       p_id_produse => tip_lista_numere(1, 2, 6),
       p_id_comanda => :v_id_comanda,
       p_id_factura => :v_id_factura
    );
end;

PRINT v_id_comanda
PRINT v_id_factura

-- 13.b Alocare/actualizare curier
BEGIN
    pkg_comenzi_ops.aloca_sau_update_curier(
      p_id_comanda => :v_id_comanda,
      p_id_curier  => 2,
      p_status     => 'Finalizata'
    );
end;

-- 13.c Totalul comenzii
BEGIN
    :v_total := pkg_comenzi_ops.total_comanda(:v_id_comanda);
end;

PRINT v_total;

-- 13.d Sinteza comenzii (client, curier, status, total, produse)
BEGIN
    pkg_comenzi_ops.afiseaza_sinteza_comanda(:v_id_comanda);
end;

-- 13.e Functia PIPELINED - lista de produse (interogata ca tabel)
SELECT *
FROM TABLE(pkg_comenzi_ops.produse_comanda_pipelined(:v_id_comanda));