set datestyle = "ISO, DMY";
set datestyle to DMY, SQL;
show datestyle;

drop table if exists matricula cascade;
drop table if exists  ocupa cascade;
drop table if exists instalacions cascade;
drop table if exists edicions cascade;
drop table if exists corresponde cascade;
drop table if exists cursos cascade;
drop table if exists agrupa cascade;
drop table if exists familiar cascade;
drop table if exists individual cascade ;
drop table if exists socios cascade;
drop table if exists franxaedade cascade ;
drop table if exists abonos cascade;



create table abonos(
cabono varchar(5),
primary key(cabono)
);
create table franxaedade  (
cfranxaedade varchar(8),
fedadeini integer,
fedadefin integer,
prezoabi integer,
costecursoplus integer,
primary key(cfranxaedade)
);
create table socios (
csocio varchar(4),
dnis varchar(8),
noms varchar (15),
datan date,
primary key(csocio)
);
create table individual (
cabono varchar(5),
csocio varchar(4),
data date,
cfranxaedade varchar(8),
primary key(cabono),
foreign key (cfranxaedade) references franxaedade,
foreign key (cabono) references abonos,
foreign key (csocio) references socios
);
create table  familiar (
cabono varchar(5),
prezoabf integer,
data date,
primary key(cabono),
foreign key (cabono) references abonos
);

create table agrupa  (
cabono varchar(5),
csocio varchar(4),
primary key(cabono,csocio),
foreign key (cabono) references familiar,
foreign key (csocio) references socios
);
create table cursos (
ccurso varchar (3),
nomecurso varchar(20),
costecurso integer,
nmaximo integer,
primary key(ccurso)
);


create table corresponde  (
ccurso varchar(3),
cfranxaedade varchar(8),
primary key(ccurso,cfranxaedade),
foreign key (ccurso) references  cursos,
foreign key (cfranxaedade) references franxaedade
);

create table edicions  (
ccurso varchar(3),
ngrupo integer,
dataini date,
primary key(ccurso,ngrupo),
foreign key (ccurso) references  cursos
);

create table instalacions  (
cinstala varchar(2),
ninstala varchar(20),
primary key(cinstala)
);

create table ocupa (
cinstala varchar(2),
ccurso varchar(3),
ngrupo integer,
diasem integer,
horaini integer,
primary key(cinstala,ccurso,ngrupo),
foreign key (cinstala) references instalacions,
foreign key (ccurso,ngrupo ) references edicions(ccurso,ngrupo)
);
create table matricula(
csocio varchar(4),
ccurso varchar(3),
ngrupo integer,
primary key(csocio,ccurso,ngrupo),
foreign key (csocio) references socios,
foreign key (ccurso,ngrupo ) references edicions(ccurso,ngrupo)
);

insert into abonos values('a1');
insert into abonos values('a2');
insert into abonos values('a3');
insert into abonos values('a4');
insert into abonos values('a5');
insert into abonos values('a6');
insert into abonos values('a7');
insert into abonos values('a8');
insert into abonos values('a9');
insert into abonos values('a10');
insert into abonos values('a11');
insert into abonos values('a12');
insert into abonos values('a13');
insert into abonos values('a14');
insert into abonos values('a15');
insert into abonos values('a16');
insert into abonos values('a17');
insert into abonos values('a18');
insert into abonos values('a19');
insert into abonos values('a20');
insert into abonos values('a21');
insert into abonos values('a22');
insert into abonos values('a23');
insert into abonos values('a24');
insert into abonos values('a25');
insert into abonos values('a26');
insert into abonos values('a27');
insert into abonos values('a28');
insert into abonos values('a29');
insert into abonos values('a30');

insert into franxaedade values('infantil',0,13,4,5);
insert into franxaedade values('xuvenil',14,17,8,7);
insert into franxaedade values('adulto',18,64,12,9);
insert into franxaedade values('senior',65,120,2,3);

insert into socios values('s1','361','ana','1/1/1996');
insert into socios values('s2','362','pedro','2/2/1997');
insert into socios values('s3','363','luis','3/3/1998');
insert into socios values('s4','364','veronica','4/4/1990');
insert into socios values('s5','365','juan','5/5/1991');
insert into socios values('s6','366','alberto','6/6/1989');
insert into socios values('s7','367','jose','7/7/1976');
insert into socios values('s8','368','eduardo','8/8/1977');
insert into socios values('s9','369','alejandro','9/9/1978');
insert into socios values('s10','3610','isabel','10/10/1979');
insert into socios values('s11','3611','eva','11/1/1981');
insert into socios values('s12','3612','luisa','12/2/1982');
insert into socios values('s13','3613','antonia','13/3/1983');
insert into socios values('s14','3614','lucia','14/4/1936');
insert into socios values('s15','3615','jeronimo','15/5/1937');
insert into socios values('s16','3616','ursula','16/6/1938');
insert into socios values('s17','3617','olga','17/7/1939');
insert into socios values('s18','3618','antia',null);
insert into socios values('s19','3619','brais',null);
insert into socios values('s20','3620','aaron',null);

insert into individual values('a1','s1','1/1/2006','infantil');
insert into individual values('a2','s2','1/1/2006','infantil');
insert into individual values('a3','s4','1/1/2006','xuvenil');
insert into individual values('a4','s5','1/5/2006','xuvenil');
insert into individual values('a5','s7','1/2/2006','adulto');
insert into individual values('a6','s8','1/3/2006','adulto');
insert into individual values('a7','s14','1/6/2006','senior');
insert into individual values('a8','s15','1/5/2006','senior');
insert into individual values('a9','s11','1/7/2006','adulto');
insert into individual values('a10','s12','1/7/2006','adulto');
insert into individual values('a11','s13','1/7/2006','adulto');
insert into individual values('a12','s1','1/4/2007','infantil');

insert into familiar values('a20',20,'1/1/2006');
insert into familiar values('a21',20,'1/1/2006');
insert into familiar values('a22',20,'1/2/2006');
insert into familiar values('a23',20,'1/2/2006');
insert into familiar values('a24',20,'1/3/2006');
insert into familiar values('a25',20,'1/3/2006');
insert into familiar values('a26',20,'1/4/2006');
insert into familiar values('a27',20,'1/4/2006');

insert into agrupa values('a20','s16');
insert into agrupa values('a20','s17');
insert into agrupa values('a22','s11');
insert into agrupa values('a22','s12');
insert into agrupa values('a22','s13');

insert into cursos values('c1','natacion1',40,4);
insert into cursos values('c2','natacion2',60,3);
insert into cursos values('c3','taichi',35,3);
insert into cursos values('c4','aikido',40,2);
insert into cursos values('c5','esgrima',40,2);
insert into cursos values('c6','patinaxe',40,2);
insert into cursos values('c7','tenis',40,2);


insert into corresponde values('c1','infantil');
insert into corresponde values('c2','xuvenil');
insert into corresponde values('c2','adulto');
insert into corresponde values('c3','senior');
insert into corresponde values('c4','xuvenil');
insert into corresponde values('c4','adulto');

insert into edicions values('c1',1,'1/1/2006');
insert into edicions values('c1',2,'1/4/2006');
insert into edicions values('c1',3,'1/4/2006');
insert into edicions values('c2',1,'1/5/2006');
insert into edicions values('c2',2,'1/6/2006');
insert into edicions values('c3',1,'1/6/2006');
insert into edicions values('c3',2,'1/6/2006');
insert into edicions values('c4',1,'1/7/2006');
insert into edicions values('c4',2,'1/7/2006');
insert into edicions values('c4',3,'1/1/2006');

insert into instalacions values('i1','sala1');
insert into instalacions values('i2','sala2');
insert into instalacions values('i3','sala3');
insert into instalacions values('i4','piscina');
insert into instalacions values('i5','gimnasio');
insert into instalacions values('i6','fronton');
insert into instalacions values('i7','pistatenis');

insert into ocupa values('i3','c4',1,1,12);
insert into ocupa values('i3','c4',2,1,13);
insert into ocupa values('i3','c4',3,2,18);
insert into ocupa values('i1','c3',1,1,18);
insert into ocupa values('i4','c1',1,3,16);
insert into ocupa values('i4','c1',2,1,19);
insert into ocupa values('i4','c3',1,3,17);
insert into ocupa values('i4','c1',3,4,18);
insert into ocupa values('i5','c4',3,1,18);
insert into ocupa values('i5','c4',2,5,18);
insert into ocupa values('i6','c4',3,4,19);
insert into ocupa values('i6','c1',1,1,18);




insert into matricula values('s1','c1',1);
insert into matricula values('s2','c1',1);
insert into matricula values('s14','c3',1);
insert into matricula values('s11','c4',1);
insert into matricula values('s1','c4',1);
insert into matricula values('s14','c4',1);
insert into matricula values('s14','c2',1);
insert into matricula values('s1','c2',1);
insert into matricula values('s11','c4',2);
insert into matricula values('s11','c1',2);
insert into matricula values('s2','c3',2);
commit;
