-- --------------------------------------------------------
-- Servidor:                     192.168.0.8
-- Versão do servidor:           5.1.73 - Source distribution
-- OS do Servidor:               redhat-linux-gnu
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para intranet

-- Copiando estrutura para tabela intranet.listaramais
CREATE TABLE IF NOT EXISTS `listaramais` (
  `id_agenda` int(11) NOT NULL AUTO_INCREMENT,
  `setor` varchar(50) NOT NULL,
  `ramal` varchar(60) NOT NULL,
  `colaborador` varchar(30) NOT NULL,
  `dt_agenda` datetime NOT NULL,
  PRIMARY KEY (`id_agenda`)
) ENGINE=MyISAM AUTO_INCREMENT=538 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela intranet.listaramais: 114 rows
/*!40000 ALTER TABLE `listaramais` DISABLE KEYS */;
INSERT INTO `listaramais` (`id_agenda`, `setor`, `ramal`, `colaborador`, `dt_agenda`) VALUES
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
	(537, 'Telefonista', '9', '-', '2018-03-05 07:32:43');
/*!40000 ALTER TABLE `listaramais` ENABLE KEYS */;

-- Copiando estrutura para tabela intranet.tb_cad_usuarios
CREATE TABLE IF NOT EXISTS `tb_cad_usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `setor` varchar(50) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `dt_cad_usuario` datetime NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela intranet.tb_cad_usuarios: 0 rows
/*!40000 ALTER TABLE `tb_cad_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cad_usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
