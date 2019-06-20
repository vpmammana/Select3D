<script>
// "Ver3D" Software. (executable filename: fotos_hiper.php)
// This is free software for spheric visualization  of "SELECT" results obtained from a QUERY applied to a given database. 
// This version is for collaborative development. This version only works on CHROME - Please, help to PORT it!
//
// This software was developed by Victor Mammana in June, 2019.
//
// You are free to use this version, provided it is not used for fascists purposes.
//
// A dummy database is provided in the file "Ver3D.sql". Just upload it to MYSQL using the command "mysql -u user -p Ver3D < Ver3D.sql". Before uploading it, don't forget to create in on MYSQL prompt, by use of "create database Ver3D". Don't forget to grant privileges to "desenvolvedor" user, through "grant all privileges on Ver3D.* to etc... etc...  
// The database is called Ver3D (translated to English it would sound something like "Watch3D" or "3DView").
// The "Ver3D" example database is available at the repository and it is constituted of 2 tables: eventos (events) and fotos (photos). The name "eventos" is totally incidental, so change it for the name you prefer. 
// The tables of Ver3D database are described as follows:
//
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
//           Put images (jpg or png) in any directory below "../html" directory and guarantee that the APACHE user has privileges to 
//               access it
//           "id_evento" is a cross reference to "id" from TABLE EVENTOS
//
// Modify the database to make it useful for your needs.
// 20 jpg files are provided for testing. Just substitute it by your own images. Your files can be named as desired. Just put the names of your files on the "path" field. For simplicity, the example files were named with numbers (1 to 20.jpg).
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

var delta;
var larg_primeiro=90;
var fator=0.5;
var divisao=4;
var alt_corte=5;

var evidente=1;
var max_reg=0;
window.addEventListener('wheel', trata_wheel);
window.document.body.style.zoom = "1.0";


function mostra(evidente, meio, max){
var largura = document.body.clientWidth;
var larg_percent=0.8;
max_reg=max;
console.log(evidente);
document.getElementById(evidente).style.display="block";
document.getElementById(evidente).style.position="absolute";
document.getElementById(evidente).align="center";
document.getElementById(evidente).style.left=Math.trunc((largura-largura*larg_percent)/2)+"px";
document.getElementById(evidente).style.height=larg_primeiro+"px";
document.getElementById(evidente).style.fontSize=Math.trunc(larg_primeiro/divisao)+"px";

document.getElementById(evidente).style.width=Math.trunc(largura*larg_percent)+"px";

document.getElementById(evidente).style.top=Math.trunc(meio-larg_primeiro/2)+"px";
document.getElementById(evidente).style.border="1px solid black";

// teste de Children
  var c = document.getElementsByName("img_"+evidente);
  var j;
  for (j = 0; j < c.length; j++) {
    c[j].style.height=larg_primeiro+"px";
  }

//


var top_antes;
var alt_antes;
var top_depois;
var top_depois_menos_meio;
var razao;
var arco;
var cos;
var alt_depois;
var bottom;
console.log(largura);
var i=evidente;
do {
  i++;

	document.getElementById(i).style.display="block";
	document.getElementById(i).style.position="absolute";
	document.getElementById(i).align="center";

	top_antes=(+document.getElementById(i-1).style.top.replace('px',''));
	alt_antes=(+document.getElementById(i-1).style.height.replace('px',''));
	top_depois=(top_antes)+(alt_antes);

	document.getElementById(i).style.top=top_depois+"px";

	top_depois_menos_meio=(top_depois)-meio;
	razao=top_depois_menos_meio/(meio);
	arco=Math.asin(razao);
	cos=Math.cos(arco);
	alt_depois=(larg_primeiro)*cos;
	bottom=(alt_depois+top_depois);
	document.getElementById(i).style.fontSize=Math.trunc(alt_depois/divisao)+"px";
	document.getElementById(i).style.width=Math.trunc(largura*larg_percent*cos)+"px";
	document.getElementById(i).style.left=Math.trunc((largura-(largura*larg_percent*cos))/2)+"px";

	document.getElementById(i).style.height=alt_depois+"px";
// teste de Children
  var c = document.getElementsByName("img_"+i);
  var j;
  for (j = 0; j < c.length; j++) {
    c[j].style.height=alt_depois+"px";
  }

//


	console.log("i>"+i+" arco="+arco+" bottom:"+bottom+" meio*2:"+meio*2);
}
	while ((i < max) && (bottom<(meio*2)) && (alt_depois>alt_corte)); 

if (i<max){document.getElementById(i+1).style.display="none";}


var i=evidente;
if (i>1){
do {
  i--;

	document.getElementById(i).style.display="block";
	document.getElementById(i).style.position="absolute";
	document.getElementById(i).align="center";

	top_antes=(+document.getElementById(i+1).style.top.replace('px',''));
	alt_antes=(+document.getElementById(i+1).style.height.replace('px',''));
	top_antes_menos_meio=top_antes-meio;

	razao=(top_antes_menos_meio)/(meio);
	arco=Math.asin(razao);
	cos=Math.cos(arco);
	alt_depois=(alt_antes)*cos;
	document.getElementById(i).style.fontSize=Math.trunc(alt_depois/divisao)+"px";
	document.getElementById(i).style.top=(+top_antes)-(+alt_depois)+"px";

	document.getElementById(i).style.width=Math.trunc(largura*larg_percent*cos)+"px";
	document.getElementById(i).style.left=Math.trunc((largura-(largura*larg_percent*cos))/2)+"px";


	top_depois=(+document.getElementById(i).style.top.replace('px',''));
	topo=(top_depois);

	document.getElementById(i).style.height=alt_depois+"px";
// teste de Children
  var c = document.getElementsByName("img_"+i);
  var j;
  for (j = 0; j < c.length; j++) {
    c[j].style.height=alt_depois+"px";
  }

//


	console.log("i>"+i+" arco="+arco+" bottom:"+bottom+" meio*2:"+meio*2);
}
	while ((i > 0) && (topo>0) && (alt_depois>alt_corte)); 

}

} 

function taca(){ // para debug
        if (delta < 0){
            console.log("DOWN");
        }else if (delta > 0){
            console.log("UP");
        }


}

function trata_wheel(event){

        if (event.wheelDelta>0){
            //delta = event.wheelDelta;
            delta=1;
        }else{
            //delta = -1 * event.deltaY;
           delta=(-1);
        }


evidente=evidente+delta;
if (evidente<1){evidente=1;}
if (evidente>max_reg){evidente=max_reg;}
mostra(evidente,Math.trunc(height/2),300);

}

function percorre_divs(e){
var tamanho=0.5;
var body = document.body,
    html = document.documentElement;

var height = Math.min( body.scrollHeight, 
                       body.offsetHeight,
                       body.clientHeight, 
                       html.clientHeight, html.scrollHeight, html.offsetHeight 
                       );


var divs=document.getElementsByTagName("div");

var i;
for (i = 0; i < divs.length; i++) {
  rect=divs[i].getBoundingClientRect();
  
  if (rect.top>Math.trunc(height*tamanho) && rect.top<Math.trunc(height*tamanho+rect.height-1)){
                                   //divs[i].innerText="maior";
                                   if (divs[i].name!="extremos"){divs[i].style.height="150px";} else {alert("ops");}
                                   divs[i].style.border="10px solid red";
                                 

                              } else 
                              {
                                   ///divs[i].innerText="menor";
                                   if (divs[i].name!="extremos"){divs[i].style.height="auto";} else {alert("ops");} 
                                   
                                   divs[i].style.border="1px solid red";
                              }
} 

}





</script>

<?php
echo "
<html>
<style>
body{
    color:black;
    background-image: radial-gradient(#166664 0%, #252233 80%);
    } 
    
    div{
        background-color: silver;
        align: center; 
        opacity:.5;
        border: 1px solid black;
        overflow: hidden;
        transition: all 0.2s ease;
    }

   

</style>
<img name='extremos'></div>
";


$username="desenvolvedor";
$pass="desenvolvedor";
$database="Ver3D";
$conn= new mysqli("localhost", $username, $pass, $database);

$sql="select * from eventos";

$result=$conn->query("$sql");

if ($result->num_rows>0)
{
$conta=0;
  while ($row=$result->fetch_assoc())
    {
       $conta=$conta+1;
       $id=$row["id"];
       $descricao=$row["descricao"];
       echo "<div class='ops' id='".$conta."' style='display: none'>
         <table>
         <tr> 
            <td>".$descricao."</td>";

		$sql2="SELECT id,id_evento,path from fotos where id_evento='".$id."' limit 2";
		$result2=$conn->query("$sql2");

		if ($result2->num_rows>0)
		{
                    while($row2=$result2->fetch_assoc())
                    {
                       $path=$row2["path"];
                       $NomeArq=str_replace("/var/www/html","",$path);
                       echo '<td><img name="img_'.$conta.'" src="/Teste_Visual/'.$NomeArq.'.jpg" alt="'.$path.'"
                       ></td>';
                    }

		}
echo "</tr></table>";
echo"</div>";
    }
}

echo "<img name='extremos'></div>

<script>
var tamanho=0.5;
var body = document.body,
    html = document.documentElement;

var height = Math.min( body.scrollHeight, 
                       body.offsetHeight,
                       body.clientHeight, 
                       html.clientHeight, html.scrollHeight, html.offsetHeight 
                       );


var divs2=document.getElementsByName('extremos');
var i;
for (i = 0; i < divs2.length; i++) {
divs2[i].style.height=Math.trunc(height/1.8);
window.scroll(0, 0);
}
mostra(1,Math.trunc(height/2),".$conta.");

</script>


</html>";

?>
