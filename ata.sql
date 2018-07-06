create schema if not exists jo ;


use jo;

show tables;

drop table if exists jo.professor;

create table if not exists 

jo.professor(

	id_prof int not null auto_increment,
	nome varchar(200) not null,
    formacao varchar(200) not null,
    titualacao varchar(200),
	
	primary key (id_prof)

);


create table if not exists
jo.projeto(
	id_proj int not null auto_increment,
    noe varchar(200) not null,
    professor int not null,
    primary key (id_proj),
    foreign key (professor) 
		references jo.professor(id_prof)
        
);

drop table if exists jo.ata;
create table if not exists
	jo.ata(
		id_ata int not null auto_increment,
        assunto varchar(200) not null,
        data_realizacao date,
        professor int not null,
        primary key (id_ata),
        foreign key(professor)
			references jo.professor(id_prof)
        
    
    
    );




drop table if exists jo.projetoata;
create table if not exists 
jo.projetoata(
	ata int not null,
    projeto int not null,
	primary key (ata,projeto),
    foreign key (ata)
		references jo.ata(id_ata),
	foreign key (projeto)
		references jo.projeto(id_proj)
        

);

drop table if exists jo.aluno;
create table if not exists
jo.aluno(
	id_aluno int not null,
    nome varchar(200) not null,
    cpf int not null,
    curso varchar(200) not null,
    primary key(id_aluno)

);

drop table if exists jo.encaminhamento;
create table if not exists
jo.encaminhamento(
	id_enc int not null,
    assunto varchar(200) not null,
    aluno int not null,
    tarefa varchar(200) not null,
    primary key (id_enc),
    foreign key(aluno)
		references jo.aluno(id_aluno)

);
drop table if exists jo.ataaluno;
create table if not exists
jo.ataaluno(
	ata int not null,
    aluno int not null,
    primary key(ata,aluno),
    foreign key (ata)
		references jo.ata(id_ata),
	foreign key (aluno)
		references jo.aluno(id_aluno)


);

drop table if exists ataencaminhamento;
create table if not exists
jo.ataencaminhamento(
	ata int not null,
    enc int not null,
    primary key(ata,enc),
    foreign key(ata)
		references jo.ata(id_ata),
	foreign key(enc)
		references jo.encaminhamento(id_enc)




);




    