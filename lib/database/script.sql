-- Exclui o esquema 'simple-api' se ele existir
DROP SCHEMA IF EXISTS `simple-api`;

-- Cria o esquema 'simple-api' se ele não existir, com conjunto de caracteres padrão utf8
CREATE SCHEMA IF NOT EXISTS `simple-api` DEFAULT CHARACTER SET utf8;
-- Define o esquema 'simple-api' como o esquema atual
USE `simple-api`;

-- Cria a tabela 'funcionarios' se ela não existir
CREATE TABLE IF NOT EXISTS `simple-api`.`funcionarios` (
  -- Coluna de chave primária com auto incremento para a matrícula do funcionário
  `matriculaFuncionario` INT NOT NULL AUTO_INCREMENT,
  -- Coluna para o nome do funcionário, não pode ser nula
  `nomeFuncionario` VARCHAR(45) NOT NULL,
  -- Coluna para a senha do funcionário, não pode ser nula
  `senhaFuncionario` VARCHAR(20) NOT NULL,
  -- Coluna para a função do funcionário, deve ser 'Lojista' ou 'Gerente'
  `funcaoFuncionario` ENUM('Lojista', 'Gerente') NOT NULL,
  -- Define a chave primária da tabela
  PRIMARY KEY (`matriculaFuncionario`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cria a tabela 'Produtos' se ela não existir
CREATE TABLE IF NOT EXISTS `simple-api`.`Produtos` (
  -- Coluna de chave primária com auto incremento para o ID do produto
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  -- Coluna para o tipo do produto, não pode ser nula
  `tipoProduto` VARCHAR(45) NOT NULL,
  -- Coluna para a quantidade do produto, não pode ser nula
  `quantidadeProduto` INT NOT NULL,
  -- Coluna para o nome do produto, não pode ser nula
  `nomeProduto` VARCHAR(45) NOT NULL,
  -- Define a chave primária da tabela
  PRIMARY KEY (`idProduto`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cria a tabela 'vendas' se ela não existir
CREATE TABLE IF NOT EXISTS `simple-api`.`vendas` (
  -- Coluna de chave primária com auto incremento para o ID da venda
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  -- Coluna para a quantidade vendida, não pode ser nula
  `quantidadeVenda` INT NOT NULL,
  -- Coluna para a data da venda, não pode ser nula
  `dataVenda` DATE NOT NULL,
  -- Coluna para o ID do funcionário que realizou a venda, não pode ser nula
  `idfuncionario` INT NOT NULL,
  -- Coluna para o ID do produto vendido, não pode ser nula
  `idProduto` INT NOT NULL,
  -- Define a chave primária da tabela
  PRIMARY KEY (`idVenda`),
  -- Define a chave estrangeira que referencia a tabela 'funcionarios'
  FOREIGN KEY (`idfuncionario`)
    REFERENCES `simple-api`.`funcionarios` (`matriculaFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  -- Define a chave estrangeira que referencia a tabela 'Produtos'
  FOREIGN KEY (`idProduto`)
    REFERENCES `simple-api`.`Produtos` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;