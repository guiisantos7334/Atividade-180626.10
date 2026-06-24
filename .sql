CREATE DATABASE controle_loja;
USE controle_loja;

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

INSERT INTO clientes (nome, email, data_cadastro) VALUES
('Guilherme Henrique', 'guilherme@email.com', '2026-06-24'),
('Ana Costa', 'ana@email.com', '2026-06-24'),
('Carlos Souza', 'carlos@email.com', '2026-06-23'),
('Mariana Lima', 'mariana@email.com', '2026-06-24'),
('Ricardo Alves', 'ricardo@email.com', '2026-06-22');

DELIMITER $$

CREATE FUNCTION fn_total_clientes_por_dia(data_pesquisa DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_clientes INT;

    SELECT COUNT(*) INTO total_clientes
    FROM clientes
    WHERE data_cadastro = data_pesquisa;

    RETURN total_clientes;
END$$

DELIMITER ;

-- Testando para o dia 24/06/2026 (Deve retornar 3)
SELECT fn_total_clientes_por_dia('2026-06-24') AS 'Clientes Cadastrados no Dia';

SELECT fn_total_clientes_por_dia('2026-06-23') AS 'Clientes Cadastrados no Dia';