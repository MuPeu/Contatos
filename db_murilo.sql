-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 09/04/2025 às 22:11
-- Versão do servidor: 8.0.40
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_murilo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contato_murilo`
--

CREATE TABLE `tb_contato_murilo` (
  `id_cpf` int NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `primeiro_nome` varchar(20) NOT NULL,
  `ultimo_nome` varchar(60) NOT NULL,
  `mes_nascimento` int NOT NULL,
  `DDD` varchar(2) NOT NULL,
  `celular` varchar(9) NOT NULL,
  `email` varchar(30) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `estado` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tb_contato_murilo`
--

INSERT INTO `tb_contato_murilo` (`id_cpf`, `CPF`, `primeiro_nome`, `ultimo_nome`, `mes_nascimento`, `DDD`, `celular`, `email`, `endereco`, `cidade`, `estado`, `id`) VALUES
(1, '12345678901', 'Murilo', 'Rangel', 6, '11', '97390833', 'murilo@email.com', 'Rua Pedro Barbosa de França, 151', 'Osasco', 'SP', 1),
(4, '222324545', 'Fábio', 'Lopes', 3, '31', '543210987', 'fabio@email.com', 'Rua Verde, 300', 'Belo Horizonte', 'MG', NULL),
(5, '232425656', 'Natália', 'Pereira', 6, '41', '432109876', 'natalia@email.com', 'Rua dos Lírios, 400', 'Curitiba', 'PR', NULL),
(6, '242566767', 'Carlos', 'Almeida', 9, '51', '321098765', 'carlos@email.com', 'Avenida São João, 500', 'Fortaleza', 'CE', NULL),
(7, '256277789', 'Mariana', 'Santos', 12, '61', '210987654', 'mariana@email.com', 'Rua das Flores, 600', 'Salvador', 'BA', NULL),
(8, '262729890', 'José', 'Silva', 1, '71', '109876543', 'jose@email.com', 'Rua Tupi, 700', 'Porto Alegre', 'RS', NULL),
(11, '292931123', 'Larissa', 'Melo', 10, '11', '765432109', 'larissa@email.com', 'Rua dos Eucaliptos, 1100', 'Rio de Janeiro', 'RJ', NULL),
(13, '313233345', 'Tatiane', 'Pereira', 11, '31', '543210987', 'tatiane@email.com', 'Avenida dos Trabalhadores, 1300', 'Curitiba', 'PR', NULL),
(14, '323334456', 'André', 'Martins', 4, '41', '432109877', 'andre@email.com', 'Rua Nova, 1400', 'Fortaleza', 'CE', NULL),
(17, '353637789', 'Eduardo', 'Melo', 9, '71', '109876543', 'eduardo@email.com', 'Rua das Pedras, 1700', 'Recife', 'PE', NULL),
(18, '363738890', 'Danielle', 'Gomes', 1, '81', '987654321', 'danielle@email.com', 'Avenida Paulista, 1800', 'São Paulo', 'SP', NULL),
(19, '373839901', 'Bruno', 'Ribeiro', 12, '91', '876543210', 'bruno@email.com', 'Rua do Sol, 1900', 'Rio de Janeiro', 'RJ', NULL),
(20, '383940012', 'Silvia', 'Souza', 10, '11', '765432109', 'silvia@email.com', 'Rua Jardim, 2000', 'Belo Horizonte', 'MG', NULL),
(22, '404142234', 'Amanda', 'Santos', 7, '31', '543210987', 'amanda@email.com', 'Avenida Rio Branco, 2200', 'Fortaleza', 'CE', NULL),
(23, '414243345', 'Ricardo', 'Pereira', 8, '41', '432109876', 'ricardo@email.com', 'Rua das Acácias, 2300', 'Salvador', 'BA', NULL),
(24, '424344456', 'Gustavo', 'Silva', 5, '51', '321098765', 'gustavo@email.com', 'Avenida Beira-Mar, 2400', 'Porto Alegre', 'RS', NULL),
(27, '454647789', 'Thiago', 'Oliveira', 2, '81', '987654321', 'thiago@email.com', 'Avenida Brasil, 2700', 'Rio de Janeiro', 'RJ', NULL),
(28, '464748890', 'Luciana', 'Pereira', 11, '91', '876543210', 'luciana@email.com', 'Rua das Flores, 2800', 'Belo Horizonte', 'MG', NULL),
(30, '484950012', 'Adriana', 'Martins', 10, '21', '654321098', 'adriana@email.com', 'Avenida dos Trabalhadores, 3000', 'Fortaleza', 'CE', NULL),
(32, '505152234', 'Patrícia', 'Santos', 5, '41', '432109876', 'patricia@email.com', 'Rua das Palmeiras, 3200', 'Porto Alegre', 'RS', NULL),
(35, '535455567', 'Francisco', 'Martins', 2, '71', '109876543', 'francisco@email.com', 'Rua do Sol, 3500', 'Rio de Janeiro', 'RJ', NULL),
(36, '545556678', 'Jessica', 'Costa', 4, '81', '987654323', 'jessica@email.com', 'Rua Jardim, 3600', 'Belo Horizonte', 'MG', NULL),
(38, '565758890', 'Sérgio', 'Oliveira', 1, '11', '765432109', 'sergio@email.com', 'Avenida Rio Branco, 3800', 'Fortaleza', 'CE', NULL),
(40, '585960012', 'Viviane', 'Souza', 6, '31', '543210987', 'viviane@email.com', 'Rua das Palmeiras, 4000', 'Porto Alegre', 'RS', NULL),
(41, '59596123', 'Marcos', 'Oliveira', 9, '41', '432109876', 'marcos@email.com', 'Rua São José, 4100', 'Recife', 'PE', NULL),
(44, '62636456', 'Roberta', 'Costa', 4, '71', '109876543', 'roberta@email.com', 'Rua Nova, 4400', 'Belo Horizonte', 'MG', NULL),
(45, '636465567', 'Ana', 'Oliveira', 3, '81', '987654321', 'ana@email.com', 'Rua São João, 4500', 'Curitiba', 'PR', NULL),
(46, '646567678', 'Luana', 'Pereira', 5, '91', '876543210', 'luana@email.com', 'Avenida Beira-Mar, 4600', 'Fortaleza', 'CE', NULL),
(47, '65666789', 'Tânia', 'Santos', 2, '11', '765432109', 'tania@email.com', 'Rua das Acácias, 4700', 'Salvador', 'BA', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_contato_murilo`
--
ALTER TABLE `tb_contato_murilo`
  ADD PRIMARY KEY (`id_cpf`),
  ADD KEY `fk_id` (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_contato_murilo`
--
ALTER TABLE `tb_contato_murilo`
  MODIFY `id_cpf` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_contato_murilo`
--
ALTER TABLE `tb_contato_murilo`
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`id`) REFERENCES `login`.`tb_login` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
