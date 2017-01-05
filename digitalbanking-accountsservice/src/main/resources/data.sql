 
CREATE TABLE IF NOT EXISTS CUSTOMER  
 ( 
 CUSTOMER_ID INTEGER NOT NULL, 
 CUSTOMER_NAME CHARACTER VARYING(20)  NOT NULL, 
 PASSWORD CHARACTER VARYING(20) , 
 LAST_LOGIN DATE, 
 MOBILE_NO INTEGER, 
 EMAIL_ID CHARACTER VARYING(50) , 
 CONSTRAINT PK_CUSTID PRIMARY KEY (CUSTOMER_ID) 
  ) 
 WITH ( 
   OIDS = FALSE 
 ); 
 
 
 ALTER TABLE CUSTOMER 
 OWNER TO POSTGRES; 


  CREATE TABLE IF NOT EXISTS ACCOUNT 
 ( 
     ACCOUNT_NO INTEGER NOT NULL, 
     CUSTOMER_ID INTEGER, 
     IFSC_CODE CHARACTER VARYING(30)  NOT NULL, 
     ACCOUNT_TYPE CHARACTER VARYING(20)  NOT NULL, 
     ACCOUNT_BALANCE DOUBLE PRECISION NOT NULL, 
     ACCOUNT_CREATION_DATE DATE, 
     ACCOUNT_STATUS BOOLEAN NOT NULL, 
     CONSTRAINT PK_ACCNO PRIMARY KEY (ACCOUNT_NO), 
     CONSTRAINT ACCOUNT_CUSTOMER_ID_FKEY FOREIGN KEY (CUSTOMER_ID) 
     REFERENCES PUBLIC.CUSTOMER (CUSTOMER_ID) MATCH SIMPLE 
     ON UPDATE NO ACTION 
     ON DELETE NO ACTION 
 ) 
; 
ALTER TABLE PUBLIC.ACCOUNT     OWNER TO POSTGRES;


INSERT INTO	 CUSTOMER ("customer_id", "customer_name", "password", "last_login", "mobile_no", "email_id") VALUES 
 (556677,	'Raja',	'capg123',	NULL,	NULL,	NULL), 
 (556678,	'Mahesh',	'capg123',	NULL,	NULL,	NULL) ON CONFLICT (customer_id) DO NOTHING; 

 
 INSERT INTO ACCOUNT ("account_no", "customer_id", "ifsc_code", "account_type", "account_balance", "account_creation_date", "account_status") VALUES 
 (355245,	556677,	'DBSB238',	'S',	25000,	'2016-11-12',	't'), 
 (355230,	556677,	'DBSB234',	'S',	5000,	'2016-11-08',	't'), 
 (355650,	556677,	'DBSB274',	'S',	50000,	'2016-12-03',	't'), 
 (355680,	556678,	'DBSB244',	'S',	50000,	'2016-01-03',	't'), 
 (3557230,	556678,	'DBSB294',	'S',	50000,	'2016-11-11',	't') ON CONFLICT (account_no) DO NOTHING; 
