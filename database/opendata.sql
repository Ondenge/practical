-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.28 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for opendata
DROP DATABASE IF EXISTS `opendata`;
CREATE DATABASE IF NOT EXISTS `opendata` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `opendata`;

-- Dumping structure for table opendata.auth_assignment
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table opendata.auth_assignment: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;

-- Dumping structure for table opendata.auth_item
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  KEY `fk_auth_item_group_code` (`group_code`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table opendata.auth_item: ~79 rows (approximately)
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`, `group_code`) VALUES
	('/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('//*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('//controller', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('//crud', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('//extension', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('//form', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('//index', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('//model', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('//module', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/asset/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/asset/compress', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/asset/template', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/cache/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/cache/flush', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/cache/flush-all', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/cache/flush-schema', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/cache/index', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/fixture/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/fixture/load', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/fixture/unload', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/gii/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/gii/default/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/gii/default/action', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/gii/default/diff', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/gii/default/index', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/gii/default/preview', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/gii/default/view', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/hello/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/hello/index', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/help/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/help/index', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/help/list', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/help/list-action-options', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/help/usage', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/message/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/message/config', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/message/config-template', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/message/extract', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/migrate/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/migrate/create', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/migrate/down', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/migrate/fresh', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/migrate/history', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/migrate/mark', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/migrate/new', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/migrate/redo', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/migrate/to', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/migrate/up', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/serve/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/serve/index', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/*', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/auth/change-own-password', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user-permission/set', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user-permission/set-roles', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user/bulk-activate', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user/bulk-deactivate', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user/bulk-delete', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user/change-password', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user/create', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user/delete', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user/grid-page-size', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user/index', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user/update', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('/user-management/user/view', 3, NULL, NULL, NULL, 1666702450, 1666702450, NULL),
	('Admin', 1, 'Admin', NULL, NULL, 1666702450, 1666702450, NULL),
	('assignRolesToUsers', 2, 'Assign roles to users', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('bindUserToIp', 2, 'Bind user to IP', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('changeOwnPassword', 2, 'Change own password', NULL, NULL, 1666702450, 1666702450, 'userCommonPermissions'),
	('changeUserPassword', 2, 'Change user password', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('commonPermission', 2, 'Common permission', NULL, NULL, 1666702449, 1666702449, NULL),
	('createUsers', 2, 'Create users', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('deleteUsers', 2, 'Delete users', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('editUserEmail', 2, 'Edit user email', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('editUsers', 2, 'Edit users', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('viewRegistrationIp', 2, 'View registration IP', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('viewUserEmail', 2, 'View user email', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('viewUserRoles', 2, 'View user roles', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('viewUsers', 2, 'View users', NULL, NULL, 1666702450, 1666702450, 'userManagement'),
	('viewVisitLog', 2, 'View visit log', NULL, NULL, 1666702450, 1666702450, 'userManagement');
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;

-- Dumping structure for table opendata.auth_item_child
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table opendata.auth_item_child: ~27 rows (approximately)
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
	('changeOwnPassword', '/user-management/auth/change-own-password'),
	('assignRolesToUsers', '/user-management/user-permission/set'),
	('assignRolesToUsers', '/user-management/user-permission/set-roles'),
	('editUsers', '/user-management/user/bulk-activate'),
	('editUsers', '/user-management/user/bulk-deactivate'),
	('deleteUsers', '/user-management/user/bulk-delete'),
	('changeUserPassword', '/user-management/user/change-password'),
	('createUsers', '/user-management/user/create'),
	('deleteUsers', '/user-management/user/delete'),
	('viewUsers', '/user-management/user/grid-page-size'),
	('viewUsers', '/user-management/user/index'),
	('editUsers', '/user-management/user/update'),
	('viewUsers', '/user-management/user/view'),
	('Admin', 'assignRolesToUsers'),
	('Admin', 'changeOwnPassword'),
	('Admin', 'changeUserPassword'),
	('Admin', 'createUsers'),
	('Admin', 'deleteUsers'),
	('Admin', 'editUsers'),
	('editUserEmail', 'viewUserEmail'),
	('assignRolesToUsers', 'viewUserRoles'),
	('Admin', 'viewUsers'),
	('assignRolesToUsers', 'viewUsers'),
	('changeUserPassword', 'viewUsers'),
	('createUsers', 'viewUsers'),
	('deleteUsers', 'viewUsers'),
	('editUsers', 'viewUsers');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;

-- Dumping structure for table opendata.auth_item_group
DROP TABLE IF EXISTS `auth_item_group`;
CREATE TABLE IF NOT EXISTS `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table opendata.auth_item_group: ~2 rows (approximately)
/*!40000 ALTER TABLE `auth_item_group` DISABLE KEYS */;
INSERT INTO `auth_item_group` (`code`, `name`, `created_at`, `updated_at`) VALUES
	('userCommonPermissions', 'User common permission', 1666702450, 1666702450),
	('userManagement', 'User management', 1666702450, 1666702450);
/*!40000 ALTER TABLE `auth_item_group` ENABLE KEYS */;

-- Dumping structure for table opendata.auth_rule
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table opendata.auth_rule: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;

-- Dumping structure for table opendata.dataelement
DROP TABLE IF EXISTS `dataelement`;
CREATE TABLE IF NOT EXISTS `dataelement` (
  `dataelement_id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dataelementName` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dataelementCode` int DEFAULT NULL,
  `dataeCategory` int DEFAULT NULL,
  `status` int NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `deleted` date NOT NULL,
  PRIMARY KEY (`dataelement_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table opendata.dataelement: ~0 rows (approximately)
/*!40000 ALTER TABLE `dataelement` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataelement` ENABLE KEYS */;

-- Dumping structure for table opendata.datasets
DROP TABLE IF EXISTS `datasets`;
CREATE TABLE IF NOT EXISTS `datasets` (
  `dataset_id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(12) NOT NULL,
  `datasetName` varchar(200) DEFAULT NULL,
  `datasetCode` int DEFAULT NULL,
  `dataelement` int DEFAULT NULL,
  `status` int NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `deleted` date NOT NULL,
  PRIMARY KEY (`dataset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table opendata.datasets: ~0 rows (approximately)
/*!40000 ALTER TABLE `datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `datasets` ENABLE KEYS */;

-- Dumping structure for table opendata.migration
DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table opendata.migration: ~11 rows (approximately)
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1666702441),
	('m140608_173539_create_user_table', 1666702447),
	('m140611_133903_init_rbac', 1666702448),
	('m140808_073114_create_auth_item_group_table', 1666702449),
	('m140809_072112_insert_superadmin_to_user', 1666702449),
	('m140809_073114_insert_common_permisison_to_auth_item', 1666702449),
	('m141023_141535_create_user_visit_log', 1666702450),
	('m141116_115804_add_bind_to_ip_and_registration_ip_to_user', 1666702450),
	('m141121_194858_split_browser_and_os_column', 1666702450),
	('m141201_220516_add_email_and_email_confirmed_to_user', 1666702450),
	('m141207_001649_create_basic_user_permissions', 1666702450);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;

-- Dumping structure for table opendata.organisation
DROP TABLE IF EXISTS `organisation`;
CREATE TABLE IF NOT EXISTS `organisation` (
  `organisation_id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(12) NOT NULL,
  `organisationName` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `organisationCode` int NOT NULL,
  `organisationLevel` int NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `organisationStatus` int NOT NULL,
  `longitude` varchar(1000) DEFAULT NULL,
  `latitude` varchar(1000) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `deleted` date DEFAULT NULL,
  PRIMARY KEY (`organisation_id`) USING BTREE,
  KEY `FK_organisation_organisationlevel` (`organisationLevel`),
  CONSTRAINT `FK_organisation_organisationlevel` FOREIGN KEY (`organisationLevel`) REFERENCES `organisationlevel` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table opendata.organisation: ~0 rows (approximately)
/*!40000 ALTER TABLE `organisation` DISABLE KEYS */;
/*!40000 ALTER TABLE `organisation` ENABLE KEYS */;

-- Dumping structure for table opendata.organisationlevel
DROP TABLE IF EXISTS `organisationlevel`;
CREATE TABLE IF NOT EXISTS `organisationlevel` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `levelName` varchar(50) NOT NULL,
  `levelCode` int NOT NULL,
  `tier` int NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `deleted` date DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table opendata.organisationlevel: ~5 rows (approximately)
/*!40000 ALTER TABLE `organisationlevel` DISABLE KEYS */;
INSERT INTO `organisationlevel` (`level_id`, `levelName`, `levelCode`, `tier`, `created`, `updated`, `deleted`) VALUES
	(1, 'National', 1001, 1, '2022-10-24', '2022-10-24', '0000-00-00'),
	(2, 'County', 1002, 2, '2022-10-24', '2022-10-24', NULL),
	(3, 'Sub County', 1003, 3, '2022-10-24', '2022-10-24', NULL),
	(4, 'Ward', 1004, 4, '2022-10-24', '2022-10-24', NULL),
	(5, 'Point', 1005, 5, '2022-10-24', '2022-10-24', NULL);
/*!40000 ALTER TABLE `organisationlevel` ENABLE KEYS */;

-- Dumping structure for table opendata.status
DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `statusName` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `deleted` date DEFAULT NULL,
  PRIMARY KEY (`status_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table opendata.status: ~0 rows (approximately)
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

-- Dumping structure for table opendata.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `superadmin` smallint DEFAULT '0',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `registration_ip` varchar(15) DEFAULT NULL,
  `bind_to_ip` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_confirmed` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table opendata.user: ~1 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `confirmation_token`, `status`, `superadmin`, `created_at`, `updated_at`, `registration_ip`, `bind_to_ip`, `email`, `email_confirmed`) VALUES
	(1, 'superadmin', 'EkjA7x43Yh0hjU1qQN5nydgC1TiZpzOz', '$2y$13$rdk5jO/bjllNFelCYcyI/eG32jnpxyRMNL752xxfyYMC/thOmtyK6', NULL, 1, 1, 1666702449, 1666702449, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table opendata.user_visit_log
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE IF NOT EXISTS `user_visit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` char(2) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `visit_time` int NOT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table opendata.user_visit_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_visit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_visit_log` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
