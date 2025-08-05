create database estacionamento

create table vaga (
	id serial primary key,
	numero int not null
);


create table carro (
	id serial primary key,
	marca varchar(50) not null,
	modelo varchar(50) not null,
	chassi char(17) not null unique,
	vaga_id int,
	foreign key (vaga_id) references vaga(id),		
);


create table tempo (
	id serial primary key,
	data_hora_chegada date not null,
	data_hora_saida timestamp not null,
	carro_id int not null,
	vaga_id int not null,
	foreign (carro_id) references carro(id),
	foreign (vaga_id) references vaga(id),

);

--Insira 5 registros em cada uma das 3 tabelas do banco do estacionamento.
insert into vaga (numero) VALUES
(101),
(102),
(103),
(104),
(105);


INSERT into carro (marca, modelo, chassi, vaga_id) VALUES
('Toyota', 'Corolla', '1HGCM82633A004351', 1),
('Ford', 'Focus', '1FAHP3K26CL123456', 2),
('Honda', 'Civic', '2HGFG12897H123456', 3),
('Chevrolet', 'Onix', '9BGKS19Z0CB123456', 4),
('Volkswagen', 'Gol', '9BWZZZ377VT123456', 5);


INSERT INTO tempo (data_hora_chegada, data_hora_saida, carro_id, vaga_id) VALUES
('2025-08-01 08:00:00', '2025-08-01 12:00:00', 1, 1),
('2025-08-01 09:30:00', '2025-08-01 11:30:00', 2, 2),
('2025-08-01 10:00:00', '2025-08-01 14:00:00', 3, 3),
('2025-08-01 11:15:00', '2025-08-01 13:15:00', 4, 4),
('2025-08-01 12:00:00', '2025-08-01 16:00:00', 5, 5);






