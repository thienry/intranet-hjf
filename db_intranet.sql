-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.3.15-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para db_intranet
CREATE DATABASE IF NOT EXISTS `db_intranet` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_intranet`;

-- Copiando estrutura para procedure db_intranet.sp_convenantsupdate_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_convenantsupdate_save`(
	IN `pid_convenant` INT,
	IN `pname_convenant` VARCHAR(264),
	IN `pcall_center` VARCHAR(264),
	IN `psite` VARCHAR(264),
	IN `pid_user` INT
)
BEGIN

	DECLARE vid_convenant INT;
  
	SELECT id_convenant INTO vid_convenant 
	FROM tb_convenants 
	WHERE id_convenant = pid_convenant;
  
	UPDATE tb_convenants 
	SET 
		name_convenant = pname_convenant,
		call_center = pcall_center,
		site = psite,
		id_user = pid_user
		
	WHERE id_convenant = pid_convenant;
	
	SELECT * FROM tb_convenants WHERE id_convenant = pid_convenant;

END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_convenants_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_convenants_save`(
	IN `pid_convenant` INT,
	IN `pname_convenant` VARCHAR(264),
	IN `pcall_center` VARCHAR(60),
	IN `psite` VARCHAR(264),
	IN `pid_user` INT

)
BEGIN
	
	IF pid_convenant > 0 THEN
	
		UPDATE tb_convenants
		SET
			name_convenant = pname_convenant,
			call_center = pcall_center,
			site = psite,
			id_user = pid_user
			
		WHERE id_convenant = pid_convenant;
		
	ELSE
	
		INSERT INTO tb_convenants ( id_convenant, name_convenant, call_center, site, id_user )
		VALUES ( pid_convenant, pname_convenant, pcall_center, psite, pid_user );
		
		SET pid_convenant = LAST_INSERT_ID();
		
	END IF;
	
	SELECT * FROM tb_convenants WHERE id_convenant = id_convenant;

END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_notification_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_notification_save`(IN `pnome_pac` VARCHAR(100), IN `pdt_nasc` VARCHAR(10), IN `pprontuario` INT(10), IN `pregistro` INT(10), IN `pdt_relato` VARCHAR(10), IN `pdt_oco` VARCHAR(10), IN `phr_oco` VARCHAR(10), IN `pst_cante` VARCHAR(100), IN `pst_cado` VARCHAR(100), IN `pdescricao` TEXT)
BEGIN
	
    DECLARE vid_notificacao INT;
    
	INSERT INTO tb_notificacao (id_notificacao, nome_pac, dt_nasc, prontuario, registro, dt_relato, dt_oco, hr_oco, st_cante, st_cado, descricao)
    VALUES(vid_notificacao, pnome_pac, pdt_nasc, pprontuario, pregistro, pdt_relato, pdt_oco, phr_oco, pst_cante, pst_cado, pdescricao);
    
    SET vid_notificacao = LAST_INSERT_ID();
    
    SELECT * FROM tb_notificacao WHERE id_notificacao = LAST_INSERT_ID();
    
END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_popupsupdate_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_popupsupdate_save`(`pid_popup` INT(11), `ppopup_title` VARCHAR(264), `ppopup_active` TINYINT(4), `pid_user` INT(11))
BEGIN
	
    DECLARE vid_popup INT;
    
    SELECT id_popup INTO vid_popup
    FROM tb_popups
    WHERE id_popup = vid_popup;
    
	UPDATE tb_popups
    SET
		popup_title = ppopup_title,
		popup_active = ppopup_active,
		id_user = pid_user
        
	WHERE id_popup = pid_popup;
    
    SELECT * FROM tb_popups WHERE id_popup = pid_popup;
    
END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_popups_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_popups_save`(`pid_popup` INT(11), `ppopup_title` VARCHAR(264), `ppopup_active` TINYINT(4), `pid_user` INT(11))
BEGIN
	
	IF pid_popup > 0 THEN
		
		UPDATE tb_popups
        SET 
			popup_title = ppopup_title,
			popup_active = ppopup_active,
			id_user = pid_user
            
        WHERE id_popup = pid_popup;
        
    ELSE
		
		INSERT INTO tb_popups (id_popup, popup_title, popup_active, id_user) 
        VALUES(pid_popup, ppopup_title, ppopup_active, pid_user);
        
        SET pid_popup = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_popups WHERE id_popup = pid_popup;
    
END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_postsupdate_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_postsupdate_save`(`pid_post` INT, `ptitulo` VARCHAR(264), `pautor` VARCHAR(64), `ptexto` TEXT, `ppost_active` TINYINT(4), `pid_user` INT(11))
BEGIN
	
    DECLARE vidpost INT;
    
    SELECT idpost INTO vidpost
    FROM tb_posts
    WHERE idpost = pidpost;
    
	UPDATE tb_posts
    SET
		titulo = ptitulo,
		autor = pautor,
    texto = ptexto,
    post_active = ppost_active,
    id_user = pid_user
        
	WHERE idpost = pidpost;
    
    SELECT * FROM tb_posts WHERE idpost = pidpost;
    
END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_posts_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_posts_save`(`pidpost` INT(11), `ptitulo` VARCHAR(264), `pautor` VARCHAR(64), `ptexto` TEXT, `ppost_active` TINYINT(4), `pid_user` INT(11))
BEGIN
	
	IF pidpost > 0 THEN
		
		UPDATE tb_posts
        SET 
			titulo = ptitulo,
			autor = pautor,
			texto = ptexto,
			post_active = ppost_active,
			id_user = pid_user
            
        WHERE idpost = pidpost;
        
    ELSE
		
		INSERT INTO tb_posts (idpost, titulo, autor, texto, post_active, id_user) 
        VALUES(pidpost, ptitulo, pautor, ptexto, ppost_active, pid_user);
        
        SET pidpost = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_posts WHERE idpost = pidpost;
    
END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_ramaisupdate_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ramaisupdate_save`(`pid_agenda` INT, `psetor` VARCHAR(64), `pramal` VARCHAR(64), `pcolaborador` VARCHAR(264))
BEGIN
	
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
    
END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_ramais_delete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ramais_delete`(`pid_agenda` INT)
BEGIN
    
    DECLARE vid_agenda INT;
    
    SELECT id_agenda INTO vid_agenda
    FROM tb_ramais
    WHERE id_agenda = pid_agenda;
    
    DELETE FROM tb_ramais WHERE id_agenda = pid_agenda;
        
END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_ramais_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ramais_save`(`psetor` VARCHAR(128), `pramal` VARCHAR(128), `pcolaborador` VARCHAR(128))
BEGIN
    
    DECLARE vid_agenda INT;
    
    INSERT INTO tb_ramais (id_agenda, setor, ramal, colaborador)
    VALUES(vid_agenda, psetor, pramal, pcolaborador);
    
    SET vid_agenda = LAST_INSERT_ID();
    
    SELECT * FROM tb_ramais WHERE id_agenda = LAST_INSERT_ID();
    
END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_usersupdate_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usersupdate_save`(`pid_user` INT, `pdesname` VARCHAR(128), `plogin` VARCHAR(64), `psenha` VARCHAR(264), `psetor` VARCHAR(64), `pinadmin` TINYINT)
BEGIN
	
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
        role = prole
	WHERE id_user = pid_user;
    
    SELECT * FROM tb_users WHERE id_user = pid_user;
    
END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_users_delete
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_delete`(`pid_user` INT)
BEGIN
    
    DECLARE vid_user INT;
    
    SET FOREIGN_KEY_CHECKS = 0;
    
    SELECT id_user INTO vid_user
    FROM tb_users
    WHERE id_user = pid_user;
    
    DELETE FROM tb_posts WHERE id_user = pid_user;
    DELETE FROM tb_users WHERE id_user = pid_user;
    
    SET FOREIGN_KEY_CHECKS = 1;
        
END//
DELIMITER ;

-- Copiando estrutura para procedure db_intranet.sp_users_save
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_save`(`pdesname` VARCHAR(128), `plogin` VARCHAR(64), `psenha` VARCHAR(264), `psetor` VARCHAR(64), `pinadmin` TINYINT)
BEGIN
	
    DECLARE vid_user INT;
    
	INSERT INTO tb_users (id_user, desname, login, senha, setor, role)
    VALUES(vid_user,pdesname, plogin, psenha, psetor, prole);
    
    SET vid_user = LAST_INSERT_ID();
    
    SELECT * FROM tb_users WHERE id_user = LAST_INSERT_ID();
    
END//
DELIMITER ;

-- Copiando estrutura para tabela db_intranet.tb_convenants
CREATE TABLE IF NOT EXISTS `tb_convenants` (
  `id_convenant` int(11) NOT NULL AUTO_INCREMENT,
  `name_convenant` varchar(264) NOT NULL,
  `call_center` varchar(64) NOT NULL,
  `site` varchar(264) NOT NULL,
  `id_user` int(11) NOT NULL,
  `dt_convenant` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_convenant`),
  KEY `FK__tb_users` (`id_user`),
  CONSTRAINT `FK__tb_users` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COMMENT='Tabela de Convênios';

-- Copiando dados para a tabela db_intranet.tb_convenants: ~52 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_convenants` DISABLE KEYS */;
INSERT INTO `tb_convenants` (`id_convenant`, `name_convenant`, `call_center`, `site`, `id_user`, `dt_convenant`) VALUES
	(1, 'Amil', '(81) 3004-1000 / 0800-706-2363', 'https://www.amil.com.br/', 1, '2019-06-18 13:20:48'),
	(2, 'Bradesco', '(83) 98718-9754', 'https://www.bradescoseguros.com.br/clientes/produtos/plano-saude', 1, '2019-06-18 13:46:10'),
	(4, 'Aeronáutica', '(81) 3322-6300', 'http://www.aer.mil.br/', 1, '2019-06-18 13:57:46'),
	(5, 'Agemar', '(81) 4009-7181', 'http://www.agemar.com.br/', 1, '2019-06-18 13:58:52'),
	(6, 'Allianz Saúde', '0800-722-8148', 'https://www.allianz.com.br/saude', 1, '2019-06-18 14:02:34'),
	(7, 'Amepe Campe', '(81) 3036-3311', 'http://www.campe.org.br/', 1, '2019-06-18 14:04:46'),
	(8, 'Assefaz', '0800-703-4545', 'http://www.assefaz.org.br/', 1, '2019-06-18 14:07:49'),
	(9, 'Axa Assistance', '(11) 4196-5922', 'http://www.axa-assistance.com.br/', 1, '2019-06-18 14:10:06'),
	(10, 'Banco Central', '(61) 3414-1324', 'https://www.bcb.gov.br/', 1, '2019-06-18 14:10:56'),
	(11, 'Banco do Brasil', '0800-729-0080', 'https://www.cassi.com.br/', 1, '2019-06-18 14:12:51'),
	(12, 'BNDES', '0800-707-7471', 'https://www.fapes.com.br/', 1, '2019-06-18 14:14:35'),
	(13, 'Brandão', '(81) 3049-9800', 'http://www.fenamar.com.br/', 1, '2019-06-18 14:15:42'),
	(14, 'Cabesp', '0800-722-2636', 'https://www.cabesp.com.br/', 1, '2019-06-18 14:18:25'),
	(15, 'Camed', '0800-704-7886', 'https://www.camed.com.br/PortalCamed/', 1, '2019-06-18 14:20:49'),
	(16, 'Capesesp', '0800-979-6191', 'https://www.capesesp.com.br/', 1, '2019-06-18 14:21:41'),
	(17, 'CMA CGM', '(81) 3224-0373', 'http://www.cma-cgm.com/', 1, '2019-06-18 14:22:51'),
	(18, 'Compesaprev', '(81) 3366-24447', 'https://www.compesaprev.com.br/', 1, '2019-06-18 14:24:52'),
	(19, 'Conab', '(61) 3403-4575 / 3403-4580', 'https://www.conab.gov.br/', 1, '2019-06-18 14:26:19'),
	(20, 'EAS Saúde', '(81) 4042-2102 / 3311-8419', 'https://www.eassaude.com.br/', 1, '2019-06-18 14:27:23'),
	(21, 'Embratel / Pame / Teles', '0800-724-1013', 'http://www.pame.com.br/', 1, '2019-06-18 14:28:18'),
	(22, 'Excelsior', '(81) 2125-1000', 'http://c1.qa.amil.com.br/institucional/#/', 1, '2019-06-18 14:29:22'),
	(23, 'Fachesf', '0800-281-7533', 'http://www.fachesf.com.br/', 1, '2019-06-18 14:30:10'),
	(24, 'Fisco Saúde', '(81) 3126-7730', 'http://www.fiscosaude.com.br/', 1, '2019-06-18 14:32:08'),
	(25, 'Funcef', '0800-706-9000', 'https://www.funcef.com.br/', 1, '2019-06-18 14:33:01'),
	(26, 'Fundação Fiat', '(31) 3304-3900', 'http://www.fundacaofiat.com.br/', 1, '2019-06-18 14:34:50'),
	(27, 'Fusex', '(81) 2123-4820', 'http://www.hmar.eb.mil.br/index.php/administrativas/adm-fusex', 1, '2019-06-18 14:36:04'),
	(28, 'Gama Saúde', '4004-0178 / 0800-722-0178', 'http://www.gamasaude.com.br/', 1, '2019-06-18 14:38:15'),
	(29, 'Golden Cross', '0800-728-2001', 'http://www.goldencross.com.br/', 1, '2019-06-18 14:38:58'),
	(30, 'Hospital Naval de Recife', '(81) 3036-9001 / 3036-9067', 'https://www.marinha.mil.br/om/hospital-naval-de-recife', 1, '2019-06-18 14:41:31'),
	(31, 'IRB', '(11) 2588-0200', 'https://www.irbre.com/', 1, '2019-06-18 14:43:29'),
	(32, 'IRH', '(81) 3183-4700', 'http://www.irh.pe.gov.br/', 1, '2019-06-18 14:44:28'),
	(33, 'Infraero', '0800-645-0834', 'http://www4.infraero.gov.br/', 1, '2019-06-18 14:48:01'),
	(34, 'Irmãos Britto', '(81) 3419-1360', 'http://www.ibritto.com.br', 1, '2019-06-18 14:49:07'),
	(35, 'Mapfre', '0800-117-2833', 'https://www.mapfresaude.com.br/', 1, '2019-06-18 14:50:06'),
	(36, 'Mediservice', '0800-727-9966', 'https://www.mediservice.com.br/', 1, '2019-06-18 14:51:18'),
	(37, 'Mondial Assistance', '(11) 4331-5282', 'https://www.mondialtravel.com.br/', 1, '2019-06-18 14:53:45'),
	(38, 'MSC', '(81) 3328-9217', 'https://www.msc.com/bra', 1, '2019-06-18 14:55:11'),
	(39, 'Omint', '0800-726-4000', 'https://www.omint.com.br/', 1, '2019-06-18 14:56:34'),
	(40, 'PM-PE', '(81) 3181-1480', 'http://www.pm.pe.gov.br/', 1, '2019-06-18 14:57:40'),
	(41, 'Petrobrás', '0800-728-9001 / 0800-728-9001', 'http://www.br.com.br/', 1, '2019-06-18 14:59:01'),
	(42, 'Postal Saúde', '(81) 3464-3950', 'http://postalsaude.com.br/', 1, '2019-06-18 15:00:50'),
	(43, 'Sea Alliance', '0800-727-9966', 'https://www.sea-alliance.com/', 1, '2019-06-18 15:02:59'),
	(44, 'Serpro', '(61) 2021-8000', 'http://www.serpro.gov.br/', 1, '2019-06-18 15:03:50'),
	(45, 'Start', '(81) 3059-5959', 'http://startline.com.br/new/', 1, '2019-06-18 15:04:53'),
	(46, 'Sulamérica', '4004-5903 / 0800-970-0200', 'https://portal.sulamericaseguros.com.br/', 1, '2019-06-18 15:07:21'),
	(47, 'Superservice', '(81) 3424-5700', 'http://www.superservice.srv.br/', 1, '2019-06-18 15:08:18'),
	(48, 'Unafisco Saúde', '0800-722-2388', 'https://unafiscosaude.org.br/site/', 1, '2019-06-18 15:09:45'),
	(49, 'Unimed Caruaru', '(81) 2103-8600', 'https://www.unimed.coop.br/web/caruaru', 1, '2019-06-18 15:10:24'),
	(50, 'Unimed Recife', '(81) 3198-2600', 'https://www.unimedrecife.com.br/', 1, '2019-06-18 15:11:01'),
	(51, 'Williams Marítima', '(81) 3327-9200', 'http://williams.com.br/', 1, '2019-06-18 15:11:46'),
	(52, 'Willian Sons', '(81) 3419-1300', 'https://www.wilsonsons.com.br/pt/grupo', 1, '2019-06-18 15:12:26'),
	(53, 'Windrose', '(81) 2119-7171', 'http://www.windrose.com.br/', 1, '2019-06-18 15:13:45'),
	(54, 'World Assist', '(11) 3120-4155', 'http://worldassist.com.br/teste2/', 1, '2019-06-18 15:18:07');
/*!40000 ALTER TABLE `tb_convenants` ENABLE KEYS */;

-- Copiando estrutura para tabela db_intranet.tb_events
CREATE TABLE IF NOT EXISTS `tb_events` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `name_event` varchar(264) NOT NULL,
  `description_event` text NOT NULL,
  `id_user` int(11) NOT NULL,
  `dt_event` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_event`),
  KEY `FKid_user` (`id_user`),
  CONSTRAINT `FKid_user` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela de Eventos';

-- Copiando dados para a tabela db_intranet.tb_events: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_events` ENABLE KEYS */;

-- Copiando estrutura para tabela db_intranet.tb_events_photos
CREATE TABLE IF NOT EXISTS `tb_events_photos` (
  `id_photo` int(11) NOT NULL AUTO_INCREMENT,
  `name_photo` varchar(264) NOT NULL,
  `id_event` int(11) NOT NULL,
  `dt_photo` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_photo`),
  KEY `FKid_event` (`id_event`),
  CONSTRAINT `FKid_event` FOREIGN KEY (`id_event`) REFERENCES `tb_events` (`id_event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela de fotos dos eventos ';

-- Copiando dados para a tabela db_intranet.tb_events_photos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_events_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_events_photos` ENABLE KEYS */;

-- Copiando estrutura para tabela db_intranet.tb_notificacao
CREATE TABLE IF NOT EXISTS `tb_notificacao` (
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
  `descricao` text DEFAULT NULL,
  `dt_notificacao` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_notificacao`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela db_intranet.tb_notificacao: 77 rows
/*!40000 ALTER TABLE `tb_notificacao` DISABLE KEYS */;
INSERT INTO `tb_notificacao` (`id_notificacao`, `nome_pac`, `dt_nasc`, `prontuario`, `registro`, `dt_relato`, `dt_oco`, `hr_oco`, `st_cante`, `st_cado`, `descricao`, `dt_notificacao`) VALUES
	(21, 'Vitória Vieira', '1996-01-27', 1549646, 64513216, '2018-07-10', '2018-07-10', '00:00', 'Qualidade', 'Emergência', 'Está usando meu computador.', '2018-07-10 14:14:39'),
	(22, 'ANA CARLA FERREIRA DA SILVA', '1985-05-08', 136229, 454317, '2018-07-11', '2018-07-11', '12:28', 'FARMACIA', '5º ANDAR', 'PRESCRIÇÃO MEDICA SEM DATA', '2018-07-11 12:23:19'),
	(23, 'LUCIANA SOUZA DE OLIVEIRA', '1977-08-02', 122973, 454312, '2018-07-11', '2018-07-11', '13:19', 'FARMACIA', '6ªANDAR', 'PRESCRIÇÃO MÉDICA SEM DATA\r\n', '2018-07-11 13:13:13'),
	(24, 'DULCE PEDROSA', '1933-07-28', 137777, 453637, '2018-07-11', '2018-07-11', '13:22', 'FARMACIA', '6ºANDAR', '\r\n', '2018-07-11 13:15:15'),
	(25, 'Mateus Santos de Queiroz Lins', '1993-07-11', 138004, 454422, '2018-07-12', '2018-07-12', '15:53', 'Farmacia', 'Enfermagem - posto 6ª Andar', 'Foi devolvido a farmácia um soro fisiológico 100ml com a etiqueta com dados do paciente colado no produto. ', '2018-07-12 15:56:02'),
	(26, 'mateus santos de oliveira lins', '2018-07-13', 138004, 454422, '2018-07-13', '2018-07-13', '10:40', 'farmacia', '6ºANDAR', '\r\n', '2018-07-13 10:40:27'),
	(27, 'mateus santos de oliveira lins', '2018-07-13', 138004, 454422, '2018-07-13', '2018-07-13', '10:40', 'FARMACIA', '6ºANDAR', 'prescriçao  medica sem data', '2018-07-13 10:41:44'),
	(28, 'cicero de castro jales', '1956-09-20', 126103, 454429, '2018-07-13', '2018-07-13', '10:43', 'FARMACIA', '6ºANDAR', 'prescriçao medica sem data', '2018-07-13 10:43:40'),
	(29, 'ytassara souza nascimento', '1982-02-02', 137607, 454552, '2018-07-13', '2018-07-13', '10:44', 'FARMACIA', '6ºANDAR', 'prescriçao medica sem data', '2018-07-13 10:45:20'),
	(30, 'sebastiana georgina dos santos', '1956-02-29', 136070, 454454, '2018-07-13', '2018-07-13', '11:01', 'FARMACIA', '5º ANDAR', 'prescriçao medica sem data\r\n', '2018-07-13 11:01:47'),
	(31, 'tom arthur gulde', '1956-08-14', 84073, 454553, '2018-07-13', '2018-07-13', '17:24', 'FARMACIA', '6ºANDAR', 'prescriçao medica sem data\r\n\r\n', '2018-07-13 17:24:38'),
	(32, 'MARIA CRISTINA', '1955-06-18', 136669, 450289, '2018-07-14', '2018-07-14', '19:20', 'UTI GERAL', 'UNINEFRO', 'DEIXADO VAZAMENTO DE ÁGUA EM SAÍDA DA HEMODIÁLISE, APÓS TÉRMINO DE HD PELA UNINEFRO. L14', '2018-07-14 19:31:44'),
	(33, 'tom arthur gulde', '1956-08-14', 84073, 454553, '2018-07-15', '2018-07-15', '16:02', 'FARMACIA', '6ºANDAR', 'prescrição médica sem data', '2018-07-15 16:03:01'),
	(34, 'SEVERINO PEDRO', '0001-01-01', 0, 0, '2018-07-19', '2018-07-19', '15:11', 'FARMACIA', '7º ANDAR', 'PRESCRIÇÃO MÉDICA SEM IDENTIFICAÇÃO CORRETE\r\nSEM NOME, SEM REGISTRO E DATA', '2018-07-19 15:12:04'),
	(35, 'NATALY GOES', '1984-11-25', 1363398, 455030, '2018-07-19', '2018-07-19', '15:23', 'FARMACIA', '6ºANDAR', 'PRESCRIÇÃO MÉDICA SEM DATA', '2018-07-19 15:15:51'),
	(36, 'CARLOS ALBERTO AROXA', '1949-08-01', 136758, 455365, '2018-07-23', '2018-07-22', '09:31', 'FARMACIA', 'UTI CORONARIA ', 'OCORREU UMA DEVOLUÇÃO DE UM MEDICAMENTO NO NOME DO PACIENTE DESCRITO ACIMA, O MESMO VEIO COM ETIQUETA DE PRONTUARIO COLADA NO COMPRIMIDO, DIFICULTANDO O TRABALHO DA FARMÁCIA.', '2018-07-23 09:35:50'),
	(37, 'ANGELA CRISTINA', '1956-10-15', 134555, 455721, '2018-07-29', '2018-07-27', '17:40', 'SUPERVISÃO ADMINISTRATIVA', '7º ANDAR', 'O kit do paciente foi retirado pela colaboradora da brasanitas, pois a mesma já havia solicitado a equipe do posto para retirada do enxoval, e para que não houvesse o atraso da entrega da higienização a mesma iniciou a terminal. Porém ficou o vacuômetro na régua com líquido onde ninguém da equipe de enfermagem teve a iniciativa de retirar antes ou durante a higienização  do apartamento. Ao passar para verificar o leito me deparei com o vacuômetro ainda acoplado na régua. Solicitei no posto ao enfermeiro Gessé para retirar o vacuômetro do apartamento 717 por três vezes foi solicitado e o mesmo estava aguardando a técnica responsável pelo leito para retirar o equipamento. Peço após alta seja retirado imediatamente todos equipamentos e o enxoval para que não haja não conformidade no tempo de entrega da higienização.', '2018-07-29 08:56:08'),
	(38, 'MATERIAL', '2018-07-28', 0, 0, '2018-07-29', '2018-07-28', '08:06', 'RECEPÇÃO INTERNAMENTO', 'CME/125', 'ás 08:06 Ana do CME solicitou maqueiro para pegar o carrinho no 125 para o CME. Foi solicitado ao maqueiro ás 08:06 conforme o pedido (carrinho), Porém ás 08:15 a enfermeira chefe do CME Conceição ligou para recepção queixando por que o maqueiro ainda não tinha comparecido, informei a mesma que o maqueiro tinha ido ao setor e o carrinho estava com material e o maqueiro não sabia se ainda iam descarregar para ele levar o carrinho para o CME. E a enfermeira Conceição informou que passei o procedimento errado para o maqueiro no qual quem passou o procedimento foi Ana ( carrinho ) . Porém a enfermeira Conceição não verificou como foi a solicitação de Ana antes de se queixar da recepção, no qual só depois ela confirmou que o erro foi o modo que foi solicitado por Ana o procedimento. Pois só passamos a informação para o maqueiro conforme a solicitação.', '2018-07-29 09:28:28'),
	(39, 'GABRIELLY DE PAULA FERREIRA AZEVEDO', '1982-05-26', 111613, 454935, '2018-08-12', '2018-08-12', '12:30', 'SUPERVISÃO ADM', '7º ANDAR E UTI GERAL', 'Houve quebra de fluxo sobre a solicitação da vaga para a intercorrência  e em nenhum momento o setor responsável pelo leito foi comunicado.', '2018-08-12 16:20:15'),
	(40, 'DIVERSOS PACIENTES DA URGÊNCIA', '1932-02-08', 83297, 458412, '2018-08-16', '2018-08-16', '22:00', 'URGÊNCIA', 'CERPE', 'Os resultados de hemograma e sumário de urina demoraram mais de 4 horas para serem liberados. O setor (CERPE) FOI CONTACTADO DIVERSAS VEZES. Alguns dos pacientes que esperaram foram:\r\nRosalha Ayres da Cruz\r\nMaria Sales de Oliveira Silva\r\nAna Cláudia de Moraes Machado\r\nUlenildo Felix da Silva\r\nJosé Felipe Freire da Silva', '2018-08-17 01:00:41'),
	(41, 'Natália de Mesquita Monterazo', '1990-03-22', 136753, 459135, '2018-08-23', '2018-08-22', '20:00', 'URGÊNCIA', 'COPA', 'Foi solicitada dieta para paciente que já aguardava internamento e só foi enviado para mesma um lanche. Foi informado para a funcionária da copa que a paciente em questão aguardava autorização de internamento.', '2018-08-23 06:52:56'),
	(42, 'Rafaela Vieira de Mendonça', '1990-07-11', 125360, 459144, '2018-08-23', '2018-08-22', '23:00', 'URGÊNCIA', 'COPA', 'Foi solicitada dieta para paciente que já aguardava internamento e só foi enviado para mesma um lanche. Foi informado para a funcionária da copa que a paciente em questão aguardava autorização de internamento.', '2018-08-23 06:54:18'),
	(43, 'JOSEFA CAVALCATI DE ANDRADE', '1928-12-22', 139716, 460112, '2018-09-04', '2018-09-03', '23:30', 'HOSPITALIDADE', 'UCO', 'Foi solicitado a alta da paciente as 12:48 da UCO 06 e a família veio na hora da visita e falou que só poderia vir depois. Houve a quebra do fluxo onde a UCO encaminhou a parente para o 5º andar e não a direcionou para a recepção, o horário da saída da paciente foi as  23:30 e a enfermaria encontrava-se fechada.', '2018-09-04 07:24:58'),
	(44, 'Elza Maria Alves da Silva', '1948-05-11', 466867, 466867, '2018-09-10', '2018-09-10', '17:40', 'Recepção de internamento ', 'Uti Coronária ', 'Foi passada para uti coronária uma alta do leito 08 para o enfermeiro ( izequiel) informando o andar e o apartamento que a paciente iria, mesmo assim o enfermeiro não deu credibilidade a informação e se baseou por um senso que ele tinha pego pela manhã onde dizia que a paciente iria pro 7 andar e mandou o maqueiro leva-la p/ o 7, chegando lá o posto ligou p/ recepção onde gerou um transtorno questionando  a recepção sobre a alta , onde foi informada a enfermeira do 7 andar que houve um engano pois a alta não seria pro 7 mas sim pro 8, em seguida liguei p/ o mesmo enfermeiro da coronária e o mesmo disse que tinha um senso de altas informando que o paciente iria pro 7 andar e que ninguém da recepção teria avisado nada para ele que a paciente iria pro 8 andar apt 816, sendo que, ao ser passada a informação tinha dois recepcionista que comprovam que a informação foi passada e registrada na ata de altas do gerenciamento de leitos e no livro do maqueiro, o mesmo enfermeiro mandou a paciente VOLTAR para uti coronária a paciente que já estava no posto do 7 andar, gerando um transtorno e uma confusão entre a recepção e o posto do 7 andar.', '2018-09-11 07:42:52'),
	(45, 'WILLIAM DIAS VAREL', '1938-02-28', 308676, 460450, '2018-09-10', '2018-09-10', '18:20', 'UTI CORONARIA', 'HEMODINAMICA', 'PACIENTE ADMITIDO NESTE SETOR PROVENIENTE DE HEMODINAMICA EM POI DE CATE COM 03 STENT, CHEGA AO SETOR DE UTI SEM SER COMUNICADO PELO SETOR DA HEMODIAMICA, FALHA NA META 02, POIS É DE SUMA IMPORTÂNCIA A COMUNICAÇÃO EFETIVA DA EQUIPE, TRANSMITINDO TODAS AS INFORMAÇOES DO PROCEDIMENTO, INTECORRENCIAS, ALERGIAS, TIPO DE ACESSO E SE HA DROGAS. PATRA QUE A UTI POSSA SE ORGANIZAR E PREPARAR O LEITO PARA POSSÍVEIS INTECORRENCIAS.', '2018-09-12 17:59:33'),
	(46, 'DILSON DE SOUZA LEAO BARBOSA', '1944-11-28', 129723, 461036, '2018-09-12', '2018-09-10', '19:10', 'UTI CORONARIA', 'BLOCO CIRURGICO', 'PACIENTE ADMITIDO NESTE SETOR PROVENIENTE DO BLOCO, EM POI DE CRM COM MAMARIA E SAFENAS, CHEGA AO SETOR DE UTI AS 19;10 HS SEM SER COMUNICADO PELO SETOR ( BLOCO ), FALHA NA META 02, POIS É DE SUMA IMPORTÂNCIA A COMUNICAÇÃO EFETIVA DA EQUIPE, TRANSMITINDO TODAS AS INFORMAÇOES DO PROCEDIMENTO, INTECORRENCIAS, ALERGIAS, TIPO DE ACESSO E SE HA DROGAS, INTUBAÇÕES E RESEVA SANGUINEA. PARA QUE A UTI POSSA SE ORGANIZAR E PREPARAR O LEITO PARA POSSÍVEIS INTECORRENCIAS.', '2018-09-12 18:02:59'),
	(47, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:20:37'),
	(48, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:20:43'),
	(49, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:20:49'),
	(50, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:20:53'),
	(51, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:20:57'),
	(52, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:01'),
	(53, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:05'),
	(54, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:09'),
	(55, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:13'),
	(56, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:17'),
	(57, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:22'),
	(58, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:26'),
	(59, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:30'),
	(60, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:34'),
	(61, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:38'),
	(62, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:42'),
	(63, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-25', '2018-09-25', '18:00', 'HOSPITALIDADE', 'URGÊNCIA/ 6º ANDAR', 'Houve quebra de fluxo. A paciente estava na sala vermelha da urgência devido uma intercorrência que haviam solicitado a vaga de UTI para o gerenciamento de leitos e no tinha a vaga em UTI, a transferência ficou no virtual na UTG 13. As 18h a equipe de enfermagem da urgência sobe com a paciente informando que a médica havia liberado a alta e que foi feito o contanto com a enfermeira do 6º andar que foi passado a informação que o leito estava disponível, a paciente teve que ficar no corredor uns 7 minuto porque a acomodação estava sendo revisada pela Brasanitas e manutenção, foi aberto um outro aparatamento para acomodar a paciente.', '2018-09-25 19:21:47'),
	(64, 'SEVERINA EUCARYS DANTAS BERENGUER', '1943-12-14', 167010, 462820, '2018-09-29', '2018-09-29', '14:00', '6º ANDAR', 'FARMÁCIA', 'Informo quando foi administrado a medicação iv ( metilpredinisolona iv 40 mg + SF%9 100 ML) , a medicação não estava correndo. Foi hidrolisado várias vezes, com a seringa 10 cc e também estava pérvio op acesso, mais a medicação não goteja. Foi trocado acesso com introcan nº 22 e também não gotejava. Eu GIVALDO, já informei ao farmacêutico LUCIANO no dia 27/09/18 e também fiz uma notificação manual sobre esse equipo. Que está se mostrando de má qualidade. E hoje aconteceu este fato novamente e foi comunicado também ao farmacêutico ELVES.', '2018-09-29 16:00:31'),
	(65, 'BARTOLOMEU ACIOLI DOS SANTOS', '1974-02-08', 140683, 463673, '2018-10-04', '2018-09-30', '21:13', 'URGENCIA', 'MÉDICO', 'O Médico Intensivista Victor veio da UTI e atendeu o paciente em tela. Depois de realizar o atendimento médico entregou a ficha para que fosse preenchido o acolhimento, quebrando assim o fluxo de atendimento.', '2018-10-04 06:22:18'),
	(66, 'POSTO DE ENFERMAGEM 6 ANDAR', '2018-10-12', 11111, 1111, '2018-10-12', '2018-10-12', '22:00', '6 ANDAR', 'TECNOFRIO', 'O POSTO DE ENFERMAGEM DO 6 ANDAR, NUMA TEMPERATURA ELEVADA, TODOS OS APARELHOS DE AR CONDICIONADOS SÓ GASTANDO ENERGIA E SEM REFRIGERAR, FICAMOS NUM AMBIENTE TOTALMENTE FECHADO E SEM CONDIÇÕES PARA TRABALHAR.\r\nJÁ FIZEMOS VÁRIOS CHAMADOS PARA MANUTENÇÃO E NADA É RESOLVIDO.\r\nFICA ESSE AMBIENTE SEM CONDIÇÕES PARA TRABALHO, AMBIENTE MUITO QUENTE DE DIA E DE NOITE,', '2018-10-13 00:19:57'),
	(67, 'Teste', '1992-10-26', 0, 0, '2018-10-26', '2018-10-26', '09:30', 'teste', 'teste', 'Isso é apenas um teste de funcionamento.', '2018-10-26 09:33:44'),
	(68, 'jarcirley carvalho toscano de brito', '1963-03-30', 25589, 467405, '2018-11-02', '2018-11-02', '10:46', 'recepção', '5 andar', 'paciente desceu sem maqueiro e sem técnico e em momento nenhum foi solicitado um maqueiro', '2018-11-02 10:45:50'),
	(69, 'Rita de Cássia Vieira da Cunha e Silva', '1962-09-01', 572, 470170, '2018-11-26', '2018-11-26', '20:45', 'URGÊNCIA', '5º andar', 'Levamos a paciente para internamento e ao chegar no setor havia 04 Técnicos de Enfermagem e a Enfermeira no Posto e nenhum nos acompanhou até o quarto para receber e acomodar a paciente. A mesma estava em uso de catéter de O2 e não tinha sido providenciado o umidificador. Tivemos que permanecer lá até providenciarem o referido material.', '2018-11-26 22:56:29'),
	(70, 'Zoraia da Cunha Beltrão', '1961-03-15', 17142, 470202, '2018-11-27', '2018-11-26', '00:48', 'URGÊNCIA', 'CERPE', 'Paciente realizou exames laboratoriais. O sumário de urina não estava pronto após 6 horas de coletado e não saiu até o momento.', '2018-11-27 00:47:45'),
	(71, 'ELIAS EDNALDO DE MELO LIMA', '2005-12-23', 470591, 470591, '2018-12-01', '2018-12-01', '17:16', '6 ANDAR', 'FARMACIA', 'A PRESCRIÇÃO FOI ENVIADA AS 15: 20, HAVIAM MEDICAÇÕES PARA AS 16 E PARA AS 17h INCLUINDO ANTIBIÓTICO E ATÉ O MOMENTO NÃO RECEBEMOS.', '2018-12-01 17:17:27'),
	(72, 'Judite Cristina Machester', '1964-09-10', 142984, 471406, '2018-12-06', '2018-12-06', '06:20', 'URGÊNCIA', 'CERPE', 'Solicitada coleta para paciente a aproximadamente 40 minutos e ninguém veio coletar.', '2018-12-06 06:20:13'),
	(73, 'cicera maria da silva', '1950-01-01', 130082, 471622, '2018-12-08', '2018-12-08', '11:40', 'recepção', 'tec. 5º andar', 'A técnica do 5 º Andar - Cristiane não ficou aguardando junto com o maqueiro finalizar alta do paciente. Paciente: Cicera Maria da silva', '2018-12-08 11:49:07'),
	(74, 'cicera maria da silva', '1950-01-01', 130082, 471622, '2018-12-08', '2018-12-08', '11:40', 'recepção', 'tec. 5º andar', 'A técnica do 5 º Andar - Cristiane não ficou aguardando junto com o maqueiro finalizar alta do paciente. Paciente: Cicera Maria da silva', '2018-12-08 11:49:13'),
	(75, 'Maria Carmem Oliveira Castro', '1929-07-27', 27002, 472575, '2018-12-16', '2018-12-16', '14:25', 'URGÊNCIA', 'CERPE', 'A atendente do CERPE, Gisele, foi informada que havia coleta na urgência desde as 13:55 mas o exame só foi realizado ás 14:25.', '2018-12-16 14:46:10'),
	(76, 'Vanda Lúcia Araújo Phaelante Camara', '1944-04-12', 122636, 472732, '2018-12-17', '2018-12-17', '19:40', 'URGÊNCIA', 'Transporte Interno', 'Paciente com horário de autorização de internamento 17:14. Solicitado maqueiro ainda no plantão do dia SIC, reforçada a solicitação por mais duas vezes e só quando solicitado o auxiliar, Joab, que a paciente seguiu para internamento ás19:40.', '2018-12-17 19:52:30'),
	(77, 'Ligia Cavalcanti de Petribu', '1949-02-18', 143354, 472737, '2018-12-17', '2018-12-17', '19:25', 'URGÊNCIA', 'Transporte Interno', 'Paciente com internamento autorizado desde ás 17:44. Maqueiro solicitado ainda no plantão do dia SIC e reforçado o pedido por duas vezes no plantão noturno. A paciente só subiu para o internamento ás 19:25.', '2018-12-17 19:56:24'),
	(78, 'maria cristina da fonte saraiva ', '1941-05-01', 10794, 473032, '0018-12-20', '2018-12-19', '20:30', 'URGÊNCIA', 'Farmacia', 'A paciente apresentando taquicardia supraventricular onde o médico solicitou adenosina 1 ampola e não tinha na farmácia satélite da urgência, tivemos que abrir o carro de parada, o médico  questionou a falta da medicação na farmácia. ', '2018-12-20 05:26:43'),
	(79, 'DIEGO HOULY MELO', '1990-06-18', 143796, 474722, '2019-01-07', '2019-01-07', '20:20', 'EMERGÊNCIA', 'HOTELARIA', 'Paciente com internamento autorizado desde 16:42, ao chegar ao setor de destino (20:20) o apartamento encontrava-se trancado. O mesmo teve que permanecer no corredor aguardando que alguém abrisse a acomodação.', '2019-01-07 20:36:09'),
	(80, 'Abel Candido Nepomeceno', '1933-07-30', 143843, 474724, '2018-01-07', '2018-01-07', '22:21', 'EMERGÊNCIA', 'CERPE', 'Paciente particular, realizou coleta de urina para exames já que o sangue não conseguiram coletar. O resultado só foi liberado ás 22:25. Paciente portador de Alzheimer, ficou inquieto, agitado.', '2019-01-07 22:27:52'),
	(81, 'Margarida Moreira da costa', '21941-05-0', 395820, 472661, '2019-01-12', '2019-01-12', '22:50', '7° Andar', '7° Andar', 'PACTE ACOMPANHADA PELA FILHA, PUXOU SNE.\r\nREPASSADA SNE, SOLICITADO RX E LIBERADA A DIETA APÓS A AVALIAÇÃO DO MP.', '2019-01-13 06:27:41'),
	(82, 'Margarida Moreira da costa', '21941-05-0', 395820, 472661, '2019-01-12', '2019-01-12', '22:50', '7° Andar', '7° Andar', 'PACTE ACOMPANHADA PELA FILHA, PUXOU SNE.\r\nREPASSADA SNE, SOLICITADO RX E LIBERADA A DIETA APÓS A AVALIAÇÃO DO MP.', '2019-01-13 06:27:47'),
	(83, 'matheus sobral medeiros', '1997-07-28', 137454, 475843, '2019-01-17', '2019-01-16', '19:30', 'urgencia', 'urgencia', 'Paciente Matheus Sobral Medeiros de entrada na Urgência com historia de abscessos pelo corpo, foi atendido pela clinica medica onde foi p´rescrito benzetacil IM mas a medicação esta em falta no Hospital e informação passado para o médico de plantão. Paciente após liberação foi procurar atendimento em, outro serviço.', '2019-01-17 06:21:58'),
	(84, 'KARINE CRISTIANE SANTOS RODRIGUES', '1986-08-16', 144637, 478193, '2019-01-31', '2019-01-31', '07:20', 'EMERGÊNCIA', 'HOTELARIA / SUPERVISÃO ADMINISTRATIVA', 'PACIENTE COM INTERNAMENTO AUTORIZADO DESDE ÁS 16:40, TODOS OS PAPÉIS DE INTERNAMENTO PRONTOS E QUANDO A PACIENTE FOI LEVADA PARA O 5º ANDAR, APARTAMENTO 515A, O MESMO ESTAVA FECHADO.', '2019-01-31 19:42:00'),
	(85, 'Luiz Alberto Gadelha Gaspar', '1989-12-06', 42895, 479045, '2019-02-06', '2019-02-06', '18:46', 'emergencia', 'cerpe', 'Demora no resultado dos exames. além de ultrapassar o horário previsto de saída dos resultado, ainda houve um erro ao ser lançado o exame de lâmina de fezes, onde foi informado por um dos atendentes que só seria disponibilizado esse resultado amanhã.', '2019-02-06 18:48:25'),
	(86, 'MARIA JOSÉ TARGINO PEREIRA', '1953-12-16', 571083, 482016, '2019-02-23', '2019-02-23', '13:30', 'URGÊNCIA', 'CERPE', 'PACIENTE REALIZOU COLETA DE MATERIAL PARA EXAMES POR VOLTAS DAS 9h. EM RAZÃO DA DEMORA DA LIBERAÇÃO DOS RESULTADOS CONTACTAMOS O LABORATÓRIO POR DUAS VEZES. ÁS 13:20 A SUPERVISORA DO CERPE, BRUNA, LIGOU PARA DAR UM RETORNO DE QUE O BIOMÉDICO ESTAVA EM DÚVIDA QUANTO AO RESULTADO DO PCR DA PACIENTE E POR ISSO NÃO HAVIA LIBERADO O EXAME. INFORMOU QUE SERIA REALIZADA RECOLETA E QUE A MESMA SERIA PRIORIDADE. A PACIENTE FOI INFORMADA DE TUDO E FICOU EXTREMAMENTE IRRITADA COM TAL DEMORA.', '2019-02-23 13:33:24'),
	(87, 'Leandro Marques Da Silva', '1985-11-25', 72289, 483863, '2019-03-07', '2019-03-07', '20:50', 'urgência', 'cerpe', 'Paciente relata ter coletado a urina às 16:30h e o cerpe  resgatou de 18:30h ( SIC )\r\nprevisão de resultado as 20:50h, sendo liberado as 21:10h no sistema para impressão...', '2019-03-07 22:21:10'),
	(88, 'WALDENIA DE SOUZA MELO', '1696-07-12', 45775, 484185, '2019-03-22', '2019-03-20', '09:30', 'HEMODINÂMICA', 'UTI GERAL', 'Paciente foi submetida a flebografia+USG+PICC LINE,chega ao setor com provável passagem de S.N.E por SCOPIA,porém a sonda veio literalmente obstruída por dieta impossibilitando a passagem do guia e com muita sujidade externamente também.', '2019-03-22 12:45:35'),
	(89, 'MARIA JULIANA VILAR VANDERLEI DO REGO BARROS ', '1973-11-05', 135366, 489858, '2019-04-10', '2019-04-10', '10:11', 'EMERGÊNCIA ', 'CLINICA MÉDICA ', 'PACIENTE CHEGA AO SERVIÇO APRESENTANDO DOR DE OUVIDO ESCORE 09, FOI REALIZADA CLASSIFICAÇÃO ÁS 09:50 E IMEDIATAMENTE COMUNICADO A CLÍNICA DE PLANTÃO BESLIE ARRUDA QUE NÃO RESPONDE AO CHAMADO DE IMEDIATO, SÓ ÁS 10:11, A MÉDICA PATRICIA MELO REALIZA O ATENDIMENTO DA PACIENTE, AMBAS, AS MÉDICA ENCONTRAVAM-SE NO ESTAR. \r\n\r\nVENHO ATRAVÉS DESTA NOTIFICAÇÃO SALIENTAR  QUE NAS QUARTAS- FEIRAS NO PLANTÃO DE DRª BESLIE ARRUDA E PATRICIA MELO, OCORRE ESSE TIPO DE SITUAÇÃO DE DEMORA NO ATENDIMENTO POR AS DUAS SEREM INFORMADAS DOS ATENDIMENTO E DEMORAR DE PROPOSITO, VISTO QUE POR DIVERSAS VEZES ENCONTRAM-SE NO ESTAR MÉDICO CONVERSANDO', '2019-04-10 10:16:54'),
	(90, 'ANA KARINA MEDEIROS ROCHA ', '1982-06-26', 134677, 489891, '2019-04-10', '2019-04-10', '13:12', 'EMERGÊNCIA ', 'CLINICA MÉDICA ', 'PACIENTE CLASSIFICADA ÁS 12:17 COM PRIORIDADE VERDE, COMUNICADO DO ATENDIMENTO FEITO A DRª PATRICIA MELO ÁS 12:20, A MESMA , ESTAVA SEM PACIENTE E NÃO ESTAVA REAVALIANDO ENCONTRAVA-SE NO POSTO DE ENFERMAGEM NO CELULAR, RETORNOU AO ESTAR MÉDICO E ÁS 13:15 PACIENTE AINDA AGUARDAVA ATENDIMENTO, DEMONSTRANDO IRRITABILIDADE E INSATISFAÇÃO. \r\nNOVAMENTE VENHO POR MEIO DESTA NOTIFICAÇÃO PEDIR ENCARECIDAMENTE SOLUÇÃO PARA ESTE TIPO DE COMPORTAMENTO DA PROFISSIONAL EM QUESTÃO QUE DEMONSTRA O MESMO COMPORTAMENTO TODO SEU PLANTÃO LEVANDO SOBRECARGA E RECLAMAÇÕES PARA EQUIPE DE ENFERMAGEM QUE FICA EXPOSTA DEVIDO O COMPORTAMENTO E FALTA DE COMPROMISSO DA EQUIPE DA CLINICA MÉDICA. ', '2019-04-10 13:21:16'),
	(91, '.', '2019-04-18', 0, 0, '2019-04-18', '2019-04-18', '08:13', 'EMERGÊNCIA ', 'FUNCIONÁRIA ', 'VENHO ATRAVÉS DESTA PEDIR SOLUÇÕES A RESPEITO DO COMPORTAMENTO DA TÉCNICA EM ENFERMAGEM JOYCE DE FRANÇA DUTRA,  LOTADA NA EMERGÊNCIA DESTE SERVIÇO , A MESMA APRESENTA INDISCIPLINA AO RECEBER ORDENAS DE SUES SUPERIORES, NÃO TEM MODOS COM OS PACIENTES POR MUITAS VEZES IGNORA AS ATRIBUIÇÕES QUE LHE SÃO FORNECIDAS, UTILIZA O APARELHO CELULAR CONSTANTEMENTE, ABANDONA O SETOR SEM DÁ SATISFAÇÃO AO SEU SUPERIOR. \r\nAS SITUAÇÕES SÃO CONSTANTES, PEÇO ENCARECIDAMENTE SOLUÇÃO. ', '2019-04-18 08:19:50'),
	(92, 'EDSON LEOCADIO DA SILVA', '1937-01-06', 136553, 475310, '2019-04-19', '2019-04-19', '23:10', 'HOTELÁRIA/ADMINISTRAÇÃO', 'POSTO 5º ANDAR', 'FOI SOLICITADO A TRANSFERÊNCIA DESTE PACIENTE PARA O 7° ANDAR AS 20:58 E A CONCLUSÃO NO LIVRO DA CENTRAL DE MAQUEIROS  FOI AS 21:18;  A HIGIENIZAÇÃO TEVE UM ATRASO DEVIDO OS MATERIAIS DE BOMBA DE INFUSÃO, ASPIRADOR, 3 TRÊS  APARADEIRAS ( QUE SÃO DA RESPONSABILIDADE DA ASSISTÊNCIA A RETIRADA) E O ENXOVAL SUJO, PARA QUE POSSA SER INICIADO A LIMPEZA, SOLICITEI QUE FOSSE RETIRADO AS 23:00 APENAS A BOMBA DE INFUSÃO E O ASPIRADOR, MESMO CIENTES DO TEMPO QUE FOI REALIZADO A TRANSFERÊNCIA, FOI NECESSÁRIO SOLICITAR MAIS UMA VEZ  E TIVE QUE ESCUTAR  QUE ESTAVA ANOTANDO NO PRONTUARIO E REALIZANDO MEDICAÇÕES (DE FATO ENTENDO A PRIORIDADE) MAS O TEMPO QUE FOI CONCLUÍDO A TRANSFERÊNCIA ATÉ A RETIRADA DOS MATERIAIS FORAM DE QUASE DUAS HORA, PEÇO QUE SEJA REALIZADO O RECOLHIMENTO DO MATERIAL NO ATO DA ALTA OU DA TRANSFERÊNCIA PARA QUE NÃO OCORRA MAIS  ATRASOS E PARA QUE NÃO OCORRA A  DEMORA DA ENTREGA DA LIMPEZA. ', '2019-04-20 00:22:37'),
	(93, 'CATARINA CARVALHO DE FIGUEIREDO SALES', '1959-10-22', 119416, 492487, '2019-04-28', '2019-04-28', '20:53', 'EMERGÊNCIA', 'LABORATÓRIO SINGULAR', 'O material do exame da paciente foi colhido por volta das 17:50 e o resultado só foi entregue ás 20:53.', '2019-04-28 21:04:19'),
	(94, 'CATARINA CARVALHO DE FIGUEIREDO SALES', '1959-10-22', 119416, 492487, '2019-04-28', '2019-04-28', '20:53', 'EMERGÊNCIA', 'LABORATÓRIO SINGULAR', 'O material do exame da paciente foi colhido por volta das 17:50 e o resultado só foi entregue ás 20:53.', '2019-04-28 21:04:25'),
	(95, 'CELIA MARIA CAVALCANTE BAROCUI', '1946-06-05', 148596, 497549, '2019-05-28', '2019-05-28', '12:55', 'EMERGÊNCIA ', 'ACOMPANHANTE ', 'VENHO ATRAVÉS DESTA NOTIFICAR O ACOMPANHANTE DA CLIENTE SUPRACITADA ONDE O MESMO TRATOU EQUIPE DE ENFERMAGEM DE MANEIRA RÍSPIDA ALEGANDO QUE A TÉCNICA DE ENFERMAGEM NOESIA SILVA O TRATOU MAL, PORÉM, EU ENFERMEIRO DO SETOR (KLEBERSON CARVALHO), PRESENCIEI O OCORRIDO E INTERVI INFORMANDO AO ACOMPANHANTE QUE O MESMO EQUIVOCOU-SE NA SUA COLOCAÇÃO, PORÉM, MANDOU-ME CALAR A BOCA ALEGANDO QUE NÃO ESTAVA FALANDO COMIGO, COMUNIQUEI AO MESMO QUE COMO CHEFE DO SETOR QUALQUER RECLAMAÇÃO REFERENTE A EQUIPE DE ENFERMAGEM EU RESPONDERIA. ', '2019-05-29 07:20:06'),
	(96, 'Dalberto Azoubel', '1955-08-08', 148619, 497672, '2019-05-29', '2019-05-29', '09:40', 'Emergência', 'Médico Assistente (Dr. Sérgio Murilo)', 'Paciente deu entrada na Emergência deste Serviço, informando na Triagem que seria atendido pessoalmente por MA (Dr. Sérgio Murilo); o atendimento de fato ocorreu; foram solicitados Exames (Imagem e Laboratoriais); foi deixada prescrição com o paciente e deixada a orientação verbal com ele (paciente) de que estaria de alta após realização dos exames. Ele (paciente) não foi reavaliado pelo MA, que também não deixou qualquer orientação ou fez contato com os colegas da Emergência sobre o caso, deixando estes em condição constrangedora perante o paciente e acompanhante. Foi tentado contato com MA, sem sucesso. O caso foi discutido na Radiologia com Dr. Lauro, que passou a discussão do caso que teve com MA e a solução disso foi a alta do paciente diante das condições expostas. ', '2019-05-29 11:45:00'),
	(97, 'MARIA DA CONCEIÇÃO BERTHOLINI', '1929-11-18', 124831, 499636, '2019-06-10', '2019-06-10', '06:50', 'URGÊNCIA', 'CERPE', 'O laboratório foi acionado desde ás 5:00 e até o momento não chegou ninguém para realizar a coleta.\r\nA paciente é particular e o tempo de permanência fará diferença no momento do fechamento da fatura.', '2019-06-10 06:54:47');
/*!40000 ALTER TABLE `tb_notificacao` ENABLE KEYS */;

-- Copiando estrutura para tabela db_intranet.tb_popups
CREATE TABLE IF NOT EXISTS `tb_popups` (
  `id_popup` int(11) NOT NULL AUTO_INCREMENT,
  `popup_title` varchar(264) NOT NULL,
  `popup_active` tinyint(4) NOT NULL,
  `id_user` int(11) NOT NULL,
  `dt_popup` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_popup`),
  KEY `FK_tb_users_tb_popups_idx` (`id_user`),
  CONSTRAINT `FK_tb_users_tb_popups` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela db_intranet.tb_popups: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_popups` DISABLE KEYS */;
INSERT INTO `tb_popups` (`id_popup`, `popup_title`, `popup_active`, `id_user`, `dt_popup`) VALUES
	(5, 'Metas Internacionais de Segurança do Paciente', 1, 1, '2019-06-17 09:13:15'),
	(6, 'Cuidados Paliativos', 1, 1, '2019-06-17 09:13:53'),
	(8, '1007 Tranplantes', 1, 1, '2019-06-21 08:27:12'),
	(9, 'São João', 1, 1, '2019-06-21 08:33:48');
/*!40000 ALTER TABLE `tb_popups` ENABLE KEYS */;

-- Copiando estrutura para tabela db_intranet.tb_posts
CREATE TABLE IF NOT EXISTS `tb_posts` (
  `idpost` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(264) NOT NULL,
  `autor` varchar(64) NOT NULL,
  `texto` text NOT NULL,
  `post_active` tinyint(4) NOT NULL,
  `id_user` int(11) NOT NULL,
  `dtpost` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idpost`),
  KEY `FK_tb_users_tb_posts_idx` (`id_user`),
  CONSTRAINT `FK_tb_users_tb_posts` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela db_intranet.tb_posts: ~62 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_posts` DISABLE KEYS */;
INSERT INTO `tb_posts` (`idpost`, `titulo`, `autor`, `texto`, `post_active`, `id_user`, `dtpost`) VALUES
	(2, 'Historia do Jayme da Fonte', 'Thiago Moura', '<i></i><i></i>Jayme da Fonte nasceu no Engenho São José, em Barra de Sirinhaém, em 27 de novembro de 1915, nos meses anteriores à inauguração do hospital, fez viagens aos Estados Unidos e à Europa, a fim de importar o que existisse de mais moderno em equipamentos hospitalares. O desejo de cuidar e salvar vidas eram seus preceitos, pois esses sentimentos sempre andaram lado a lado, aguçados pelo seu espírito de empreendedorismo. Inconformado com o fato de vidas serem perdidas por não existir nenhuma farmácia que funcionasse no horário noturno, finais de semanas e feriados, decidiu então, abrir uma farmácia que funcionaria 24 horas e não teria portas. Durante muitos anos o estabelecimento ficou conhecido como “Farmácia sem portas”.&nbsp;<div>?Hoje, esse serviço é considerado comum, mas na época representou um grande suporte à saúde da população Recifense.Em novembro de 1986, Dr. Jayme Wanderley da Fonte faleceu e o comando do hospital ficou sob a responsabilidade de seu filho, o médico Dr. Antônio Jayme da Fonte que divide até hoje a gestão da instituição com seus irmãos. Já se vão mais de 60 anos e, nestas décadas de constante renovação, o Hospital Jayme da Fonte tornou-se um dos mais modernos hospitais do Nordeste sendo um dos que mais investiram em tecnologia na última década, alcançando o status de Complexo Hospitalar.&nbsp;</div><div>?Hoje, o Hospital Jayme da Fonte é referência nacional em transplante hepático, além de ser destaque em cirurgias neurológica, urológica e do aparelho digestivo, contribuindo significativamente para a condição do Estado de Pernambuco como Polo Médico de grande destaque na América Latina.<i></i>  </div>', 0, 1, '2018-06-03 03:14:38'),
	(3, 'Seja um doador', 'Thiago Moura', '<p><i></i><i></i><b><i></i></b><b><i></i></b>Seja doador, avise sua família.</p>', 0, 1, '2018-06-09 14:46:55'),
	(4, 'Calor Humano', 'Thiago Moura', '<p>O jeito Jayme da Fonte de ser...<br></p>', 0, 1, '2018-06-09 14:47:41'),
	(5, 'Hospital Jayme da Fonte', 'Thiago Moura', '<p>Hospital Jayme da Fonte genuinamente pernambucano.<br></p>', 0, 1, '2018-06-09 14:49:00'),
	(11, 'Palestra Saude Mental', 'Thiago Moura', '<p>Como vai sua saúde mental?</p><p></p><p>- 10/10, às 15:00h - local: 9º andar.</p><p></p>', 0, 1, '2018-10-03 13:33:21'),
	(12, 'Palestra Outubro Rosa', 'Educação Permanente', '<p>\r\n\r\nNo mês de Outubro comemoramos o <em>Outubro Rosa</em>, um movimento de adesão mundial que visa estimular a luta contra o câncer de mama e seu diagnóstico precoce. O Hospital Jayme da Fonte convidou Dra. Alessandra Saraiva, Mastologista, para palestrar para seus funcionários.<br></p>', 0, 12, '2018-10-09 11:03:23'),
	(15, 'Manutenção e Inserção de GTT', 'Educação Permanente', '<p>A equipe de enfermagem do Hospital Jayme da Fonte irá promover um treinamento para capacitar sua equipe sobre a manutenção e inserção de GTT.</p>', 0, 12, '2018-10-17 08:27:21'),
	(16, 'Notificar não é punir', 'Educação Permanente', '<p>O Gerenciamento de Riscos do Hospital Jayme da Fonte fornecerá um treinamento para seus colaboradores sobre a importância da notificação de eventos adversos.</p>', 0, 12, '2018-10-17 11:33:17'),
	(19, 'Meta 2 - Comunicação Efetiva', 'Educação Permanente', '<p>O Hospital Jayme da Fonte irá promover um treinamento sobre a importância da melhoria na comunicação entre os profissionais.</p>', 0, 12, '2018-10-22 09:07:32'),
	(20, 'Treinamento Protocolo de SEPSE', 'Educação Permanente', '<p>O Hospital Jayme da Fonte em parceria com o Dr. Leandro Martinbianco&nbsp; irão promover um treinamento para implantação do protocolo de SEPSE.</p>', 0, 12, '2018-10-25 09:27:37'),
	(24, 'Treinamento Enfermagem', 'Educação Permanente', '<p>A equipe de enfermagem do Hospital Jayme da Fonte irá promover um treinamento sobre "Deterioração Clínica e PCR".</p>', 0, 12, '2018-10-31 15:04:43'),
	(25, 'Qualidade de Vida', 'Educação Permanente', '<p>O SESMT do Hospital Jayme da Fonte irá promover um encontro sobre qualidade de vida no trabalho.</p>', 0, 12, '2018-11-01 11:30:00'),
	(26, 'Treinamento Lavanderia', 'Educação Permanente', '<p>A Lavanderia do Hospital Jayme da Fonte irá promover um treinamento para seus colaboradores.</p>', 0, 12, '2018-11-07 07:34:14'),
	(27, 'Treinamento do Protocolo de TEV', 'Educação Permanente', '<p>A equipe de enfermagem do Hospital Jayme da fonte irá promover um treinamento sobre o Protocolo de TEV para seus colaboradores.</p>', 0, 12, '2018-11-07 07:35:44'),
	(28, 'Meta 3 - Segurança na prescrição, no uso e na administração de medicamentos', 'Educação Permanente', '<p>A Educação Permanente junto com a Farmácia irão promover um treinamento sobre a terceira meta internacional de segurança do paciente para os colaboradores do Hospital Jayme da Fonte.</p>', 0, 12, '2018-11-07 07:37:27'),
	(29, 'Treinamento do Protocolo de ITU', 'Educação Permanente', '<p>O Hospital Jayme da Fonte em parceria com Dr. Daniel Kitner irão promover um treinamento sobre a implantação do Protocolo de ITU.</p>', 0, 12, '2018-11-09 07:28:08'),
	(30, 'SIPAT', 'Educação Permanente', '<p>O serviço especializado em engenharia de segurança e medicina do trabalho do Hospital Jayme da Fonte irá promover a semana da SIPAT para os colaboradores da instituição. Participe!</p>', 0, 12, '2018-11-12 07:38:54'),
	(33, 'Palestra Novembro Azul', 'Educação Permanente', '<p>\r\n\r\nNo mês de Novembro comemoramos o <i>Novembro Azul</i>, um movimento de adesão mundial que visa estimular a luta contra o câncer de próstata e seu diagnóstico precoce. O Hospital Jayme da Fonte convida Dr. Renato Leal , Urologista, e a Enfermeira Andreyna Javorski, Mestre e Especialista em Oncologia, para palestrar para seus funcionários.\r\n\r\n<br></p>', 0, 12, '2018-11-21 08:45:28'),
	(35, 'Treinamento Enfermagem', 'Educação Permanente', '<p>A equipe de enfermagem irá promover um treinamento sobre contenção química e mecânica para seus colaboradores.</p>', 0, 12, '2018-11-26 07:23:21'),
	(37, 'Novembro Azul', 'Educação Permanente', '<p>Mês de Conscientização Sobre o Câncer de Próstata</p>', 0, 12, '2018-11-28 08:44:39'),
	(38, 'Dialogar é preciso ', 'Nova assessoria de Imprensa e Rede Sociais ', '<p>Dialogar é preciso, Nova assessoria de imprensa e Redes Sociais.</p>', 0, 13, '2018-11-30 07:38:46'),
	(41, 'Missa de Ação de Graças', 'Educação Permanente ', '<p>O Hospital Jayme da Fonte irá promover uma Missa de Ação de Graça.</p>', 0, 13, '2018-12-04 09:22:11'),
	(43, 'Dietas Hospitalares', 'Educação Permanente ', '<p>A equipe de enfermagem promove um treinamento de Dietas Hospitalares&nbsp;&nbsp;</p>', 0, 13, '2018-12-07 15:15:15'),
	(46, '18º Culto de Ação de Graças', 'Educação Permanente ', '<p>O Hospital Jayme da Fonte promove o 18º Culto de Ação de Graças.</p><p>"Dêem graças ao Senhor porque Ele é bom; o Seu amor dura para Sempre". Salmos 107:1</p>', 0, 13, '2018-12-13 07:19:47'),
	(48, 'Manipulação de Alimentos ', 'Educação Permanente ', '<p>\r\n\r\nA equipe da Nutrição irá promover um treinamento de Boas práticas na Manipulação de Alimentos.\r\n\r\n<br></p>', 0, 13, '2018-12-14 08:38:55'),
	(49, 'Classificação de Risco ', 'Educação Permanente ', '<p>A equipe de Enfermagem irá promover um treinamento de Classificação de Risco.</p>', 0, 13, '2018-12-17 11:08:57'),
	(50, 'Serviço de Arquivo Médico e Estatística - SAME', 'Educação Permanente ', '<p>Hospital Jayme da Fonte conta com setor de Serviço de Arquivo Médico e Estatística - SAME.</p>', 0, 13, '2018-12-18 07:22:26'),
	(51, 'Ouvidoria ', 'Educação Permanente ', '<p>O Hospital Jayme da Fonte conta com o setor da Ouvidoria.</p>', 0, 13, '2018-12-19 07:36:26'),
	(53, 'Diálogo', 'Educação Permanente', '<p>Assessoria de Imprensa e Redes Sociais</p>', 0, 12, '2019-01-02 08:25:49'),
	(54, 'Novos Membros da CIPA', 'Educação Permanente', '<p>A partir do dia 04/01/2019 até 18/01/2019 estarão abertas às inscrições para novos membros da CIPA do Hospital Jayme da Fonte.</p>', 0, 12, '2019-01-03 07:24:11'),
	(56, 'SAME', 'Educação Permanente', '<p>Serviço de Arquivo Médico e Estatística do Hospital Jayme da Fonte.</p>', 0, 12, '2019-01-07 08:19:35'),
	(57, 'ECO TRANSESOFÁGICO', 'Educação Permanente', '<p>O serviço de ECOCARDIOGRAFIA do Hospital Jayme da Fonte está realizando, também, exame de ECO TRANSESOFÁGICO.</p>', 0, 12, '2019-01-07 08:55:50'),
	(60, 'Gestão da Informação', 'Educação Permanente', '<p>O setor da Qualidade em parceria com o T.I irão promover um treinamento sobre a Política de Gestão da Informação para os colaboradores do Hospital Jayme da Fonte.</p>', 0, 12, '2019-01-17 10:14:27'),
	(62, 'Carteirinha de Sócio do SESC', 'Educação Permanente', '<p>O RH do Hospital Jayme da Fonte fará o cadastro dos colaboradores para carteirinha de sócio do SESC.</p>', 0, 12, '2019-01-21 11:29:54'),
	(65, 'Protocolo de Cuidados Paliativos', 'Educação Permanente', '<p>O Hospital Jayme da Fonte em parceria com Dr. Marcelo Cabral irão promover um treinamento sobre o "Protocolo de Cuidados Paliativos" para toda equipe multidisciplinar.</p>', 0, 12, '2019-01-25 07:29:40'),
	(66, 'Meta 5 - Higienizar as mãos para evitar infecções', 'Educação Permanente', '<p>O hospital Jayme da fonte irá fornecer um treinamento sobre a 5ª meta internacional de segurança do paciente para seus colaboradores.</p>', 0, 12, '2019-01-28 08:54:01'),
	(67, 'Eleições da CIPA', 'Educação Permanente', '<p>Eleições da CIPA do dia 30/01 a 01/02, a partir das 07h na portaria do relógio de ponto.</p>', 0, 12, '2019-01-29 14:01:30'),
	(70, 'Carteirinha do SESC', 'Educação Permanente', '<p>Novas datas para tirar a carteirinha do SESC</p>', 0, 12, '2019-02-01 07:33:26'),
	(71, 'SPAC', 'Educação Permanente', '<p>Studio de Patologia Cirúrgica do Hospital Jayme da Fonte.&nbsp;</p>', 0, 12, '2019-02-04 08:27:03'),
	(72, 'SAME', 'Educação Permanente ', '<p>\r\n\r\nServiço de Arquivo Médico e Estatística do Hospital Jayme da Fonte.\r\n\r\n<br></p>', 0, 12, '2019-02-04 08:29:21'),
	(73, 'Resultado da Eleição da CIPA', 'Educação Permanente', '<p>Resultado da Eleição da CIPA</p>', 0, 12, '2019-02-06 13:42:05'),
	(74, 'Nutrição Parenteral', 'Educação Permanente', '<p>A equipe de nutrição do Hospital Jayme da Fonte irá promover um treinamento sobre nutrição parenteral para os colaboradores da enfermagem.</p>', 0, 12, '2019-02-06 13:43:13'),
	(75, 'Meta 6', 'Educação Permanente', '<p>A educação permanente em parceria com a equipe de enfermagem do Hospital Jayme da Fonte irão promover um treinamento sobre a sexta meta internacional de segurança do paciente.</p>', 0, 12, '2019-02-06 13:44:40'),
	(76, 'Carteirinha SESC', 'Educação Permanente', '<p>Novas datas para tirar a carteirinha de sócio do SESC.</p>', 0, 12, '2019-02-11 11:03:02'),
	(81, 'Política de Gestão de Pessoas', 'Educação Permanente', '<p>Treinamento da Política de Gestão de Pessoas</p>', 0, 12, '2019-02-20 14:07:16'),
	(82, 'Protocolo PAC', 'Educação Permanente', '<p>\r\n\r\nO Hospital Jayme da Fonte em parceria com Dr. Alberto Barros irão promover um treinamento sobre o "Protocolo de PAC" para toda equipe multidisciplinar.\r\n\r\n<br></p>', 0, 12, '2019-02-22 08:13:32'),
	(83, 'Carnaval 2019', 'Educação Permanente', '<p>Bom carnaval! Aproveite com responsabilidade.</p>', 0, 12, '2019-02-26 11:04:08'),
	(84, 'SPAC', 'Educação Permanente', '<p>SPAC</p>', 0, 12, '2019-02-26 16:27:18'),
	(94, 'Ouvidoria', 'Educação Permanente', '<p>Ouvidoria</p>', 0, 12, '2019-03-27 10:15:08'),
	(95, 'Política de Gestão Ambiental', 'Educação Permanente', '<p>O Hospital Jayme da Fonte irá fornecer um treinamento sobre a Política de Gestão Ambiental para seus colaboradores.</p>', 0, 12, '2019-03-28 07:59:41'),
	(96, 'Protocolo de Dor Torácica', 'Educação Permanente', '<p>O Hospital Jayme da Fonte irá fornecer um treinamento sobre o Protocolo de Dor Torácica para a equipe multidisciplinar.</p>', 0, 12, '2019-03-28 08:24:21'),
	(98, 'Carteirinhas do SESC', 'Educação Permanente', '<p>SESC</p>', 0, 12, '2019-03-29 11:27:22'),
	(99, 'SPAC', 'Educação Permanente', '<p>SPAC</p>', 0, 12, '2019-04-03 13:35:51'),
	(100, 'Marcação de Consultas e Exames', 'Educação Permanente', '<p>Marcação de&nbsp;Consultas e Exames</p>', 0, 12, '2019-04-04 07:18:23'),
	(108, 'Dia das Mães', 'Educação Permanente', '<p>Feliz Dia das Mães!</p>', 0, 12, '2019-05-03 09:09:28'),
	(109, 'Dia da Enfermagem', 'Educação Permanente', '<p>"Trabalhar em equipe é unir várias formas de pensar para um só objetivo: Cuidas das Pessoas"</p><p>Parabéns à nossa equipe de Enfermagem.</p>', 0, 12, '2019-05-06 11:43:50'),
	(111, 'Vacinação', 'Educação Permanente', '<p>Vacinação Contra Influenza.</p>', 0, 12, '2019-05-10 15:55:29'),
	(112, 'Semana da Enfermagem', 'Educação Permanente', '<p>Semana da Enfermagem Hospital Jayme da Fonte</p>', 0, 12, '2019-05-13 07:15:11'),
	(118, '1000 Transplantes de Fígado', 'Educação Permanente', '<p>1000 Transplantes de Fígado<br></p>', 1, 12, '2019-05-24 07:32:48'),
	(120, 'SPAC', 'Educação Permanente', '<p>SPAC</p>', 1, 12, '2019-05-31 09:01:46'),
	(121, 'Marcação de Consultas', 'Educação Permanente', '<p>Ligue: 3416-0075</p>', 1, 12, '2019-06-10 09:27:57'),
	(122, 'Protocolo de Cuidados Paliativos', 'Educação Permanente', '<p>Protocolo de Cuidados Paliativos</p>', 1, 12, '2019-06-11 07:20:09');
/*!40000 ALTER TABLE `tb_posts` ENABLE KEYS */;

-- Copiando estrutura para tabela db_intranet.tb_ramais
CREATE TABLE IF NOT EXISTS `tb_ramais` (
  `id_agenda` int(11) NOT NULL AUTO_INCREMENT,
  `setor` varchar(50) NOT NULL,
  `ramal` varchar(60) NOT NULL,
  `colaborador` varchar(30) NOT NULL,
  `dt_agenda` datetime NOT NULL,
  PRIMARY KEY (`id_agenda`)
) ENGINE=MyISAM AUTO_INCREMENT=556 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela db_intranet.tb_ramais: 126 rows
/*!40000 ALTER TABLE `tb_ramais` DISABLE KEYS */;
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
	(433, 'CCIH', '0016', 'Cybelle / Stephany', '2018-03-05 07:32:43'),
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
	(446, 'Setor de Guias', '0034 / 0051 / 0093 / 2165 / 2171 / 2086', '-', '2018-03-05 07:32:43'),
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
	(461, 'SAC', '0050 / 0079', 'Anderson / Ingrite', '2018-03-05 07:32:43'),
	(462, 'Prescrição Médica 1o andar', '0052', '', '2018-03-05 07:32:43'),
	(463, 'Compras', '2074', '', '2018-03-05 07:32:43'),
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
	(483, 'Chamados Manutenção', '2029', 'Central Manuten', '2018-03-05 07:32:43'),
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
	(495, 'Escritório da Qualidade', '2119', 'Alberes  / David  / Vitória ', '2018-03-05 07:32:43'),
	(496, 'TOMOG / RESSO / LAUDOS', '2065', '', '2018-03-05 07:32:43'),
	(497, 'SESMT', '2066', 'Isley', '2018-03-05 07:32:43'),
	(498, 'Consultório ECO', '2069', '', '2018-03-05 07:32:43'),
	(499, 'Nutrição', '2072', 'Bernadete Meira', '2018-03-05 07:32:43'),
	(500, 'Gerência Compras', '2076', 'Juliana Alves', '2018-03-05 07:32:43'),
	(501, 'Diretoria Médica', '2079', 'Dr. Alberto Barros', '2018-03-05 07:32:43'),
	(502, 'Recepção da Informação', '2080', '', '2018-03-05 07:32:43'),
	(503, 'Copa 5º Andar', '2082', '-', '2018-03-05 07:32:43'),
	(504, 'CIHDOTT', '2085', 'Michelle', '2018-03-05 07:32:43'),
	(505, 'SAME', '2087', 'Juliana', '2018-03-05 07:32:43'),
	(506, 'Compras', '2075', 'Marcelo', '2018-03-05 07:32:43'),
	(507, 'Compras', '2137', 'Davi', '2018-03-05 07:32:43'),
	(508, 'Recepção de Imagem', '2145 / 0015', '-', '2018-03-05 07:32:43'),
	(509, 'Bloco Cirúrgico', '2146', '-', '2018-03-05 07:32:43'),
	(510, 'Auditoria Setor de Revisão', '2150 / 2152', 'Vanessa Morais', '2018-03-05 07:32:43'),
	(511, 'Auditoria enf. Chefe', '2153', 'Alice', '2018-03-05 07:32:43'),
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
	(533, 'Posto 8º Andar', '3820 / 3821 ', '-', '2018-03-05 07:32:43'),
	(534, 'Centro Diagnóstico 3 Recep', '4003 / 4009', '-', '2018-03-05 07:32:43'),
	(535, 'Centro Diagnóstico 3 Consultórios', '4004 / 4005 / 4006 / 4007 / 4008', '-', '2018-03-05 07:32:43'),
	(536, 'Marcação Exames /  CallCenter', '8888', '', '2018-03-05 07:32:43'),
	(537, 'Telefonista', '9', '-', '2018-03-05 07:32:43'),
	(540, 'CPD', '2164', 'Thiago Moura', '0000-00-00 00:00:00'),
	(545, 'GERÊNCIA HOSPITALIDADE', '0014', '', '0000-00-00 00:00:00'),
	(546, 'Setor Guias', '2032', 'Claudia ', '2018-00-00 00:00:00'),
	(547, 'Educacao Permanente', '2057', 'Mayara Elisabeth', '0000-00-00 00:00:00'),
	(548, 'Recursos Humanos', '2034', 'Edjane/Mariana', '0000-00-00 00:00:00'),
	(549, 'Gerenciamento de Risco ', '2057', 'Eleuza Mendes', '0000-00-00 00:00:00'),
	(550, 'Coordenação da Qualidade ', '2097', 'Andréa Faierstein', '0000-00-00 00:00:00'),
	(551, 'Gerencia da Enfermagem ', '2096', 'Carolina Carrascoso ', '0000-00-00 00:00:00'),
	(552, 'Consultório Dr. Marcelo Cabral', '4500', 'Dr. Marcelo Cabral', '0000-00-00 00:00:00'),
	(553, 'Manutenção Predial', '2028', 'Oficina', '0000-00-00 00:00:00'),
	(554, 'Auditoria posto 8º Andar', '3823', '', '0000-00-00 00:00:00'),
	(555, 'EBEM - Engenharia Clínica', '2031', 'Caroline', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_ramais` ENABLE KEYS */;

-- Copiando estrutura para tabela db_intranet.tb_users
CREATE TABLE IF NOT EXISTS `tb_users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `desname` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `setor` varchar(60) NOT NULL,
  `role` tinyint(3) NOT NULL,
  `data_usuario` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela db_intranet.tb_users: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` (`id_user`, `desname`, `login`, `senha`, `setor`, `role`, `data_usuario`) VALUES
	(1, 'Thiago Moura', 'thienry', '$2y$12$0YxtjSJsGksknhQBjMbtS.Uj2hklwTOnLK3TW5NljU5g56JNEEN3O', 'CPD', 1, '2018-05-25 19:25:37'),
	(2, 'Suely Melo', 'suely', '$2y$12$q3uTF/y/iLOad7AsdKzcTeAU7LxJWqRq0OgZA6tkrQTsr24cGgqWm', 'Marketing', 0, '2018-06-11 10:04:17'),
	(11, 'cpd', 'cpd', '$2y$12$2SG3lotl.pWT0pDMtDPL.ezLK4wfDhQ7YOTIFs8OadfQSn08kjvu.', 'cpd', 1, '2018-07-11 13:52:57'),
	(12, 'Mayara Lima', 'mayara.lima', '$2y$12$b4Lbt1iNLzfm/haPrX7mfeKumvkkY7gyIfkb.ipXyW/hGNlK2UWcK', 'Educação Permanente', 0, '2018-10-05 11:18:39'),
	(13, 'David Jose da Silva', 'david.jose', '$2y$12$IxYzcY64PNHTlh.Q8L1JH.L/fZa1Rf5jUdtzhaIFzXRu6P985T7Vi', 'Qualidade', 2, '2018-11-26 15:55:41'),
	(14, 'Anderson Chagas', 'achagas', '$2y$12$TLx5mKsSyjeizz3tU3peI.NC/iWBFLkrwAZlj2.CZ5zrWnWyqkyaO', 'Tecnologia da Informação', 1, '2018-12-11 11:21:46');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
