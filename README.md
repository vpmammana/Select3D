# Select3D

Spheric 3D visualization of database "SELECT" results (including images) 

MAIN file: fotos_hiper.php
SUPPORTING FILES: jpg extensions and sql extension
This example version uses MYSQL as database server.

// "Ver3D" Software. (executable filename: fotos_hiper.php)

// This is free software for spheric visualization  of "SELECT" results obtained from a QUERY applied to a given database. 

// This version is for collaborative development. This version only works on CHROME - Please, help to PORT it!

//

// This software was developed by Victor Mammana in June, 2019.

//

// You are free to use this version, provided it is not used for fascists purposes.

//

// A dummy database is provided in the file "Ver3D.sql". Just upload it to MYSQL using the command "mysql -u user -p Ver3D < 

Ver3D.sql". Before uploading it, don't forget to create in on MYSQL prompt, by use of "create database Ver3D". Don't forget 

to grant privileges to "desenvolvedor" user, through "grant all privileges on Ver3D.* to etc... etc...  

// The database is called Ver3D (translated to English it would sound something like "Watch3D" or "3DView").

// The "Ver3D" example database is available at the repository and it is constituted of 2 tables: eventos (events) and fotos 

(photos). The name "eventos" is totally incidental, so change it for the name you prefer. 

// The tables of Ver3D database are described as follows:

//

// TABLE EVENTOS (disrefard the name of the table and change it for the name you prefer)

// mysql> desc eventos;

// TABLE EVENTOS (disrefard the name of the table and change it for the name you prefer)

// mysql> desc eventos;

//+-----------+--------------+------+-----+---------+----------------+

//| Field     | Type         | Null | Key | Default | Extra          |

//+-----------+--------------+------+-----+---------+----------------+

//| id        | int(11)      | NO   | PRI | NULL    | auto_increment |

//| descricao | varchar(100) | YES  |     | NULL    |                |

//+-----------+--------------+------+-----+---------+----------------+

// comments: contains the description of the events (field "descricao") and a primary auto_increment key: field "id".

//

//TABLE FOTOS (translation to English: Photos)

//mysql> desc fotos;

//+-----------+-------------+------+-----+---------+----------------+

//| Field     | Type        | Null | Key | Default | Extra          |

//+-----------+-------------+------+-----+---------+----------------+

//| id        | int(11)     | NO   | PRI | NULL    | auto_increment |

//| path      | varchar(10) | YES  |     | NULL    |                |

//| id_evento | int(11)     | YES  | MUL | NULL    |                |

//+-----------+-------------+------+-----+---------+----------------+

// comments: "id" is a auto_increment key, 

//           "path" is the name of the file with path, respecful to html directory where APACHE looks for its php files. 

//           Put images (jpg or png) in any directory below "../html" directory and guarantee that the APACHE user has 
privileges to 

//               access it

//           "id_evento" is a cross reference to "id" from TABLE EVENTOS

//

// Modify the database to make it useful for your needs.

// 20 jpg files are provided for testing. Just substitute it by your own images. Your files can be named as desired. Just put 
the names of your files on the "path" field. For simplicity, the example files were named with numbers (1 to 20.jpg).

// 

// There is a unique key to avoid two diffent register on "fotos" with the same "id_evento"/"path" just to avoid duplicity.

//

// The challenges that need to be improved are:

//

// a) include "photographic hole box" perspective, to improve the 3D appearance of the screen

// b) perhaps substtute the management of 3D appearance by some solution available on CSS  

// c) improve the downloading speed by use of some real time thumbnail conversion, instead of the full image download

// d) improve the 3D appearance of the DIV components

// e) make it work on FIREFOX, SAFARI and INTERNET EXPLORER (it only works on Chrome)

// f) avoid the squared appearance of div components, making it showup on perspective

// g) fix some bugs on the extremes of the algorithm. For example, when the scroll hits the end of the list of registers.





