/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `admin_notifications`;
CREATE TABLE `admin_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `admin_password_resets`;
CREATE TABLE `admin_password_resets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(28,8) DEFAULT '0.00000000',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `assigned_vehicles`;
CREATE TABLE `assigned_vehicles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trip_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vehicle_id` int(10) unsigned NOT NULL DEFAULT '0',
  `start_from` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `booked_tickets`;
CREATE TABLE `booked_tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `gender` int(10) unsigned NOT NULL DEFAULT '0',
  `trip_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `source_destination` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_point` int(10) unsigned NOT NULL DEFAULT '0',
  `dropping_point` int(10) unsigned NOT NULL DEFAULT '0',
  `seats` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_count` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_price` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `sub_total` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `date_of_journey` date DEFAULT NULL,
  `pnr_number` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `counters`;
CREATE TABLE `counters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `deposits`;
CREATE TABLE `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `booked_ticket_id` int(10) NOT NULL,
  `method_code` int(10) unsigned NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `final_amo` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT '0',
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `email_logs`;
CREATE TABLE `email_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `mail_sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `email_sms_templates`;
CREATE TABLE `email_sms_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `shortcodes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `extensions`;
CREATE TABLE `extensions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci,
  `shortcode` text COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `fleet_types`;
CREATE TABLE `fleet_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seat_layout` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deck` int(10) unsigned NOT NULL DEFAULT '0',
  `deck_seats` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facilities` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_ac` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontends`;
CREATE TABLE `frontends` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `gateway_currencies`;
CREATE TABLE `gateway_currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `max_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) NOT NULL DEFAULT '0.00',
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `gateways`;
CREATE TABLE `gateways` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci,
  `crypto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `input_form` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `general_settings`;
CREATE TABLE `general_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci,
  `sms_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci,
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `secure_password` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sys_version` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `schedules`;
CREATE TABLE `schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `start_from` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `seat_layouts`;
CREATE TABLE `seat_layouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `support_attachments`;
CREATE TABLE `support_attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `support_message_id` int(10) unsigned NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `support_messages`;
CREATE TABLE `support_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supportticket_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `support_tickets`;
CREATE TABLE `support_tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `ticket_price_by_stoppages`;
CREATE TABLE `ticket_price_by_stoppages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_price_id` int(10) unsigned NOT NULL DEFAULT '0',
  `source_destination` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `ticket_prices`;
CREATE TABLE `ticket_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fleet_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vehicle_route_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `trips`;
CREATE TABLE `trips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleet_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vehicle_route_id` int(10) unsigned NOT NULL DEFAULT '0',
  `schedule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `start_from` int(10) unsigned NOT NULL DEFAULT '0',
  `end_to` int(10) unsigned NOT NULL DEFAULT '0',
  `day_off` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_logins`;
CREATE TABLE `user_logins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: banned, 1: active',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `vehicle_routes`;
CREATE TABLE `vehicle_routes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_from` int(10) unsigned NOT NULL DEFAULT '0',
  `end_to` int(10) unsigned DEFAULT '0',
  `stoppages` text COLLATE utf8mb4_unicode_ci,
  `distance` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fleet_type_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `register_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chasis_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `read_status`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'New member registered', 0, '/admin/user/detail/1', '2024-10-02 17:20:34', '2024-10-02 17:20:34');
INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `read_status`, `click_url`, `created_at`, `updated_at`) VALUES
(2, 1, 'Payment request from ifailamir', 0, '/admin/payment/details/1', '2024-10-02 17:27:14', '2024-10-02 17:27:14');
INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `read_status`, `click_url`, `created_at`, `updated_at`) VALUES
(3, 1, 'Payment request from ifailamir', 0, '/admin/payment/details/2', '2024-10-03 15:29:50', '2024-10-03 15:29:50');



INSERT INTO `admins` (`id`, `name`, `email`, `username`, `balance`, `email_verified_at`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'ifailamir@gmail.com', 'puspajaya', '11640.00000000', NULL, '5ff1c3531ed3f1609679699.jpg', '$2y$10$2qcOUKrDIUqyyCklvHp7IO8fGNcJ1gAXtxouTn1isZPHu6H8CfHPq', NULL, '2022-02-16 04:09:06');


INSERT INTO `assigned_vehicles` (`id`, `trip_id`, `vehicle_id`, `start_from`, `end_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '00:00:00', '11:55:00', 1, '2024-10-02 16:59:42', '2024-10-02 17:00:40');


INSERT INTO `booked_tickets` (`id`, `user_id`, `gender`, `trip_id`, `source_destination`, `pickup_point`, `dropping_point`, `seats`, `ticket_count`, `unit_price`, `sub_total`, `date_of_journey`, `pnr_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '[\"1\",\"9\"]', 1, 9, '[\"1-A1\",\"1-B1\"]', 2, '500000.00000000', '1000000.00000000', '2024-10-02', 'RZ6VCGX5BS', 1, '2024-10-02 17:21:07', '2024-10-05 16:41:04');
INSERT INTO `booked_tickets` (`id`, `user_id`, `gender`, `trip_id`, `source_destination`, `pickup_point`, `dropping_point`, `seats`, `ticket_count`, `unit_price`, `sub_total`, `date_of_journey`, `pnr_number`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, '[\"1\",\"9\"]', 1, 9, '[\"1-A1\",\"1-A2\",\"2-A1\"]', 3, '500000.00000000', '1500000.00000000', '2024-10-03', 'UYDRB6TS3M', 2, '2024-10-03 15:29:15', '2024-10-03 15:29:50');
INSERT INTO `booked_tickets` (`id`, `user_id`, `gender`, `trip_id`, `source_destination`, `pickup_point`, `dropping_point`, `seats`, `ticket_count`, `unit_price`, `sub_total`, `date_of_journey`, `pnr_number`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, '[\"1\",\"9\"]', 1, 9, '[\"1-B4\",\"1-B5\"]', 2, '500000.00000000', '1000000.00000000', '2024-10-03', '5MP2WYPONW', 0, '2024-10-03 16:51:01', '2024-10-03 16:51:01');
INSERT INTO `booked_tickets` (`id`, `user_id`, `gender`, `trip_id`, `source_destination`, `pickup_point`, `dropping_point`, `seats`, `ticket_count`, `unit_price`, `sub_total`, `date_of_journey`, `pnr_number`, `status`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 1, '[\"1\",\"2\"]', 1, 2, '[\"1-A2\",\"1-B1\"]', 2, '500000.00000000', '1000000.00000000', '2024-10-05', 'EM6N6B5MVX', 0, '2024-10-05 00:10:22', '2024-10-05 00:10:22'),
(5, 1, 1, 1, '[\"1\",\"9\"]', 1, 9, '[\"1-A1\"]', 1, '500000.00000000', '500000.00000000', '2024-10-05', '81X5KJ6RQ3', 0, '2024-10-05 16:26:38', '2024-10-05 16:26:38'),
(6, 1, 1, 1, '[\"1\",\"9\"]', 1, 9, '[\"2-A1\",\"2-A2\"]', 2, '500000.00000000', '1000000.00000000', '2024-10-05', '3DH6QMH38R', 1, '2024-10-05 16:29:14', '2024-10-05 17:09:42'),
(7, 1, 1, 1, '[\"1\",\"9\"]', 1, 9, '[\"1-A1\",\"1-A2\"]', 2, '500000.00000000', '1000000.00000000', '2024-10-06', 'PR7EDRB8QW', 0, '2024-10-06 17:04:00', '2024-10-06 17:04:00');

INSERT INTO `counters` (`id`, `name`, `city`, `location`, `mobile`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kota Brebes', 'Brebes', 'Jl. Utama No.1', '081234567801', 1, '2024-10-02 16:40:08', '2024-10-02 16:40:08');
INSERT INTO `counters` (`id`, `name`, `city`, `location`, `mobile`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Kota Tegal', 'Tegal', 'Jl. Pahlawan No.2', '081234567802', 1, '2024-10-02 16:40:08', '2024-10-02 16:40:08');
INSERT INTO `counters` (`id`, `name`, `city`, `location`, `mobile`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Kota Pemalang', 'Pemalang', 'Jl. Merdeka No.3', '081234567803', 1, '2024-10-02 16:40:08', '2024-10-02 16:40:08');
INSERT INTO `counters` (`id`, `name`, `city`, `location`, `mobile`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Kota Pekalongan', 'Pekalongan', 'Jl. Ahmad Yani No.4', '081234567804', 1, '2024-10-02 16:40:08', '2024-10-02 16:40:08'),
(5, 'Kota Batang', 'Batang', 'Jl. Pemuda No.5', '081234567805', 1, '2024-10-02 16:40:08', '2024-10-02 16:40:08'),
(6, 'Kota Kendal', 'Kendal', 'Jl. Sudirman No.6', '081234567806', 1, '2024-10-02 16:40:08', '2024-10-02 16:40:08'),
(7, 'Kota Semarang', 'Semarang', 'Jl. Gajah Mada No.7', '081234567807', 1, '2024-10-02 16:40:08', '2024-10-02 16:40:08'),
(8, 'Kota Magelang', 'Magelang', 'Jl. Diponegoro No.8', '081234567808', 1, '2024-10-02 16:40:08', '2024-10-02 16:40:08'),
(9, 'Kota Yogyakarta', 'Yogyakarta', 'Jl. Malioboro No.9', '081234567809', 1, '2024-10-02 16:40:08', '2024-10-02 16:40:08'),
(10, 'Kota Pejagan', 'Pejagan', 'Jl. Utama No.10', '081234567810', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(11, 'Kota Bumi Ayu', 'Bumi Ayu', 'Jl. Pahlawan No.11', '081234567811', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(12, 'Kota Wangon', 'Wangon', 'Jl. Merdeka No.12', '081234567812', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(13, 'Kota Sampang', 'Sampang', 'Jl. Ahmad Yani No.13', '081234567813', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(14, 'Kota Gombong', 'Gombong', 'Jl. Pemuda No.14', '081234567814', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(15, 'Kota Purworejo', 'Purworejo', 'Jl. Sudirman No.15', '081234567815', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(16, 'Kota Kebumen', 'Kebumen', 'Jl. Diponegoro No.16', '081234567816', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(17, 'Kota Wates', 'Wates', 'Jl. Gajah Mada No.17', '081234567817', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(18, 'Kota Gamping', 'Gamping', 'Jl. Malioboro No.18', '081234567818', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(19, 'Kota Klaten', 'Klaten', 'Jl. Sutomo No.19', '081234567819', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(20, 'Kota Prambanan', 'Prambanan', 'Jl. Raden Saleh No.20', '081234567820', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(21, 'Kota Kartosuro', 'Kartosuro', 'Jl. Kartini No.21', '081234567821', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(22, 'Kota Solo', 'Solo', 'Jl. Slamet Riyadi No.22', '081234567822', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(23, 'Kota Maospati', 'Maospati', 'Jl. Mangunsarkoro No.23', '081234567823', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(24, 'Kota Ngawi', 'Ngawi', 'Jl. Jenderal Sudirman No.24', '081234567824', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(25, 'Kota Madiun', 'Madiun', 'Jl. Pancasila No.25', '081234567825', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(26, 'Kota Ponorogo', 'Ponorogo', 'Jl. Soekarno Hatta No.26', '081234567826', 1, '2024-10-02 16:49:13', '2024-10-02 16:49:13'),
(27, 'Kota Nganjuk', 'Nganjuk', 'Jl. Utama No.27', '081234567827', 1, '2024-10-02 16:50:14', '2024-10-02 16:50:14'),
(28, 'Kota Tulung Agung', 'Tulung Agung', 'Jl. Pahlawan No.28', '081234567828', 1, '2024-10-02 16:50:14', '2024-10-02 16:50:14'),
(29, 'Kota Kediri', 'Kediri', 'Jl. Merdeka No.29', '081234567829', 1, '2024-10-02 16:50:14', '2024-10-02 16:50:14'),
(30, 'Kota Blitar', 'Blitar', 'Jl. Ahmad Yani No.30', '081234567830', 1, '2024-10-02 16:50:14', '2024-10-02 16:50:14'),
(31, 'Kota Boyolali', 'Boyolali', 'Jl. Pemuda No.31', '081234567831', 1, '2024-10-02 16:50:14', '2024-10-02 16:50:14');

INSERT INTO `deposits` (`id`, `user_id`, `booked_ticket_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1000, '1000000.00000000', 'IDR', '12500.00000000', '16000.00000000', '16200000000.00000000', '{\"jumlah_transfer\":{\"field_name\":\"23112312312\",\"type\":\"text\"},\"bukti_bayar\":{\"field_name\":\"2024\\/10\\/02\\/66fd2001e39981727864833.png\",\"type\":\"file\"}}', '0', '', 'C2ZB5MNVFJWX', 0, 1, 0, NULL, '2024-10-02 17:26:51', '2024-10-02 17:27:41');
INSERT INTO `deposits` (`id`, `user_id`, `booked_ticket_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 1000, '1500000.00000000', 'IDR', '17500.00000000', '16000.00000000', '24280000000.00000000', '{\"jumlah_transfer\":{\"field_name\":\"1500000\",\"type\":\"text\"},\"bukti_bayar\":{\"field_name\":\"2024\\/10\\/03\\/66fe55fe8855a1727944190.png\",\"type\":\"file\"}}', '0', '', 'HVO7DVN7R5BN', 0, 2, 0, NULL, '2024-10-03 15:29:22', '2024-10-03 15:29:50');
INSERT INTO `deposits` (`id`, `user_id`, `booked_ticket_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 109, '1000000.00000000', 'IDR', '11000.00000000', '1.00000000', '1011000.00000000', NULL, '0', '', 'UAU5XCND2S4B', 0, 0, 0, NULL, '2024-10-03 16:54:30', '2024-10-03 16:54:30');
INSERT INTO `deposits` (`id`, `user_id`, `booked_ticket_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(4, 1, 4, 109, '1000000.00000000', 'IDR', '11000.00000000', '1.00000000', '1011000.00000000', NULL, '0', '', 'WTCP3UBKXA5J', 0, 0, 0, NULL, '2024-10-05 00:10:34', '2024-10-05 00:10:34'),
(5, 1, 5, 109, '500000.00000000', 'IDR', '6000.00000000', '1.00000000', '506000.00000000', NULL, '0', '', 'ZKJPQDPOKRMN', 0, 0, 0, NULL, '2024-10-05 16:26:44', '2024-10-05 16:26:44'),
(6, 1, 6, 109, '1000000.00000000', 'IDR', '11000.00000000', '1.00000000', '1011000.00000000', NULL, '0', '', 'HZNT2S6Y24F1', 0, 0, 0, NULL, '2024-10-05 16:29:20', '2024-10-05 16:29:20'),
(7, 1, 7, 109, '1000000.00000000', 'IDR', '11000.00000000', '1.00000000', '1011000.00000000', NULL, '0', '', 'YO77AH7YKA2G', 0, 0, 0, NULL, '2024-10-06 17:04:13', '2024-10-06 17:04:13');

INSERT INTO `email_logs` (`id`, `user_id`, `mail_sender`, `email_from`, `email_to`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'php', 'PUSPA JAYA do-not-reply@viserlab.com', 'ifailamir@gmail.com', 'Payment Request Submitted Successfully', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello failamir abdullah (ifailamir)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>Your payment request of <b>1,000,000.00 IDR</b> is via&nbsp; <b>Bank BRI </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : 1,000,000.00 IDR</div><div>Charge: <font color=\"#FF0000\">12,500.00 IDR</font></div><div><br></div><div>Conversion Rate : 1 IDR = 16,000.00 IDR</div><div>Payable : 16,200,000,000.00 IDR <br></div><div>Pay via :&nbsp; Bank BRI</div><div><br></div><div>Transaction Number : C2ZB5MNVFJWX</div><div><br></div><div><b>Pending Booking Information :<br></b></div><div><br></div><div>Date of Journey : 02 10, 2024</div><div>Seats: 1-A1,1-B1</div><div>Total Seats : 2</div><div>Starting Point : Kota Brebes</div><div>Destination : Kota Yogyakarta</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', '2024-10-02 17:27:14', '2024-10-02 17:27:14');
INSERT INTO `email_logs` (`id`, `user_id`, `mail_sender`, `email_from`, `email_to`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(2, 1, 'php', 'PUSPA JAYA do-not-reply@viserlab.com', 'ifailamir@gmail.com', 'Your payment is Approved', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello failamir abdullah (ifailamir)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>Your payment request of <b>1,000,000.00 IDR</b> is via&nbsp; <b>Bank BRI </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : 1,000,000.00 IDR</div><div>Charge: <font color=\"#FF0000\">12,500.00 IDR</font></div><div><br></div><div>Conversion Rate : 1 IDR = 16,000.00 IDR</div><div>Payable : 16,200,000,000.00 IDR <br></div><div>Paid via :&nbsp; Bank BRI</div><div><br></div><div>Transaction Number : C2ZB5MNVFJWX</div><div><br></div><div><b>Booking Information :<br></b></div><div><br></div><div>Date of Journey : 02 10, 2024</div><div>Seats: 1-A1,1-B1</div><div>Total Seats : 2</div><div>Starting Point : Kota Brebes</div><div>Destination : Kota Yogyakarta</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', '2024-10-02 17:27:41', '2024-10-02 17:27:41');
INSERT INTO `email_logs` (`id`, `user_id`, `mail_sender`, `email_from`, `email_to`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(3, 1, 'php', 'PUSPA JAYA do-not-reply@viserlab.com', 'ifailamir@gmail.com', 'Payment Request Submitted Successfully', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello failamir abdullah (ifailamir)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>Your payment request of <b>1,500,000.00 IDR</b> is via&nbsp; <b>Bank BRI </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : 1,500,000.00 IDR</div><div>Charge: <font color=\"#FF0000\">17,500.00 IDR</font></div><div><br></div><div>Conversion Rate : 1 IDR = 16,000.00 IDR</div><div>Payable : 24,280,000,000.00 IDR <br></div><div>Pay via :&nbsp; Bank BRI</div><div><br></div><div>Transaction Number : HVO7DVN7R5BN</div><div><br></div><div><b>Pending Booking Information :<br></b></div><div><br></div><div>Date of Journey : 03 10, 2024</div><div>Seats: 1-A1,1-A2,2-A1</div><div>Total Seats : 3</div><div>Starting Point : Kota Brebes</div><div>Destination : Kota Yogyakarta</div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', '2024-10-03 15:29:50', '2024-10-03 15:29:50');

INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'PASS_RESET_CODE', 'Password Reset', 'Password Reset', '<div>We have received a request to reset the password for your account on <b>{{time}} .<br></b></div><div>Requested From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div><div><br></div><br><div><div><div>Your account recovery code is:&nbsp;&nbsp; <font size=\"6\"><b>{{code}}</b></font></div><div><br></div></div></div><div><br></div><div><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><br>', 'Your account recovery code is: {{code}}', ' {\"code\":\"Password Reset Code\",\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-25 06:04:05', '2021-01-06 07:49:06');
INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(2, 'PASS_RESET_DONE', 'Password Reset Confirmation', 'You have Reset your password', '<div><p>\r\n    You have successfully reset your password.</p><p>You changed from&nbsp; IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}}&nbsp;</b> on <b>{{time}}</b></p><p><b><br></b></p><p><font color=\"#FF0000\"><b>If you did not changed that, Please contact with us as soon as possible.</b></font><br></p></div>', 'Your password has been changed successfully', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-25 06:04:05', '2020-03-07 17:23:47');
INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(3, 'EVER_CODE', 'Email Verification', 'Please verify your email address', '<div><br></div><div>Thanks For join with us. <br></div><div>Please use below code to verify your email address.<br></div><div><br></div><div>Your email verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', 'Your email verification code is: {{code}}', '{\"code\":\"Verification code\"}', 1, 1, '2019-09-25 06:04:05', '2021-01-04 06:35:10');
INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(4, 'SVER_CODE', 'SMS Verification ', 'Please verify your phone', 'Your phone verification code is: {{code}}', 'Your phone verification code is: {{code}}', '{\"code\":\"Verification code\"}', 0, 1, '2019-09-25 06:04:05', '2020-03-08 08:28:52'),
(16, 'ADMIN_SUPPORT_REPLY', 'Support Ticket Reply ', 'Reply Support Ticket', '<div><p><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong>A member from our support team has replied to the following ticket:</strong></span></p><p><b><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong><br></strong></span></b></p><p><b>[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</b></p><p>----------------------------------------------</p><p>Here is the reply : <br></p><p> {{reply}}<br></p></div><div><br></div>', '{{subject}}\r\n\r\n{{reply}}\r\n\r\n\r\nClick here to reply:  {{link}}', '{\"ticket_id\":\"Support Ticket ID\", \"ticket_subject\":\"Subject Of Support Ticket\", \"reply\":\"Reply from Staff/Admin\",\"link\":\"Ticket URL For relpy\"}', 1, 1, '2020-06-09 01:00:00', '2020-05-04 09:24:40'),
(217, 'PAYMENT_COMPLETE', 'Automated Payment - Successful', 'Payment Completed Successfully', '<div>Your payment of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Payment :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><b>Booking Information :<br></b></div><div><br></div><div>Date of Journey : {{journey_date}}</div><div>Seats: {{seats}}</div><div>Total Seats : {{total_seats}}</div><div>Starting Point : {{source}}</div><div>Destination : {{destination}}</div>', '{{amount}} {{currrency}} Payment successful by {{gateway_name}} .\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"journey_date\":\"journey date\",\"seats\":\"Seat Number\", \"total_seats\":\"Total Seats\",\"source\":\"Starting point\",\"destination\":\"Destination point\"\r\n}', 1, 1, '2020-06-25 01:00:00', '2020-11-17 10:10:00'),
(218, 'PAYMENT_REQUEST', 'Manual Payment - User Requested', 'Payment Request Submitted Successfully', '<div>Your payment request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><b>Pending Booking Information :<br></b></div><div><br></div><div>Date of Journey : {{journey_date}}</div><div>Seats: {{seats}}</div><div>Total Seats : {{total_seats}}</div><div>Starting Point : {{source}}</div><div>Destination : {{destination}}</div>', '{{amount}} Payment requested by {{method}}. Charge: {{charge}} . Trx: {{trx}} .\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}\r\n', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"journey_date\":\"journey date\",\"seats\":\"Seat Number\", \"total_seats\":\"Total Seats\",\"source\":\"Starting point\",\"destination\":\"Destination point\"}', 1, 1, '2020-06-01 01:00:00', '2020-06-02 01:00:00'),
(219, 'PAYMENT_APPROVE', 'Manual Payment - Admin Approved', 'Your payment is Approved', '<div>Your payment request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your payment :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><b>Booking Information :<br></b></div><div><br></div><div>Date of Journey : {{journey_date}}</div><div>Seats: {{seats}}</div><div>Total Seats : {{total_seats}}</div><div>Starting Point : {{source}}</div><div>Destination : {{destination}}</div>', 'Admin Approve Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}} transaction : {{transaction}}.\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"journey_date\":\"journey date\",\"seats\":\"Seat Number\", \"total_seats\":\"Total Seats\",\"source\":\"Starting point\",\"destination\":\"Destination point\"}', 1, 1, '2020-06-17 01:00:00', '2020-06-15 01:00:00'),
(220, 'PAYMENT_REJECT', 'Manual Deposit - Admin Rejected', 'Your Payment Request is Rejected', '<div>Your payment request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} has been rejected</b>.<b><br></b></div><br><div>Transaction Number was : {{trx}}</div><div><br></div><div><b>Rejected Booking Information :<br></b></div><div><br></div><div>Date of Journey : {{journey_date}}</div><div>Seats: {{seats}}</div><div>Total Seats : {{total_seats}}</div><div>Starting Point : {{source}}</div><div>Destination : {{destination}}</div><div><br></div><div>if you have any query, feel free to contact us.<br></div><br><div><br><br></div>\r\n\r\n\r\n\r\n{{rejection_message}}', 'Admin Rejected Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}}.\r\nJourney Date: {{journey_date}} , Seats: {{seats}}, Starting point: {{source}}, Dropping point: {{destination}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"rejection_message\":\"Rejection message\",\"journey_date\":\"journey date\",\"seats\":\"Seat Number\", \"total_seats\":\"Total Seats\",\"source\":\"Starting point\",\"destination\":\"Destination point\"}', 1, 1, '2020-06-10 01:00:00', '2020-06-15 01:00:00');

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, NULL, '2019-10-19 06:16:05', '2022-02-19 13:16:49');
INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\r\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\r\n<div class=\"g-recaptcha\" data-sitekey=\"{{sitekey}}\" data-callback=\"verifyCaptcha\"></div>\r\n<div id=\"g-recaptcha-error\"></div>', '{\"sitekey\":{\"title\":\"Site Key\",\"value\":\"6Lfpm3cUAAAAAGIjbEJKhJNKS4X1Gns9ANjh8MfH\"}}', 'recaptcha.png', 0, NULL, '2019-10-19 06:16:05', '2022-02-19 13:19:29');
INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'custom-captcha', 'Custom Captcha', 'Just Put Any Random String', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, NULL, '2019-10-19 06:16:05', '2022-02-19 13:16:30');
INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, NULL, '2021-05-04 17:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, NULL, '2022-02-19 13:19:25');

INSERT INTO `fleet_types` (`id`, `name`, `seat_layout`, `deck`, `deck_seats`, `facilities`, `has_ac`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Jaka Tingkir', '2 x 2', 2, '[\"5\",\"5\"]', '[\"Soft Drinks\",\"Water Bottle\",\"Pillow\",\"Wifi\"]', 0, 1, '2024-10-02 09:42:17', '2024-10-02 09:42:17');
INSERT INTO `fleet_types` (`id`, `name`, `seat_layout`, `deck`, `deck_seats`, `facilities`, `has_ac`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Jaka Tarub', '2 x 3', 2, '[\"8\",\"8\"]', '[\"Soft Drinks\",\"Water Bottle\",\"Pillow\",\"Wifi\"]', 0, 1, '2024-10-02 09:42:33', '2024-10-02 09:42:33');


INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"ViserBus\",\"bus booking system\",\"bus booking php script\",\"single vendro bus booking system\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"ViserBus - Bus Ticket Booking System\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"6210e34d4726e1645273933.png\"}', '2020-07-05 06:42:52', '2022-02-19 13:32:13');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Know Few Words About Autobus\",\"short_description\":\"<div class=\\\"section-header\\\" style=\\\"margin-bottom:20px;color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;font-size:18px;color:rgb(66,66,72);\\\">Lorem Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nulla sit reprehenderit non voluptas quam quod facilis, doloribus impedit magni. Numquam ipsum placeat ullam alias temporibus non quas aperiam odio pariatur.<\\/p><\\/div><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eos eveniet inventore blanditiis maxime doloremque minima. Quisquam, ex! Architecto laudantium culpa cupiditate hic facere est magni, possimus repudiandae, rerum eius omnis.lore Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque excepturi sed possimus recusandae temporibus tempore, aspernatur, autem sequi natus iste fugit. Eaque vero temporibus illum quis beatae quam officia ad.ri sed possimus recusandae temporibus tempore, aspernatur, autem sequi natus iste fugit. Eaque vero temporibus sed possimus recusandae temporibus tempore, aspernatur, autem sequi natus iste fugit. Eaque vero temporibus illum quis beatae quam officia ad.<\\/p>\",\"title\":\"About Us\",\"description\":\"<div class=\\\"item\\\" style=\\\"margin-bottom:30px;color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-bottom:10px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis vel temporibus voluptatum quidem, blanditiis libero assumenda beatae ducimus placeat odio aperiam tenetur animi, reiciendis reprehenderit expedita nostrum a eum. Quod. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum ipsum necessitatibus eum non quisquam! Quo esse est minima vero dolores eveniet voluptatibus nam. Veniam ad quae illum tenetur voluptates veritatis?<\\/p><p style=\\\"margin-right:0px;margin-bottom:10px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis vel temporibus voluptatum quidem, blanditiis libero assumenda beatae ducimus placeat odio aperiam tenetur animi, reiciendis reprehenderit expedita nostrum a eum. Quod. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum ipsum necessitatibus eum non quisquam! Quo esse est minima vero dolores eveniet voluptatibus nam. Veniam ad quae illum tenetur voluptates veritatis?<\\/p><\\/div><div class=\\\"item\\\" style=\\\"margin-bottom:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><h4 class=\\\"title\\\" style=\\\"margin-bottom:10px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Why Make Bus Reservations With AutoBus<\\/h4><p style=\\\"margin-right:0px;margin-bottom:10px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis vel temporibus voluptatum quidem, blanditiis libero assumenda beatae ducimus placeat odio aperiam tenetur animi, reiciendis reprehenderit expedita nostrum a eum. Quod. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum ipsum necessitatibus eum non quisquam! Quo esse est minima vero dolores eveniet voluptatibus nam. Veniam ad quae illum tenetur voluptates veritatis?<\\/p><ul class=\\\"info\\\" style=\\\"margin-top:15px;margin-bottom:-7px;margin-left:15px;\\\"><li style=\\\"list-style:disc;padding:3px 0px;\\\">Free Cancellation<\\/li><li style=\\\"list-style:disc;padding:3px 0px;\\\">Instant Refunds<\\/li><li style=\\\"list-style:disc;padding:3px 0px;\\\">Easy &amp; Quick Bus Booking<\\/li><li style=\\\"list-style:disc;padding:3px 0px;\\\">Exciting Cashback &amp; Bus Offers<\\/li><li style=\\\"list-style:disc;padding:3px 0px;\\\">Best Price Assured<\\/li><li style=\\\"list-style:disc;padding:3px 0px;\\\">24\\/7 Customer Assistance<\\/li><\\/ul><\\/div><h2 class=\\\"title\\\" style=\\\"margin-top:-10px;margin-bottom:15px;font-weight:600;line-height:1.2;font-size:36px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h2>\",\"image\":\"61f24107cbedc1643266311.jpg\"}', '2020-10-28 07:51:20', '2022-01-27 13:21:52');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(25, 'blog.content', '{\"heading\":\"Recent Blog Post\",\"sub_heading\":\"Have a look at our popular reason. why you should choose you bus. Just choose a Bus and get a ticket for your great journey. !\"}', '2020-10-28 07:51:34', '2022-01-26 18:59:36');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(39, 'banner.content', '{\"heading\":\"Get Your Ticket Online, Easy and Safely\",\"link_title\":\"Get ticket now\",\"link\":\"tickets\",\"has_image\":\"1\",\"background_image\":\"61f118f07f1151643190512.png\",\"animation_image\":\"6209144de6ed01644762189.png\"}', '2021-05-02 13:09:30', '2022-02-20 03:05:54'),
(41, 'cookie.data', '{\"link\":\"#\",\"description\":\"<font face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size: 18px;\\\">We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.<\\/span><\\/font><br>\",\"status\":1}', '2020-07-05 06:42:52', '2021-06-06 16:43:37'),
(44, 'how_it_works.content', '{\"heading\":\"Get Your Tickets With Just 3 Steps\",\"sub_heading\":\"Have a look at our popular reason. why you should choose you bus. Just a Bus and get a ticket for your great journey. !\"}', '2022-01-26 16:40:32', '2022-01-26 16:40:32'),
(45, 'how_it_works.element', '{\"heading\":\"Search Your Bus\",\"sub_heading\":\"Choose your origin, destination,Just choose a Bus journey dates and search for buses\",\"icon\":\"<i class=\\\"las la-search\\\"><\\/i>\"}', '2022-01-26 16:41:18', '2022-01-26 16:41:18'),
(46, 'how_it_works.element', '{\"heading\":\"Choose The Ticket\",\"sub_heading\":\"Choose your origin, destination,Just a Bus for your great journey dates and search for buses\",\"icon\":\"<i class=\\\"las la-ticket-alt\\\"><\\/i>\"}', '2022-01-26 16:42:06', '2022-01-26 16:42:06'),
(47, 'how_it_works.element', '{\"heading\":\"Pay Bill\",\"sub_heading\":\"Choose your origin, destination,choose a Bus for your great journey dates and search for buses\",\"icon\":\"<i class=\\\"las la-money-bill-wave-alt\\\"><\\/i>\"}', '2022-01-26 16:42:57', '2022-01-26 16:42:57'),
(49, 'amenities.content', '{\"heading\":\"Our Amenities\",\"sub_heading\":\"Have a look at our popular reason. why you should choose you bus.Just choose a Bus and get a ticket for your great journey!\"}', '2022-01-26 17:40:00', '2022-01-26 17:40:00'),
(51, 'faq.content', '{\"heading\":\"Frequently Asked Questions\",\"sub_heading\":\"Nobis minus earum perferendis nemo cupiditate optio, rem neque incidunt quia laborum ut praesentium corporis quam exercitationem, atque illo aut excepturi cum.\"}', '2022-01-26 17:48:26', '2022-01-26 17:48:26'),
(52, 'faq.element', '{\"question\":\"Can we choose corporation buses from anywhere?\",\"answer\":\"Orangu ipsum dolor sit amet consectetur adipisicing elit. Sed minima porro aliquid eius laudantium ad quod a corrupti impedit, reiciendis iusto ut aperiam tenetur fuga repellendus tempore necessitatibus omnis libero?\"}', '2022-01-26 17:49:06', '2022-02-16 06:52:26'),
(53, 'faq.element', '{\"question\":\"Can we choose corporation buses from anywhere?\",\"answer\":\"Orangu ipsum dolor sit amet consectetur adipisicing elit. Sed minima porro aliquid eius laudantium ad quod a corrupti impedit, reiciendis iusto ut aperiam tenetur fuga repellendus tempore necessitatibus omnis libero?\"}', '2022-01-26 17:49:32', '2022-02-16 06:52:32'),
(54, 'faq.element', '{\"question\":\"Can we choose corporation buses from anywhere?\",\"answer\":\"Orangu ipsum dolor sit amet consectetur adipisicing elit. Sed minima porro aliquid eius laudantium ad quod a corrupti impedit, reiciendis iusto ut aperiam tenetur fuga repellendus tempore necessitatibus omnis libero?\"}', '2022-01-26 17:49:44', '2022-02-16 06:52:37'),
(55, 'testimonials.content', '{\"heading\":\"Our Testimonials\",\"sub_heading\":\"Have a look at our popular reason. why you should choose you bus. Just choose a Bus and get a ticket for your great journey!\"}', '2022-01-26 18:37:13', '2022-01-26 18:37:13'),
(56, 'testimonials.element', '{\"has_image\":\"1\",\"person\":\"Anis Safitri\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam iusto mollitia facere accusantium deleniti odit eius, amet doloribus fugit delectus doloremque! In, corrupti? Est, autem suscipit voluptatem rerum deserunt laudantium.\",\"image\":\"61f13ac0c23181643199168.jpg\"}', '2022-01-26 18:42:48', '2024-10-03 15:26:08'),
(57, 'testimonials.element', '{\"has_image\":\"1\",\"person\":\"Kelsi Anatasari\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam iusto mollitia facere accusantium deleniti odit eius, amet doloribus fugit delectus doloremque! In, corrupti? Est, autem suscipit voluptatem rerum deserunt laudantium.\",\"image\":\"61f13ad31ec4d1643199187.jpg\"}', '2022-01-26 18:43:07', '2024-10-03 15:26:21'),
(58, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"What to do if your bus get demaged?\",\"short_description\":\"Expedita reprehenderit assumenda cum, id accusamus ad obcaecati fugit volupta Dolore?\",\"description\":\"<h4 class=\\\"title\\\" style=\\\"margin-bottom:25px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><span style=\\\"color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\">In most legal cases there are one or more accusers and one or more defendants. A legal case is typically based on either civil or criminal law. In most legal cases there are one or mor<\\/span><br \\/><\\/h4><p class=\\\"blog-details-pera\\\" style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">A consectetur adipisicing elit. Debitis quidem, architecto nulla tempore modi, aliquam sunt corporis beatae ipsam quia sed quae odit adipisci tempora repellendus explicabo voluptate labore minus?<\\/p><p class=\\\"blog-details-pera\\\" style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">A consectetur adipisicing elit. Debitis quidem, architecto nulla tempore modi, aliquam sunt corporis beatae ipsam quia sed quae odit adipisci tempora repellendus explicabo voluptate labore minus?<\\/p><p class=\\\"blog-details-pera\\\" style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">A consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Error ipsa incidunt dolores est doloremque quae numquam consequuntur, rerum, earum ipsam ad aperiam, pariatur soluta accusantium nesciunt aliquid voluptatem temporibus magnam.lorem Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis magnam, provident atque et est perferendis eum rem voluptas reprehenderit, sed dolor eaque itaque dicta nam fugit. Molestiae alias consequatur nostrum? Debitis quidem, architecto nulla tempore modi, aliquam sunt corporis beatae ipsam quia sed quae odit adipisci tempora repellendus explicabo voluptate labore minus?<\\/p><ul class=\\\"info\\\" style=\\\"margin-top:-7px;margin-bottom:-7px;color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><li style=\\\"list-style:none;padding:7px 0px 7px 20px;\\\">Some people do not understand why you should have to<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 20px;\\\">tempora repellendus explicabo voluptate labore minus?<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 20px;\\\">A consectetur adipisicing elit. Debitis quidem,<\\/li><\\/ul>\",\"image\":\"6209ffc45a6221644822468.jpg\"}', '2022-01-26 19:02:40', '2022-02-14 13:37:48'),
(59, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"A consectetur adipisicing elit.\",\"short_description\":\"A consectetur adipisicing elit. Debitis quidem, architecto nulla tempore modi,\",\"description\":\"<h4 class=\\\"title\\\" style=\\\"margin-bottom:25px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><span style=\\\"color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\">In most legal cases there are one or more accusers and one or more defendants. A legal case is typically based on either civil or criminal law. In most legal cases there are one or mor<\\/span><br \\/><\\/h4><p class=\\\"blog-details-pera\\\" style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">A consectetur adipisicing elit. Debitis quidem, architecto nulla tempore modi, aliquam sunt corporis beatae ipsam quia sed quae odit adipisci tempora repellendus explicabo voluptate labore minus?<\\/p><p class=\\\"blog-details-pera\\\" style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">A consectetur adipisicing elit. Debitis quidem, architecto nulla tempore modi, aliquam sunt corporis beatae ipsam quia sed quae odit adipisci tempora repellendus explicabo voluptate labore minus?<\\/p><p class=\\\"blog-details-pera\\\" style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">A consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Error ipsa incidunt dolores est doloremque quae numquam consequuntur, rerum, earum ipsam ad aperiam, pariatur soluta accusantium nesciunt aliquid voluptatem temporibus magnam.lorem Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis magnam, provident atque et est perferendis eum rem voluptas reprehenderit, sed dolor eaque itaque dicta nam fugit. Molestiae alias consequatur nostrum? Debitis quidem, architecto nulla tempore modi, aliquam sunt corporis beatae ipsam quia sed quae odit adipisci tempora repellendus explicabo voluptate labore minus?<\\/p><ul class=\\\"info\\\" style=\\\"margin-top:-7px;margin-bottom:-7px;color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><li style=\\\"list-style:none;padding:7px 0px 7px 20px;\\\">Some people do not understand why you should have to<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 20px;\\\">tempora repellendus explicabo voluptate labore minus?<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 20px;\\\">A consectetur adipisicing elit. Debitis quidem,<\\/li><\\/ul>\",\"image\":\"61f13fac601d21643200428.jpg\"}', '2022-01-26 19:03:48', '2022-01-26 20:55:38'),
(60, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"A wonderful bus journy.\",\"short_description\":\"A consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.\",\"description\":\"<p class=\\\"blog-details-pera\\\" style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">In most legal cases there are one or more accusers and one or more defendants. A legal case is typically based on either civil or criminal law. In most legal cases there are one or mor<\\/p><p class=\\\"blog-details-pera\\\" style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">A consectetur adipisicing elit. Debitis quidem, architecto nulla tempore modi, aliquam sunt corporis beatae ipsam quia sed quae odit adipisci tempora repellendus explicabo voluptate labore minus?<\\/p><p class=\\\"blog-details-pera\\\" style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">A consectetur adipisicing elit. Debitis quidem, architecto nulla tempore modi, aliquam sunt corporis beatae ipsam quia sed quae odit adipisci tempora repellendus explicabo voluptate labore minus?<\\/p><p class=\\\"blog-details-pera\\\" style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;padding:0px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;\\\">A consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Error ipsa incidunt dolores est doloremque quae numquam consequuntur, rerum, earum ipsam ad aperiam, pariatur soluta accusantium nesciunt aliquid voluptatem temporibus magnam.lorem Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis magnam, provident atque et est perferendis eum rem voluptas reprehenderit, sed dolor eaque itaque dicta nam fugit. Molestiae alias consequatur nostrum? Debitis quidem, architecto nulla tempore modi, aliquam sunt corporis beatae ipsam quia sed quae odit adipisci tempora repellendus explicabo voluptate labore minus?<\\/p><ul class=\\\"info\\\" style=\\\"margin-top:-7px;margin-bottom:-7px;color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><li style=\\\"list-style:none;padding:7px 0px 7px 20px;\\\">Some people do not understand why you should have to<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 20px;\\\">tempora repellendus explicabo voluptate labore minus?<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 20px;\\\">A consectetur adipisicing elit. Debitis quidem,<\\/li><\\/ul><div class=\\\"quote-wrapper\\\" style=\\\"margin-top:20px;margin-bottom:20px;padding:25px 20px;background:rgba(27,39,61,0.03);color:rgb(119,119,119);font-family:Lato, sans-serif;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px 0px 0px 10px;border-left:2px solid rgb(14,158,77);\\\"><span class=\\\"las la-quote-left\\\" style=\\\"font-size:46px;color:rgb(14,158,77);\\\"><\\/span>\\u00a0Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto veritatis quos aspernatur facere officiis. Odit, maiores voluptatum alias eaque exercitationem perspiciatis beatae soluta explicabo! Doloribus a saepe molestiae, minima unde consectetur ipsum non possimus quo corrupti id illum earum architecto veniam? Magni labore nesciunt<\\/p><\\/div>\",\"image\":\"61f14071d54b41643200625.jpg\"}', '2022-01-26 19:06:01', '2022-01-26 20:54:08'),
(61, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"61f14e10b48871643204112.jpg\"}', '2022-01-26 20:05:12', '2022-01-26 20:05:13'),
(62, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Why buy tickets from us?\",\"short_description\":\"Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled\",\"description\":\"<h2 style=\\\"margin-bottom:10px;padding:0px;font-family:DauphinPlain;font-size:24px;line-height:24px;color:rgb(0,0,0);\\\"><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/span><br \\/><\\/h2><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<\\/p>\",\"image\":\"61f1593cab1941643206972.jpg\"}', '2022-01-26 20:52:52', '2022-01-26 20:55:51'),
(63, 'contact.content', '{\"title\":\"Let\'s get in touch\",\"short_details\":\"We are open for any suggestion or just to have a chat\",\"address\":\"Jl. Randu, Sanggrahan, Condongcatur, Kec. Depok\",\"contact_number\":\"083148263597\",\"email\":\"ifailamir@gmail.com\",\"latitude\":\"-7.756354953161959\",\"longitude\":\"110.37042870509853\",\"form_title\":\"Have any Questions?\"}', '2022-01-27 12:45:27', '2024-10-03 15:33:14'),
(64, 'social_links.element', '{\"name\":\"Facebook\",\"icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2022-01-27 13:38:49', '2022-02-20 05:36:56'),
(65, 'social_links.element', '{\"name\":\"Twitter\",\"icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\\/?lang=en\"}', '2022-01-27 13:40:02', '2022-02-20 05:37:16'),
(66, 'social_links.element', '{\"name\":\"Vimeo\",\"icon\":\"<i class=\\\"lab la-vimeo\\\"><\\/i>\",\"url\":\"https:\\/\\/vimeo.com\\/log_in\"}', '2022-01-27 13:40:35', '2022-02-20 05:37:33'),
(67, 'social_links.element', '{\"name\":\"Instagram\",\"icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/?hl=en\"}', '2022-01-27 13:41:01', '2022-02-20 05:37:47'),
(68, 'footer.content', '{\"short_description\":\"Delectus culpa laboriosam debitis saepe. Commodi earum minus ut obcaecati veniam deserunt est!\"}', '2022-01-27 13:44:26', '2022-01-27 13:44:26'),
(69, 'policies.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h4 class=\\\"title\\\" style=\\\"margin:0px 0px 15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Overview<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><\\/div><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Data Collection &amp; Use<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><ul class=\\\"info-list\\\" style=\\\"margin-top:15px;margin-bottom:-7px;\\\"><li style=\\\"list-style:none;padding:7px 0px 7px 25px;\\\">There are many variations of passages of Lorem available, but the majority<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 25px;\\\">Finibus onorum et alorum\\\" by icero classical lite rature, discovered<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 25px;\\\">There are many variations of passages of Lorem available, but the majority<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 25px;\\\">There are many variations of passages of Lorem available, but the majority<\\/li><\\/ul><\\/div><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Cookies Data<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><\\/div><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Data Collection &amp; Use<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><\\/div><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Data Cookies<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><\\/div><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Data Storage<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">Pconsectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><\\/div>\"}', '2022-01-27 14:01:56', '2022-01-27 15:07:48'),
(71, 'policies.element', '{\"title\":\"Terms and Conditions\",\"details\":\"<h4 class=\\\"title\\\" style=\\\"margin:0px 0px 15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Overview<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><\\/div><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Data Collection &amp; Use<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><ul class=\\\"info-list\\\" style=\\\"margin-top:15px;margin-bottom:-7px;\\\"><li style=\\\"list-style:none;padding:7px 0px 7px 25px;\\\">There are many variations of passages of Lorem available, but the majority<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 25px;\\\">Finibus onorum et alorum\\\" by icero classical lite rature, discovered<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 25px;\\\">There are many variations of passages of Lorem available, but the majority<\\/li><li style=\\\"list-style:none;padding:7px 0px 7px 25px;\\\">There are many variations of passages of Lorem available, but the majority<\\/li><\\/ul><\\/div><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Cookies Data<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><\\/div><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Data Collection &amp; Use<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><\\/div><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Data Cookies<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><\\/div><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\">Data Storage<\\/h4><h4 class=\\\"title\\\" style=\\\"margin-bottom:15px;font-weight:600;line-height:1.2;font-size:24px;color:rgb(66,66,72);font-family:Georama, sans-serif;\\\"><\\/h4><div class=\\\"content-item\\\" style=\\\"margin-bottom:40px;color:rgb(119,119,119);font-family:Lato, sans-serif;font-size:16px;font-weight:400;\\\"><p style=\\\"margin-right:0px;margin-left:0px;padding:0px;\\\">Pconsectetur adipisicing elit. Assumenda officia vel omnis, odit quidem, expedita nam deserunt molestiae accusamus voluptas aut. Sapiente voluptatem nulla unde quia harum illum ipsum dolore! Lorem ipsum dolor sit amet consectetur adipisicing elit. In dolorem illum molestiae corrupti, maxime sint velit quibusdam officiis ipsam a minima quos voluptates possimus eaque, vitae, veniam consequuntur! Dolorem, architecto.<\\/p><\\/div>\"}', '2022-01-27 14:02:26', '2022-02-14 18:53:53'),
(74, 'sign_in.content', '{\"heading\":\"Welcome to Bus Booking\",\"sub_heading\":\"Sign In your Account\",\"has_image\":\"1\",\"background_image\":\"61f2810a7e4171643282698.jpg\"}', '2022-01-27 17:54:58', '2022-01-27 17:54:58'),
(75, 'sign_up.content', '{\"heading\":\"Welcome to Bus Booking\",\"sub_heading\":\"Sign Up your Account\",\"has_image\":\"1\",\"background_image\":\"61f281283d54b1643282728.jpg\"}', '2022-01-27 17:55:28', '2022-01-27 17:55:28'),
(77, 'cookie_policy.content', '{\"title\":\"Cookie Policy\",\"details\":\"<h3 style=\\\"margin-top:15px;margin-bottom:15px;padding:0px;font-weight:700;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;\\\">The standard Lorem Ipsum passage, used since the 1500s<\\/h3><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;padding:0px;font-weight:700;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;\\\">Section 1.10.32 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC<\\/h3><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">\\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\\"<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;padding:0px;font-weight:700;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;\\\">1914 translation by H. Rackham<\\/h3><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">\\\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\\\"<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;padding:0px;font-weight:700;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;\\\">Section 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC<\\/h3><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">\\\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\\\"<\\/p><h3 style=\\\"margin-top:15px;margin-bottom:15px;padding:0px;font-weight:700;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;\\\">1914 translation by H. Rackham<\\/h3><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">\\\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\\\"<\\/p>\"}', '2022-01-30 20:27:14', '2022-01-30 20:27:14'),
(78, 'amenities.element', '{\"title\":\"Wifi\",\"icon\":\"<i class=\\\"las la-wifi\\\"><\\/i>\"}', '2022-02-10 07:07:40', '2022-02-10 07:07:40'),
(79, 'amenities.element', '{\"title\":\"Pillow\",\"icon\":\"<i class=\\\"las la-bed\\\"><\\/i>\"}', '2022-02-10 07:11:36', '2022-02-10 07:11:36'),
(80, 'amenities.element', '{\"title\":\"Water Bottle\",\"icon\":\"<i class=\\\"las la-prescription-bottle\\\"><\\/i>\"}', '2022-02-10 07:12:02', '2022-02-10 07:12:02'),
(81, 'amenities.element', '{\"title\":\"Soft Drinks\",\"icon\":\"<i class=\\\"fas fa-wine-glass-alt\\\"><\\/i>\"}', '2022-02-10 07:12:34', '2022-02-10 07:12:34'),
(83, 'forgot_password.content', '{\"has_image\":\"1\",\"heading\":\"Reset Password\",\"background_image\":\"620cde2ad884c1645010474.jpg\"}', '2022-02-17 05:51:14', '2022-02-17 05:51:15'),
(84, 'verify_code.content', '{\"has_image\":\"1\",\"heading\":\"Account Recovery\",\"background_image\":\"620ce00893ccf1645010952.jpg\"}', '2022-02-17 05:59:12', '2022-02-17 05:59:12'),
(85, 'reset_password.content', '{\"has_image\":\"1\",\"heading\":\"Reset Password page\",\"background_image\":\"620ce06fce3161645011055.jpg\"}', '2022-02-17 06:00:55', '2022-02-17 06:00:56'),
(86, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Where can I get some?\",\"description\":\"<span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.<\\/span><br \\/>\",\"image\":\"62108d39a938f1645251897.jpg\"}', '2022-02-20 00:54:57', '2022-02-20 00:54:58'),
(87, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Why do we use it?\",\"description\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<\\/p>\",\"image\":\"62108d54284f11645251924.jpg\"}', '2022-02-20 00:55:24', '2022-02-20 00:55:24'),
(88, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Lorem Ipsum is simply dummy\",\"description\":\"<strong style=\\\"margin:0px;padding:0px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/span><br \\/>\",\"image\":\"62108d71dc2dc1645251953.jpg\"}', '2022-02-20 00:55:53', '2022-02-20 00:55:54'),
(89, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The standard Lorem Ipsum passage, used since the 1500s\",\"description\":\"<h3 style=\\\"margin-top:15px;margin-bottom:15px;padding:0px;font-weight:700;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;\\\"><span style=\\\"color:rgb(0,0,0);font-weight:400;text-align:justify;\\\">\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"<\\/span><br \\/><\\/h3><h3 style=\\\"margin-top:15px;margin-bottom:15px;padding:0px;font-weight:700;font-size:14px;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;\\\">Section 1.10.32 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC<\\/h3><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">\\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\\"<\\/p>\",\"image\":\"6210e4b6d132d1645274294.jpg\"}', '2022-02-20 00:56:27', '2022-02-19 13:38:15'),
(90, 'policies.element', '{\"title\":\"Ticket Policies\",\"details\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sem eros, luctus at sem id, commodo maximus mi. In finibus ac mi vitae gravida. Cras hendrerit sit amet quam vel vehicula. Sed id malesuada ante. Etiam vel diam ligula. Nam malesuada nisi sit amet tempor ultricies. Pellentesque felis sapien, fermentum nec tortor nec, consectetur scelerisque risus. Maecenas et mauris odio. Etiam finibus ex vel laoreet semper. Phasellus eget mauris a elit lacinia condimentum. Sed vitae consectetur nibh.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">Donec id dui in nibh pellentesque congue. Cras sit amet dictum nisi, a cursus dui. Pellentesque ac hendrerit lacus. Integer faucibus velit et mauris porta, sit amet mollis turpis maximus. Mauris eu semper augue. Curabitur bibendum tellus nec pellentesque elementum. In imperdiet efficitur volutpat. Sed lobortis ultrices eros. Cras efficitur purus vel velit molestie, a blandit metus porta. Fusce nec diam lectus. In iaculis ante consequat dolor vehicula facilisis. Suspendisse gravida turpis vitae risus dignissim, id finibus lacus maximus. Aliquam urna orci, fermentum ac placerat quis, elementum ut dolor.<\\/p>\"}', '2022-02-20 02:53:30', '2022-02-20 02:53:30');

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(1, 'Bank BRI', 'IDR', '', 1000, 'bank_bri', '10000.00000000', '10000000.00000000', '1.00', '2500.00000000', '16000.00000000', '66fd1f192598f1727864601.png', '{\"jumlah_transfer\":{\"field_name\":\"jumlah_transfer\",\"field_level\":\"Jumlah Transfer\",\"type\":\"text\",\"validation\":\"required\"},\"bukti_bayar\":{\"field_name\":\"bukti_bayar\",\"field_level\":\"Bukti bayar\",\"type\":\"file\",\"validation\":\"required\"}}', '2024-10-02 17:23:21', '2024-10-02 17:24:25');
INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(3, 'Online Xendit', 'IDR', 'Rp', 109, 'Flutterwave', '10000.00000000', '10000000.00000000', '1.00', '1000.00000000', '1.00000000', '66fe69c91225e1727949257.png', '{\"public_key\":\"xnd_public_development_CQnNIn4zXHlJsQyS7AiXwDO2PNZuVNrp9sQkYcekTsOGC7NNrm5AeSetkvvHH2fO\",\"secret_key\":\"xnd_development_lhenR2EDSNWhKwhTIzw6kmEbZTcTlskQ5eg70mYY0p2NfcvzliuwUBd8O\",\"encryption_key\":\"------------------\"}', '2024-10-03 16:54:18', '2024-10-03 16:54:18');


INSERT INTO `gateways` (`id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(1, 101, 'Paypal', 'Paypal', '5f6f1bd8678601601117144.jpg', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 20:14:22', '2021-05-21 07:04:38');
INSERT INTO `gateways` (`id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(9, 109, 'Xendit', 'Flutterwave', '66fe54f6cd15a1727943926.png', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"xnd_public_development_CQnNIn4zXHlJsQyS7AiXwDO2PNZuVNrp9sQkYcekTsOGC7NNrm5AeSetkvvHH2fO\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"xnd_development_lhenR2EDSNWhKwhTIzw6kmEbZTcTlskQ5eg70mYY0p2NfcvzliuwUBd8O\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"IDR\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, NULL, '2019-09-14 20:14:22', '2024-10-03 15:49:23');
INSERT INTO `gateways` (`id`, `code`, `name`, `alias`, `image`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(37, 1000, 'Bank BRI', 'bank_bri', '66fd1f192598f1727864601.png', 1, '[]', '[]', 0, NULL, 'Transfer to BRI Account<br><br>012391029310239102<div>an Fail Amir</div>', '{\"jumlah_transfer\":{\"field_name\":\"jumlah_transfer\",\"field_level\":\"Jumlah Transfer\",\"type\":\"text\",\"validation\":\"required\"},\"bukti_bayar\":{\"field_name\":\"bukti_bayar\",\"field_level\":\"Bukti bayar\",\"type\":\"file\",\"validation\":\"required\"}}', '2024-10-02 17:23:21', '2024-10-02 17:24:25');

INSERT INTO `general_settings` (`id`, `sitename`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_api`, `base_color`, `mail_config`, `sms_config`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `secure_password`, `agree`, `registration`, `active_template`, `sys_version`, `created_at`, `updated_at`) VALUES
(1, 'PUSPA JAYA', 'IDR', 'Rp', 'do-not-reply@viserlab.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{name}}, {{message}}', '0E9E4D', '{\"name\":\"php\"}', '{\"clickatell_api_key\":\"----------------------------\",\"infobip_username\":\"--------------\",\"infobip_password\":\"----------------------\",\"message_bird_api_key\":\"-------------------\",\"nexmo_api_key\":\"----------------------\",\"nexmo_api_secret\":\"----------------------\",\"sms_broadcast_username\":\"----------------------\",\"sms_broadcast_password\":\"-----------------------------\",\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\",\"text_magic_username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\",\"name\":\"textMagic\"}', 0, 1, 0, 0, 0, 0, 1, 1, 'basic', NULL, NULL, '2024-10-02 09:57:39');


INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 1, '2020-07-06 10:47:55', '2024-10-03 14:47:41');
INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(10, 'Indonesia', 'id', NULL, 0, 0, '2024-10-03 14:39:18', '2024-10-03 14:47:41');


INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', 'home', 'templates.basic.', '[\"how_it_works\",\"amenities\",\"testimonials\",\"blog\"]', 1, '2020-07-11 13:23:58', '2022-02-20 05:35:26');
INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(4, 'Blog', 'blog', 'templates.basic.', NULL, 1, '2020-10-22 08:14:43', '2022-02-19 18:22:45');
INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(5, 'Contact', 'contact', 'templates.basic.', NULL, 1, '2020-10-22 08:14:53', '2020-10-22 08:14:53');
INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(12, 'About', 'about-us', 'templates.basic.', '[\"about\"]', 0, '2022-01-27 13:28:52', '2022-02-19 18:22:24'),
(13, 'FAQs', 'faq', 'templates.basic.', '[\"faq\"]', 0, '2022-02-20 05:35:49', '2022-02-20 05:35:56');



INSERT INTO `schedules` (`id`, `start_from`, `end_at`, `status`, `created_at`, `updated_at`) VALUES
(1, '00:00:00', '11:55:00', 1, '2024-10-02 09:53:39', '2024-10-02 09:53:52');


INSERT INTO `seat_layouts` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(1, '2 x 2', '2024-10-02 09:41:05', '2024-10-02 09:41:05');
INSERT INTO `seat_layouts` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(2, '2 x 3', '2024-10-02 09:41:12', '2024-10-02 09:41:12');
INSERT INTO `seat_layouts` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(3, '3 x 3', '2024-10-02 09:41:25', '2024-10-02 09:41:25');







INSERT INTO `ticket_price_by_stoppages` (`id`, `ticket_price_id`, `source_destination`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, '[\"1\",\"2\"]', 500000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30');
INSERT INTO `ticket_price_by_stoppages` (`id`, `ticket_price_id`, `source_destination`, `price`, `created_at`, `updated_at`) VALUES
(2, 1, '[\"1\",\"3\"]', 500000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30');
INSERT INTO `ticket_price_by_stoppages` (`id`, `ticket_price_id`, `source_destination`, `price`, `created_at`, `updated_at`) VALUES
(3, 1, '[\"1\",\"4\"]', 500000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30');
INSERT INTO `ticket_price_by_stoppages` (`id`, `ticket_price_id`, `source_destination`, `price`, `created_at`, `updated_at`) VALUES
(4, 1, '[\"1\",\"5\"]', 500000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(5, 1, '[\"1\",\"6\"]', 500000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(6, 1, '[\"1\",\"7\"]', 500000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(7, 1, '[\"1\",\"8\"]', 500000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(8, 1, '[\"1\",\"9\"]', 500000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(9, 1, '[\"2\",\"3\"]', 200000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(10, 1, '[\"2\",\"4\"]', 200000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(11, 1, '[\"2\",\"5\"]', 200000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(12, 1, '[\"2\",\"6\"]', 200000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(13, 1, '[\"2\",\"7\"]', 200000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(14, 1, '[\"2\",\"8\"]', 200000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(15, 1, '[\"2\",\"9\"]', 200000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(16, 1, '[\"3\",\"4\"]', 300000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(17, 1, '[\"3\",\"5\"]', 300000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(18, 1, '[\"3\",\"6\"]', 300000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(19, 1, '[\"3\",\"7\"]', 300000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(20, 1, '[\"3\",\"8\"]', 300000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(21, 1, '[\"3\",\"9\"]', 300000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(22, 1, '[\"4\",\"5\"]', 400000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(23, 1, '[\"4\",\"6\"]', 400000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(24, 1, '[\"4\",\"7\"]', 400000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(25, 1, '[\"4\",\"8\"]', 400000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(26, 1, '[\"4\",\"9\"]', 400000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(27, 1, '[\"5\",\"6\"]', 400000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(28, 1, '[\"5\",\"7\"]', 400000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(29, 1, '[\"5\",\"8\"]', 50000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(30, 1, '[\"5\",\"9\"]', 50000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(31, 1, '[\"6\",\"7\"]', 50000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(32, 1, '[\"6\",\"8\"]', 50000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(33, 1, '[\"6\",\"9\"]', 50000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(34, 1, '[\"7\",\"8\"]', 50000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(35, 1, '[\"7\",\"9\"]', 50000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30'),
(36, 1, '[\"8\",\"9\"]', 50000.00, '2024-10-02 09:56:30', '2024-10-02 09:56:30');

INSERT INTO `ticket_prices` (`id`, `fleet_type_id`, `vehicle_route_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '999999.99', '2024-10-02 09:56:30', '2024-10-02 09:56:30');


INSERT INTO `trips` (`id`, `title`, `fleet_type_id`, `vehicle_route_id`, `schedule_id`, `start_from`, `end_to`, `day_off`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Jaka Tingkir - Kota Brebes - Kota Yogyakarta', 1, 1, 1, 1, 9, '[\"5\"]', 1, '2024-10-02 16:58:28', '2024-10-02 16:58:28');


INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-10-02 17:20:35', '2024-10-02 17:20:35');
INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(2, 1, '::1', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-10-03 15:27:03', '2024-10-03 15:27:03');
INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(3, 1, '::1', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-10-05 00:09:41', '2024-10-05 00:09:41');
INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(4, 1, '::1', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-10-05 16:25:53', '2024-10-05 16:25:53');

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `password`, `address`, `status`, `ev`, `sv`, `ver_code`, `ver_code_send_at`, `tsc`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'failamir', 'abdullah', 'ifailamir', 'ifailamir@gmail.com', 'ID', '62083148263597', '$2y$10$/g7vjrMILwCPz3ucZezEpO5ubRidACLZC.IBfAlyelByhvFBYltjK', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Indonesia\",\"city\":\"\"}', 1, 1, 1, NULL, NULL, NULL, 'lrtxg6x75FJmirkD4cUpbcGCFIBU2FSMb8pn8eiMeQd9Kv94N8C1mjPAMymE', '2024-10-02 17:20:34', '2024-10-02 17:20:34');


INSERT INTO `vehicle_routes` (`id`, `name`, `start_from`, `end_to`, `stoppages`, `distance`, `time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'LAMPUNG - YOGYAKARTA', 1, 9, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"]', '5000', '30', 1, '2024-10-02 09:53:04', '2024-10-03 15:10:20');


INSERT INTO `vehicles` (`id`, `nick_name`, `fleet_type_id`, `register_no`, `engine_no`, `chasis_no`, `model_no`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Gajah Mada', 1, 'AB567G', 'ER-1231', '990', '1110', 1, '2024-10-02 09:51:22', '2024-10-02 17:00:17');
INSERT INTO `vehicles` (`id`, `nick_name`, `fleet_type_id`, `register_no`, `engine_no`, `chasis_no`, `model_no`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Brawijaya', 2, 'AB123G', 'ER-1230', '1001', '1130', 1, '2024-10-02 16:59:25', '2024-10-02 17:00:12');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;