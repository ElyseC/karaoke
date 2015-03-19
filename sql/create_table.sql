#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


CREATE TABLE T_USER_USR(
        USR_ID    int (11) Auto_increment  NOT NULL ,
        USR_LOG   Varchar (32) NOT NULL ,
        USR_MAIL  Varchar (128) NOT NULL ,
        USR_PWD   Varchar (255) NOT NULL ,
        USR_COLOR Varchar (6) ,
        PRIMARY KEY (USR_ID )
)ENGINE=InnoDB;


CREATE TABLE T_VIDEO_VID(
        VID_ID    int (11) Auto_increment  NOT NULL ,
        VID_TITLE Varchar (32) NOT NULL ,
        VID_YEAR  Year ,
        VID_SBT   Bool NOT NULL ,
        PAY_ID    Int ,
        PRIMARY KEY (VID_ID )
)ENGINE=InnoDB;


CREATE TABLE TR_PAYS_PAY(
        PAY_ID  int (11) Auto_increment  NOT NULL ,
        PAY_NOM Varchar (45) NOT NULL ,
        PRIMARY KEY (PAY_ID )
)ENGINE=InnoDB;


CREATE TABLE T_ARTIST_ART(
        ART_ID  int (11) Auto_increment  NOT NULL ,
        ART_NOM Varchar (128) NOT NULL ,
        PRIMARY KEY (ART_ID )
)ENGINE=InnoDB;


CREATE TABLE TJ_NOTE_NOT(
        NOT_VAL Int NOT NULL ,
        USR_ID  Int NOT NULL ,
        VID_ID  Int NOT NULL ,
        PRIMARY KEY (USR_ID ,VID_ID )
)ENGINE=InnoDB;


CREATE TABLE TJ_REALISE_REA(
        ART_ID Int NOT NULL ,
        VID_ID Int NOT NULL ,
        PRIMARY KEY (ART_ID ,VID_ID )
)ENGINE=InnoDB;

ALTER TABLE T_VIDEO_VID ADD CONSTRAINT FK_T_VIDEO_VID_PAY_ID FOREIGN KEY (PAY_ID) REFERENCES TR_PAYS_PAY(PAY_ID);
ALTER TABLE TJ_NOTE_NOT ADD CONSTRAINT FK_TJ_NOTE_NOT_USR_ID FOREIGN KEY (USR_ID) REFERENCES T_USER_USR(USR_ID);
ALTER TABLE TJ_NOTE_NOT ADD CONSTRAINT FK_TJ_NOTE_NOT_VID_ID FOREIGN KEY (VID_ID) REFERENCES T_VIDEO_VID(VID_ID);
ALTER TABLE TJ_REALISE_REA ADD CONSTRAINT FK_TJ_REALISE_REA_ART_ID FOREIGN KEY (ART_ID) REFERENCES T_ARTIST_ART(ART_ID);
ALTER TABLE TJ_REALISE_REA ADD CONSTRAINT FK_TJ_REALISE_REA_VID_ID FOREIGN KEY (VID_ID) REFERENCES T_VIDEO_VID(VID_ID);
