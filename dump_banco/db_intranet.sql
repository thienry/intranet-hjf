-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11-Jun-2018 às 04:43
-- Versão do servidor: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_intranet`
--

DELIMITER $$
--
-- Procedures
--

DROP PROCEDURE IF EXISTS `sp_notification_save`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_notification_save` (
IN `pnome_pac` VARCHAR(100), 
IN `pdt_nasc` VARCHAR(10), 
IN `pprontuario` int(10), 
IN `pregistro` int(10), 
IN `pdt_relato` varchar(10), 
IN `pdt_oco` varchar(10), 
IN `phr_oco` varchar(10), 
IN `pst_cante` varchar(100), 
IN `pst_cado` varchar(100), 
IN `pdescricao` text
)  

BEGIN
	
    DECLARE vid_notificacao INT;
    
	INSERT INTO tb_notificacao (id_notificacao, nome_pac, dt_nasc, prontuario, registro, dt_relato, dt_oco, hr_oco, st_cante, st_cado, descricao)
    VALUES(vid_notificacao, pnome_pac, pdt_nasc, pprontuario, pregistro, pdt_relato, pdt_oco, phr_oco, pst_cante, pst_cado, pdescricao);
    
    SET vid_notificacao = LAST_INSERT_ID();
    
    SELECT * FROM tb_notificacao WHERE id_notificacao = LAST_INSERT_ID();
    
END$$




DROP PROCEDURE IF EXISTS `sp_postsupdate_save`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_postsupdate_save` (`pidpost` INT, `ptitulo` VARCHAR(264), `pautor` VARCHAR(64), `ptexto` TEXT, `pid_user` INT(11))  BEGIN
	
    DECLARE vidpost INT;
    
    SELECT idpost INTO vidpost
    FROM tb_posts
    WHERE idpost = pidpost;
    
	UPDATE tb_posts
    SET
		titulo = ptitulo,
		autor = pautor,
        texto = ptexto,
        id_user = pid_user
        
	WHERE idpost = pidpost;
    
    SELECT * FROM tb_posts WHERE idpost = pidpost;
    
END$$

DROP PROCEDURE IF EXISTS `sp_posts_save`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_posts_save` (`pidpost` INT(11), `ptitulo` VARCHAR(264), `pautor` VARCHAR(64), `ptexto` TEXT, `pid_user` INT(11))  BEGIN
	
	IF pidpost > 0 THEN
		
		UPDATE tb_posts
        SET 
			titulo = ptitulo,
			autor = pautor,
			texto = ptexto,
			id_user = pid_user
            
        WHERE idpost = pidpost;
        
    ELSE
		
		INSERT INTO tb_posts (idpost, titulo, autor, texto, id_user) 
        VALUES(pidpost, ptitulo, pautor, ptexto, pid_user);
        
        SET pidpost = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_posts WHERE idpost = pidpost;
    
END$$

DROP PROCEDURE IF EXISTS `sp_ramaisupdate_save`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ramaisupdate_save` (`pid_agenda` INT, `psetor` VARCHAR(64), `pramal` VARCHAR(64), `pcolaborador` VARCHAR(264))  BEGIN
	
    DECLARE vid_agenda INT;
    
    SELECT id_agenda INTO vid_agenda
    FROM tb_ramais
    WHERE id_agenda = pid_agenda;
    
	UPDATE tb_ramais
    SET
		setor = psetor,
		ramal = pramal,
        colaborador = pcolaborador

	WHERE id_agenda = pid_agenda;
    
    SELECT * FROM tb_ramais WHERE id_agenda = pid_agenda;
    
END$$

DROP PROCEDURE IF EXISTS `sp_ramais_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ramais_delete` (`pid_agenda` INT)  BEGIN
    
    DECLARE vid_agenda INT;
    
    SELECT id_agenda INTO vid_agenda
    FROM tb_ramais
    WHERE id_agenda = pid_agenda;
    
    DELETE FROM tb_ramais WHERE id_agenda = pid_agenda;
        
END$$

DROP PROCEDURE IF EXISTS `sp_ramais_save`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ramais_save` (`psetor` VARCHAR(128), `pramal` VARCHAR(128), `pcolaborador` VARCHAR(128))  BEGIN
    
    DECLARE vid_agenda INT;
    
    INSERT INTO tb_ramais (id_agenda, setor, ramal, colaborador)
    VALUES(vid_agenda, psetor, pramal, pcolaborador);
    
    SET vid_agenda = LAST_INSERT_ID();
    
    SELECT * FROM tb_ramais WHERE id_agenda = LAST_INSERT_ID();
    
END$$

DROP PROCEDURE IF EXISTS `sp_usersupdate_save`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usersupdate_save` (`pid_user` INT, `pdesname` VARCHAR(128), `plogin` VARCHAR(64), `psenha` VARCHAR(264), `psetor` VARCHAR(64), `pinadmin` TINYINT)  BEGIN
	
    DECLARE vid_user INT;
    
    SELECT id_user INTO vid_user
    FROM tb_users
    WHERE id_user = pid_user;
    
	UPDATE tb_users
    SET
		desname = pdesname,
		login = plogin,
        senha = psenha,
        setor = psetor,
        inadmin = pinadmin
	WHERE id_user = pid_user;
    
    SELECT * FROM tb_users WHERE id_user = pid_user;
    
END$$

DROP PROCEDURE IF EXISTS `sp_users_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_delete` (`pid_user` INT)  BEGIN
    
    DECLARE vid_user INT;
    
    SET FOREIGN_KEY_CHECKS = 0;
    
    SELECT id_user INTO vid_user
    FROM tb_users
    WHERE id_user = pid_user;
    
    DELETE FROM tb_posts WHERE id_user = pid_user;
    DELETE FROM tb_users WHERE id_user = pid_user;
    
    SET FOREIGN_KEY_CHECKS = 1;
        
END$$

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_users_save`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_save` (
IN `pdesname` VARCHAR(128), 
IN `plogin` VARCHAR(64), 
IN `psenha` VARCHAR(264), 
IN `psetor` VARCHAR(64), 
IN `pinadmin` TINYINT
)  
BEGIN
	
    DECLARE vid_user INT;
    
	INSERT INTO tb_users (id_user, desname, login, senha, setor, inadmin)
    VALUES(vid_user,pdesname, plogin, psenha, psetor, pinadmin);
    
    SET vid_user = LAST_INSERT_ID();
    
    SELECT * FROM tb_users WHERE id_user = LAST_INSERT_ID();
    
END$$

DELIMITER ;

-- --------------------------------------------------------
--
-- Estrutura da tabela `tb_notificacao`
--
DROP TABLE IF EXISTS `tb_notificacao`;
CREATE TABLE `tb_notificacao` (
	`id_notificacao` int(11) NOT NULL AUTO_INCREMENT,
    `nome_pac` varchar(100) NOT NULL,
    `dt_nasc` varchar(10) NOT NULL,
    `prontuario` int(10) NOT NULL,
    `registro` int(10) NOT NULL,
    `dt_relato` varchar(10) NOT NULL,
    `dt_oco` varchar(10) NOT NULL,
    `hr_oco` varchar(10) NOT NULL,
    `st_cante` varchar(100) NOT NULL,
    `st_cado` varchar(100) NOT NULL,
    `descricao` text,
    `dt_notificacao` datetime NOT NULL,
	PRIMARY KEY (`id_notificacao`)
) 	ENGINE=MyISAM DEFAULT CHARSET=latin1;




-- --------------------------------------------------------
--
--
-- Estrutura da tabela `tb_posts`
--
DROP TABLE IF EXISTS `tb_posts`;
CREATE TABLE IF NOT EXISTS `tb_posts` (
  `idpost` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(264) NOT NULL,
  `autor` varchar(64) NOT NULL,
  `texto` text NOT NULL,
  `id_user` int(11) NOT NULL,
  `dtpost` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idpost`),
  KEY `FK_tb_users_tb_posts_idx` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_posts`
--

INSERT INTO `tb_posts` (`idpost`, `titulo`, `autor`, `texto`, `id_user`, `dtpost`) VALUES
(1, 'Historia do Jayme da Fonte', 'Thiago Moura', ' O ano era 1955. Uma década importante para o Brasil, que passava por \r\ninúmeras transformações político-econômico-sociais. Buscando \r\nsimplicidade, amor e, sobretudo o bem-estar de uma população carente de \r\nserviços médicos especializados, o Dr. Jayme da Fonte segue a risca seu \r\njuramento de salvar vidas. Em Julho, inaugura o primeiro pronto-socorro \r\nparticular do Recife – Hospital Jayme da Fonte, sendo assim, um dos \r\npioneiros em atendimento hospitalar privado no Brasil. ', 7, '2018-06-03 02:31:15'),
(2, 'Historia do Jayme da Fonte', 'Thiago Moura', ' Jayme da Fonte nasceu no Engenho São José, em Barra de Sirinhaém, em 27 de novembro de 1915, nos meses anteriores à inauguração do hospital, fez viagens aos Estados Unidos e à Europa, a fim de importar o que existisse de mais moderno em equipamentos hospitalares. O desejo de cuidar e salvar vidas eram seus preceitos, pois esses sentimentos sempre andaram lado a lado, aguçados pelo seu espírito de empreendedorismo. Inconformado com o fato de vidas serem perdidas por não existir nenhuma farmácia que funcionasse no horário noturno, finais de semanas e feriados, decidiu então, abrir uma farmácia que funcionaria 24 horas e não teria portas. Durante muitos anos o estabelecimento ficou conhecido como “Farmácia sem portas”. Hoje, esse serviço é considerado comum, mas na época representou um grande suporte à saúde da população Recifense.Em novembro de 1986, Dr. Jayme Wanderley da Fonte faleceu e o comando do hospital ficou sob a responsabilidade de seu filho, o médico Dr. Antônio Jayme da Fonte que divide até hoje a gestão da instituição com seus irmãos. Já se vão mais de 60 anos e, nestas décadas de constante renovação, o Hospital Jayme da Fonte tornou-se um dos mais modernos hospitais do Nordeste sendo um dos que mais investiram em tecnologia na última década, alcançando o status de Complexo Hospitalar. Hoje, o Hospital Jayme da Fonte é referência nacional em transplante hepático, além de ser destaque em cirurgias neurológica, urológica e do aparelho digestivo, contribuindo significativamente para a condição do Estado de Pernambuco como Polo Médico de grande destaque na América Latina. ', 7, '2018-06-03 06:14:38'),
(3, 'Doe Sangue', 'Thiago Moura', '<p>Seja doador, avise sua família.<br></p>', 7, '2018-06-09 17:46:55'),
(4, 'Calor Humano', 'Thiago Moura', '<p>O jeito Jayme da Fonte de ser...<br></p>', 1, '2018-06-09 17:47:41'),
(5, 'Hospital Jayme da Fonte', 'Thiago Moura', '<p>Hospital Jayme da Fonte genuinamente pernambucano.<br></p>', 1, '2018-06-09 17:49:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ramais`
--

DROP TABLE IF EXISTS `tb_ramais`;
CREATE TABLE IF NOT EXISTS `tb_ramais` (
  `id_agenda` int(11) NOT NULL AUTO_INCREMENT,
  `setor` varchar(50) NOT NULL,
  `ramal` varchar(60) NOT NULL,
  `colaborador` varchar(30) NOT NULL,
  `dt_agenda` datetime NOT NULL,
  PRIMARY KEY (`id_agenda`)
) ENGINE=MyISAM AUTO_INCREMENT=544 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_ramais`

INSERT INTO `tb_ramais` (`id_agenda`, `setor`, `ramal`, `colaborador`, `dt_agenda`) VALUES
(424, 'Recepção de Internamento', '0002 / 0003', '-', '2018-03-05 07:32:43'),
(425, 'Recepção Urgência', '0005 / 0006', '-', '2018-03-05 07:32:43'),
(426, 'Compras - Material Especial', '0007', 'Rose', '2018-03-05 07:32:43'),
(427, 'Consultórios da Urgência', '0008 / 2134', '-', '2018-03-05 07:32:43'),
(428, 'Estar Médico da Urgência', '0010', '', '2018-03-05 07:32:43'),
(429, 'Posto da Urgência', '0011', '-', '2018-03-05 07:32:43'),
(430, 'Marcação de Cirurgia', '2035', 'Evellyn', '2018-03-05 07:32:43'),
(431, 'Supervisão Internamento', '2081', '', '2018-03-05 07:32:43'),
(432, 'Recepção Imagem', '0015', '', '2018-03-05 07:32:43'),
(433, 'CCIH', '0016', 'Bárbara', '2018-03-05 07:32:43'),
(434, 'Posto Enfermagem Térreo 0017', '0017', '', '2018-03-05 07:32:43'),
(435, 'Ecocardiograma', '0018', '-', '2018-03-05 07:32:43'),
(436, 'Diretoria', '0021', 'D. Maria Lúcia', '2018-03-05 07:32:43'),
(437, 'Supervisão Administrativa', '0024', '', '2018-03-05 07:32:43'),
(438, 'Almoxarifado', '0025', 'Cristiano/Joana', '2018-03-05 07:32:43'),
(439, 'Dispensação -  Farmácia', '0026', '', '2018-03-05 07:32:43'),
(440, 'Compras', '0027', 'Conceicao', '2018-03-05 07:32:43'),
(441, 'Central de Leitos', '0030', 'Eduarda', '2018-03-05 07:32:43'),
(442, 'Coordenação de Enfermagem', '0032', 'Carolina Carrascoso', '2018-03-05 07:32:43'),
(443, 'Cobrança', '0031', 'Claudeci', '2018-03-05 07:32:43'),
(444, 'CME', '0033', '-', '2018-03-05 07:32:43'),
(445, 'Setor de Guias', '0048', 'Sandra', '2018-03-05 07:32:43'),
(446, 'Setor de Guias', '0034 / 0093 / 2165 / 2171 / 2086', '-', '2018-03-05 07:32:43'),
(447, 'Compras', '0035', 'Graças Florentino', '2018-03-05 07:32:43'),
(448, 'Faturamento', '0037', 'Maria José', '2018-03-05 07:32:43'),
(449, 'Faturamento', '0038', '-', '2018-03-05 07:32:43'),
(450, 'Dept. Pessoal', '0039', 'Angela / Giorgio', '2018-03-05 07:32:43'),
(451, 'Dept. Pessoal', '0040', 'Vanessa', '2018-03-05 07:32:43'),
(452, 'Farmácia - Transcrição', '2059', '', '2018-03-05 07:32:43'),
(453, 'Recurso de Glosa', '0041', '-', '2018-03-05 07:32:43'),
(454, 'Auditoria Externa', '0042', '-', '2018-03-05 07:32:43'),
(455, 'Tesouraria', '0043', 'D. Marta', '2018-03-05 07:32:43'),
(456, 'Tesouraria', '0044', 'Eudslandy / Ivanldo', '2018-03-05 07:32:43'),
(457, 'Contabilidade', '0045', 'Eliene', '2018-03-05 07:32:43'),
(458, 'Contabilidade', '0046', 'Silvania', '2018-03-05 07:32:43'),
(459, 'Marketing', '0047', 'Suley Melo', '2018-03-05 07:32:43'),
(460, 'Centro Diagnóstico 1 Recep', '0049 / 0058 / 0076', '-', '2018-03-05 07:32:43'),
(461, 'SACC', '0050 / 0079', 'Anderson / Ingrite', '2018-03-05 07:32:43'),
(462, 'Prescrição Médica 1o andar', '0052', '', '2018-03-05 07:32:43'),
(463, 'Compras', '0051 / 2074', '', '2018-03-05 07:32:43'),
(464, 'Auditoria Urgência', '0054', 'Monique/Roberta', '2018-03-05 07:32:43'),
(465, 'Auto Imune Posto', '0055', '-', '2018-03-05 07:32:43'),
(466, 'Manutenção', '0062', 'Antônio Carlos', '2018-03-05 07:32:43'),
(467, 'Centro Diagnóstico 1 Consultórios', '0057 / 0060 / 0063 / 0064 / 0066 / 0071', '-', '2018-03-05 07:32:43'),
(468, 'Eletrocardiograma', '0072', '-', '2018-03-05 07:32:43'),
(469, 'Endóscopia', '0074 / 2168', '-', '2018-03-05 07:32:43'),
(470, 'Auto Imune Recepção', '0081', '-', '2018-03-05 07:32:43'),
(471, 'Auto Imune Consultórios', '0082 / 0083', '-', '2018-03-05 07:32:43'),
(472, 'Triagem Urgência', '0086', '-', '2018-03-05 07:32:43'),
(473, 'Supervisão de Imagem', '0088', 'Sílvia', '2018-03-05 07:32:43'),
(474, 'Autorização de Imagem', '0089', 'Hananda', '2018-03-05 07:32:43'),
(475, 'Diretoria', '0091', 'Dr. José Meira', '2018-03-05 07:32:43'),
(476, 'Auditor Medico', '0094', 'Dr. Alfredo Cerqueira', '2018-03-05 07:32:43'),
(477, 'Recursos Humanos', '2000', 'Edjane', '2018-03-05 07:32:43'),
(478, 'Estar-Médico', '2021 / 3403', '-', '2018-03-05 07:32:43'),
(479, 'Dispensa', '2022', 'Felipe', '2018-03-05 07:32:43'),
(480, 'Portaria Administrativo', '2025', '', '2018-03-05 07:32:43'),
(481, 'Portaria de Serviços', '2026', '-', '2018-03-05 07:32:43'),
(482, 'Lavanderia', '2027', 'Fernando Firmino', '2018-03-05 07:32:43'),
(483, 'Manutenção', '2029', 'Oficina', '2018-03-05 07:32:43'),
(484, 'Engenharia Clinica', '2031', '-', '2018-03-05 07:32:43'),
(485, 'Farmácia - CAF', '2038', 'Roberta', '2018-03-05 07:32:43'),
(486, 'Setor de Guias', '2032', 'Kátia', '2018-03-05 07:32:43'),
(487, 'Auditoria UTI coronariana', '2147', '', '2018-03-05 07:32:43'),
(488, 'UTI Coronariana', '2136 / 2166', '', '2018-03-05 07:32:43'),
(489, 'Bloco - Recuper Anestésica', '2143', '', '2018-03-05 07:32:43'),
(490, 'Dept. Pessoal', '2033', 'Eva', '2018-03-05 07:32:43'),
(491, 'Centro Diagnóstico 2 Consultórios', '2039 / 2044 / 2045 / 2046 / 2047 / 2048 / 2052 / 2056', '-', '2018-03-05 07:32:43'),
(492, 'Nutrição', '2041', 'Karla Peixoto', '2018-03-05 07:32:43'),
(493, 'Centro Diagnóstico 2 Recep', '2042 / 2043 / 0090 / 0095', '-', '2018-03-05 07:32:43'),
(494, 'Auto Imune Administrativo', '2050', 'Adriana', '2018-03-05 07:32:43'),
(495, 'Qualidade', '2118 / 2119', '-', '2018-03-05 07:32:43'),
(496, 'TOMOG / RESSO / LAUDOS', '2065', '', '2018-03-05 07:32:43'),
(497, 'SESMT', '2066', 'Isley', '2018-03-05 07:32:43'),
(498, 'Consultório ECO', '2069', '', '2018-03-05 07:32:43'),
(499, 'Nutrição', '2072', 'Bernadete Meira', '2018-03-05 07:32:43'),
(500, 'Gerência Compras', '2076', 'Cleide Lúcia', '2018-03-05 07:32:43'),
(501, 'Diretoria Médica', '2079', 'Dr. Alberto Barros', '2018-03-05 07:32:43'),
(502, 'Recepção da Informação', '2080', '', '2018-03-05 07:32:43'),
(503, 'Copa 5º Andar', '2082', '-', '2018-03-05 07:32:43'),
(504, 'CIHDOTT', '2085', 'Michelle', '2018-03-05 07:32:43'),
(505, 'CRM', '2087', 'Valéria', '2018-03-05 07:32:43'),
(506, 'Compras', '2075', 'Marcelo', '2018-03-05 07:32:43'),
(507, 'Compras', '2142', 'Davi', '2018-03-05 07:32:43'),
(508, 'Recepção de Imagem', '2145 / 0015', '-', '2018-03-05 07:32:43'),
(509, 'Bloco Cirúrgico', '2146', '-', '2018-03-05 07:32:43'),
(510, 'Auditoria Setor de Revisão', '2150 / 2152', 'Vanessa Morais', '2018-03-05 07:32:43'),
(511, 'Auditoria enf. Chefe', '2153', 'Cláudia Cavalcante', '2018-03-05 07:32:43'),
(512, 'Copa Térreo', '2155', '-', '2018-03-05 07:32:43'),
(513, 'Cerpe', '2156', '-', '2018-03-05 07:32:43'),
(514, 'Estar Médico Bloco', '2154', '', '2018-03-05 07:32:43'),
(515, 'Auditoria Bloco', '2157', 'Edilene/Júnior', '2018-03-05 07:32:43'),
(516, 'Arquivo Central', '2158', 'Edilson', '2018-03-05 07:32:43'),
(517, 'Copa Bloco', '2159', '-', '2018-03-05 07:32:43'),
(518, 'Farmácia UTI Coronariana', '2167', '', '2018-03-05 07:32:43'),
(519, 'Farmácia Chefia', '2160 / 2058', 'Luciano Bezerra', '2018-03-05 07:32:43'),
(520, 'Auditoria', '2162', 'Caio Braga', '2018-03-05 07:32:43'),
(521, 'Diretoria Executiva', '2163', 'Joao Lanpropulos', '2018-03-05 07:32:43'),
(522, 'CPD', '2164 / 2062', 'Equipe CPD', '2018-03-05 07:32:43'),
(523, 'Diretoria', '2170', 'D. Dora', '2018-03-05 07:32:43'),
(524, 'Diretor Superintendente', '3000', 'Dr. Antônio Jayme', '2018-03-05 07:32:43'),
(525, 'Posto 5º Andar', '3002 / 3003 / 3005', '-', '2018-03-05 07:32:43'),
(526, 'Auditoria Hemodinamica', '3116', '-', '2018-03-05 07:32:43'),
(527, 'Auditoria UTI', '3405', '-', '2018-03-05 07:32:43'),
(528, 'UTI GERAL 02', '3407 / 3409', '-', '2018-03-05 07:32:43'),
(529, 'Posto 6º Andar', '3621 / 3623', '-', '2018-03-05 07:32:43'),
(530, 'Copa 6º Andar', '3624', '-', '2018-03-05 07:32:43'),
(531, 'Auditoria 6º Andar', '3625', '-', '2018-03-05 07:32:43'),
(532, 'Posto 7º Andar', '3720 / 3722 / 3723', '-', '2018-03-05 07:32:43'),
(533, 'Posto 8º Andar', '3820 / 3821 / 3823', '-', '2018-03-05 07:32:43'),
(534, 'Centro Diagnóstico 3 Recep', '4003 / 4009', '-', '2018-03-05 07:32:43'),
(535, 'Centro Diagnóstico 3 Consultórios', '4004 / 4005 / 4006 / 4007 / 4008', '-', '2018-03-05 07:32:43'),
(536, 'Marcação Exames /  CallCenter', '8888', '', '2018-03-05 07:32:43'),
(537, 'Telefonista', '9', '-', '2018-03-05 07:32:43'),
(540, 'CPD', '2164', 'Thiago', '0000-00-00 00:00:00'),
(543, 'teste', 'teste', 'teste', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE IF NOT EXISTS `tb_users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `desname` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `setor` varchar(60) NOT NULL,
  `inadmin` tinyint(3) NOT NULL,
  `data_usuario` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_users`
--

INSERT INTO `tb_users` (`id_user`, `desname`, `login`, `senha`, `setor`, `inadmin`, `data_usuario`) VALUES
(1, 'Thiago Moura', 'thienry', '$2y$12$0YxtjSJsGksknhQBjMbtS.Uj2hklwTOnLK3TW5NljU5g56JNEEN3O', 'CPD', 1, '2018-05-25 19:25:37');


--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_posts`
--
ALTER TABLE `tb_posts`
  ADD CONSTRAINT `FK_tb_users_tb_posts` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
