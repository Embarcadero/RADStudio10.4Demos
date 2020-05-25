SET SQL DIALECT 3;

SET NAMES NONE;

CREATE DATABASE '127.0.0.1:C:\Interbase_DB\MEETINGORGANIZER.GDB'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 1024
DEFAULT CHARACTER SET NONE;



/******************************************************************************/
/****                              Generators                              ****/
/******************************************************************************/

CREATE GENERATOR GEN_AUTLOG_ID;
SET GENERATOR GEN_AUTLOG_ID TO 0;

CREATE GENERATOR GEN_MEETING_ID;
SET GENERATOR GEN_MEETING_ID TO 0;

CREATE GENERATOR GEN_MSGLOG_ID;
SET GENERATOR GEN_MSGLOG_ID TO 0;

CREATE GENERATOR GEN_ROOM_ID;
SET GENERATOR GEN_ROOM_ID TO 0;

CREATE GENERATOR GEN_USERS_ID;
SET GENERATOR GEN_USERS_ID TO 0;



/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE AUTLOG (
    AUTLOG_ID  INTEGER NOT NULL,
    LOGINNAME  VARCHAR(10),
    LOGINDATE  DATE,
    LOGINTIME  TIME
);


CREATE TABLE MEETING (
    MEETING_ID  INTEGER NOT NULL,
    TOPIC       VARCHAR(100),
    DURATION    INTEGER,
    STARTDATE   DATE,
    STARTTIME   TIME,
    USER_ID     INTEGER NOT NULL,
    ROOM_ID     INTEGER NOT NULL,
    LASTCHANGE  TIMESTAMP
);


CREATE TABLE MSGLOG (
    MSGLOG_ID  INTEGER NOT NULL,
    EMAIL      VARCHAR(60),
    MSG        VARCHAR(256),
    SENT       CHAR(1)
);


CREATE TABLE PARTICIPANT (
    USER_ID     INTEGER NOT NULL,
    MEETING_ID  INTEGER NOT NULL
);


CREATE TABLE ROOM (
    ROOM_ID   INTEGER NOT NULL,
    LOCATION  VARCHAR(50),
    NAME      VARCHAR(30),
    CAPACITY  INTEGER
);


CREATE TABLE TIMESLOTS (
    MEETINGTIME  TIME NOT NULL
);


CREATE TABLE USERS (
    USER_ID  INTEGER NOT NULL,
    NAME     VARCHAR(40),
    EMAIL    VARCHAR(60),
    PHONE    VARCHAR(20),
    LOGIN    VARCHAR(10),
    PASSW    VARCHAR(10),
    ISADMIN  CHAR(1)
);



/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE AUTLOG ADD CONSTRAINT AUTLOG_PK PRIMARY KEY (AUTLOG_ID);
ALTER TABLE MEETING ADD CONSTRAINT MEETING_PK PRIMARY KEY (MEETING_ID);
ALTER TABLE MSGLOG ADD CONSTRAINT MSGLOG_PK PRIMARY KEY (MSGLOG_ID);
ALTER TABLE PARTICIPANT ADD CONSTRAINT PARTICIPANT_PK PRIMARY KEY (USER_ID, MEETING_ID);
ALTER TABLE ROOM ADD CONSTRAINT ROOM_PK PRIMARY KEY (ROOM_ID);
ALTER TABLE TIMESLOTS ADD CONSTRAINT PK_TIMESLOTS PRIMARY KEY (MEETINGTIME);
ALTER TABLE USERS ADD CONSTRAINT USERS_PK PRIMARY KEY (USER_ID);

/******************************************************************************/
/****                             Foreign Keys                             ****/
/******************************************************************************/

ALTER TABLE MEETING ADD CONSTRAINT MEETING_ROOM_FK FOREIGN KEY (ROOM_ID) REFERENCES ROOM (ROOM_ID);
ALTER TABLE MEETING ADD CONSTRAINT MEETING_USERS_FK FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID);
ALTER TABLE PARTICIPANT ADD CONSTRAINT PARTICIPANT_MEETING_FK FOREIGN KEY (MEETING_ID) REFERENCES MEETING (MEETING_ID);
ALTER TABLE PARTICIPANT ADD CONSTRAINT PARTICIPANT_USERS_FK FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID);


/******************************************************************************/
/****                               Triggers                               ****/
/******************************************************************************/


SET TERM ^ ;


/******************************************************************************/
/****                         Triggers for tables                          ****/
/******************************************************************************/



/* Trigger: AUTLOG_BI */
CREATE TRIGGER AUTLOG_BI FOR AUTLOG
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF ((NEW.AUTLOG_ID IS NULL) OR (NEW.AUTLOG_ID = 0)) THEN
    NEW.AUTLOG_ID = GEN_ID(GEN_AUTLOG_ID,1);
END
^


/* Trigger: MEETING_BI */
CREATE TRIGGER MEETING_BI FOR MEETING
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF ((NEW.MEETING_ID IS NULL) OR (NEW.MEETING_ID = 0)) THEN
    NEW.MEETING_ID = GEN_ID(GEN_MEETING_ID,1);
END
^


/* Trigger: MSGLOG_BI */
CREATE TRIGGER MSGLOG_BI FOR MSGLOG
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF ((NEW.MSGLOG_ID IS NULL) OR (NEW.MSGLOG_ID = 0)) THEN
    NEW.MSGLOG_ID = GEN_ID(GEN_MSGLOG_ID,1);
END
^


/* Trigger: ROOM_BI */
CREATE TRIGGER ROOM_BI FOR ROOM
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF ((NEW.ROOM_ID IS NULL) OR (NEW.ROOM_ID = 0)) THEN
    NEW.ROOM_ID = GEN_ID(GEN_ROOM_ID,1);
END
^


/* Trigger: USERS_BI */
CREATE TRIGGER USERS_BI FOR USERS
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF ((NEW.USER_ID IS NULL) OR (NEW.USER_ID = 0)) THEN
    NEW.USER_ID = GEN_ID(GEN_USERS_ID,1);
END
^


SET TERM ; ^

INSERT INTO USERS (USER_ID, NAME, EMAIL, PHONE, LOGIN, PASSW, ISADMIN) VALUES (0, 'Borland', 'esteam@borland.com', '1234567890', 'borland', 'borland', 'Y');
COMMIT;
