-- Gerado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   em:        2022-05-24 00:26:36 BST
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_dependente (
    cd_dependente                NUMBER(5) NOT NULL,
    t_funcionario_cd_funcionario NUMBER(5) NOT NULL,
    nm_dependente                VARCHAR2(60) NOT NULL,
    nr_telefone                  NUMBER(15) NOT NULL,
    dt_nascimento                DATE NOT NULL
);

CREATE UNIQUE INDEX t_dependente__idxv1 ON
    t_dependente (
        t_funcionario_cd_funcionario
    ASC );

ALTER TABLE t_dependente ADD CONSTRAINT t_dependente_pk PRIMARY KEY ( cd_dependente );

CREATE TABLE t_deptos (
    cd_depto                     NUMBER(5) NOT NULL,
    t_funcionario_cd_funcionario NUMBER(5) NOT NULL,
    nm_depto                     VARCHAR2(60) NOT NULL
);

ALTER TABLE t_deptos ADD CONSTRAINT t_deptos_pk PRIMARY KEY ( cd_depto );

CREATE TABLE t_funcionario (
    cd_funcionario NUMBER(5) NOT NULL,
    nm_pessoa      VARCHAR2(60) NOT NULL,
    ds_emaill      VARCHAR2(60) NOT NULL,
    nr_rg          NUMBER(12) NOT NULL,
    ds_endereco    VARCHAR2(60) NOT NULL,
    dt_nascimento  DATE NOT NULL,
    nr_telefone    NUMBER(15) NOT NULL,
    vl_salario     NUMBER(7, 2) NOT NULL
);

ALTER TABLE t_funcionario ADD CONSTRAINT t_funcionario_pk PRIMARY KEY ( cd_funcionario );

CREATE TABLE t_implantacao_fintech (
    cd_implantacao               NUMBER(5) NOT NULL,
    t_projeto_fintech_cd_projeto unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    t_deptos_cd_depto            NUMBER(5) NOT NULL,
    vl_custo_operacional         NUMBER(7, 2) NOT NULL,
    dt_inicio                    DATE NOT NULL,
    dt_termino                   DATE
);

ALTER TABLE t_implantacao_fintech ADD CONSTRAINT t_implantacao_fintech_pk PRIMARY KEY ( t_projeto_fintech_cd_projeto,
                                                                                        cd_implantacao );

CREATE TABLE t_projeto_fintech (
    cd_projeto                                         NUMBER(5) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    t_implantacao_fintech_t_projeto_fintech_cd_projeto unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    nm_projeto                                         VARCHAR2(60) NOT NULL,
    vl_investido                                       NUMBER(8, 2) NOT NULL,
    vl_retorno_prevsito                                NUMBER(8, 2) NOT NULL
);

ALTER TABLE t_projeto_fintech ADD CONSTRAINT t_projeto_fintech_pk PRIMARY KEY ( cd_projeto );

ALTER TABLE t_dependente
    ADD CONSTRAINT t_dependente_t_funcionario_fk FOREIGN KEY ( t_funcionario_cd_funcionario )
        REFERENCES t_funcionario ( cd_funcionario );

ALTER TABLE t_deptos
    ADD CONSTRAINT t_deptos_t_funcionario_fk FOREIGN KEY ( t_funcionario_cd_funcionario )
        REFERENCES t_funcionario ( cd_funcionario );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_implantacao_fintech
    ADD CONSTRAINT t_implantacao_fintech_t_deptos_fk FOREIGN KEY ( t_deptos_cd_depto )
        REFERENCES t_deptos ( cd_depto );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_projeto_fintech
    ADD CONSTRAINT t_projeto_fintech_t_implantacao_fintech_fk FOREIGN KEY ( t_implantacao_fintech_t_projeto_fintech_cd_projeto )
        REFERENCES t_implantacao_fintech ( t_projeto_fintech_cd_projeto,
                                           cd_implantacao );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             1
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   5
-- WARNINGS                                 0
