CREATE DATABASE comicshop CHARACTER SET utf8 
COLLATE utf8_general_ci;

USE comicshop;

CREATE TABLE `usuario` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `papel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `produto` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `preco` double(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `descricao` text,
  `dataCadastro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `carrinho` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  FOREIGN KEY(id_produto) REFERENCES produto(id),
  FOREIGN KEY(id_usuario) REFERENCES usuario(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE compras
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT(11) NOT NULL,
  preco FLOAT NOT NULL,
  dataCompra DATETIME DEFAULT NOW(),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE compras
  ADD CONSTRAINT `fk_compra_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
