-- Exclui o esquema 'simple-api' se ele existir
DROP SCHEMA IF EXISTS `simple-api`;

-- Cria o esquema 'simple-api' se ele não existir, com o conjunto de caracteres padrão utf8
CREATE SCHEMA IF NOT EXISTS `simple-api` DEFAULT CHARACTER SET utf8;

-- Define o esquema 'simple-api' como o esquema em uso
USE `simple-api`;

-- Cria a tabela 'funcionarios' se ela não existir
CREATE TABLE IF NOT EXISTS `simple-api`.`funcionarios` (
  -- Coluna de ID dos funcionários, não nula e com auto incremento
  `idfuncionarios` INT NOT NULL AUTO_INCREMENT,
  -- Coluna de nome dos funcionários, não nula
  `nomeFuncionario` VARCHAR(45) NOT NULL,
  -- Coluna de senha dos funcionários, não nula
  `senhaFuncionario` VARCHAR(20) NOT NULL,
  -- Coluna de função dos funcionários, não nula, com valores possíveis 'Lojista' ou 'Gerente'
  `funcaoFuncionario` ENUM('Lojista', 'Gerente') NOT NULL,
  -- Define a chave primária da tabela
  PRIMARY KEY (`idfuncionarios`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cria a tabela 'Produtos' se ela não existir
CREATE TABLE IF NOT EXISTS `simple-api`.`Produtos` (
  -- Coluna de ID dos produtos, não nula e com auto incremento
  `idProdutos` INT NOT NULL AUTO_INCREMENT,
  -- Coluna de tipo dos produtos, não nula
  `tipoProduto` VARCHAR(45) NOT NULL,
  -- Coluna de quantidade dos produtos, não nula
  `quantidadeProduto` INT NOT NULL,
  -- Coluna de nome dos produtos, não nula
  `nomeProduto` VARCHAR(45) NOT NULL,
  -- Define a chave primária da tabela
  PRIMARY KEY (`idProdutos`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cria a tabela 'vendas' se ela não existir
CREATE TABLE IF NOT EXISTS `simple-api`.`vendas` (
  -- Coluna de ID das vendas, não nula e com auto incremento
  `idVendas` INT NOT NULL AUTO_INCREMENT,
  -- Coluna de quantidade das vendas, não nula
  `quantidadeVenda` INT NOT NULL,
  -- Coluna de data das vendas, não nula
  `dataVenda` DATE NOT NULL,
  -- Coluna de ID dos funcionários, não nula
  `idfuncionarios` INT NOT NULL,
  -- Coluna de ID dos produtos, não nula
  `idProdutos` INT NOT NULL,
  -- Define a chave primária da tabela
  PRIMARY KEY (`idVendas`),
  -- Define a chave estrangeira para a coluna 'idfuncionarios', referenciando a tabela 'funcionarios'
  FOREIGN KEY (`idfuncionarios`)
    REFERENCES `simple-api`.`funcionarios` (`idfuncionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  -- Define a chave estrangeira para a coluna 'idProdutos', referenciando a tabela 'Produtos'
  FOREIGN KEY (`idProdutos`)
    REFERENCES `simple-api`.`Produtos` (`idProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;