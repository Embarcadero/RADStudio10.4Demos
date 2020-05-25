DROP TABLE ad_testbfile;
CREATE TABLE ad_testbfile (f1 VARCHAR2(10) PRIMARY key, f2 BFILE);
INSERT INTO ad_testbfile VALUES ('1', BFILENAME('ADDEMO_DIR', '1.bmp'));
INSERT INTO ad_testbfile VALUES ('2', BFILENAME('ADDEMO_DIR', '2.bmp'));
SELECT Count(*) FROM ad_testbfile;