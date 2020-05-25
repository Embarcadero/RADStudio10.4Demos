About
-------

FireDAC PostgreSQL is capable to recognize and read/write PostgreSQL Large Objects (LO).
The recognition is controlled by OidAsBlob connection definition parameter. More about that:
http://docwiki.embarcadero.com/RADStudio/XE7/en/Connect_to_PostgreSQL_(FireDAC)
http://www.postgresql.org/docs/9.3/static/lo.html

This demo demonstartes how to write and image into LO field and how to read it.
The main requirement for LO - all operations with LO must be performed in a transaction.

Setup
-------

1) Run create.sql.
2) Open project and setup FDConnection1 according your environment.

Usage
-------

1) Run application.
2) To add a picture to table (modify LO content):
- press "Start TX" button
- press "Open / Close" button
- press "Add picture" button and choose PNG file (sample image is in application folder)
- set other field values and post changes
- press "End TX"
3) To read table with pictures (read LO content):
- press "Start TX" button
- press "Open / Close" button
- press "End TX"
