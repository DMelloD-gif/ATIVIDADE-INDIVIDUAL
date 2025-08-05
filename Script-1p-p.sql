
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

---

-- Crie uma query simples(sem where) para cada tabela;
select id, numero from vaga;
SELECT id, marca, modelo, chassi, vaga_id FROM carro;
SELECT id, data_hora_chegada, data_hora_saida, carro_id, vaga_id FROM tempo;



-- Crie 5 queries para atualizar algum registro de alguma das 3 tabelas (NÃO ESQUEÇA DE ESPECIFICAR A CLAUSULA WHERE);
update vaga 
set numero = 105 
where id = 3;
update carro 
set modelo = 'Corolla' 
where id = 5;
update carro 
set marca = 'Honda' 
where chassi = '12345678901234567';
update tempo 
set data_hora_saida = '2025-08-05 18:00:00' 
where id = 2;
update carro set vaga_id = 4 WHERE id = 7;


-- Crie 5 queries para remover registros sob alguma condição(utilize where);
delete from vaga 
where numero = 105;
delete from carro 
where  id = 10;
delete from tempo 
where  data_hora_saida < '2025-01-01';
delete from carro 
where  chassi = '00000000000000000';
delete from vaga 
where id = 15;


--Insira mais 10 registros em cada tabela;
INSERT INTO vaga (numero) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

INSERT INTO carro (marca, modelo, chassi, vaga_id) VALUES
('Ford', 'Fiesta', 'AAA11111111111111', 1),
('Chevrolet', 'Onix', 'BBB22222222222222', 2),
('Volkswagen', 'Gol', 'CCC3333333333333', 3),
('Fiat', 'Palio', 'DDD444444444444', 4),
('Toyota', 'Corolla', 'EEE55555555555555', 5),
('Honda', 'Civic', 'FFF6666666666666', 6),
('Renault', 'Sandero', 'GGG77777777777777', 7),
('Hyundai', 'HB20', 'HHH88888888888888', 8),
('Nissan', 'Versa', 'III99999999999999', 9),
('Jeep', 'Renegade', 'JJJ000000000000', 10);


INSERT INTO tempo (data_hora_chegada, data_hora_saida, carr_id, vaga_id) VALUES
('2025-08-01', '2025-08-01 10:00:00', 1, 1),
('2025-08-01', '2025-08-01 11:00:00', 2, 2),
('2025-08-02', '2025-08-02 09:30:00', 3, 3),
('2025-08-02', '2025-08-02 12:00:00', 4, 4),
('2025-08-03', '2025-08-03 13:00:00', 5, 5),
('2025-08-04', '2025-08-04 15:30:00', 6, 6),
('2025-08-05', '2025-08-05 18:00:00', 7, 7),
('2025-08-05', '2025-08-05 19:00:00', 8, 8),
('2025-08-06', '2025-08-06 14:00:00', 9, 9),
('2025-08-06', '2025-08-06 16:00:00', 10, 10);


-- Crie 3 queries utilizando inner join e especifique as colunas(não utilize * no select).
select c.marca, c.modelo, v.numero, t.data_hora_chegada
from tempo t
INNER join carro c on t.carro_id = c.id
INNER join vaga v on t.vaga_id = v.id;
select c.chassi, v.numero, t.data_hora_saida
from tempo t
INNER join carro c on t.carro_id = c.id
INNER JOIN vaga v on t.vaga_id = v.id
WHERE t.data_hora_saida IS NOT null;
select c.marca, c.modelo, v.numero, t.data_hora_chegada
from tempo t
INNER JOIN carro c ON t.carro_id = c.id
INNER JOIN vaga v ON t.vaga_id = v.id
WHERE t.data_hora_saida > t.data_hora_chegada OR t.data_hora_saida IS null;



