SET SERVEROUTPUT ON;

-- Cerinta 6:
-- Se doreste realizarea unui subprogram care sa organizeze
-- si sa afiseze informatii despre clienti, produsele comandate si curierul asociat
-- fiecarei comenzi. Subprogramul trebuie sa preia aceste informatii din baza de date, sa le
-- structureze intr-un mod logic si sa le afiseze intr-un format clar si usor de inteles.


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