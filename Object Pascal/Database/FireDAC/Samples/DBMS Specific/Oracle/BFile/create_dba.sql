DROP DIRECTORY addemo_dir;
REM Set the path according to your system
CREATE DIRECTORY addemo_dir AS 'e:\oracle\demo';
REM Set the username according to your setup
GRANT read, write ON DIRECTORY addemo_dir TO addemo;
