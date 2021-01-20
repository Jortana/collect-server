/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.21 : Database - auto_collect
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`auto_collect` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `auto_collect`;

/*Table structure for table `all_user` */

DROP TABLE IF EXISTS `all_user`;

CREATE TABLE `all_user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `user_pwd` varchar(64) NOT NULL COMMENT '用户密码',
  `user_email` varchar(50) NOT NULL COMMENT '用户邮箱地址',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `all_user` */

insert  into `all_user`(`user_id`,`user_name`,`user_pwd`,`user_email`) values (1,'Test','123456','a@a.com');

/*Table structure for table `task_record` */

DROP TABLE IF EXISTS `task_record`;

CREATE TABLE `task_record` (
  `task_id` int NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `task_name` varchar(50) DEFAULT NULL COMMENT '任务名',
  `task_describe` text COMMENT '任务描述',
  `collector` int NOT NULL COMMENT '收集任务发起者ID',
  `start_time` int NOT NULL COMMENT '任务发起时间',
  `end_time` int NOT NULL COMMENT '任务结束时间',
  `excepted_number` int NOT NULL COMMENT '预期收集的数量',
  `file_address` varchar(50) NOT NULL COMMENT '存放文件地址（BASE/相对地址）',
  `completed_number` int NOT NULL DEFAULT '0' COMMENT '已完成人数',
  `completed_name` text NOT NULL COMMENT '已完成的人名（#分隔）',
  PRIMARY KEY (`task_id`),
  KEY `idx_user_id` (`collector`),
  KEY `idx_start_time` (`start_time`),
  KEY `idx_end_time` (`end_time`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`collector`) REFERENCES `all_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `task_record` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
