FireDAC.SQLite Encryption Sample[]()
# FireDAC.SQLite Encryption Sample 


This sample demonstrates how to encrypt/decrypt an [SQLite](http://en.wikipedia.org/wiki/SQLite) database.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Create new DB](#Create_new_DB)
* [5.2 Encrypt DB](#Encrypt_DB)
* [5.3 Change DB pwd](#Change_DB_pwd)
* [5.4 Get state](#Get_state)
* [5.5 Decrypt DB](#Decrypt_DB)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **SQLite Encryption** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\DBMS Specific\SQLite\Encryption`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/SQLite/Encryption/](https://github.com/Embarcadero/RADStudio10.4Demos/tree/master/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/SQLite/Encryption/)

## Description 

The **SQLite Encryption** sample is an encryption/decryption demo. This sample allows the user to perform the following operations:
*  Encrypting the DB using different encryption modes and passwords.
*  Changing the DB password of the encrypted database.
*  Getting the state of the DB.
*  Decrypting the DB.

## How to Use the Sample 


1.  Navigate to the location given above and open `SQLite_Encrypt.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click **Create** in the **Create new DB** tab to:

1.  Create an empty and unencrypted database located at: **C:\Users\test\AppData\Local\Temp\test.sdb**.
2.  Create an empty table into the new database.
3.  Populate the table.

4.  Once the table is added to the database, you can start interacting with the sample.
The table is created according to the code predefined in the TMemo:
```
create table tab (f1 integer, f2 varchar(20));
insert into tab values (1, 'test 1');
insert into tab values (2, 'test 2');
insert into tab values (3, 'test 3');
insert into tab values (4, 'test 4');
insert into tab values (5, 'test 5');

```


## Files 



| File in Delphi                           | Contains          |
|------------------------------------------|-------------------|
|`SQLite_Encrypt.dproj``SQLite_Encrypt.dpr`|The project itself.|
|`fMain.pas``fMain.fmx`                    |The main form.     |


## Implementation 

The sample implements the following features.
### Create new DB 


* **Create**: Creates the database, a table into the database, and populates the table using [TFDScript](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Script.TFDScript) component.
* **Drop**: Removes the database if exists.

### Encrypt DB 


* **Encrypt**: Encrypts the database according to the **Encryption mode** and the password provided.
The sampe uses [TFDSQLiteSecurity.SetPassword](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity.SetPassword) to encrypt the database with the password provided.The database [password](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity.Password) is the combination of <encryption algorythm>:<password>.

### Change DB pwd 

Use this tab to change the password of the encrypted database. The sample uses [TFDSQLiteSecurity.ChangePassword](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity.ChangePassword) to change the password of the encrypted database from [Password](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity.Password) to [ToPassword](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity.ToPassword).
To change the password: 

1.  Write the [new password](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity.ToPassword) in the field.
2.  Click **Change** to update the [password](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity.Password).

### Get state 


* **Get**: Returns the database encryption status.
The sample uses [TFDSQLiteSecurity.CheckEncryption](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity.CheckEncryption) to request the database encryption status.Possible status:

*  <unencrypted>: The database is unencrypted.
*  <encrypted>: The database is encrypted, but the algorythm / password is wrong.
*  Encryption algorythm name, and the data from the database: The database is encrypted, and the algorythm / password are correct.

### Decrypt DB 


* **Decrypt**: Removes the password and decrypts the database.
The sample uses [TFDSQLiteSecurity.RemovePassword](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity.RemovePassword) to remove the password and decrypt the database. 
## Uses 


* [TFDQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDQuery)
* [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TFDSQLiteSecurity](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDSQLiteSecurity)
* [TFDScript](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Script.TFDScript)
* [TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink)

## See Also 


* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [SQLite support in RAD Studio](http://docwiki.embarcadero.com/RADStudio/en/SQLite_support_in_RAD_Studio)
* [Using SQLite with FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Using_SQLite_with_FireDAC)
* [Connect to SQLite database (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_SQLite_database_(FireDAC))
* [Master-Detail Relationship (M/D)](http://docwiki.embarcadero.com/RADStudio/en/Master-Detail_Relationship_(M/D))
* [Mobile Tutorial: Using FireDAC and SQLite (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_FireDAC_and_SQLite_(iOS_and_Android))
* [Tutorial: Connecting to a SQLite Database Using FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Connecting_to_a_SQLite_Database_Using_FireDAC)
* [SQLite Database Questions (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/SQLite_Database_Questions_(FireDAC))





