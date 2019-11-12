/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.11 : Database - garbage_manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`garbage_manage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `garbage_manage`;

/*Table structure for table `t_allot` */

DROP TABLE IF EXISTS `t_allot`;

CREATE TABLE `t_allot` (
  `a_aid` int(11) NOT NULL AUTO_INCREMENT,
  `c_carid` int(11) DEFAULT NULL,
  `a_time` datetime DEFAULT NULL,
  `a_depart` varchar(300) DEFAULT NULL,
  `a_destination` varchar(300) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  `remark` varchar(765) DEFAULT NULL,
  PRIMARY KEY (`a_aid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `t_allot` */

insert  into `t_allot`(`a_aid`,`c_carid`,`a_time`,`a_depart`,`a_destination`,`delflag`,`opt_id`,`remark`) values (3,1,'2019-10-31 11:02:16','西安','北京',0,1,'调出'),(4,2,'2019-10-31 14:18:12','西安','上海',0,1,'调出车辆'),(8,3,'2019-10-31 16:04:59','北京','西安',0,1,'调出'),(13,123,'2019-11-04 09:44:01','13','123',1,NULL,'123'),(14,61058,'2019-11-05 19:21:04','西安','北京',0,NULL,'车辆'),(15,603321,'2019-11-07 11:43:14','北京','西安',0,NULL,'调入1'),(18,678454,'2019-11-08 14:02:08','西安','山西',1,NULL,'调度');

/*Table structure for table `t_biddingdocument` */

DROP TABLE IF EXISTS `t_biddingdocument`;

CREATE TABLE `t_biddingdocument` (
  `bd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投标id',
  `projectTitle` varchar(200) DEFAULT NULL COMMENT '小区名称',
  `serialNumber` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `title` varchar(100) DEFAULT NULL COMMENT '招标编号',
  `sort` varchar(100) DEFAULT NULL COMMENT '合同名称',
  `bidingTime` date DEFAULT NULL COMMENT '招标时间',
  `bidingType` varchar(100) DEFAULT NULL COMMENT '招标类别',
  `creatime` date DEFAULT NULL COMMENT '中标时间',
  `state` int(1) DEFAULT NULL COMMENT '状态',
  `bidding` varchar(2) DEFAULT NULL COMMENT '是否中标0:未，1:中',
  `Remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `delflag` int(1) DEFAULT NULL COMMENT '删除标记（0:未删；1:已删）',
  `opt_id` int(11) DEFAULT NULL COMMENT '操作员ID',
  `optime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`bd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_biddingdocument` */

insert  into `t_biddingdocument`(`bd_id`,`projectTitle`,`serialNumber`,`title`,`sort`,`bidingTime`,`bidingType`,`creatime`,`state`,`bidding`,`Remark`,`delflag`,`opt_id`,`optime`) values (1,'阿斯达','安全翁群无','12314','阿打发','2019-10-30','驱蚊器额','2019-10-30',0,'是','分数131',1,1,'2019-10-30 18:22:27'),(4,'adasf','asdasd','adsd','asdasd','2019-10-03','asdasd','2019-12-14',0,'0','',1,0,'2019-10-30 20:03:37'),(5,'123','123','123','123','2019-11-01','123','2019-11-01',0,'0','123',1,0,'2019-11-01 16:02:00'),(6,'体育场','垃圾分类','12321','系统化管理','2019-11-01','投入资产','2019-11-02',0,'是','体育场',0,0,'2019-11-08 08:43:59');

/*Table structure for table `t_building` */

DROP TABLE IF EXISTS `t_building`;

CREATE TABLE `t_building` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '楼房ID',
  `cm_id` int(11) DEFAULT NULL,
  `b_unit` int(11) DEFAULT NULL COMMENT '所属单元',
  `b_floor` int(11) DEFAULT NULL COMMENT '楼房层数',
  `b_population` int(11) DEFAULT NULL COMMENT '楼房人口',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `delflag` int(1) DEFAULT NULL COMMENT '删除标记',
  `state` int(1) DEFAULT NULL COMMENT '状态',
  `optid` int(11) DEFAULT NULL COMMENT '操作员ID',
  `optime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `t_building` */

insert  into `t_building`(`b_id`,`cm_id`,`b_unit`,`b_floor`,`b_population`,`remark`,`delflag`,`state`,`optid`,`optime`) values (7,9,10,30,800,'10号楼',0,0,0,'2019-11-01 05:12:23'),(8,9,2,32,850,'2号楼',0,0,0,'2019-11-01 05:12:23'),(9,9,3,25,750,'3号楼',0,0,0,'2019-11-01 05:12:23'),(10,9,6,32,900,'6号楼',0,0,0,'2019-11-01 05:12:23'),(11,9,4,30,830,'4号楼',0,0,0,'2019-11-01 05:12:23'),(12,9,7,28,800,'7号楼',0,0,0,'2019-11-01 05:12:23'),(13,10,1,23,569,'',1,0,0,'2019-11-08 08:47:53'),(14,10,1,2,45,'',1,0,0,'2019-11-08 08:48:45');

/*Table structure for table `t_carinfo` */

DROP TABLE IF EXISTS `t_carinfo`;

CREATE TABLE `t_carinfo` (
  `c_carid` int(11) NOT NULL AUTO_INCREMENT,
  `c_number` int(11) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  `c_buytime` datetime DEFAULT NULL,
  `c_capacity` int(11) DEFAULT NULL,
  `c_state` int(11) DEFAULT NULL,
  `c_location` varchar(255) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  `remark` varchar(765) DEFAULT NULL,
  PRIMARY KEY (`c_carid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `t_carinfo` */

insert  into `t_carinfo`(`c_carid`,`c_number`,`d_id`,`c_buytime`,`c_capacity`,`c_state`,`c_location`,`delflag`,`opt_id`,`remark`) values (1,61058,1,'2019-10-31 10:59:41',400,0,'108.954172,34.240336',0,1,'车况良好'),(2,66233,NULL,'2019-10-31 11:01:10',200,0,'108.952577,34.242425',1,1,'车况良好'),(3,32349,NULL,'2019-10-31 16:06:20',600,0,'108.951724,34.241523',0,1,'车况良好'),(4,34532,4,'2019-11-01 14:04:28',800,0,'108.945606,34.244253',0,NULL,'11212121212121'),(5,22341123,3,'2019-11-05 22:11:55',800,2,'108.951935,34.240299',0,NULL,'调出'),(6,123419,32,'2019-11-05 22:38:02',1241,1,'108.955196,34.239486',1,NULL,'订单'),(7,123445,12,'2019-11-05 22:40:43',123,1,'108.951728,34.239538',0,NULL,'调出222'),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,2341,5,'2019-11-07 13:04:59',111123,3,'108.95198,34.238158',1,NULL,'2222'),(10,123,12,'2019-11-07 13:06:10',123,0,'108.952043,34.238322',1,NULL,'12312'),(11,123321,123,'2019-11-07 13:07:52',122,1,'108.954621,34.23862',1,NULL,'123213'),(12,1231,4,'2019-11-07 13:10:38',12313,1,'108.954801,34.238576',1,NULL,'124'),(13,657853,12,'2019-11-07 13:11:12',200,1,'108.951836,34.237442',0,NULL,''),(14,231,124,'2019-11-07 19:29:04',12412214,124,'108.955816,34.238561',1,NULL,'124'),(15,784556,33,'2019-11-08 14:00:34',800,0,'108.955331,34.238367',1,NULL,'新增车辆');

/*Table structure for table `t_collectorinfo` */

DROP TABLE IF EXISTS `t_collectorinfo`;

CREATE TABLE `t_collectorinfo` (
  `c_ucid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `c_uid` int(11) DEFAULT NULL,
  `c_rsid` int(11) DEFAULT NULL,
  `c_type` int(11) DEFAULT NULL,
  `optid` int(11) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `optime` datetime DEFAULT NULL,
  `remark` varchar(765) DEFAULT NULL,
  `coord` varchar(765) DEFAULT NULL,
  PRIMARY KEY (`c_ucid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_collectorinfo` */

insert  into `t_collectorinfo`(`c_ucid`,`user_id`,`state`,`c_uid`,`c_rsid`,`c_type`,`optid`,`delflag`,`optime`,`remark`,`coord`) values (1,1,1,NULL,9,1,1,0,'2019-11-06 04:39:51','0','108.951872,34.234293'),(2,1,1,1,9,1,1,0,'2019-11-07 09:30:20','0','108.952537,34.234293');

/*Table structure for table `t_communi` */

DROP TABLE IF EXISTS `t_communi`;

CREATE TABLE `t_communi` (
  `cm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小区ID',
  `rsid` int(11) DEFAULT NULL COMMENT '回收站ID',
  `cm_name` varchar(40) DEFAULT NULL COMMENT '小区名称',
  `cm_address` varchar(255) DEFAULT NULL COMMENT '小区地址',
  `cm_point` varchar(255) DEFAULT NULL COMMENT '小区精确位置（经纬度）',
  `cm_area` varchar(50) DEFAULT NULL COMMENT '小区面积',
  `cm_range` varchar(255) DEFAULT NULL COMMENT '小区范围',
  `cm_population` varchar(20) DEFAULT NULL COMMENT '小区人口数',
  `cm_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `creatTime` datetime DEFAULT NULL COMMENT '创建时间',
  `delflag` int(1) DEFAULT NULL COMMENT '删除标记（0:未删;1:已删）',
  `bidding` varchar(2) DEFAULT NULL COMMENT '是否中标0:未，1:中',
  `state` int(1) DEFAULT NULL COMMENT '状态（0:未用;1:已用）',
  `optid` int(11) DEFAULT NULL COMMENT '操作员ID',
  PRIMARY KEY (`cm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_communi` */

insert  into `t_communi`(`cm_id`,`rsid`,`cm_name`,`cm_address`,`cm_point`,`cm_area`,`cm_range`,`cm_population`,`cm_remark`,`creatTime`,`delflag`,`bidding`,`state`,`optid`) values (9,9,'家属区','长安路237号','108.951769,34.23458','8000','108.951221,34.234886;108.951225,34.233801;108.952995,34.233801;108.952995,34.234942;','5000','家属区','2019-11-01 17:12:23',0,'是',0,0),(10,9,'体育场','体育场','108.949608,34.236449','123','108.949249,34.236778;108.950354,34.236778;108.950354,34.235688;108.949249,34.235688;','12','体育场','2019-11-08 08:47:53',0,'否',0,0);

/*Table structure for table `t_datadetilinfo` */

DROP TABLE IF EXISTS `t_datadetilinfo`;

CREATE TABLE `t_datadetilinfo` (
  `dataDet_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_id` int(11) DEFAULT NULL,
  `dataDet_name` varchar(25) DEFAULT NULL,
  `delflag` int(1) DEFAULT '0',
  `state` int(1) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dataDet_id`),
  KEY `data_id` (`data_id`),
  CONSTRAINT `data_id` FOREIGN KEY (`data_id`) REFERENCES `t_datainfo` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `t_datadetilinfo` */

insert  into `t_datadetilinfo`(`dataDet_id`,`data_id`,`dataDet_name`,`delflag`,`state`,`createTime`,`remark`,`opt_id`) values (1,1,'星期一',0,0,'2019-10-24 22:18:29','星期一',1),(2,1,'星期二',0,0,'2019-10-24 22:18:58','星期二',1),(3,1,'星期三',0,0,'2019-10-24 22:21:56','星期三',1),(4,2,'汉族',0,0,'2019-10-24 22:22:20','汉族',1),(5,2,'回族',0,0,'2019-10-24 22:22:40','回族',1),(6,2,'藏族',0,0,'2019-10-24 22:23:18','藏族',1),(7,2,'苗族',0,0,'2019-10-24 22:23:49','苗族',1),(8,3,'陕西省',0,0,'2019-10-24 22:24:12','陕西省',1),(9,3,'山东省',0,0,'2019-10-24 22:24:38','山东省',1),(10,3,'河南省',0,0,'2019-10-24 22:25:00','河南省',1),(11,3,'江苏省',0,0,'2019-10-24 22:25:27','江苏省',1),(12,16,'上班中',0,0,'2019-11-06 15:40:57','1',1),(13,16,'休息',0,0,'2019-11-06 15:40:54','0',1),(14,17,'接单员',0,0,'2019-11-06 15:41:46','0',1),(15,17,'负责人',0,0,'2019-11-06 15:41:48','1',1),(16,17,'回收员',0,0,'2019-11-06 15:41:50','2',1);

/*Table structure for table `t_datainfo` */

DROP TABLE IF EXISTS `t_datainfo`;

CREATE TABLE `t_datainfo` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_name` varchar(25) DEFAULT NULL,
  `delflag` int(1) DEFAULT '0',
  `state` int(1) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `t_datainfo` */

insert  into `t_datainfo`(`data_id`,`data_name`,`delflag`,`state`,`createTime`,`remark`,`opt_id`) values (1,'星期',0,0,'2019-10-24 22:17:08','星期',1),(2,'民族',0,0,'2019-10-24 22:17:29','民族',1),(3,'地区',0,0,'2019-10-24 22:17:53','地区',1),(16,'回收站人员状态',0,0,'2019-11-06 15:38:36','回收站人员状态 是否上班',1),(17,'回收站人员工种',0,0,'2019-11-06 15:39:35','回收站人员工种',1);

/*Table structure for table `t_enshrineinfo` */

DROP TABLE IF EXISTS `t_enshrineinfo`;

CREATE TABLE `t_enshrineinfo` (
  `warehous_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehous_name` varchar(150) DEFAULT NULL,
  `classes` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `s_usid` int(11) DEFAULT NULL,
  `collect` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  PRIMARY KEY (`warehous_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_enshrineinfo` */

insert  into `t_enshrineinfo`(`warehous_id`,`warehous_name`,`classes`,`weight`,`s_usid`,`collect`,`remark`,`state`,`opt_id`,`delflag`) values (1,'废纸','纸制品',11,1,'2019-11-08 16:51:43',NULL,NULL,NULL,NULL),(2,'废纸','zz',312,0,'2019-11-08 17:11:51','',0,1,0);

/*Table structure for table `t_examineinfo` */

DROP TABLE IF EXISTS `t_examineinfo`;

CREATE TABLE `t_examineinfo` (
  `examine_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_usid` int(11) DEFAULT NULL,
  `allot` int(11) DEFAULT NULL,
  `accomplish` double DEFAULT NULL,
  `massDeviation` double DEFAULT NULL,
  `budgetTime` double DEFAULT NULL,
  `realityTime` double DEFAULT NULL,
  `timeDeviation` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `optime` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`examine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_examineinfo` */

/*Table structure for table `t_goods` */

DROP TABLE IF EXISTS `t_goods`;

CREATE TABLE `t_goods` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物品ID',
  `g_code` varchar(40) DEFAULT NULL COMMENT '物品编码',
  `g_name` varchar(40) DEFAULT NULL COMMENT '物品名称',
  `g_gtid` int(11) DEFAULT NULL COMMENT '物品类型ID',
  `g_price` double DEFAULT NULL COMMENT '价格',
  `g_model` varchar(40) DEFAULT NULL COMMENT '物品型号',
  `g_format` varchar(200) DEFAULT NULL COMMENT '物品规格',
  `g_qualitytime` varchar(50) DEFAULT NULL COMMENT '保质期',
  `g_deptid` int(11) DEFAULT NULL COMMENT '所属部门（回收站/分拣站）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `state` int(11) DEFAULT NULL COMMENT '状态(0表示可用；1表示不可用',
  `g_stopflag` int(11) DEFAULT NULL COMMENT '停用标记（0表示为停用；1表示已停用）',
  `delflag` int(11) DEFAULT NULL COMMENT '删除标记（0表示未删除；1表示已删除）',
  `optid` int(11) DEFAULT NULL COMMENT '操作员ID',
  `optime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_goods` */

insert  into `t_goods`(`g_id`,`g_code`,`g_name`,`g_gtid`,`g_price`,`g_model`,`g_format`,`g_qualitytime`,`g_deptid`,`remark`,`state`,`g_stopflag`,`delflag`,`optid`,`optime`) values (1,'1245789','桌子',1,12.5,'124578','木质','15年',1,'桌子',0,0,0,1,'2019-10-30 11:14:05'),(2,'123','垃圾桶',NULL,70,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(3,'1234','大扫帚',1,12,'1234','木制','2个月',1,'12',0,0,1,0,'2019-11-08 08:51:04');

/*Table structure for table `t_goodsdetail` */

DROP TABLE IF EXISTS `t_goodsdetail`;

CREATE TABLE `t_goodsdetail` (
  `gt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物品类型ID',
  `gt_code` varchar(20) DEFAULT NULL COMMENT '物品类型编码',
  `gt_name` varchar(60) DEFAULT NULL COMMENT '物品类型名称',
  `gt_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `gt_state` int(1) DEFAULT NULL COMMENT '状态',
  `gt_delflag` int(1) DEFAULT NULL COMMENT '删除标志',
  `gt_optid` int(11) DEFAULT NULL COMMENT '操作员ID',
  `gt_creattime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`gt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_goodsdetail` */

insert  into `t_goodsdetail`(`gt_id`,`gt_code`,`gt_name`,`gt_remark`,`gt_state`,`gt_delflag`,`gt_optid`,`gt_creattime`) values (1,'4578965412','木质','木头',0,0,1,'2019-10-30 13:23:43'),(2,'sadasd','asdasd','asdasd',0,1,0,'2019-10-30 16:00:16'),(3,'dasdawqe123','asdasd','asd',0,1,0,'2019-10-30 16:01:18'),(4,'312','塑料','塑料',0,1,0,'2019-11-08 08:53:01');

/*Table structure for table `t_menuinfo` */

DROP TABLE IF EXISTS `t_menuinfo`;

CREATE TABLE `t_menuinfo` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parentId` int(11) DEFAULT NULL COMMENT '父节点',
  `menu_name` varchar(25) DEFAULT NULL COMMENT '菜单名称',
  `menu_iconCls` varchar(20) DEFAULT NULL COMMENT '菜单图标',
  `menu_path` varchar(30) DEFAULT NULL COMMENT '路径',
  `menu_state` varchar(10) DEFAULT NULL COMMENT '是否有子菜单',
  `state` int(11) DEFAULT '0' COMMENT '状态',
  `delflag` int(11) DEFAULT '0' COMMENT '删除标记',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `opt_id` int(11) DEFAULT NULL COMMENT '操作员',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `t_menuinfo` */

insert  into `t_menuinfo`(`menu_id`,`parentId`,`menu_name`,`menu_iconCls`,`menu_path`,`menu_state`,`state`,`delflag`,`createtime`,`remark`,`opt_id`) values (1,-1,'垃圾分类信息化管理系统','icon-home',NULL,'closed',0,0,'2019-10-19 08:56:25','一级菜单',1),(2,1,'系统管理','icon-save',NULL,'closed',0,0,'2019-10-19 08:58:08','二级菜单',1),(3,1,'物资台账','icon-save',NULL,'closed',0,0,'2019-10-19 08:58:28','二级菜单',1),(4,2,'用户管理','icon-save','userManage.html','open',0,0,'2019-10-19 08:59:32','三级菜单',1),(5,2,'角色管理','icon-save','roleManage.html','open',0,0,'2019-10-19 08:59:34','三级菜单',1),(6,2,'菜单管理','icon-save','menuManage.html','open',0,0,'2019-10-19 08:59:36','三级菜单',1),(16,2,'数据字典','icon-save','dataManager.html','open',0,0,'2019-10-25 10:53:51','三级菜单',1),(17,3,'投标管理','icon-save','biddManager.html','open',0,0,'2019-10-30 08:50:36','三级菜单',1),(18,3,'小区管理','icon-save','xqManager.html','open',0,0,'2019-10-30 08:54:42','三级菜单',1),(19,3,'物资管理','icon-save','goodsManager.html','open',0,0,'2019-10-30 08:56:08','三级菜单',1),(20,3,'物资类型','icon-save','goodsdetailManager.html','open',0,0,'2019-10-30 08:57:21','三级菜单',1),(21,1,'车辆管理','icon-save',NULL,'closed',0,0,'2019-11-04 08:41:33','二级菜单',1),(22,21,'车辆信息','icon-save','carManage.html','open',0,0,'2019-11-04 08:42:52','三级菜单',1),(23,21,'车辆调度','icon-save','allotManager.html','open',0,0,'2019-11-04 08:49:17','三级菜单',1),(24,1,'回收管理','icon-save',NULL,'closed',0,0,'2019-11-05 16:38:58','二级菜单',1),(25,24,'回收站管理','icon-save','Recycle.html','open',0,0,'2019-11-05 16:39:00','三级菜单',1),(26,24,'订单管理','icon-save','orderManager.html','open',0,0,'2019-11-05 17:28:27','三级菜单',1),(27,24,'出库管理','icon-save','transferManager.html','open',0,0,'2019-11-05 17:29:08','三级菜单',1),(28,1,'分拣站管理','icon-save',NULL,'closed',0,0,'2019-11-05 17:29:36','二级菜单',1),(29,28,'入库管理','icon-save','enshrineManager.html','open',0,0,'2019-11-05 17:29:37','三级菜单',1),(30,28,'质量考核','icon-save','examineinfo.html','open',0,0,'2019-11-05 17:29:46','三级菜单',1),(31,28,'分拣站管理','icon-save','sortingManager.html','open',0,0,'2019-11-05 17:29:49','三级菜单',1),(32,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL);

/*Table structure for table `t_orderinfo` */

DROP TABLE IF EXISTS `t_orderinfo`;

CREATE TABLE `t_orderinfo` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `odid` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `r_id` int(11) DEFAULT NULL COMMENT '居民用户id',
  `o_uaddress` varchar(255) DEFAULT NULL COMMENT '下单回收地址',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `regenerant` varchar(255) DEFAULT NULL COMMENT '回收物图片',
  `o_weight` float DEFAULT NULL COMMENT '回收物重量/kg',
  `receiving` int(1) DEFAULT NULL COMMENT '是否接单完成回收:0否,1接单,2处理中,3完成',
  `o_clerkid` int(11) DEFAULT NULL COMMENT '接单员id',
  `o_ucid` int(11) DEFAULT NULL COMMENT '回收员id',
  `o_money` float DEFAULT NULL COMMENT '订单金额',
  `o_fintime` datetime DEFAULT NULL COMMENT '完成时间',
  `delflag` int(11) DEFAULT NULL COMMENT '删除标记',
  `optid` int(11) DEFAULT NULL COMMENT '数据操作员id',
  `optime` datetime DEFAULT NULL COMMENT '操作数据时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `o_name` varchar(50) DEFAULT NULL,
  `o_time` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `t_resident` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_orderinfo` */

insert  into `t_orderinfo`(`oid`,`odid`,`r_id`,`o_uaddress`,`createtime`,`regenerant`,`o_weight`,`receiving`,`o_clerkid`,`o_ucid`,`o_money`,`o_fintime`,`delflag`,`optid`,`optime`,`remark`,`o_name`,`o_time`,`state`) values (1,'123',1,'高速大厦','2019-11-02 10:40:49',NULL,533,3,1,1,23,'2019-11-02 10:41:45',0,1,'2019-11-02 10:41:50','项目演示',NULL,NULL,NULL),(2,'1234',2,'西安','2019-11-02 13:16:35',NULL,16,2,1,1,22,'2019-11-02 13:16:45',1,1,'2019-11-02 13:16:56','假数据修改测试',NULL,NULL,NULL),(3,'45',3,'泰坦尼克','2019-11-02 13:48:24',NULL,45,1,1,1,24,'2019-11-02 13:48:45',1,1,'2019-11-02 13:48:52','假数据qqqqq',NULL,NULL,NULL),(4,'2d945fd3c1b84d158610e7c0f3ea917a',1,'西安市','2019-11-08 16:02:59',NULL,83,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'42384','纸箱','null',0);

/*Table structure for table `t_recyclematerials` */

DROP TABLE IF EXISTS `t_recyclematerials`;

CREATE TABLE `t_recyclematerials` (
  `sg_gid` int(11) DEFAULT NULL,
  `sg_id` int(11) DEFAULT NULL,
  `allocation_num` int(11) DEFAULT NULL,
  `inventory_num` int(11) DEFAULT NULL,
  `use_num` int(11) DEFAULT NULL,
  `scrap_num` int(11) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `optid` int(11) DEFAULT NULL,
  `optime` datetime DEFAULT NULL,
  `remark` varchar(765) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_recyclematerials` */

insert  into `t_recyclematerials`(`sg_gid`,`sg_id`,`allocation_num`,`inventory_num`,`use_num`,`scrap_num`,`delflag`,`optid`,`optime`,`remark`,`state`) values (2,9,0,0,0,0,0,1,'2019-11-06 04:39:51','0',0);

/*Table structure for table `t_recyclestationinfo` */

DROP TABLE IF EXISTS `t_recyclestationinfo`;

CREATE TABLE `t_recyclestationinfo` (
  `rsid` int(11) NOT NULL COMMENT '回收站id',
  `ss_id` int(11) DEFAULT NULL COMMENT '所属分拣站id',
  `c_ucid` varchar(255) DEFAULT NULL COMMENT '回收人员id集合',
  `rsname` varchar(50) DEFAULT NULL COMMENT '回收站名称',
  `address` varchar(255) DEFAULT NULL COMMENT '回收站坐标',
  `scope` varchar(255) DEFAULT NULL COMMENT '回收站范围',
  `state` int(1) DEFAULT NULL COMMENT '回收站状态 1.open 0.closed',
  `date` datetime DEFAULT NULL COMMENT '回收站搭建时间',
  `volume` int(10) DEFAULT NULL COMMENT '回收站容量',
  `optid` int(11) DEFAULT NULL COMMENT '操作人员',
  `delflag` int(1) DEFAULT NULL COMMENT '删除标记',
  `optime` datetime DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`rsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_recyclestationinfo` */

insert  into `t_recyclestationinfo`(`rsid`,`ss_id`,`c_ucid`,`rsname`,`address`,`scope`,`state`,`date`,`volume`,`optid`,`delflag`,`optime`,`remark`) values (9,1,'1','体育场','108.954338,34.237695','108.953754,34.237486;108.954302,34.237874;108.954805,34.237912;108.954248,34.237121;108.954257,34.237106;108.954203,34.237098;',0,'2019-11-06 04:39:51',10000,1,0,'2019-11-06 04:39:51','0');

/*Table structure for table `t_resident` */

DROP TABLE IF EXISTS `t_resident`;

CREATE TABLE `t_resident` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(150) DEFAULT NULL,
  `r_nickname` varchar(150) DEFAULT NULL,
  `r_password` varchar(150) DEFAULT NULL,
  `r_sex` varchar(6) DEFAULT NULL,
  `iDCard` varchar(90) DEFAULT NULL,
  `address` varchar(240) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `regdata` datetime DEFAULT NULL,
  `remark` varchar(765) DEFAULT NULL,
  `delflag` int(1) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_resident` */

insert  into `t_resident`(`r_id`,`r_name`,`r_nickname`,`r_password`,`r_sex`,`iDCard`,`address`,`contact`,`regdata`,`remark`,`delflag`,`opt_id`,`state`) values (1,'admin','admin','123456','男','1111111111','西安市碑林区','12306','2019-10-30 13:42:23','用户1',0,1,0),(2,'jack',NULL,'j123456',NULL,'622826199706253265','西安市碑林区','17687906648','2019-10-31 17:15:13',NULL,0,0,0),(3,'rose',NULL,'r123456',NULL,'622826199636542536','西安市莲湖区','17687906648','2019-10-31 17:17:36',NULL,0,0,0),(4,'abc',NULL,'a123456',NULL,'123456789321456987','西安市','','2019-11-05 08:42:15',NULL,0,0,0);

/*Table structure for table `t_roleinfo` */

DROP TABLE IF EXISTS `t_roleinfo`;

CREATE TABLE `t_roleinfo` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(25) DEFAULT NULL COMMENT '角色名称',
  `menu_ids` varchar(255) DEFAULT NULL COMMENT '菜单信息组',
  `state` int(11) DEFAULT '0' COMMENT '状态',
  `delflag` int(11) DEFAULT '0' COMMENT '删除标记',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `opt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_roleinfo` */

insert  into `t_roleinfo`(`role_id`,`role_name`,`menu_ids`,`state`,`delflag`,`createtime`,`remark`,`opt_id`) values (1,'超级管理员','1,2,4,5,6,16,3,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31',0,0,'2019-10-19 00:00:00','1',1),(2,'居民',NULL,0,1,'2019-10-21 09:17:24','1',1),(3,'管理员','1,2,4,5,3',0,0,'2019-10-21 09:18:03','1',1),(4,'分拣员','27,28,29,30,31',0,0,'2019-10-23 11:56:17','1',1),(5,'回收员',NULL,0,0,'2019-11-07 15:34:54','1',1),(6,'司机',NULL,0,0,'2019-11-07 15:35:54','1',1),(7,'分拣员2','27,28,29,30,31',0,0,'2019-11-08 10:01:02','1',1);

/*Table structure for table `t_sendorderinfo` */

DROP TABLE IF EXISTS `t_sendorderinfo`;

CREATE TABLE `t_sendorderinfo` (
  `so_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '派单id',
  `oid` int(11) DEFAULT NULL COMMENT '订单id',
  `so_rsid` int(11) DEFAULT NULL COMMENT '回收站id',
  `so_ucid` int(11) DEFAULT NULL COMMENT '回收员id',
  `carid` int(11) DEFAULT NULL COMMENT '车辆id',
  `optid` int(11) DEFAULT NULL COMMENT '操作人员',
  `delflag` int(11) DEFAULT NULL COMMENT '删除标记',
  `optime` datetime DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`so_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_sendorderinfo` */

insert  into `t_sendorderinfo`(`so_id`,`oid`,`so_rsid`,`so_ucid`,`carid`,`optid`,`delflag`,`optime`,`remark`) values (1,1,1,1,1,1,0,'2019-11-04 18:54:30','1');

/*Table structure for table `t_sorterinfo` */

DROP TABLE IF EXISTS `t_sorterinfo`;

CREATE TABLE `t_sorterinfo` (
  `s_usid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `sorter_jobNum` int(11) DEFAULT NULL,
  `ss_id` int(11) DEFAULT NULL,
  `sorter_busy` int(11) DEFAULT NULL,
  `sorter_work` int(11) DEFAULT NULL,
  `sorter_workTop` varchar(150) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  `optime` datetime DEFAULT NULL,
  PRIMARY KEY (`s_usid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `t_sorterinfo` */

insert  into `t_sorterinfo`(`s_usid`,`user_id`,`sorter_jobNum`,`ss_id`,`sorter_busy`,`sorter_work`,`sorter_workTop`,`remark`,`state`,`delflag`,`opt_id`,`optime`) values (1,4,1,1,1,1,'分拣员1号','分拣员1号',1,0,1,'2019-02-06 00:00:00'),(2,4,2,1,1,1,'分拣员2号','分拣员2号',1,0,1,'2019-02-06 00:00:00'),(3,3,3,2,1,1,'记录员1号','记录员1号',1,1,1,'2019-02-06 00:00:00'),(17,7,4,1,1,1,'记录员3号',NULL,1,0,1,'2019-11-02 10:23:24'),(18,7,5,2,1,1,'记录员4号',NULL,1,0,1,'2019-11-02 10:31:01');

/*Table structure for table `t_sortgoodsinfo` */

DROP TABLE IF EXISTS `t_sortgoodsinfo`;

CREATE TABLE `t_sortgoodsinfo` (
  `sg_id` double DEFAULT NULL,
  `sg_gid` double DEFAULT NULL,
  `ss_id` double DEFAULT NULL,
  `allocation_num` double DEFAULT NULL,
  `inventory_num` double DEFAULT NULL,
  `use_num` double DEFAULT NULL,
  `scrap_num` double DEFAULT NULL,
  `delflag` double DEFAULT NULL,
  `opt_id` double DEFAULT NULL,
  `optime` datetime DEFAULT NULL,
  `remark` varchar(765) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sortgoodsinfo` */

insert  into `t_sortgoodsinfo`(`sg_id`,`sg_gid`,`ss_id`,`allocation_num`,`inventory_num`,`use_num`,`scrap_num`,`delflag`,`opt_id`,`optime`,`remark`) values (1,1,1,5000,5000,2500,500,0,1,'2019-05-06 00:00:00','扫把'),(2,2,2,200,200,180,1,1,1,'2019-05-06 00:00:00','垃圾车'),(3,2,3,2222,555,222,22,0,1,'2019-05-06 00:00:00','簸箕'),(4,1,2,5000,555,124,1,1,1,'2019-05-06 00:00:00','铁楸');

/*Table structure for table `t_sortingstationinfo` */

DROP TABLE IF EXISTS `t_sortingstationinfo`;

CREATE TABLE `t_sortingstationinfo` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_usid` int(11) DEFAULT NULL,
  `ss_name` varchar(150) DEFAULT NULL,
  `ss_state` int(11) DEFAULT NULL,
  `rs_ids` varchar(255) DEFAULT NULL,
  `sg_id` int(11) DEFAULT NULL,
  `ss_date` datetime DEFAULT NULL,
  `ss_capacity` int(11) DEFAULT NULL,
  `ss_address` varchar(255) DEFAULT NULL,
  `ss_coordinate` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `delflag` int(11) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  `optime` datetime DEFAULT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `t_sortingstationinfo` */

insert  into `t_sortingstationinfo`(`ss_id`,`s_usid`,`ss_name`,`ss_state`,`rs_ids`,`sg_id`,`ss_date`,`ss_capacity`,`ss_address`,`ss_coordinate`,`remark`,`delflag`,`opt_id`,`optime`) values (1,1,'碑林区分拣站2号',1,'1,2,3,4，',1,'2015-10-01 00:00:00',400,'108.954549,34.241556','陕西省西安市碑林区','陕西省西安市碑林区分拣站',0,1,'2019-10-31 00:00:00'),(2,2,'碑林区分拣站1号',1,'1,2,3,4，',1,'2015-10-01 00:00:00',555,'108.952618,34.240728','陕西省西安市碑林区','陕西省西安碑林区分拣站',0,1,'2019-10-31 00:00:00'),(6,3,'莲湖区分拣站',1,'1,2,3,4，',1,'2019-11-01 07:05:07',600,'108.934544,34.268198','108.904936,34.301604;108.963002,34.301604;108.963002,34.241224;108.904936,34.241224;','莲湖区分拣站',0,1,NULL),(7,1,'1',1,'1,2,3,4，',2,'2019-11-02 10:18:17',1244,'108.947219,34.242631','碑林区','碑林区',0,1,NULL),(8,2,'124',1,'1,2,3,4，',1,'2019-11-02 10:23:24',213124,'108.954262,34.239217','21312','12',1,1,NULL),(9,3,'5479',1,'1,2,3,4，',2,'2019-11-02 10:31:01',46948,'108.967539,34.239232','5423','风格各异',0,1,NULL),(10,1,'维尔和规范',1,'1,2,3,4，',1,'2019-11-02 10:41:01',214,'108.950219,34.240986','2123大师','上档次不舍得',1,1,NULL),(11,2,'贝尔发货吧',1,'1,2,3,4，',2,'2019-11-02 10:45:58',12424,'108.951162,34.23815','参数','发到你上班',1,1,NULL),(12,3,'EWF',1,'1,2,3,4，',1,'2019-11-02 10:51:09',4234,'108.94978,34.240896','子表广东发展','二嘎',1,1,NULL),(16,1,'热风哈',1,'1,2,3,4',1,'2019-11-02 11:38:14',1234,'108.9511,34.238232','办法而定','二发红包',1,1,NULL),(17,2,'测试01',1,'1,2,3,4',1,'2019-11-02 11:54:34',1800,'108.952591,34.242746','碑林','碑林区分拣站',0,1,NULL),(18,3,'随着时代111',1,NULL,NULL,'2019-10-28 00:00:00',41564,'108.951064,34.239575','sht','df ng发图开发',0,1,NULL),(20,NULL,'很突然',1,NULL,NULL,'2019-11-04 09:57:47',123143,'108.949716,34.240053','放大化','感染',0,1,NULL),(21,1,'碑林区分拣站1',1,NULL,1,'2019-11-08 03:32:15',13124,'108.954289,34.239187','碑林区·','碑林区',0,1,NULL);

/*Table structure for table `t_transfer` */

DROP TABLE IF EXISTS `t_transfer`;

CREATE TABLE `t_transfer` (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '转运id',
  `t_carid` int(11) DEFAULT NULL COMMENT '车辆id',
  `t_udid` int(11) DEFAULT NULL COMMENT '司机id',
  `createtime` datetime DEFAULT NULL COMMENT '转运单创建时间',
  `t_rsid` int(11) DEFAULT NULL COMMENT '回收站id',
  `t_ssid` int(11) DEFAULT NULL COMMENT '分拣站id',
  `depart_time` datetime DEFAULT NULL COMMENT '车辆出发时间',
  `t_ueid` int(11) DEFAULT NULL COMMENT '出站检查员',
  `load` float DEFAULT NULL COMMENT '载重/kg',
  `state` int(1) DEFAULT NULL COMMENT '转运状态',
  `delflag` int(1) DEFAULT NULL COMMENT '删除标记',
  `optid` int(11) DEFAULT NULL COMMENT '操作员ID',
  `optime` datetime DEFAULT NULL COMMENT '数据操作时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`tid`),
  KEY `t_carid` (`t_carid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `t_transfer` */

insert  into `t_transfer`(`tid`,`t_carid`,`t_udid`,`createtime`,`t_rsid`,`t_ssid`,`depart_time`,`t_ueid`,`load`,`state`,`delflag`,`optid`,`optime`,`remark`) values (1,456,123,'2019-10-30 14:20:00',9,1,'2019-10-30 14:20:27',5,1000,0,0,1,'2019-10-31 11:59:49','修改测试'),(2,123,1,'2019-10-31 12:02:22',9,3,'2019-10-31 17:09:00',3,0,0,0,2,'2019-11-01 03:01:29','出发时间测试'),(5,456,5,'2019-10-31 10:56:46',9,5,NULL,5,600,0,0,1,'2019-10-31 05:07:33','修改测试002'),(6,456,2,'2019-10-31 11:32:49',9,4,'2019-11-01 13:56:00',5,300,0,0,1,'2019-11-01 01:56:29','测试02'),(7,456,22,'2019-10-31 03:40:08',9,3,NULL,3,600,0,0,1,'2019-10-31 03:43:00','测试003\r\n修改00'),(8,123,2,'2019-10-31 03:56:15',9,2,NULL,3,200,0,0,1,'2019-10-31 03:56:15','ceshi'),(9,123,2,'2019-10-31 05:05:25',9,2,'2019-10-31 17:04:00',3,200,0,0,1,'2019-10-31 05:05:25','啊实打实'),(10,123,2,'2019-11-01 01:59:01',9,4,'2019-11-01 13:58:00',5,300,0,0,1,'2019-11-01 01:59:01','测试***'),(11,123,2,'2019-11-01 01:59:48',9,4,'2019-11-01 13:59:00',5,300,0,1,1,'2019-11-01 01:59:48','新测试'),(19,123,1,'2019-11-01 03:06:56',9,3,'2019-11-01 15:06:00',3,500,0,1,1,'2019-11-01 03:06:56','asdasd'),(20,123,1,'2019-11-01 03:15:31',9,3,'2019-11-01 15:15:00',3,500,0,0,1,'2019-11-01 03:17:30','***新增测试'),(21,123,2,'2019-11-01 03:43:40',1,1,'2019-11-01 15:43:00',1,400,0,0,1,'2019-11-01 04:52:14','aaaaaaaaaaaa'),(22,123,3,'2019-11-01 04:05:24',1,1,'2019-11-01 16:05:00',1,400,0,0,1,'2019-11-01 04:05:24','新增测试'),(23,456,3,'2019-11-01 04:08:31',1,1,'2019-11-01 16:08:00',1,400,0,1,1,'2019-11-01 04:08:31','46546546'),(24,123,2,'2019-11-01 04:19:04',1,1,'2019-11-01 16:18:00',1,400,0,0,1,'2019-11-01 04:19:04','再测试'),(25,456,2,'2019-11-01 04:29:20',1,1,'2019-11-01 16:29:00',1,200,0,1,1,'2019-11-01 04:29:20','///////'),(26,456,4,'2019-11-01 04:42:25',2,1,'2019-11-01 16:42:00',1,400,0,0,1,'2019-11-04 10:57:28','eeeeeeeeee'),(27,123,2,'2019-11-01 04:42:55',2,1,'2019-11-01 16:42:00',1,400,0,0,1,'2019-11-01 04:42:55','我还测'),(28,123,6,'2019-11-01 05:42:50',1,1,'2019-11-01 17:42:00',1,200,0,0,1,'2019-11-01 06:48:36','htrdytrdhtrx'),(29,456,4,'2019-11-01 06:47:46',1,1,'2019-11-01 18:47:00',1,400,0,0,1,'2019-11-01 06:47:46','asdasd'),(30,123,5,'2019-11-01 06:58:24',1,1,'2019-11-01 18:58:00',1,200,0,0,1,'2019-11-04 10:57:22','最后一测'),(31,789,7,'2019-11-01 07:13:13',1,1,'2019-11-01 19:13:00',1,500,0,0,1,'2019-11-01 07:13:13','qwer'),(32,789,5,'2019-11-03 05:06:01',1,1,'2019-11-03 17:05:00',122,100,0,0,1,'2019-11-03 05:06:01','0000000'),(33,789,4,'2019-11-04 10:21:04',2,1,'2019-11-04 10:21:00',1,400,0,0,1,'2019-11-04 10:57:06',''),(34,456,6,'2019-11-04 10:38:21',1,1,'2019-11-04 10:38:00',1,400,0,0,1,'2019-11-04 10:56:57',''),(35,789,5,'2019-11-04 10:55:44',1,1,'2019-11-04 10:55:00',1,200,0,0,1,'2019-11-04 10:55:44','0.0.0.0.0.0'),(36,32349,45,'2019-11-07 06:19:55',9,1,'2019-11-07 18:19:00',6,333,0,0,1,'2019-11-07 06:20:13','asd');

/*Table structure for table `t_userinfo` */

DROP TABLE IF EXISTS `t_userinfo`;

CREATE TABLE `t_userinfo` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(25) DEFAULT NULL COMMENT '用户姓名',
  `user_pwd` varchar(40) DEFAULT NULL COMMENT '用户密码',
  `user_phone` varchar(11) DEFAULT NULL COMMENT '用户电话',
  `user_idCard` varchar(18) DEFAULT NULL COMMENT '用户身份证号',
  `role_id` int(11) DEFAULT NULL COMMENT '角色',
  `state` int(11) DEFAULT '0' COMMENT '状态',
  `delflag` int(11) DEFAULT '0' COMMENT '删除标记',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `opt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `t_roleinfo` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `t_userinfo` */

insert  into `t_userinfo`(`user_id`,`user_name`,`user_pwd`,`user_phone`,`user_idCard`,`role_id`,`state`,`delflag`,`createtime`,`remark`,`opt_id`) values (1,'admin','e10adc3949ba59abbe56e057f20f883e','1234568790','123321456654078',1,0,0,'2019-10-20 14:27:40','超管',NULL),(2,'ads','e10adc3949ba59abbe56e057f20f883e','489651','489615',1,0,1,'2019-10-23 09:52:32','',NULL),(3,'huazi1','e10adc3949ba59abbe56e057f20f883e','1254879658','54687965421487',3,0,1,'2019-10-23 09:52:36','',NULL),(4,'dashjkl','8946513','213`12','52342342',4,0,0,'2019-10-23 09:52:39','分拣员',NULL),(5,'asfdg','5656','45','54',1,0,1,'2019-10-23 09:52:42','',NULL),(6,'adsfgh','6545654','455','52',5,0,1,'2019-10-23 09:52:44','',NULL),(7,'asfdghh','132313',NULL,NULL,1,0,0,'2019-10-23 09:52:46',NULL,NULL),(8,'qwertyu','1231',NULL,NULL,7,0,0,'2019-10-23 09:52:49',NULL,NULL),(9,'cgfhjk','456456',NULL,NULL,7,0,0,'2019-10-23 09:52:51',NULL,NULL),(10,'asfdgyrfhgj','3123',NULL,NULL,7,0,0,'2019-10-23 09:52:52',NULL,NULL),(11,'sdgfhjj','123123',NULL,NULL,5,0,1,'2019-10-23 09:52:54',NULL,NULL),(12,'sdgfh','13123',NULL,NULL,1,0,1,'2019-10-23 09:52:56',NULL,NULL),(36,'gshdgghj','sfdgh','sgfdh','sdf',5,0,1,'2019-10-22 05:52:33','sdf',NULL),(41,'13232','4651','48651','4513',1,0,1,'2019-10-22 07:20:03','41523',NULL),(42,'asdfdg','wdafsg','ASDSFDG','SGDJGHKH',5,0,1,'2019-10-22 07:20:56','AFDGSF',NULL),(43,'sfdgh','e10adc3949ba59abbe56e057f20f883e','123','4587',1,0,1,'2019-10-22 08:39:44','123',NULL),(44,'qwe','e10adc3949ba59abbe56e057f20f883e','123','123131',5,0,1,'2019-11-07 09:34:45','12313',NULL),(45,'WR',NULL,NULL,NULL,6,0,0,NULL,NULL,NULL),(46,'WER',NULL,NULL,NULL,6,0,0,NULL,NULL,NULL),(47,'admin1','e10adc3949ba59abbe56e057f20f883e','324234','3525235325',1,0,0,'2019-11-08 10:15:40','超管',NULL),(48,'12312341','e10adc3949ba59abbe56e057f20f883e','141323525','352523532514124',3,0,0,'2019-11-08 10:16:07','管理员',NULL),(49,'啊实打实的','49553eef60a57d89bf52e71795fd2b08','asdasdasd','asdasdasd',6,0,0,'2019-11-08 10:16:31','',NULL);

/*Table structure for table `t_warehouseinfo` */

DROP TABLE IF EXISTS `t_warehouseinfo`;

CREATE TABLE `t_warehouseinfo` (
  `wh_id` double DEFAULT NULL,
  `wh_carid` double DEFAULT NULL,
  `wh_udid` double DEFAULT NULL,
  `oid` double DEFAULT NULL,
  `wh_tid` double DEFAULT NULL,
  `creatTime` datetime DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `deviation` double DEFAULT NULL,
  `remark` varchar(765) DEFAULT NULL,
  `state` double DEFAULT NULL,
  `opt_id` double DEFAULT NULL,
  `delflag` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_warehouseinfo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
