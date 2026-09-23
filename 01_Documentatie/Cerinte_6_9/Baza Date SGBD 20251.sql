-- Cerinta 6:
-- Se doreste realizarea unui subprogram care sa organizeze
-- si sa afiseze informatii despre clienti, produsele comandate si curierul asociat
-- fiecarei comenzi. Subprogramul trebuie sa preia aceste informatii din baza de date, sa le
-- structureze intr-un mod logic si sa le afiseze intr-un format clar si usor de inteles.
CREATE OR REPLACE PROCEDURE afiseaza_comenzi_clienti_curieri
IS
BEGIN

    DECLARE
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
            EXIT WHEN produse_cursor%NOTFOUND;

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
   
   -- Asociem codul de eroare 'ORA-01401' cu exceptia proprie
   PRAGMA EXCEPTION_INIT(ex_data_too_large, -1401);
BEGIN
   SELECT NVL(SUM(P.pret * CP.id_comenzi), 0)
   INTO v_total
   FROM PRODUSE P
   JOIN COMENZI_PRODUSE CP ON P.id_produse = CP.id_produse
   JOIN COMENZI C ON CP.id_comenzi = C.id_comenzi
   WHERE C.client_id = P_client_id;

   RETURN v_total;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista comenzi pentru acest client.');
        RETURN 0;
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Sunt mai multe randuri decat asteptat. Verificati integritatea datelor.');
        RETURN -1;
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Eroare de conversie sau valoare prea mare.');
        RETURN -2;
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('S-a incercat o diviziune la zero.');
        RETURN -3;
    WHEN INVALID_CURSOR THEN
        DBMS_OUTPUT.PUT_LINE('Cursor invalid utilizat.');
        RETURN -4;
    WHEN ex_data_too_large THEN
        DBMS_OUTPUT.PUT_LINE('Datele prelucrate sunt prea mari pentru campul definit. ');
        RETURN -5;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('O eroare neasteptata a aparut.');
        RETURN -99;
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
   IF v_total = 0 THEN
       DBMS_OUTPUT.PUT_LINE('Nu exista comenzi pentru acest client. ');
   ELSIF v_total > 0 THEN
       DBMS_OUTPUT.PUT_LINE('Total comenzi: ' || v_total);
   ELSE
      DBMS_OUTPUT.PUT_LINE('Calculul totalului nu a fost posibil din cauza unei erori.');
   END IF;
END;


DECLARE
   v_total NUMBER;
BEGIN
   v_total := total_comenzi_client(99); -- ID-ul unui client fara comenzi

   -- Afisam doar daca valoarea este pozitiva sau 0 (nu este o eroare)
   IF v_total = 0 THEN
       DBMS_OUTPUT.PUT_LINE('Nu exista comenzi pentru acest client. ');
   ELSIF v_total > 0 THEN
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

-- 3. Client invalid:
-- A aparut o eroare necunoscuta.
-- Calculul totalului nu a fost posibil din cauza unei erori.


-- Cerinta 9:
-- Apel al procedurii:

DECLARE
   v_result VARCHAR2(4000);
BEGIN
   detalii_comanda(1, v_result); -- ID-ul unei comenzi inexistente
   DBMS_OUTPUT.PUT_LINE(v_result);
END;


DECLARE
   v_result VARCHAR2(4000); 
BEGIN
   detalii_comanda(4, v_result); -- ID-ul unei comenzi existente
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
  VALUES ('Televizor', 5, 8, 10, 15.00, 999.99); -- Produs nou
END;

-- Rezultatul in DBMS_OUTPUT: "Produs nou adaugat: Televizor".

-- Cerinta 12:
-- Trigger-ul va fi declansat printr-o operatie de tip DROP TABLE.

CREATE TABLE TEST_TABLE (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    category CHAR(1),
    valoare NUMBER(10, 2),
    data_calendar DATE
);


INSERT INTO TEST_TABLE (id, name, category, valoare, data_calendar) VALUES (1, 'Name_1', 'A', 674.55, TO_DATE('2025-01-01', 'YYYY-MM-DD'));
INSERT INTO TEST_TABLE (id, name, category, valoare, data_calendar) VALUES (2, 'Name_2', 'C', 548.73, TO_DATE('2025-01-02', 'YYYY-MM-DD'));
INSERT INTO TEST_TABLE (id, name, category, valoare, data_calendar) VALUES (3, 'Name_3', 'B', 342.19, TO_DATE('2025-01-03', 'YYYY-MM-DD'));

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE TEST_TABLE'; -- Unde TEST_TABLE va fi inlocuit cu o tabela temporara
END;

-- Rezultatul in DBMS_OUTPUT: "Tabelul va fi sters. ".

