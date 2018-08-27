/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : store

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-08-21 10:51:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ts_store_application
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_application`;
CREATE TABLE `ts_store_application` (
  `APPLY_ID` varchar(50) DEFAULT NULL COMMENT '申请ID',
  `APPLY_ORG_ID` varchar(50) DEFAULT NULL COMMENT '申请单位ID',
  `APPLY_ORG_NAME` varchar(255) DEFAULT NULL COMMENT '申请单位名称',
  `PROJECT_ID` varchar(50) DEFAULT NULL COMMENT '项目ID',
  `PROJECT_NAME` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `APPLY_TYPE` int(1) DEFAULT NULL COMMENT '申请类型(0开发平台1组件2服务)',
  `USE_CONTENT` varchar(255) DEFAULT NULL COMMENT '用途说明',
  `USE_TYPE` int(1) DEFAULT NULL COMMENT '用途（0开发，1生产）',
  `APPLY_RESOURCE_ID` varchar(50) DEFAULT NULL COMMENT '申请资源ID',
  `APPLY_EXPIRET` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '有效期',
  `SERVICE_CODE` varchar(255) DEFAULT NULL COMMENT '访问码(仅调服务时有用)',
  `APPLY_LINKMAN` varchar(255) DEFAULT NULL COMMENT '联系人',
  `APPLY_PHONE` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `APPLY_EMAIL` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `CHECK_STATE` int(11) DEFAULT NULL COMMENT '审核状态(0待审核1通过2驳回)',
  `CHECK_CONTENT` varchar(255) DEFAULT NULL COMMENT '审核原因',
  `CHECK_PERSON` varchar(50) DEFAULT NULL COMMENT '审核人',
  `CHECK_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_application
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_application_record
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_application_record`;
CREATE TABLE `ts_store_application_record` (
  `RECORD_ID` varchar(50) DEFAULT NULL COMMENT '主键',
  `USER_ID` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `RECORD_TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `RECORD_CONTENT` varchar(4000) DEFAULT NULL COMMENT '记录内容',
  `RECORD_CREATEDATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '记录时间',
  `RECORD_ISREAD` int(11) DEFAULT NULL COMMENT '是否已读（0未读1已读）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_application_record
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_component
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_component`;
CREATE TABLE `ts_store_component` (
  `COMPONENT_ID` varchar(50) DEFAULT NULL COMMENT '组件ID',
  `COMPONENT_CODE` varchar(50) DEFAULT NULL COMMENT '组件编号',
  `COMPONENT_NAME` varchar(255) DEFAULT NULL COMMENT '组件名称',
  `COMPONENT_CONTENT` varchar(4000) DEFAULT NULL COMMENT '组件说明',
  `DOWNLOAD_TIMES` int(11) DEFAULT NULL COMMENT '下载次数(审核通过时候记录)',
  `MANAGE_ORG_ID` varchar(50) DEFAULT NULL COMMENT '管理部门',
  `MANAGE_TEL` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `MANAGE_ROLE_ID` int(11) DEFAULT NULL COMMENT '管理角色ID',
  `CREATER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `COMPONENT_SIZE` double DEFAULT NULL COMMENT '组件大小',
  `SOFTWARE_LANGUAGE` varchar(255) DEFAULT NULL COMMENT '软件语言',
  `SUIT_PLAT` varchar(255) DEFAULT NULL COMMENT '适用平台',
  `APPLICATION_BROWSER` varchar(255) DEFAULT NULL COMMENT '应用浏览器'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_component
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_component_detail
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_component_detail`;
CREATE TABLE `ts_store_component_detail` (
  `COMPONENT_DETAIL_ID` varchar(50) DEFAULT NULL COMMENT '组件详情ID',
  `COMPONENT_ID` varchar(50) DEFAULT NULL COMMENT '组件ID',
  `FILE_NAME` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `FILE_TYPE` int(1) DEFAULT NULL COMMENT '文件类型(0程序1文档)',
  `FILE_URL` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `FILE_SIZE` double DEFAULT NULL COMMENT '文件大小',
  `CREATER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_component_detail
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_notice
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_notice`;
CREATE TABLE `ts_store_notice` (
  `NOTICE_ID` int(11) DEFAULT NULL COMMENT '公告主键',
  `NOTICE_CODE` varchar(255) DEFAULT NULL COMMENT '公告编号',
  `NOTICE_TITLE` varchar(255) DEFAULT NULL COMMENT '公告标题',
  `NOTICE_CONTENT` varchar(4000) DEFAULT NULL COMMENT '公告内容',
  `NOTICE_DATETIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `NOTICE_ORGID` varchar(36) DEFAULT NULL,
  `NOTICE_ORGNAME` varchar(255) DEFAULT NULL,
  `IS_DELETE` int(11) DEFAULT NULL COMMENT '是否删除(0否1是)',
  `CREATER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_notice
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_notice_detail
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_notice_detail`;
CREATE TABLE `ts_store_notice_detail` (
  `NOTICE_DETAIL_ID` varchar(50) DEFAULT NULL COMMENT '主键',
  `NOTICE_ID` varchar(50) DEFAULT NULL COMMENT '公告ID',
  `FILE_URL` varchar(255) DEFAULT NULL COMMENT '附件地址',
  `FILE_NAME` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `FILE_SIZE` double DEFAULT NULL COMMENT '文件大小',
  `CREATER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_notice_detail
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_notice_record
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_notice_record`;
CREATE TABLE `ts_store_notice_record` (
  `NOTICE_RECORD_ID` varchar(50) DEFAULT NULL COMMENT '公告记录ID',
  `NOTICE_ID` varchar(50) DEFAULT NULL COMMENT '公告ID',
  `NOTICE_USERID` varchar(50) DEFAULT NULL COMMENT '用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_notice_record
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_platform
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_platform`;
CREATE TABLE `ts_store_platform` (
  `PLAT_ID` varchar(50) DEFAULT NULL COMMENT '平台ID',
  `PLAT_CODE` varchar(100) DEFAULT NULL COMMENT '平台编号',
  `PLAT_VERSION` varchar(50) DEFAULT NULL COMMENT '平台版本',
  `PLAT_PUBLISHDATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `PLAT_SIZE` double DEFAULT NULL COMMENT '文件大小',
  `SOFTWARE_LANGUAGE` varchar(255) DEFAULT NULL COMMENT '软件语言',
  `SUIT_PLAT` varchar(255) DEFAULT NULL COMMENT '适用平台',
  `APPLICATION_BROWSER` varchar(255) DEFAULT NULL COMMENT '应用浏览器',
  `PLAT_RUNREQUIRE` varchar(4000) DEFAULT NULL COMMENT '平台运行要求',
  `PLAT_CREATEBY` varchar(50) DEFAULT NULL COMMENT '发布人',
  `PLAT_CREATEDATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `PLAT_CREATEORGID` varchar(50) DEFAULT NULL COMMENT '管理部门（登录时单位）',
  `PLAT_CREATEORGNAME` varchar(255) DEFAULT NULL COMMENT '管理部门名称',
  `PLAT_TYPE` int(1) DEFAULT NULL COMMENT '平台类型0c# 1 go语言',
  `PLAT_ROLEID` varchar(50) DEFAULT NULL COMMENT '所属角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_platform
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_platform_detail
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_platform_detail`;
CREATE TABLE `ts_store_platform_detail` (
  `PLAT_DETAIL_ID` varchar(50) DEFAULT NULL COMMENT '主键',
  `PLAT_ID` varchar(50) DEFAULT NULL COMMENT '平台ID',
  `FILE_NAME` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `FILE_TYPE` varchar(255) DEFAULT NULL COMMENT '文件类型(0程序1文档)',
  `FILE_URL` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `FILE_SIZE` double DEFAULT NULL COMMENT '文件大小',
  `CREATER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_platform_detail
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_project
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_project`;
CREATE TABLE `ts_store_project` (
  `PROJECT_ID` varchar(50) DEFAULT NULL COMMENT '项目ID',
  `PROJECT_CODE` varchar(50) DEFAULT NULL COMMENT '项目编码',
  `PROJECT_NAME` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `PROJECT_PARTYA_ID` varchar(50) DEFAULT NULL COMMENT '甲方单位ID',
  `PROJECT_PARTYA_CODE` varchar(50) DEFAULT NULL COMMENT '甲方单位编码',
  `PROJECT_PARTYA_NAME` varchar(255) DEFAULT NULL COMMENT '甲方单位名称',
  `PROJECT_PARTYB_ID` varchar(50) DEFAULT NULL COMMENT '乙方单位ID',
  `PROJECT_PARTYB_CODE` varchar(50) DEFAULT NULL COMMENT '乙方单位编码',
  `PROJECT_PARTYB_NAME` varchar(255) DEFAULT NULL COMMENT '乙方单位名称',
  `PROJECT_AMOUNT` double DEFAULT NULL COMMENT '项目金额',
  `PROJECT_FORM` varchar(255) DEFAULT NULL COMMENT '项目形式',
  `PROJECT_SETDATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '立项时间',
  `PROJECT_CONTRACTDATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '合同签订时间',
  `PROJECT_CHECKDATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '计划验收时间',
  `PROJECT_URL` varchar(255) DEFAULT NULL COMMENT '项目地址',
  `PROJECT_ISONLINE` int(1) DEFAULT NULL COMMENT '(0否1是)',
  `CONTACT_PARTYA_NAME` varchar(50) DEFAULT NULL COMMENT '甲方联系人姓名',
  `CONTACT_PARTYA_PHONE` varchar(50) DEFAULT NULL COMMENT '甲方联系电话',
  `CONTACT_PARTYB_NAME` varchar(50) DEFAULT NULL COMMENT '乙方联系人姓名',
  `CONTACT_PARTYB_PHONE` varchar(50) DEFAULT NULL COMMENT '乙方联系人电话',
  `PROJECT_CREATEBY` varchar(255) DEFAULT NULL COMMENT '创建人',
  `PROJECT_CREATEDATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_project
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_service
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_service`;
CREATE TABLE `ts_store_service` (
  `SERVICE_ID` varchar(50) DEFAULT NULL COMMENT '组件ID',
  `SERVICE_CODE` varchar(50) DEFAULT NULL COMMENT '组件编号',
  `SERVICE_NAME` varchar(255) DEFAULT NULL COMMENT '组件名称',
  `REQUEST_METHOD` varchar(255) DEFAULT NULL COMMENT '请求方式',
  `SERVICE_CONTENT` varchar(4000) DEFAULT NULL COMMENT '组件说明',
  `SERVICE_TIMES` int(11) DEFAULT NULL COMMENT '调用次数(审核通过时候记录)',
  `MANAGE_ORG_ID` varchar(50) DEFAULT NULL COMMENT '管理部门',
  `MANAGE_TEL` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `MANAGE_ROLE_ID` int(11) DEFAULT NULL COMMENT '管理角色ID',
  `CREATER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `SUIT_PLAT` varchar(255) DEFAULT NULL COMMENT '适用平台',
  `SERVICE_URL` varchar(500) DEFAULT NULL COMMENT '服务地址',
  `DATA_FORMAT` varchar(255) DEFAULT NULL COMMENT '数据格式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_service
-- ----------------------------

-- ----------------------------
-- Table structure for ts_store_service_detail
-- ----------------------------
DROP TABLE IF EXISTS `ts_store_service_detail`;
CREATE TABLE `ts_store_service_detail` (
  `SERVICE_DETAIL_ID` varchar(50) DEFAULT NULL COMMENT '组件详情ID',
  `SERVICE_ID` varchar(50) DEFAULT NULL COMMENT '组件ID',
  `FILE_NAME` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `FILE_TYPE` int(1) DEFAULT NULL COMMENT '文件类型(0程序1文档)',
  `FILE_URL` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `FILE_SIZE` double DEFAULT NULL COMMENT '文件大小',
  `CREATER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_store_service_detail
-- ----------------------------

-- ----------------------------
-- Table structure for ts_uidp_accesstoken
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_accesstoken`;
CREATE TABLE `ts_uidp_accesstoken` (
  `USER_ID` varchar(50) DEFAULT NULL,
  `ACCESS_TOKEN` varchar(100) DEFAULT NULL,
  `EXPIRED_TIME` datetime DEFAULT NULL COMMENT 'yyyy-mm-dd:hh:mm:ss',
  KEY `idx_accesstoken` (`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用于存储每个用户登录成功之后的票据（加密串）';

-- ----------------------------
-- Records of ts_uidp_accesstoken
-- ----------------------------
INSERT INTO `ts_uidp_accesstoken` VALUES ('e0ff3b1e-1ec4-4c06-8b14-97f518731469', 'xzhGWuHAuheeIV7NteZOc7Ha4kb24a030spyCz9lo5VWLmByXEdpZmMMv83QP6k/XeFzuA7qSNI=', '2018-08-20 14:27:54');
INSERT INTO `ts_uidp_accesstoken` VALUES ('2a474344-0d65-48a4-8735-b8a2371160d4', 'lhYLF2bHMgG5c8GP/14qQyRyE9fvOAJJY4OsT0c337U6ZTiYtN6lFFioZshpLkZ1dt5ZIbM1B68=', '2018-08-20 18:11:23');
INSERT INTO `ts_uidp_accesstoken` VALUES ('STOREAdmin1', '5yROCbkt3c96lktrbF3XLneFsnIGkMICGeUMONIdi0s=', '2018-08-21 11:32:12');

-- ----------------------------
-- Table structure for ts_uidp_config
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_config`;
CREATE TABLE `ts_uidp_config` (
  `CONF_CODE` varchar(30) DEFAULT NULL,
  `CONF_VALUE` varchar(30) DEFAULT NULL,
  `CONF_NAME` varchar(60) DEFAULT NULL,
  UNIQUE KEY `idx_configinfo` (`CONF_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='记录平台中的基本配置信息';

-- ----------------------------
-- Records of ts_uidp_config
-- ----------------------------
INSERT INTO `ts_uidp_config` VALUES ('Admin_Code', 'STOREAdmin1', '系统超级管理员账号');
INSERT INTO `ts_uidp_config` VALUES ('Admin_Password', 'STOREAdmin', '系统超级管理员密码');
INSERT INTO `ts_uidp_config` VALUES ('Plat_Code', 'STORE', '平台代号');
INSERT INTO `ts_uidp_config` VALUES ('CopyRight', '大港油田信息中心', '版权');
INSERT INTO `ts_uidp_config` VALUES ('Version', '1.0', '平台版本');
INSERT INTO `ts_uidp_config` VALUES ('UIDP_URL', 'http://localhost:9527/', '平台URL地址');
INSERT INTO `ts_uidp_config` VALUES ('AD_FLAG', '1', '是否需要AD认证0：不需要认证1：需要认证');
INSERT INTO `ts_uidp_config` VALUES ('SYS_NAME', '大港油田软件研发', '');
INSERT INTO `ts_uidp_config` VALUES ('PTR_IDENT', 'true', 'PTR认证');
INSERT INTO `ts_uidp_config` VALUES ('LOCAL_IDENT', 'true', '本地认证');
INSERT INTO `ts_uidp_config` VALUES ('CLOUD_ORG', 'false', '使用云组织机构');
INSERT INTO `ts_uidp_config` VALUES ('SERVER_IP', 'localhost', '服务器IP');
INSERT INTO `ts_uidp_config` VALUES ('SERVER_PORT', '12345', '端口号');

-- ----------------------------
-- Table structure for ts_uidp_demo
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_demo`;
CREATE TABLE `ts_uidp_demo` (
  `ID` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_uidp_demo
-- ----------------------------
INSERT INTO `ts_uidp_demo` VALUES ('asf', 'sadf', '3', '2018-09-09 00:00:00');

-- ----------------------------
-- Table structure for ts_uidp_groupinfo
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_groupinfo`;
CREATE TABLE `ts_uidp_groupinfo` (
  `SYS_CODE` varchar(50) DEFAULT NULL COMMENT '不同的系统下权限组不同',
  `GROUP_ID` varchar(50) DEFAULT NULL,
  `GROUP_CODE` varchar(50) DEFAULT NULL,
  `GROUP_NAME` varchar(50) DEFAULT NULL,
  `GROUP_CODE_UPPER` varchar(50) DEFAULT NULL,
  `REMARK` varchar(120) DEFAULT NULL,
  UNIQUE KEY `idx_groupinfo` (`SYS_CODE`,`GROUP_ID`,`GROUP_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='记录系统所拥有的所有权限组';

-- ----------------------------
-- Records of ts_uidp_groupinfo
-- ----------------------------
INSERT INTO `ts_uidp_groupinfo` VALUES ('1', '60TN4L64V4V2FNFVJFLNFN6460Z6', 'xtgly', '系统管理员', '', '');
INSERT INTO `ts_uidp_groupinfo` VALUES ('1', '00F66R8PDF44JHP8VBZ44J6PHB48', 'HZDWGLY', '合作单位管理员', '', '');

-- ----------------------------
-- Table structure for ts_uidp_group_powerinfo
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_group_powerinfo`;
CREATE TABLE `ts_uidp_group_powerinfo` (
  `GROUP_ID` varchar(50) DEFAULT NULL,
  `MENU_ID` varchar(50) DEFAULT NULL,
  UNIQUE KEY `Idx_group_powerinfo` (`GROUP_ID`,`MENU_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='记录当前系统下的组权限';

-- ----------------------------
-- Records of ts_uidp_group_powerinfo
-- ----------------------------
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('00F66R8PDF44JHP8VBZ44J6PHB48', '760e7a50-aca4-4f61-a2f9-8fc03405d902');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('00F66R8PDF44JHP8VBZ44J6PHB48', 'bea318e1-bb0f-4294-ab2a-2f22608df3a7');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '00228ef5-a965-4619-8625-5011eeb392b2');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '3376d17f-df6d-438e-9488-805b128151f8');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '35f874b0-0fef-418b-9a5e-526e1136224e');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '4ed1848c-6cdd-41dc-88ea-216f3a8283a9');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '63fb321b-73b2-4e90-98f7-09ab908e4e90');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '69bb15b6-feea-442f-8167-b2796b65ce57');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '6abe3874-437e-4b74-bc58-87a58e80b7f8');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '6b773e53-3f3c-4f58-8e89-86a5e223aca5');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '6bfddf5f-9d42-48ad-8184-f67971fc1e0f');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '6faadefc-97a2-4bcf-9916-5ad0d10bf242');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '760e7a50-aca4-4f61-a2f9-8fc03405d902');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '7bea31cc-e041-4041-a64f-e74cd2f86e3c');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', 'a10b6ea1-2cae-4176-b8c3-17ffe631d417');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', 'a5daab82-ed7a-4895-bbd2-dcb150e19d54');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', 'bea318e1-bb0f-4294-ab2a-2f22608df3a7');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', 'dd901286-d7ba-4c3b-b75a-84c0edc42eff');
INSERT INTO `ts_uidp_group_powerinfo` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', 'f0986eb1-d281-4d40-859e-619bf82d74d5');

-- ----------------------------
-- Table structure for ts_uidp_group_user
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_group_user`;
CREATE TABLE `ts_uidp_group_user` (
  `GROUP_ID` varchar(50) DEFAULT NULL,
  `USER_ID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ts_uidp_group_user
-- ----------------------------
INSERT INTO `ts_uidp_group_user` VALUES ('00F66R8PDF44JHP8VBZ44J6PHB48', 'e0ff3b1e-1ec4-4c06-8b14-97f518731469');
INSERT INTO `ts_uidp_group_user` VALUES ('60TN4L64V4V2FNFVJFLNFN6460Z6', '2a474344-0d65-48a4-8735-b8a2371160d4');

-- ----------------------------
-- Table structure for ts_uidp_loginfo
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_loginfo`;
CREATE TABLE `ts_uidp_loginfo` (
  `ACCESS_TIME` datetime DEFAULT NULL COMMENT '格式：yyyy-mm-dd:hh:mm:ss',
  `USER_ID` varchar(50) DEFAULT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `IP_ADDR` varchar(20) DEFAULT NULL,
  `LOG_TYPE` int(11) DEFAULT NULL COMMENT 'API调用/异常/登录',
  `ALARM_LEVEL` int(11) DEFAULT NULL,
  `LOG_CONTENT` varchar(200) DEFAULT NULL,
  `REMARK` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='记录系统的所有日志信息';

-- ----------------------------
-- Records of ts_uidp_loginfo
-- ----------------------------

-- ----------------------------
-- Table structure for ts_uidp_login_user
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_login_user`;
CREATE TABLE `ts_uidp_login_user` (
  `LOGIN_ID` varchar(50) DEFAULT NULL,
  `USER_ID` varchar(50) DEFAULT NULL,
  UNIQUE KEY `Idx_login_user` (`LOGIN_ID`,`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='记录当前当前登录账号与用户之间的关联关系';

-- ----------------------------
-- Records of ts_uidp_login_user
-- ----------------------------

-- ----------------------------
-- Table structure for ts_uidp_menuinfo
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_menuinfo`;
CREATE TABLE `ts_uidp_menuinfo` (
  `SYS_CODE` varchar(20) DEFAULT NULL,
  `MENU_ID` varchar(50) DEFAULT NULL,
  `MENU_NAME` varchar(30) DEFAULT NULL,
  `MENU_ID_UPPER` varchar(50) DEFAULT NULL,
  `MENU_ICON` text,
  `MODULE_URL` text,
  `MODULE_ROUTE` varchar(100) DEFAULT NULL,
  `MODULE_OBJ` varchar(30) DEFAULT NULL,
  `MENU_PROP` char(1) DEFAULT NULL COMMENT '时候显示（0：不显示；1：显示）',
  `MENU_ORDER` int(11) DEFAULT NULL,
  UNIQUE KEY `idx_menuinfo` (`SYS_CODE`,`MENU_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='记录平台所有系统的菜单信息';

-- ----------------------------
-- Records of ts_uidp_menuinfo
-- ----------------------------
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '3376d17f-df6d-438e-9488-805b128151f8', '用户管理', '', 'peoples', 'frame_src/views/userinfoViews', '/userinfoViews', '', '1', '3');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '6b773e53-3f3c-4f58-8e89-86a5e223aca5', '系统配置', '', 'documentation', 'frame_src/views/uidpConfigViews', '/uidpConfigViews', '', '1', '6');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '6abe3874-437e-4b74-bc58-87a58e80b7f8', '用户维护', '3376d17f-df6d-438e-9488-805b128151f8', 'user', 'frame_src/views/userinfoViews/', 'user-manager', 'userManager', '1', '0');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', 'dd901286-d7ba-4c3b-b75a-84c0edc42eff', '参数配置', '6b773e53-3f3c-4f58-8e89-86a5e223aca5', 'documentation', 'frame_src/views/uidpConfigViews/', 'uidp-config-manager', 'uidpConfigManager', '1', '0');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '4ed1848c-6cdd-41dc-88ea-216f3a8283a9', '角色管理', '35f874b0-0fef-418b-9a5e-526e1136224e', 'example', 'frame_src/views/roleViews/', 'role-manager', 'roleManager', '1', '1');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', 'a5daab82-ed7a-4895-bbd2-dcb150e19d54', '用户授权', '35f874b0-0fef-418b-9a5e-526e1136224e', 'password', 'frame_src/views/roleViews/', 'role-user-manager', 'roleUserManager', '1', '3');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', 'a10b6ea1-2cae-4176-b8c3-17ffe631d417', '菜单管理', '35f874b0-0fef-418b-9a5e-526e1136224e', 'form', 'frame_src/views/menu/', 'menu-manager', 'menuManager', '1', '0');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '63fb321b-73b2-4e90-98f7-09ab908e4e90', '角色授权', '35f874b0-0fef-418b-9a5e-526e1136224e', 'excel', 'frame_src/views/menu/', 'menu-permission-manager', 'menuPermissionManager', '1', '2');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', 'f0986eb1-d281-4d40-859e-619bf82d74d5', '组织机构管理', '', 'component', 'frame_src/views/orgViews', '/orgViews', '', '1', '2');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '6faadefc-97a2-4bcf-9916-5ad0d10bf242', '组织机构维护', 'f0986eb1-d281-4d40-859e-619bf82d74d5', 'table', 'frame_src/views/orgViews/', 'org-manager', 'orgManager', '1', '0');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '7bea31cc-e041-4041-a64f-e74cd2f86e3c', '用户日志', '', 'documentation', 'frame_src/views/logInfoViews', '/logInfoViews', '', '1', '5');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '00228ef5-a965-4619-8625-5011eeb392b2', '日志查看', '7bea31cc-e041-4041-a64f-e74cd2f86e3c', 'zip', 'frame_src/views/logInfoViews/', 'log-info-manager', 'logInfoManager', '1', '0');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '45edc00b-b19d-42ae-b45a-5cbb62fb43bc', '初始化配置', '6b773e53-3f3c-4f58-8e89-86a5e223aca5', 'fa fa-cutlery', 'frame_src/views/uidpConfigViews/', 'init-config-manager', 'initConfigManager', '0', '1');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '69bb15b6-feea-442f-8167-b2796b65ce57', '云配置管理', '', 'drag', 'frame_src/views/uidpSynchroConfig', '/uidpSynchroConfig', '', '1', '1');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '6bfddf5f-9d42-48ad-8184-f67971fc1e0f', '云组织机构', '69bb15b6-feea-442f-8167-b2796b65ce57', 'documentation', 'frame_src/views/uidpSynchroConfig/', 'Synchro-config', 'SynchroConfig', '1', '0');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '35f874b0-0fef-418b-9a5e-526e1136224e', '权限管理', null, 'documentation', 'frame_src/views/menu', '/menu', null, '1', '4');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '0fea0012-b259-43b9-9c49-1a993cf3defa', '修改密码', '3376d17f-df6d-438e-9488-805b128151f8', 'people', 'frame_src/views/userinfoViews/', 'user-password-manager', 'userPasswordManager', '0', '1');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '69bb15b6-feea-442f-8167-b2796b65ce58', '新模块', null, 'drag', null, '/new_table_route', null, '1', '7');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '6bfddf5fw-9d42-48ad-8184-f67971fc1e0f', '增加新功能1', '69bb15b6-feea-442f-8167-b2796b65ce58', 'documentation', 'app_src/views/', 'new_table_route1', 'test1', '1', '1');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '94e96e10-14bf-4619-aeb0-d8f42840fbd2', '新模块测试1', '69bb15b6-feea-442f-8167-b2796b65ce58', 'example', 'app_src/views/', 'new_module1', 'test', '1', '2');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', 'bea318e1-bb0f-4294-ab2a-2f22608df3a7', '公告管理', '', 'form', 'frame_src/views/noticeViews', '/noticeViews', '', '1', '0');
INSERT INTO `ts_uidp_menuinfo` VALUES ('1', '760e7a50-aca4-4f61-a2f9-8fc03405d902', '公告维护', 'bea318e1-bb0f-4294-ab2a-2f22608df3a7', 'drag', 'frame_src/views/noticeViews/', 'notice-maneger', 'noticeManager', '1', '0');

-- ----------------------------
-- Table structure for ts_uidp_org
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_org`;
CREATE TABLE `ts_uidp_org` (
  `ORG_ID` varchar(50) DEFAULT NULL COMMENT '主键',
  `ORG_CODE` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `ORG_NAME` varchar(255) DEFAULT NULL COMMENT '全称',
  `ORG_SHORT_NAME` varchar(255) DEFAULT NULL COMMENT '简称',
  `ORG_CODE_UPPER` varchar(50) DEFAULT NULL COMMENT '父级code',
  `PHONE` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `ISINVALID` char(1) DEFAULT NULL COMMENT '是否有效',
  `ISDELETE` char(1) DEFAULT NULL COMMENT '是否删除',
  `REMARK` varchar(120) DEFAULT NULL COMMENT '备注',
  `ORG_ID_UPPER` varchar(50) DEFAULT NULL COMMENT '父ID',
  UNIQUE KEY `idx_orginfo` (`ORG_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定义组织机构的信息';

-- ----------------------------
-- Records of ts_uidp_org
-- ----------------------------
INSERT INTO `ts_uidp_org` VALUES ('84e9a85d-38d2-461e-9e2b-b128bb9e188c', '100', '大港油田公司', '大港油田公司', '', null, '1', '1', '', null);
INSERT INTO `ts_uidp_org` VALUES ('227b3788-e176-4d05-ac2c-b0ad32f6ab5e', '100001', '大港油田公司机关处室及附属', '机关处室及附属', '100', null, '1', '1', '', '84e9a85d-38d2-461e-9e2b-b128bb9e188c');
INSERT INTO `ts_uidp_org` VALUES ('64505070-f16e-48b1-bf70-ce7eb3571cc2', '100001001', '大港油田公司机关处室及附属公司领导', '公司领导', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('3bd1cc97-6665-4953-8f50-c6db692a7670', '100001002', '大港油田公司机关处室及附属总经理助理', '总经理助理', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('8bdb6bd7-2862-4b0c-883a-d0b14767e173', '100001003', '大港油田公司机关处室及附属一级技术专家（资深专家）', '一级技术专家（资深专家）', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('ec139d9e-2c2e-4670-8a68-68bcdd45e24a', '100001004', '大港油田公司机关处室及附属总经理办公室（党委办公室）', '总经理办公室（党委办公室）', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('9ca6f0d1-7868-452b-9ac1-cd5efd8aa274', '100001004001', '大港油田公司机关处室及附属总经理办公室（党委办公室）部门领导', '部门领导', '100001004', null, '1', '1', '', 'ec139d9e-2c2e-4670-8a68-68bcdd45e24a');
INSERT INTO `ts_uidp_org` VALUES ('03ff350c-3083-4119-b78d-657f214ff7da', '100001004002', '大港油田公司机关处室及附属总经理办公室（党委办公室）秘书一科', '秘书一科', '100001004', null, '1', '1', '', 'ec139d9e-2c2e-4670-8a68-68bcdd45e24a');
INSERT INTO `ts_uidp_org` VALUES ('a10674d0-7b36-404d-823e-c6a7b1d140c7', '100001004003', '大港油田公司机关处室及附属总经理办公室（党委办公室）秘书二科', '秘书二科', '100001004', null, '1', '1', '', 'ec139d9e-2c2e-4670-8a68-68bcdd45e24a');
INSERT INTO `ts_uidp_org` VALUES ('6eb26e30-8f87-40d9-9005-a7fa85f86cb0', '100001004004', '大港油田公司机关处室及附属总经理办公室（党委办公室）文书科', '文书科', '100001004', null, '1', '1', '', 'ec139d9e-2c2e-4670-8a68-68bcdd45e24a');
INSERT INTO `ts_uidp_org` VALUES ('37aa221c-9103-445a-90e2-eff81c203bf7', '100001004005', '大港油田公司机关处室及附属总经理办公室（党委办公室）督办综合科', '督办综合科', '100001004', null, '1', '1', '', 'ec139d9e-2c2e-4670-8a68-68bcdd45e24a');
INSERT INTO `ts_uidp_org` VALUES ('d3caa8d6-4d3a-4b76-bff9-60eb1d846436', '100001004006', '大港油田公司机关处室及附属总经理办公室（党委办公室）外事管理科', '外事管理科', '100001004', null, '1', '1', '', 'ec139d9e-2c2e-4670-8a68-68bcdd45e24a');
INSERT INTO `ts_uidp_org` VALUES ('6ae79f79-344b-4734-96a7-0de44c14a7c3', '100001004007', '大港油田公司机关处室及附属总经理办公室（党委办公室）行政事务科', '行政事务科', '100001004', null, '1', '1', '', 'ec139d9e-2c2e-4670-8a68-68bcdd45e24a');
INSERT INTO `ts_uidp_org` VALUES ('bd08e6ac-2945-4517-8a63-0bbdf6285bfa', '100001004008', '大港油田公司机关处室及附属总经理办公室（党委办公室）档案中心', '档案中心', '100001004', null, '1', '1', '', 'ec139d9e-2c2e-4670-8a68-68bcdd45e24a');
INSERT INTO `ts_uidp_org` VALUES ('3ef119b0-d840-4d32-9251-db612bb0c7a8', '100001004009', '大港油田公司机关处室及附属总经理办公室（党委办公室）其他人员', '其他人员', '100001004', null, '1', '1', '', 'ec139d9e-2c2e-4670-8a68-68bcdd45e24a');
INSERT INTO `ts_uidp_org` VALUES ('672fd822-2f5a-4f3f-b4bc-29073385920f', '100001005', '大港油田公司机关处室及附属规划计划处', '规划计划处', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('e79f9f62-cc4c-43cd-8374-064fa517c7c6', '100001005001', '大港油田公司机关处室及附属规划计划处部门领导', '部门领导', '100001005', null, '1', '1', '', '672fd822-2f5a-4f3f-b4bc-29073385920f');
INSERT INTO `ts_uidp_org` VALUES ('80d32f54-d2ef-4a03-a649-785869ddb510', '100001005002', '大港油田公司机关处室及附属规划计划处综合评价科', '综合评价科', '100001005', null, '1', '1', '', '672fd822-2f5a-4f3f-b4bc-29073385920f');
INSERT INTO `ts_uidp_org` VALUES ('064bba6f-1c61-4e79-b939-1a903fb9b553', '100001005003', '大港油田公司机关处室及附属规划计划处规划项目科', '规划项目科', '100001005', null, '1', '1', '', '672fd822-2f5a-4f3f-b4bc-29073385920f');
INSERT INTO `ts_uidp_org` VALUES ('819adeb1-29d8-485f-824e-59b09feb1ffd', '100001005004', '大港油田公司机关处室及附属规划计划处投资计划科', '投资计划科', '100001005', null, '1', '1', '', '672fd822-2f5a-4f3f-b4bc-29073385920f');
INSERT INTO `ts_uidp_org` VALUES ('5ac333c7-3e7a-4cdc-9a93-fd6f87b40059', '100001005005', '大港油田公司机关处室及附属规划计划处生产计划科', '生产计划科', '100001005', null, '1', '1', '', '672fd822-2f5a-4f3f-b4bc-29073385920f');
INSERT INTO `ts_uidp_org` VALUES ('0b920feb-c484-4b90-b4a8-1ffb3099c046', '100001005006', '大港油田公司机关处室及附属规划计划处经营统计科', '经营统计科', '100001005', null, '1', '1', '', '672fd822-2f5a-4f3f-b4bc-29073385920f');
INSERT INTO `ts_uidp_org` VALUES ('c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49', '100001006', '大港油田公司机关处室及附属财务处', '财务处', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('b89fa00f-3896-49ab-bcf1-38d35d5767f1', '100001006001', '大港油田公司机关处室及附属财务处处领导', '处领导', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('16a4db68-66a7-42b7-bf58-69a6a3768420', '100001006002', '大港油田公司机关处室及附属财务处综合科', '综合科', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('88e8683d-943f-42c4-9182-f3760c0b1272', '100001006003', '大港油田公司机关处室及附属财务处资金管理科', '资金管理科', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('2ba128a1-ecd5-4bc4-8388-54f703f806cd', '100001006004', '大港油田公司机关处室及附属财务处会计核算一科', '会计核算一科', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('9a15301c-0b7e-4ad2-93a3-01883576d586', '100001006005', '大港油田公司机关处室及附属财务处会计核算二科', '会计核算二科', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('f1c54f25-1687-4b59-acba-e1120aed73b7', '100001006006', '大港油田公司机关处室及附属财务处投资管理科', '投资管理科', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('5992177e-6892-48f7-a44b-04b8ed7183dc', '100001006007', '大港油田公司机关处室及附属财务处成本管理科', '成本管理科', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('cfee9fa6-251f-4df8-9b33-d947ae50875b', '100001006008', '大港油田公司机关处室及附属财务处资产管理科', '资产管理科', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('e8ab3a67-149b-4181-8395-f29ae7c1dc94', '100001006009', '大港油田公司机关处室及附属财务处税务价格科', '税务价格科', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('4d97e193-60d1-4103-a284-f066e56c74d1', '100001006010', '大港油田公司机关处室及附属财务处机关财务科', '机关财务科', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('a32464e4-d94d-4938-bf4d-06e699de98fa', '100001006011', '大港油田公司机关处室及附属财务处稽查科', '稽查科', '100001006', null, '1', '1', '', 'c8a6baa9-5c5a-48fa-b4a9-d5144db9cf49');
INSERT INTO `ts_uidp_org` VALUES ('fed0dc9b-5891-4d47-9947-bdc4e22e4e7b', '100001007', '大港油田公司机关处室及附属人事处（党委组织部）', '人事处（党委组织部）', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('25d480e2-7d5e-4bf6-a6d7-e65492f37419', '100001007001', '大港油田公司机关处室及附属人事处（党委组织部）部门领导', '部门领导', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('c22893a7-0a72-4d28-bc53-5bf23ab2110b', '100001007002', '大港油田公司机关处室及附属人事处（党委组织部）组织机构科', '组织机构科', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('0d50f859-4c2b-468a-b406-beba835741a2', '100001007003', '大港油田公司机关处室及附属人事处（党委组织部）员工管理科', '员工管理科', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('3b2c420b-d598-4478-acaf-e89ba49ef040', '100001007004', '大港油田公司机关处室及附属人事处（党委组织部）薪酬管理科', '薪酬管理科', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('c3a1203e-7f4a-4239-9e2c-9f4129a332da', '100001007005', '大港油田公司机关处室及附属人事处（党委组织部）员工培训科', '员工培训科', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('a8b2ca7f-b97a-4bd2-ad84-229d9ed8629f', '100001007006', '大港油田公司机关处室及附属人事处（党委组织部）专业技术人员管理科', '专业技术人员管理科', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('aa7d1a1f-e152-425b-9d46-23059dd229d6', '100001007007', '大港油田公司机关处室及附属人事处（党委组织部）干部管理科', '干部管理科', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('083f99ed-846e-4c2c-8862-c14673f0ab2a', '100001007008', '大港油田公司机关处室及附属人事处（党委组织部）组织统战科', '组织统战科', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('80e1f404-b336-49e5-b76b-d635c7d6b7e1', '100001007009', '大港油田公司机关处室及附属人事处（党委组织部）人事监督科', '人事监督科', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('79423181-3330-465b-aca6-8b370060fc2d', '100001007010', '大港油田公司机关处室及附属人事处（党委组织部）机关人事科', '机关人事科', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('1ce640c2-833c-45de-ae5a-48a2730e7bdf', '100001007011', '大港油田公司机关处室及附属人事处（党委组织部）综合科', '综合科', '100001007', null, '1', '1', '', 'fed0dc9b-5891-4d47-9947-bdc4e22e4e7b');
INSERT INTO `ts_uidp_org` VALUES ('c6f511a3-bd80-4d77-8036-e53db55848d7', '100001008', '大港油田公司机关处室及附属资源评价处', '资源评价处', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('0e738902-7cbb-4cb0-a8d7-bbed51538e08', '100001008001', '大港油田公司机关处室及附属资源评价处部门领导', '部门领导', '100001008', null, '1', '1', '', 'c6f511a3-bd80-4d77-8036-e53db55848d7');
INSERT INTO `ts_uidp_org` VALUES ('f581e24c-6020-4960-b465-77d6e7f12ba9', '100001008002', '大港油田公司机关处室及附属资源评价处矿权储量科', '矿权储量科', '100001008', null, '1', '1', '', 'c6f511a3-bd80-4d77-8036-e53db55848d7');
INSERT INTO `ts_uidp_org` VALUES ('e4a836b7-51cf-44fd-aa2a-7a7a8e30b3ce', '100001008003', '大港油田公司机关处室及附属资源评价处地球物理科', '地球物理科', '100001008', null, '1', '1', '', 'c6f511a3-bd80-4d77-8036-e53db55848d7');
INSERT INTO `ts_uidp_org` VALUES ('fa300fe2-97ab-4c06-8ad7-24d2b72aea41', '100001008004', '大港油田公司机关处室及附属资源评价处计划方案科', '计划方案科', '100001008', null, '1', '1', '', 'c6f511a3-bd80-4d77-8036-e53db55848d7');
INSERT INTO `ts_uidp_org` VALUES ('310d7306-fdce-4f08-89cf-bc4e088a32b8', '100001008005', '大港油田公司机关处室及附属资源评价处产能评价科', '产能评价科', '100001008', null, '1', '1', '', 'c6f511a3-bd80-4d77-8036-e53db55848d7');
INSERT INTO `ts_uidp_org` VALUES ('cb1a1704-3803-4fc8-8451-26eda268c6f7', '100001009', '大港油田公司机关处室及附属油气开发处', '油气开发处', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('fe0e8bd4-0f5f-4606-bc9b-c64acd017e56', '100001009001', '大港油田公司机关处室及附属油气开发处部门领导', '部门领导', '100001009', null, '1', '1', '', 'cb1a1704-3803-4fc8-8451-26eda268c6f7');
INSERT INTO `ts_uidp_org` VALUES ('6c6b0bac-9a32-4761-ac21-1ad9440cabb3', '100001009002', '大港油田公司机关处室及附属油气开发处技术综合科', '技术综合科', '100001009', null, '1', '1', '', 'cb1a1704-3803-4fc8-8451-26eda268c6f7');
INSERT INTO `ts_uidp_org` VALUES ('f41de452-1de4-449a-876d-50b8d78307ef', '100001009003', '大港油田公司机关处室及附属油气开发处天然气管理科', '天然气管理科', '100001009', null, '1', '1', '', 'cb1a1704-3803-4fc8-8451-26eda268c6f7');
INSERT INTO `ts_uidp_org` VALUES ('2a81f34d-5acc-4e5b-acc6-efd015bc727d', '100001009004', '大港油田公司机关处室及附属油气开发处注水管理科', '注水管理科', '100001009', null, '1', '1', '', 'cb1a1704-3803-4fc8-8451-26eda268c6f7');
INSERT INTO `ts_uidp_org` VALUES ('e6a21a43-e2ae-4604-8ea0-5a437075c413', '100001009005', '大港油田公司机关处室及附属油气开发处油藏管理科', '油藏管理科', '100001009', null, '1', '1', '', 'cb1a1704-3803-4fc8-8451-26eda268c6f7');
INSERT INTO `ts_uidp_org` VALUES ('846f3797-9f26-4eed-adea-494e5dd668a3', '100001009006', '大港油田公司机关处室及附属油气开发处开发方案科', '开发方案科', '100001009', null, '1', '1', '', 'cb1a1704-3803-4fc8-8451-26eda268c6f7');
INSERT INTO `ts_uidp_org` VALUES ('9a36efa1-e71c-4616-b6b1-c87648ee9bbc', '100001010', '大港油田公司机关处室及附属生产运行处', '生产运行处', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('abd0a9ff-285c-4ca1-8aba-89c2ad13ea36', '100001010001', '大港油田公司机关处室及附属生产运行处部门领导', '部门领导', '100001010', null, '1', '1', '', '9a36efa1-e71c-4616-b6b1-c87648ee9bbc');
INSERT INTO `ts_uidp_org` VALUES ('2bb947c4-608a-4dea-9be8-8547344316bb', '100001010002', '大港油田公司机关处室及附属生产运行处生产管理科', '生产管理科', '100001010', null, '1', '1', '', '9a36efa1-e71c-4616-b6b1-c87648ee9bbc');
INSERT INTO `ts_uidp_org` VALUES ('2f99cf1c-8aba-4844-9362-556b5233966b', '100001010003', '大港油田公司机关处室及附属生产运行处生产运行科', '生产运行科', '100001010', null, '1', '1', '', '9a36efa1-e71c-4616-b6b1-c87648ee9bbc');
INSERT INTO `ts_uidp_org` VALUES ('887a2068-0d7c-477f-82eb-072fcb3cfa0a', '100001010004', '大港油田公司机关处室及附属生产运行处水电讯科', '水电讯科', '100001010', null, '1', '1', '', '9a36efa1-e71c-4616-b6b1-c87648ee9bbc');
INSERT INTO `ts_uidp_org` VALUES ('a0e82c67-c793-4f07-915c-e365e7b7cb58', '100001010005', '大港油田公司机关处室及附属生产运行处应急管理科', '应急管理科', '100001010', null, '1', '1', '', '9a36efa1-e71c-4616-b6b1-c87648ee9bbc');
INSERT INTO `ts_uidp_org` VALUES ('8bb8eb64-fab3-4748-b6c1-ae607dd0224d', '100001011', '大港油田公司机关处室及附属工程技术处', '工程技术处', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('fd1e15e1-8fec-459d-9b03-c3d2f3c6b1be', '100001011001', '大港油田公司机关处室及附属工程技术处部门领导', '部门领导', '100001011', null, '1', '1', '', '8bb8eb64-fab3-4748-b6c1-ae607dd0224d');
INSERT INTO `ts_uidp_org` VALUES ('7115d69a-4e3a-4c99-bdb6-ceb2200eedad', '100001011002', '大港油田公司机关处室及附属工程技术处钻井与井控管理科', '钻井与井控管理科', '100001011', null, '1', '1', '', '8bb8eb64-fab3-4748-b6c1-ae607dd0224d');
INSERT INTO `ts_uidp_org` VALUES ('b9410267-35d3-4466-993e-efb3445b9373', '100001011003', '大港油田公司机关处室及附属工程技术处试油作业科', '试油作业科', '100001011', null, '1', '1', '', '8bb8eb64-fab3-4748-b6c1-ae607dd0224d');
INSERT INTO `ts_uidp_org` VALUES ('a95176b1-4a6e-45b6-b38e-440fb09d0610', '100001011004', '大港油田公司机关处室及附属工程技术处注采工艺科', '注采工艺科', '100001011', null, '1', '1', '', '8bb8eb64-fab3-4748-b6c1-ae607dd0224d');
INSERT INTO `ts_uidp_org` VALUES ('94fb8e79-2f56-4896-ba49-76a9a5afb129', '100001011005', '大港油田公司机关处室及附属工程技术处综合科', '综合科', '100001011', null, '1', '1', '', '8bb8eb64-fab3-4748-b6c1-ae607dd0224d');
INSERT INTO `ts_uidp_org` VALUES ('2f4e32a4-0e28-41fa-8b5d-7fa39e0a7d86', '100001012', '大港油田公司机关处室及附属物资装备处', '物资装备处', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('b19fb975-1b3b-46f9-be2c-5ee8bef62886', '100001012001', '大港油田公司机关处室及附属物资装备处部门领导', '部门领导', '100001012', null, '1', '1', '', '2f4e32a4-0e28-41fa-8b5d-7fa39e0a7d86');
INSERT INTO `ts_uidp_org` VALUES ('6220fc4e-64b6-41fb-96cb-c624e167b208', '100001012002', '大港油田公司机关处室及附属物资装备处采购管理科', '采购管理科', '100001012', null, '1', '1', '', '2f4e32a4-0e28-41fa-8b5d-7fa39e0a7d86');
INSERT INTO `ts_uidp_org` VALUES ('06c3893a-4a91-435b-b554-acc4f26b4356', '100001012003', '大港油田公司机关处室及附属物资装备处招投标管理科', '招投标管理科', '100001012', null, '1', '1', '', '2f4e32a4-0e28-41fa-8b5d-7fa39e0a7d86');
INSERT INTO `ts_uidp_org` VALUES ('8635ba85-a4f7-4b1b-87ec-006f09af4eb4', '100001012004', '大港油田公司机关处室及附属物资装备处商务管理科', '商务管理科', '100001012', null, '1', '1', '', '2f4e32a4-0e28-41fa-8b5d-7fa39e0a7d86');
INSERT INTO `ts_uidp_org` VALUES ('cdb1cb5d-e39b-49b1-bca4-3451bf6d51fe', '100001012005', '大港油田公司机关处室及附属物资装备处物资管理科', '物资管理科', '100001012', null, '1', '1', '', '2f4e32a4-0e28-41fa-8b5d-7fa39e0a7d86');
INSERT INTO `ts_uidp_org` VALUES ('84f6bc09-8a0b-4d35-9af9-df45e701de98', '100001012006', '大港油田公司机关处室及附属物资装备处设备管理科', '设备管理科', '100001012', null, '1', '1', '', '2f4e32a4-0e28-41fa-8b5d-7fa39e0a7d86');
INSERT INTO `ts_uidp_org` VALUES ('6c96eebd-69c3-4ea9-aa9c-f5f44df4a28b', '100001012007', '大港油田公司机关处室及附属物资装备处综合科', '综合科', '100001012', null, '1', '1', '', '2f4e32a4-0e28-41fa-8b5d-7fa39e0a7d86');
INSERT INTO `ts_uidp_org` VALUES ('0a47d2d7-3bda-42e7-81ba-b75c9a5fd12d', '100001013', '大港油田公司机关处室及附属质量安全环保处(海洋石油作业安全监督处)', '质量安全环保处(海洋石油作业安全监督处)', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('e938e9f3-5f50-4ed5-906c-40d3d4791825', '100001013001', '大港油田公司机关处室及附属质量安全环保处(海洋石油作业安全监督处)部门领导', '部门领导', '100001013', null, '1', '1', '', '0a47d2d7-3bda-42e7-81ba-b75c9a5fd12d');
INSERT INTO `ts_uidp_org` VALUES ('68b1367b-b65a-455f-9d1b-2aca210e336f', '100001013002', '大港油田公司机关处室及附属质量安全环保处(海洋石油作业安全监督处)安全管理科', '安全管理科', '100001013', null, '1', '1', '', '0a47d2d7-3bda-42e7-81ba-b75c9a5fd12d');
INSERT INTO `ts_uidp_org` VALUES ('adebacfd-7eba-4f69-84ec-66d806dbce38', '100001013003', '大港油田公司机关处室及附属质量安全环保处(海洋石油作业安全监督处)环境保护科', '环境保护科', '100001013', null, '1', '1', '', '0a47d2d7-3bda-42e7-81ba-b75c9a5fd12d');
INSERT INTO `ts_uidp_org` VALUES ('89860ae9-c1fd-4163-95e6-3af73303f0c5', '100001013004', '大港油田公司机关处室及附属质量安全环保处(海洋石油作业安全监督处)交通防火科', '交通防火科', '100001013', null, '1', '1', '', '0a47d2d7-3bda-42e7-81ba-b75c9a5fd12d');
INSERT INTO `ts_uidp_org` VALUES ('7a959541-1488-408f-b15a-661acb7c7d59', '100001013005', '大港油田公司机关处室及附属质量安全环保处(海洋石油作业安全监督处)海洋作业安全管理科', '海洋作业安全管理科', '100001013', null, '1', '1', '', '0a47d2d7-3bda-42e7-81ba-b75c9a5fd12d');
INSERT INTO `ts_uidp_org` VALUES ('aee0343a-b351-4cfe-bd3f-114e947dc33f', '100001013006', '大港油田公司机关处室及附属质量安全环保处(海洋石油作业安全监督处)技术监督科', '技术监督科', '100001013', null, '1', '1', '', '0a47d2d7-3bda-42e7-81ba-b75c9a5fd12d');
INSERT INTO `ts_uidp_org` VALUES ('712723bd-abea-4670-bf64-9c45602cac39', '100001013007', '大港油田公司机关处室及附属质量安全环保处(海洋石油作业安全监督处)节能节水科', '节能节水科', '100001013', null, '1', '1', '', '0a47d2d7-3bda-42e7-81ba-b75c9a5fd12d');
INSERT INTO `ts_uidp_org` VALUES ('3258c5a1-9a91-4294-8986-bb3351d38812', '100001013008', '大港油田公司机关处室及附属质量安全环保处(海洋石油作业安全监督处)综合体系科', '综合体系科', '100001013', null, '1', '1', '', '0a47d2d7-3bda-42e7-81ba-b75c9a5fd12d');
INSERT INTO `ts_uidp_org` VALUES ('a3f11857-bfcb-4e69-935d-e560e641b22f', '100001013009', '大港油田公司机关处室及附属质量安全环保处(海洋石油作业安全监督处)绿色矿山创建办公室', '绿色矿山创建办公室', '100001013', null, '1', '1', '', '0a47d2d7-3bda-42e7-81ba-b75c9a5fd12d');
INSERT INTO `ts_uidp_org` VALUES ('0aa763d7-1421-4fe4-8cef-5cddf8b588d9', '100001014', '大港油田公司机关处室及附属科技信息处', '科技信息处', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('47b96a94-ace3-41e1-9427-53cae1ba46a1', '100001014001', '大港油田公司机关处室及附属科技信息处部门领导', '部门领导', '100001014', null, '1', '1', '', '0aa763d7-1421-4fe4-8cef-5cddf8b588d9');
INSERT INTO `ts_uidp_org` VALUES ('89e1089c-29e9-4bfe-b72d-7374cc3a0814', '100001014002', '大港油田公司机关处室及附属科技信息处综合科', '综合科', '100001014', null, '1', '1', '', '0aa763d7-1421-4fe4-8cef-5cddf8b588d9');
INSERT INTO `ts_uidp_org` VALUES ('880b726d-c755-4495-ad27-3d915b3cf0c4', '100001014003', '大港油田公司机关处室及附属科技信息处项目管理科', '项目管理科', '100001014', null, '1', '1', '', '0aa763d7-1421-4fe4-8cef-5cddf8b588d9');
INSERT INTO `ts_uidp_org` VALUES ('43852631-a718-4877-a4af-6a6e38849be0', '100001014004', '大港油田公司机关处室及附属科技信息处成果管理科', '成果管理科', '100001014', null, '1', '1', '', '0aa763d7-1421-4fe4-8cef-5cddf8b588d9');
INSERT INTO `ts_uidp_org` VALUES ('7ef738b0-ff5c-4d68-a2bd-b79cadc61ee2', '100001014005', '大港油田公司机关处室及附属科技信息处信息管理科', '信息管理科', '100001014', null, '1', '1', '', '0aa763d7-1421-4fe4-8cef-5cddf8b588d9');
INSERT INTO `ts_uidp_org` VALUES ('18fc8d57-8814-42e9-92cf-0f05b3896f36', '100001015', '大港油田公司机关处室及附属企管法规处(内控与风险管理处)', '企管法规处(内控与风险管理处)', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('fe85870a-1723-494c-b230-fe3589421fe5', '100001015001', '大港油田公司机关处室及附属企管法规处(内控与风险管理处)部门领导', '部门领导', '100001015', null, '1', '1', '', '18fc8d57-8814-42e9-92cf-0f05b3896f36');
INSERT INTO `ts_uidp_org` VALUES ('576e9048-5c56-4d60-8035-d364553e98b9', '100001015002', '大港油田公司机关处室及附属企管法规处(内控与风险管理处)企业管理科', '企业管理科', '100001015', null, '1', '1', '', '18fc8d57-8814-42e9-92cf-0f05b3896f36');
INSERT INTO `ts_uidp_org` VALUES ('c1e4c2f6-c21c-4ffb-89e0-33d50713d1e9', '100001015003', '大港油田公司机关处室及附属企管法规处(内控与风险管理处)合同管理科', '合同管理科', '100001015', null, '1', '1', '', '18fc8d57-8814-42e9-92cf-0f05b3896f36');
INSERT INTO `ts_uidp_org` VALUES ('81f3d209-611d-4252-9843-0a1f786a16bb', '100001015004', '大港油田公司机关处室及附属企管法规处(内控与风险管理处)市场管理科', '市场管理科', '100001015', null, '1', '1', '', '18fc8d57-8814-42e9-92cf-0f05b3896f36');
INSERT INTO `ts_uidp_org` VALUES ('50a5606a-f361-4a97-8287-692ad91ca867', '100001015005', '大港油田公司机关处室及附属企管法规处(内控与风险管理处)内控管理科', '内控管理科', '100001015', null, '1', '1', '', '18fc8d57-8814-42e9-92cf-0f05b3896f36');
INSERT INTO `ts_uidp_org` VALUES ('d2af14e3-f27e-45c4-aaa2-43ed1c13fa73', '100001015006', '大港油田公司机关处室及附属企管法规处(内控与风险管理处)经营业绩考核科', '经营业绩考核科', '100001015', null, '1', '1', '', '18fc8d57-8814-42e9-92cf-0f05b3896f36');
INSERT INTO `ts_uidp_org` VALUES ('da4fe52e-38f8-4d96-847a-3b9e2db08a57', '100001015007', '大港油田公司机关处室及附属企管法规处(内控与风险管理处)法律事务科', '法律事务科', '100001015', null, '1', '1', '', '18fc8d57-8814-42e9-92cf-0f05b3896f36');
INSERT INTO `ts_uidp_org` VALUES ('fce55047-0ccc-42e6-b3cd-4ed5a3b1307f', '100001016', '大港油田公司机关处室及附属监察审计处', '监察审计处', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('f441ebee-da70-470b-a383-654c87c1880e', '100001016001', '大港油田公司机关处室及附属监察审计处部门领导', '部门领导', '100001016', null, '1', '1', '', 'fce55047-0ccc-42e6-b3cd-4ed5a3b1307f');
INSERT INTO `ts_uidp_org` VALUES ('5867d226-ae3c-4d5a-914e-badce9260829', '100001016001001', '大港油田公司机关处室及附属监察审计处部门领导巡察办公室', '巡察办公室', '100001016001', null, '1', '1', '', 'f441ebee-da70-470b-a383-654c87c1880e');
INSERT INTO `ts_uidp_org` VALUES ('0efdc62b-a06e-4f7f-8f17-8ec44d8bdc0c', '100001016002', '大港油田公司机关处室及附属监察审计处综合审理科', '综合审理科', '100001016', null, '1', '1', '', 'fce55047-0ccc-42e6-b3cd-4ed5a3b1307f');
INSERT INTO `ts_uidp_org` VALUES ('ef985bf3-fba8-4408-a513-63eead13a963', '100001016003', '大港油田公司机关处室及附属监察审计处信访案件管理科', '信访案件管理科', '100001016', null, '1', '1', '', 'fce55047-0ccc-42e6-b3cd-4ed5a3b1307f');
INSERT INTO `ts_uidp_org` VALUES ('be018029-46e4-4752-899d-95c86c6b6351', '100001016004', '大港油田公司机关处室及附属监察审计处合规管理监察科', '合规管理监察科', '100001016', null, '1', '1', '', 'fce55047-0ccc-42e6-b3cd-4ed5a3b1307f');
INSERT INTO `ts_uidp_org` VALUES ('8467fd4b-c7e9-4d93-9b82-d45bcb1edc9b', '100001016005', '大港油田公司机关处室及附属监察审计处党风监督科', '党风监督科', '100001016', null, '1', '1', '', 'fce55047-0ccc-42e6-b3cd-4ed5a3b1307f');
INSERT INTO `ts_uidp_org` VALUES ('905a80f9-e583-4b8a-b339-1a77e4da8009', '100001016006', '大港油田公司机关处室及附属监察审计处财务审计管理科', '财务审计管理科', '100001016', null, '1', '1', '', 'fce55047-0ccc-42e6-b3cd-4ed5a3b1307f');
INSERT INTO `ts_uidp_org` VALUES ('fae48995-36de-4efa-859f-7455fb2f925b', '100001016007', '大港油田公司机关处室及附属监察审计处工程审计管理科', '工程审计管理科', '100001016', null, '1', '1', '', 'fce55047-0ccc-42e6-b3cd-4ed5a3b1307f');
INSERT INTO `ts_uidp_org` VALUES ('1b0da918-7ad8-4568-b3f8-a5f99c581da2', '100001017', '大港油田公司机关处室及附属企业文化处(党委宣传部、团委)', '企业文化处(党委宣传部、团委)', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('e78cd8e6-1c08-462d-9390-68d17bece681', '100001017001', '大港油田公司机关处室及附属企业文化处(党委宣传部、团委)部门领导', '部门领导', '100001017', null, '1', '1', '', '1b0da918-7ad8-4568-b3f8-a5f99c581da2');
INSERT INTO `ts_uidp_org` VALUES ('075dc9c0-29fb-4471-921c-fce6e0373ed4', '100001017002', '大港油田公司机关处室及附属企业文化处(党委宣传部、团委)基层建设科（企业文化科）', '基层建设科（企业文化科）', '100001017', null, '1', '1', '', '1b0da918-7ad8-4568-b3f8-a5f99c581da2');
INSERT INTO `ts_uidp_org` VALUES ('0443690c-2333-4749-b9fc-f2996528a832', '100001017003', '大港油田公司机关处室及附属企业文化处(党委宣传部、团委)宣传科', '宣传科', '100001017', null, '1', '1', '', '1b0da918-7ad8-4568-b3f8-a5f99c581da2');
INSERT INTO `ts_uidp_org` VALUES ('afa7d860-fc6c-42ab-8a77-74f5a98fcb91', '100001017004', '大港油田公司机关处室及附属企业文化处(党委宣传部、团委)理论教育科', '理论教育科', '100001017', null, '1', '1', '', '1b0da918-7ad8-4568-b3f8-a5f99c581da2');
INSERT INTO `ts_uidp_org` VALUES ('cc3d1180-3b31-4738-9ffe-fdcedce1b14b', '100001017005', '大港油田公司机关处室及附属企业文化处(党委宣传部、团委)团委办公室', '团委办公室', '100001017', null, '1', '1', '', '1b0da918-7ad8-4568-b3f8-a5f99c581da2');
INSERT INTO `ts_uidp_org` VALUES ('80f7543d-e02e-4cab-af9c-4db31cabfeb4', '100001018', '大港油田公司机关处室及附属工会', '工会', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('2756ca00-bfbf-41aa-acba-f563b3fbc858', '100001018001', '大港油田公司机关处室及附属工会部门领导', '部门领导', '100001018', null, '1', '1', '', '80f7543d-e02e-4cab-af9c-4db31cabfeb4');
INSERT INTO `ts_uidp_org` VALUES ('a371712c-0657-4aad-b5c2-de9b5037ede0', '100001018002', '大港油田公司机关处室及附属工会综合办公室', '综合办公室', '100001018', null, '1', '1', '', '80f7543d-e02e-4cab-af9c-4db31cabfeb4');
INSERT INTO `ts_uidp_org` VALUES ('3e349c6b-09ee-4fd9-9870-2db6a1a692a8', '100001018003', '大港油田公司机关处室及附属工会组织宣传部', '组织宣传部', '100001018', null, '1', '1', '', '80f7543d-e02e-4cab-af9c-4db31cabfeb4');
INSERT INTO `ts_uidp_org` VALUES ('41ce3849-0fb8-49d5-beaf-4217297088f0', '100001018004', '大港油田公司机关处室及附属工会经济保护部', '经济保护部', '100001018', null, '1', '1', '', '80f7543d-e02e-4cab-af9c-4db31cabfeb4');
INSERT INTO `ts_uidp_org` VALUES ('c26b8564-74c5-4a7f-9eae-18f811558f36', '100001018005', '大港油田公司机关处室及附属工会权益保障部', '权益保障部', '100001018', null, '1', '1', '', '80f7543d-e02e-4cab-af9c-4db31cabfeb4');
INSERT INTO `ts_uidp_org` VALUES ('fbba8c64-6d10-4978-b715-3dbff5de2930', '100001019', '大港油田公司机关处室及附属维护稳定办公室', '维护稳定办公室', '100001', null, '1', '1', '', '227b3788-e176-4d05-ac2c-b0ad32f6ab5e');
INSERT INTO `ts_uidp_org` VALUES ('20986659-68ae-43b3-948f-eaf6c7471538', '100001019001', '大港油田公司机关处室及附属维护稳定办公室部门领导', '部门领导', '100001019', null, '1', '1', '', 'fbba8c64-6d10-4978-b715-3dbff5de2930');
INSERT INTO `ts_uidp_org` VALUES ('1af1c350-96b9-4e7d-ac52-60bab61b5f72', '100001019002', '大港油田公司机关处室及附属维护稳定办公室协调督办科', '协调督办科', '100001019', null, '1', '1', '', 'fbba8c64-6d10-4978-b715-3dbff5de2930');
INSERT INTO `ts_uidp_org` VALUES ('68b7a9b5-0e69-444a-b8db-ac82587a3e77', '100001019003', '大港油田公司机关处室及附属维护稳定办公室信访接待科', '信访接待科', '100001019', null, '1', '1', '', 'fbba8c64-6d10-4978-b715-3dbff5de2930');
INSERT INTO `ts_uidp_org` VALUES ('207fd5ac-f152-483a-94ae-7cb9352e4cff', '100002', '大港油田公司直属单位', '直属单位', '100', null, '1', '1', '', '84e9a85d-38d2-461e-9e2b-b128bb9e188c');
INSERT INTO `ts_uidp_org` VALUES ('336c7145-94bb-468d-aa3e-d335a803da0e', '100002001', '大港油田公司直属单位勘探事业部', '勘探事业部', '100002', null, '1', '1', '', '207fd5ac-f152-483a-94ae-7cb9352e4cff');
INSERT INTO `ts_uidp_org` VALUES ('ab0509ac-b849-40bf-a9a7-37e0e3104403', '100002001001', '大港油田公司直属单位勘探事业部部门领导', '部门领导', '100002001', null, '1', '1', '', '336c7145-94bb-468d-aa3e-d335a803da0e');
INSERT INTO `ts_uidp_org` VALUES ('733d64da-4975-469d-bf86-9a6a260fb1a6', '100002001002', '大港油田公司直属单位勘探事业部副总师', '副总师', '100002001', null, '1', '1', '', '336c7145-94bb-468d-aa3e-d335a803da0e');
INSERT INTO `ts_uidp_org` VALUES ('1985b95e-2e05-4734-9e63-16bf080e4ef1', '100002001003', '大港油田公司直属单位勘探事业部综合管理科', '综合管理科', '100002001', null, '1', '1', '', '336c7145-94bb-468d-aa3e-d335a803da0e');
INSERT INTO `ts_uidp_org` VALUES ('f04e6f84-ec27-4219-950d-a10200c1b1cb', '100002001004', '大港油田公司直属单位勘探事业部综合方案科', '综合方案科', '100002001', null, '1', '1', '', '336c7145-94bb-468d-aa3e-d335a803da0e');
INSERT INTO `ts_uidp_org` VALUES ('ab1a9eb4-89a5-4afc-abc8-6291c77a3ab4', '100002001005', '大港油田公司直属单位勘探事业部财务经营科', '财务经营科', '100002001', null, '1', '1', '', '336c7145-94bb-468d-aa3e-d335a803da0e');
INSERT INTO `ts_uidp_org` VALUES ('70957f2c-c031-4229-a38c-49ff8c392831', '100002001006', '大港油田公司直属单位勘探事业部地球物理工程科', '地球物理工程科', '100002001', null, '1', '1', '', '336c7145-94bb-468d-aa3e-d335a803da0e');
INSERT INTO `ts_uidp_org` VALUES ('efb416f3-6ed3-4958-973a-dc75d857ec31', '100002001007', '大港油田公司直属单位勘探事业部钻井工程科', '钻井工程科', '100002001', null, '1', '1', '', '336c7145-94bb-468d-aa3e-d335a803da0e');
INSERT INTO `ts_uidp_org` VALUES ('4a27c558-45bf-4843-b05a-0bc336809b5e', '100002001008', '大港油田公司直属单位勘探事业部测录井工程科', '测录井工程科', '100002001', null, '1', '1', '', '336c7145-94bb-468d-aa3e-d335a803da0e');
INSERT INTO `ts_uidp_org` VALUES ('8d87f928-f9dd-498b-8db0-e8583e516841', '100002001009', '大港油田公司直属单位勘探事业部试油工程科', '试油工程科', '100002001', null, '1', '1', '', '336c7145-94bb-468d-aa3e-d335a803da0e');
INSERT INTO `ts_uidp_org` VALUES ('84dac97d-b665-44ad-9fd0-c14363e33269', '100002002', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)', '油气藏评价事业部(油气开发事业部)', '100002', null, '1', '1', '', '207fd5ac-f152-483a-94ae-7cb9352e4cff');
INSERT INTO `ts_uidp_org` VALUES ('645c7688-a379-42f9-93bb-e7e075412996', '100002002001', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)部门领导', '部门领导', '100002002', null, '1', '1', '', '84dac97d-b665-44ad-9fd0-c14363e33269');
INSERT INTO `ts_uidp_org` VALUES ('955be2f6-cecb-45aa-ab6d-2562382b8508', '100002002002', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)副总师', '副总师', '100002002', null, '1', '1', '', '84dac97d-b665-44ad-9fd0-c14363e33269');
INSERT INTO `ts_uidp_org` VALUES ('6bf76988-88e9-4c57-bf59-bf4ff6c3be02', '100002002003', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)专家', '专家', '100002002', null, '1', '1', '', '84dac97d-b665-44ad-9fd0-c14363e33269');
INSERT INTO `ts_uidp_org` VALUES ('2a4f7441-4a35-4f55-808e-c032e0456bac', '100002002004', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)综合管理科', '综合管理科', '100002002', null, '1', '1', '', '84dac97d-b665-44ad-9fd0-c14363e33269');
INSERT INTO `ts_uidp_org` VALUES ('912557e5-f0f5-4320-8b1d-cdaf457dbe9b', '100002002004001', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)综合管理科综合服务', '综合服务', '100002002004', null, '1', '1', '', '2a4f7441-4a35-4f55-808e-c032e0456bac');
INSERT INTO `ts_uidp_org` VALUES ('ab097cbe-3028-4388-b417-193084a03031', '100002002005', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)勘探规划科', '勘探规划科', '100002002', null, '1', '1', '', '84dac97d-b665-44ad-9fd0-c14363e33269');
INSERT INTO `ts_uidp_org` VALUES ('38f7c3a8-5ffb-43f6-8a34-e8f476656c28', '100002002006', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)地质方案科', '地质方案科', '100002002', null, '1', '1', '', '84dac97d-b665-44ad-9fd0-c14363e33269');
INSERT INTO `ts_uidp_org` VALUES ('b6340a78-2060-490d-817f-86d0a5f0a249', '100002002007', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)钻井工程科', '钻井工程科', '100002002', null, '1', '1', '', '84dac97d-b665-44ad-9fd0-c14363e33269');
INSERT INTO `ts_uidp_org` VALUES ('85e0489b-7378-4df7-8a2b-610253190a46', '100002002008', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)试油工程科', '试油工程科', '100002002', null, '1', '1', '', '84dac97d-b665-44ad-9fd0-c14363e33269');
INSERT INTO `ts_uidp_org` VALUES ('8f1a512b-d14c-444b-abb3-4cf1c29e2d9b', '100002002009', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)生产运行科', '生产运行科', '100002002', null, '1', '1', '', '84dac97d-b665-44ad-9fd0-c14363e33269');
INSERT INTO `ts_uidp_org` VALUES ('ea42b417-7280-4914-aa58-97980681bee7', '100002002010', '大港油田公司直属单位油气藏评价事业部(油气开发事业部)财务经营科', '财务经营科', '100002002', null, '1', '1', '', '84dac97d-b665-44ad-9fd0-c14363e33269');
INSERT INTO `ts_uidp_org` VALUES ('9bd81be1-69a5-4c74-aa27-6fc139eb2d3e', '100002003', '大港油田公司直属单位基建工程部', '基建工程部', '100002', null, '1', '1', '', '207fd5ac-f152-483a-94ae-7cb9352e4cff');
INSERT INTO `ts_uidp_org` VALUES ('b33b8a42-d6d7-413d-9237-01ae802be468', '100002003001', '大港油田公司直属单位基建工程部部门领导', '部门领导', '100002003', null, '1', '1', '', '9bd81be1-69a5-4c74-aa27-6fc139eb2d3e');
INSERT INTO `ts_uidp_org` VALUES ('d4ad0d9a-a605-4993-a63e-cbdd23a0261e', '100002003002', '大港油田公司直属单位基建工程部综合管理科', '综合管理科', '100002003', null, '1', '1', '', '9bd81be1-69a5-4c74-aa27-6fc139eb2d3e');
INSERT INTO `ts_uidp_org` VALUES ('63ac0c71-b7f7-413b-a054-4ba1ff6a7685', '100002003003', '大港油田公司直属单位基建工程部地面工艺科', '地面工艺科', '100002003', null, '1', '1', '', '9bd81be1-69a5-4c74-aa27-6fc139eb2d3e');
INSERT INTO `ts_uidp_org` VALUES ('8afe813e-6067-4d93-a2ab-0eb17d2caef6', '100002003004', '大港油田公司直属单位基建工程部工程项目科', '工程项目科', '100002003', null, '1', '1', '', '9bd81be1-69a5-4c74-aa27-6fc139eb2d3e');
INSERT INTO `ts_uidp_org` VALUES ('f90da7e3-9355-4e68-b414-f0760cea2d8b', '100002003005', '大港油田公司直属单位基建工程部建筑工程科', '建筑工程科', '100002003', null, '1', '1', '', '9bd81be1-69a5-4c74-aa27-6fc139eb2d3e');
INSERT INTO `ts_uidp_org` VALUES ('247e5e54-e316-4b9d-9f0f-1830b4275248', '100002003006', '大港油田公司直属单位基建工程部工程质量监督站', '工程质量监督站', '100002003', null, '1', '1', '', '9bd81be1-69a5-4c74-aa27-6fc139eb2d3e');
INSERT INTO `ts_uidp_org` VALUES ('83c9d12f-7f33-45cf-801b-f0c72a28d94c', '100002003007', '大港油田公司直属单位基建工程部管道与站场管理科', '管道与站场管理科', '100002003', null, '1', '1', '', '9bd81be1-69a5-4c74-aa27-6fc139eb2d3e');
INSERT INTO `ts_uidp_org` VALUES ('ff0a7f05-665b-4ba8-968f-1417c2567b78', '100002004', '大港油田公司直属单位土地公路管理部', '土地公路管理部', '100002', null, '1', '1', '', '207fd5ac-f152-483a-94ae-7cb9352e4cff');
INSERT INTO `ts_uidp_org` VALUES ('9678ad3f-0488-4acf-bfd0-145d4b2a6fbd', '100002004001', '大港油田公司直属单位土地公路管理部部门领导', '部门领导', '100002004', null, '1', '1', '', 'ff0a7f05-665b-4ba8-968f-1417c2567b78');
INSERT INTO `ts_uidp_org` VALUES ('ed1be922-e048-4921-91fa-46f3d3268ecc', '100002004002', '大港油田公司直属单位土地公路管理部综合管理科', '综合管理科', '100002004', null, '1', '1', '', 'ff0a7f05-665b-4ba8-968f-1417c2567b78');
INSERT INTO `ts_uidp_org` VALUES ('39eccfe0-79f7-4bb3-85c2-1452ce43062c', '100002004003', '大港油田公司直属单位土地公路管理部土地征用科', '土地征用科', '100002004', null, '1', '1', '', 'ff0a7f05-665b-4ba8-968f-1417c2567b78');
INSERT INTO `ts_uidp_org` VALUES ('43695a51-7a66-408a-9512-daf54cd2afde', '100002004004', '大港油田公司直属单位土地公路管理部土地管理科', '土地管理科', '100002004', null, '1', '1', '', 'ff0a7f05-665b-4ba8-968f-1417c2567b78');
INSERT INTO `ts_uidp_org` VALUES ('0b4aa46a-7b4f-4743-a368-f5dfca2efa06', '100002004005', '大港油田公司直属单位土地公路管理部地籍与公有房屋管理科', '地籍与公有房屋管理科', '100002004', null, '1', '1', '', 'ff0a7f05-665b-4ba8-968f-1417c2567b78');
INSERT INTO `ts_uidp_org` VALUES ('61551476-82b3-49d0-bc11-fed33256aa3a', '100002004006', '大港油田公司直属单位土地公路管理部公路管理科', '公路管理科', '100002004', null, '1', '1', '', 'ff0a7f05-665b-4ba8-968f-1417c2567b78');
INSERT INTO `ts_uidp_org` VALUES ('a0e54bf4-97dd-433f-bd85-ed93af237dd6', '100002005', '大港油田公司直属单位矿区服务事业部', '矿区服务事业部', '100002', null, '1', '1', '', '207fd5ac-f152-483a-94ae-7cb9352e4cff');
INSERT INTO `ts_uidp_org` VALUES ('545f8973-5362-49da-9950-d8f2d7d018d5', '100002005001', '大港油田公司直属单位矿区服务事业部部门领导', '部门领导', '100002005', null, '1', '1', '', 'a0e54bf4-97dd-433f-bd85-ed93af237dd6');
INSERT INTO `ts_uidp_org` VALUES ('813c0735-4edf-4ced-a07e-5ab7bf417e73', '100002005002', '大港油田公司直属单位矿区服务事业部物业管理科', '物业管理科', '100002005', null, '1', '1', '', 'a0e54bf4-97dd-433f-bd85-ed93af237dd6');
INSERT INTO `ts_uidp_org` VALUES ('319c4fbf-ccfb-4fe5-a429-e1b4dac41dac', '100002005003', '大港油田公司直属单位矿区服务事业部市容管理科', '市容管理科', '100002005', null, '1', '1', '', 'a0e54bf4-97dd-433f-bd85-ed93af237dd6');
INSERT INTO `ts_uidp_org` VALUES ('9bd57905-f0c5-498e-8fbf-3773d76a4994', '100002005004', '大港油田公司直属单位矿区服务事业部市政园林科', '市政园林科', '100002005', null, '1', '1', '', 'a0e54bf4-97dd-433f-bd85-ed93af237dd6');
INSERT INTO `ts_uidp_org` VALUES ('c206d6da-5e7e-416f-9aee-f36e26fdbbac', '100002005005', '大港油田公司直属单位矿区服务事业部公益民政科', '公益民政科', '100002005', null, '1', '1', '', 'a0e54bf4-97dd-433f-bd85-ed93af237dd6');
INSERT INTO `ts_uidp_org` VALUES ('931cb429-eaa7-42a7-84b4-5cc7ffb1f557', '100002005006', '大港油田公司直属单位矿区服务事业部卫计管理科', '卫计管理科', '100002005', null, '1', '1', '', 'a0e54bf4-97dd-433f-bd85-ed93af237dd6');
INSERT INTO `ts_uidp_org` VALUES ('a29b8b5e-ac75-49e9-9cc6-8819f7b0cbf4', '100002005007', '大港油田公司直属单位矿区服务事业部住房管理科', '住房管理科', '100002005', null, '1', '1', '', 'a0e54bf4-97dd-433f-bd85-ed93af237dd6');
INSERT INTO `ts_uidp_org` VALUES ('8d34590a-b8af-41b2-88ab-5ddf9d89eec0', '100002005008', '大港油田公司直属单位矿区服务事业部政研信息科', '政研信息科', '100002005', null, '1', '1', '', 'a0e54bf4-97dd-433f-bd85-ed93af237dd6');
INSERT INTO `ts_uidp_org` VALUES ('4ff002d5-b97e-4379-a183-43df29780186', '100002005009', '大港油田公司直属单位矿区服务事业部综合管理科', '综合管理科', '100002005', null, '1', '1', '', 'a0e54bf4-97dd-433f-bd85-ed93af237dd6');
INSERT INTO `ts_uidp_org` VALUES ('c1b6fe38-f991-45f7-9424-76887da7675a', '100003', '大港油田公司所属单位', '所属单位', '100', null, '1', '1', '', '84e9a85d-38d2-461e-9e2b-b128bb9e188c');
INSERT INTO `ts_uidp_org` VALUES ('0ced6c3e-ea4d-4280-9522-cf10566cd182', '100003001', '大港油田公司所属单位勘探开发研究院', '勘探开发研究院', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('df33a281-9454-4e12-8dde-ee5bbc559a6d', '100003001001', '大港油田公司所属单位勘探开发研究院研究院领导', '研究院领导', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('f908e334-ac07-4775-83f3-5a3bc54e3dd9', '100003001002', '大港油田公司所属单位勘探开发研究院院长办公室', '院长办公室', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('6138388c-a528-42df-b5ae-1682c8305514', '100003001003', '大港油田公司所属单位勘探开发研究院党群工作部', '党群工作部', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('a6e86738-2a5f-4bc1-8b16-c0f2197d3086', '100003001004', '大港油田公司所属单位勘探开发研究院科研管理科', '科研管理科', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('38d8c20a-616d-428e-92a5-b2cf5f92cba7', '100003001005', '大港油田公司所属单位勘探开发研究院研究院专家', '研究院专家', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('33518c08-35da-4c97-a086-3b1e4def27f4', '100003001005001', '大港油田公司所属单位勘探开发研究院研究院专家首席专家', '首席专家', '100003001005', null, '1', '1', '', '38d8c20a-616d-428e-92a5-b2cf5f92cba7');
INSERT INTO `ts_uidp_org` VALUES ('9c6e04f6-f552-4681-9fd6-7c4bd5f912d7', '100003001005002', '大港油田公司所属单位勘探开发研究院研究院专家高级专家', '高级专家', '100003001005', null, '1', '1', '', '38d8c20a-616d-428e-92a5-b2cf5f92cba7');
INSERT INTO `ts_uidp_org` VALUES ('2954cc5f-cee9-4c73-b6bb-d1a7acadeeb9', '100003001005003', '大港油田公司所属单位勘探开发研究院研究院专家专家', '专家', '100003001005', null, '1', '1', '', '38d8c20a-616d-428e-92a5-b2cf5f92cba7');
INSERT INTO `ts_uidp_org` VALUES ('616a134e-32e4-47e9-9e1a-abcc3d0894cf', '100003001006', '大港油田公司所属单位勘探开发研究院人事(组织)科', '人事(组织)科', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('1e96a331-0f61-4ba7-b42f-b0ab417f7c5d', '100003001007', '大港油田公司所属单位勘探开发研究院经营财务科', '经营财务科', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('afc07bb8-c5de-44de-826f-0ef5e5358038', '100003001008', '大港油田公司所属单位勘探开发研究院南大港勘探评价研究所', '南大港勘探评价研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('c4fd998c-8152-46b0-97d3-d725bf9933a6', '100003001009', '大港油田公司所属单位勘探开发研究院北大港勘探评价研究所', '北大港勘探评价研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('559f69d0-bd40-4e90-a7c5-b9396126c449', '100003001010', '大港油田公司所属单位勘探开发研究院基础地质研究所', '基础地质研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('271bac9e-ccc2-4854-812e-a4b34c7ff2a6', '100003001011', '大港油田公司所属单位勘探开发研究院勘探评价战略规划研究所', '勘探评价战略规划研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('c4ba28c4-ea20-4d94-a6c4-d245213e36e6', '100003001012', '大港油田公司所属单位勘探开发研究院油气储量研究所', '油气储量研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('8378376a-bc4e-46b4-a016-70dcc9dde3e9', '100003001013', '大港油田公司所属单位勘探开发研究院孔南勘探评价研究所', '孔南勘探评价研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('bf51c8d6-480b-4f50-bcea-96d7cb540685', '100003001014', '大港油田公司所属单位勘探开发研究院信息室', '信息室', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('b55e0f84-3751-4249-891d-c03c6fe942f8', '100003001015', '大港油田公司所属单位勘探开发研究院化验与试验研究所', '化验与试验研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('1b4f9a97-f176-4872-883e-779ab4386747', '100003001016', '大港油田公司所属单位勘探开发研究院技术服务部', '技术服务部', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('a7856b78-ca61-4697-8ece-2328f1f2004e', '100003001017', '大港油田公司所属单位勘探开发研究院孔南油气开发研究所', '孔南油气开发研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('6c5b3880-2412-4498-be81-6a7a9d5f1054', '100003001018', '大港油田公司所属单位勘探开发研究院北大港油气开发研究所', '北大港油气开发研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('fe571df3-e77d-46dd-b5f0-353b9c8dd5e7', '100003001019', '大港油田公司所属单位勘探开发研究院南大港油气开发研究所', '南大港油气开发研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('413a5885-0530-48d8-b1ee-1505402315df', '100003001020', '大港油田公司所属单位勘探开发研究院单井设计研究所', '单井设计研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('e841f432-222d-47a7-bfa8-ea29b4f6ac70', '100003001021', '大港油田公司所属单位勘探开发研究院油气开发战略规划研究所', '油气开发战略规划研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('4acbdc99-b2cd-45ec-9405-e10b5c4c6140', '100003001022', '大港油田公司所属单位勘探开发研究院滩海油气开发研究所', '滩海油气开发研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('fc3ea9a7-02fa-4b69-adf6-8775b5239389', '100003001023', '大港油田公司所属单位勘探开发研究院板桥油气开发研究所', '板桥油气开发研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('6b9a3a06-6778-4297-a1ea-3b12841bc455', '100003001024', '大港油田公司所属单位勘探开发研究院公共事业部', '公共事业部', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('2fb57142-6770-4b03-9aa9-e208606f094b', '100003001025', '大港油田公司所属单位勘探开发研究院对外合作项目研究所', '对外合作项目研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('0b173af3-d06f-480f-805e-a716738aea2a', '100003001026', '大港油田公司所属单位勘探开发研究院科技档案室', '科技档案室', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('1b3ff4fa-dc8b-49ef-a2d9-2fcb74dd1004', '100003001027', '大港油田公司所属单位勘探开发研究院地球物理技术研究所', '地球物理技术研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('86d780d9-dc9e-4c4d-8db1-1fba3e6f75fc', '100003001028', '大港油田公司所属单位勘探开发研究院板桥勘探评价研究所', '板桥勘探评价研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('8ad4d360-f8d1-45e0-85f5-863981edc242', '100003001029', '大港油田公司所属单位勘探开发研究院新区产能评价研究所', '新区产能评价研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('f1b4b5a1-8aa8-4541-8661-79912129489c', '100003001030', '大港油田公司所属单位勘探开发研究院开发方案评价研究所', '开发方案评价研究所', '100003001', null, '1', '1', '', '0ced6c3e-ea4d-4280-9522-cf10566cd182');
INSERT INTO `ts_uidp_org` VALUES ('0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17', '100003002', '大港油田公司所属单位采油工艺研究院', '采油工艺研究院', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('20b6cf7f-412d-4c39-aac8-baad6c69181d', '100003002001', '大港油田公司所属单位采油工艺研究院采油院领导', '采油院领导', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('cf1a5c5b-7e0d-44cb-a125-bb60b906da0f', '100003002002', '大港油田公司所属单位采油工艺研究院院长（党委）办公室', '院长（党委）办公室', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('441a4248-a75a-4ab4-bc72-608832c0ba2b', '100003002003', '大港油田公司所属单位采油工艺研究院人事（组织）科', '人事（组织）科', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('dc6eb735-e9f2-40b3-a9ad-7cc6c8411695', '100003002004', '大港油田公司所属单位采油工艺研究院专家', '专家', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('2990210a-3a79-4433-8d3b-45093b6e7fbf', '100003002005', '大港油田公司所属单位采油工艺研究院科研(安全)管理科', '科研(安全)管理科', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('9acb6b4e-b2c4-468e-9e8f-fa4d9ba213be', '100003002006', '大港油田公司所属单位采油工艺研究院经营财务科', '经营财务科', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('9182de7f-24de-46d4-a672-d725bcd96067', '100003002007', '大港油田公司所属单位采油工艺研究院信息档案室', '信息档案室', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('33e0dbd4-5207-4721-a800-4672f307e972', '100003002008', '大港油田公司所属单位采油工艺研究院钻井工艺所', '钻井工艺所', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('8076aa55-5ca4-4fee-a088-7aefe188b86b', '100003002009', '大港油田公司所属单位采油工艺研究院完井工艺所', '完井工艺所', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('e4e4fe21-b98c-495c-b495-242fa810b8ff', '100003002010', '大港油田公司所属单位采油工艺研究院采油工艺所', '采油工艺所', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('44f1ef55-9056-4805-b1ce-03e803b13f7e', '100003002011', '大港油田公司所属单位采油工艺研究院注水工艺所', '注水工艺所', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('42fac941-3664-4e0b-ac8a-d8f9a65ec0ce', '100003002012', '大港油田公司所属单位采油工艺研究院地面工艺所', '地面工艺所', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('76993426-8aff-4ca3-b4e3-7644c69e1c56', '100003002013', '大港油田公司所属单位采油工艺研究院电气自动化所', '电气自动化所', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('55041705-5dfc-422f-8405-1e1e13f50103', '100003002014', '大港油田公司所属单位采油工艺研究院三次采油所', '三次采油所', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('37b718b6-178d-46e3-996b-f6115241a23b', '100003002015', '大港油田公司所属单位采油工艺研究院地面工程设计所', '地面工程设计所', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('c40277db-95c6-48c1-90df-149c79a829e0', '100003002016', '大港油田公司所属单位采油工艺研究院稠油开采所', '稠油开采所', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('e3b32505-46df-400d-bace-da17f7b9279d', '100003002017', '大港油田公司所属单位采油工艺研究院油田化学所', '油田化学所', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('0cb8984c-bbe1-477b-92ea-e8f5679e6720', '100003002018', '大港油田公司所属单位采油工艺研究院综合服务公司', '综合服务公司', '100003002', null, '1', '1', '', '0ec9ef89-b38d-4bd5-968a-a0f88ca3cd17');
INSERT INTO `ts_uidp_org` VALUES ('c220d081-11d6-4196-9b1f-3f2410903530', '100003003', '大港油田公司所属单位石油工程研究院', '石油工程研究院', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('67d594d0-e70f-43ae-8dbb-691a9ab928ec', '100003003001', '大港油田公司所属单位石油工程研究院院领导', '院领导', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('2bfa0e7c-7a10-41ec-9ccf-554aed7053ff', '100003003002', '大港油田公司所属单位石油工程研究院老领导', '老领导', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('8e9c56d6-0504-4bbd-9baa-16d47d61f8f0', '100003003003', '大港油田公司所属单位石油工程研究院助理副总师技术总监', '助理副总师技术总监', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('f99093bf-2642-41ef-91ee-fd51548801dd', '100003003004', '大港油田公司所属单位石油工程研究院办公室', '办公室', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('2c5eacc3-683a-4942-b1c0-07909c63ed6f', '100003003005', '大港油田公司所属单位石油工程研究院党群工作科', '党群工作科', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('d0def0bc-34f5-49bc-af1f-813f04cefec3', '100003003006', '大港油田公司所属单位石油工程研究院企业管理科', '企业管理科', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('e53e72b1-6ef6-4c93-8595-a101111f9ced', '100003003007', '大港油田公司所属单位石油工程研究院财务资产科', '财务资产科', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('f86f2135-c651-4045-85bd-3e47281e1d5e', '100003003008', '大港油田公司所属单位石油工程研究院人事劳资科', '人事劳资科', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('3742f649-7058-4629-9f5a-5d7ae396485a', '100003003009', '大港油田公司所属单位石油工程研究院科技开发科', '科技开发科', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('ee20b138-ec89-4d77-8a7a-64fafd38e5ea', '100003003010', '大港油田公司所属单位石油工程研究院质量安全环保科', '质量安全环保科', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('1780b5ef-cf0e-476a-82dc-93b6f4b1ffaf', '100003003011', '大港油田公司所属单位石油工程研究院安全监督站', '安全监督站', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('9398a2c5-40cb-4652-aa51-fbca9b89eb42', '100003003012', '大港油田公司所属单位石油工程研究院物资管理中心', '物资管理中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('0362fc06-677a-43c9-a368-333ea5d1c088', '100003003013', '大港油田公司所属单位石油工程研究院油田工程技术支持中心', '油田工程技术支持中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('22551ae2-3884-43d9-834c-7b5139be9cfd', '100003003014', '大港油田公司所属单位石油工程研究院煤层气技术中心', '煤层气技术中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('ea46e542-569b-400b-9658-13e743bc5324', '100003003015', '大港油田公司所属单位石油工程研究院海外采油工程技术中心办公室', '海外采油工程技术中心办公室', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('0256b3f0-d7b4-4e0c-8c13-74c281497009', '100003003016', '大港油田公司所属单位石油工程研究院钻井工程技术服务中心', '钻井工程技术服务中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('ad05205e-5090-4ef9-8d5f-7d9267f2f13a', '100003003017', '大港油田公司所属单位石油工程研究院钻井化学技术服务中心', '钻井化学技术服务中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('9d44ee59-f6c3-4dd4-9e15-973566339c99', '100003003018', '大港油田公司所属单位石油工程研究院采油技术服务中心', '采油技术服务中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('3b6d6c7f-63b5-493f-a9e3-cc9a32e90a7d', '100003003019', '大港油田公司所属单位石油工程研究院试油排液技术服务中心', '试油排液技术服务中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('014846d7-b49c-4cb9-b665-6a87ca05f679', '100003003020', '大港油田公司所属单位石油工程研究院压裂酸化技术服务中心', '压裂酸化技术服务中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('3dcb3db0-4d81-4c16-bb96-96f6d0a124c4', '100003003021', '大港油田公司所属单位石油工程研究院防砂技术服务中心', '防砂技术服务中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('46c4c66c-8122-4cd9-bfc8-943a60a5be35', '100003003022', '大港油田公司所属单位石油工程研究院调剖堵水技术服务中心', '调剖堵水技术服务中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('49da3857-71af-4794-8c6a-e5ec3ad9683d', '100003003023', '大港油田公司所属单位石油工程研究院油层保护技术服务中心', '油层保护技术服务中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('6f2842a4-dcaa-40f2-a901-dffbec0c22fc', '100003003024', '大港油田公司所属单位石油工程研究院钻采技术开发有限公司', '钻采技术开发有限公司', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('fc42de22-d988-403b-bbd7-a501d7292508', '100003003025', '大港油田公司所属单位石油工程研究院化工制造中心', '化工制造中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('b4b63e2e-dc6b-4e5f-ac08-767e0ba26db2', '100003003026', '大港油田公司所属单位石油工程研究院科技实验与推广中心', '科技实验与推广中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('60140d82-4155-4f2d-83f8-529fe24a8624', '100003003026001', '大港油田公司所属单位石油工程研究院科技实验与推广中心中心领导', '中心领导', '100003003026', null, '1', '1', '', 'b4b63e2e-dc6b-4e5f-ac08-767e0ba26db2');
INSERT INTO `ts_uidp_org` VALUES ('991bee09-c0ce-4bdd-81bf-5bc6572812d9', '100003003026002', '大港油田公司所属单位石油工程研究院科技实验与推广中心工具实验基地组', '工具实验基地组', '100003003026', null, '1', '1', '', 'b4b63e2e-dc6b-4e5f-ac08-767e0ba26db2');
INSERT INTO `ts_uidp_org` VALUES ('76e08e26-7c50-4008-8cee-2fd7a5c33fa1', '100003003026003', '大港油田公司所属单位石油工程研究院科技实验与推广中心电位法技术推广组', '电位法技术推广组', '100003003026', null, '1', '1', '', 'b4b63e2e-dc6b-4e5f-ac08-767e0ba26db2');
INSERT INTO `ts_uidp_org` VALUES ('7658b7f5-1c11-4801-8d36-444014d3a8c4', '100003003026004', '大港油田公司所属单位石油工程研究院科技实验与推广中心膨胀管技术推广组', '膨胀管技术推广组', '100003003026', null, '1', '1', '', 'b4b63e2e-dc6b-4e5f-ac08-767e0ba26db2');
INSERT INTO `ts_uidp_org` VALUES ('ef613fe1-911a-45fc-b12b-04a2c6ce2332', '100003003026005', '大港油田公司所属单位石油工程研究院科技实验与推广中心油田化学实验组', '油田化学实验组', '100003003026', null, '1', '1', '', 'b4b63e2e-dc6b-4e5f-ac08-767e0ba26db2');
INSERT INTO `ts_uidp_org` VALUES ('ba6d5427-e1f1-41ad-8e8f-39068b2294cb', '100003003026006', '大港油田公司所属单位石油工程研究院科技实验与推广中心综合管理组', '综合管理组', '100003003026', null, '1', '1', '', 'b4b63e2e-dc6b-4e5f-ac08-767e0ba26db2');
INSERT INTO `ts_uidp_org` VALUES ('f159ecdd-58ce-4924-a190-45f56c5367ac', '100003003027', '大港油田公司所属单位石油工程研究院综合服务中心', '综合服务中心', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('3a1fb728-bd89-4080-a675-a6262c8ffdda', '100003003028', '大港油田公司所属单位石油工程研究院多经系统', '多经系统', '100003003', null, '1', '1', '', 'c220d081-11d6-4196-9b1f-3f2410903530');
INSERT INTO `ts_uidp_org` VALUES ('08dc824f-5ec3-4bce-97b3-8f03000f1b7f', '100003004', '大港油田公司所属单位经济技术研究院', '经济技术研究院', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('94c7d1e7-5675-422e-9a11-b894d0607a04', '100003004001', '大港油田公司所属单位经济技术研究院院领导', '院领导', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('c9ca2f55-f336-42dd-a29a-42619fc5c3ee', '100003004002', '大港油田公司所属单位经济技术研究院助理副总师', '助理副总师', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('1038b90d-a502-4cdc-b2c3-f1f0cbf4e83b', '100003004003', '大港油田公司所属单位经济技术研究院综合管理部', '综合管理部', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('d4f28100-e062-417b-89b9-8778fa8974b8', '100003004003001', '大港油田公司所属单位经济技术研究院综合管理部综合服务', '综合服务', '100003004003', null, '1', '1', '', '1038b90d-a502-4cdc-b2c3-f1f0cbf4e83b');
INSERT INTO `ts_uidp_org` VALUES ('dd812388-30b2-4234-a989-23a01ab70592', '100003004004', '大港油田公司所属单位经济技术研究院人力资源部', '人力资源部', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('8f9b3aff-d8c6-429a-99c5-cb9a587412db', '100003004004001', '大港油田公司所属单位经济技术研究院人力资源部退职老领导', '退职老领导', '100003004004', null, '1', '1', '', 'dd812388-30b2-4234-a989-23a01ab70592');
INSERT INTO `ts_uidp_org` VALUES ('79ce9dd8-9b56-4ac3-94c9-744dfab0b9ca', '100003004005', '大港油田公司所属单位经济技术研究院经营管理部', '经营管理部', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('0d8429bb-5481-48eb-8760-9cf17ad87835', '100003004006', '大港油田公司所属单位经济技术研究院专家管理办', '专家管理办', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('5557f4e6-1157-41cc-af47-63c812ac9b9b', '100003004007', '大港油田公司所属单位经济技术研究院审计中心', '审计中心', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('22560d72-b17f-4dea-95ef-5ddd19626087', '100003004007001', '大港油田公司所属单位经济技术研究院审计中心审计项目管理业务', '审计项目管理业务', '100003004007', null, '1', '1', '', '5557f4e6-1157-41cc-af47-63c812ac9b9b');
INSERT INTO `ts_uidp_org` VALUES ('85f1734b-6100-4a74-99a7-a378d51b0fab', '100003004007002', '大港油田公司所属单位经济技术研究院审计中心财务经营审计业务', '财务经营审计业务', '100003004007', null, '1', '1', '', '5557f4e6-1157-41cc-af47-63c812ac9b9b');
INSERT INTO `ts_uidp_org` VALUES ('de207141-2e28-492d-b378-f336c696f09b', '100003004007003', '大港油田公司所属单位经济技术研究院审计中心经济责任审计业务', '经济责任审计业务', '100003004007', null, '1', '1', '', '5557f4e6-1157-41cc-af47-63c812ac9b9b');
INSERT INTO `ts_uidp_org` VALUES ('6d9632b3-bc78-48de-be2f-64ebcfe54397', '100003004007004', '大港油田公司所属单位经济技术研究院审计中心内部控制审计业务', '内部控制审计业务', '100003004007', null, '1', '1', '', '5557f4e6-1157-41cc-af47-63c812ac9b9b');
INSERT INTO `ts_uidp_org` VALUES ('e7860f5a-7e15-49a1-aa36-d473b5129e1e', '100003004007005', '大港油田公司所属单位经济技术研究院审计中心专项审计业务', '专项审计业务', '100003004007', null, '1', '1', '', '5557f4e6-1157-41cc-af47-63c812ac9b9b');
INSERT INTO `ts_uidp_org` VALUES ('c9b3d1b8-dcbe-491e-93f4-22dc1accf057', '100003004007006', '大港油田公司所属单位经济技术研究院审计中心合同审计业务', '合同审计业务', '100003004007', null, '1', '1', '', '5557f4e6-1157-41cc-af47-63c812ac9b9b');
INSERT INTO `ts_uidp_org` VALUES ('c5ff349d-e294-4bb4-9c1d-ecfbad7adf93', '100003004007007', '大港油田公司所属单位经济技术研究院审计中心基建工程审计业务', '基建工程审计业务', '100003004007', null, '1', '1', '', '5557f4e6-1157-41cc-af47-63c812ac9b9b');
INSERT INTO `ts_uidp_org` VALUES ('c71eb548-8e39-4e72-8f18-dc912927e2bf', '100003004007008', '大港油田公司所属单位经济技术研究院审计中心投资审计业务', '投资审计业务', '100003004007', null, '1', '1', '', '5557f4e6-1157-41cc-af47-63c812ac9b9b');
INSERT INTO `ts_uidp_org` VALUES ('14ed1df9-4b7c-4b67-b6bc-f958aae0489a', '100003004008', '大港油田公司所属单位经济技术研究院资金结算中心', '资金结算中心', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('fb4429a9-c3a1-47de-ae89-21a624890447', '100003004008001', '大港油田公司所属单位经济技术研究院资金结算中心上市结算业务', '上市结算业务', '100003004008', null, '1', '1', '', '14ed1df9-4b7c-4b67-b6bc-f958aae0489a');
INSERT INTO `ts_uidp_org` VALUES ('bb6727ce-483c-4896-b87a-f61cc30f980b', '100003004008002', '大港油田公司所属单位经济技术研究院资金结算中心未上市结算业务', '未上市结算业务', '100003004008', null, '1', '1', '', '14ed1df9-4b7c-4b67-b6bc-f958aae0489a');
INSERT INTO `ts_uidp_org` VALUES ('fc1fec13-d830-42b7-8379-ed790734ed53', '100003004008003', '大港油田公司所属单位经济技术研究院资金结算中心矿区结算业务', '矿区结算业务', '100003004008', null, '1', '1', '', '14ed1df9-4b7c-4b67-b6bc-f958aae0489a');
INSERT INTO `ts_uidp_org` VALUES ('ef41fe0a-f736-49b6-8de9-662ecaec60da', '100003004008004', '大港油田公司所属单位经济技术研究院资金结算中心多经结算业务', '多经结算业务', '100003004008', null, '1', '1', '', '14ed1df9-4b7c-4b67-b6bc-f958aae0489a');
INSERT INTO `ts_uidp_org` VALUES ('312878e9-3480-48ba-8007-fac8c0383b9c', '100003004008005', '大港油田公司所属单位经济技术研究院资金结算中心港狮结算业务', '港狮结算业务', '100003004008', null, '1', '1', '', '14ed1df9-4b7c-4b67-b6bc-f958aae0489a');
INSERT INTO `ts_uidp_org` VALUES ('a41cb9e6-3fec-429a-8d34-d16822189c18', '100003004008006', '大港油田公司所属单位经济技术研究院资金结算中心关联交易结算业务', '关联交易结算业务', '100003004008', null, '1', '1', '', '14ed1df9-4b7c-4b67-b6bc-f958aae0489a');
INSERT INTO `ts_uidp_org` VALUES ('79c5b5ed-de51-48ac-aac8-7c7d4bef315a', '100003004008007', '大港油田公司所属单位经济技术研究院资金结算中心商票结算业务', '商票结算业务', '100003004008', null, '1', '1', '', '14ed1df9-4b7c-4b67-b6bc-f958aae0489a');
INSERT INTO `ts_uidp_org` VALUES ('ffce3ab5-451e-4237-84d8-61b138638240', '100003004008008', '大港油田公司所属单位经济技术研究院资金结算中心中油财务公司大港受理处', '中油财务公司大港受理处', '100003004008', null, '1', '1', '', '14ed1df9-4b7c-4b67-b6bc-f958aae0489a');
INSERT INTO `ts_uidp_org` VALUES ('2eac2e76-78c3-4d60-b353-e569ab92efa6', '100003004009', '大港油田公司所属单位经济技术研究院工程造价中心', '工程造价中心', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('d570b73f-ab3e-4fe3-9f9a-43c42bde7aff', '100003004009001', '大港油田公司所属单位经济技术研究院工程造价中心钻井工程造价业务', '钻井工程造价业务', '100003004009', null, '1', '1', '', '2eac2e76-78c3-4d60-b353-e569ab92efa6');
INSERT INTO `ts_uidp_org` VALUES ('243c9137-9d0c-4221-ad35-ea82871b67a9', '100003004009002', '大港油田公司所属单位经济技术研究院工程造价中心基建工程造价业务', '基建工程造价业务', '100003004009', null, '1', '1', '', '2eac2e76-78c3-4d60-b353-e569ab92efa6');
INSERT INTO `ts_uidp_org` VALUES ('2ae76943-7680-4e1c-9999-ef745f37e67e', '100003004009003', '大港油田公司所属单位经济技术研究院工程造价中心定额管理业务', '定额管理业务', '100003004009', null, '1', '1', '', '2eac2e76-78c3-4d60-b353-e569ab92efa6');
INSERT INTO `ts_uidp_org` VALUES ('0bd9d0a4-ea6e-4695-b9ea-5b17cfc204e8', '100003004009004', '大港油田公司所属单位经济技术研究院工程造价中心项目前期业务', '项目前期业务', '100003004009', null, '1', '1', '', '2eac2e76-78c3-4d60-b353-e569ab92efa6');
INSERT INTO `ts_uidp_org` VALUES ('7b857ded-377d-41ed-ad88-9850996884cd', '100003004009005', '大港油田公司所属单位经济技术研究院工程造价中心矿区投资概预算业务', '矿区投资概预算业务', '100003004009', null, '1', '1', '', '2eac2e76-78c3-4d60-b353-e569ab92efa6');
INSERT INTO `ts_uidp_org` VALUES ('096398ea-f3c4-4cff-8300-d25998b3a118', '100003004010', '大港油田公司所属单位经济技术研究院合规监督中心', '合规监督中心', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('19c2ebd1-006f-4a9e-874d-954be7de0b6e', '100003004011', '大港油田公司所属单位经济技术研究院咨询中心', '咨询中心', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('adb1a812-8baf-4715-82b3-ce73ef6c1404', '100003004012', '大港油田公司所属单位经济技术研究院项目评价中心', '项目评价中心', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('168956b3-5116-4712-bd29-d34a6671cb3b', '100003004013', '大港油田公司所属单位经济技术研究院招标中心', '招标中心', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('8383457b-4631-42b2-93f4-047ee7d70d18', '100003004014', '大港油田公司所属单位经济技术研究院工程设计中心', '工程设计中心', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('4428a096-a026-4418-bef1-2e5599b45bc7', '100003004015', '大港油田公司所属单位经济技术研究院财务共享中心', '财务共享中心', '100003004', null, '1', '1', '', '08dc824f-5ec3-4bce-97b3-8f03000f1b7f');
INSERT INTO `ts_uidp_org` VALUES ('10186dfe-186c-4f4f-b2eb-652f2a44d866', '100003005', '大港油田公司所属单位第一采油厂', '第一采油厂', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('12c5e356-38eb-41ca-83cb-4f911876f851', '100003005001', '大港油田公司所属单位第一采油厂一厂领导', '一厂领导', '100003005', null, '1', '1', '', '10186dfe-186c-4f4f-b2eb-652f2a44d866');
INSERT INTO `ts_uidp_org` VALUES ('b73f7904-cded-4c04-9b53-bed1939b3f8c', '100003005002', '大港油田公司所属单位第一采油厂一厂助理', '一厂助理', '100003005', null, '1', '1', '', '10186dfe-186c-4f4f-b2eb-652f2a44d866');
INSERT INTO `ts_uidp_org` VALUES ('90aa1695-644d-403c-82b1-9992b5273f03', '100003005003', '大港油田公司所属单位第一采油厂一厂专家', '一厂专家', '100003005', null, '1', '1', '', '10186dfe-186c-4f4f-b2eb-652f2a44d866');
INSERT INTO `ts_uidp_org` VALUES ('076eed7d-26a0-4a29-906d-bdf34745f044', '100003005003001', '大港油田公司所属单位第一采油厂一厂专家公司专家', '公司专家', '100003005003', null, '1', '1', '', '90aa1695-644d-403c-82b1-9992b5273f03');
INSERT INTO `ts_uidp_org` VALUES ('0e28c655-9876-402a-b60a-75cd6d54c4c7', '100003005003002', '大港油田公司所属单位第一采油厂一厂专家厂专家', '厂专家', '100003005003', null, '1', '1', '', '90aa1695-644d-403c-82b1-9992b5273f03');
INSERT INTO `ts_uidp_org` VALUES ('d6853595-15ea-45af-bb44-b6efd10e7555', '100003005004', '大港油田公司所属单位第一采油厂一厂机关', '一厂机关', '100003005', null, '1', '1', '', '10186dfe-186c-4f4f-b2eb-652f2a44d866');
INSERT INTO `ts_uidp_org` VALUES ('c53868b6-5ebc-4c00-abc2-6c081d036192', '100003005004001', '大港油田公司所属单位第一采油厂一厂机关厂长办公室', '厂长办公室', '100003005004', null, '1', '1', '', 'd6853595-15ea-45af-bb44-b6efd10e7555');
INSERT INTO `ts_uidp_org` VALUES ('cff35ffa-a2f1-41dd-a610-4a7cb2f769f3', '100003005004002', '大港油田公司所属单位第一采油厂一厂机关党群工作部', '党群工作部', '100003005004', null, '1', '1', '', 'd6853595-15ea-45af-bb44-b6efd10e7555');
INSERT INTO `ts_uidp_org` VALUES ('1d061b6c-4b70-4473-93ca-094e06be3ca5', '100003005004002001', '大港油田公司所属单位第一采油厂一厂机关党群工作部文化站', '文化站', '100003005004002', null, '1', '1', '', 'cff35ffa-a2f1-41dd-a610-4a7cb2f769f3');
INSERT INTO `ts_uidp_org` VALUES ('a69a44b3-47d1-4083-9a18-061013c24f94', '100003005004003', '大港油田公司所属单位第一采油厂一厂机关生产运行科', '生产运行科', '100003005004', null, '1', '1', '', 'd6853595-15ea-45af-bb44-b6efd10e7555');
INSERT INTO `ts_uidp_org` VALUES ('9ea27723-7c32-417c-beb4-182a3996136d', '100003005004004', '大港油田公司所属单位第一采油厂一厂机关安全环保科', '安全环保科', '100003005004', null, '1', '1', '', 'd6853595-15ea-45af-bb44-b6efd10e7555');
INSERT INTO `ts_uidp_org` VALUES ('195967e5-3074-4548-b081-cc144036909a', '100003005004005', '大港油田公司所属单位第一采油厂一厂机关油田管理科', '油田管理科', '100003005004', null, '1', '1', '', 'd6853595-15ea-45af-bb44-b6efd10e7555');
INSERT INTO `ts_uidp_org` VALUES ('61c2938d-b24e-47b6-92fc-ddd73aae15b9', '100003005004006', '大港油田公司所属单位第一采油厂一厂机关规划计划科', '规划计划科', '100003005004', null, '1', '1', '', 'd6853595-15ea-45af-bb44-b6efd10e7555');
INSERT INTO `ts_uidp_org` VALUES ('7fdf62c2-bf98-458f-a587-209c824bfedd', '100003005004006001', '大港油田公司所属单位第一采油厂一厂机关规划计划科工程预算站', '工程预算站', '100003005004006', null, '1', '1', '', '61c2938d-b24e-47b6-92fc-ddd73aae15b9');
INSERT INTO `ts_uidp_org` VALUES ('38bd16a1-abac-46a4-8ac6-1a8f039195dd', '100003005004007', '大港油田公司所属单位第一采油厂一厂机关人事科', '人事科', '100003005004', null, '1', '1', '', 'd6853595-15ea-45af-bb44-b6efd10e7555');
INSERT INTO `ts_uidp_org` VALUES ('0edc06b5-c351-4cb4-8efc-59c4527ae778', '100003005004008', '大港油田公司所属单位第一采油厂一厂机关财务科', '财务科', '100003005004', null, '1', '1', '', 'd6853595-15ea-45af-bb44-b6efd10e7555');
INSERT INTO `ts_uidp_org` VALUES ('57b98ce3-71de-43d2-a729-5085f8b96e93', '100003005004009', '大港油田公司所属单位第一采油厂一厂机关纪检监察科', '纪检监察科', '100003005004', null, '1', '1', '', 'd6853595-15ea-45af-bb44-b6efd10e7555');
INSERT INTO `ts_uidp_org` VALUES ('228ef80e-9cf5-4906-aefc-a3fef4a83152', '100003005004010', '大港油田公司所属单位第一采油厂一厂机关土地管理科', '土地管理科', '100003005004', null, '1', '1', '', 'd6853595-15ea-45af-bb44-b6efd10e7555');
INSERT INTO `ts_uidp_org` VALUES ('7ce185b2-3d67-4807-bf12-1ce0632f2fdc', '100003005005', '大港油田公司所属单位第一采油厂一厂直附属', '一厂直附属', '100003005', null, '1', '1', '', '10186dfe-186c-4f4f-b2eb-652f2a44d866');
INSERT INTO `ts_uidp_org` VALUES ('d2645798-9b0f-45ea-b147-7af9e058ea1e', '100003005005001', '大港油田公司所属单位第一采油厂一厂直附属地质研究所', '地质研究所', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('d569b3a0-2b70-40e1-8c72-f438f1ac434e', '100003005005001001', '大港油田公司所属单位第一采油厂一厂直附属地质研究所领导', '领导', '100003005005001', null, '1', '1', '', 'd2645798-9b0f-45ea-b147-7af9e058ea1e');
INSERT INTO `ts_uidp_org` VALUES ('1e411259-1077-468c-a6fa-5d143d7076fb', '100003005005001002', '大港油田公司所属单位第一采油厂一厂直附属地质研究所专家', '专家', '100003005005001', null, '1', '1', '', 'd2645798-9b0f-45ea-b147-7af9e058ea1e');
INSERT INTO `ts_uidp_org` VALUES ('d2eff970-40af-43a3-b2d3-7b4aeec5ee63', '100003005005001003', '大港油田公司所属单位第一采油厂一厂直附属地质研究所开发室', '开发室', '100003005005001', null, '1', '1', '', 'd2645798-9b0f-45ea-b147-7af9e058ea1e');
INSERT INTO `ts_uidp_org` VALUES ('10a922f4-d7f5-44bd-a456-bfbf9f5edb42', '100003005005001004', '大港油田公司所属单位第一采油厂一厂直附属地质研究所产能室', '产能室', '100003005005001', null, '1', '1', '', 'd2645798-9b0f-45ea-b147-7af9e058ea1e');
INSERT INTO `ts_uidp_org` VALUES ('6d27b867-2082-41b3-a028-b6646a6d0136', '100003005005001005', '大港油田公司所属单位第一采油厂一厂直附属地质研究所滚动室', '滚动室', '100003005005001', null, '1', '1', '', 'd2645798-9b0f-45ea-b147-7af9e058ea1e');
INSERT INTO `ts_uidp_org` VALUES ('ad6329b0-f215-4114-aa68-06bbec204377', '100003005005001006', '大港油田公司所属单位第一采油厂一厂直附属地质研究所生产室', '生产室', '100003005005001', null, '1', '1', '', 'd2645798-9b0f-45ea-b147-7af9e058ea1e');
INSERT INTO `ts_uidp_org` VALUES ('7b757d44-5232-4ac3-9d3b-fbf81a29121d', '100003005005001007', '大港油田公司所属单位第一采油厂一厂直附属地质研究所化验室', '化验室', '100003005005001', null, '1', '1', '', 'd2645798-9b0f-45ea-b147-7af9e058ea1e');
INSERT INTO `ts_uidp_org` VALUES ('9f26c357-440e-4963-ba09-c779c5176106', '100003005005001008', '大港油田公司所属单位第一采油厂一厂直附属地质研究所综合信息室', '综合信息室', '100003005005001', null, '1', '1', '', 'd2645798-9b0f-45ea-b147-7af9e058ea1e');
INSERT INTO `ts_uidp_org` VALUES ('22b76545-96c6-4839-a0d0-f0107a9c99b5', '100003005005001009', '大港油田公司所属单位第一采油厂一厂直附属地质研究所油描室', '油描室', '100003005005001', null, '1', '1', '', 'd2645798-9b0f-45ea-b147-7af9e058ea1e');
INSERT INTO `ts_uidp_org` VALUES ('fd889816-9f5d-4f34-be13-8bbd8e30ae75', '100003005005001010', '大港油田公司所属单位第一采油厂一厂直附属地质研究所天然气室', '天然气室', '100003005005001', null, '1', '1', '', 'd2645798-9b0f-45ea-b147-7af9e058ea1e');
INSERT INTO `ts_uidp_org` VALUES ('50828ba1-15db-4840-85f2-f57035ac1887', '100003005005002', '大港油田公司所属单位第一采油厂一厂直附属工艺研究所', '工艺研究所', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('4594d3fd-2375-40e1-abfc-ab1df9ce5d51', '100003005005002001', '大港油田公司所属单位第一采油厂一厂直附属工艺研究所领导', '领导', '100003005005002', null, '1', '1', '', '50828ba1-15db-4840-85f2-f57035ac1887');
INSERT INTO `ts_uidp_org` VALUES ('e11f753e-123d-45dc-8392-d54609032591', '100003005005002002', '大港油田公司所属单位第一采油厂一厂直附属工艺研究所专家', '专家', '100003005005002', null, '1', '1', '', '50828ba1-15db-4840-85f2-f57035ac1887');
INSERT INTO `ts_uidp_org` VALUES ('76a097b2-8991-4062-a33f-368188b0351f', '100003005005002003', '大港油田公司所属单位第一采油厂一厂直附属工艺研究所采油工艺室', '采油工艺室', '100003005005002', null, '1', '1', '', '50828ba1-15db-4840-85f2-f57035ac1887');
INSERT INTO `ts_uidp_org` VALUES ('d3f9cf9f-d750-42a3-8b93-22ea9bac32dc', '100003005005002004', '大港油田公司所属单位第一采油厂一厂直附属工艺研究所注水工艺室', '注水工艺室', '100003005005002', null, '1', '1', '', '50828ba1-15db-4840-85f2-f57035ac1887');
INSERT INTO `ts_uidp_org` VALUES ('8e53ec7f-1515-404b-8259-186dbfa2d3cc', '100003005005002005', '大港油田公司所属单位第一采油厂一厂直附属工艺研究所三次采油室', '三次采油室', '100003005005002', null, '1', '1', '', '50828ba1-15db-4840-85f2-f57035ac1887');
INSERT INTO `ts_uidp_org` VALUES ('d02f4943-2826-4ced-b51a-f82d01008d34', '100003005005002006', '大港油田公司所属单位第一采油厂一厂直附属工艺研究所地面工艺室', '地面工艺室', '100003005005002', null, '1', '1', '', '50828ba1-15db-4840-85f2-f57035ac1887');
INSERT INTO `ts_uidp_org` VALUES ('0df97b6f-b85e-4f3c-b210-c79d795c3334', '100003005005002007', '大港油田公司所属单位第一采油厂一厂直附属工艺研究所综合分析室', '综合分析室', '100003005005002', null, '1', '1', '', '50828ba1-15db-4840-85f2-f57035ac1887');
INSERT INTO `ts_uidp_org` VALUES ('75650d10-37f6-4b64-9f74-56dec066e84f', '100003005005003', '大港油田公司所属单位第一采油厂一厂直附属产能建设部', '产能建设部', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('6b49cb71-9622-4c86-80d6-20dbeb8cd600', '100003005005003001', '大港油田公司所属单位第一采油厂一厂直附属产能建设部领导', '领导', '100003005005003', null, '1', '1', '', '75650d10-37f6-4b64-9f74-56dec066e84f');
INSERT INTO `ts_uidp_org` VALUES ('4abd7275-d0b9-455c-84ea-ee0a7b4b736b', '100003005005003002', '大港油田公司所属单位第一采油厂一厂直附属产能建设部钻井室', '钻井室', '100003005005003', null, '1', '1', '', '75650d10-37f6-4b64-9f74-56dec066e84f');
INSERT INTO `ts_uidp_org` VALUES ('f004d3d6-d9a4-4023-8a54-2e5cd730e9df', '100003005005003003', '大港油田公司所属单位第一采油厂一厂直附属产能建设部试油室', '试油室', '100003005005003', null, '1', '1', '', '75650d10-37f6-4b64-9f74-56dec066e84f');
INSERT INTO `ts_uidp_org` VALUES ('4722c183-8c32-4c3b-b544-6b5f2fd5416e', '100003005005003004', '大港油田公司所属单位第一采油厂一厂直附属产能建设部地面室', '地面室', '100003005005003', null, '1', '1', '', '75650d10-37f6-4b64-9f74-56dec066e84f');
INSERT INTO `ts_uidp_org` VALUES ('a2bdc3f0-0753-46e0-92c2-5669b059368a', '100003005005003005', '大港油田公司所属单位第一采油厂一厂直附属产能建设部综合室', '综合室', '100003005005003', null, '1', '1', '', '75650d10-37f6-4b64-9f74-56dec066e84f');
INSERT INTO `ts_uidp_org` VALUES ('ecdc5209-4aa5-440a-a7e1-f07301184de4', '100003005005004', '大港油田公司所属单位第一采油厂一厂直附属修井管理站', '修井管理站', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('9de015f8-0551-455c-b3f7-6eef26fe3898', '100003005005004001', '大港油田公司所属单位第一采油厂一厂直附属修井管理站站领导', '站领导', '100003005005004', null, '1', '1', '', 'ecdc5209-4aa5-440a-a7e1-f07301184de4');
INSERT INTO `ts_uidp_org` VALUES ('4cddba78-03a6-4ab3-83be-e1278b74072c', '100003005005004002', '大港油田公司所属单位第一采油厂一厂直附属修井管理站专家', '专家', '100003005005004', null, '1', '1', '', 'ecdc5209-4aa5-440a-a7e1-f07301184de4');
INSERT INTO `ts_uidp_org` VALUES ('500a61b6-7070-4856-bedf-8db89468c453', '100003005005004003', '大港油田公司所属单位第一采油厂一厂直附属修井管理站生产室', '生产室', '100003005005004', null, '1', '1', '', 'ecdc5209-4aa5-440a-a7e1-f07301184de4');
INSERT INTO `ts_uidp_org` VALUES ('f3dd96dc-ed3b-48d6-a376-50803c323cd1', '100003005005004004', '大港油田公司所属单位第一采油厂一厂直附属修井管理站工艺室', '工艺室', '100003005005004', null, '1', '1', '', 'ecdc5209-4aa5-440a-a7e1-f07301184de4');
INSERT INTO `ts_uidp_org` VALUES ('e01fd67a-a373-4b0b-a458-6eed10efcaf3', '100003005005004005', '大港油田公司所属单位第一采油厂一厂直附属修井管理站综合室', '综合室', '100003005005004', null, '1', '1', '', 'ecdc5209-4aa5-440a-a7e1-f07301184de4');
INSERT INTO `ts_uidp_org` VALUES ('b5322921-5d2f-4cc5-a27f-2ccbba8eec6e', '100003005005004006', '大港油田公司所属单位第一采油厂一厂直附属修井管理站预结算室', '预结算室', '100003005005004', null, '1', '1', '', 'ecdc5209-4aa5-440a-a7e1-f07301184de4');
INSERT INTO `ts_uidp_org` VALUES ('d144a4c7-9851-4b20-a331-b1494baba60b', '100003005005005', '大港油田公司所属单位第一采油厂一厂直附属HSE监督站', 'HSE监督站', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('e53e199d-1ced-48ec-9a66-4fe7df01c2c6', '100003005005006', '大港油田公司所属单位第一采油厂一厂直附属基建管理站', '基建管理站', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('7a33a927-ef0b-4e48-bfaf-c2fb3435bfe9', '100003005005007', '大港油田公司所属单位第一采油厂一厂直附属电力管理站', '电力管理站', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('4b30d1a3-75cd-4376-ad63-0decf42816da', '100003005005008', '大港油田公司所属单位第一采油厂一厂直附属物资装备站', '物资装备站', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('ceedff43-508d-41d3-b510-d0f5af66811a', '100003005005009', '大港油田公司所属单位第一采油厂一厂直附属经济警察大队', '经济警察大队', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('9e9bd251-b069-408a-87f4-baa3f68f83b7', '100003005005010', '大港油田公司所属单位第一采油厂一厂直附属信息档案室', '信息档案室', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('f3fe9f77-7aaf-4a98-b441-210db74db302', '100003005005011', '大港油田公司所属单位第一采油厂一厂直附属员工培训中心', '员工培训中心', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('859580fa-7ae6-4f10-8895-606fcb33d274', '100003005005012', '大港油田公司所属单位第一采油厂一厂直附属港青公司', '港青公司', '100003005005', null, '1', '1', '', '7ce185b2-3d67-4807-bf12-1ce0632f2fdc');
INSERT INTO `ts_uidp_org` VALUES ('b2ed6555-1efc-4a6d-9a4a-e1db1093912b', '100003005006', '大港油田公司所属单位第一采油厂一厂所属', '一厂所属', '100003005', null, '1', '1', '', '10186dfe-186c-4f4f-b2eb-652f2a44d866');
INSERT INTO `ts_uidp_org` VALUES ('e3e601cb-f7b5-45ad-86dd-368bea3792cb', '100003005006001', '大港油田公司所属单位第一采油厂一厂所属第一采油作业区', '第一采油作业区', '100003005006', null, '1', '1', '', 'b2ed6555-1efc-4a6d-9a4a-e1db1093912b');
INSERT INTO `ts_uidp_org` VALUES ('6849d707-c9da-4cd5-98ed-5a8421f0f2e2', '100003005006001001', '大港油田公司所属单位第一采油厂一厂所属第一采油作业区领导', '领导', '100003005006001', null, '1', '1', '', 'e3e601cb-f7b5-45ad-86dd-368bea3792cb');
INSERT INTO `ts_uidp_org` VALUES ('55c8b4d6-1fc2-4c37-91c4-1e6c3adaabce', '100003005006001002', '大港油田公司所属单位第一采油厂一厂所属第一采油作业区党群工作组', '党群工作组', '100003005006001', null, '1', '1', '', 'e3e601cb-f7b5-45ad-86dd-368bea3792cb');
INSERT INTO `ts_uidp_org` VALUES ('0a2e8140-100b-44a2-ba2f-1d2a96b90eb0', '100003005006001003', '大港油田公司所属单位第一采油厂一厂所属第一采油作业区综合管理组', '综合管理组', '100003005006001', null, '1', '1', '', 'e3e601cb-f7b5-45ad-86dd-368bea3792cb');
INSERT INTO `ts_uidp_org` VALUES ('bbbdf3f0-90bf-445d-8494-b67d9834d2d6', '100003005006001004', '大港油田公司所属单位第一采油厂一厂所属第一采油作业区工程维修组', '工程维修组', '100003005006001', null, '1', '1', '', 'e3e601cb-f7b5-45ad-86dd-368bea3792cb');
INSERT INTO `ts_uidp_org` VALUES ('2c78762b-0e5a-44d1-9111-a61efd44eabc', '100003005006001005', '大港油田公司所属单位第一采油厂一厂所属第一采油作业区开发技术组', '开发技术组', '100003005006001', null, '1', '1', '', 'e3e601cb-f7b5-45ad-86dd-368bea3792cb');
INSERT INTO `ts_uidp_org` VALUES ('81768634-daa7-4471-81ac-08fd58f6bad6', '100003005006001006', '大港油田公司所属单位第一采油厂一厂所属第一采油作业区班站', '班站', '100003005006001', null, '1', '1', '', 'e3e601cb-f7b5-45ad-86dd-368bea3792cb');
INSERT INTO `ts_uidp_org` VALUES ('98ecb810-6811-42e4-a22b-792f2cca9ab8', '100003005006002', '大港油田公司所属单位第一采油厂一厂所属第二采油作业区', '第二采油作业区', '100003005006', null, '1', '1', '', 'b2ed6555-1efc-4a6d-9a4a-e1db1093912b');
INSERT INTO `ts_uidp_org` VALUES ('bafe5c0e-b20b-4512-b5f9-a311e9383dd7', '100003005006002001', '大港油田公司所属单位第一采油厂一厂所属第二采油作业区领导', '领导', '100003005006002', null, '1', '1', '', '98ecb810-6811-42e4-a22b-792f2cca9ab8');
INSERT INTO `ts_uidp_org` VALUES ('15acb52c-3c19-4c95-92b3-cdccbbbe6830', '100003005006002002', '大港油田公司所属单位第一采油厂一厂所属第二采油作业区党群工作组', '党群工作组', '100003005006002', null, '1', '1', '', '98ecb810-6811-42e4-a22b-792f2cca9ab8');
INSERT INTO `ts_uidp_org` VALUES ('98d5d23d-8788-4674-91ae-a1b9bdd4e2d4', '100003005006002003', '大港油田公司所属单位第一采油厂一厂所属第二采油作业区综合管理组', '综合管理组', '100003005006002', null, '1', '1', '', '98ecb810-6811-42e4-a22b-792f2cca9ab8');
INSERT INTO `ts_uidp_org` VALUES ('0fff80aa-0466-49cf-8c75-e8b78c2bd0f9', '100003005006002004', '大港油田公司所属单位第一采油厂一厂所属第二采油作业区工程维修组', '工程维修组', '100003005006002', null, '1', '1', '', '98ecb810-6811-42e4-a22b-792f2cca9ab8');
INSERT INTO `ts_uidp_org` VALUES ('fa44704a-f320-4b95-b80c-13db0a5f084a', '100003005006002005', '大港油田公司所属单位第一采油厂一厂所属第二采油作业区开发技术组', '开发技术组', '100003005006002', null, '1', '1', '', '98ecb810-6811-42e4-a22b-792f2cca9ab8');
INSERT INTO `ts_uidp_org` VALUES ('9c841b9d-7916-4a0c-aaf9-405040f887b2', '100003005006002006', '大港油田公司所属单位第一采油厂一厂所属第二采油作业区班站', '班站', '100003005006002', null, '1', '1', '', '98ecb810-6811-42e4-a22b-792f2cca9ab8');
INSERT INTO `ts_uidp_org` VALUES ('e6ceaea2-ee13-4877-b363-16a695a53949', '100003005006003', '大港油田公司所属单位第一采油厂一厂所属第三采油作业区', '第三采油作业区', '100003005006', null, '1', '1', '', 'b2ed6555-1efc-4a6d-9a4a-e1db1093912b');
INSERT INTO `ts_uidp_org` VALUES ('0a859ffa-cd9b-4d35-8972-92149bac2cf8', '100003005006003001', '大港油田公司所属单位第一采油厂一厂所属第三采油作业区领导', '领导', '100003005006003', null, '1', '1', '', 'e6ceaea2-ee13-4877-b363-16a695a53949');
INSERT INTO `ts_uidp_org` VALUES ('f5083eab-634c-4a1b-b30d-0aafbefa8001', '100003005006003002', '大港油田公司所属单位第一采油厂一厂所属第三采油作业区党群工作组', '党群工作组', '100003005006003', null, '1', '1', '', 'e6ceaea2-ee13-4877-b363-16a695a53949');
INSERT INTO `ts_uidp_org` VALUES ('155cd252-eb2f-4279-be50-d56488d9f6b9', '100003005006003003', '大港油田公司所属单位第一采油厂一厂所属第三采油作业区综合管理组', '综合管理组', '100003005006003', null, '1', '1', '', 'e6ceaea2-ee13-4877-b363-16a695a53949');
INSERT INTO `ts_uidp_org` VALUES ('a47e2db5-58cf-439e-9b5d-5fe62d613df6', '100003005006003004', '大港油田公司所属单位第一采油厂一厂所属第三采油作业区工程维修组', '工程维修组', '100003005006003', null, '1', '1', '', 'e6ceaea2-ee13-4877-b363-16a695a53949');
INSERT INTO `ts_uidp_org` VALUES ('c54460e9-ae89-453f-81ab-9e6097c4afe6', '100003005006003005', '大港油田公司所属单位第一采油厂一厂所属第三采油作业区开发技术组', '开发技术组', '100003005006003', null, '1', '1', '', 'e6ceaea2-ee13-4877-b363-16a695a53949');
INSERT INTO `ts_uidp_org` VALUES ('5ee224eb-7323-40d6-8dbd-ced2236a7f9b', '100003005006003006', '大港油田公司所属单位第一采油厂一厂所属第三采油作业区班站', '班站', '100003005006003', null, '1', '1', '', 'e6ceaea2-ee13-4877-b363-16a695a53949');
INSERT INTO `ts_uidp_org` VALUES ('b85244f2-ab73-460a-a5de-a5d7f02ebd71', '100003005006004', '大港油田公司所属单位第一采油厂一厂所属第四采油作业区', '第四采油作业区', '100003005006', null, '1', '1', '', 'b2ed6555-1efc-4a6d-9a4a-e1db1093912b');
INSERT INTO `ts_uidp_org` VALUES ('d86797a9-80e4-4357-a10c-e59e53e3799b', '100003005006004001', '大港油田公司所属单位第一采油厂一厂所属第四采油作业区领导', '领导', '100003005006004', null, '1', '1', '', 'b85244f2-ab73-460a-a5de-a5d7f02ebd71');
INSERT INTO `ts_uidp_org` VALUES ('b4afa163-ce21-4a5a-8ee3-1e941d28a5d2', '100003005006004002', '大港油田公司所属单位第一采油厂一厂所属第四采油作业区党群工作组', '党群工作组', '100003005006004', null, '1', '1', '', 'b85244f2-ab73-460a-a5de-a5d7f02ebd71');
INSERT INTO `ts_uidp_org` VALUES ('6f7c346b-16e1-4646-bd37-dd77b1007eb5', '100003005006004003', '大港油田公司所属单位第一采油厂一厂所属第四采油作业区综合管理组', '综合管理组', '100003005006004', null, '1', '1', '', 'b85244f2-ab73-460a-a5de-a5d7f02ebd71');
INSERT INTO `ts_uidp_org` VALUES ('264d7c09-4b6c-4386-8b83-43c110e738f0', '100003005006004004', '大港油田公司所属单位第一采油厂一厂所属第四采油作业区开发技术组', '开发技术组', '100003005006004', null, '1', '1', '', 'b85244f2-ab73-460a-a5de-a5d7f02ebd71');
INSERT INTO `ts_uidp_org` VALUES ('0ca66208-3f19-4e39-932f-8688cff198f6', '100003005006004005', '大港油田公司所属单位第一采油厂一厂所属第四采油作业区工程维修组', '工程维修组', '100003005006004', null, '1', '1', '', 'b85244f2-ab73-460a-a5de-a5d7f02ebd71');
INSERT INTO `ts_uidp_org` VALUES ('bfc12295-9caa-434e-a7e8-41023d7d4a7e', '100003005006004006', '大港油田公司所属单位第一采油厂一厂所属第四采油作业区班站', '班站', '100003005006004', null, '1', '1', '', 'b85244f2-ab73-460a-a5de-a5d7f02ebd71');
INSERT INTO `ts_uidp_org` VALUES ('0cb38954-ab87-436e-9fac-b63ae6847f79', '100003005006005', '大港油田公司所属单位第一采油厂一厂所属港东联合站', '港东联合站', '100003005006', null, '1', '1', '', 'b2ed6555-1efc-4a6d-9a4a-e1db1093912b');
INSERT INTO `ts_uidp_org` VALUES ('7b6c8ba6-40d4-4d33-a92e-12dc77a25b7e', '100003005006006', '大港油田公司所属单位第一采油厂一厂所属马西联合站', '马西联合站', '100003005006', null, '1', '1', '', 'b2ed6555-1efc-4a6d-9a4a-e1db1093912b');
INSERT INTO `ts_uidp_org` VALUES ('e44da8ac-9f11-4e70-98dd-b6c1fd94c5fa', '100003005006007', '大港油田公司所属单位第一采油厂一厂所属计量队', '计量队', '100003005006', null, '1', '1', '', 'b2ed6555-1efc-4a6d-9a4a-e1db1093912b');
INSERT INTO `ts_uidp_org` VALUES ('a6ec5880-1dae-488d-9bcf-0d1544483416', '100003005006007001', '大港油田公司所属单位第一采油厂一厂所属计量队投捞测试组', '投捞测试组', '100003005006007', null, '1', '1', '', 'e44da8ac-9f11-4e70-98dd-b6c1fd94c5fa');
INSERT INTO `ts_uidp_org` VALUES ('82b8fdb5-29dd-46a8-83d3-d3e3f8f9d0ba', '100003005006007002', '大港油田公司所属单位第一采油厂一厂所属计量队仪表检定组', '仪表检定组', '100003005006007', null, '1', '1', '', 'e44da8ac-9f11-4e70-98dd-b6c1fd94c5fa');
INSERT INTO `ts_uidp_org` VALUES ('f6d421a8-f45e-4578-b586-6093e4ecf167', '100003005006008', '大港油田公司所属单位第一采油厂一厂所属综合车辆大队', '综合车辆大队', '100003005006', null, '1', '1', '', 'b2ed6555-1efc-4a6d-9a4a-e1db1093912b');
INSERT INTO `ts_uidp_org` VALUES ('b3d54722-7c3d-4cbd-b316-ee95e585fa36', '100003005006008001', '大港油田公司所属单位第一采油厂一厂所属综合车辆大队车辆一队', '车辆一队', '100003005006008', null, '1', '1', '', 'f6d421a8-f45e-4578-b586-6093e4ecf167');
INSERT INTO `ts_uidp_org` VALUES ('b3fa0b5d-4fa0-41b3-a11d-ce865043f8c1', '100003005006008002', '大港油田公司所属单位第一采油厂一厂所属综合车辆大队车辆二队', '车辆二队', '100003005006008', null, '1', '1', '', 'f6d421a8-f45e-4578-b586-6093e4ecf167');
INSERT INTO `ts_uidp_org` VALUES ('a281d8e2-08f6-49c3-b1bb-65a8bfcdbc64', '100003005006009', '大港油田公司所属单位第一采油厂一厂所属综合服务队', '综合服务队', '100003005006', null, '1', '1', '', 'b2ed6555-1efc-4a6d-9a4a-e1db1093912b');
INSERT INTO `ts_uidp_org` VALUES ('5418f235-c7f9-42dc-b91b-8930f5d9fdb8', '100003006', '大港油田公司所属单位第二采油厂', '第二采油厂', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('9c124e21-0fe9-4c21-aa52-6af638ab4089', '100003006001', '大港油田公司所属单位第二采油厂二厂领导', '二厂领导', '100003006', null, '1', '1', '', '5418f235-c7f9-42dc-b91b-8930f5d9fdb8');
INSERT INTO `ts_uidp_org` VALUES ('09bba1b5-4eeb-4c98-88b6-5cd10a1d0066', '100003006001001', '大港油田公司所属单位第二采油厂二厂领导老领导', '老领导', '100003006001', null, '1', '1', '', '9c124e21-0fe9-4c21-aa52-6af638ab4089');
INSERT INTO `ts_uidp_org` VALUES ('e60a8835-a11a-466f-a8ac-1dba44ca37ef', '100003006002', '大港油田公司所属单位第二采油厂二厂助理', '二厂助理', '100003006', null, '1', '1', '', '5418f235-c7f9-42dc-b91b-8930f5d9fdb8');
INSERT INTO `ts_uidp_org` VALUES ('afda5537-1fde-4020-a7e5-0ea0ecc0b43a', '100003006003', '大港油田公司所属单位第二采油厂二厂机关', '二厂机关', '100003006', null, '1', '1', '', '5418f235-c7f9-42dc-b91b-8930f5d9fdb8');
INSERT INTO `ts_uidp_org` VALUES ('59dbc308-b51d-4afc-8c14-d1828fc6a773', '100003006003001', '大港油田公司所属单位第二采油厂二厂机关厂长办公室', '厂长办公室', '100003006003', null, '1', '1', '', 'afda5537-1fde-4020-a7e5-0ea0ecc0b43a');
INSERT INTO `ts_uidp_org` VALUES ('e35243c2-f24d-4347-9757-692b24f215e7', '100003006003002', '大港油田公司所属单位第二采油厂二厂机关党群工作部', '党群工作部', '100003006003', null, '1', '1', '', 'afda5537-1fde-4020-a7e5-0ea0ecc0b43a');
INSERT INTO `ts_uidp_org` VALUES ('a7c513b2-c618-4af4-bcc3-175a25aa1d2e', '100003006003003', '大港油田公司所属单位第二采油厂二厂机关生产运行科', '生产运行科', '100003006003', null, '1', '1', '', 'afda5537-1fde-4020-a7e5-0ea0ecc0b43a');
INSERT INTO `ts_uidp_org` VALUES ('7ef6af8b-9b24-47d8-b7b5-63026339099b', '100003006003004', '大港油田公司所属单位第二采油厂二厂机关企业发展与规划计划科', '企业发展与规划计划科', '100003006003', null, '1', '1', '', 'afda5537-1fde-4020-a7e5-0ea0ecc0b43a');
INSERT INTO `ts_uidp_org` VALUES ('e8e725d8-4bda-48b0-9c85-9a5d8f2ce0c6', '100003006003005', '大港油田公司所属单位第二采油厂二厂机关人事劳资科', '人事劳资科', '100003006003', null, '1', '1', '', 'afda5537-1fde-4020-a7e5-0ea0ecc0b43a');
INSERT INTO `ts_uidp_org` VALUES ('9cbd835e-fb3c-4b4d-b2e1-c2d75da7d4ed', '100003006003006', '大港油田公司所属单位第二采油厂二厂机关财务资产科', '财务资产科', '100003006003', null, '1', '1', '', 'afda5537-1fde-4020-a7e5-0ea0ecc0b43a');
INSERT INTO `ts_uidp_org` VALUES ('42c2588a-93e2-4ff2-93d4-9fab65c4b710', '100003006003007', '大港油田公司所属单位第二采油厂二厂机关安全环保科', '安全环保科', '100003006003', null, '1', '1', '', 'afda5537-1fde-4020-a7e5-0ea0ecc0b43a');
INSERT INTO `ts_uidp_org` VALUES ('260881fc-0ebb-4ddc-a77e-e8a760662c20', '100003006003008', '大港油田公司所属单位第二采油厂二厂机关油田管理科', '油田管理科', '100003006003', null, '1', '1', '', 'afda5537-1fde-4020-a7e5-0ea0ecc0b43a');
INSERT INTO `ts_uidp_org` VALUES ('93a13cb1-922c-4f63-a07e-1def29d58eb1', '100003006004', '大港油田公司所属单位第二采油厂二厂直属', '二厂直属', '100003006', null, '1', '1', '', '5418f235-c7f9-42dc-b91b-8930f5d9fdb8');
INSERT INTO `ts_uidp_org` VALUES ('b05009b4-c8eb-4885-8daa-69d388617b29', '100003006004001', '大港油田公司所属单位第二采油厂二厂直属工艺研究所', '工艺研究所', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('9342d74e-39aa-4aef-b02a-e6260547f1ae', '100003006004001001', '大港油田公司所属单位第二采油厂二厂直属工艺研究所领导', '领导', '100003006004001', null, '1', '1', '', 'b05009b4-c8eb-4885-8daa-69d388617b29');
INSERT INTO `ts_uidp_org` VALUES ('6b8dab94-45b6-4197-9471-9118083e8b35', '100003006004001002', '大港油田公司所属单位第二采油厂二厂直属工艺研究所采油工艺室', '采油工艺室', '100003006004001', null, '1', '1', '', 'b05009b4-c8eb-4885-8daa-69d388617b29');
INSERT INTO `ts_uidp_org` VALUES ('3bcba0fb-ad8f-4d77-bd7a-0a0f81730bea', '100003006004001003', '大港油田公司所属单位第二采油厂二厂直属工艺研究所地面工艺室', '地面工艺室', '100003006004001', null, '1', '1', '', 'b05009b4-c8eb-4885-8daa-69d388617b29');
INSERT INTO `ts_uidp_org` VALUES ('a69fdc18-4812-4e43-98f1-fce721746697', '100003006004001004', '大港油田公司所属单位第二采油厂二厂直属工艺研究所注水工艺室', '注水工艺室', '100003006004001', null, '1', '1', '', 'b05009b4-c8eb-4885-8daa-69d388617b29');
INSERT INTO `ts_uidp_org` VALUES ('36abb485-b020-4e76-84a3-25815c11ded0', '100003006004001005', '大港油田公司所属单位第二采油厂二厂直属工艺研究所钻井完井工艺室', '钻井完井工艺室', '100003006004001', null, '1', '1', '', 'b05009b4-c8eb-4885-8daa-69d388617b29');
INSERT INTO `ts_uidp_org` VALUES ('8d2fa708-c9ea-4984-a6cd-aef8fa3d14d8', '100003006004001006', '大港油田公司所属单位第二采油厂二厂直属工艺研究所综合管理室', '综合管理室', '100003006004001', null, '1', '1', '', 'b05009b4-c8eb-4885-8daa-69d388617b29');
INSERT INTO `ts_uidp_org` VALUES ('6db3a7a6-3b33-4968-bcff-5f39a5c26142', '100003006004002', '大港油田公司所属单位第二采油厂二厂直属地质研究所', '地质研究所', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('c2c4cfe7-7c6f-46ed-a672-e18a43038c46', '100003006004002001', '大港油田公司所属单位第二采油厂二厂直属地质研究所领导', '领导', '100003006004002', null, '1', '1', '', '6db3a7a6-3b33-4968-bcff-5f39a5c26142');
INSERT INTO `ts_uidp_org` VALUES ('2c93f6b1-5cc0-4b00-8a5b-ff76aa394742', '100003006004002002', '大港油田公司所属单位第二采油厂二厂直属地质研究所油藏开发室', '油藏开发室', '100003006004002', null, '1', '1', '', '6db3a7a6-3b33-4968-bcff-5f39a5c26142');
INSERT INTO `ts_uidp_org` VALUES ('2e985a1b-e3c4-467f-97ec-4ff451550a54', '100003006004002003', '大港油田公司所属单位第二采油厂二厂直属地质研究所油藏描述室', '油藏描述室', '100003006004002', null, '1', '1', '', '6db3a7a6-3b33-4968-bcff-5f39a5c26142');
INSERT INTO `ts_uidp_org` VALUES ('ffcc6a2f-8f18-4346-ba50-022b1bf442ed', '100003006004002004', '大港油田公司所属单位第二采油厂二厂直属地质研究所产能评价室', '产能评价室', '100003006004002', null, '1', '1', '', '6db3a7a6-3b33-4968-bcff-5f39a5c26142');
INSERT INTO `ts_uidp_org` VALUES ('c7ea0927-c9a1-4c8e-8809-206caa4b5319', '100003006004002005', '大港油田公司所属单位第二采油厂二厂直属地质研究所天然气室', '天然气室', '100003006004002', null, '1', '1', '', '6db3a7a6-3b33-4968-bcff-5f39a5c26142');
INSERT INTO `ts_uidp_org` VALUES ('6a2954e5-3f11-482e-b6bc-ed5bd7c652d7', '100003006004002006', '大港油田公司所属单位第二采油厂二厂直属地质研究所综合管理室', '综合管理室', '100003006004002', null, '1', '1', '', '6db3a7a6-3b33-4968-bcff-5f39a5c26142');
INSERT INTO `ts_uidp_org` VALUES ('633cb31a-3885-44ff-a691-4f03448c59d2', '100003006004003', '大港油田公司所属单位第二采油厂二厂直属修井管理站', '修井管理站', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('0c4cb747-a72e-4b65-91b4-e22bc912cedc', '100003006004003001', '大港油田公司所属单位第二采油厂二厂直属修井管理站领导', '领导', '100003006004003', null, '1', '1', '', '633cb31a-3885-44ff-a691-4f03448c59d2');
INSERT INTO `ts_uidp_org` VALUES ('cb935893-4cc2-4f88-85fd-b09b73cc5a08', '100003006004003002', '大港油田公司所属单位第二采油厂二厂直属修井管理站修井工艺组', '修井工艺组', '100003006004003', null, '1', '1', '', '633cb31a-3885-44ff-a691-4f03448c59d2');
INSERT INTO `ts_uidp_org` VALUES ('2b101885-db84-4dc3-8847-b2f64f99d106', '100003006004003003', '大港油田公司所属单位第二采油厂二厂直属修井管理站修井监督组', '修井监督组', '100003006004003', null, '1', '1', '', '633cb31a-3885-44ff-a691-4f03448c59d2');
INSERT INTO `ts_uidp_org` VALUES ('72e50105-3d1f-4fa4-8530-a3bd689b0a25', '100003006004003004', '大港油田公司所属单位第二采油厂二厂直属修井管理站综合管理组', '综合管理组', '100003006004003', null, '1', '1', '', '633cb31a-3885-44ff-a691-4f03448c59d2');
INSERT INTO `ts_uidp_org` VALUES ('01a26f13-4964-4363-9a23-e4a11aabe20d', '100003006004004', '大港油田公司所属单位第二采油厂二厂直属产能建设部', '产能建设部', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('9fbfa162-0ab1-47ec-a81d-067d92975952', '100003006004004001', '大港油田公司所属单位第二采油厂二厂直属产能建设部领导', '领导', '100003006004004', null, '1', '1', '', '01a26f13-4964-4363-9a23-e4a11aabe20d');
INSERT INTO `ts_uidp_org` VALUES ('ca705351-aa4f-4bc5-bf32-cb3c43cfba51', '100003006004004002', '大港油田公司所属单位第二采油厂二厂直属产能建设部钻井室', '钻井室', '100003006004004', null, '1', '1', '', '01a26f13-4964-4363-9a23-e4a11aabe20d');
INSERT INTO `ts_uidp_org` VALUES ('3e43cfd9-bf76-4b67-a4b1-fbf73da62f98', '100003006004004003', '大港油田公司所属单位第二采油厂二厂直属产能建设部试油室', '试油室', '100003006004004', null, '1', '1', '', '01a26f13-4964-4363-9a23-e4a11aabe20d');
INSERT INTO `ts_uidp_org` VALUES ('4f189358-2c0f-409e-80c9-9249fe66ffe0', '100003006004004004', '大港油田公司所属单位第二采油厂二厂直属产能建设部地面室', '地面室', '100003006004004', null, '1', '1', '', '01a26f13-4964-4363-9a23-e4a11aabe20d');
INSERT INTO `ts_uidp_org` VALUES ('6d990aed-fbbc-42fb-9d59-119c83138b82', '100003006004004005', '大港油田公司所属单位第二采油厂二厂直属产能建设部综合室', '综合室', '100003006004004', null, '1', '1', '', '01a26f13-4964-4363-9a23-e4a11aabe20d');
INSERT INTO `ts_uidp_org` VALUES ('548a5f1b-1332-4c46-85f0-240cb30453de', '100003006004005', '大港油田公司所属单位第二采油厂二厂直属电力管理站', '电力管理站', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('c3627ae4-181b-4d06-869d-5a9711fa7235', '100003006004006', '大港油田公司所属单位第二采油厂二厂直属物资管理站', '物资管理站', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('b7227bda-e139-470e-b638-c1ca5db61110', '100003006004007', '大港油田公司所属单位第二采油厂二厂直属基建管理站', '基建管理站', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('96b61037-4d21-4def-91d7-785b3c61f2ac', '100003006004008', '大港油田公司所属单位第二采油厂二厂直属信息档案室', '信息档案室', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('b7b247e2-aa48-47a4-9fa9-b47f24ae4c7f', '100003006004008001', '大港油田公司所属单位第二采油厂二厂直属信息档案室领导', '领导', '100003006004008', null, '1', '1', '', '96b61037-4d21-4def-91d7-785b3c61f2ac');
INSERT INTO `ts_uidp_org` VALUES ('4fea4875-16fb-4e5e-98d4-ebf4399e2335', '100003006004008002', '大港油田公司所属单位第二采油厂二厂直属信息档案室技术管理组', '技术管理组', '100003006004008', null, '1', '1', '', '96b61037-4d21-4def-91d7-785b3c61f2ac');
INSERT INTO `ts_uidp_org` VALUES ('671658ac-b5f3-4293-bc39-4ecc481c28e4', '100003006004008003', '大港油田公司所属单位第二采油厂二厂直属信息档案室运行维护组', '运行维护组', '100003006004008', null, '1', '1', '', '96b61037-4d21-4def-91d7-785b3c61f2ac');
INSERT INTO `ts_uidp_org` VALUES ('8621d8b9-c9d3-470f-aa35-2753fd4e740b', '100003006004009', '大港油田公司所属单位第二采油厂二厂直属培训学校（技能鉴定站）', '培训学校（技能鉴定站）', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('5985a8ef-4846-4539-9737-08ca13ce7746', '100003006004010', '大港油田公司所属单位第二采油厂二厂直属经警大队', '经警大队', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('55a0269b-ace9-4843-9673-58516cddd290', '100003006004011', '大港油田公司所属单位第二采油厂二厂直属HSE监督工作站', 'HSE监督工作站', '100003006004', null, '1', '1', '', '93a13cb1-922c-4f63-a07e-1def29d58eb1');
INSERT INTO `ts_uidp_org` VALUES ('303cf30a-5de8-4811-99be-dd03972a5fc4', '100003006005', '大港油田公司所属单位第二采油厂二厂所属', '二厂所属', '100003006', null, '1', '1', '', '5418f235-c7f9-42dc-b91b-8930f5d9fdb8');
INSERT INTO `ts_uidp_org` VALUES ('7bbea54d-82a1-4709-9f2b-ce1c3736bd68', '100003006005001', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区', '第一采油作业区', '100003006005', null, '1', '1', '', '303cf30a-5de8-4811-99be-dd03972a5fc4');
INSERT INTO `ts_uidp_org` VALUES ('0711b030-e0b8-45dd-94fd-ae1669001b55', '100003006005001001', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区领导', '领导', '100003006005001', null, '1', '1', '', '7bbea54d-82a1-4709-9f2b-ce1c3736bd68');
INSERT INTO `ts_uidp_org` VALUES ('b3302783-15c1-43c6-8712-1aad0d765b33', '100003006005001002', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区生产技术组', '生产技术组', '100003006005001', null, '1', '1', '', '7bbea54d-82a1-4709-9f2b-ce1c3736bd68');
INSERT INTO `ts_uidp_org` VALUES ('f9e121c4-8068-4bce-abe1-a04877bf7a85', '100003006005001003', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区综合管理组', '综合管理组', '100003006005001', null, '1', '1', '', '7bbea54d-82a1-4709-9f2b-ce1c3736bd68');
INSERT INTO `ts_uidp_org` VALUES ('3d88d86e-d239-4674-ad2d-80422b26ce50', '100003006005001004', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区运行维护组', '运行维护组', '100003006005001', null, '1', '1', '', '7bbea54d-82a1-4709-9f2b-ce1c3736bd68');
INSERT INTO `ts_uidp_org` VALUES ('ad712b71-a8e5-4be4-91ae-a0f474b2563d', '100003006005001005', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区中控组', '中控组', '100003006005001', null, '1', '1', '', '7bbea54d-82a1-4709-9f2b-ce1c3736bd68');
INSERT INTO `ts_uidp_org` VALUES ('69b9c65e-5c79-4759-89b5-f0ff8ed31b35', '100003006005001006', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区计量组', '计量组', '100003006005001', null, '1', '1', '', '7bbea54d-82a1-4709-9f2b-ce1c3736bd68');
INSERT INTO `ts_uidp_org` VALUES ('dfb7b59b-19f5-4470-bc77-4db26c711c46', '100003006005001007', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区注采一组', '注采一组', '100003006005001', null, '1', '1', '', '7bbea54d-82a1-4709-9f2b-ce1c3736bd68');
INSERT INTO `ts_uidp_org` VALUES ('596f90f3-d615-417f-b607-3443de2dc396', '100003006005001008', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区注采二组', '注采二组', '100003006005001', null, '1', '1', '', '7bbea54d-82a1-4709-9f2b-ce1c3736bd68');
INSERT INTO `ts_uidp_org` VALUES ('ce5760e4-6367-4132-8146-a7015587ea22', '100003006005001009', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区注采三组', '注采三组', '100003006005001', null, '1', '1', '', '7bbea54d-82a1-4709-9f2b-ce1c3736bd68');
INSERT INTO `ts_uidp_org` VALUES ('e43242ce-b753-49c7-a2cc-1fe3bbb39c0c', '100003006005001010', '大港油田公司所属单位第二采油厂二厂所属第一采油作业区注采四组', '注采四组', '100003006005001', null, '1', '1', '', '7bbea54d-82a1-4709-9f2b-ce1c3736bd68');
INSERT INTO `ts_uidp_org` VALUES ('93c504ac-945f-4a83-a190-4d7569ee52e4', '100003006005002', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区', '第二采油作业区', '100003006005', null, '1', '1', '', '303cf30a-5de8-4811-99be-dd03972a5fc4');
INSERT INTO `ts_uidp_org` VALUES ('9d3a3e92-ef8f-42e0-a23e-6dd30223fc5a', '100003006005002001', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区领导', '领导', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('8399bd05-8b57-4ed5-adfb-924a0ff5bbbb', '100003006005002002', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区生产技术组', '生产技术组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('9838f479-e04d-425b-a073-519c54c6d15f', '100003006005002003', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区综合管理组', '综合管理组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('080a0de3-54ad-410a-b26f-90d0adfd20a5', '100003006005002004', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区运行维护组', '运行维护组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('ab2c11e1-9c07-4514-8efb-8ac2a436ce3c', '100003006005002005', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区中控组', '中控组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('91ce608f-76f2-4d48-abe5-38823ff9063c', '100003006005002006', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区巡护组', '巡护组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('6c2a5a21-9212-410d-842e-958c169a7625', '100003006005002007', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区计量组', '计量组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('e0b7b43a-ade9-47a1-9e36-6905bc1452be', '100003006005002008', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区注采一组', '注采一组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('cf975455-8363-404f-a5cb-70c55b67acb1', '100003006005002009', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区注采二组', '注采二组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('87d84e90-18c0-44c0-8a75-10cfa914bcd1', '100003006005002010', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区注采三组', '注采三组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('9638194b-5252-4378-a160-cc0629093618', '100003006005002011', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区注采四组', '注采四组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('149c6c85-73c3-4b35-bcce-55293c74a96e', '100003006005002012', '大港油田公司所属单位第二采油厂二厂所属第二采油作业区注采五组', '注采五组', '100003006005002', null, '1', '1', '', '93c504ac-945f-4a83-a190-4d7569ee52e4');
INSERT INTO `ts_uidp_org` VALUES ('86820edf-6c5a-45d6-a51f-eb6985c8b095', '100003006005003', '大港油田公司所属单位第二采油厂二厂所属第三采油作业区', '第三采油作业区', '100003006005', null, '1', '1', '', '303cf30a-5de8-4811-99be-dd03972a5fc4');
INSERT INTO `ts_uidp_org` VALUES ('7ab4fd29-fc02-4d00-aaf5-0cfefab24c08', '100003006005003001', '大港油田公司所属单位第二采油厂二厂所属第三采油作业区领导', '领导', '100003006005003', null, '1', '1', '', '86820edf-6c5a-45d6-a51f-eb6985c8b095');
INSERT INTO `ts_uidp_org` VALUES ('3e9d02e1-6869-405a-95aa-3f697a408546', '100003006005003002', '大港油田公司所属单位第二采油厂二厂所属第三采油作业区生产技术组', '生产技术组', '100003006005003', null, '1', '1', '', '86820edf-6c5a-45d6-a51f-eb6985c8b095');
INSERT INTO `ts_uidp_org` VALUES ('4184753f-e1b7-4007-925d-1a06c5f05eee', '100003006005003003', '大港油田公司所属单位第二采油厂二厂所属第三采油作业区综合管理组', '综合管理组', '100003006005003', null, '1', '1', '', '86820edf-6c5a-45d6-a51f-eb6985c8b095');
INSERT INTO `ts_uidp_org` VALUES ('003f73d8-51d7-4067-bc6c-fbb988d6cf40', '100003006005003004', '大港油田公司所属单位第二采油厂二厂所属第三采油作业区运行维护组', '运行维护组', '100003006005003', null, '1', '1', '', '86820edf-6c5a-45d6-a51f-eb6985c8b095');
INSERT INTO `ts_uidp_org` VALUES ('11571eac-91fb-450a-9ebd-0dcc3b89dc45', '100003006005003005', '大港油田公司所属单位第二采油厂二厂所属第三采油作业区注采一组', '注采一组', '100003006005003', null, '1', '1', '', '86820edf-6c5a-45d6-a51f-eb6985c8b095');
INSERT INTO `ts_uidp_org` VALUES ('8aeada98-7314-4152-864d-27b3e85db0ca', '100003006005003006', '大港油田公司所属单位第二采油厂二厂所属第三采油作业区注采二组', '注采二组', '100003006005003', null, '1', '1', '', '86820edf-6c5a-45d6-a51f-eb6985c8b095');
INSERT INTO `ts_uidp_org` VALUES ('c6545774-4be8-43d9-b1a6-c68bd6ed48d2', '100003006005003007', '大港油田公司所属单位第二采油厂二厂所属第三采油作业区注采三组', '注采三组', '100003006005003', null, '1', '1', '', '86820edf-6c5a-45d6-a51f-eb6985c8b095');
INSERT INTO `ts_uidp_org` VALUES ('61e32a48-14d3-4124-ac7c-fa32584bc1e4', '100003006005003008', '大港油田公司所属单位第二采油厂二厂所属第三采油作业区注采四组', '注采四组', '100003006005003', null, '1', '1', '', '86820edf-6c5a-45d6-a51f-eb6985c8b095');
INSERT INTO `ts_uidp_org` VALUES ('1e40747e-e730-44d3-a66d-827c6352ef89', '100003006005004', '大港油田公司所属单位第二采油厂二厂所属综合服务部', '综合服务部', '100003006005', null, '1', '1', '', '303cf30a-5de8-4811-99be-dd03972a5fc4');
INSERT INTO `ts_uidp_org` VALUES ('8d87a346-9a9a-42e0-9ff2-af132451e73f', '100003006005004001', '大港油田公司所属单位第二采油厂二厂所属综合服务部领导', '领导', '100003006005004', null, '1', '1', '', '1e40747e-e730-44d3-a66d-827c6352ef89');
INSERT INTO `ts_uidp_org` VALUES ('60a7f72f-e6e6-4656-a8c7-fe635aebc10f', '100003006005004002', '大港油田公司所属单位第二采油厂二厂所属综合服务部综合管理组', '综合管理组', '100003006005004', null, '1', '1', '', '1e40747e-e730-44d3-a66d-827c6352ef89');
INSERT INTO `ts_uidp_org` VALUES ('d4d9e14f-04c0-4a24-a958-89e262a056dd', '100003006005004003', '大港油田公司所属单位第二采油厂二厂所属综合服务部服务组', '服务组', '100003006005004', null, '1', '1', '', '1e40747e-e730-44d3-a66d-827c6352ef89');
INSERT INTO `ts_uidp_org` VALUES ('d63a65ee-2c86-4ad5-a872-0c81b41f2df0', '100003006005004004', '大港油田公司所属单位第二采油厂二厂所属综合服务部水电气组', '水电气组', '100003006005004', null, '1', '1', '', '1e40747e-e730-44d3-a66d-827c6352ef89');
INSERT INTO `ts_uidp_org` VALUES ('8159c887-41c1-4292-849a-91b174938bff', '100003006005004005', '大港油田公司所属单位第二采油厂二厂所属综合服务部餐饮组', '餐饮组', '100003006005004', null, '1', '1', '', '1e40747e-e730-44d3-a66d-827c6352ef89');
INSERT INTO `ts_uidp_org` VALUES ('6dc885ed-8c1f-4c8f-9b76-e30326eb362c', '100003006005005', '大港油田公司所属单位第二采油厂二厂所属专采队', '专采队', '100003006005', null, '1', '1', '', '303cf30a-5de8-4811-99be-dd03972a5fc4');
INSERT INTO `ts_uidp_org` VALUES ('e862827c-a40f-497a-90b4-96513eeb29ea', '100003006005006', '大港油田公司所属单位第二采油厂二厂所属维修队', '维修队', '100003006005', null, '1', '1', '', '303cf30a-5de8-4811-99be-dd03972a5fc4');
INSERT INTO `ts_uidp_org` VALUES ('53156b44-2f73-4aef-b18f-abe331acd6fa', '100003006005007', '大港油田公司所属单位第二采油厂二厂所属综合车队', '综合车队', '100003006005', null, '1', '1', '', '303cf30a-5de8-4811-99be-dd03972a5fc4');
INSERT INTO `ts_uidp_org` VALUES ('126d4af8-d6bb-4d1e-a8dc-ca40afa1de3b', '100003006006', '大港油田公司所属单位第二采油厂港骅派出所', '港骅派出所', '100003006', null, '1', '1', '', '5418f235-c7f9-42dc-b91b-8930f5d9fdb8');
INSERT INTO `ts_uidp_org` VALUES ('02619e28-3f8a-4e7d-b3a3-013dad0c9cbe', '100003006007', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司', '广源（沧州）石油技术服务有限公司', '100003006', null, '1', '1', '', '5418f235-c7f9-42dc-b91b-8930f5d9fdb8');
INSERT INTO `ts_uidp_org` VALUES ('39d9ea2d-d520-4593-90c1-7696e97ff7a4', '100003006007001', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司领导', '领导', '100003006007', null, '1', '1', '', '02619e28-3f8a-4e7d-b3a3-013dad0c9cbe');
INSERT INTO `ts_uidp_org` VALUES ('91cdcfdb-e8e4-431c-8af8-c4abfe8dac0b', '100003006007002', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司综合部', '综合部', '100003006007', null, '1', '1', '', '02619e28-3f8a-4e7d-b3a3-013dad0c9cbe');
INSERT INTO `ts_uidp_org` VALUES ('b9281cd8-764b-4775-8009-406debf7418c', '100003006007003', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司财务部', '财务部', '100003006007', null, '1', '1', '', '02619e28-3f8a-4e7d-b3a3-013dad0c9cbe');
INSERT INTO `ts_uidp_org` VALUES ('1a3fa23c-325e-4f39-abd8-47931b3d7a20', '100003006007004', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司企管部', '企管部', '100003006007', null, '1', '1', '', '02619e28-3f8a-4e7d-b3a3-013dad0c9cbe');
INSERT INTO `ts_uidp_org` VALUES ('3a09aac8-4db3-47f6-a2a2-36619759c72b', '100003006007005', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司安全部', '安全部', '100003006007', null, '1', '1', '', '02619e28-3f8a-4e7d-b3a3-013dad0c9cbe');
INSERT INTO `ts_uidp_org` VALUES ('87cf0701-2639-4808-bce0-35e353d16ac5', '100003006007006', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司物资部', '物资部', '100003006007', null, '1', '1', '', '02619e28-3f8a-4e7d-b3a3-013dad0c9cbe');
INSERT INTO `ts_uidp_org` VALUES ('81f23c78-91db-462d-b2d8-c641333593d8', '100003006007007', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司轻烃厂', '轻烃厂', '100003006007', null, '1', '1', '', '02619e28-3f8a-4e7d-b3a3-013dad0c9cbe');
INSERT INTO `ts_uidp_org` VALUES ('a0ddca55-40a6-4f9b-8b6d-24a538b787bf', '100003006007008', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司机电修理队', '机电修理队', '100003006007', null, '1', '1', '', '02619e28-3f8a-4e7d-b3a3-013dad0c9cbe');
INSERT INTO `ts_uidp_org` VALUES ('1bebdbca-f9ff-46af-8ba1-56041ee91ae2', '100003006007009', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司天然气发电机队', '天然气发电机队', '100003006007', null, '1', '1', '', '02619e28-3f8a-4e7d-b3a3-013dad0c9cbe');
INSERT INTO `ts_uidp_org` VALUES ('ea7f74bf-b843-4a7a-911f-2fb07776b1bf', '100003006007010', '大港油田公司所属单位第二采油厂广源（沧州）石油技术服务有限公司调剖队', '调剖队', '100003006007', null, '1', '1', '', '02619e28-3f8a-4e7d-b3a3-013dad0c9cbe');
INSERT INTO `ts_uidp_org` VALUES ('8d83c586-4e3f-4e0a-b601-06a5815d6876', '100003007', '大港油田公司所属单位第三采油厂', '第三采油厂', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('9a9f7bcb-6015-43a6-8825-6ad2b0727652', '100003007001', '大港油田公司所属单位第三采油厂三厂领导', '三厂领导', '100003007', null, '1', '1', '', '8d83c586-4e3f-4e0a-b601-06a5815d6876');
INSERT INTO `ts_uidp_org` VALUES ('0ed23bda-0271-44f4-8184-9c7dbe8a64ba', '100003007001001', '大港油田公司所属单位第三采油厂三厂领导老领导', '老领导', '100003007001', null, '1', '1', '', '9a9f7bcb-6015-43a6-8825-6ad2b0727652');
INSERT INTO `ts_uidp_org` VALUES ('f15bc8be-5f50-4ee0-afde-db926ea3f03d', '100003007002', '大港油田公司所属单位第三采油厂三厂助理', '三厂助理', '100003007', null, '1', '1', '', '8d83c586-4e3f-4e0a-b601-06a5815d6876');
INSERT INTO `ts_uidp_org` VALUES ('78041530-0962-4094-a5f6-0469257e195d', '100003007003', '大港油田公司所属单位第三采油厂三厂机关', '三厂机关', '100003007', null, '1', '1', '', '8d83c586-4e3f-4e0a-b601-06a5815d6876');
INSERT INTO `ts_uidp_org` VALUES ('0c4a2c41-9fd8-47fe-8153-80b42936bcf0', '100003007003001', '大港油田公司所属单位第三采油厂三厂机关厂长办公室', '厂长办公室', '100003007003', null, '1', '1', '', '78041530-0962-4094-a5f6-0469257e195d');
INSERT INTO `ts_uidp_org` VALUES ('3e770b5e-b953-4c43-bc99-026f64441b14', '100003007003002', '大港油田公司所属单位第三采油厂三厂机关党群工作部', '党群工作部', '100003007003', null, '1', '1', '', '78041530-0962-4094-a5f6-0469257e195d');
INSERT INTO `ts_uidp_org` VALUES ('f2c821dd-ab74-4639-9a54-e2eb6dc59697', '100003007003003', '大港油田公司所属单位第三采油厂三厂机关人事劳资部', '人事劳资部', '100003007003', null, '1', '1', '', '78041530-0962-4094-a5f6-0469257e195d');
INSERT INTO `ts_uidp_org` VALUES ('c127548f-3e49-4a27-bf97-efaa6c89ae5d', '100003007003004', '大港油田公司所属单位第三采油厂三厂机关财务资产部', '财务资产部', '100003007003', null, '1', '1', '', '78041530-0962-4094-a5f6-0469257e195d');
INSERT INTO `ts_uidp_org` VALUES ('5caa56ee-fce7-4883-b9dc-98b5a83be0e0', '100003007003005', '大港油田公司所属单位第三采油厂三厂机关生产运行部', '生产运行部', '100003007003', null, '1', '1', '', '78041530-0962-4094-a5f6-0469257e195d');
INSERT INTO `ts_uidp_org` VALUES ('69c866bc-9780-41fa-badd-373de87012b6', '100003007003006', '大港油田公司所属单位第三采油厂三厂机关质安环保部', '质安环保部', '100003007003', null, '1', '1', '', '78041530-0962-4094-a5f6-0469257e195d');
INSERT INTO `ts_uidp_org` VALUES ('a03bf48d-5330-4824-a3b9-045d6c3b7ece', '100003007003006001', '大港油田公司所属单位第三采油厂三厂机关质安环保部部室领导', '部室领导', '100003007003006', null, '1', '1', '', '69c866bc-9780-41fa-badd-373de87012b6');
INSERT INTO `ts_uidp_org` VALUES ('34664ee3-2121-482c-94c2-9ca489f87c01', '100003007003006002', '大港油田公司所属单位第三采油厂三厂机关质安环保部安全管理', '安全管理', '100003007003006', null, '1', '1', '', '69c866bc-9780-41fa-badd-373de87012b6');
INSERT INTO `ts_uidp_org` VALUES ('5eef0b4e-6a9d-4a85-a061-1d73edcaf738', '100003007003006003', '大港油田公司所属单位第三采油厂三厂机关质安环保部环保管理', '环保管理', '100003007003006', null, '1', '1', '', '69c866bc-9780-41fa-badd-373de87012b6');
INSERT INTO `ts_uidp_org` VALUES ('b208663e-4054-4062-a7c7-b2a6fd8b5ad3', '100003007003007', '大港油田公司所属单位第三采油厂三厂机关经营计划部', '经营计划部', '100003007003', null, '1', '1', '', '78041530-0962-4094-a5f6-0469257e195d');
INSERT INTO `ts_uidp_org` VALUES ('6ec1571f-f3c0-4bdc-8fb6-65c7eb88213d', '100003007003008', '大港油田公司所属单位第三采油厂三厂机关公共关系部', '公共关系部', '100003007003', null, '1', '1', '', '78041530-0962-4094-a5f6-0469257e195d');
INSERT INTO `ts_uidp_org` VALUES ('fae73465-49c6-416c-a7ae-afc30afbb3d8', '100003007003009', '大港油田公司所属单位第三采油厂三厂机关油田管理部', '油田管理部', '100003007003', null, '1', '1', '', '78041530-0962-4094-a5f6-0469257e195d');
INSERT INTO `ts_uidp_org` VALUES ('e9091805-0548-4ab4-b6a3-d35b31753a48', '100003007003010', '大港油田公司所属单位第三采油厂三厂机关纪检监察部', '纪检监察部', '100003007003', null, '1', '1', '', '78041530-0962-4094-a5f6-0469257e195d');
INSERT INTO `ts_uidp_org` VALUES ('f1a52462-1043-478d-8a7c-31744de6848e', '100003007004', '大港油田公司所属单位第三采油厂三厂直属', '三厂直属', '100003007', null, '1', '1', '', '8d83c586-4e3f-4e0a-b601-06a5815d6876');
INSERT INTO `ts_uidp_org` VALUES ('6d18993b-6f48-4122-8ca2-386bab89af4b', '100003007004001', '大港油田公司所属单位第三采油厂三厂直属地质研究所', '地质研究所', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('52dd10fa-733b-4b43-b586-aeb268a7c4d8', '100003007004001001', '大港油田公司所属单位第三采油厂三厂直属地质研究所地质领导', '地质领导', '100003007004001', null, '1', '1', '', '6d18993b-6f48-4122-8ca2-386bab89af4b');
INSERT INTO `ts_uidp_org` VALUES ('d4146fcd-0bc2-4a0a-9f34-b908f769d8c0', '100003007004001002', '大港油田公司所属单位第三采油厂三厂直属地质研究所综合办公室', '综合办公室', '100003007004001', null, '1', '1', '', '6d18993b-6f48-4122-8ca2-386bab89af4b');
INSERT INTO `ts_uidp_org` VALUES ('f5260dd1-13f1-4461-a7c4-a269d08f573d', '100003007004001003', '大港油田公司所属单位第三采油厂三厂直属地质研究所综合研究室', '综合研究室', '100003007004001', null, '1', '1', '', '6d18993b-6f48-4122-8ca2-386bab89af4b');
INSERT INTO `ts_uidp_org` VALUES ('e908c763-dab4-4b09-808d-540a17ad14cd', '100003007004001004', '大港油田公司所属单位第三采油厂三厂直属地质研究所油藏动态室', '油藏动态室', '100003007004001', null, '1', '1', '', '6d18993b-6f48-4122-8ca2-386bab89af4b');
INSERT INTO `ts_uidp_org` VALUES ('b1478b46-ba53-4999-bab8-7929482fb071', '100003007004001005', '大港油田公司所属单位第三采油厂三厂直属地质研究所产能建设室', '产能建设室', '100003007004001', null, '1', '1', '', '6d18993b-6f48-4122-8ca2-386bab89af4b');
INSERT INTO `ts_uidp_org` VALUES ('af16c609-6605-47b6-a77d-eea2c5dbdca2', '100003007004001006', '大港油田公司所属单位第三采油厂三厂直属地质研究所滚动评价室', '滚动评价室', '100003007004001', null, '1', '1', '', '6d18993b-6f48-4122-8ca2-386bab89af4b');
INSERT INTO `ts_uidp_org` VALUES ('6e64a265-e0e1-4ede-9e0d-31d228121a45', '100003007004001007', '大港油田公司所属单位第三采油厂三厂直属地质研究所数据管理室', '数据管理室', '100003007004001', null, '1', '1', '', '6d18993b-6f48-4122-8ca2-386bab89af4b');
INSERT INTO `ts_uidp_org` VALUES ('cdb2e7b8-370e-4514-9d64-7523bfcef7c2', '100003007004001008', '大港油田公司所属单位第三采油厂三厂直属地质研究所生产室', '生产室', '100003007004001', null, '1', '1', '', '6d18993b-6f48-4122-8ca2-386bab89af4b');
INSERT INTO `ts_uidp_org` VALUES ('bf84f980-754a-45e3-9ea4-c42f039b0f68', '100003007004001009', '大港油田公司所属单位第三采油厂三厂直属地质研究所化验室', '化验室', '100003007004001', null, '1', '1', '', '6d18993b-6f48-4122-8ca2-386bab89af4b');
INSERT INTO `ts_uidp_org` VALUES ('f07acdff-2547-4e72-896f-01bb344708fa', '100003007004002', '大港油田公司所属单位第三采油厂三厂直属工艺研究所', '工艺研究所', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('9c9c1201-106a-4481-b9d7-194a81ff78d7', '100003007004002001', '大港油田公司所属单位第三采油厂三厂直属工艺研究所所领导', '所领导', '100003007004002', null, '1', '1', '', 'f07acdff-2547-4e72-896f-01bb344708fa');
INSERT INTO `ts_uidp_org` VALUES ('ff28a074-03b1-4320-92e2-f2719d14e1db', '100003007004002002', '大港油田公司所属单位第三采油厂三厂直属工艺研究所专家组', '专家组', '100003007004002', null, '1', '1', '', 'f07acdff-2547-4e72-896f-01bb344708fa');
INSERT INTO `ts_uidp_org` VALUES ('5af15ef4-9746-44e2-959e-a5c2136b458b', '100003007004002003', '大港油田公司所属单位第三采油厂三厂直属工艺研究所综合室', '综合室', '100003007004002', null, '1', '1', '', 'f07acdff-2547-4e72-896f-01bb344708fa');
INSERT INTO `ts_uidp_org` VALUES ('f2eeb84e-b36c-4dd2-b10d-f8ff42eb1da2', '100003007004002004', '大港油田公司所属单位第三采油厂三厂直属工艺研究所注水室', '注水室', '100003007004002', null, '1', '1', '', 'f07acdff-2547-4e72-896f-01bb344708fa');
INSERT INTO `ts_uidp_org` VALUES ('93e6afe0-5312-4fdd-8c9e-aaf7be4a3dbc', '100003007004002005', '大港油田公司所属单位第三采油厂三厂直属工艺研究所提高采收率室', '提高采收率室', '100003007004002', null, '1', '1', '', 'f07acdff-2547-4e72-896f-01bb344708fa');
INSERT INTO `ts_uidp_org` VALUES ('287e3365-d00f-4c93-b422-ac975d4fd976', '100003007004002006', '大港油田公司所属单位第三采油厂三厂直属工艺研究所计量室', '计量室', '100003007004002', null, '1', '1', '', 'f07acdff-2547-4e72-896f-01bb344708fa');
INSERT INTO `ts_uidp_org` VALUES ('1b8f8b93-a543-4e50-bbf0-c522f34a980d', '100003007004002007', '大港油田公司所属单位第三采油厂三厂直属工艺研究所集输室', '集输室', '100003007004002', null, '1', '1', '', 'f07acdff-2547-4e72-896f-01bb344708fa');
INSERT INTO `ts_uidp_org` VALUES ('5b099dbb-21a2-46a5-867a-c23eff0d3c38', '100003007004002008', '大港油田公司所属单位第三采油厂三厂直属工艺研究所机电室', '机电室', '100003007004002', null, '1', '1', '', 'f07acdff-2547-4e72-896f-01bb344708fa');
INSERT INTO `ts_uidp_org` VALUES ('ef770e0f-018f-488d-92fd-c469b0c675b1', '100003007004002009', '大港油田公司所属单位第三采油厂三厂直属工艺研究所化学室', '化学室', '100003007004002', null, '1', '1', '', 'f07acdff-2547-4e72-896f-01bb344708fa');
INSERT INTO `ts_uidp_org` VALUES ('c29ba60a-6032-4726-9d23-2b2ccc84ccd8', '100003007004002010', '大港油田公司所属单位第三采油厂三厂直属工艺研究所防腐防垢室', '防腐防垢室', '100003007004002', null, '1', '1', '', 'f07acdff-2547-4e72-896f-01bb344708fa');
INSERT INTO `ts_uidp_org` VALUES ('970fd328-9ff4-44bf-b29a-a3cfae7bd4a5', '100003007004003', '大港油田公司所属单位第三采油厂三厂直属项目管理中心', '项目管理中心', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('9a98b7b9-8ab6-47fd-a59a-33ca350b1ea8', '100003007004003001', '大港油田公司所属单位第三采油厂三厂直属项目管理中心项目办领导', '项目办领导', '100003007004003', null, '1', '1', '', '970fd328-9ff4-44bf-b29a-a3cfae7bd4a5');
INSERT INTO `ts_uidp_org` VALUES ('cc378b98-b9a7-4b20-824a-fd64c53261b2', '100003007004003002', '大港油田公司所属单位第三采油厂三厂直属项目管理中心综合科', '综合科', '100003007004003', null, '1', '1', '', '970fd328-9ff4-44bf-b29a-a3cfae7bd4a5');
INSERT INTO `ts_uidp_org` VALUES ('7c10cfcb-6b6c-463d-b3fb-abf3d592aa4d', '100003007004003003', '大港油田公司所属单位第三采油厂三厂直属项目管理中心施工科', '施工科', '100003007004003', null, '1', '1', '', '970fd328-9ff4-44bf-b29a-a3cfae7bd4a5');
INSERT INTO `ts_uidp_org` VALUES ('8b306df1-6f32-4ca6-a9cc-39abf847bbe1', '100003007004003004', '大港油田公司所属单位第三采油厂三厂直属项目管理中心土建科', '土建科', '100003007004003', null, '1', '1', '', '970fd328-9ff4-44bf-b29a-a3cfae7bd4a5');
INSERT INTO `ts_uidp_org` VALUES ('4acd1ed8-afa0-412f-a0c2-55106d707bc9', '100003007004004', '大港油田公司所属单位第三采油厂三厂直属修井管理中心', '修井管理中心', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('38dc425e-cbc3-4462-9e81-c62ec8433356', '100003007004004001', '大港油田公司所属单位第三采油厂三厂直属修井管理中心中心领导', '中心领导', '100003007004004', null, '1', '1', '', '4acd1ed8-afa0-412f-a0c2-55106d707bc9');
INSERT INTO `ts_uidp_org` VALUES ('fd6bc4af-4ab2-4f8c-83cf-43cd5676f423', '100003007004004002', '大港油田公司所属单位第三采油厂三厂直属修井管理中心中心专家组', '中心专家组', '100003007004004', null, '1', '1', '', '4acd1ed8-afa0-412f-a0c2-55106d707bc9');
INSERT INTO `ts_uidp_org` VALUES ('633f06f7-07b3-4bda-8cb8-d4d59607d51c', '100003007004004003', '大港油田公司所属单位第三采油厂三厂直属修井管理中心综合室', '综合室', '100003007004004', null, '1', '1', '', '4acd1ed8-afa0-412f-a0c2-55106d707bc9');
INSERT INTO `ts_uidp_org` VALUES ('b0739827-4694-48b5-9d33-f0d29f2b1111', '100003007004004004', '大港油田公司所属单位第三采油厂三厂直属修井管理中心采油工艺室', '采油工艺室', '100003007004004', null, '1', '1', '', '4acd1ed8-afa0-412f-a0c2-55106d707bc9');
INSERT INTO `ts_uidp_org` VALUES ('d9fc491f-a23d-43b4-b1eb-7099e305271a', '100003007004004005', '大港油田公司所属单位第三采油厂三厂直属修井管理中心经营管理室', '经营管理室', '100003007004004', null, '1', '1', '', '4acd1ed8-afa0-412f-a0c2-55106d707bc9');
INSERT INTO `ts_uidp_org` VALUES ('4b34769c-60cc-45c7-8760-6e0b71a49ed2', '100003007004004006', '大港油田公司所属单位第三采油厂三厂直属修井管理中心修井准备室', '修井准备室', '100003007004004', null, '1', '1', '', '4acd1ed8-afa0-412f-a0c2-55106d707bc9');
INSERT INTO `ts_uidp_org` VALUES ('5213a5a6-9477-49a8-9e6c-9a20e7f7c7d6', '100003007004004007', '大港油田公司所属单位第三采油厂三厂直属修井管理中心修井管理室', '修井管理室', '100003007004004', null, '1', '1', '', '4acd1ed8-afa0-412f-a0c2-55106d707bc9');
INSERT INTO `ts_uidp_org` VALUES ('5a73cd1c-8dee-4e56-b07a-91f4014d263c', '100003007004005', '大港油田公司所属单位第三采油厂三厂直属物资装备管理中心', '物资装备管理中心', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('609e61c3-6fd2-4059-b61d-f7997d8c74ff', '100003007004006', '大港油田公司所属单位第三采油厂三厂直属电力管理中心', '电力管理中心', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('3a6a80ee-297c-4bbc-9eb7-ea9a23f02ee1', '100003007004006001', '大港油田公司所属单位第三采油厂三厂直属电力管理中心中心领导', '中心领导', '100003007004006', null, '1', '1', '', '609e61c3-6fd2-4059-b61d-f7997d8c74ff');
INSERT INTO `ts_uidp_org` VALUES ('1ceebc98-9965-4be9-b001-9820ae777ca7', '100003007004006002', '大港油田公司所属单位第三采油厂三厂直属电力管理中心综合管理科', '综合管理科', '100003007004006', null, '1', '1', '', '609e61c3-6fd2-4059-b61d-f7997d8c74ff');
INSERT INTO `ts_uidp_org` VALUES ('b380e49d-ef01-42fd-95a3-fd37840942be', '100003007004006003', '大港油田公司所属单位第三采油厂三厂直属电力管理中心运行科', '运行科', '100003007004006', null, '1', '1', '', '609e61c3-6fd2-4059-b61d-f7997d8c74ff');
INSERT INTO `ts_uidp_org` VALUES ('be73e3f2-d97b-4d43-94c1-58d61e3648df', '100003007004006004', '大港油田公司所属单位第三采油厂三厂直属电力管理中心电气科', '电气科', '100003007004006', null, '1', '1', '', '609e61c3-6fd2-4059-b61d-f7997d8c74ff');
INSERT INTO `ts_uidp_org` VALUES ('76b70f26-c3ed-4853-8580-ef0f20717af2', '100003007004006005', '大港油田公司所属单位第三采油厂三厂直属电力管理中心一中队', '一中队', '100003007004006', null, '1', '1', '', '609e61c3-6fd2-4059-b61d-f7997d8c74ff');
INSERT INTO `ts_uidp_org` VALUES ('19ab0928-5156-4498-af0f-d566f4b7b8a2', '100003007004006006', '大港油田公司所属单位第三采油厂三厂直属电力管理中心二中队', '二中队', '100003007004006', null, '1', '1', '', '609e61c3-6fd2-4059-b61d-f7997d8c74ff');
INSERT INTO `ts_uidp_org` VALUES ('36a8437a-0505-4970-8ce5-95654a4404b0', '100003007004006007', '大港油田公司所属单位第三采油厂三厂直属电力管理中心三中队', '三中队', '100003007004006', null, '1', '1', '', '609e61c3-6fd2-4059-b61d-f7997d8c74ff');
INSERT INTO `ts_uidp_org` VALUES ('eb31e601-8dda-4df6-8965-043c3c1bf8cf', '100003007004006008', '大港油田公司所属单位第三采油厂三厂直属电力管理中心四中队', '四中队', '100003007004006', null, '1', '1', '', '609e61c3-6fd2-4059-b61d-f7997d8c74ff');
INSERT INTO `ts_uidp_org` VALUES ('8c68ec05-2a8f-4c4f-a10e-4c7954904b5e', '100003007004007', '大港油田公司所属单位第三采油厂三厂直属培训中心（技能鉴定站）', '培训中心（技能鉴定站）', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('d645926e-260b-4d64-bd89-4ccc3e385983', '100003007004008', '大港油田公司所属单位第三采油厂三厂直属保卫中心（经警大队）', '保卫中心（经警大队）', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('aa77de56-83d8-47d6-9f2f-16b710576b0b', '100003007004009', '大港油田公司所属单位第三采油厂三厂直属产能建设中心', '产能建设中心', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('7f97e692-5e05-4cda-ac6b-2e9418f203c1', '100003007004009001', '大港油田公司所属单位第三采油厂三厂直属产能建设中心部室领导', '部室领导', '100003007004009', null, '1', '1', '', 'aa77de56-83d8-47d6-9f2f-16b710576b0b');
INSERT INTO `ts_uidp_org` VALUES ('3767d3ac-a094-4c78-aab6-2d1ea2cff965', '100003007004009002', '大港油田公司所属单位第三采油厂三厂直属产能建设中心综合管理科', '综合管理科', '100003007004009', null, '1', '1', '', 'aa77de56-83d8-47d6-9f2f-16b710576b0b');
INSERT INTO `ts_uidp_org` VALUES ('cbe71d7d-4ee0-49bc-b882-ae93e5bf4c67', '100003007004009003', '大港油田公司所属单位第三采油厂三厂直属产能建设中心地面工程科', '地面工程科', '100003007004009', null, '1', '1', '', 'aa77de56-83d8-47d6-9f2f-16b710576b0b');
INSERT INTO `ts_uidp_org` VALUES ('18083103-89b5-4fa6-ac44-6a8ad958cefd', '100003007004009004', '大港油田公司所属单位第三采油厂三厂直属产能建设中心钻井工程科', '钻井工程科', '100003007004009', null, '1', '1', '', 'aa77de56-83d8-47d6-9f2f-16b710576b0b');
INSERT INTO `ts_uidp_org` VALUES ('b62c258b-b21f-454d-87f2-641c904630f4', '100003007004009005', '大港油田公司所属单位第三采油厂三厂直属产能建设中心试油工程科', '试油工程科', '100003007004009', null, '1', '1', '', 'aa77de56-83d8-47d6-9f2f-16b710576b0b');
INSERT INTO `ts_uidp_org` VALUES ('a5693d91-7c9b-406b-a4b5-e7421f62958a', '100003007004010', '大港油田公司所属单位第三采油厂三厂直属综合服务中心', '综合服务中心', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('49a91c49-33fb-44b4-a15b-1c643c36f7ac', '100003007004010001', '大港油田公司所属单位第三采油厂三厂直属综合服务中心中心领导', '中心领导', '100003007004010', null, '1', '1', '', 'a5693d91-7c9b-406b-a4b5-e7421f62958a');
INSERT INTO `ts_uidp_org` VALUES ('036b1a92-4711-4a0a-8483-e12d0c44cc14', '100003007004010002', '大港油田公司所属单位第三采油厂三厂直属综合服务中心机关车队', '机关车队', '100003007004010', null, '1', '1', '', 'a5693d91-7c9b-406b-a4b5-e7421f62958a');
INSERT INTO `ts_uidp_org` VALUES ('5e2c0357-68aa-406f-ab57-a6ce569e8872', '100003007004010003', '大港油田公司所属单位第三采油厂三厂直属综合服务中心综合事务组', '综合事务组', '100003007004010', null, '1', '1', '', 'a5693d91-7c9b-406b-a4b5-e7421f62958a');
INSERT INTO `ts_uidp_org` VALUES ('8913ec40-5161-49ef-824e-c56ef086ea42', '100003007004010004', '大港油田公司所属单位第三采油厂三厂直属综合服务中心文化站', '文化站', '100003007004010', null, '1', '1', '', 'a5693d91-7c9b-406b-a4b5-e7421f62958a');
INSERT INTO `ts_uidp_org` VALUES ('a2b5182a-c621-43d2-bbb2-a2f9861e316b', '100003007004010005', '大港油田公司所属单位第三采油厂三厂直属综合服务中心驻港工作站', '驻港工作站', '100003007004010', null, '1', '1', '', 'a5693d91-7c9b-406b-a4b5-e7421f62958a');
INSERT INTO `ts_uidp_org` VALUES ('314e79a6-5017-41f6-b827-e7f701f5ff6a', '100003007004010006', '大港油田公司所属单位第三采油厂三厂直属综合服务中心档案室', '档案室', '100003007004010', null, '1', '1', '', 'a5693d91-7c9b-406b-a4b5-e7421f62958a');
INSERT INTO `ts_uidp_org` VALUES ('4f7505bc-2569-48af-9c59-b116202851d7', '100003007004011', '大港油田公司所属单位第三采油厂三厂直属信息档案中心', '信息档案中心', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('ef4e3065-fead-4137-b468-37b9a01774e1', '100003007004012', '大港油田公司所属单位第三采油厂三厂直属预算中心', '预算中心', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('128135bb-d46b-40d7-82ab-591a90631e36', '100003007004013', '大港油田公司所属单位第三采油厂三厂直属HSE监督中心', 'HSE监督中心', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('243154c5-64fb-43f2-9da8-5d03281be12a', '100003007004014', '大港油田公司所属单位第三采油厂三厂直属人事服务中心', '人事服务中心', '100003007004', null, '1', '1', '', 'f1a52462-1043-478d-8a7c-31744de6848e');
INSERT INTO `ts_uidp_org` VALUES ('f6f22c30-50b1-4721-a8c2-99ee019127b1', '100003007005', '大港油田公司所属单位第三采油厂三厂所属', '三厂所属', '100003007', null, '1', '1', '', '8d83c586-4e3f-4e0a-b601-06a5815d6876');
INSERT INTO `ts_uidp_org` VALUES ('047879e9-ebbd-484e-aa8c-8e5e37cfe369', '100003007005001', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区', '第一采油作业区', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('4794cda2-9618-4e23-8e87-41e563dd6b38', '100003007005001001', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区作业区领导', '作业区领导', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('7ec0ca85-3e3b-477e-8d09-0d9fa2af7bdb', '100003007005001001001', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区作业区领导老领导', '老领导', '100003007005001001', null, '1', '1', '', '4794cda2-9618-4e23-8e87-41e563dd6b38');
INSERT INTO `ts_uidp_org` VALUES ('961e3709-bc11-4b5c-8ebf-9d69b1965814', '100003007005001002', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区综合管理科', '综合管理科', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('7c67545e-a9d1-457f-8fb6-4d724fefbeeb', '100003007005001003', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区油田管理科', '油田管理科', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('47552a05-ed10-48ed-a79b-2448fadba9d7', '100003007005001004', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区修井工作站', '修井工作站', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('1613450d-8ef5-49ff-a9d6-53967216079f', '100003007005001005', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区生产管理科', '生产管理科', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('7c918e5b-5c9e-4978-80ca-82c879fc3ab1', '100003007005001006', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区经营管理科', '经营管理科', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('588ef4c1-8f73-483a-949a-be534a3a8c3e', '100003007005001007', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区工艺站', '工艺站', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('06a42c2d-8092-403b-8d54-6d597294e3e5', '100003007005001008', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区地质站', '地质站', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('00b1adb0-3571-469a-bc75-ab8b9f0843c0', '100003007005001009', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区电力管理办公室', '电力管理办公室', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('33e1260f-726f-44c9-9797-a43ffebd9e05', '100003007005001010', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区车队', '车队', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('807bb61a-e7f5-4bca-967d-82f2b5d2aab5', '100003007005001011', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区经警队', '经警队', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('23216d9c-af15-46f9-a818-8fcd60554281', '100003007005001012', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区维修队', '维修队', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('69560af7-b690-4641-afa3-204130d4960e', '100003007005001013', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区第一管理站', '第一管理站', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('fea0a2e8-c289-44fd-a18b-45bcbbad002e', '100003007005001014', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区第二管理站', '第二管理站', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('a91e70c6-ceb1-4533-bb2d-778a326a57fb', '100003007005001015', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区第三管理站', '第三管理站', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('b0d3af67-8146-43f3-94a6-02bc7f083cc8', '100003007005001016', '大港油田公司所属单位第三采油厂三厂所属第一采油作业区第四管理站', '第四管理站', '100003007005001', null, '1', '1', '', '047879e9-ebbd-484e-aa8c-8e5e37cfe369');
INSERT INTO `ts_uidp_org` VALUES ('9c72e47d-5280-4f29-b6be-422442a55d7b', '100003007005002', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区', '第二采油作业区', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('81c49324-8081-40b0-a624-55fecc6c8b2f', '100003007005002001', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区作业区领导', '作业区领导', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('155748cf-79a1-4a3e-a62b-04a28219d9c8', '100003007005002002', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区综合管理科', '综合管理科', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('b7d143e0-9f50-4c0b-9098-16f24229471f', '100003007005002003', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区油田管理科', '油田管理科', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('1e96a5d3-9bfd-4d84-b7d4-bef002035547', '100003007005002004', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区修井工作站', '修井工作站', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('ec0bf48e-c606-4a41-b1d3-614f4338453c', '100003007005002005', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区生产管理科', '生产管理科', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('14da6cdb-6f4d-4118-a4e7-a53c909ff861', '100003007005002006', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区经营管理科', '经营管理科', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('fcfae24a-83af-4f0c-a600-03b7c8881ff5', '100003007005002007', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区工艺站', '工艺站', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('d8dc1522-5035-441b-b521-c5ee96b48b80', '100003007005002008', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区地质站', '地质站', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('a49d6be8-e759-4916-8670-e6c5a2f85f69', '100003007005002009', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区电力管理办公室', '电力管理办公室', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('00181e87-144e-4db5-8b15-eca0aa0d39c5', '100003007005002010', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区车队', '车队', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('fae3664b-f106-4b14-92bc-f2e0d9e91001', '100003007005002011', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区经警队', '经警队', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('e03aaa83-0e1b-4c0e-bd7c-b28235c4cc8c', '100003007005002012', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区维修队', '维修队', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('2075f794-fb06-4c0c-a580-42fd0849c788', '100003007005002013', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区第一管理站', '第一管理站', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('a7292e9b-8fd6-4701-a10a-6eba09dbc4f6', '100003007005002014', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区第二管理站', '第二管理站', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('e232c142-8344-43a8-a583-16642f455c34', '100003007005002015', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区第三管理站', '第三管理站', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('a6ca1a7d-fdae-473a-827c-e71d8a8c455d', '100003007005002016', '大港油田公司所属单位第三采油厂三厂所属第二采油作业区第四管理站', '第四管理站', '100003007005002', null, '1', '1', '', '9c72e47d-5280-4f29-b6be-422442a55d7b');
INSERT INTO `ts_uidp_org` VALUES ('a89dcafa-36ab-4e91-8235-f9d14eed19e2', '100003007005003', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区', '第三采油作业区', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('820e893e-3629-43a5-8a6c-305c94b778d3', '100003007005003001', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区作业区领导', '作业区领导', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('655dc75c-22ee-48c7-929e-77ea0fb43340', '100003007005003002', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区综合管理科', '综合管理科', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('2c5180e1-2c56-45f8-8cba-f01c7d9263c4', '100003007005003003', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区油田管理科', '油田管理科', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('a3a87f6a-9c51-4b3a-a45d-fe56a78886bc', '100003007005003004', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区修井工作站', '修井工作站', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('dabd9a43-8979-4e20-95e9-818a4d4b1793', '100003007005003005', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区生产管理科', '生产管理科', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('81a538a7-f9e7-498b-85c3-a6df891cdc31', '100003007005003006', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区经营管理科', '经营管理科', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('fed02dcc-cfde-4f74-be15-f86e9de6c337', '100003007005003007', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区工艺站', '工艺站', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('20a1b14b-171a-4d11-8a59-76c3f2abb786', '100003007005003008', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区地质站', '地质站', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('dec9c340-2e5b-48df-9d89-c079ff96ab97', '100003007005003009', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区电力管理办公室', '电力管理办公室', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('4ce2c14d-f67d-46a8-97b9-c38fdd34968e', '100003007005003010', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区车队', '车队', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('ede91db6-cf72-4d62-ba0b-184fbf0923d6', '100003007005003011', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区经警队', '经警队', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('0bd849ec-af1a-4039-a46d-698df03e211c', '100003007005003012', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区维修队', '维修队', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('ba11df1e-fc4f-4184-9583-ad8741d203ce', '100003007005003013', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区第一管理站', '第一管理站', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('9d460573-b27b-443d-948f-2efa5204e386', '100003007005003014', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区第二管理站', '第二管理站', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('8faa2fd2-0fd0-4173-b53a-a81c55a75108', '100003007005003015', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区第三管理站', '第三管理站', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('8a737721-ffe2-461b-b8f8-1aa5ad0bdb24', '100003007005003016', '大港油田公司所属单位第三采油厂三厂所属第三采油作业区第四管理站', '第四管理站', '100003007005003', null, '1', '1', '', 'a89dcafa-36ab-4e91-8235-f9d14eed19e2');
INSERT INTO `ts_uidp_org` VALUES ('b1d08c84-7528-44b3-a409-e91252f6e191', '100003007005004', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区', '第四采油作业区', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('eb06f512-440a-4f29-b3f7-4f77e9927c5c', '100003007005004001', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区作业区领导', '作业区领导', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('05e040b0-739d-41a1-8662-73d07af42853', '100003007005004002', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区综合管理科', '综合管理科', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('8266d881-801b-419c-8451-2bcb71f72bcf', '100003007005004003', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区油田管理科', '油田管理科', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('f8c4a4ed-048c-432c-b509-f1fb2d154d96', '100003007005004004', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区修井工作站', '修井工作站', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('33305eef-0c36-41fa-af4a-434b111dc6a5', '100003007005004005', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区生产管理科', '生产管理科', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('148f139c-96e2-4fc3-9d9d-69a7d58843f6', '100003007005004006', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区经营管理科', '经营管理科', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('97b8d3d5-5659-43f9-8412-e48ca5c82264', '100003007005004007', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区工艺站', '工艺站', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('3f3251a7-1de2-4259-b9db-6bc781b6967f', '100003007005004008', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区地质站', '地质站', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('51dcf4e8-bc3c-4b9d-9abc-8c6c093ee4b5', '100003007005004009', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区电力管理办公室', '电力管理办公室', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('524410e4-38d2-468e-acfd-02e59b0464e3', '100003007005004010', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区车队', '车队', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('aca15ffc-3f30-46df-ba7b-19b154d68b05', '100003007005004011', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区经警队', '经警队', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('2af90579-c845-4957-b0fc-99d83c4838c2', '100003007005004012', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区维修队', '维修队', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('51d888cd-f75f-49c5-ab3f-80e8d73547b5', '100003007005004013', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区第一管理站', '第一管理站', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('875953ad-24c7-448f-a753-6925f003fd80', '100003007005004014', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区第二管理站', '第二管理站', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('579a42e6-e7ab-4da8-bab1-34b8cea6d447', '100003007005004015', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区第三管理站', '第三管理站', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('4b94e556-0e44-4870-b867-d5c41cfe2242', '100003007005004016', '大港油田公司所属单位第三采油厂三厂所属第四采油作业区第四管理站', '第四管理站', '100003007005004', null, '1', '1', '', 'b1d08c84-7528-44b3-a409-e91252f6e191');
INSERT INTO `ts_uidp_org` VALUES ('69a39f1d-16dc-482a-811c-f1623da86ae1', '100003007005005', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区', '第五采油作业区', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('cf9dc380-2d97-4afc-885e-d9d6f67aa74d', '100003007005005001', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区作业区领导', '作业区领导', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('8148b462-9248-465b-af83-8c3b43800e0e', '100003007005005002', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区综合管理科', '综合管理科', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('e46d5bd7-ba0d-4561-8ff7-e2ef8b9e4827', '100003007005005003', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区油田管理科', '油田管理科', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('ead127b1-a744-4b4e-8282-bb994ab181a2', '100003007005005004', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区修井工作站', '修井工作站', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('0c028f16-7197-42a4-8cec-6c704abba57e', '100003007005005005', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区生产管理科', '生产管理科', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('1271f4f4-f91f-4315-b748-f263204f186e', '100003007005005006', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区经营管理科', '经营管理科', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('f2d310c9-b4c7-4676-9a25-64679eb13960', '100003007005005007', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区工艺站', '工艺站', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('41a23500-d0eb-418a-9a8c-2d382d2bc5d1', '100003007005005008', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区地质站', '地质站', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('ca4eb677-03d5-421c-b291-07595236a019', '100003007005005009', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区电力管理办公室', '电力管理办公室', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('7d7785cb-553d-43ed-a667-26bb907e3680', '100003007005005010', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区经警队', '经警队', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('4c784d02-6f09-4c39-814d-abd75bc2fd32', '100003007005005011', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区车队', '车队', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('7496742e-578e-499f-baba-a5b388cd4858', '100003007005005012', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区维修队', '维修队', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('f445903e-a214-4cbc-96aa-fd090f1dae3a', '100003007005005013', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区第一管理站', '第一管理站', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('4bf2bb72-85cc-434a-952a-4ab46b3d9804', '100003007005005014', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区第二管理站', '第二管理站', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('55b370d7-0e5c-4800-ba3f-e473bc1386b8', '100003007005005015', '大港油田公司所属单位第三采油厂三厂所属第五采油作业区第三管理站', '第三管理站', '100003007005005', null, '1', '1', '', '69a39f1d-16dc-482a-811c-f1623da86ae1');
INSERT INTO `ts_uidp_org` VALUES ('d44e8a37-4eab-4f0a-aef2-c8c97d239dc7', '100003007005006', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区', '第六采油作业区', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('d8c7277e-190b-48ad-8490-af5aad6e8ea0', '100003007005006001', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区作业区领导', '作业区领导', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('a084d7e0-25b7-45aa-80f1-8d5696f2420e', '100003007005006002', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区综合管理科', '综合管理科', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('c22bf8cb-cb35-47e3-a19a-3ff81fa2d83d', '100003007005006003', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区油田管理科', '油田管理科', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('82a27ad4-b064-4b53-bcac-d0525850b426', '100003007005006004', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区修井工作站', '修井工作站', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('2dbeec88-7312-4149-9238-6b083482c75e', '100003007005006005', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区生产管理科', '生产管理科', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('803a6db6-4d94-42cd-875a-070155a31069', '100003007005006006', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区经营管理科', '经营管理科', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('d7721abd-9627-40a1-a6d0-0b981d6db3dd', '100003007005006007', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区工艺站', '工艺站', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('2a98af8a-dc05-4594-b28e-694bafcc6504', '100003007005006008', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区地质站', '地质站', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('df1ae861-d118-4844-b1ac-c9a9ed6804d5', '100003007005006009', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区电力管理办公室', '电力管理办公室', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('b50ada90-ee9b-4f60-ba23-206e83a96df7', '100003007005006010', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区车队', '车队', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('15223b6b-7bc5-4288-9629-e5d94239016f', '100003007005006011', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区经警队', '经警队', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('76463c41-e56b-413f-9921-8dff95a8fd64', '100003007005006012', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区维修队', '维修队', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('1621e68c-d592-4fd5-9fe6-5f65e05f2a0b', '100003007005006013', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区第一管理站', '第一管理站', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('48f4a536-5643-49a5-b23c-0159a4fb7d88', '100003007005006014', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区第二管理站', '第二管理站', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('537183dd-f327-4024-9bc2-d4c84b62ac62', '100003007005006015', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区第三管理站', '第三管理站', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('fd0d9c51-fc8a-408f-8125-57512b8085a2', '100003007005006016', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区第四管理站', '第四管理站', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('29d208ae-3d4c-44bf-8ddc-bd3c4fdabfa7', '100003007005006017', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区第五管理站', '第五管理站', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('6999c240-9a8d-4011-8f66-8308d58ce2e1', '100003007005006018', '大港油田公司所属单位第三采油厂三厂所属第六采油作业区小集注水站', '小集注水站', '100003007005006', null, '1', '1', '', 'd44e8a37-4eab-4f0a-aef2-c8c97d239dc7');
INSERT INTO `ts_uidp_org` VALUES ('d6081491-0750-4555-a713-367e350096e2', '100003007005007', '大港油田公司所属单位第三采油厂三厂所属专采作业区', '专采作业区', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('c3b91c6a-484b-4fab-8da1-4b3b2b318d8d', '100003007005007001', '大港油田公司所属单位第三采油厂三厂所属专采作业区作业区领导', '作业区领导', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('dd4c816c-76f5-461a-a10f-937fa522541d', '100003007005007001001', '大港油田公司所属单位第三采油厂三厂所属专采作业区作业区领导老领导', '老领导', '100003007005007001', null, '1', '1', '', 'c3b91c6a-484b-4fab-8da1-4b3b2b318d8d');
INSERT INTO `ts_uidp_org` VALUES ('6e63df99-1eea-401e-a86f-75b523f92691', '100003007005007002', '大港油田公司所属单位第三采油厂三厂所属专采作业区综合管理科', '综合管理科', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('030f0fe5-c12f-4d4e-ab3d-e39f8b9b0e9c', '100003007005007003', '大港油田公司所属单位第三采油厂三厂所属专采作业区经营管理科', '经营管理科', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('cf2e3568-8670-41e3-a7c4-6e2a2c8ec817', '100003007005007004', '大港油田公司所属单位第三采油厂三厂所属专采作业区生产科', '生产科', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('1a34ef09-c25c-49ce-9e23-733f8c0dccb7', '100003007005007005', '大港油田公司所属单位第三采油厂三厂所属专采作业区技术站', '技术站', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('373d0fbf-8278-4856-94d3-947c31c01b2f', '100003007005007006', '大港油田公司所属单位第三采油厂三厂所属专采作业区车班', '车班', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('17d1190c-c402-40af-903f-9a9fb2d1338e', '100003007005007007', '大港油田公司所属单位第三采油厂三厂所属专采作业区拉油队', '拉油队', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('30d07927-24e3-495d-bf47-8eed0a47c9fd', '100003007005007008', '大港油田公司所属单位第三采油厂三厂所属专采作业区捞油队', '捞油队', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('fcea5563-137f-467b-a921-e2538b804326', '100003007005007009', '大港油田公司所属单位第三采油厂三厂所属专采作业区卸油台', '卸油台', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('e41d1955-36b4-446f-8403-8721aca21bfb', '100003007005007010', '大港油田公司所属单位第三采油厂三厂所属专采作业区维修班', '维修班', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('3a943ab2-379d-4410-8d7b-211a7f8adab5', '100003007005007011', '大港油田公司所属单位第三采油厂三厂所属专采作业区专采一队', '专采一队', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('6bba2187-28b3-40d8-a661-7f1011e69079', '100003007005007012', '大港油田公司所属单位第三采油厂三厂所属专采作业区专采二队', '专采二队', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('375cf48c-37e2-4df1-af49-298ce472f9e1', '100003007005007013', '大港油田公司所属单位第三采油厂三厂所属专采作业区专采三队', '专采三队', '100003007005007', null, '1', '1', '', 'd6081491-0750-4555-a713-367e350096e2');
INSERT INTO `ts_uidp_org` VALUES ('9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b', '100003007005008', '大港油田公司所属单位第三采油厂三厂所属集输作业区', '集输作业区', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('bc7c2802-29be-4910-92ca-04403646b04b', '100003007005008001', '大港油田公司所属单位第三采油厂三厂所属集输作业区作业区领导', '作业区领导', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('fe7e7f13-ed3e-4188-9160-09e630afa478', '100003007005008002', '大港油田公司所属单位第三采油厂三厂所属集输作业区综合管理科', '综合管理科', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('eedc39b9-544b-468f-8fc9-da8a767cf909', '100003007005008003', '大港油田公司所属单位第三采油厂三厂所属集输作业区现场管理科', '现场管理科', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('4aa9ffe6-b8fa-4dea-8851-92f3a9fece11', '100003007005008004', '大港油田公司所属单位第三采油厂三厂所属集输作业区经营管理科', '经营管理科', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('f929134c-3735-4e9a-942f-f2d87604af93', '100003007005008005', '大港油田公司所属单位第三采油厂三厂所属集输作业区生产管理科', '生产管理科', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('b85c7291-03cb-458d-acdf-30ac47ec89f4', '100003007005008006', '大港油田公司所属单位第三采油厂三厂所属集输作业区工艺办公室', '工艺办公室', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('e6968224-e0ba-4cd8-93c8-99cd39316ea0', '100003007005008007', '大港油田公司所属单位第三采油厂三厂所属集输作业区安全监督站', '安全监督站', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('07c23325-e2cd-4aee-805e-e9d1e0c1dfca', '100003007005008008', '大港油田公司所属单位第三采油厂三厂所属集输作业区车队', '车队', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('960fa485-8f19-489b-bfbc-f7e21edcc830', '100003007005008009', '大港油田公司所属单位第三采油厂三厂所属集输作业区交接油办公室', '交接油办公室', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('cce88eff-4933-4f02-a189-c191c761f231', '100003007005008010', '大港油田公司所属单位第三采油厂三厂所属集输作业区经警队', '经警队', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('aa4744ac-c399-4016-b55c-9ccf8397e651', '100003007005008011', '大港油田公司所属单位第三采油厂三厂所属集输作业区枣一联合站', '枣一联合站', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('32deefae-c1cb-48f2-bfd0-6f5bb645e292', '100003007005008012', '大港油田公司所属单位第三采油厂三厂所属集输作业区枣二联合站', '枣二联合站', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('6be9d2b4-fa14-4625-aafb-ad7cfd07f0a8', '100003007005008013', '大港油田公司所属单位第三采油厂三厂所属集输作业区小集联合站', '小集联合站', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('f65b2998-8e2e-4d5e-9ef3-2ee2d413c976', '100003007005008014', '大港油田公司所属单位第三采油厂三厂所属集输作业区官一联合站', '官一联合站', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('33284e1e-6a38-436d-94ce-72c5ab7765b9', '100003007005008015', '大港油田公司所属单位第三采油厂三厂所属集输作业区官二联合站', '官二联合站', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('410b52aa-4ab5-47fe-a19c-ad4bd240c1f7', '100003007005008016', '大港油田公司所属单位第三采油厂三厂所属集输作业区官二期联合站', '官二期联合站', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('aac93fe6-46d1-4dd7-8ca4-8241b712ccd5', '100003007005008017', '大港油田公司所属单位第三采油厂三厂所属集输作业区女一联合站', '女一联合站', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('93062106-4297-437b-bac4-cdcfbfc020d7', '100003007005008018', '大港油田公司所属单位第三采油厂三厂所属集输作业区段一联合站', '段一联合站', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('aab5b036-3245-4996-8796-f1224d5e6aee', '100003007005008019', '大港油田公司所属单位第三采油厂三厂所属集输作业区工业水处理厂', '工业水处理厂', '100003007005008', null, '1', '1', '', '9d9c64cd-f4fd-469c-b6f3-bfe6f1c21a1b');
INSERT INTO `ts_uidp_org` VALUES ('40fed8f0-dbf8-47aa-ba36-b73311579570', '100003007005009', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司', '沧州聚鑫石油技术服务有限公司', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('6a1ff207-e42b-4973-86f3-b8b13b198048', '100003007005009001', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司聚鑫领导', '聚鑫领导', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('4ec30499-2f3d-4602-989e-8c24ace94f08', '100003007005009002', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司综合管理部', '综合管理部', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('191d6c4d-cbaa-49c0-9ecd-4f7059437960', '100003007005009003', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司生产管理部', '生产管理部', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('16012734-798b-4396-be7c-c10cadab13ab', '100003007005009004', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司安全管理部', '安全管理部', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('52dd504e-e0d3-4e71-9a01-62d26d9f79b0', '100003007005009005', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司企业管理部', '企业管理部', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('64cfc0aa-804b-46f8-b16b-3239282cd7c9', '100003007005009006', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司市场管理部', '市场管理部', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('9fdd4547-3db1-4c4b-9dea-9bb00355367a', '100003007005009007', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司财务管理部', '财务管理部', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('ebdb472d-3ecb-4f5d-9a1c-b2214e1d4cc2', '100003007005009008', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司电气服务队', '电气服务队', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('b7a678c4-49f4-4115-acac-e5de8a247e86', '100003007005009009', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司调剖服务队', '调剖服务队', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('b80b5652-1c77-4aad-ba5b-32140dc2e3e6', '100003007005009010', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司后勤服务队', '后勤服务队', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('c04f5df0-44f7-4f03-ad0f-9d76c094dfb6', '100003007005009011', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司工程服务队', '工程服务队', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('15b71d21-65ad-49e8-a637-14d9164e20ff', '100003007005009012', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司官一原稳站', '官一原稳站', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('ff8254ae-e827-405e-a6ed-dfbaf73301e9', '100003007005009013', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司小集原稳站', '小集原稳站', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('9605ed7c-45c2-4437-b73a-d69185ba1216', '100003007005009014', '大港油田公司所属单位第三采油厂三厂所属沧州聚鑫石油技术服务有限公司山西煤层气', '山西煤层气', '100003007005009', null, '1', '1', '', '40fed8f0-dbf8-47aa-ba36-b73311579570');
INSERT INTO `ts_uidp_org` VALUES ('d4687d36-f5fc-4035-8580-440c2d3730c8', '100003007005010', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司', '港狮生活服务公司', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('fd24aca7-86d3-44e9-a2f4-bcb063843af4', '100003007005010001', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司公司领导', '公司领导', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('e7115d65-9099-420c-a501-f2c49b4f9766', '100003007005010002', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司综合管理科', '综合管理科', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('72ab6fda-6cb2-4776-8408-50129a0903dd', '100003007005010003', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司经营管理科', '经营管理科', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('84a9242c-a1e2-4e21-85d2-4c6af0cc565f', '100003007005010004', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司安全管理科', '安全管理科', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('6ea65cd6-ef00-4871-98a4-868c5e34fab4', '100003007005010005', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司生产管理科', '生产管理科', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('eed07227-c0d5-4ef9-829f-97a8be5ff81c', '100003007005010006', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司供热服务中心', '供热服务中心', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('c395fccb-180c-40cd-803f-21eb7dced3ae', '100003007005010006001', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司供热服务中心供热服务中心机关', '供热服务中心机关', '100003007005010006', null, '1', '1', '', 'eed07227-c0d5-4ef9-829f-97a8be5ff81c');
INSERT INTO `ts_uidp_org` VALUES ('a3ee143e-e7f5-40bf-9076-e05015778b1e', '100003007005010006002', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司供热服务中心综合服务队', '综合服务队', '100003007005010006', null, '1', '1', '', 'eed07227-c0d5-4ef9-829f-97a8be5ff81c');
INSERT INTO `ts_uidp_org` VALUES ('a4892f25-7505-4cbf-98ae-c985f582e12a', '100003007005010006003', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司供热服务中心锅炉队', '锅炉队', '100003007005010006', null, '1', '1', '', 'eed07227-c0d5-4ef9-829f-97a8be5ff81c');
INSERT INTO `ts_uidp_org` VALUES ('4fa19eef-64c7-43a4-9e9c-46dcdc6830ca', '100003007005010007', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司水电服务中心', '水电服务中心', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('f4700e6e-a135-4442-94f0-0a45bb771cdc', '100003007005010007001', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司水电服务中心水电服务中心机关', '水电服务中心机关', '100003007005010007', null, '1', '1', '', '4fa19eef-64c7-43a4-9e9c-46dcdc6830ca');
INSERT INTO `ts_uidp_org` VALUES ('c5b55d4a-e6bf-4eba-b3b1-5105916ca5e0', '100003007005010007002', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司水电服务中心供水队', '供水队', '100003007005010007', null, '1', '1', '', '4fa19eef-64c7-43a4-9e9c-46dcdc6830ca');
INSERT INTO `ts_uidp_org` VALUES ('d44865b2-eee9-46a4-a450-267a2d6c88f8', '100003007005010007003', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司水电服务中心维修计量队', '维修计量队', '100003007005010007', null, '1', '1', '', '4fa19eef-64c7-43a4-9e9c-46dcdc6830ca');
INSERT INTO `ts_uidp_org` VALUES ('faa75496-cc17-46e5-9d77-b057165b66a1', '100003007005010008', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司物业服务中心', '物业服务中心', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('a6ca68ee-7e19-4b8a-8be7-527c4d31e7a7', '100003007005010008001', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司物业服务中心物业服务中心机关', '物业服务中心机关', '100003007005010008', null, '1', '1', '', 'faa75496-cc17-46e5-9d77-b057165b66a1');
INSERT INTO `ts_uidp_org` VALUES ('dd8453d1-eddd-46b7-bf96-8eb527771c6a', '100003007005010008002', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司物业服务中心环卫保洁队', '环卫保洁队', '100003007005010008', null, '1', '1', '', 'faa75496-cc17-46e5-9d77-b057165b66a1');
INSERT INTO `ts_uidp_org` VALUES ('93b34df4-cedb-4406-a999-bca1a1fc2fde', '100003007005010008003', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司物业服务中心公寓服务队', '公寓服务队', '100003007005010008', null, '1', '1', '', 'faa75496-cc17-46e5-9d77-b057165b66a1');
INSERT INTO `ts_uidp_org` VALUES ('94dcc0b9-57a5-4c52-a0b3-c141adc8fca8', '100003007005010008004', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司物业服务中心绿化队', '绿化队', '100003007005010008', null, '1', '1', '', 'faa75496-cc17-46e5-9d77-b057165b66a1');
INSERT INTO `ts_uidp_org` VALUES ('73a2d959-47ef-46ec-9b4f-664d66ca725e', '100003007005010009', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司房屋管理中心', '房屋管理中心', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('ffc0b0d9-5a1f-4f8e-9b86-43de75415046', '100003007005010010', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司幼儿园', '幼儿园', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('44792ca9-a66b-40f8-9f79-a33dddb94afc', '100003007005010011', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司车队', '车队', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('111bfd70-22e2-45df-a122-f941eac6026f', '100003007005010012', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司治保科', '治保科', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('f5a17560-351b-4aa6-84d8-226f172feedf', '100003007005010013', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司餐饮服务中心', '餐饮服务中心', '100003007005010', null, '1', '1', '', 'd4687d36-f5fc-4035-8580-440c2d3730c8');
INSERT INTO `ts_uidp_org` VALUES ('b05c0a04-ec14-426a-b3dc-7c59235d0869', '100003007005010013001', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司餐饮服务中心餐饮服务中心机关', '餐饮服务中心机关', '100003007005010013', null, '1', '1', '', 'f5a17560-351b-4aa6-84d8-226f172feedf');
INSERT INTO `ts_uidp_org` VALUES ('2c7889fc-0ed4-4cdd-a262-11d46b3d02f1', '100003007005010013002', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司餐饮服务中心公寓餐饮部', '公寓餐饮部', '100003007005010013', null, '1', '1', '', 'f5a17560-351b-4aa6-84d8-226f172feedf');
INSERT INTO `ts_uidp_org` VALUES ('75353691-d320-467c-ad00-569b95d9a2cf', '100003007005010013003', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司餐饮服务中心馨心餐饮部', '馨心餐饮部', '100003007005010013', null, '1', '1', '', 'f5a17560-351b-4aa6-84d8-226f172feedf');
INSERT INTO `ts_uidp_org` VALUES ('51910642-746d-45bf-8cc8-a0692fa2ef66', '100003007005010013004', '大港油田公司所属单位第三采油厂三厂所属港狮生活服务公司餐饮服务中心物业保洁部', '物业保洁部', '100003007005010013', null, '1', '1', '', 'f5a17560-351b-4aa6-84d8-226f172feedf');
INSERT INTO `ts_uidp_org` VALUES ('239bfcbc-de42-476f-ba51-0cb29e3c292b', '100003007005011', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司', '沧州沧实石油技术服务有限公司', '100003007005', null, '1', '1', '', 'f6f22c30-50b1-4721-a8c2-99ee019127b1');
INSERT INTO `ts_uidp_org` VALUES ('b6c6c5a1-5884-448b-95bf-84131ba5b34c', '100003007005011001', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司公司领导', '公司领导', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('55dcc46b-6b9c-4284-86b1-c6e34793818e', '100003007005011002', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司公司助理', '公司助理', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('f00c4041-2337-42ca-b065-11cdd41524e9', '100003007005011003', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司综合管理部', '综合管理部', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('8edc734e-91cc-42ae-b172-67a3ab48dff7', '100003007005011004', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司安全生产部', '安全生产部', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('a82da5ee-98a1-4824-b93c-eba2616856e7', '100003007005011005', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司财务管理部', '财务管理部', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('e6ab14d8-5e3f-4f7c-ae43-a01de43f3fdf', '100003007005011006', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司经营管理部', '经营管理部', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('5305d4a4-39fa-46d8-9255-5c1c9102213e', '100003007005011007', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司市场管理部', '市场管理部', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('3cdccce1-d048-4ba7-88d9-3d05d0915adc', '100003007005011008', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司油田助剂厂', '油田助剂厂', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('e15b3bb3-4bcf-4764-b78d-68b2e5f88636', '100003007005011009', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司油管内衬修造厂', '油管内衬修造厂', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('b321050d-cadb-43d2-9724-54a31cebcb5c', '100003007005011010', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司沧实工程队', '沧实工程队', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('42a0c62a-7a7f-41c2-84d6-89add5cf3e5e', '100003007005011011', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司港狮超市', '港狮超市', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('45f60b51-2175-4dba-976f-e5eddafbb727', '100003007005011012', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司综合服务队', '综合服务队', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('2f82f05d-88ff-4000-b39c-0a93da081a97', '100003007005011013', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司机械制造厂', '机械制造厂', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('1668e62c-9b8d-404a-89e3-1e47bdd8fae7', '100003007005011014', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司液化气站', '液化气站', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('de62fdba-5857-4384-93df-95fecf1ef880', '100003007005011015', '大港油田公司所属单位第三采油厂三厂所属沧州沧实石油技术服务有限公司钻井废弃物处理中心', '钻井废弃物处理中心', '100003007005011', null, '1', '1', '', '239bfcbc-de42-476f-ba51-0cb29e3c292b');
INSERT INTO `ts_uidp_org` VALUES ('5b4b2241-617a-4939-a3bd-af99612f4697', '100003008', '大港油田公司所属单位第四采油厂（储气库公司）', '第四采油厂（储气库公司）', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('bdf28b0a-7a55-46a2-bb81-ddcd0e24c9de', '100003008001', '大港油田公司所属单位第四采油厂（储气库公司）四厂领导', '四厂领导', '100003008', null, '1', '1', '', '5b4b2241-617a-4939-a3bd-af99612f4697');
INSERT INTO `ts_uidp_org` VALUES ('78b08d19-69ad-41e5-805a-e16b196facdc', '100003008001001', '大港油田公司所属单位第四采油厂（储气库公司）四厂领导老领导', '老领导', '100003008001', null, '1', '1', '', 'bdf28b0a-7a55-46a2-bb81-ddcd0e24c9de');
INSERT INTO `ts_uidp_org` VALUES ('dfb5584a-f079-4f71-bac1-c0a329d6522d', '100003008002', '大港油田公司所属单位第四采油厂（储气库公司）四厂助理', '四厂助理', '100003008', null, '1', '1', '', '5b4b2241-617a-4939-a3bd-af99612f4697');
INSERT INTO `ts_uidp_org` VALUES ('06765477-f229-4661-94fc-166f1d10f88a', '100003008003', '大港油田公司所属单位第四采油厂（储气库公司）四厂机关', '四厂机关', '100003008', null, '1', '1', '', '5b4b2241-617a-4939-a3bd-af99612f4697');
INSERT INTO `ts_uidp_org` VALUES ('f3d68b26-0cf4-48cc-ba5e-d4a4a10f1278', '100003008003001', '大港油田公司所属单位第四采油厂（储气库公司）四厂机关厂长办公室', '厂长办公室', '100003008003', null, '1', '1', '', '06765477-f229-4661-94fc-166f1d10f88a');
INSERT INTO `ts_uidp_org` VALUES ('82100f0a-9567-44bf-8541-057da76b9ccb', '100003008003002', '大港油田公司所属单位第四采油厂（储气库公司）四厂机关党群工作部', '党群工作部', '100003008003', null, '1', '1', '', '06765477-f229-4661-94fc-166f1d10f88a');
INSERT INTO `ts_uidp_org` VALUES ('191b145f-ce8e-4b28-9722-425790b2da7e', '100003008003003', '大港油田公司所属单位第四采油厂（储气库公司）四厂机关生产运行科', '生产运行科', '100003008003', null, '1', '1', '', '06765477-f229-4661-94fc-166f1d10f88a');
INSERT INTO `ts_uidp_org` VALUES ('2e176cd5-7dc6-46a7-ba94-edae6d6858fd', '100003008003004', '大港油田公司所属单位第四采油厂（储气库公司）四厂机关安全环保科', '安全环保科', '100003008003', null, '1', '1', '', '06765477-f229-4661-94fc-166f1d10f88a');
INSERT INTO `ts_uidp_org` VALUES ('e4c0e08e-ddd6-4b51-8f4f-9798129408b6', '100003008003005', '大港油田公司所属单位第四采油厂（储气库公司）四厂机关油田管理科', '油田管理科', '100003008003', null, '1', '1', '', '06765477-f229-4661-94fc-166f1d10f88a');
INSERT INTO `ts_uidp_org` VALUES ('0ada68af-e8ab-4c9b-bccc-fb8ce4da4c7a', '100003008003006', '大港油田公司所属单位第四采油厂（储气库公司）四厂机关企划科', '企划科', '100003008003', null, '1', '1', '', '06765477-f229-4661-94fc-166f1d10f88a');
INSERT INTO `ts_uidp_org` VALUES ('54f9368c-c63f-4681-9a4d-0710be083659', '100003008003006001', '大港油田公司所属单位第四采油厂（储气库公司）四厂机关企划科预算站', '预算站', '100003008003006', null, '1', '1', '', '0ada68af-e8ab-4c9b-bccc-fb8ce4da4c7a');
INSERT INTO `ts_uidp_org` VALUES ('6a44aeda-7c7d-4550-8f2b-11b829d41305', '100003008003007', '大港油田公司所属单位第四采油厂（储气库公司）四厂机关人事劳资科', '人事劳资科', '100003008003', null, '1', '1', '', '06765477-f229-4661-94fc-166f1d10f88a');
INSERT INTO `ts_uidp_org` VALUES ('d062057c-e0c8-46d8-b63a-915fc699119c', '100003008003008', '大港油田公司所属单位第四采油厂（储气库公司）四厂机关财务资产科', '财务资产科', '100003008003', null, '1', '1', '', '06765477-f229-4661-94fc-166f1d10f88a');
INSERT INTO `ts_uidp_org` VALUES ('e9174434-57b2-4dd9-97fd-7f139ea8f064', '100003008004', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属', '四厂直附属', '100003008', null, '1', '1', '', '5b4b2241-617a-4939-a3bd-af99612f4697');
INSERT INTO `ts_uidp_org` VALUES ('9c75a89d-e8ce-4c10-8b4d-ecf5e8674076', '100003008004001', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属产能建设部', '产能建设部', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('f323620e-7268-466c-b462-222962e86565', '100003008004002', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属工艺研究所', '工艺研究所', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('43b73177-8b56-40d6-9cc6-c737fe811841', '100003008004002001', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属工艺研究所领导', '领导', '100003008004002', null, '1', '1', '', 'f323620e-7268-466c-b462-222962e86565');
INSERT INTO `ts_uidp_org` VALUES ('f79c67cc-74ac-409e-9434-293b78b90d99', '100003008004002002', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属工艺研究所综合管理室', '综合管理室', '100003008004002', null, '1', '1', '', 'f323620e-7268-466c-b462-222962e86565');
INSERT INTO `ts_uidp_org` VALUES ('e2efe64a-f94d-4410-be37-b450a41dc2a9', '100003008004002003', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属工艺研究所采油采气工艺室', '采油采气工艺室', '100003008004002', null, '1', '1', '', 'f323620e-7268-466c-b462-222962e86565');
INSERT INTO `ts_uidp_org` VALUES ('bb793eca-ac26-4cab-80eb-e0ec4af2b90f', '100003008004002004', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属工艺研究所地面工艺室', '地面工艺室', '100003008004002', null, '1', '1', '', 'f323620e-7268-466c-b462-222962e86565');
INSERT INTO `ts_uidp_org` VALUES ('bd24e0db-3509-4c4b-af78-8ce5c4a9b353', '100003008004002005', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属工艺研究所修井管理室', '修井管理室', '100003008004002', null, '1', '1', '', 'f323620e-7268-466c-b462-222962e86565');
INSERT INTO `ts_uidp_org` VALUES ('05560423-55ce-4a3a-9e29-0f82f67fc870', '100003008004002006', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属工艺研究所注水及油田化学室', '注水及油田化学室', '100003008004002', null, '1', '1', '', 'f323620e-7268-466c-b462-222962e86565');
INSERT INTO `ts_uidp_org` VALUES ('aed0d67e-bcb2-49f7-8765-7c26f9ef880b', '100003008004003', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属地质研究所', '地质研究所', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('7913f467-3f1a-4025-b64e-2d1af508e1bc', '100003008004003001', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属地质研究所领导', '领导', '100003008004003', null, '1', '1', '', 'aed0d67e-bcb2-49f7-8765-7c26f9ef880b');
INSERT INTO `ts_uidp_org` VALUES ('b7055dd2-95e3-4764-9e89-85b1751306c2', '100003008004003002', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属地质研究所生产综合室', '生产综合室', '100003008004003', null, '1', '1', '', 'aed0d67e-bcb2-49f7-8765-7c26f9ef880b');
INSERT INTO `ts_uidp_org` VALUES ('f08068cf-2ed7-453e-a4e6-1733a88eaef7', '100003008004003003', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属地质研究所油藏评价室', '油藏评价室', '100003008004003', null, '1', '1', '', 'aed0d67e-bcb2-49f7-8765-7c26f9ef880b');
INSERT INTO `ts_uidp_org` VALUES ('f87a36e1-733b-4a29-b8a3-de40d09e983e', '100003008004003004', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属地质研究所开发一室', '开发一室', '100003008004003', null, '1', '1', '', 'aed0d67e-bcb2-49f7-8765-7c26f9ef880b');
INSERT INTO `ts_uidp_org` VALUES ('b42b2432-f80e-4aa5-81ad-6c0f05305aea', '100003008004003005', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属地质研究所开发二室', '开发二室', '100003008004003', null, '1', '1', '', 'aed0d67e-bcb2-49f7-8765-7c26f9ef880b');
INSERT INTO `ts_uidp_org` VALUES ('e9091443-4312-408e-87ff-45311e58b7ff', '100003008004003006', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属地质研究所方案研究室', '方案研究室', '100003008004003', null, '1', '1', '', 'aed0d67e-bcb2-49f7-8765-7c26f9ef880b');
INSERT INTO `ts_uidp_org` VALUES ('a6f6967c-a165-48e8-a944-e060e1342cbe', '100003008004003007', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属地质研究所天然气室', '天然气室', '100003008004003', null, '1', '1', '', 'aed0d67e-bcb2-49f7-8765-7c26f9ef880b');
INSERT INTO `ts_uidp_org` VALUES ('fd205928-6a92-47ca-ad1d-3bdd9aa060db', '100003008004004', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属物资管理站', '物资管理站', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('85a8af11-d1a9-4605-ab40-8ed3ab03b799', '100003008004005', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属基建管理站', '基建管理站', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('1e8873cd-5495-4551-984d-dc2ef3c0617e', '100003008004006', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属电力管理站', '电力管理站', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('1882ca54-6f07-4902-8b95-a837aa0d4711', '100003008004007', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属培训学校', '培训学校', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('0816cdb3-7cfd-4aac-b6c2-411ef3375714', '100003008004008', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属经警大队', '经警大队', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('11624c98-7f26-4322-bdcc-b12b8d5bf8bc', '100003008004009', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属信息档案室', '信息档案室', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('a4e2ae23-dbba-4aee-a7e1-39ee89b69067', '100003008004010', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属HSE监督工作站', 'HSE监督工作站', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('9b97494c-da59-49ad-9c10-cf86d6b1303d', '100003008004011', '大港油田公司所属单位第四采油厂（储气库公司）四厂直附属储气库项目部', '储气库项目部', '100003008004', null, '1', '1', '', 'e9174434-57b2-4dd9-97fd-7f139ea8f064');
INSERT INTO `ts_uidp_org` VALUES ('4a4b9b76-4962-4646-a177-b33333d04d22', '100003008005', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属', '四厂所属', '100003008', null, '1', '1', '', '5b4b2241-617a-4939-a3bd-af99612f4697');
INSERT INTO `ts_uidp_org` VALUES ('95e87afc-9d19-47c2-9b05-cbffc1520e64', '100003008005001', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第一采油作业区', '第一采油作业区', '100003008005', null, '1', '1', '', '4a4b9b76-4962-4646-a177-b33333d04d22');
INSERT INTO `ts_uidp_org` VALUES ('eebc9c99-57eb-41da-ac2d-c5ffb9b17d70', '100003008005001001', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第一采油作业区领导', '领导', '100003008005001', null, '1', '1', '', '95e87afc-9d19-47c2-9b05-cbffc1520e64');
INSERT INTO `ts_uidp_org` VALUES ('3e3132c3-0d1d-4006-9dc9-07274d5902a6', '100003008005001002', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第一采油作业区生产技术组', '生产技术组', '100003008005001', null, '1', '1', '', '95e87afc-9d19-47c2-9b05-cbffc1520e64');
INSERT INTO `ts_uidp_org` VALUES ('f225d160-4a09-4e75-ae5b-dd01701d2f04', '100003008005001003', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第一采油作业区工程检修组', '工程检修组', '100003008005001', null, '1', '1', '', '95e87afc-9d19-47c2-9b05-cbffc1520e64');
INSERT INTO `ts_uidp_org` VALUES ('13ff0139-7b2c-4d84-8ca2-cfdbdc9b3a5d', '100003008005001004', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第一采油作业区综合服务组', '综合服务组', '100003008005001', null, '1', '1', '', '95e87afc-9d19-47c2-9b05-cbffc1520e64');
INSERT INTO `ts_uidp_org` VALUES ('5ea18f8f-99c2-44fe-99d7-9d3476be4fb9', '100003008005001005', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第一采油作业区生产管井组', '生产管井组', '100003008005001', null, '1', '1', '', '95e87afc-9d19-47c2-9b05-cbffc1520e64');
INSERT INTO `ts_uidp_org` VALUES ('028f1437-ca85-48f3-a48a-27da43a53ad7', '100003008005002', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第二采油作业区', '第二采油作业区', '100003008005', null, '1', '1', '', '4a4b9b76-4962-4646-a177-b33333d04d22');
INSERT INTO `ts_uidp_org` VALUES ('73672f17-c07c-4f04-a707-bb6dc824fa8b', '100003008005002001', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第二采油作业区领导', '领导', '100003008005002', null, '1', '1', '', '028f1437-ca85-48f3-a48a-27da43a53ad7');
INSERT INTO `ts_uidp_org` VALUES ('ad38eb98-b42d-471b-b405-57500fda64f8', '100003008005002002', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第二采油作业区生产技术组', '生产技术组', '100003008005002', null, '1', '1', '', '028f1437-ca85-48f3-a48a-27da43a53ad7');
INSERT INTO `ts_uidp_org` VALUES ('82df35f1-7be6-4c0d-955e-d1e1a66674a5', '100003008005002003', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第二采油作业区工程检修组', '工程检修组', '100003008005002', null, '1', '1', '', '028f1437-ca85-48f3-a48a-27da43a53ad7');
INSERT INTO `ts_uidp_org` VALUES ('a7430a68-779d-4e5e-85a5-39100563c697', '100003008005002004', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第二采油作业区综合服务组', '综合服务组', '100003008005002', null, '1', '1', '', '028f1437-ca85-48f3-a48a-27da43a53ad7');
INSERT INTO `ts_uidp_org` VALUES ('b2b3739e-34db-4a09-8190-35ddce9739bc', '100003008005002005', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属第二采油作业区生产管井组', '生产管井组', '100003008005002', null, '1', '1', '', '028f1437-ca85-48f3-a48a-27da43a53ad7');
INSERT INTO `ts_uidp_org` VALUES ('d4e51325-2039-4bc9-987e-5cdef271be62', '100003008005003', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属集输计量管理站', '集输计量管理站', '100003008005', null, '1', '1', '', '4a4b9b76-4962-4646-a177-b33333d04d22');
INSERT INTO `ts_uidp_org` VALUES ('e1b80612-40cd-4213-b805-5d1482e097e1', '100003008005003001', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属集输计量管理站领导', '领导', '100003008005003', null, '1', '1', '', 'd4e51325-2039-4bc9-987e-5cdef271be62');
INSERT INTO `ts_uidp_org` VALUES ('76671342-c5ec-4959-83a4-b69e515eee77', '100003008005003002', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属集输计量管理站计量组', '计量组', '100003008005003', null, '1', '1', '', 'd4e51325-2039-4bc9-987e-5cdef271be62');
INSERT INTO `ts_uidp_org` VALUES ('30376c4c-402c-4721-839d-6b33749605ec', '100003008005003003', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属集输计量管理站油气交接组', '油气交接组', '100003008005003', null, '1', '1', '', 'd4e51325-2039-4bc9-987e-5cdef271be62');
INSERT INTO `ts_uidp_org` VALUES ('50f71c58-7e21-4bc2-90a2-71a327954608', '100003008005003004', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属集输计量管理站综合服务组', '综合服务组', '100003008005003', null, '1', '1', '', 'd4e51325-2039-4bc9-987e-5cdef271be62');
INSERT INTO `ts_uidp_org` VALUES ('302e9fcc-4a43-4753-ae89-9514aa026f62', '100003008005004', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属储气库管理站', '储气库管理站', '100003008005', null, '1', '1', '', '4a4b9b76-4962-4646-a177-b33333d04d22');
INSERT INTO `ts_uidp_org` VALUES ('a0153727-c5e1-498d-a588-54c827ad1793', '100003008005005', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属维修队', '维修队', '100003008005', null, '1', '1', '', '4a4b9b76-4962-4646-a177-b33333d04d22');
INSERT INTO `ts_uidp_org` VALUES ('fae7a093-a00f-41a8-b272-293b42ae0c6d', '100003008005006', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属综合车队', '综合车队', '100003008005', null, '1', '1', '', '4a4b9b76-4962-4646-a177-b33333d04d22');
INSERT INTO `ts_uidp_org` VALUES ('0db26417-11b0-4701-92b5-76bb01b75507', '100003008005007', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属综合服务队', '综合服务队', '100003008005', null, '1', '1', '', '4a4b9b76-4962-4646-a177-b33333d04d22');
INSERT INTO `ts_uidp_org` VALUES ('95c820ee-2e69-4eec-9fe1-9b2f4d9d701d', '100003008005008', '大港油田公司所属单位第四采油厂（储气库公司）四厂所属板一联合站', '板一联合站', '100003008005', null, '1', '1', '', '4a4b9b76-4962-4646-a177-b33333d04d22');
INSERT INTO `ts_uidp_org` VALUES ('5a9685d3-f7e0-40cb-8e8d-3bb6c9b159bb', '100003008006', '大港油田公司所属单位第四采油厂（储气库公司）奇利公司', '奇利公司', '100003008', null, '1', '1', '', '5b4b2241-617a-4939-a3bd-af99612f4697');
INSERT INTO `ts_uidp_org` VALUES ('dc7de852-ecc2-46a3-9590-380af50dfb75', '100003008007', '大港油田公司所属单位第四采油厂（储气库公司）19平方工程项目组', '19平方工程项目组', '100003008', null, '1', '1', '', '5b4b2241-617a-4939-a3bd-af99612f4697');
INSERT INTO `ts_uidp_org` VALUES ('0918c670-cbc0-4c5b-9e97-0c9f7fde2c47', '100003008008', '大港油田公司所属单位第四采油厂（储气库公司）板桥油田排涝项目部', '板桥油田排涝项目部', '100003008', null, '1', '1', '', '5b4b2241-617a-4939-a3bd-af99612f4697');
INSERT INTO `ts_uidp_org` VALUES ('7f59fea6-13ff-491d-b434-c555b63c6832', '100003009', '大港油田公司所属单位第五采油厂', '第五采油厂', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('b879f698-624d-450a-8acc-4b4e236c13e0', '100003009001', '大港油田公司所属单位第五采油厂五厂领导', '五厂领导', '100003009', null, '1', '1', '', '7f59fea6-13ff-491d-b434-c555b63c6832');
INSERT INTO `ts_uidp_org` VALUES ('a9b7ab1f-83ce-450d-b344-c1effcf9c076', '100003009002', '大港油田公司所属单位第五采油厂五厂机关', '五厂机关', '100003009', null, '1', '1', '', '7f59fea6-13ff-491d-b434-c555b63c6832');
INSERT INTO `ts_uidp_org` VALUES ('9348f9f0-59cc-4da0-96da-e8da6dd9d8a7', '100003009002001', '大港油田公司所属单位第五采油厂五厂机关助理（副总师）', '助理（副总师）', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('baba8265-d8c2-4ea9-90a6-56990b5702af', '100003009002002', '大港油田公司所属单位第五采油厂五厂机关专家组', '专家组', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('031063f4-b50f-4db7-bbb2-3e6aa4e813a9', '100003009002003', '大港油田公司所属单位第五采油厂五厂机关五厂生产运行科', '五厂生产运行科', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('eb3a6ac3-9e38-4881-8516-6dd9995ec65e', '100003009002004', '大港油田公司所属单位第五采油厂五厂机关五厂安全环保科', '五厂安全环保科', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('f91bb82d-6774-40ea-9f4f-9c03ea83eeb0', '100003009002005', '大港油田公司所属单位第五采油厂五厂机关五厂企业管理科', '五厂企业管理科', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('16f10907-4b7e-4491-94a4-da8b12849265', '100003009002006', '大港油田公司所属单位第五采油厂五厂机关五厂土地管理科', '五厂土地管理科', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('9caf9706-f9dd-4986-8450-4188a87b88d4', '100003009002007', '大港油田公司所属单位第五采油厂五厂机关五厂规划计划科', '五厂规划计划科', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('33281025-9999-4fba-9efa-a612bbf30898', '100003009002008', '大港油田公司所属单位第五采油厂五厂机关五厂人事劳资科', '五厂人事劳资科', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('e4b60b2c-4bb0-41f7-a886-b357d8c5ccfe', '100003009002008001', '大港油田公司所属单位第五采油厂五厂机关五厂人事劳资科档案室（人事档案）', '档案室（人事档案）', '100003009002008', null, '1', '1', '', '33281025-9999-4fba-9efa-a612bbf30898');
INSERT INTO `ts_uidp_org` VALUES ('2703cd5d-6879-4f58-b568-d608558903f1', '100003009002008002', '大港油田公司所属单位第五采油厂五厂机关五厂人事劳资科周小东技能大师工作室', '周小东技能大师工作室', '100003009002008', null, '1', '1', '', '33281025-9999-4fba-9efa-a612bbf30898');
INSERT INTO `ts_uidp_org` VALUES ('9ba2e908-f95f-4eeb-ab9b-1e9925af42ea', '100003009002009', '大港油田公司所属单位第五采油厂五厂机关五厂财务资产科', '五厂财务资产科', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('bbe5d148-e30a-43c2-bebd-634190a20b8c', '100003009002010', '大港油田公司所属单位第五采油厂五厂机关五厂纪检监察科', '五厂纪检监察科', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('68b536cb-39b4-47cf-83d0-57798fd6e8f7', '100003009002011', '大港油田公司所属单位第五采油厂五厂机关五厂党群工作部', '五厂党群工作部', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('ece2463b-c918-46f4-845f-c4b7371a2458', '100003009002012', '大港油田公司所属单位第五采油厂五厂机关五厂厂长办公室', '五厂厂长办公室', '100003009002', null, '1', '1', '', 'a9b7ab1f-83ce-450d-b344-c1effcf9c076');
INSERT INTO `ts_uidp_org` VALUES ('fbb580fe-8132-4fb5-a0cc-8f4613299896', '100003009003', '大港油田公司所属单位第五采油厂五厂直附属', '五厂直附属', '100003009', null, '1', '1', '', '7f59fea6-13ff-491d-b434-c555b63c6832');
INSERT INTO `ts_uidp_org` VALUES ('04854c69-f3a7-4045-bfe6-278069a071b5', '100003009003001', '大港油田公司所属单位第五采油厂五厂直附属五厂地质研究所', '五厂地质研究所', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('2cd290e1-ca84-4fa7-ade1-bc4e203c3b81', '100003009003001001', '大港油田公司所属单位第五采油厂五厂直附属五厂地质研究所所领导', '所领导', '100003009003001', null, '1', '1', '', '04854c69-f3a7-4045-bfe6-278069a071b5');
INSERT INTO `ts_uidp_org` VALUES ('6582ba2c-3f44-45e6-9d8f-b3323fbfb898', '100003009003001002', '大港油田公司所属单位第五采油厂五厂直附属五厂地质研究所生产室', '生产室', '100003009003001', null, '1', '1', '', '04854c69-f3a7-4045-bfe6-278069a071b5');
INSERT INTO `ts_uidp_org` VALUES ('51de9388-85aa-46b7-bcd5-61a80fc0f1c8', '100003009003001003', '大港油田公司所属单位第五采油厂五厂直附属五厂地质研究所产能室', '产能室', '100003009003001', null, '1', '1', '', '04854c69-f3a7-4045-bfe6-278069a071b5');
INSERT INTO `ts_uidp_org` VALUES ('1edf5982-3b1d-4c6a-868e-b640cee53079', '100003009003001004', '大港油田公司所属单位第五采油厂五厂直附属五厂地质研究所滚动评价室', '滚动评价室', '100003009003001', null, '1', '1', '', '04854c69-f3a7-4045-bfe6-278069a071b5');
INSERT INTO `ts_uidp_org` VALUES ('206336fd-1bc3-4311-b120-357f3d9ff87b', '100003009003001005', '大港油田公司所属单位第五采油厂五厂直附属五厂地质研究所综合信息室', '综合信息室', '100003009003001', null, '1', '1', '', '04854c69-f3a7-4045-bfe6-278069a071b5');
INSERT INTO `ts_uidp_org` VALUES ('f5c7e0b6-299e-4a3c-ba29-cacace208218', '100003009003001006', '大港油田公司所属单位第五采油厂五厂直附属五厂地质研究所动态研究室', '动态研究室', '100003009003001', null, '1', '1', '', '04854c69-f3a7-4045-bfe6-278069a071b5');
INSERT INTO `ts_uidp_org` VALUES ('332d17e9-2590-4c50-bc97-4987474be90d', '100003009003002', '大港油田公司所属单位第五采油厂五厂直附属五厂工艺研究所', '五厂工艺研究所', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('24d89489-745e-4ebf-ae7a-38316da4768b', '100003009003002001', '大港油田公司所属单位第五采油厂五厂直附属五厂工艺研究所所领导', '所领导', '100003009003002', null, '1', '1', '', '332d17e9-2590-4c50-bc97-4987474be90d');
INSERT INTO `ts_uidp_org` VALUES ('c3e6f82b-e649-49f8-ad40-218f23a4d2ed', '100003009003002002', '大港油田公司所属单位第五采油厂五厂直附属五厂工艺研究所综合室', '综合室', '100003009003002', null, '1', '1', '', '332d17e9-2590-4c50-bc97-4987474be90d');
INSERT INTO `ts_uidp_org` VALUES ('8891d971-4c2f-4198-8a0f-258f41a45cbe', '100003009003002003', '大港油田公司所属单位第五采油厂五厂直附属五厂工艺研究所采油工艺室', '采油工艺室', '100003009003002', null, '1', '1', '', '332d17e9-2590-4c50-bc97-4987474be90d');
INSERT INTO `ts_uidp_org` VALUES ('b3ba9b45-684e-4106-bf0a-49c8641acef9', '100003009003002004', '大港油田公司所属单位第五采油厂五厂直附属五厂工艺研究所集输工艺室', '集输工艺室', '100003009003002', null, '1', '1', '', '332d17e9-2590-4c50-bc97-4987474be90d');
INSERT INTO `ts_uidp_org` VALUES ('1b2c2df0-2355-4244-9961-e0285add67e7', '100003009003002005', '大港油田公司所属单位第五采油厂五厂直附属五厂工艺研究所注水工艺室', '注水工艺室', '100003009003002', null, '1', '1', '', '332d17e9-2590-4c50-bc97-4987474be90d');
INSERT INTO `ts_uidp_org` VALUES ('fbd8bb07-f80e-4469-87fb-23c64e64c7d2', '100003009003002006', '大港油田公司所属单位第五采油厂五厂直附属五厂工艺研究所采收率室', '采收率室', '100003009003002', null, '1', '1', '', '332d17e9-2590-4c50-bc97-4987474be90d');
INSERT INTO `ts_uidp_org` VALUES ('28b2e431-1790-4e2e-b33f-8e95575063a0', '100003009003003', '大港油田公司所属单位第五采油厂五厂直附属五厂产能建设部', '五厂产能建设部', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('977b47d6-2f3f-4758-8c87-adf5198dc167', '100003009003003001', '大港油田公司所属单位第五采油厂五厂直附属五厂产能建设部领导', '领导', '100003009003003', null, '1', '1', '', '28b2e431-1790-4e2e-b33f-8e95575063a0');
INSERT INTO `ts_uidp_org` VALUES ('c30db6ae-87a1-4ec6-afd5-81d9bcd17e85', '100003009003003002', '大港油田公司所属单位第五采油厂五厂直附属五厂产能建设部技术方案室', '技术方案室', '100003009003003', null, '1', '1', '', '28b2e431-1790-4e2e-b33f-8e95575063a0');
INSERT INTO `ts_uidp_org` VALUES ('b8d9fe4c-8bd4-418c-a93c-6f92ff56db17', '100003009003003003', '大港油田公司所属单位第五采油厂五厂直附属五厂产能建设部钻井工程室', '钻井工程室', '100003009003003', null, '1', '1', '', '28b2e431-1790-4e2e-b33f-8e95575063a0');
INSERT INTO `ts_uidp_org` VALUES ('9ba1e085-7ad8-4c76-b6a5-c5153c7c08f0', '100003009003003004', '大港油田公司所属单位第五采油厂五厂直附属五厂产能建设部试油工程室', '试油工程室', '100003009003003', null, '1', '1', '', '28b2e431-1790-4e2e-b33f-8e95575063a0');
INSERT INTO `ts_uidp_org` VALUES ('22151f2b-5060-4476-a31c-d670de57d494', '100003009003003005', '大港油田公司所属单位第五采油厂五厂直附属五厂产能建设部地面工程室', '地面工程室', '100003009003003', null, '1', '1', '', '28b2e431-1790-4e2e-b33f-8e95575063a0');
INSERT INTO `ts_uidp_org` VALUES ('c4cba746-3ec7-44e1-bfb9-2d863b943df8', '100003009003004', '大港油田公司所属单位第五采油厂五厂直附属五厂修井管理中心', '五厂修井管理中心', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('002f178a-38fa-4c19-800a-98de22559751', '100003009003004001', '大港油田公司所属单位第五采油厂五厂直附属五厂修井管理中心中心领导', '中心领导', '100003009003004', null, '1', '1', '', 'c4cba746-3ec7-44e1-bfb9-2d863b943df8');
INSERT INTO `ts_uidp_org` VALUES ('eb9b949f-2960-4198-8eea-844aa7301a6a', '100003009003004002', '大港油田公司所属单位第五采油厂五厂直附属五厂修井管理中心工艺设计室', '工艺设计室', '100003009003004', null, '1', '1', '', 'c4cba746-3ec7-44e1-bfb9-2d863b943df8');
INSERT INTO `ts_uidp_org` VALUES ('ceab9382-64bc-49fe-8960-3f85e7a68554', '100003009003004003', '大港油田公司所属单位第五采油厂五厂直附属五厂修井管理中心生产运行室', '生产运行室', '100003009003004', null, '1', '1', '', 'c4cba746-3ec7-44e1-bfb9-2d863b943df8');
INSERT INTO `ts_uidp_org` VALUES ('549841dc-1bea-49df-b68f-11298f611471', '100003009003004004', '大港油田公司所属单位第五采油厂五厂直附属五厂修井管理中心套变研究室', '套变研究室', '100003009003004', null, '1', '1', '', 'c4cba746-3ec7-44e1-bfb9-2d863b943df8');
INSERT INTO `ts_uidp_org` VALUES ('d1b20af6-4692-46c6-b815-2af1948b7b52', '100003009003004005', '大港油田公司所属单位第五采油厂五厂直附属五厂修井管理中心综合管理室', '综合管理室', '100003009003004', null, '1', '1', '', 'c4cba746-3ec7-44e1-bfb9-2d863b943df8');
INSERT INTO `ts_uidp_org` VALUES ('e7910b84-54a5-456d-b00e-de7771cfb4a9', '100003009003005', '大港油田公司所属单位第五采油厂五厂直附属五厂电力管理站', '五厂电力管理站', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('8eb08c36-92e7-4369-9331-e6521fe3563e', '100003009003006', '大港油田公司所属单位第五采油厂五厂直附属五厂天然气管理站', '五厂天然气管理站', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('dbc69dd3-765f-48a7-9922-51d65c82e550', '100003009003007', '大港油田公司所属单位第五采油厂五厂直附属五厂基建管理站', '五厂基建管理站', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('e38ef36e-e969-4d30-8633-9728e1db5dfb', '100003009003007001', '大港油田公司所属单位第五采油厂五厂直附属五厂基建管理站领导', '领导', '100003009003007', null, '1', '1', '', 'dbc69dd3-765f-48a7-9922-51d65c82e550');
INSERT INTO `ts_uidp_org` VALUES ('cc1bd436-f321-4408-adaf-75341b96c7e7', '100003009003007002', '大港油田公司所属单位第五采油厂五厂直附属五厂基建管理站工程管理室', '工程管理室', '100003009003007', null, '1', '1', '', 'dbc69dd3-765f-48a7-9922-51d65c82e550');
INSERT INTO `ts_uidp_org` VALUES ('1b677272-745c-43c7-8982-bec2ae6f0638', '100003009003007003', '大港油田公司所属单位第五采油厂五厂直附属五厂基建管理站现场监督室', '现场监督室', '100003009003007', null, '1', '1', '', 'dbc69dd3-765f-48a7-9922-51d65c82e550');
INSERT INTO `ts_uidp_org` VALUES ('9eb40ba3-ee44-4411-ac4e-83863daf8e91', '100003009003008', '大港油田公司所属单位第五采油厂五厂直附属五厂物资管理站', '五厂物资管理站', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('f9719d6a-a493-4e97-9ca7-6c8d0a2e8bef', '100003009003008001', '大港油田公司所属单位第五采油厂五厂直附属五厂物资管理站领导', '领导', '100003009003008', null, '1', '1', '', '9eb40ba3-ee44-4411-ac4e-83863daf8e91');
INSERT INTO `ts_uidp_org` VALUES ('49f2dd56-0fbf-47be-b4e8-6f5ce94c460f', '100003009003008002', '大港油田公司所属单位第五采油厂五厂直附属五厂物资管理站综合室', '综合室', '100003009003008', null, '1', '1', '', '9eb40ba3-ee44-4411-ac4e-83863daf8e91');
INSERT INTO `ts_uidp_org` VALUES ('f4bd073b-0274-4441-948c-a954f0a5464d', '100003009003008003', '大港油田公司所属单位第五采油厂五厂直附属五厂物资管理站计划合同室', '计划合同室', '100003009003008', null, '1', '1', '', '9eb40ba3-ee44-4411-ac4e-83863daf8e91');
INSERT INTO `ts_uidp_org` VALUES ('cb466167-0714-4ed8-abca-8a9da37aefea', '100003009003008004', '大港油田公司所属单位第五采油厂五厂直附属五厂物资管理站设备管理室', '设备管理室', '100003009003008', null, '1', '1', '', '9eb40ba3-ee44-4411-ac4e-83863daf8e91');
INSERT INTO `ts_uidp_org` VALUES ('1d21af08-74ba-492f-b2bc-633a6291927d', '100003009003008005', '大港油田公司所属单位第五采油厂五厂直附属五厂物资管理站物采一室', '物采一室', '100003009003008', null, '1', '1', '', '9eb40ba3-ee44-4411-ac4e-83863daf8e91');
INSERT INTO `ts_uidp_org` VALUES ('77e9d622-5de7-4d53-a25a-bf1b0be4ccb6', '100003009003008006', '大港油田公司所属单位第五采油厂五厂直附属五厂物资管理站物采二室', '物采二室', '100003009003008', null, '1', '1', '', '9eb40ba3-ee44-4411-ac4e-83863daf8e91');
INSERT INTO `ts_uidp_org` VALUES ('05ff21c5-aa2a-4131-89df-3a04bd4e3635', '100003009003009', '大港油田公司所属单位第五采油厂五厂直附属五厂信息管理站', '五厂信息管理站', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('9c86de6d-fced-4a9c-9262-09a7cf80c0b6', '100003009003010', '大港油田公司所属单位第五采油厂五厂直附属五厂安全监督站', '五厂安全监督站', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('2619e3c9-c6bf-40a0-95a9-345379d5db95', '100003009003011', '大港油田公司所属单位第五采油厂五厂直附属五厂经警大队', '五厂经警大队', '100003009003', null, '1', '1', '', 'fbb580fe-8132-4fb5-a0cc-8f4613299896');
INSERT INTO `ts_uidp_org` VALUES ('a7f2251e-8b22-40eb-9e2d-0f2433613f0b', '100003009004', '大港油田公司所属单位第五采油厂五厂所属', '五厂所属', '100003009', null, '1', '1', '', '7f59fea6-13ff-491d-b434-c555b63c6832');
INSERT INTO `ts_uidp_org` VALUES ('68bc5a6c-f76c-40b1-b994-f85688511133', '100003009004001', '大港油田公司所属单位第五采油厂五厂所属五厂作业一区', '五厂作业一区', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('d935b2ff-3d74-4a65-820b-ffc6c1c5e04a', '100003009004001001', '大港油田公司所属单位第五采油厂五厂所属五厂作业一区领导', '领导', '100003009004001', null, '1', '1', '', '68bc5a6c-f76c-40b1-b994-f85688511133');
INSERT INTO `ts_uidp_org` VALUES ('2a9b4008-4c17-45dc-a4e5-a43f4723e1a5', '100003009004001002', '大港油田公司所属单位第五采油厂五厂所属五厂作业一区生产技术组', '生产技术组', '100003009004001', null, '1', '1', '', '68bc5a6c-f76c-40b1-b994-f85688511133');
INSERT INTO `ts_uidp_org` VALUES ('7423b1a3-d7c7-4e60-ae3d-bdf19320a89d', '100003009004001003', '大港油田公司所属单位第五采油厂五厂所属五厂作业一区综合管理组', '综合管理组', '100003009004001', null, '1', '1', '', '68bc5a6c-f76c-40b1-b994-f85688511133');
INSERT INTO `ts_uidp_org` VALUES ('3a6744b1-c955-49ef-8281-b6dfdec6f677', '100003009004001004', '大港油田公司所属单位第五采油厂五厂所属五厂作业一区工程检修组', '工程检修组', '100003009004001', null, '1', '1', '', '68bc5a6c-f76c-40b1-b994-f85688511133');
INSERT INTO `ts_uidp_org` VALUES ('5e4af8a5-c5e0-4080-95c4-5c5a3c0f7639', '100003009004001005', '大港油田公司所属单位第五采油厂五厂所属五厂作业一区输油管理组', '输油管理组', '100003009004001', null, '1', '1', '', '68bc5a6c-f76c-40b1-b994-f85688511133');
INSERT INTO `ts_uidp_org` VALUES ('1658c6a4-5461-4277-8022-d3fa686aeb68', '100003009004001006', '大港油田公司所属单位第五采油厂五厂所属五厂作业一区油水井管理组', '油水井管理组', '100003009004001', null, '1', '1', '', '68bc5a6c-f76c-40b1-b994-f85688511133');
INSERT INTO `ts_uidp_org` VALUES ('ea2f20d9-97cb-4e87-b4a0-73550ab5bbb7', '100003009004002', '大港油田公司所属单位第五采油厂五厂所属五厂作业二区', '五厂作业二区', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('be71c3b1-4dba-4489-81c1-4f7a39dee8f9', '100003009004002001', '大港油田公司所属单位第五采油厂五厂所属五厂作业二区领导', '领导', '100003009004002', null, '1', '1', '', 'ea2f20d9-97cb-4e87-b4a0-73550ab5bbb7');
INSERT INTO `ts_uidp_org` VALUES ('d987dfa0-a093-42b7-92bf-6ca77440c3b2', '100003009004002002', '大港油田公司所属单位第五采油厂五厂所属五厂作业二区生产技术组', '生产技术组', '100003009004002', null, '1', '1', '', 'ea2f20d9-97cb-4e87-b4a0-73550ab5bbb7');
INSERT INTO `ts_uidp_org` VALUES ('aa9d641f-ebd8-4bc6-af38-7db43b35bb22', '100003009004002003', '大港油田公司所属单位第五采油厂五厂所属五厂作业二区综合管理组', '综合管理组', '100003009004002', null, '1', '1', '', 'ea2f20d9-97cb-4e87-b4a0-73550ab5bbb7');
INSERT INTO `ts_uidp_org` VALUES ('5e4d021a-4ce1-4afe-8088-1c32f94cae5a', '100003009004002004', '大港油田公司所属单位第五采油厂五厂所属五厂作业二区工程检修组', '工程检修组', '100003009004002', null, '1', '1', '', 'ea2f20d9-97cb-4e87-b4a0-73550ab5bbb7');
INSERT INTO `ts_uidp_org` VALUES ('3a29b2c6-c0ca-4c41-819c-7f9649e2b5fe', '100003009004002005', '大港油田公司所属单位第五采油厂五厂所属五厂作业二区输油管理组', '输油管理组', '100003009004002', null, '1', '1', '', 'ea2f20d9-97cb-4e87-b4a0-73550ab5bbb7');
INSERT INTO `ts_uidp_org` VALUES ('089d4a12-0cb8-413b-8b57-6ebcb59729a5', '100003009004002006', '大港油田公司所属单位第五采油厂五厂所属五厂作业二区油水井管理组', '油水井管理组', '100003009004002', null, '1', '1', '', 'ea2f20d9-97cb-4e87-b4a0-73550ab5bbb7');
INSERT INTO `ts_uidp_org` VALUES ('b535829d-6335-423a-a66f-eee35673799e', '100003009004003', '大港油田公司所属单位第五采油厂五厂所属五厂作业三区', '五厂作业三区', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('56b87a66-df61-42f8-8c2a-fea5c48dd6ce', '100003009004003001', '大港油田公司所属单位第五采油厂五厂所属五厂作业三区领导', '领导', '100003009004003', null, '1', '1', '', 'b535829d-6335-423a-a66f-eee35673799e');
INSERT INTO `ts_uidp_org` VALUES ('df378df5-4b61-421d-b770-d84e551ab228', '100003009004003002', '大港油田公司所属单位第五采油厂五厂所属五厂作业三区生产技术组', '生产技术组', '100003009004003', null, '1', '1', '', 'b535829d-6335-423a-a66f-eee35673799e');
INSERT INTO `ts_uidp_org` VALUES ('83be0974-8bd4-41c4-a4d6-c475bc75c522', '100003009004003003', '大港油田公司所属单位第五采油厂五厂所属五厂作业三区综合管理组', '综合管理组', '100003009004003', null, '1', '1', '', 'b535829d-6335-423a-a66f-eee35673799e');
INSERT INTO `ts_uidp_org` VALUES ('87336340-8b98-4080-8182-c380fee7ce31', '100003009004003004', '大港油田公司所属单位第五采油厂五厂所属五厂作业三区工程检修组', '工程检修组', '100003009004003', null, '1', '1', '', 'b535829d-6335-423a-a66f-eee35673799e');
INSERT INTO `ts_uidp_org` VALUES ('ffa2a676-22c0-4c47-ab96-a49c42db31ab', '100003009004003005', '大港油田公司所属单位第五采油厂五厂所属五厂作业三区输油管理组', '输油管理组', '100003009004003', null, '1', '1', '', 'b535829d-6335-423a-a66f-eee35673799e');
INSERT INTO `ts_uidp_org` VALUES ('347b8dbe-4853-4f57-99a5-ca6f000b77a0', '100003009004003006', '大港油田公司所属单位第五采油厂五厂所属五厂作业三区油水井管理组', '油水井管理组', '100003009004003', null, '1', '1', '', 'b535829d-6335-423a-a66f-eee35673799e');
INSERT INTO `ts_uidp_org` VALUES ('288bcaec-6473-4f84-9fc4-485c752e184f', '100003009004004', '大港油田公司所属单位第五采油厂五厂所属五厂三次采油', '五厂三次采油', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('60d944ca-a049-4b45-a965-0f1cd5ab3ae1', '100003009004005', '大港油田公司所属单位第五采油厂五厂所属五厂输注作业区', '五厂输注作业区', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('bb63d5ca-1f55-4c31-89d4-99ed69a0653c', '100003009004006', '大港油田公司所属单位第五采油厂五厂所属五厂西一联合站', '五厂西一联合站', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('1e03a82c-c34b-4d18-82af-0e11bfc040ba', '100003009004007', '大港油田公司所属单位第五采油厂五厂所属五厂自动化计量队', '五厂自动化计量队', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('48c1601d-e50e-4d65-948f-6f50be99a91e', '100003009004007001', '大港油田公司所属单位第五采油厂五厂所属五厂自动化计量队领导', '领导', '100003009004007', null, '1', '1', '', '1e03a82c-c34b-4d18-82af-0e11bfc040ba');
INSERT INTO `ts_uidp_org` VALUES ('e1816551-26b6-4f1f-b58a-9c3ca7197bde', '100003009004007002', '大港油田公司所属单位第五采油厂五厂所属五厂自动化计量队综合组', '综合组', '100003009004007', null, '1', '1', '', '1e03a82c-c34b-4d18-82af-0e11bfc040ba');
INSERT INTO `ts_uidp_org` VALUES ('9f63af16-01d8-49dc-9ca7-36a9323dc638', '100003009004007003', '大港油田公司所属单位第五采油厂五厂所属五厂自动化计量队测试组', '测试组', '100003009004007', null, '1', '1', '', '1e03a82c-c34b-4d18-82af-0e11bfc040ba');
INSERT INTO `ts_uidp_org` VALUES ('26705789-bed6-4d33-85ba-42095b11d9c4', '100003009004007004', '大港油田公司所属单位第五采油厂五厂所属五厂自动化计量队化验室', '化验室', '100003009004007', null, '1', '1', '', '1e03a82c-c34b-4d18-82af-0e11bfc040ba');
INSERT INTO `ts_uidp_org` VALUES ('8cbef6ac-e4af-4b75-bda4-ec36877b1745', '100003009004007005', '大港油田公司所属单位第五采油厂五厂所属五厂自动化计量队技术组', '技术组', '100003009004007', null, '1', '1', '', '1e03a82c-c34b-4d18-82af-0e11bfc040ba');
INSERT INTO `ts_uidp_org` VALUES ('0de989b9-8f66-4eaf-bad9-de9d5c261dac', '100003009004007006', '大港油田公司所属单位第五采油厂五厂所属五厂自动化计量队仪表组', '仪表组', '100003009004007', null, '1', '1', '', '1e03a82c-c34b-4d18-82af-0e11bfc040ba');
INSERT INTO `ts_uidp_org` VALUES ('e92ab8a9-214b-4814-9301-328fdc1abecf', '100003009004008', '大港油田公司所属单位第五采油厂五厂所属五厂维修队', '五厂维修队', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('72a0d328-90dc-4dd0-862d-f7afd1990fb6', '100003009004009', '大港油田公司所属单位第五采油厂五厂所属五厂管杆检修队', '五厂管杆检修队', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('f60aee1d-1fae-4e9a-847b-a915e01df36a', '100003009004010', '大港油田公司所属单位第五采油厂五厂所属五厂交油队', '五厂交油队', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('81b4224e-4a19-4a40-ab79-2177eeb93e5a', '100003009004011', '大港油田公司所属单位第五采油厂五厂所属五厂综合服务队', '五厂综合服务队', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('d3710240-640a-4b1f-80b7-2cc259d99a3f', '100003009004012', '大港油田公司所属单位第五采油厂五厂所属五厂综合车队', '五厂综合车队', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('4b91d0d4-328a-40d6-acc4-096cb2e09fdb', '100003009004013', '大港油田公司所属单位第五采油厂五厂所属五厂食堂管理组', '五厂食堂管理组', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('cc34aeeb-a2d3-4595-a391-fc0e01f3db04', '100003009004014', '大港油田公司所属单位第五采油厂五厂所属五厂项目组', '五厂项目组', '100003009004', null, '1', '1', '', 'a7f2251e-8b22-40eb-9e2d-0f2433613f0b');
INSERT INTO `ts_uidp_org` VALUES ('cbe05744-74d3-4114-8601-d6e4e337a47d', '100003009005', '大港油田公司所属单位第五采油厂五厂景盛工贸中心', '五厂景盛工贸中心', '100003009', null, '1', '1', '', '7f59fea6-13ff-491d-b434-c555b63c6832');
INSERT INTO `ts_uidp_org` VALUES ('c8f2e6c7-19e8-48c2-8888-8c04cd6c2ef5', '100003010', '大港油田公司所属单位第六采油厂', '第六采油厂', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('4693af4e-3b7e-4661-96c6-e69d4d472449', '100003010001', '大港油田公司所属单位第六采油厂六厂领导', '六厂领导', '100003010', null, '1', '1', '', 'c8f2e6c7-19e8-48c2-8888-8c04cd6c2ef5');
INSERT INTO `ts_uidp_org` VALUES ('4be50b65-2a2b-467f-8861-2dcade7ea02d', '100003010002', '大港油田公司所属单位第六采油厂六厂助理', '六厂助理', '100003010', null, '1', '1', '', 'c8f2e6c7-19e8-48c2-8888-8c04cd6c2ef5');
INSERT INTO `ts_uidp_org` VALUES ('b2997979-e99c-4cb2-a734-52204da7fae4', '100003010003', '大港油田公司所属单位第六采油厂六厂机关', '六厂机关', '100003010', null, '1', '1', '', 'c8f2e6c7-19e8-48c2-8888-8c04cd6c2ef5');
INSERT INTO `ts_uidp_org` VALUES ('d60ea50c-2e35-46b7-84f4-1ead3400789a', '100003010003001', '大港油田公司所属单位第六采油厂六厂机关厂长办公室', '厂长办公室', '100003010003', null, '1', '1', '', 'b2997979-e99c-4cb2-a734-52204da7fae4');
INSERT INTO `ts_uidp_org` VALUES ('3e50edd0-05a3-4664-a61d-4f375e0d69f4', '100003010003002', '大港油田公司所属单位第六采油厂六厂机关党群工作部', '党群工作部', '100003010003', null, '1', '1', '', 'b2997979-e99c-4cb2-a734-52204da7fae4');
INSERT INTO `ts_uidp_org` VALUES ('3c66edb8-386f-435d-b0a3-57faecf76740', '100003010003003', '大港油田公司所属单位第六采油厂六厂机关人事科', '人事科', '100003010003', null, '1', '1', '', 'b2997979-e99c-4cb2-a734-52204da7fae4');
INSERT INTO `ts_uidp_org` VALUES ('18b21f8e-fd43-41c8-9184-d770f76f9835', '100003010003003001', '大港油田公司所属单位第六采油厂六厂机关人事科培训站', '培训站', '100003010003003', null, '1', '1', '', '3c66edb8-386f-435d-b0a3-57faecf76740');
INSERT INTO `ts_uidp_org` VALUES ('f46fe6c4-f7e0-4a52-8dc5-261f0c0c97e7', '100003010003004', '大港油田公司所属单位第六采油厂六厂机关财务科', '财务科', '100003010003', null, '1', '1', '', 'b2997979-e99c-4cb2-a734-52204da7fae4');
INSERT INTO `ts_uidp_org` VALUES ('7601c6a4-605b-4d12-8d6f-7e674705d85e', '100003010003005', '大港油田公司所属单位第六采油厂六厂机关规划计划科', '规划计划科', '100003010003', null, '1', '1', '', 'b2997979-e99c-4cb2-a734-52204da7fae4');
INSERT INTO `ts_uidp_org` VALUES ('81686020-5975-49af-9bcd-53af7c4d468d', '100003010003005001', '大港油田公司所属单位第六采油厂六厂机关规划计划科预算站', '预算站', '100003010003005', null, '1', '1', '', '7601c6a4-605b-4d12-8d6f-7e674705d85e');
INSERT INTO `ts_uidp_org` VALUES ('4cece62f-8627-4aac-915c-c51240a2a846', '100003010003006', '大港油田公司所属单位第六采油厂六厂机关油田管理科', '油田管理科', '100003010003', null, '1', '1', '', 'b2997979-e99c-4cb2-a734-52204da7fae4');
INSERT INTO `ts_uidp_org` VALUES ('9d905a91-ec95-4e87-b09d-7ca16585bff0', '100003010003007', '大港油田公司所属单位第六采油厂六厂机关安全环保科', '安全环保科', '100003010003', null, '1', '1', '', 'b2997979-e99c-4cb2-a734-52204da7fae4');
INSERT INTO `ts_uidp_org` VALUES ('e97c6047-d452-434f-a65a-7a6ecd36c910', '100003010003007001', '大港油田公司所属单位第六采油厂六厂机关安全环保科HSE安全监督站', 'HSE安全监督站', '100003010003007', null, '1', '1', '', '9d905a91-ec95-4e87-b09d-7ca16585bff0');
INSERT INTO `ts_uidp_org` VALUES ('9c6ded9a-00da-4e86-ae6d-4be35de23449', '100003010003008', '大港油田公司所属单位第六采油厂六厂机关生产科', '生产科', '100003010003', null, '1', '1', '', 'b2997979-e99c-4cb2-a734-52204da7fae4');
INSERT INTO `ts_uidp_org` VALUES ('81036b3e-85db-40a0-9e84-6c871bbe1a89', '100003010004', '大港油田公司所属单位第六采油厂六厂直附属', '六厂直附属', '100003010', null, '1', '1', '', 'c8f2e6c7-19e8-48c2-8888-8c04cd6c2ef5');
INSERT INTO `ts_uidp_org` VALUES ('d53980b9-cf98-4641-a69e-bdb34951896d', '100003010004001', '大港油田公司所属单位第六采油厂六厂直附属地质研究所', '地质研究所', '100003010004', null, '1', '1', '', '81036b3e-85db-40a0-9e84-6c871bbe1a89');
INSERT INTO `ts_uidp_org` VALUES ('414eefd3-fe21-45df-99cb-234c4b75c64a', '100003010004001001', '大港油田公司所属单位第六采油厂六厂直附属地质研究所地质所领导', '地质所领导', '100003010004001', null, '1', '1', '', 'd53980b9-cf98-4641-a69e-bdb34951896d');
INSERT INTO `ts_uidp_org` VALUES ('b4e51502-b86d-44cf-8750-8c6ca832d780', '100003010004001002', '大港油田公司所属单位第六采油厂六厂直附属地质研究所专家组', '专家组', '100003010004001', null, '1', '1', '', 'd53980b9-cf98-4641-a69e-bdb34951896d');
INSERT INTO `ts_uidp_org` VALUES ('9eca2d87-4edd-4230-99cc-4b3327f318fb', '100003010004001003', '大港油田公司所属单位第六采油厂六厂直附属地质研究所方案室', '方案室', '100003010004001', null, '1', '1', '', 'd53980b9-cf98-4641-a69e-bdb34951896d');
INSERT INTO `ts_uidp_org` VALUES ('e5994a70-dbef-4ae5-bdf1-0c59093e7ace', '100003010004001004', '大港油田公司所属单位第六采油厂六厂直附属地质研究所油描室', '油描室', '100003010004001', null, '1', '1', '', 'd53980b9-cf98-4641-a69e-bdb34951896d');
INSERT INTO `ts_uidp_org` VALUES ('eb04a2e5-c434-41ac-9d57-f037ad8608f0', '100003010004001005', '大港油田公司所属单位第六采油厂六厂直附属地质研究所滚评室', '滚评室', '100003010004001', null, '1', '1', '', 'd53980b9-cf98-4641-a69e-bdb34951896d');
INSERT INTO `ts_uidp_org` VALUES ('aef8c142-682b-448e-932d-e8a4df413913', '100003010004001006', '大港油田公司所属单位第六采油厂六厂直附属地质研究所信息室', '信息室', '100003010004001', null, '1', '1', '', 'd53980b9-cf98-4641-a69e-bdb34951896d');
INSERT INTO `ts_uidp_org` VALUES ('281d67fd-9101-4fec-bde6-581362fb1d81', '100003010004001007', '大港油田公司所属单位第六采油厂六厂直附属地质研究所生产室', '生产室', '100003010004001', null, '1', '1', '', 'd53980b9-cf98-4641-a69e-bdb34951896d');
INSERT INTO `ts_uidp_org` VALUES ('61feae60-9b36-48b4-a14b-56266f05be6a', '100003010004001008', '大港油田公司所属单位第六采油厂六厂直附属地质研究所化验室', '化验室', '100003010004001', null, '1', '1', '', 'd53980b9-cf98-4641-a69e-bdb34951896d');
INSERT INTO `ts_uidp_org` VALUES ('cc076a1d-deaa-437b-96b9-aa99b4902b67', '100003010004002', '大港油田公司所属单位第六采油厂六厂直附属工艺研究所', '工艺研究所', '100003010004', null, '1', '1', '', '81036b3e-85db-40a0-9e84-6c871bbe1a89');
INSERT INTO `ts_uidp_org` VALUES ('fe323182-bc5b-4350-a42b-5f5842e96e05', '100003010004002001', '大港油田公司所属单位第六采油厂六厂直附属工艺研究所工艺所领导', '工艺所领导', '100003010004002', null, '1', '1', '', 'cc076a1d-deaa-437b-96b9-aa99b4902b67');
INSERT INTO `ts_uidp_org` VALUES ('cad4f38a-255e-4827-9de7-487ed9548d0b', '100003010004002002', '大港油田公司所属单位第六采油厂六厂直附属工艺研究所综合节能室', '综合节能室', '100003010004002', null, '1', '1', '', 'cc076a1d-deaa-437b-96b9-aa99b4902b67');
INSERT INTO `ts_uidp_org` VALUES ('f89c825f-32c0-42a3-90e1-03b5ce472a2a', '100003010004002003', '大港油田公司所属单位第六采油厂六厂直附属工艺研究所注水室', '注水室', '100003010004002', null, '1', '1', '', 'cc076a1d-deaa-437b-96b9-aa99b4902b67');
INSERT INTO `ts_uidp_org` VALUES ('17b75a83-3900-4d72-b1ee-8981d9ff8532', '100003010004002004', '大港油田公司所属单位第六采油厂六厂直附属工艺研究所地面室', '地面室', '100003010004002', null, '1', '1', '', 'cc076a1d-deaa-437b-96b9-aa99b4902b67');
INSERT INTO `ts_uidp_org` VALUES ('7d58a258-a2ad-4334-ace6-9aaf4412bf8c', '100003010004002005', '大港油田公司所属单位第六采油厂六厂直附属工艺研究所采油室', '采油室', '100003010004002', null, '1', '1', '', 'cc076a1d-deaa-437b-96b9-aa99b4902b67');
INSERT INTO `ts_uidp_org` VALUES ('a6e89f3c-c912-4678-9b0f-a24eb804ddf3', '100003010004002006', '大港油田公司所属单位第六采油厂六厂直附属工艺研究所测试组', '测试组', '100003010004002', null, '1', '1', '', 'cc076a1d-deaa-437b-96b9-aa99b4902b67');
INSERT INTO `ts_uidp_org` VALUES ('09933a77-c9ca-470d-b99b-cb21ba494922', '100003010004002007', '大港油田公司所属单位第六采油厂六厂直附属工艺研究所计量化验室', '计量化验室', '100003010004002', null, '1', '1', '', 'cc076a1d-deaa-437b-96b9-aa99b4902b67');
INSERT INTO `ts_uidp_org` VALUES ('4d6fc6ae-0eae-40f2-a7d3-04a63050af0b', '100003010004003', '大港油田公司所属单位第六采油厂六厂直附属修井管理中心', '修井管理中心', '100003010004', null, '1', '1', '', '81036b3e-85db-40a0-9e84-6c871bbe1a89');
INSERT INTO `ts_uidp_org` VALUES ('fc0a9fcb-1e8e-444a-a2f6-5af90b1aa949', '100003010004003001', '大港油田公司所属单位第六采油厂六厂直附属修井管理中心领导', '领导', '100003010004003', null, '1', '1', '', '4d6fc6ae-0eae-40f2-a7d3-04a63050af0b');
INSERT INTO `ts_uidp_org` VALUES ('0374df24-3545-44a2-abe1-7f3b7fbdb575', '100003010004003002', '大港油田公司所属单位第六采油厂六厂直附属修井管理中心专家', '专家', '100003010004003', null, '1', '1', '', '4d6fc6ae-0eae-40f2-a7d3-04a63050af0b');
INSERT INTO `ts_uidp_org` VALUES ('c52d3193-3cfd-4640-8987-2bd909f16c1d', '100003010004003003', '大港油田公司所属单位第六采油厂六厂直附属修井管理中心修井工艺室', '修井工艺室', '100003010004003', null, '1', '1', '', '4d6fc6ae-0eae-40f2-a7d3-04a63050af0b');
INSERT INTO `ts_uidp_org` VALUES ('39115ad8-e543-43c3-8761-ec98fa362b2e', '100003010004003004', '大港油田公司所属单位第六采油厂六厂直附属修井管理中心修井监督室', '修井监督室', '100003010004003', null, '1', '1', '', '4d6fc6ae-0eae-40f2-a7d3-04a63050af0b');
INSERT INTO `ts_uidp_org` VALUES ('d50e2793-2bd0-4e0f-9d1e-87d90e73cf5b', '100003010004003005', '大港油田公司所属单位第六采油厂六厂直附属修井管理中心生产运行室', '生产运行室', '100003010004003', null, '1', '1', '', '4d6fc6ae-0eae-40f2-a7d3-04a63050af0b');
INSERT INTO `ts_uidp_org` VALUES ('06f1097d-01db-4162-a283-f248b71c2b1f', '100003010004004', '大港油田公司所属单位第六采油厂六厂直附属产能建设办公室', '产能建设办公室', '100003010004', null, '1', '1', '', '81036b3e-85db-40a0-9e84-6c871bbe1a89');
INSERT INTO `ts_uidp_org` VALUES ('a74aeeea-3910-4340-aeff-3e3de0f6ffae', '100003010004005', '大港油田公司所属单位第六采油厂六厂直附属物资装备办公室', '物资装备办公室', '100003010004', null, '1', '1', '', '81036b3e-85db-40a0-9e84-6c871bbe1a89');
INSERT INTO `ts_uidp_org` VALUES ('9a99a157-53a8-429d-b50c-770b8656ee0c', '100003010004006', '大港油田公司所属单位第六采油厂六厂直附属基建办公室', '基建办公室', '100003010004', null, '1', '1', '', '81036b3e-85db-40a0-9e84-6c871bbe1a89');
INSERT INTO `ts_uidp_org` VALUES ('8072effd-11b5-4beb-a04f-8cd4fe4c13e6', '100003010004007', '大港油田公司所属单位第六采油厂六厂直附属信息档案室', '信息档案室', '100003010004', null, '1', '1', '', '81036b3e-85db-40a0-9e84-6c871bbe1a89');
INSERT INTO `ts_uidp_org` VALUES ('dd454724-d886-496a-a04f-4485f25d9c07', '100003010004008', '大港油田公司所属单位第六采油厂六厂直附属电力管理办公室', '电力管理办公室', '100003010004', null, '1', '1', '', '81036b3e-85db-40a0-9e84-6c871bbe1a89');
INSERT INTO `ts_uidp_org` VALUES ('df213dc0-a0ac-4a0d-b9f7-cf1cb1c41662', '100003010004009', '大港油田公司所属单位第六采油厂六厂直附属经警大队', '经警大队', '100003010004', null, '1', '1', '', '81036b3e-85db-40a0-9e84-6c871bbe1a89');
INSERT INTO `ts_uidp_org` VALUES ('45333bc6-057c-4816-8c46-8d8e5bc90e4f', '100003010005', '大港油田公司所属单位第六采油厂六厂所属', '六厂所属', '100003010', null, '1', '1', '', 'c8f2e6c7-19e8-48c2-8888-8c04cd6c2ef5');
INSERT INTO `ts_uidp_org` VALUES ('039f9665-3084-4719-afea-af11d6e4efc6', '100003010005001', '大港油田公司所属单位第六采油厂六厂所属采注一队', '采注一队', '100003010005', null, '1', '1', '', '45333bc6-057c-4816-8c46-8d8e5bc90e4f');
INSERT INTO `ts_uidp_org` VALUES ('4218ff02-9526-4b89-b709-0200a333492a', '100003010005001001', '大港油田公司所属单位第六采油厂六厂所属采注一队队部', '队部', '100003010005001', null, '1', '1', '', '039f9665-3084-4719-afea-af11d6e4efc6');
INSERT INTO `ts_uidp_org` VALUES ('1eb0c353-013f-4e22-916b-81492b202c2d', '100003010005001002', '大港油田公司所属单位第六采油厂六厂所属采注一队基层班站', '基层班站', '100003010005001', null, '1', '1', '', '039f9665-3084-4719-afea-af11d6e4efc6');
INSERT INTO `ts_uidp_org` VALUES ('ed4f8fbb-24ce-445c-9c35-eebccc9781ce', '100003010005002', '大港油田公司所属单位第六采油厂六厂所属采注二队', '采注二队', '100003010005', null, '1', '1', '', '45333bc6-057c-4816-8c46-8d8e5bc90e4f');
INSERT INTO `ts_uidp_org` VALUES ('fa334151-3318-4f49-b6a7-b545e30d76e5', '100003010005002001', '大港油田公司所属单位第六采油厂六厂所属采注二队队部', '队部', '100003010005002', null, '1', '1', '', 'ed4f8fbb-24ce-445c-9c35-eebccc9781ce');
INSERT INTO `ts_uidp_org` VALUES ('7b981c0d-cd7e-47c0-9ca6-68f846a49d95', '100003010005002002', '大港油田公司所属单位第六采油厂六厂所属采注二队基层班站', '基层班站', '100003010005002', null, '1', '1', '', 'ed4f8fbb-24ce-445c-9c35-eebccc9781ce');
INSERT INTO `ts_uidp_org` VALUES ('d9e76f04-be81-4c1d-8bea-00c6a1ce244b', '100003010005003', '大港油田公司所属单位第六采油厂六厂所属采注三队', '采注三队', '100003010005', null, '1', '1', '', '45333bc6-057c-4816-8c46-8d8e5bc90e4f');
INSERT INTO `ts_uidp_org` VALUES ('8edbbb17-5889-4c91-b2da-27ae362fc4bc', '100003010005003001', '大港油田公司所属单位第六采油厂六厂所属采注三队队部', '队部', '100003010005003', null, '1', '1', '', 'd9e76f04-be81-4c1d-8bea-00c6a1ce244b');
INSERT INTO `ts_uidp_org` VALUES ('02b55702-05db-41a6-8ac5-48447238acd2', '100003010005003002', '大港油田公司所属单位第六采油厂六厂所属采注三队基层班站', '基层班站', '100003010005003', null, '1', '1', '', 'd9e76f04-be81-4c1d-8bea-00c6a1ce244b');
INSERT INTO `ts_uidp_org` VALUES ('557a1bff-f83c-4489-94e7-ef19c64e7674', '100003010005004', '大港油田公司所属单位第六采油厂六厂所属输注一队', '输注一队', '100003010005', null, '1', '1', '', '45333bc6-057c-4816-8c46-8d8e5bc90e4f');
INSERT INTO `ts_uidp_org` VALUES ('f536ead4-7dbc-43c6-8009-7fabed511ae8', '100003010005004001', '大港油田公司所属单位第六采油厂六厂所属输注一队队部', '队部', '100003010005004', null, '1', '1', '', '557a1bff-f83c-4489-94e7-ef19c64e7674');
INSERT INTO `ts_uidp_org` VALUES ('4bd88ff1-f040-478c-8b31-7fd0d7bca45e', '100003010005004002', '大港油田公司所属单位第六采油厂六厂所属输注一队基层班站', '基层班站', '100003010005004', null, '1', '1', '', '557a1bff-f83c-4489-94e7-ef19c64e7674');
INSERT INTO `ts_uidp_org` VALUES ('82733acd-eeaf-4e04-92af-228beb6fd23c', '100003010005005', '大港油田公司所属单位第六采油厂六厂所属输注二队', '输注二队', '100003010005', null, '1', '1', '', '45333bc6-057c-4816-8c46-8d8e5bc90e4f');
INSERT INTO `ts_uidp_org` VALUES ('97e2d530-e3db-405f-a1c9-0d43803d9432', '100003010005005001', '大港油田公司所属单位第六采油厂六厂所属输注二队队部', '队部', '100003010005005', null, '1', '1', '', '82733acd-eeaf-4e04-92af-228beb6fd23c');
INSERT INTO `ts_uidp_org` VALUES ('1a15659b-a94f-44d0-97cf-3b52482ca24c', '100003010005005002', '大港油田公司所属单位第六采油厂六厂所属输注二队基层班站', '基层班站', '100003010005005', null, '1', '1', '', '82733acd-eeaf-4e04-92af-228beb6fd23c');
INSERT INTO `ts_uidp_org` VALUES ('07e6b112-b1c2-41d0-9389-bb3dcd22293d', '100003010005006', '大港油田公司所属单位第六采油厂六厂所属交接油队', '交接油队', '100003010005', null, '1', '1', '', '45333bc6-057c-4816-8c46-8d8e5bc90e4f');
INSERT INTO `ts_uidp_org` VALUES ('c5883af2-4584-4ce7-aec2-fc5698caabe1', '100003010005006001', '大港油田公司所属单位第六采油厂六厂所属交接油队队部', '队部', '100003010005006', null, '1', '1', '', '07e6b112-b1c2-41d0-9389-bb3dcd22293d');
INSERT INTO `ts_uidp_org` VALUES ('a885d4fb-c66d-4929-bb6d-5b8eda222116', '100003010005006002', '大港油田公司所属单位第六采油厂六厂所属交接油队基层班站', '基层班站', '100003010005006', null, '1', '1', '', '07e6b112-b1c2-41d0-9389-bb3dcd22293d');
INSERT INTO `ts_uidp_org` VALUES ('e4fbe8f4-b86c-40df-95ca-d5d39cfbf310', '100003010005007', '大港油田公司所属单位第六采油厂六厂所属维修队', '维修队', '100003010005', null, '1', '1', '', '45333bc6-057c-4816-8c46-8d8e5bc90e4f');
INSERT INTO `ts_uidp_org` VALUES ('af2c4017-865e-4900-a289-a07d229c370a', '100003010005008', '大港油田公司所属单位第六采油厂六厂所属综合车队', '综合车队', '100003010005', null, '1', '1', '', '45333bc6-057c-4816-8c46-8d8e5bc90e4f');
INSERT INTO `ts_uidp_org` VALUES ('a9523dc7-3bcb-4f5e-9fbe-9a6237745984', '100003010005009', '大港油田公司所属单位第六采油厂六厂所属综合服务队', '综合服务队', '100003010005', null, '1', '1', '', '45333bc6-057c-4816-8c46-8d8e5bc90e4f');
INSERT INTO `ts_uidp_org` VALUES ('d6eb9303-46e2-4091-b7f4-47c8d8bba24f', '100003010006', '大港油田公司所属单位第六采油厂沧海派出所', '沧海派出所', '100003010', null, '1', '1', '', 'c8f2e6c7-19e8-48c2-8888-8c04cd6c2ef5');
INSERT INTO `ts_uidp_org` VALUES ('7c760a76-e1e1-45fa-bdcf-a2a61b5eaa08', '100003010007', '大港油田公司所属单位第六采油厂六厂恒昌公司', '六厂恒昌公司', '100003010', null, '1', '1', '', 'c8f2e6c7-19e8-48c2-8888-8c04cd6c2ef5');
INSERT INTO `ts_uidp_org` VALUES ('3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf', '100003011', '大港油田公司所属单位滩海开发公司', '滩海开发公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('69baee15-026b-4c56-8054-8af00ca57d8e', '100003011001', '大港油田公司所属单位滩海开发公司公司领导', '公司领导', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('7aa8ecbe-1f14-446b-bb23-27108515aab8', '100003011002', '大港油田公司所属单位滩海开发公司公司助理', '公司助理', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('2000c3a1-7b4a-4bf4-9d96-2baa7aabb512', '100003011003', '大港油田公司所属单位滩海开发公司高级专家', '高级专家', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('39f3d19f-221a-4560-86b9-9753460e0e3c', '100003011004', '大港油田公司所属单位滩海开发公司滩海公司办公室', '滩海公司办公室', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('8d4c1c5e-831b-4fc1-aa6e-952530bfe3d4', '100003011005', '大港油田公司所属单位滩海开发公司滩海党群工作部', '滩海党群工作部', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('09bcb7dc-9eaa-4448-a337-264eb70c4ea1', '100003011006', '大港油田公司所属单位滩海开发公司滩海人事劳资科', '滩海人事劳资科', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('5be7045b-0752-49e3-b098-d26930477931', '100003011007', '大港油田公司所属单位滩海开发公司滩海生产运行科', '滩海生产运行科', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('d741b94a-5ad2-4a61-86b5-c537039aeed4', '100003011008', '大港油田公司所属单位滩海开发公司滩海规划计划科', '滩海规划计划科', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('dc0c484d-8f3d-4f75-92a4-37cfced64267', '100003011009', '大港油田公司所属单位滩海开发公司滩海财务资产科', '滩海财务资产科', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('5c74fb40-c33c-401c-a542-31d264530f59', '100003011010', '大港油田公司所属单位滩海开发公司滩海安全环保科', '滩海安全环保科', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('5c4acaa9-2621-4545-a389-ee2726621016', '100003011011', '大港油田公司所属单位滩海开发公司滩海地质研究所', '滩海地质研究所', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('55d25a80-50e7-4e09-8855-493cf403c417', '100003011011001', '大港油田公司所属单位滩海开发公司滩海地质研究所所领导', '所领导', '100003011011', null, '1', '1', '', '5c4acaa9-2621-4545-a389-ee2726621016');
INSERT INTO `ts_uidp_org` VALUES ('96b6eea4-0a23-48ee-a799-d17425b6c933', '100003011011002', '大港油田公司所属单位滩海开发公司滩海地质研究所综合室', '综合室', '100003011011', null, '1', '1', '', '5c4acaa9-2621-4545-a389-ee2726621016');
INSERT INTO `ts_uidp_org` VALUES ('ee5f902c-d0c6-4bd7-acf8-ee6502ab9591', '100003011011003', '大港油田公司所属单位滩海开发公司滩海地质研究所地质方案室', '地质方案室', '100003011011', null, '1', '1', '', '5c4acaa9-2621-4545-a389-ee2726621016');
INSERT INTO `ts_uidp_org` VALUES ('953d6efc-f175-4e32-a989-8c98223b2920', '100003011011004', '大港油田公司所属单位滩海开发公司滩海地质研究所油藏动态室', '油藏动态室', '100003011011', null, '1', '1', '', '5c4acaa9-2621-4545-a389-ee2726621016');
INSERT INTO `ts_uidp_org` VALUES ('7a6a16b0-9016-44fb-aea6-39de32c53a5a', '100003011011005', '大港油田公司所属单位滩海开发公司滩海地质研究所生产室', '生产室', '100003011011', null, '1', '1', '', '5c4acaa9-2621-4545-a389-ee2726621016');
INSERT INTO `ts_uidp_org` VALUES ('081f0bd3-3362-45ba-989e-56b886330223', '100003011011006', '大港油田公司所属单位滩海开发公司滩海地质研究所油藏评价室', '油藏评价室', '100003011011', null, '1', '1', '', '5c4acaa9-2621-4545-a389-ee2726621016');
INSERT INTO `ts_uidp_org` VALUES ('bbdafac8-e287-4626-a6e1-d89320a5bbbf', '100003011012', '大港油田公司所属单位滩海开发公司滩海工艺研究所', '滩海工艺研究所', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('2334885b-57f4-47bd-b25b-2e5dab11ee0f', '100003011012001', '大港油田公司所属单位滩海开发公司滩海工艺研究所所领导', '所领导', '100003011012', null, '1', '1', '', 'bbdafac8-e287-4626-a6e1-d89320a5bbbf');
INSERT INTO `ts_uidp_org` VALUES ('f66e00f3-df68-4564-8479-8c1458ee5189', '100003011012002', '大港油田公司所属单位滩海开发公司滩海工艺研究所地面工艺室', '地面工艺室', '100003011012', null, '1', '1', '', 'bbdafac8-e287-4626-a6e1-d89320a5bbbf');
INSERT INTO `ts_uidp_org` VALUES ('2f322d5a-2364-40c1-8f1e-35d3751ad9c4', '100003011012003', '大港油田公司所属单位滩海开发公司滩海工艺研究所自动化信息室', '自动化信息室', '100003011012', null, '1', '1', '', 'bbdafac8-e287-4626-a6e1-d89320a5bbbf');
INSERT INTO `ts_uidp_org` VALUES ('c2519f60-70f6-4fd6-815f-e190f4b06b13', '100003011012004', '大港油田公司所属单位滩海开发公司滩海工艺研究所生产综合室', '生产综合室', '100003011012', null, '1', '1', '', 'bbdafac8-e287-4626-a6e1-d89320a5bbbf');
INSERT INTO `ts_uidp_org` VALUES ('6f206b3b-e49d-4a1b-a2e4-ff9404fc5eb4', '100003011012005', '大港油田公司所属单位滩海开发公司滩海工艺研究所采油工艺室', '采油工艺室', '100003011012', null, '1', '1', '', 'bbdafac8-e287-4626-a6e1-d89320a5bbbf');
INSERT INTO `ts_uidp_org` VALUES ('ccbd0087-5b21-4c92-83a5-d73286a2a212', '100003011012006', '大港油田公司所属单位滩海开发公司滩海工艺研究所注水工艺室', '注水工艺室', '100003011012', null, '1', '1', '', 'bbdafac8-e287-4626-a6e1-d89320a5bbbf');
INSERT INTO `ts_uidp_org` VALUES ('ebdbbb44-663a-429e-a1f8-74826046c692', '100003011013', '大港油田公司所属单位滩海开发公司海工地面建设部', '海工地面建设部', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('3056beda-8504-4edc-bfdf-13b25f77d290', '100003011014', '大港油田公司所属单位滩海开发公司滩海产能建设部', '滩海产能建设部', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('465d934a-9ee9-4373-ade3-10ae4a762842', '100003011014001', '大港油田公司所属单位滩海开发公司滩海产能建设部领导', '领导', '100003011014', null, '1', '1', '', '3056beda-8504-4edc-bfdf-13b25f77d290');
INSERT INTO `ts_uidp_org` VALUES ('74c8321a-abc9-4772-b11a-6ce38573bd69', '100003011014002', '大港油田公司所属单位滩海开发公司滩海产能建设部方案设计室', '方案设计室', '100003011014', null, '1', '1', '', '3056beda-8504-4edc-bfdf-13b25f77d290');
INSERT INTO `ts_uidp_org` VALUES ('82db99fb-4b8d-4f24-84a9-d7ce913ae1c5', '100003011014003', '大港油田公司所属单位滩海开发公司滩海产能建设部生产监督室', '生产监督室', '100003011014', null, '1', '1', '', '3056beda-8504-4edc-bfdf-13b25f77d290');
INSERT INTO `ts_uidp_org` VALUES ('a169b99b-a99b-453c-8810-5c888560f48f', '100003011014004', '大港油田公司所属单位滩海开发公司滩海产能建设部井控室', '井控室', '100003011014', null, '1', '1', '', '3056beda-8504-4edc-bfdf-13b25f77d290');
INSERT INTO `ts_uidp_org` VALUES ('705ecc60-6050-4307-a57d-1646d24c0ff6', '100003011014005', '大港油田公司所属单位滩海开发公司滩海产能建设部综合室', '综合室', '100003011014', null, '1', '1', '', '3056beda-8504-4edc-bfdf-13b25f77d290');
INSERT INTO `ts_uidp_org` VALUES ('ef9081cf-3f69-4804-ac1d-3a4deb060bfc', '100003011014006', '大港油田公司所属单位滩海开发公司滩海产能建设部工程技术室', '工程技术室', '100003011014', null, '1', '1', '', '3056beda-8504-4edc-bfdf-13b25f77d290');
INSERT INTO `ts_uidp_org` VALUES ('558ffa79-edf8-4f5d-a014-d3e824488939', '100003011015', '大港油田公司所属单位滩海开发公司土地海域管理部', '土地海域管理部', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('1d80891a-ddc6-481e-88bd-265883adb6dd', '100003011016', '大港油田公司所属单位滩海开发公司滩海企业管理科', '滩海企业管理科', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('7709bebb-86de-4fbd-bfef-4d1977ca311a', '100003011017', '大港油田公司所属单位滩海开发公司滩海物资装备部', '滩海物资装备部', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('6e55c9dc-0f5f-4a09-933b-9b9f9b50d28a', '100003011018', '大港油田公司所属单位滩海开发公司滩海综合保障部', '滩海综合保障部', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('fdbc3dc8-3b6c-4ad5-854d-9ff81a144d32', '100003011019', '大港油田公司所属单位滩海开发公司HSE监督工作站', 'HSE监督工作站', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('0de72c88-4c59-462a-8c37-b863cc16ba74', '100003011020', '大港油田公司所属单位滩海开发公司滩海保卫科（管道巡护应急管理中心）', '滩海保卫科（管道巡护应急管理中心）', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('ff139ad5-5295-44d1-8ac8-fb276699b13f', '100003011021', '大港油田公司所属单位滩海开发公司埕海第一采油作业区', '埕海第一采油作业区', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('d1c54a93-7ac8-4468-bbf1-525f711efade', '100003011022', '大港油田公司所属单位滩海开发公司埕海第二采油作业区', '埕海第二采油作业区', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('8d4693aa-13f9-4ab2-a154-5fd7e4a6d0b0', '100003011023', '大港油田公司所属单位滩海开发公司滩海集输作业区', '滩海集输作业区', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('d3f1810c-0afc-41b6-8fc8-2c7f60567bf5', '100003011024', '大港油田公司所属单位滩海开发公司滩海档案系统项目组', '滩海档案系统项目组', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('b10ee04f-d8e4-4d4a-9dcc-d98ad67e0d0a', '100003011025', '大港油田公司所属单位滩海开发公司滩海现场联络组', '滩海现场联络组', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('46556f4d-ca75-4661-9fe9-acccbec51150', '100003011026', '大港油田公司所属单位滩海开发公司滩海项目支撑组', '滩海项目支撑组', '100003011', null, '1', '1', '', '3e3215b0-ff6a-4d00-ba48-22ca7f87ebcf');
INSERT INTO `ts_uidp_org` VALUES ('f4c6b390-c1c4-40da-aa0c-e913cf45fda1', '100003012', '大港油田公司所属单位对外合作项目部（赵东作业分公司）', '对外合作项目部（赵东作业分公司）', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('8af73dea-6f1e-4f13-a7d1-8c522e36c109', '100003012001', '大港油田公司所属单位对外合作项目部（赵东作业分公司）项目部领导', '项目部领导', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('41040cd3-70e8-495f-90bd-d0c9ba1392be', '100003012002', '大港油田公司所属单位对外合作项目部（赵东作业分公司）助理（副总师）', '助理（副总师）', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('51b34a1b-7c28-489c-a675-3e4807c6568e', '100003012003', '大港油田公司所属单位对外合作项目部（赵东作业分公司）专家组', '专家组', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('28bbcf9e-952b-4a04-8b30-c4228e06a9c1', '100003012004', '大港油田公司所属单位对外合作项目部（赵东作业分公司）经理办公室', '经理办公室', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('6c25fec0-3241-4c08-b332-6cdb9515c1ef', '100003012004001', '大港油田公司所属单位对外合作项目部（赵东作业分公司）经理办公室车队', '车队', '100003012004', null, '1', '1', '', '28bbcf9e-952b-4a04-8b30-c4228e06a9c1');
INSERT INTO `ts_uidp_org` VALUES ('7227b1a9-251e-4cf3-ac9b-9220f6cdb6fe', '100003012005', '大港油田公司所属单位对外合作项目部（赵东作业分公司）党群工作部', '党群工作部', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('45444903-1ff2-4562-8399-060754ccf731', '100003012006', '大港油田公司所属单位对外合作项目部（赵东作业分公司）人事劳资科', '人事劳资科', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('e9608349-d8e2-4ff2-9508-ddb0169a6ad1', '100003012007', '大港油田公司所属单位对外合作项目部（赵东作业分公司）财务资产科', '财务资产科', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('b9262050-7bda-4dd8-9baa-f213ec047d11', '100003012008', '大港油田公司所属单位对外合作项目部（赵东作业分公司）规划计划科', '规划计划科', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('d0942bb4-6cd0-4a09-8334-f5d0dfe9a980', '100003012009', '大港油田公司所属单位对外合作项目部（赵东作业分公司）企管法规科', '企管法规科', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('b6de4918-a90a-4468-b63c-ccfb22a9c4bc', '100003012010', '大港油田公司所属单位对外合作项目部（赵东作业分公司）生产运行科', '生产运行科', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('c4d169b3-a818-42d9-91d8-7cbf0ef0426a', '100003012011', '大港油田公司所属单位对外合作项目部（赵东作业分公司）安全环保科', '安全环保科', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('b936dd36-1865-4731-985f-8bb7afabc1ba', '100003012012', '大港油田公司所属单位对外合作项目部（赵东作业分公司）地质方案室', '地质方案室', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('a4afe46b-b938-4570-ac9b-e3aabb9235c9', '100003012013', '大港油田公司所属单位对外合作项目部（赵东作业分公司）油藏动态室', '油藏动态室', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('4b7f3dfe-a60a-47fe-9636-f732a8f51c1f', '100003012014', '大港油田公司所属单位对外合作项目部（赵东作业分公司）钻采工程室', '钻采工程室', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('c128c80f-9a19-4eaf-bc10-2a9f7b141db0', '100003012015', '大港油田公司所属单位对外合作项目部（赵东作业分公司）地面工程室', '地面工程室', '100003012', null, '1', '1', '', 'f4c6b390-c1c4-40da-aa0c-e913cf45fda1');
INSERT INTO `ts_uidp_org` VALUES ('3de797cf-8936-4052-95a3-fbeedaec04e1', '100003013', '大港油田公司所属单位原油运销公司', '原油运销公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('b1fd11dd-acad-46ad-96d0-a212f0771834', '100003013001', '大港油田公司所属单位原油运销公司公司领导', '公司领导', '100003013', null, '1', '1', '', '3de797cf-8936-4052-95a3-fbeedaec04e1');
INSERT INTO `ts_uidp_org` VALUES ('1eb7abfb-4836-4409-be43-fa9c643c7041', '100003013001001', '大港油田公司所属单位原油运销公司公司领导老领导', '老领导', '100003013001', null, '1', '1', '', 'b1fd11dd-acad-46ad-96d0-a212f0771834');
INSERT INTO `ts_uidp_org` VALUES ('ff4def46-4cda-4bfc-b69b-780322d285d6', '100003013002', '大港油田公司所属单位原油运销公司机关科室', '机关科室', '100003013', null, '1', '1', '', '3de797cf-8936-4052-95a3-fbeedaec04e1');
INSERT INTO `ts_uidp_org` VALUES ('4247383a-98f7-46ec-88fd-1b673e482cf6', '100003013002001', '大港油田公司所属单位原油运销公司机关科室综合办公室', '综合办公室', '100003013002', null, '1', '1', '', 'ff4def46-4cda-4bfc-b69b-780322d285d6');
INSERT INTO `ts_uidp_org` VALUES ('2e94b515-f080-4b91-a0a5-3da789274626', '100003013002002', '大港油田公司所属单位原油运销公司机关科室生产运行科', '生产运行科', '100003013002', null, '1', '1', '', 'ff4def46-4cda-4bfc-b69b-780322d285d6');
INSERT INTO `ts_uidp_org` VALUES ('6b796675-a139-450b-92dc-7102043313e0', '100003013002002001', '大港油田公司所属单位原油运销公司机关科室生产运行科公司调度中心', '公司调度中心', '100003013002002', null, '1', '1', '', '2e94b515-f080-4b91-a0a5-3da789274626');
INSERT INTO `ts_uidp_org` VALUES ('665641f1-004b-4baa-8296-e59707ac7ee0', '100003013002003', '大港油田公司所属单位原油运销公司机关科室规划计划科', '规划计划科', '100003013002', null, '1', '1', '', 'ff4def46-4cda-4bfc-b69b-780322d285d6');
INSERT INTO `ts_uidp_org` VALUES ('0072fa4a-9ac6-4ef1-82f4-a4e2b9dfdf89', '100003013002004', '大港油田公司所属单位原油运销公司机关科室财务资产科', '财务资产科', '100003013002', null, '1', '1', '', 'ff4def46-4cda-4bfc-b69b-780322d285d6');
INSERT INTO `ts_uidp_org` VALUES ('cc7ce900-3bc8-40b4-bb4b-a6928cad040e', '100003013002005', '大港油田公司所属单位原油运销公司机关科室人事劳资科', '人事劳资科', '100003013002', null, '1', '1', '', 'ff4def46-4cda-4bfc-b69b-780322d285d6');
INSERT INTO `ts_uidp_org` VALUES ('b19acfb1-27dc-4322-a561-710b55b96481', '100003013002006', '大港油田公司所属单位原油运销公司机关科室安全环保科', '安全环保科', '100003013002', null, '1', '1', '', 'ff4def46-4cda-4bfc-b69b-780322d285d6');
INSERT INTO `ts_uidp_org` VALUES ('260f62b5-9418-4310-8f38-9c0a974ae0d5', '100003013002007', '大港油田公司所属单位原油运销公司机关科室企业管理科', '企业管理科', '100003013002', null, '1', '1', '', 'ff4def46-4cda-4bfc-b69b-780322d285d6');
INSERT INTO `ts_uidp_org` VALUES ('445be7b7-a4e0-4c37-a753-1a145b6d039c', '100003013003', '大港油田公司所属单位原油运销公司直属单位', '直属单位', '100003013', null, '1', '1', '', '3de797cf-8936-4052-95a3-fbeedaec04e1');
INSERT INTO `ts_uidp_org` VALUES ('630bab0d-8c9d-49fb-a2fe-e8ef6369b462', '100003013003001', '大港油田公司所属单位原油运销公司直属单位油品销售中心', '油品销售中心', '100003013003', null, '1', '1', '', '445be7b7-a4e0-4c37-a753-1a145b6d039c');
INSERT INTO `ts_uidp_org` VALUES ('634cf5f0-509d-4982-94d7-2efe2b5c9b5a', '100003013003002', '大港油田公司所属单位原油运销公司直属单位工艺研究所', '工艺研究所', '100003013003', null, '1', '1', '', '445be7b7-a4e0-4c37-a753-1a145b6d039c');
INSERT INTO `ts_uidp_org` VALUES ('43a86d83-4fd3-4cb7-8362-493848752303', '100003013003002001', '大港油田公司所属单位原油运销公司直属单位工艺研究所所领导', '所领导', '100003013003002', null, '1', '1', '', '634cf5f0-509d-4982-94d7-2efe2b5c9b5a');
INSERT INTO `ts_uidp_org` VALUES ('4422eae9-54da-41b6-98b5-8baa7a3e1808', '100003013003002002', '大港油田公司所属单位原油运销公司直属单位工艺研究所技术专家', '技术专家', '100003013003002', null, '1', '1', '', '634cf5f0-509d-4982-94d7-2efe2b5c9b5a');
INSERT INTO `ts_uidp_org` VALUES ('ee3f5370-b686-4f3e-9fe6-9e0b9f2a6d96', '100003013003002003', '大港油田公司所属单位原油运销公司直属单位工艺研究所集输工艺研究室', '集输工艺研究室', '100003013003002', null, '1', '1', '', '634cf5f0-509d-4982-94d7-2efe2b5c9b5a');
INSERT INTO `ts_uidp_org` VALUES ('88d53565-a88c-45a1-84b6-e48adf5d4da8', '100003013003002004', '大港油田公司所属单位原油运销公司直属单位工艺研究所固废物处理研究室', '固废物处理研究室', '100003013003002', null, '1', '1', '', '634cf5f0-509d-4982-94d7-2efe2b5c9b5a');
INSERT INTO `ts_uidp_org` VALUES ('b29e8c59-9484-4d74-b2bd-7b186addbf36', '100003013003002005', '大港油田公司所属单位原油运销公司直属单位工艺研究所计量化验管理室', '计量化验管理室', '100003013003002', null, '1', '1', '', '634cf5f0-509d-4982-94d7-2efe2b5c9b5a');
INSERT INTO `ts_uidp_org` VALUES ('0cbe7f53-d782-4347-9381-a63b0b8db347', '100003013003002006', '大港油田公司所属单位原油运销公司直属单位工艺研究所自动化仪表检定管理室', '自动化仪表检定管理室', '100003013003002', null, '1', '1', '', '634cf5f0-509d-4982-94d7-2efe2b5c9b5a');
INSERT INTO `ts_uidp_org` VALUES ('1f5ad9ba-7ae0-47df-b8ff-07d912f2d9db', '100003013003002007', '大港油田公司所属单位原油运销公司直属单位工艺研究所综合管理室', '综合管理室', '100003013003002', null, '1', '1', '', '634cf5f0-509d-4982-94d7-2efe2b5c9b5a');
INSERT INTO `ts_uidp_org` VALUES ('b20b2142-9955-4073-ad2b-28564b1f3c88', '100003013003003', '大港油田公司所属单位原油运销公司直属单位物资装备管理站', '物资装备管理站', '100003013003', null, '1', '1', '', '445be7b7-a4e0-4c37-a753-1a145b6d039c');
INSERT INTO `ts_uidp_org` VALUES ('9733f7ff-d94b-44b8-87a6-944a742554a8', '100003013003004', '大港油田公司所属单位原油运销公司直属单位信息档案室', '信息档案室', '100003013003', null, '1', '1', '', '445be7b7-a4e0-4c37-a753-1a145b6d039c');
INSERT INTO `ts_uidp_org` VALUES ('742f951b-2c6f-4984-aaa0-ed67b738d25c', '100003013003005', '大港油田公司所属单位原油运销公司直属单位基建管理站', '基建管理站', '100003013003', null, '1', '1', '', '445be7b7-a4e0-4c37-a753-1a145b6d039c');
INSERT INTO `ts_uidp_org` VALUES ('75307a24-5846-49ee-a136-89a2aa9b33c8', '100003013003006', '大港油田公司所属单位原油运销公司直属单位HSE监督评价站', 'HSE监督评价站', '100003013003', null, '1', '1', '', '445be7b7-a4e0-4c37-a753-1a145b6d039c');
INSERT INTO `ts_uidp_org` VALUES ('eb655529-2dae-41c6-ae99-d41aa31eeaf6', '100003013004', '大港油田公司所属单位原油运销公司基层单位', '基层单位', '100003013', null, '1', '1', '', '3de797cf-8936-4052-95a3-fbeedaec04e1');
INSERT INTO `ts_uidp_org` VALUES ('86283e66-9d76-4660-b54d-c2e24ca04590', '100003013004001', '大港油田公司所属单位原油运销公司基层单位滨海储运库', '滨海储运库', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('4ec5630d-8467-4f09-a90d-70a69dd0b47a', '100003013004002', '大港油田公司所属单位原油运销公司基层单位油泥砂净化处理厂', '油泥砂净化处理厂', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('eef6b447-4d1c-48dc-a80d-ae3b609a3d87', '100003013004003', '大港油田公司所属单位原油运销公司基层单位废弃泥浆处理厂', '废弃泥浆处理厂', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('6ce48004-8859-4893-9ba3-5737f936cc8f', '100003013004004', '大港油田公司所属单位原油运销公司基层单位滨海原油拉运站', '滨海原油拉运站', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('050ceb7a-4c75-4610-ade8-e8764a53b270', '100003013004005', '大港油田公司所属单位原油运销公司基层单位港东储运库', '港东储运库', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('8ade21f1-798d-47d8-8d53-c958bf95019e', '100003013004006', '大港油田公司所属单位原油运销公司基层单位外输储运库', '外输储运库', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('977b6fd6-bbbe-48c4-84cc-e13096fbc5dc', '100003013004007', '大港油田公司所属单位原油运销公司基层单位经警队', '经警队', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('d563fb94-dd51-42bf-8741-af98dd559e5c', '100003013004008', '大港油田公司所属单位原油运销公司基层单位计量队', '计量队', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('b4c09b5d-c16d-4c8f-91c9-ceb4dc2cb515', '100003013004009', '大港油田公司所属单位原油运销公司基层单位综合服务队', '综合服务队', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('a93b5b2d-b2e8-4da1-8fbb-6bfbd5ee146e', '100003013004009001', '大港油田公司所属单位原油运销公司基层单位综合服务队尼日尔技服人员', '尼日尔技服人员', '100003013004009', null, '1', '1', '', 'b4c09b5d-c16d-4c8f-91c9-ceb4dc2cb515');
INSERT INTO `ts_uidp_org` VALUES ('40d34bbb-f4c5-4369-a898-d9cc779c90cf', '100003013004010', '大港油田公司所属单位原油运销公司基层单位综合车队', '综合车队', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('0e46a54a-cbf1-4c90-8e83-781b552256f7', '100003013004011', '大港油田公司所属单位原油运销公司基层单位煤层气（技术服务）项目部', '煤层气（技术服务）项目部', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('ff0f8648-7ff3-44aa-a8a8-ae6a340bbe86', '100003013004011001', '大港油田公司所属单位原油运销公司基层单位煤层气（技术服务）项目部韩城煤层气（技术服务）项目部', '韩城煤层气（技术服务）项目部', '100003013004011', null, '1', '1', '', '0e46a54a-cbf1-4c90-8e83-781b552256f7');
INSERT INTO `ts_uidp_org` VALUES ('7c3dd2de-cae3-4038-a40e-7e50254da798', '100003013004011002', '大港油田公司所属单位原油运销公司基层单位煤层气（技术服务）项目部忻州煤层气（技术服务）项目部', '忻州煤层气（技术服务）项目部', '100003013004011', null, '1', '1', '', '0e46a54a-cbf1-4c90-8e83-781b552256f7');
INSERT INTO `ts_uidp_org` VALUES ('08275e6c-4538-4170-9ca0-a9357332ac17', '100003013004012', '大港油田公司所属单位原油运销公司基层单位多种经营管理部', '多种经营管理部', '100003013004', null, '1', '1', '', 'eb655529-2dae-41c6-ae99-d41aa31eeaf6');
INSERT INTO `ts_uidp_org` VALUES ('ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9', '100003014', '大港油田公司所属单位天然气公司', '天然气公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('88332c1f-caee-40b2-bab8-4d9849de5f24', '100003014001', '大港油田公司所属单位天然气公司公司领导', '公司领导', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('1df2bf61-6ffc-4849-b012-c0cf6e71cf83', '100003014002', '大港油田公司所属单位天然气公司综合办公室', '综合办公室', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('efe5aaad-b9c9-4de4-9f2f-c8198e98bd27', '100003014003', '大港油田公司所属单位天然气公司党群工作科', '党群工作科', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('d50fd258-52b2-41cd-896f-54fed241790b', '100003014004', '大港油田公司所属单位天然气公司规划计划科', '规划计划科', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('11e295d9-5d7f-4503-b3cf-2f94d6ed50cd', '100003014005', '大港油田公司所属单位天然气公司人事劳资科', '人事劳资科', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('6d7d1d7c-f9d0-4821-9504-9ff1c96606f9', '100003014006', '大港油田公司所属单位天然气公司财务资产科', '财务资产科', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('f7f40a35-c080-43df-bafc-d9333f51609e', '100003014007', '大港油田公司所属单位天然气公司市场开发管理科', '市场开发管理科', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('198fbf38-d4c1-4ffa-b8b8-fb712baa9feb', '100003014008', '大港油田公司所属单位天然气公司质量安全环保科(体系办、企管科)', '质量安全环保科(体系办、企管科)', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('21f7faff-4891-4e78-808a-5cbf00156dfa', '100003014009', '大港油田公司所属单位天然气公司生产运行科', '生产运行科', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('35f1f1e4-6287-4445-be41-b060aa613e3c', '100003014010', '大港油田公司所属单位天然气公司工艺研究所（基建管理办公室）', '工艺研究所（基建管理办公室）', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('fdff9060-432f-4250-9ac0-07479cd08ad1', '100003014011', '大港油田公司所属单位天然气公司物资装备管理站', '物资装备管理站', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('551763a0-0984-40f7-95a5-1c9cece79214', '100003014012', '大港油田公司所属单位天然气公司信息档案室', '信息档案室', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('8049e91a-20aa-45f7-899b-ac3198c7ae0f', '100003014013', '大港油田公司所属单位天然气公司HSE监督工作站', 'HSE监督工作站', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('aa83cbde-b96b-47c4-9573-7609b4d99f30', '100003014014', '大港油田公司所属单位天然气公司燃气项目管理部', '燃气项目管理部', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('9985ba2e-1c1b-4b66-80c1-fb778cb8e5db', '100003014015', '大港油田公司所属单位天然气公司天然气处理站', '天然气处理站', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('f5d0e450-cf46-419a-8167-400e2c647123', '100003014015001', '大港油田公司所属单位天然气公司天然气处理站运行班', '运行班', '100003014015', null, '1', '1', '', '9985ba2e-1c1b-4b66-80c1-fb778cb8e5db');
INSERT INTO `ts_uidp_org` VALUES ('21fc3508-a4f3-455e-aab3-0ff64f8ed205', '100003014015002', '大港油田公司所属单位天然气公司天然气处理站维修保运班', '维修保运班', '100003014015', null, '1', '1', '', '9985ba2e-1c1b-4b66-80c1-fb778cb8e5db');
INSERT INTO `ts_uidp_org` VALUES ('022055a1-6356-4e6e-89c0-aa8e68c2cd75', '100003014015003', '大港油田公司所属单位天然气公司天然气处理站现场管理班', '现场管理班', '100003014015', null, '1', '1', '', '9985ba2e-1c1b-4b66-80c1-fb778cb8e5db');
INSERT INTO `ts_uidp_org` VALUES ('e6094780-f4c8-4ea0-b786-1e769c066d1c', '100003014015004', '大港油田公司所属单位天然气公司天然气处理站LNG项目部', 'LNG项目部', '100003014015', null, '1', '1', '', '9985ba2e-1c1b-4b66-80c1-fb778cb8e5db');
INSERT INTO `ts_uidp_org` VALUES ('a925205f-e545-4b63-9c01-d2381f6b7e05', '100003014016', '大港油田公司所属单位天然气公司天然气调配计量中心', '天然气调配计量中心', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('05f65f45-7de8-4768-abc6-83efe124f404', '100003014017', '大港油田公司所属单位天然气公司CNG管理站', 'CNG管理站', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('6ce9a0ef-49f0-4ecf-ae6b-de5318034593', '100003014018', '大港油田公司所属单位天然气公司管道巡护应急抢修中心', '管道巡护应急抢修中心', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('f269b981-e0d6-429a-b9dd-db4a345ff082', '100003014018001', '大港油田公司所属单位天然气公司管道巡护应急抢修中心天津合作项目部', '天津合作项目部', '100003014018', null, '1', '1', '', '6ce9a0ef-49f0-4ecf-ae6b-de5318034593');
INSERT INTO `ts_uidp_org` VALUES ('6b5baaf3-d52f-45da-857e-e49b015142f5', '100003014018002', '大港油田公司所属单位天然气公司管道巡护应急抢修中心沧州合作项目部', '沧州合作项目部', '100003014018', null, '1', '1', '', '6ce9a0ef-49f0-4ecf-ae6b-de5318034593');
INSERT INTO `ts_uidp_org` VALUES ('24005e5d-275f-4c0f-9cfe-0532bc3431e9', '100003014019', '大港油田公司所属单位天然气公司天然气零散气回收中心', '天然气零散气回收中心', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('275c6199-6b35-42cc-8164-bf2a66995f73', '100003014020', '大港油田公司所属单位天然气公司储气库项目部', '储气库项目部', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('83cf097b-1311-4a4a-b213-b3bbd6d1588e', '100003014021', '大港油田公司所属单位天然气公司综合服务队', '综合服务队', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('6c0ef7fa-0854-4f2e-9718-3e51182d2f02', '100003014022', '大港油田公司所属单位天然气公司天通燃气有限公司', '天通燃气有限公司', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('c747d6d1-fe02-428d-bf21-34d75b8a45aa', '100003014023', '大港油田公司所属单位天然气公司第一燃气服务公司', '第一燃气服务公司', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('3da1b4fb-dc12-4a4d-b25e-1599e70820a0', '100003014024', '大港油田公司所属单位天然气公司第二燃气服务公司', '第二燃气服务公司', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('1323b62d-5c94-44ed-8820-86fcce3a8c9d', '100003014025', '大港油田公司所属单位天然气公司第二燃气液化气服务公司', '第二燃气液化气服务公司', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('8053525f-bf10-4b9c-9f55-b3f57594d2f8', '100003014026', '大港油田公司所属单位天然气公司第三燃气服务公司', '第三燃气服务公司', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('dac06fdb-44e9-46cf-b5fb-7a14c4c8a6cc', '100003014027', '大港油田公司所属单位天然气公司第三燃气液化气服务公司', '第三燃气液化气服务公司', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('5c366bf9-38b0-4059-aa5c-d3c639ecb98d', '100003014028', '大港油田公司所属单位天然气公司第四燃气服务公司', '第四燃气服务公司', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('8ef9917f-6b64-43a5-8077-a73726192675', '100003014029', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司', '天津大港油田滨海新能油气有限公司', '100003014', null, '1', '1', '', 'ec5b16dc-dbc6-4213-9ac3-cf4a5808d3c9');
INSERT INTO `ts_uidp_org` VALUES ('84ee5429-eea7-4535-bdb8-e56ac38d57ac', '100003014029001', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司公司领导', '公司领导', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('5c124172-6f0a-4737-9bda-b39845f51098', '100003014029002', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司综合管理部', '综合管理部', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('c0cde0e7-b6e4-4031-9828-014122e2ea56', '100003014029003', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司计划财务部', '计划财务部', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('59702a64-fd22-416d-88e7-59479d6fa5a5', '100003014029004', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司安全管理部', '安全管理部', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('878e212f-8bd6-4d6b-8da6-92be8652ad58', '100003014029005', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司市场管理部', '市场管理部', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('420c7206-e921-4ad4-9609-dae3d6666350', '100003014029006', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司生产管理部', '生产管理部', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('c75ec3c3-0b15-4bef-9631-9388fa3ff61e', '100003014029007', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司燃气分公司', '燃气分公司', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('1de8100f-e620-44f7-ab94-34933f83801d', '100003014029008', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司司机班', '司机班', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('59414c76-481e-421f-bcb3-1a4b9fa34b33', '100003014029009', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司滨海分公司', '滨海分公司', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('cf05f89e-8be8-471b-96c9-3df56bbf2893', '100003014029010', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司静海分公司', '静海分公司', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('84115fee-ef91-4b46-9cfe-52aacc924e58', '100003014029011', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司蓟县分公司', '蓟县分公司', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('a0c0bafd-12f4-4dd7-9153-2592a42d3d6e', '100003014029012', '大港油田公司所属单位天然气公司天津大港油田滨海新能油气有限公司津南燃气项目部', '津南燃气项目部', '100003014029', null, '1', '1', '', '8ef9917f-6b64-43a5-8077-a73726192675');
INSERT INTO `ts_uidp_org` VALUES ('d42ca977-e614-4bdb-af74-0cefa592dc81', '100003015', '大港油田公司所属单位测试公司', '测试公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('70a23ed8-b2c8-4e66-942b-3eb712a3b337', '100003015001', '大港油田公司所属单位测试公司测试公司领导', '测试公司领导', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('e034df2d-72f8-4bea-9f19-3bca6263c531', '100003015002', '大港油田公司所属单位测试公司测试公司助理', '测试公司助理', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('342e136c-e201-4bc1-b428-2ee79623b9ee', '100003015003', '大港油田公司所属单位测试公司测试公司机关', '测试公司机关', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('def72328-fa51-4110-b031-53910d845b0c', '100003015003001', '大港油田公司所属单位测试公司测试公司机关测试公司经理办公室', '测试公司经理办公室', '100003015003', null, '1', '1', '', '342e136c-e201-4bc1-b428-2ee79623b9ee');
INSERT INTO `ts_uidp_org` VALUES ('e81909d7-52ad-4c27-bf17-4ddd2a231d62', '100003015003002', '大港油田公司所属单位测试公司测试公司机关测试公司党群工作办公室', '测试公司党群工作办公室', '100003015003', null, '1', '1', '', '342e136c-e201-4bc1-b428-2ee79623b9ee');
INSERT INTO `ts_uidp_org` VALUES ('d56ea762-d830-4c9e-bd60-448524b9eef2', '100003015003003', '大港油田公司所属单位测试公司测试公司机关测试公司生产科', '测试公司生产科', '100003015003', null, '1', '1', '', '342e136c-e201-4bc1-b428-2ee79623b9ee');
INSERT INTO `ts_uidp_org` VALUES ('29287490-0f91-4184-879f-3705f581b154', '100003015003004', '大港油田公司所属单位测试公司测试公司机关质量安全环保科', '质量安全环保科', '100003015003', null, '1', '1', '', '342e136c-e201-4bc1-b428-2ee79623b9ee');
INSERT INTO `ts_uidp_org` VALUES ('7c8858ab-65d8-4418-be0e-828f589ec185', '100003015003004001', '大港油田公司所属单位测试公司测试公司机关质量安全环保科测试公司监督站', '测试公司监督站', '100003015003004', null, '1', '1', '', '29287490-0f91-4184-879f-3705f581b154');
INSERT INTO `ts_uidp_org` VALUES ('a07dd731-4c86-401d-b555-89b0ef00f537', '100003015003005', '大港油田公司所属单位测试公司测试公司机关测试公司人事科', '测试公司人事科', '100003015003', null, '1', '1', '', '342e136c-e201-4bc1-b428-2ee79623b9ee');
INSERT INTO `ts_uidp_org` VALUES ('6b387ed2-66e1-4a78-a4a5-36cda2ba4ed4', '100003015003006', '大港油田公司所属单位测试公司测试公司机关测试公司财务科', '测试公司财务科', '100003015003', null, '1', '1', '', '342e136c-e201-4bc1-b428-2ee79623b9ee');
INSERT INTO `ts_uidp_org` VALUES ('98e8048a-57c8-4bb8-8bb4-02a982d7ed33', '100003015003007', '大港油田公司所属单位测试公司测试公司机关测试公司科技信息科', '测试公司科技信息科', '100003015003', null, '1', '1', '', '342e136c-e201-4bc1-b428-2ee79623b9ee');
INSERT INTO `ts_uidp_org` VALUES ('0697dcb9-ce1e-4afb-8517-12d9b8cfe61e', '100003015004', '大港油田公司所属单位测试公司测试一分公司', '测试一分公司', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('3fb37555-4de6-483f-9b55-138cec4f0dbc', '100003015005', '大港油田公司所属单位测试公司测试二分公司', '测试二分公司', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('f9a6c369-4f6d-42d9-8008-6567be2feb55', '100003015006', '大港油田公司所属单位测试公司测试三分公司', '测试三分公司', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('add83a18-b499-4a1e-917e-f5a73b2e29e3', '100003015007', '大港油田公司所属单位测试公司测试四分公司', '测试四分公司', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('302920fb-6ef5-4120-8ae5-c2b6d25283dc', '100003015008', '大港油田公司所属单位测试公司众诚达', '众诚达', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('9a296ca2-9498-4264-8004-4e3ad5e2d4af', '100003015009', '大港油田公司所属单位测试公司测试公司解释研究所', '测试公司解释研究所', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('f241013b-28db-49c6-a04b-854839b04974', '100003015009001', '大港油田公司所属单位测试公司测试公司解释研究所解释一室', '解释一室', '100003015009', null, '1', '1', '', '9a296ca2-9498-4264-8004-4e3ad5e2d4af');
INSERT INTO `ts_uidp_org` VALUES ('bee18afb-3a28-4178-aa46-dee097dd82b2', '100003015009002', '大港油田公司所属单位测试公司测试公司解释研究所解释二室', '解释二室', '100003015009', null, '1', '1', '', '9a296ca2-9498-4264-8004-4e3ad5e2d4af');
INSERT INTO `ts_uidp_org` VALUES ('8e4032c4-a946-46e8-839a-0ceb9dcfe810', '100003015010', '大港油田公司所属单位测试公司测试公司工艺研究所', '测试公司工艺研究所', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('ee4510b4-98d4-4abc-b9f7-aee3d4ba6e7b', '100003015010001', '大港油田公司所属单位测试公司测试公司工艺研究所工艺室', '工艺室', '100003015010', null, '1', '1', '', '8e4032c4-a946-46e8-839a-0ceb9dcfe810');
INSERT INTO `ts_uidp_org` VALUES ('182f76c9-4f77-44bf-8c3e-f6bedd560f73', '100003015010002', '大港油田公司所属单位测试公司测试公司工艺研究所仪器室', '仪器室', '100003015010', null, '1', '1', '', '8e4032c4-a946-46e8-839a-0ceb9dcfe810');
INSERT INTO `ts_uidp_org` VALUES ('f832b2da-2635-437c-8e47-6935016d66c3', '100003015010003', '大港油田公司所属单位测试公司测试公司工艺研究所综合室', '综合室', '100003015010', null, '1', '1', '', '8e4032c4-a946-46e8-839a-0ceb9dcfe810');
INSERT INTO `ts_uidp_org` VALUES ('1ea034ea-6363-439b-a974-adea07a2f989', '100003015011', '大港油田公司所属单位测试公司测试公司综合服务公司', '测试公司综合服务公司', '100003015', null, '1', '1', '', 'd42ca977-e614-4bdb-af74-0cefa592dc81');
INSERT INTO `ts_uidp_org` VALUES ('1fc1e770-a56e-4943-9e42-ea4dd925643d', '100003016', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）', '检测监督评价中心（HSE监督评价总站）', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('81fbd329-a8a7-4f7e-bd8e-eee19eb0e5ec', '100003016001', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）领导', '领导', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('a5e90f84-638b-4c64-adaa-b39e860172cf', '100003016002', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）老领导', '老领导', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('9af1c290-755d-461a-8702-db8ed1f01318', '100003016003', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）经理办公室', '经理办公室', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('5b8a13f8-2095-42a2-96ee-47ab5de6ad3b', '100003016004', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）党群工作部', '党群工作部', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('455b7786-1a28-4c76-bbf9-3a0c6d5ecfca', '100003016005', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）财务资产科', '财务资产科', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('124339fa-2ead-4c93-bbc4-7afaa539d0d3', '100003016006', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）质量技术科', '质量技术科', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('9dac2fd5-1dd5-4032-8771-4cac67b6dc4e', '100003016007', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）人事劳资科', '人事劳资科', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('8174dbea-add3-405b-892a-7c8015a3cf22', '100003016008', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）生产运行科', '生产运行科', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('9be96792-4e53-41cf-93f5-c8360428ce6b', '100003016009', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）综合服务部', '综合服务部', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('1f3f2305-8cf9-4e01-958b-03b6756a4410', '100003016010', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）安全环保管理中心', '安全环保管理中心', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('23c3f77c-5d17-4bc8-8389-b5db5b50fc99', '100003016011', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）HSE监督评价中心', 'HSE监督评价中心', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('0da34a73-6254-4dab-8f8a-1dd7507efcf7', '100003016011001', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）HSE监督评价中心安全环保巡视组', '安全环保巡视组', '100003016011', null, '1', '1', '', '23c3f77c-5d17-4bc8-8389-b5db5b50fc99');
INSERT INTO `ts_uidp_org` VALUES ('86ccbb79-a555-4881-befe-2a17f3315f95', '100003016012', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）工程监督中心（石油工程监理中心）', '工程监督中心（石油工程监理中心）', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('622c1a3b-ac67-4449-9d88-9d7f6bc9fead', '100003016013', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）环境监测监督中心站', '环境监测监督中心站', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('1a30a521-fa8c-42ac-8306-98f8b673e9fe', '100003016014', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）锅炉压力容器检验所', '锅炉压力容器检验所', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('9423dd09-5cc3-4a01-a049-7ffa700a4c83', '100003016015', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）质量监督站', '质量监督站', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('81847588-aadf-4a53-bfd1-e6eb589e85b7', '100003016016', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）特种设备检测站', '特种设备检测站', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('2cbe9868-4f37-4fe6-b503-7fd945535e41', '100003016017', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）计量能源站', '计量能源站', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('072370ea-7bd5-4ff9-8c6d-b7bf05e6ef93', '100003016018', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）物资（商品）检验所', '物资（商品）检验所', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('e41e61e4-14d7-4b4d-be63-356109b582a9', '100003016019', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）车务管理站', '车务管理站', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('0f700e78-8778-4de8-bada-2d446d6ed212', '100003016020', '大港油田公司所属单位检测监督评价中心（HSE监督评价总站）宇信公司', '宇信公司', '100003016', null, '1', '1', '', '1fc1e770-a56e-4943-9e42-ea4dd925643d');
INSERT INTO `ts_uidp_org` VALUES ('40be342d-9ce0-42d5-9281-7ed89947a48d', '100003017', '大港油田公司所属单位消防支队（保卫处）', '消防支队（保卫处）', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('1ed63d1b-4caa-4ba4-b900-6dee3d7aab9c', '100003017001', '大港油田公司所属单位消防支队（保卫处）支队领导', '支队领导', '100003017', null, '1', '1', '', '40be342d-9ce0-42d5-9281-7ed89947a48d');
INSERT INTO `ts_uidp_org` VALUES ('2b538a7d-3d4b-4fe5-b434-1fda583f1557', '100003017002', '大港油田公司所属单位消防支队（保卫处）支队助理', '支队助理', '100003017', null, '1', '1', '', '40be342d-9ce0-42d5-9281-7ed89947a48d');
INSERT INTO `ts_uidp_org` VALUES ('ce146480-7f00-4d84-81cc-5d5e39a3b321', '100003017003', '大港油田公司所属单位消防支队（保卫处）支队机关', '支队机关', '100003017', null, '1', '1', '', '40be342d-9ce0-42d5-9281-7ed89947a48d');
INSERT INTO `ts_uidp_org` VALUES ('9831f4dd-01e3-4a78-9df3-5ca8ea5a993e', '100003017003001', '大港油田公司所属单位消防支队（保卫处）支队机关综合办公室', '综合办公室', '100003017003', null, '1', '1', '', 'ce146480-7f00-4d84-81cc-5d5e39a3b321');
INSERT INTO `ts_uidp_org` VALUES ('6f04b11a-7118-402b-9a8a-b36392ab23c1', '100003017003002', '大港油田公司所属单位消防支队（保卫处）支队机关党群工作科', '党群工作科', '100003017003', null, '1', '1', '', 'ce146480-7f00-4d84-81cc-5d5e39a3b321');
INSERT INTO `ts_uidp_org` VALUES ('ceb7417c-9521-46bd-89bc-3330321cd6ca', '100003017003003', '大港油田公司所属单位消防支队（保卫处）支队机关战训管理科', '战训管理科', '100003017003', null, '1', '1', '', 'ce146480-7f00-4d84-81cc-5d5e39a3b321');
INSERT INTO `ts_uidp_org` VALUES ('2e339190-1c9f-4c4f-9ed9-07324743e5e2', '100003017003004', '大港油田公司所属单位消防支队（保卫处）支队机关防火安全科', '防火安全科', '100003017003', null, '1', '1', '', 'ce146480-7f00-4d84-81cc-5d5e39a3b321');
INSERT INTO `ts_uidp_org` VALUES ('deb7f923-c2f1-460a-a27c-3b5cbc70bce8', '100003017003005', '大港油田公司所属单位消防支队（保卫处）支队机关人事劳资科', '人事劳资科', '100003017003', null, '1', '1', '', 'ce146480-7f00-4d84-81cc-5d5e39a3b321');
INSERT INTO `ts_uidp_org` VALUES ('35f15bff-bdce-4070-9479-44c31e416f5e', '100003017003006', '大港油田公司所属单位消防支队（保卫处）支队机关财务资产科', '财务资产科', '100003017003', null, '1', '1', '', 'ce146480-7f00-4d84-81cc-5d5e39a3b321');
INSERT INTO `ts_uidp_org` VALUES ('f9f72b4c-20cd-450b-8a67-5d1b28eafda4', '100003017004', '大港油田公司所属单位消防支队（保卫处）支队直属', '支队直属', '100003017', null, '1', '1', '', '40be342d-9ce0-42d5-9281-7ed89947a48d');
INSERT INTO `ts_uidp_org` VALUES ('6f21add8-6fb2-4eee-bbbe-5be9c119863a', '100003017004001', '大港油田公司所属单位消防支队（保卫处）支队直属物资装备管理中心', '物资装备管理中心', '100003017004', null, '1', '1', '', 'f9f72b4c-20cd-450b-8a67-5d1b28eafda4');
INSERT INTO `ts_uidp_org` VALUES ('2e769a3b-a7a7-4d82-8691-417b422a3c6c', '100003017004002', '大港油田公司所属单位消防支队（保卫处）支队直属人民武装办公室', '人民武装办公室', '100003017004', null, '1', '1', '', 'f9f72b4c-20cd-450b-8a67-5d1b28eafda4');
INSERT INTO `ts_uidp_org` VALUES ('5f18cf7b-b62b-44d7-a008-98e887d159f1', '100003017004003', '大港油田公司所属单位消防支队（保卫处）支队直属综合治理办公室（户籍管理办公室）', '综合治理办公室（户籍管理办公室）', '100003017004', null, '1', '1', '', 'f9f72b4c-20cd-450b-8a67-5d1b28eafda4');
INSERT INTO `ts_uidp_org` VALUES ('fff28079-decb-4c06-883a-7e3242e17120', '100003017004004', '大港油田公司所属单位消防支队（保卫处）支队直属治安管理中心', '治安管理中心', '100003017004', null, '1', '1', '', 'f9f72b4c-20cd-450b-8a67-5d1b28eafda4');
INSERT INTO `ts_uidp_org` VALUES ('17e94d36-019f-4d13-8305-ab454c531f4c', '100003017004005', '大港油田公司所属单位消防支队（保卫处）支队直属119指挥中心', '119指挥中心', '100003017004', null, '1', '1', '', 'f9f72b4c-20cd-450b-8a67-5d1b28eafda4');
INSERT INTO `ts_uidp_org` VALUES ('2ec78749-fe06-48e2-aa17-fc8f4565b28c', '100003017004006', '大港油田公司所属单位消防支队（保卫处）支队直属信息档案室', '信息档案室', '100003017004', null, '1', '1', '', 'f9f72b4c-20cd-450b-8a67-5d1b28eafda4');
INSERT INTO `ts_uidp_org` VALUES ('9948433b-d277-4a0d-8b58-7e1944967a86', '100003017005', '大港油田公司所属单位消防支队（保卫处）支队所属', '支队所属', '100003017', null, '1', '1', '', '40be342d-9ce0-42d5-9281-7ed89947a48d');
INSERT INTO `ts_uidp_org` VALUES ('bb3d9170-72c9-4b38-906c-561f4c568d2a', '100003017005001', '大港油田公司所属单位消防支队（保卫处）支队所属消防一中队', '消防一中队', '100003017005', null, '1', '1', '', '9948433b-d277-4a0d-8b58-7e1944967a86');
INSERT INTO `ts_uidp_org` VALUES ('c082d3a0-817a-4992-bcb8-aabc61e02513', '100003017005002', '大港油田公司所属单位消防支队（保卫处）支队所属消防二中队', '消防二中队', '100003017005', null, '1', '1', '', '9948433b-d277-4a0d-8b58-7e1944967a86');
INSERT INTO `ts_uidp_org` VALUES ('ed15b4cd-e05d-4733-8bc1-bd67eb310dc6', '100003017005003', '大港油田公司所属单位消防支队（保卫处）支队所属消防三中队', '消防三中队', '100003017005', null, '1', '1', '', '9948433b-d277-4a0d-8b58-7e1944967a86');
INSERT INTO `ts_uidp_org` VALUES ('9dacd609-91ed-4653-87ed-764b56282cbb', '100003017005004', '大港油田公司所属单位消防支队（保卫处）支队所属消防四中队', '消防四中队', '100003017005', null, '1', '1', '', '9948433b-d277-4a0d-8b58-7e1944967a86');
INSERT INTO `ts_uidp_org` VALUES ('98786e09-b10e-462f-a185-429199c0e277', '100003017005005', '大港油田公司所属单位消防支队（保卫处）支队所属消防五中队', '消防五中队', '100003017005', null, '1', '1', '', '9948433b-d277-4a0d-8b58-7e1944967a86');
INSERT INTO `ts_uidp_org` VALUES ('acecd226-2df3-4c80-8477-37b78990f722', '100003017005006', '大港油田公司所属单位消防支队（保卫处）支队所属消防六中队', '消防六中队', '100003017005', null, '1', '1', '', '9948433b-d277-4a0d-8b58-7e1944967a86');
INSERT INTO `ts_uidp_org` VALUES ('ff41c87e-e39f-4841-9ed0-c6980509df98', '100003017005007', '大港油田公司所属单位消防支队（保卫处）支队所属应急抢险队', '应急抢险队', '100003017005', null, '1', '1', '', '9948433b-d277-4a0d-8b58-7e1944967a86');
INSERT INTO `ts_uidp_org` VALUES ('1dca6e9d-2d2b-4b12-acc2-0b01fea7ff23', '100003017005008', '大港油田公司所属单位消防支队（保卫处）支队所属综合服务队', '综合服务队', '100003017005', null, '1', '1', '', '9948433b-d277-4a0d-8b58-7e1944967a86');
INSERT INTO `ts_uidp_org` VALUES ('1250b65d-fe41-47fc-bda8-2d211311c013', '100003017005009', '大港油田公司所属单位消防支队（保卫处）支队所属小车队', '小车队', '100003017005', null, '1', '1', '', '9948433b-d277-4a0d-8b58-7e1944967a86');
INSERT INTO `ts_uidp_org` VALUES ('9143c197-cbb7-4611-a0d5-40c5a52d95ec', '100003018', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）', '人才开发中心（大港南城区就业服务中心）', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('f20d014a-daa3-4c82-acbd-eaf102e7079f', '100003018001', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）部门领导', '部门领导', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('b02b0551-b459-470e-ac77-078879236fef', '100003018002', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）主任助理', '主任助理', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('e3906958-e61f-481b-84c3-3f3c47587b10', '100003018003', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）综合管理科', '综合管理科', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('31c30246-aa4f-4ab9-a461-0a51adfe486b', '100003018004', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）财务科', '财务科', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('c489de58-4db6-4099-8558-8303f1b3a9e1', '100003018005', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）人才交流科', '人才交流科', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('72c590d7-27f5-4795-83fa-fc3912025b74', '100003018006', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）人才开发科', '人才开发科', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('5e57491c-c4f7-416c-ac6a-c01fcdbec067', '100003018007', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）培训科', '培训科', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('4a7ab356-6840-41ec-8514-d8b64bc840ff', '100003018008', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）人事代理科', '人事代理科', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('3f433e09-1267-477c-8336-0777cc222859', '100003018009', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）题库管理科', '题库管理科', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('2fccdf51-deb9-4b94-96e1-2feec0ff9744', '100003018010', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）考务管理科', '考务管理科', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('8ca0b713-6552-41e2-a13a-e6cc8757af93', '100003018011', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）博士后工作站办公室', '博士后工作站办公室', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('3786df22-9d5e-49c2-a2eb-7943fc32e3a1', '100003018012', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）项目管理科', '项目管理科', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('af46abdc-9651-4de4-bbad-db76cf452da1', '100003018013', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）职业介绍科', '职业介绍科', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('f41df67a-59e0-4ba9-89bc-24844beefc97', '100003018014', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）地方劳动部门', '地方劳动部门', '100003018', null, '1', '1', '', '9143c197-cbb7-4611-a0d5-40c5a52d95ec');
INSERT INTO `ts_uidp_org` VALUES ('7f8a3f8d-b6e6-4e8f-bac9-687a3fba8dba', '100003018014001', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）地方劳动部门部门领导', '部门领导', '100003018014', null, '1', '1', '', 'f41df67a-59e0-4ba9-89bc-24844beefc97');
INSERT INTO `ts_uidp_org` VALUES ('df4a7cdf-0680-4172-a078-9fe7a407488c', '100003018014002', '大港油田公司所属单位人才开发中心（大港南城区就业服务中心）地方劳动部门企业服务部', '企业服务部', '100003018014', null, '1', '1', '', 'f41df67a-59e0-4ba9-89bc-24844beefc97');
INSERT INTO `ts_uidp_org` VALUES ('a32e89d9-d2de-4ac2-b646-4760e8e96ac7', '100003019', '大港油田公司所属单位对外技术服务公司', '对外技术服务公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('27d7b1a6-669f-473e-9495-45a55c407dab', '100003019001', '大港油田公司所属单位对外技术服务公司公司领导', '公司领导', '100003019', null, '1', '1', '', 'a32e89d9-d2de-4ac2-b646-4760e8e96ac7');
INSERT INTO `ts_uidp_org` VALUES ('e74eac5c-7117-4bc1-bd7c-da17b4e031ac', '100003019002', '大港油田公司所属单位对外技术服务公司公司助理', '公司助理', '100003019', null, '1', '1', '', 'a32e89d9-d2de-4ac2-b646-4760e8e96ac7');
INSERT INTO `ts_uidp_org` VALUES ('02213ed7-77eb-45d0-9dd2-8243955a808a', '100003019003', '大港油田公司所属单位对外技术服务公司综合管理部（国际市场项目部）', '综合管理部（国际市场项目部）', '100003019', null, '1', '1', '', 'a32e89d9-d2de-4ac2-b646-4760e8e96ac7');
INSERT INTO `ts_uidp_org` VALUES ('4bac3c89-a146-4ac9-bd8a-bb44424f772f', '100003019004', '大港油田公司所属单位对外技术服务公司财务管理部', '财务管理部', '100003019', null, '1', '1', '', 'a32e89d9-d2de-4ac2-b646-4760e8e96ac7');
INSERT INTO `ts_uidp_org` VALUES ('20fbc6d1-35fb-4bb1-87f9-a2c5eb773ad1', '100003019005', '大港油田公司所属单位对外技术服务公司人事劳资部', '人事劳资部', '100003019', null, '1', '1', '', 'a32e89d9-d2de-4ac2-b646-4760e8e96ac7');
INSERT INTO `ts_uidp_org` VALUES ('b43c1cad-2df3-4d58-87f5-c9daf35d58a0', '100003019006', '大港油田公司所属单位对外技术服务公司技术管理部', '技术管理部', '100003019', null, '1', '1', '', 'a32e89d9-d2de-4ac2-b646-4760e8e96ac7');
INSERT INTO `ts_uidp_org` VALUES ('6b61c436-6fe2-40fb-929a-69ba20192434', '100003019006001', '大港油田公司所属单位对外技术服务公司技术管理部对外合作项目研究所', '对外合作项目研究所', '100003019006', null, '1', '1', '', 'b43c1cad-2df3-4d58-87f5-c9daf35d58a0');
INSERT INTO `ts_uidp_org` VALUES ('099b26a6-3cd4-43c7-a894-34d0338c992d', '100003019007', '大港油田公司所属单位对外技术服务公司生产运行部', '生产运行部', '100003019', null, '1', '1', '', 'a32e89d9-d2de-4ac2-b646-4760e8e96ac7');
INSERT INTO `ts_uidp_org` VALUES ('510002e8-f668-4024-b0b0-1af57cd594e2', '100003019008', '大港油田公司所属单位对外技术服务公司国内市场项目部', '国内市场项目部', '100003019', null, '1', '1', '', 'a32e89d9-d2de-4ac2-b646-4760e8e96ac7');
INSERT INTO `ts_uidp_org` VALUES ('a807e7fc-fd10-45aa-b7e8-dbf69ecaa30f', '100003020', '大港油田公司所属单位井下作业公司', '井下作业公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('806a2004-495a-42bb-b92b-0c63ce3083e3', '100003020001', '大港油田公司所属单位井下作业公司公司领导', '公司领导', '100003020', null, '1', '1', '', 'a807e7fc-fd10-45aa-b7e8-dbf69ecaa30f');
INSERT INTO `ts_uidp_org` VALUES ('acef06ad-4801-474a-b99e-ccbc80e4768d', '100003020001001', '大港油田公司所属单位井下作业公司公司领导公司顾问', '公司顾问', '100003020001', null, '1', '1', '', '806a2004-495a-42bb-b92b-0c63ce3083e3');
INSERT INTO `ts_uidp_org` VALUES ('d54a8c81-62cf-4324-9d88-4f1ba86a2372', '100003020002', '大港油田公司所属单位井下作业公司经理助理', '经理助理', '100003020', null, '1', '1', '', 'a807e7fc-fd10-45aa-b7e8-dbf69ecaa30f');
INSERT INTO `ts_uidp_org` VALUES ('50847bd0-d291-4c6c-9486-1a1600aaf762', '100003020003', '大港油田公司所属单位井下作业公司机关科室', '机关科室', '100003020', null, '1', '1', '', 'a807e7fc-fd10-45aa-b7e8-dbf69ecaa30f');
INSERT INTO `ts_uidp_org` VALUES ('a178008a-f924-413d-b125-f929145f6495', '100003020003001', '大港油田公司所属单位井下作业公司机关科室经理办公室', '经理办公室', '100003020003', null, '1', '1', '', '50847bd0-d291-4c6c-9486-1a1600aaf762');
INSERT INTO `ts_uidp_org` VALUES ('715b4209-41ec-4b55-93ca-8d9f137c1833', '100003020003002', '大港油田公司所属单位井下作业公司机关科室党委办公室（党委宣传部）', '党委办公室（党委宣传部）', '100003020003', null, '1', '1', '', '50847bd0-d291-4c6c-9486-1a1600aaf762');
INSERT INTO `ts_uidp_org` VALUES ('98ef2345-1cfe-42c5-a21c-04ba6a0f95dc', '100003020003003', '大港油田公司所属单位井下作业公司机关科室市场生产运行科', '市场生产运行科', '100003020003', null, '1', '1', '', '50847bd0-d291-4c6c-9486-1a1600aaf762');
INSERT INTO `ts_uidp_org` VALUES ('c8d7717c-1d06-43aa-b343-62b16cf804cf', '100003020003004', '大港油田公司所属单位井下作业公司机关科室安全环保科', '安全环保科', '100003020003', null, '1', '1', '', '50847bd0-d291-4c6c-9486-1a1600aaf762');
INSERT INTO `ts_uidp_org` VALUES ('2601733d-9517-48a7-9216-4f77a2a7172b', '100003020003005', '大港油田公司所属单位井下作业公司机关科室人事科（党委组织部）', '人事科（党委组织部）', '100003020003', null, '1', '1', '', '50847bd0-d291-4c6c-9486-1a1600aaf762');
INSERT INTO `ts_uidp_org` VALUES ('e29aa2d2-6715-435d-aa1b-bbe332ee021e', '100003020003006', '大港油田公司所属单位井下作业公司机关科室财务计划科', '财务计划科', '100003020003', null, '1', '1', '', '50847bd0-d291-4c6c-9486-1a1600aaf762');
INSERT INTO `ts_uidp_org` VALUES ('391d4a4e-b209-4d64-8090-a7d8e23e8128', '100003020003007', '大港油田公司所属单位井下作业公司机关科室物资装备科', '物资装备科', '100003020003', null, '1', '1', '', '50847bd0-d291-4c6c-9486-1a1600aaf762');
INSERT INTO `ts_uidp_org` VALUES ('d3560c80-7605-4f5e-85f1-552f97b96bbe', '100003020003008', '大港油田公司所属单位井下作业公司机关科室企管法规科（内控与风险管理科）', '企管法规科（内控与风险管理科）', '100003020003', null, '1', '1', '', '50847bd0-d291-4c6c-9486-1a1600aaf762');
INSERT INTO `ts_uidp_org` VALUES ('f61beced-f501-44ea-b1f2-8e77fb259264', '100003020003009', '大港油田公司所属单位井下作业公司机关科室审计监察科', '审计监察科', '100003020003', null, '1', '1', '', '50847bd0-d291-4c6c-9486-1a1600aaf762');
INSERT INTO `ts_uidp_org` VALUES ('9c3424c5-f9df-4204-9f06-30197cf641b4', '100003020003010', '大港油田公司所属单位井下作业公司机关科室工会办公室（团委）', '工会办公室（团委）', '100003020003', null, '1', '1', '', '50847bd0-d291-4c6c-9486-1a1600aaf762');
INSERT INTO `ts_uidp_org` VALUES ('8275aedd-82c6-4cd3-a92d-c4bbc6a710a2', '100003020004', '大港油田公司所属单位井下作业公司直属单位', '直属单位', '100003020', null, '1', '1', '', 'a807e7fc-fd10-45aa-b7e8-dbf69ecaa30f');
INSERT INTO `ts_uidp_org` VALUES ('81064bce-62f2-43f7-b2d6-edf8e2660212', '100003020004001', '大港油田公司所属单位井下作业公司直属单位技术研究所', '技术研究所', '100003020004', null, '1', '1', '', '8275aedd-82c6-4cd3-a92d-c4bbc6a710a2');
INSERT INTO `ts_uidp_org` VALUES ('78f35282-1114-48a4-8174-b0f4dd02fa18', '100003020004001001', '大港油田公司所属单位井下作业公司直属单位技术研究所领导', '领导', '100003020004001', null, '1', '1', '', '81064bce-62f2-43f7-b2d6-edf8e2660212');
INSERT INTO `ts_uidp_org` VALUES ('d905c05b-4793-44de-9636-9ed7e57cdb40', '100003020004001002', '大港油田公司所属单位井下作业公司直属单位技术研究所复杂作业室', '复杂作业室', '100003020004001', null, '1', '1', '', '81064bce-62f2-43f7-b2d6-edf8e2660212');
INSERT INTO `ts_uidp_org` VALUES ('6b2f8b27-aa03-4711-83a2-1de558aa2b97', '100003020004001003', '大港油田公司所属单位井下作业公司直属单位技术研究所措施作业室', '措施作业室', '100003020004001', null, '1', '1', '', '81064bce-62f2-43f7-b2d6-edf8e2660212');
INSERT INTO `ts_uidp_org` VALUES ('6b614bc7-5c60-46e2-a80f-cae4e67a527b', '100003020004001004', '大港油田公司所属单位井下作业公司直属单位技术研究所综合信息室', '综合信息室', '100003020004001', null, '1', '1', '', '81064bce-62f2-43f7-b2d6-edf8e2660212');
INSERT INTO `ts_uidp_org` VALUES ('c0b8fd12-fd34-4638-9a38-245b9b777a92', '100003020004001005', '大港油田公司所属单位井下作业公司直属单位技术研究所井控管理室', '井控管理室', '100003020004001', null, '1', '1', '', '81064bce-62f2-43f7-b2d6-edf8e2660212');
INSERT INTO `ts_uidp_org` VALUES ('776c2ebc-1b61-4e69-b6f6-b5d94b89e260', '100003020004001006', '大港油田公司所属单位井下作业公司直属单位技术研究所带压作业项目管理部', '带压作业项目管理部', '100003020004001', null, '1', '1', '', '81064bce-62f2-43f7-b2d6-edf8e2660212');
INSERT INTO `ts_uidp_org` VALUES ('78d2ca9d-4855-40cb-b30e-815c6b9a44da', '100003020004002', '大港油田公司所属单位井下作业公司直属单位安全监督站', '安全监督站', '100003020004', null, '1', '1', '', '8275aedd-82c6-4cd3-a92d-c4bbc6a710a2');
INSERT INTO `ts_uidp_org` VALUES ('b3179472-a669-4540-a7bc-230f4388db04', '100003020004003', '大港油田公司所属单位井下作业公司直属单位教育培训中心（井控培训中心）', '教育培训中心（井控培训中心）', '100003020004', null, '1', '1', '', '8275aedd-82c6-4cd3-a92d-c4bbc6a710a2');
INSERT INTO `ts_uidp_org` VALUES ('edc20c95-c9da-432f-8a51-0746cd05d368', '100003020004004', '大港油田公司所属单位井下作业公司直属单位综合服务部', '综合服务部', '100003020004', null, '1', '1', '', '8275aedd-82c6-4cd3-a92d-c4bbc6a710a2');
INSERT INTO `ts_uidp_org` VALUES ('876cbbe5-d0e4-4d3e-8ee0-7d6818d555c6', '100003020004005', '大港油田公司所属单位井下作业公司直属单位信息档案部', '信息档案部', '100003020004', null, '1', '1', '', '8275aedd-82c6-4cd3-a92d-c4bbc6a710a2');
INSERT INTO `ts_uidp_org` VALUES ('4f6acd64-df01-40ee-a7b9-0d202a3d8298', '100003020004006', '大港油田公司所属单位井下作业公司直属单位维护稳定办公室（保卫部）', '维护稳定办公室（保卫部）', '100003020004', null, '1', '1', '', '8275aedd-82c6-4cd3-a92d-c4bbc6a710a2');
INSERT INTO `ts_uidp_org` VALUES ('7426eba9-e137-45e9-926f-f0cc07b691ba', '100003020004007', '大港油田公司所属单位井下作业公司直属单位小车队', '小车队', '100003020004', null, '1', '1', '', '8275aedd-82c6-4cd3-a92d-c4bbc6a710a2');
INSERT INTO `ts_uidp_org` VALUES ('b2c83cac-c9f4-4497-873c-677c4f7150ad', '100003020004008', '大港油田公司所属单位井下作业公司直属单位井控应急中心', '井控应急中心', '100003020004', null, '1', '1', '', '8275aedd-82c6-4cd3-a92d-c4bbc6a710a2');
INSERT INTO `ts_uidp_org` VALUES ('e6c90e8a-54e7-4391-a6ab-ab76929a3799', '100003020005', '大港油田公司所属单位井下作业公司所属单位', '所属单位', '100003020', null, '1', '1', '', 'a807e7fc-fd10-45aa-b7e8-dbf69ecaa30f');
INSERT INTO `ts_uidp_org` VALUES ('1bcb0247-7c54-470a-ae48-4e2142c2eace', '100003020005001', '大港油田公司所属单位井下作业公司所属单位第一修井分公司', '第一修井分公司', '100003020005', null, '1', '1', '', 'e6c90e8a-54e7-4391-a6ab-ab76929a3799');
INSERT INTO `ts_uidp_org` VALUES ('09c3c76e-3b0f-4df0-be59-fae2cda469fb', '100003020005001001', '大港油田公司所属单位井下作业公司所属单位第一修井分公司分公司领导', '分公司领导', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('d2a011fc-8aed-4fa0-a8dc-9ab32781dc7c', '100003020005001002', '大港油田公司所属单位井下作业公司所属单位第一修井分公司综合办公室', '综合办公室', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('54e6c37b-4af8-47fc-909d-359634500699', '100003020005001003', '大港油田公司所属单位井下作业公司所属单位第一修井分公司物资装备办公室', '物资装备办公室', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('19a0e1cb-f493-4827-9cf2-e1e8482c2147', '100003020005001004', '大港油田公司所属单位井下作业公司所属单位第一修井分公司计财资产办', '计财资产办', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('e142b248-0a47-4cb3-b4b7-9cc6bc821733', '100003020005001005', '大港油田公司所属单位井下作业公司所属单位第一修井分公司人事劳资办公室', '人事劳资办公室', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('07acdf98-9324-4f1a-a81a-a89089d8cb64', '100003020005001006', '大港油田公司所属单位井下作业公司所属单位第一修井分公司生产办公室', '生产办公室', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('395cd784-d2c9-4fd8-9d9c-9b48fb65b320', '100003020005001007', '大港油田公司所属单位井下作业公司所属单位第一修井分公司市场办', '市场办', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('e8d3f63a-3d79-48fd-9343-45d20dc0a867', '100003020005001008', '大港油田公司所属单位井下作业公司所属单位第一修井分公司工程技术办公室', '工程技术办公室', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('3f8fd489-c655-44cd-b8b2-6bac72b207fe', '100003020005001009', '大港油田公司所属单位井下作业公司所属单位第一修井分公司质量安全环保办公室', '质量安全环保办公室', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('f36bf63b-716f-4945-a5f8-39fa3a214012', '100003020005001010', '大港油田公司所属单位井下作业公司所属单位第一修井分公司库房', '库房', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('ad644abd-5fea-451c-91cc-6cd996d332a6', '100003020005001011', '大港油田公司所属单位井下作业公司所属单位第一修井分公司维修队', '维修队', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('ef8644b4-e255-4c63-8e8f-2eb9dbb36799', '100003020005001012', '大港油田公司所属单位井下作业公司所属单位第一修井分公司安装队', '安装队', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('e67e1f03-8d71-4c8c-b8e4-6a792dc83c5e', '100003020005001013', '大港油田公司所属单位井下作业公司所属单位第一修井分公司服务队', '服务队', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('bae4034d-3d15-40d6-8675-1212354f372b', '100003020005001014', '大港油田公司所属单位井下作业公司所属单位第一修井分公司小车队', '小车队', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('974b51dc-41b2-4326-88ae-d3cea2a39043', '100003020005001015', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队', '基层队', '100003020005001', null, '1', '1', '', '1bcb0247-7c54-470a-ae48-4e2142c2eace');
INSERT INTO `ts_uidp_org` VALUES ('a2392c03-fa3c-42eb-83fe-7bf34b8c3aad', '100003020005001015001', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队101队', '101队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('19d4fe63-6351-4875-966b-e85ea42437a9', '100003020005001015002', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队102队', '102队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('02974955-c93f-4b05-9395-cdf96c9cccb3', '100003020005001015003', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队103队', '103队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('84d8151a-5de5-4959-96ef-4a686e40dcf8', '100003020005001015004', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队104队', '104队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('b82ed98b-8b50-4575-9dec-fed802017e5e', '100003020005001015005', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队105队', '105队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('b44e420e-5edf-4edf-8f28-c979396e25f8', '100003020005001015006', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队106队', '106队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('dc25cff9-d68d-4aa4-ac69-ac346cfc323d', '100003020005001015007', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队107队', '107队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('996bf2e1-bbb0-447a-bfc3-272c60fd1e35', '100003020005001015008', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队108队', '108队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('35ef2092-ffd0-4fdd-ae7e-56ed2db0f23d', '100003020005001015009', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队109队', '109队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('2e1c2cd4-0c47-422f-8048-7fad661bd4b4', '100003020005001015010', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队110队', '110队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('a1648812-e787-478b-bd33-b1b784ba1938', '100003020005001015011', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队111队', '111队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('91ce3a4c-7c1e-422a-9f73-12483a98a866', '100003020005001015012', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队112队', '112队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('7e0bf2bb-355a-4598-bf99-80feb6a5a07f', '100003020005001015013', '大港油田公司所属单位井下作业公司所属单位第一修井分公司基层队应急队', '应急队', '100003020005001015', null, '1', '1', '', '974b51dc-41b2-4326-88ae-d3cea2a39043');
INSERT INTO `ts_uidp_org` VALUES ('13cd73f0-908e-44ba-9162-f6b2195881c1', '100003020005002', '大港油田公司所属单位井下作业公司所属单位第二修井分公司', '第二修井分公司', '100003020005', null, '1', '1', '', 'e6c90e8a-54e7-4391-a6ab-ab76929a3799');
INSERT INTO `ts_uidp_org` VALUES ('4ea8c37f-7c0b-4552-b0f6-43c1e70e5e8b', '100003020005002001', '大港油田公司所属单位井下作业公司所属单位第二修井分公司分公司领导', '分公司领导', '100003020005002', null, '1', '1', '', '13cd73f0-908e-44ba-9162-f6b2195881c1');
INSERT INTO `ts_uidp_org` VALUES ('3b5e1aff-022c-4eb5-9d02-ecdcbec4286d', '100003020005002002', '大港油田公司所属单位井下作业公司所属单位第二修井分公司综合办', '综合办', '100003020005002', null, '1', '1', '', '13cd73f0-908e-44ba-9162-f6b2195881c1');
INSERT INTO `ts_uidp_org` VALUES ('a50d8888-2b6c-4fc8-8f47-c61ff28ca61c', '100003020005002003', '大港油田公司所属单位井下作业公司所属单位第二修井分公司质量安全环保办', '质量安全环保办', '100003020005002', null, '1', '1', '', '13cd73f0-908e-44ba-9162-f6b2195881c1');
INSERT INTO `ts_uidp_org` VALUES ('03b7c0bf-9df4-4da7-9759-025ce7880a1e', '100003020005002004', '大港油田公司所属单位井下作业公司所属单位第二修井分公司生产技术办', '生产技术办', '100003020005002', null, '1', '1', '', '13cd73f0-908e-44ba-9162-f6b2195881c1');
INSERT INTO `ts_uidp_org` VALUES ('55fb97d8-05fd-41fd-becd-34cbb360df04', '100003020005002005', '大港油田公司所属单位井下作业公司所属单位第二修井分公司经营办', '经营办', '100003020005002', null, '1', '1', '', '13cd73f0-908e-44ba-9162-f6b2195881c1');
INSERT INTO `ts_uidp_org` VALUES ('0413cd67-ad13-42cd-a56f-0d88fa1f64f1', '100003020005002006', '大港油田公司所属单位井下作业公司所属单位第二修井分公司生产办', '生产办', '100003020005002', null, '1', '1', '', '13cd73f0-908e-44ba-9162-f6b2195881c1');
INSERT INTO `ts_uidp_org` VALUES ('d13cf882-14a7-4fff-ab2b-bda110f7741c', '100003020005002007', '大港油田公司所属单位井下作业公司所属单位第二修井分公司物资装备办', '物资装备办', '100003020005002', null, '1', '1', '', '13cd73f0-908e-44ba-9162-f6b2195881c1');
INSERT INTO `ts_uidp_org` VALUES ('5699c0e2-c54d-400c-a990-ab0e3a98b77c', '100003020005002008', '大港油田公司所属单位井下作业公司所属单位第二修井分公司机关附属', '机关附属', '100003020005002', null, '1', '1', '', '13cd73f0-908e-44ba-9162-f6b2195881c1');
INSERT INTO `ts_uidp_org` VALUES ('23f4ba65-c684-45b5-8e68-c3dd4ac78c37', '100003020005002008001', '大港油田公司所属单位井下作业公司所属单位第二修井分公司机关附属生产调度', '生产调度', '100003020005002008', null, '1', '1', '', '5699c0e2-c54d-400c-a990-ab0e3a98b77c');
INSERT INTO `ts_uidp_org` VALUES ('7a9537b2-fdda-4dce-a38b-9a0694514773', '100003020005002008002', '大港油田公司所属单位井下作业公司所属单位第二修井分公司机关附属材料组', '材料组', '100003020005002008', null, '1', '1', '', '5699c0e2-c54d-400c-a990-ab0e3a98b77c');
INSERT INTO `ts_uidp_org` VALUES ('621662d7-8d8b-46eb-b7ac-42e01225e4da', '100003020005002008003', '大港油田公司所属单位井下作业公司所属单位第二修井分公司机关附属节能', '节能', '100003020005002008', null, '1', '1', '', '5699c0e2-c54d-400c-a990-ab0e3a98b77c');
INSERT INTO `ts_uidp_org` VALUES ('9f8f8e9e-9a76-48cb-99e1-7630d195fd17', '100003020005002009', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队', '基层队', '100003020005002', null, '1', '1', '', '13cd73f0-908e-44ba-9162-f6b2195881c1');
INSERT INTO `ts_uidp_org` VALUES ('e4a3c2bf-5caa-471a-85cc-6561b494c1c6', '100003020005002009001', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队201队', '201队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('1f70a23e-4a93-4834-88e4-b99b91a3f892', '100003020005002009002', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队202队', '202队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('48015085-d813-4e58-8604-72022a7237b2', '100003020005002009003', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队203队', '203队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('292b4cb8-6940-484d-b1b8-0e2decea8c83', '100003020005002009004', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队204队', '204队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('f159c126-1cd0-43d4-8d82-2bf63fb4907f', '100003020005002009005', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队205队', '205队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('3f022509-9bad-4519-bd61-1d707128e01b', '100003020005002009006', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队206队', '206队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('76e002b2-d75a-4f52-af8a-a893856b3b63', '100003020005002009007', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队207队', '207队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('d781947e-5d82-4cca-9038-4592f5c6125f', '100003020005002009008', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队生产服务队', '生产服务队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('b2ec6e08-a814-4f32-9b9d-719c6aa92a41', '100003020005002009009', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队工具队', '工具队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('8cc0d6b5-8917-4d6e-b2a1-09a143a699c0', '100003020005002009010', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队生活服务队', '生活服务队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('447175ce-b235-42bc-b55f-45feb379d0eb', '100003020005002009011', '大港油田公司所属单位井下作业公司所属单位第二修井分公司基层队应急队', '应急队', '100003020005002009', null, '1', '1', '', '9f8f8e9e-9a76-48cb-99e1-7630d195fd17');
INSERT INTO `ts_uidp_org` VALUES ('182d4c32-ac04-4b0c-ae9f-62fabdca070f', '100003020005003', '大港油田公司所属单位井下作业公司所属单位第三修井分公司', '第三修井分公司', '100003020005', null, '1', '1', '', 'e6c90e8a-54e7-4391-a6ab-ab76929a3799');
INSERT INTO `ts_uidp_org` VALUES ('27ed0a43-39fd-4ab1-b23d-fd1b8b7606be', '100003020005003001', '大港油田公司所属单位井下作业公司所属单位第三修井分公司分公司领导', '分公司领导', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('7a330abe-d765-474d-84fa-897455bc2ea7', '100003020005003002', '大港油田公司所属单位井下作业公司所属单位第三修井分公司综合办公室', '综合办公室', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('49c3c085-de80-4dd5-af2a-d8165937bc6a', '100003020005003003', '大港油田公司所属单位井下作业公司所属单位第三修井分公司工程技术办公室', '工程技术办公室', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('b4671a17-9cd4-40b2-9420-235e58e1f642', '100003020005003004', '大港油田公司所属单位井下作业公司所属单位第三修井分公司经营办公室', '经营办公室', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('b82040fe-e640-4cdf-a1ce-06d2c22bd7e5', '100003020005003005', '大港油田公司所属单位井下作业公司所属单位第三修井分公司生产办公室', '生产办公室', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('b8687a9d-31dd-4956-9320-3bb579cbdc9f', '100003020005003006', '大港油田公司所属单位井下作业公司所属单位第三修井分公司内保办', '内保办', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('aee21626-9def-428b-98cd-7e9d527c6987', '100003020005003007', '大港油田公司所属单位井下作业公司所属单位第三修井分公司人事劳资办公室', '人事劳资办公室', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('e17e6437-258d-4382-a8e3-64c96624ed2e', '100003020005003008', '大港油田公司所属单位井下作业公司所属单位第三修井分公司质量安全环保办公室', '质量安全环保办公室', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('c14c5061-f4a9-4e08-af03-a2c1e183e9dc', '100003020005003009', '大港油田公司所属单位井下作业公司所属单位第三修井分公司物资装备办公室', '物资装备办公室', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('c0ae87aa-f33a-4bb3-8315-41acf1028ddf', '100003020005003010', '大港油田公司所属单位井下作业公司所属单位第三修井分公司服务队', '服务队', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('034ca597-3e85-4d08-87b0-226eed996c4f', '100003020005003011', '大港油田公司所属单位井下作业公司所属单位第三修井分公司安装队', '安装队', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('bf5bfd15-f124-42d5-82b6-98edf9be6029', '100003020005003012', '大港油田公司所属单位井下作业公司所属单位第三修井分公司油管队', '油管队', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('c7ba238e-1786-4e5f-8b74-cce57fc6cae3', '100003020005003013', '大港油田公司所属单位井下作业公司所属单位第三修井分公司小车队', '小车队', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('110c54cc-7067-470a-9bb9-766112a92552', '100003020005003014', '大港油田公司所属单位井下作业公司所属单位第三修井分公司库房', '库房', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('391fd632-2bf0-4400-9333-0c25011c70b9', '100003020005003015', '大港油田公司所属单位井下作业公司所属单位第三修井分公司施工队', '施工队', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('f422fb0e-b84b-492b-9a9b-cc6f000fced4', '100003020005003016', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队', '基层队', '100003020005003', null, '1', '1', '', '182d4c32-ac04-4b0c-ae9f-62fabdca070f');
INSERT INTO `ts_uidp_org` VALUES ('5775441f-818e-4c24-aa59-fb263400b10b', '100003020005003016001', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队301队', '301队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('8901b42a-c6b6-4490-b96e-2ece62b31358', '100003020005003016002', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队302队', '302队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('60e0907a-c544-4031-9731-9c1344aceec5', '100003020005003016003', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队303队', '303队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('12cc5658-9ce0-4b8c-a5e4-3df57907fd38', '100003020005003016004', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队304队', '304队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('c12162e8-3a25-40d5-9878-324ad573d2fc', '100003020005003016005', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队305队', '305队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('49896d3b-b21e-4dde-9afd-d7834282a60f', '100003020005003016006', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队306队', '306队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('bef43fbd-bcf1-407e-be3c-488f38c29479', '100003020005003016007', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队307队', '307队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('43c97ab2-b065-4422-8e68-41e7e36c48bf', '100003020005003016008', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队308队', '308队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('c6190917-72f6-4ccf-901e-aed3856c1900', '100003020005003016009', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队309队', '309队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('833710f0-9d77-4881-a8b2-8ae074b31750', '100003020005003016010', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队310队', '310队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('af8b8f1a-fe6c-4c0a-9500-43eddbe96edb', '100003020005003016011', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队311队', '311队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('173b9531-c052-4ef4-8278-b413ecabaacc', '100003020005003016012', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队312队', '312队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('5ceb56e7-6d8d-4fea-831a-ab26c078078b', '100003020005003016013', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队313队', '313队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('fecc6cde-46ed-465c-8d3b-191419e4e3ac', '100003020005003016014', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队315队', '315队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('7b2cb768-b48e-4cc7-b031-54ecb5de1163', '100003020005003016015', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队316队', '316队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('495447d6-462b-4158-b495-803dd729f7b9', '100003020005003016016', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队317队', '317队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('a65c31f2-c4a4-4008-bbbc-fdfded8832b7', '100003020005003016017', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队318队', '318队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('5bfae97b-cf57-4a5d-9321-ceb1e92bd7a9', '100003020005003016018', '大港油田公司所属单位井下作业公司所属单位第三修井分公司基层队应急队', '应急队', '100003020005003016', null, '1', '1', '', 'f422fb0e-b84b-492b-9a9b-cc6f000fced4');
INSERT INTO `ts_uidp_org` VALUES ('e96123e4-f186-4f65-9a6c-ac050ff526b6', '100003020005004', '大港油田公司所属单位井下作业公司所属单位第四修井分公司', '第四修井分公司', '100003020005', null, '1', '1', '', 'e6c90e8a-54e7-4391-a6ab-ab76929a3799');
INSERT INTO `ts_uidp_org` VALUES ('67e64da3-e338-48af-bccc-92ff1a8e02f1', '100003020005004001', '大港油田公司所属单位井下作业公司所属单位第四修井分公司分公司领导', '分公司领导', '100003020005004', null, '1', '1', '', 'e96123e4-f186-4f65-9a6c-ac050ff526b6');
INSERT INTO `ts_uidp_org` VALUES ('3a291c7e-94d1-4552-8886-8878d7355615', '100003020005004002', '大港油田公司所属单位井下作业公司所属单位第四修井分公司物资装备办', '物资装备办', '100003020005004', null, '1', '1', '', 'e96123e4-f186-4f65-9a6c-ac050ff526b6');
INSERT INTO `ts_uidp_org` VALUES ('8c85592e-31c8-42c1-9d7e-54ec56e57dee', '100003020005004003', '大港油田公司所属单位井下作业公司所属单位第四修井分公司质量安全环保办', '质量安全环保办', '100003020005004', null, '1', '1', '', 'e96123e4-f186-4f65-9a6c-ac050ff526b6');
INSERT INTO `ts_uidp_org` VALUES ('df920fc2-2c5b-41c7-9c4e-8a0e7f4a036c', '100003020005004004', '大港油田公司所属单位井下作业公司所属单位第四修井分公司市场经营办', '市场经营办', '100003020005004', null, '1', '1', '', 'e96123e4-f186-4f65-9a6c-ac050ff526b6');
INSERT INTO `ts_uidp_org` VALUES ('f63a2305-d964-432d-b406-73b0b36132a2', '100003020005004005', '大港油田公司所属单位井下作业公司所属单位第四修井分公司综合管理办', '综合管理办', '100003020005004', null, '1', '1', '', 'e96123e4-f186-4f65-9a6c-ac050ff526b6');
INSERT INTO `ts_uidp_org` VALUES ('0e7d37ad-eafc-4e3e-99fe-c10ad2bd29bf', '100003020005004006', '大港油田公司所属单位井下作业公司所属单位第四修井分公司人事劳资办', '人事劳资办', '100003020005004', null, '1', '1', '', 'e96123e4-f186-4f65-9a6c-ac050ff526b6');
INSERT INTO `ts_uidp_org` VALUES ('77c99cdc-7278-472d-931f-353b8ac4c637', '100003020005004007', '大港油田公司所属单位井下作业公司所属单位第四修井分公司生产协调办', '生产协调办', '100003020005004', null, '1', '1', '', 'e96123e4-f186-4f65-9a6c-ac050ff526b6');
INSERT INTO `ts_uidp_org` VALUES ('0c00f54f-a399-4190-b250-c927f9a6c72d', '100003020005004008', '大港油田公司所属单位井下作业公司所属单位第四修井分公司技术开发办', '技术开发办', '100003020005004', null, '1', '1', '', 'e96123e4-f186-4f65-9a6c-ac050ff526b6');
INSERT INTO `ts_uidp_org` VALUES ('fc985791-4009-4431-be59-34ce96a7ad97', '100003020005004009', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队', '基层队', '100003020005004', null, '1', '1', '', 'e96123e4-f186-4f65-9a6c-ac050ff526b6');
INSERT INTO `ts_uidp_org` VALUES ('3e9e4e2a-a898-40ac-b073-30f291a0ce75', '100003020005004009001', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队401', '401', '100003020005004009', null, '1', '1', '', 'fc985791-4009-4431-be59-34ce96a7ad97');
INSERT INTO `ts_uidp_org` VALUES ('99b8a496-fe6a-432e-aa27-7afec6e6fa4b', '100003020005004009002', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队402', '402', '100003020005004009', null, '1', '1', '', 'fc985791-4009-4431-be59-34ce96a7ad97');
INSERT INTO `ts_uidp_org` VALUES ('b24b56e0-34e7-472d-a17c-42caa83c5e44', '100003020005004009003', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队403', '403', '100003020005004009', null, '1', '1', '', 'fc985791-4009-4431-be59-34ce96a7ad97');
INSERT INTO `ts_uidp_org` VALUES ('dbf7d6e3-270f-485a-84dd-f6d7143de223', '100003020005004009004', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队404', '404', '100003020005004009', null, '1', '1', '', 'fc985791-4009-4431-be59-34ce96a7ad97');
INSERT INTO `ts_uidp_org` VALUES ('20327577-e22e-4380-b1fd-3a68ed44c2ff', '100003020005004009005', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队405', '405', '100003020005004009', null, '1', '1', '', 'fc985791-4009-4431-be59-34ce96a7ad97');
INSERT INTO `ts_uidp_org` VALUES ('3c9a1cc3-674a-4d22-975e-787542720434', '100003020005004009006', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队406', '406', '100003020005004009', null, '1', '1', '', 'fc985791-4009-4431-be59-34ce96a7ad97');
INSERT INTO `ts_uidp_org` VALUES ('ffb68601-9be1-4df1-aa14-ac2fa1787049', '100003020005004009007', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队407', '407', '100003020005004009', null, '1', '1', '', 'fc985791-4009-4431-be59-34ce96a7ad97');
INSERT INTO `ts_uidp_org` VALUES ('b44bd1ec-275a-4f55-b223-dfb97d74d370', '100003020005004009008', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队准备队', '准备队', '100003020005004009', null, '1', '1', '', 'fc985791-4009-4431-be59-34ce96a7ad97');
INSERT INTO `ts_uidp_org` VALUES ('829fe6dd-b68f-4434-8fb7-634c3c8f5090', '100003020005004009009', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队车队', '车队', '100003020005004009', null, '1', '1', '', 'fc985791-4009-4431-be59-34ce96a7ad97');
INSERT INTO `ts_uidp_org` VALUES ('0cc4ade5-f560-4e91-9ec5-8b371c9dcfa1', '100003020005004009010', '大港油田公司所属单位井下作业公司所属单位第四修井分公司基层队成本员', '成本员', '100003020005004009', null, '1', '1', '', 'fc985791-4009-4431-be59-34ce96a7ad97');
INSERT INTO `ts_uidp_org` VALUES ('96807a30-1578-4207-b5ea-643ded6a4bb2', '100003020005005', '大港油田公司所属单位井下作业公司所属单位特车分公司', '特车分公司', '100003020005', null, '1', '1', '', 'e6c90e8a-54e7-4391-a6ab-ab76929a3799');
INSERT INTO `ts_uidp_org` VALUES ('26ae8c3c-597c-4890-9118-a21f5c7be6fb', '100003020005005001', '大港油田公司所属单位井下作业公司所属单位特车分公司分公司领导', '分公司领导', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('276a643c-8406-47e8-9368-8438685b6955', '100003020005005002', '大港油田公司所属单位井下作业公司所属单位特车分公司生产调度', '生产调度', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('299e522d-1539-4b3b-a6f6-8bab0f8b44af', '100003020005005003', '大港油田公司所属单位井下作业公司所属单位特车分公司综合办', '综合办', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('d8d0338b-c30e-4662-bafc-14b9de684701', '100003020005005004', '大港油田公司所属单位井下作业公司所属单位特车分公司经营办', '经营办', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('3d441331-2175-4f91-b731-a1d2d5ba1f96', '100003020005005005', '大港油田公司所属单位井下作业公司所属单位特车分公司质安办', '质安办', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('7f9d7a2a-3cef-4038-b18b-25cc2438b02f', '100003020005005006', '大港油田公司所属单位井下作业公司所属单位特车分公司生产办', '生产办', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('92b7c233-a0e0-451f-b809-7e89231a1b49', '100003020005005007', '大港油田公司所属单位井下作业公司所属单位特车分公司劳人办', '劳人办', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('31c3851b-d5e8-4f81-9722-4536cd7f874e', '100003020005005008', '大港油田公司所属单位井下作业公司所属单位特车分公司物装办', '物装办', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('1078ac1a-e1f8-4684-9162-1d1b5a4c7352', '100003020005005009', '大港油田公司所属单位井下作业公司所属单位特车分公司市场办', '市场办', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('1c0bf664-8365-48b4-b73e-d493479d0da2', '100003020005005010', '大港油田公司所属单位井下作业公司所属单位特车分公司基层一队', '基层一队', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('9cd3705c-c965-473d-a9fe-c20de49c942e', '100003020005005011', '大港油田公司所属单位井下作业公司所属单位特车分公司基层二队', '基层二队', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('78cf2412-85c0-4d48-adbc-9a96a819b8cf', '100003020005005012', '大港油田公司所属单位井下作业公司所属单位特车分公司基层三队', '基层三队', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('96ae11aa-f1af-4ea3-8760-9c9f2d3199e6', '100003020005005013', '大港油田公司所属单位井下作业公司所属单位特车分公司基层五队', '基层五队', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('66d0df09-915f-40bc-b649-473f392c7f31', '100003020005005014', '大港油田公司所属单位井下作业公司所属单位特车分公司基层六队', '基层六队', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('82244184-2a6c-4c7a-afa1-11c7c6ed773b', '100003020005005015', '大港油田公司所属单位井下作业公司所属单位特车分公司基层七队', '基层七队', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('ef62a4ed-8696-45cd-af5d-c17ff757604d', '100003020005005016', '大港油田公司所属单位井下作业公司所属单位特车分公司基层施工队', '基层施工队', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('7b49427f-1078-4a4f-8618-97c899038a9c', '100003020005005017', '大港油田公司所属单位井下作业公司所属单位特车分公司基层服务队', '基层服务队', '100003020005005', null, '1', '1', '', '96807a30-1578-4207-b5ea-643ded6a4bb2');
INSERT INTO `ts_uidp_org` VALUES ('34cc36d6-33f7-40ec-8194-6c21df161e42', '100003020005006', '大港油田公司所属单位井下作业公司所属单位风险作业服务项目部', '风险作业服务项目部', '100003020005', null, '1', '1', '', 'e6c90e8a-54e7-4391-a6ab-ab76929a3799');
INSERT INTO `ts_uidp_org` VALUES ('d82288ef-81b5-496e-bee5-c806c06e33bd', '100003020005006001', '大港油田公司所属单位井下作业公司所属单位风险作业服务项目部领导', '领导', '100003020005006', null, '1', '1', '', '34cc36d6-33f7-40ec-8194-6c21df161e42');
INSERT INTO `ts_uidp_org` VALUES ('191adbcc-69c1-42f8-9c2a-6b86341098d3', '100003020005006002', '大港油田公司所属单位井下作业公司所属单位风险作业服务项目部综合办公室', '综合办公室', '100003020005006', null, '1', '1', '', '34cc36d6-33f7-40ec-8194-6c21df161e42');
INSERT INTO `ts_uidp_org` VALUES ('ec751568-463a-4a31-9c87-c98639cc1698', '100003020005006003', '大港油田公司所属单位井下作业公司所属单位风险作业服务项目部工程技术部', '工程技术部', '100003020005006', null, '1', '1', '', '34cc36d6-33f7-40ec-8194-6c21df161e42');
INSERT INTO `ts_uidp_org` VALUES ('a9a0e825-3853-4ab7-86c6-ad84e43549c4', '100003020005006004', '大港油田公司所属单位井下作业公司所属单位风险作业服务项目部生产安全部', '生产安全部', '100003020005006', null, '1', '1', '', '34cc36d6-33f7-40ec-8194-6c21df161e42');
INSERT INTO `ts_uidp_org` VALUES ('11fef987-d30a-4fec-9a29-f0a7c7c5344e', '100003020005006005', '大港油田公司所属单位井下作业公司所属单位风险作业服务项目部财务计划部', '财务计划部', '100003020005006', null, '1', '1', '', '34cc36d6-33f7-40ec-8194-6c21df161e42');
INSERT INTO `ts_uidp_org` VALUES ('c70096f0-896f-4100-8cea-6a5cbfb58c9a', '100003020005007', '大港油田公司所属单位井下作业公司所属单位港锐公司', '港锐公司', '100003020005', null, '1', '1', '', 'e6c90e8a-54e7-4391-a6ab-ab76929a3799');
INSERT INTO `ts_uidp_org` VALUES ('4536527d-a3e7-4133-bc04-e7a673df30d0', '100003020005007001', '大港油田公司所属单位井下作业公司所属单位港锐公司领导', '领导', '100003020005007', null, '1', '1', '', 'c70096f0-896f-4100-8cea-6a5cbfb58c9a');
INSERT INTO `ts_uidp_org` VALUES ('8327c24f-3fa3-4eda-a46a-47b158b4bc92', '100003020005007002', '大港油田公司所属单位井下作业公司所属单位港锐公司机关', '机关', '100003020005007', null, '1', '1', '', 'c70096f0-896f-4100-8cea-6a5cbfb58c9a');
INSERT INTO `ts_uidp_org` VALUES ('f28543e9-e9ac-4264-9a8a-ed23c45f3c37', '100003020005007002001', '大港油田公司所属单位井下作业公司所属单位港锐公司机关综合管理部', '综合管理部', '100003020005007002', null, '1', '1', '', '8327c24f-3fa3-4eda-a46a-47b158b4bc92');
INSERT INTO `ts_uidp_org` VALUES ('ddaca6a8-bcac-4ba7-b1cd-40cc9e3edf6f', '100003020005007002002', '大港油田公司所属单位井下作业公司所属单位港锐公司机关财务劳资部', '财务劳资部', '100003020005007002', null, '1', '1', '', '8327c24f-3fa3-4eda-a46a-47b158b4bc92');
INSERT INTO `ts_uidp_org` VALUES ('d42a04e7-797a-4e3e-90b2-b94e75d1c273', '100003020005007002003', '大港油田公司所属单位井下作业公司所属单位港锐公司机关技术装备部', '技术装备部', '100003020005007002', null, '1', '1', '', '8327c24f-3fa3-4eda-a46a-47b158b4bc92');
INSERT INTO `ts_uidp_org` VALUES ('cde8aa3b-7010-44d2-a038-926971c1b1f9', '100003020005007002004', '大港油田公司所属单位井下作业公司所属单位港锐公司机关企业管理部', '企业管理部', '100003020005007002', null, '1', '1', '', '8327c24f-3fa3-4eda-a46a-47b158b4bc92');
INSERT INTO `ts_uidp_org` VALUES ('7675cbed-4f65-41b4-9f4f-b8f6713ee723', '100003020005007002005', '大港油田公司所属单位井下作业公司所属单位港锐公司机关生产安全部', '生产安全部', '100003020005007002', null, '1', '1', '', '8327c24f-3fa3-4eda-a46a-47b158b4bc92');
INSERT INTO `ts_uidp_org` VALUES ('e720750e-ca8c-416f-890c-935f71321af9', '100003020005007003', '大港油田公司所属单位井下作业公司所属单位港锐公司基层队', '基层队', '100003020005007', null, '1', '1', '', 'c70096f0-896f-4100-8cea-6a5cbfb58c9a');
INSERT INTO `ts_uidp_org` VALUES ('e3b44541-7de6-43ae-a319-0d1c601eaa74', '100003020005007003001', '大港油田公司所属单位井下作业公司所属单位港锐公司基层队后勤服务保障中心', '后勤服务保障中心', '100003020005007003', null, '1', '1', '', 'e720750e-ca8c-416f-890c-935f71321af9');
INSERT INTO `ts_uidp_org` VALUES ('213a6344-aec7-4f33-8d11-5fd8c4a9d580', '100003020005007003002', '大港油田公司所属单位井下作业公司所属单位港锐公司基层队技术推广中心', '技术推广中心', '100003020005007003', null, '1', '1', '', 'e720750e-ca8c-416f-890c-935f71321af9');
INSERT INTO `ts_uidp_org` VALUES ('d7ffcfa3-58be-4334-b261-01628849f33f', '100003020005007003003', '大港油田公司所属单位井下作业公司所属单位港锐公司基层队长庆项目管理部', '长庆项目管理部', '100003020005007003', null, '1', '1', '', 'e720750e-ca8c-416f-890c-935f71321af9');
INSERT INTO `ts_uidp_org` VALUES ('8f9e1d1b-285c-4d8a-971f-a91398a5f503', '100003020005007003004', '大港油田公司所属单位井下作业公司所属单位港锐公司基层队电泵电缆厂', '电泵电缆厂', '100003020005007003', null, '1', '1', '', 'e720750e-ca8c-416f-890c-935f71321af9');
INSERT INTO `ts_uidp_org` VALUES ('47326ac2-38e4-42b3-99df-56802be426e8', '100003020005007003005', '大港油田公司所属单位井下作业公司所属单位港锐公司基层队生产应急保障中心', '生产应急保障中心', '100003020005007003', null, '1', '1', '', 'e720750e-ca8c-416f-890c-935f71321af9');
INSERT INTO `ts_uidp_org` VALUES ('12c3db96-637a-43f7-bfad-691aae316da6', '100003020005007003006', '大港油田公司所属单位井下作业公司所属单位港锐公司基层队车辆管理服务中心', '车辆管理服务中心', '100003020005007003', null, '1', '1', '', 'e720750e-ca8c-416f-890c-935f71321af9');
INSERT INTO `ts_uidp_org` VALUES ('ab9a91be-f974-4adb-a579-b57b762c5e42', '100003020005007003007', '大港油田公司所属单位井下作业公司所属单位港锐公司基层队加工装配中心', '加工装配中心', '100003020005007003', null, '1', '1', '', 'e720750e-ca8c-416f-890c-935f71321af9');
INSERT INTO `ts_uidp_org` VALUES ('e97eefce-66c0-41a1-8e5b-01b895f7df02', '100003021', '大港油田公司所属单位电力公司', '电力公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('fad0bad1-aa80-4211-ba60-db43b7b3b0d7', '100003021001', '大港油田公司所属单位电力公司机关科室', '机关科室', '100003021', null, '1', '1', '', 'e97eefce-66c0-41a1-8e5b-01b895f7df02');
INSERT INTO `ts_uidp_org` VALUES ('2fa000e6-aac2-4ff0-b347-add7ee58b187', '100003021001001', '大港油田公司所属单位电力公司机关科室公司领导', '公司领导', '100003021001', null, '1', '1', '', 'fad0bad1-aa80-4211-ba60-db43b7b3b0d7');
INSERT INTO `ts_uidp_org` VALUES ('4af28ab3-7935-4471-91c0-91e8bd2de84f', '100003021001002', '大港油田公司所属单位电力公司机关科室公司办公室', '公司办公室', '100003021001', null, '1', '1', '', 'fad0bad1-aa80-4211-ba60-db43b7b3b0d7');
INSERT INTO `ts_uidp_org` VALUES ('017b4175-d22b-44f6-8efc-5d75e5fc735c', '100003021001003', '大港油田公司所属单位电力公司机关科室党委办公室', '党委办公室', '100003021001', null, '1', '1', '', 'fad0bad1-aa80-4211-ba60-db43b7b3b0d7');
INSERT INTO `ts_uidp_org` VALUES ('3fb4d3b1-357d-4ced-9f61-a9340b5ac078', '100003021001004', '大港油田公司所属单位电力公司机关科室群众工作部', '群众工作部', '100003021001', null, '1', '1', '', 'fad0bad1-aa80-4211-ba60-db43b7b3b0d7');
INSERT INTO `ts_uidp_org` VALUES ('c1e57564-1205-47c6-ab49-16ae1995019c', '100003021001005', '大港油田公司所属单位电力公司机关科室财务资产科', '财务资产科', '100003021001', null, '1', '1', '', 'fad0bad1-aa80-4211-ba60-db43b7b3b0d7');
INSERT INTO `ts_uidp_org` VALUES ('eba5c662-07ab-426a-8b69-127ae38d5545', '100003021001006', '大港油田公司所属单位电力公司机关科室劳动工资科', '劳动工资科', '100003021001', null, '1', '1', '', 'fad0bad1-aa80-4211-ba60-db43b7b3b0d7');
INSERT INTO `ts_uidp_org` VALUES ('1778cdca-5fce-44b7-9290-9f83d3dd925d', '100003021001007', '大港油田公司所属单位电力公司机关科室安全环保科', '安全环保科', '100003021001', null, '1', '1', '', 'fad0bad1-aa80-4211-ba60-db43b7b3b0d7');
INSERT INTO `ts_uidp_org` VALUES ('8e58e83d-dadf-4c74-aa6a-aef1b77aa70b', '100003021001008', '大港油田公司所属单位电力公司机关科室物资装备科', '物资装备科', '100003021001', null, '1', '1', '', 'fad0bad1-aa80-4211-ba60-db43b7b3b0d7');
INSERT INTO `ts_uidp_org` VALUES ('0fdf0b7e-d56c-4564-ae4a-e87204eae2bb', '100003021001009', '大港油田公司所属单位电力公司机关科室经营计划科（企业管理科）', '经营计划科（企业管理科）', '100003021001', null, '1', '1', '', 'fad0bad1-aa80-4211-ba60-db43b7b3b0d7');
INSERT INTO `ts_uidp_org` VALUES ('f0aff106-a0be-483c-8e6d-2bff92517de1', '100003021002', '大港油田公司所属单位电力公司机关附属', '机关附属', '100003021', null, '1', '1', '', 'e97eefce-66c0-41a1-8e5b-01b895f7df02');
INSERT INTO `ts_uidp_org` VALUES ('45e300cc-7446-4f50-8d22-064835818732', '100003021002001', '大港油田公司所属单位电力公司机关附属预算站', '预算站', '100003021002', null, '1', '1', '', 'f0aff106-a0be-483c-8e6d-2bff92517de1');
INSERT INTO `ts_uidp_org` VALUES ('f61e2773-df10-4f0f-9fcb-17f83a936c12', '100003021002002', '大港油田公司所属单位电力公司机关附属科技信息室', '科技信息室', '100003021002', null, '1', '1', '', 'f0aff106-a0be-483c-8e6d-2bff92517de1');
INSERT INTO `ts_uidp_org` VALUES ('097f50b0-6bfc-4c3d-bb03-ee3a1bf84206', '100003021002003', '大港油田公司所属单位电力公司机关附属档案资料室', '档案资料室', '100003021002', null, '1', '1', '', 'f0aff106-a0be-483c-8e6d-2bff92517de1');
INSERT INTO `ts_uidp_org` VALUES ('12ab1889-65f7-4578-98ec-1a650a839820', '100003021002004', '大港油田公司所属单位电力公司机关附属安全监督站', '安全监督站', '100003021002', null, '1', '1', '', 'f0aff106-a0be-483c-8e6d-2bff92517de1');
INSERT INTO `ts_uidp_org` VALUES ('05cb3864-9c57-43b0-a38e-cc192c7e9fb0', '100003021003', '大港油田公司所属单位电力公司直属单位', '直属单位', '100003021', null, '1', '1', '', 'e97eefce-66c0-41a1-8e5b-01b895f7df02');
INSERT INTO `ts_uidp_org` VALUES ('c40d7164-70c6-4bb9-a30e-6a4b7c1dc6ec', '100003021003001', '大港油田公司所属单位电力公司直属单位保卫（武装）科', '保卫（武装）科', '100003021003', null, '1', '1', '', '05cb3864-9c57-43b0-a38e-cc192c7e9fb0');
INSERT INTO `ts_uidp_org` VALUES ('31428a10-b00c-4241-a888-59a56e2d7d6b', '100003021003002', '大港油田公司所属单位电力公司直属单位生产调度中心', '生产调度中心', '100003021003', null, '1', '1', '', '05cb3864-9c57-43b0-a38e-cc192c7e9fb0');
INSERT INTO `ts_uidp_org` VALUES ('537cbf78-d46d-4681-8850-8703c44db58c', '100003021003003', '大港油田公司所属单位电力公司直属单位工程技术中心', '工程技术中心', '100003021003', null, '1', '1', '', '05cb3864-9c57-43b0-a38e-cc192c7e9fb0');
INSERT INTO `ts_uidp_org` VALUES ('01f51727-3a5a-4113-972b-df9a28d105a3', '100003021003004', '大港油田公司所属单位电力公司直属单位行政服务中心', '行政服务中心', '100003021003', null, '1', '1', '', '05cb3864-9c57-43b0-a38e-cc192c7e9fb0');
INSERT INTO `ts_uidp_org` VALUES ('66dd5886-f117-478c-9196-a4db3861a37a', '100003021003005', '大港油田公司所属单位电力公司直属单位职工培训中心（水电专业鉴定站）', '职工培训中心（水电专业鉴定站）', '100003021003', null, '1', '1', '', '05cb3864-9c57-43b0-a38e-cc192c7e9fb0');
INSERT INTO `ts_uidp_org` VALUES ('60687a34-41f4-454e-b9d2-10d03932ca1a', '100003021003006', '大港油田公司所属单位电力公司直属单位居民水电服务项目部', '居民水电服务项目部', '100003021003', null, '1', '1', '', '05cb3864-9c57-43b0-a38e-cc192c7e9fb0');
INSERT INTO `ts_uidp_org` VALUES ('4f3eee63-e360-4424-bb24-989676253fa5', '100003021004', '大港油田公司所属单位电力公司基层单位', '基层单位', '100003021', null, '1', '1', '', 'e97eefce-66c0-41a1-8e5b-01b895f7df02');
INSERT INTO `ts_uidp_org` VALUES ('00399cbe-9ae6-4e36-be8f-b1ad3d3ff693', '100003021004001', '大港油田公司所属单位电力公司基层单位港东变电分公司', '港东变电分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('cda374d1-6f1a-48b5-aed2-cf7bcb7fb7c3', '100003021004002', '大港油田公司所属单位电力公司基层单位港中变电分公司', '港中变电分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('bb9a1ff4-44df-402e-9fa0-603fffa3eede', '100003021004003', '大港油田公司所属单位电力公司基层单位南部变电分公司', '南部变电分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('84e940cc-0194-4bcf-9d27-5a74884c4a17', '100003021004004', '大港油田公司所属单位电力公司基层单位检修分公司', '检修分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('226ab316-9b2b-448f-ac0f-8e020c4f9443', '100003021004005', '大港油田公司所属单位电力公司基层单位客户服务中心', '客户服务中心', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('e096b374-301b-4e91-8faa-241a25591346', '100003021004006', '大港油田公司所属单位电力公司基层单位线路分公司', '线路分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('5c413861-4599-4271-ae3a-8be5acb1e49e', '100003021004007', '大港油田公司所属单位电力公司基层单位生产运输分公司', '生产运输分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('ac6ebc97-de6e-4624-b603-5860dbdd7261', '100003021004008', '大港油田公司所属单位电力公司基层单位小车队', '小车队', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('6c1c00b3-5bb7-49a2-a9f0-8f3ca7af1599', '100003021004009', '大港油田公司所属单位电力公司基层单位安装分公司（天水安装工程处）', '安装分公司（天水安装工程处）', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('72d7dcfa-a3e1-496f-9259-d5bbad70f075', '100003021004010', '大港油田公司所属单位电力公司基层单位中心水电服务分公司', '中心水电服务分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('a66907fd-708a-40e9-8941-0363be5173f8', '100003021004011', '大港油田公司所属单位电力公司基层单位幸福水电服务分公司', '幸福水电服务分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('f73b79e0-a085-4e8d-9a14-a819493e8cc3', '100003021004012', '大港油田公司所属单位电力公司基层单位花园水电服务分公司', '花园水电服务分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('af98137f-8f5e-480f-a721-e2e537291feb', '100003021004013', '大港油田公司所属单位电力公司基层单位同盛水电服务分公司', '同盛水电服务分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('0966e62b-de1d-4ba9-be61-aceb173a8046', '100003021004014', '大港油田公司所属单位电力公司基层单位新城水电服务分公司', '新城水电服务分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('271b6581-f110-4f3f-b354-d3229472fd0f', '100003021004015', '大港油田公司所属单位电力公司基层单位阳光水电服务分公司', '阳光水电服务分公司', '100003021004', null, '1', '1', '', '4f3eee63-e360-4424-bb24-989676253fa5');
INSERT INTO `ts_uidp_org` VALUES ('1967f63a-c96b-455d-a99c-8fbf5370a2cc', '100003022', '大港油田公司所属单位信息中心', '信息中心', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('22b9fbb9-ce46-4917-b33c-a31cfbf8e170', '100003022001', '大港油田公司所属单位信息中心领导', '领导', '100003022', null, '1', '1', '', '1967f63a-c96b-455d-a99c-8fbf5370a2cc');
INSERT INTO `ts_uidp_org` VALUES ('1a3b7c21-5d6e-4afb-93ab-825579d54d8f', '100003022002', '大港油田公司所属单位信息中心助理副总师', '助理副总师', '100003022', null, '1', '1', '', '1967f63a-c96b-455d-a99c-8fbf5370a2cc');
INSERT INTO `ts_uidp_org` VALUES ('b8239d51-ca68-4f81-a485-b9b2e06e819b', '100003022003', '大港油田公司所属单位信息中心高级专家', '高级专家', '100003022', null, '1', '1', '', '1967f63a-c96b-455d-a99c-8fbf5370a2cc');
INSERT INTO `ts_uidp_org` VALUES ('f80d8103-bda3-498b-a915-9efe2a05d050', '100003022004', '大港油田公司所属单位信息中心机关科室', '机关科室', '100003022', null, '1', '1', '', '1967f63a-c96b-455d-a99c-8fbf5370a2cc');
INSERT INTO `ts_uidp_org` VALUES ('c968467b-c028-4e23-818c-d113ac8ba1ae', '100003022004001', '大港油田公司所属单位信息中心机关科室办公室', '办公室', '100003022004', null, '1', '1', '', 'f80d8103-bda3-498b-a915-9efe2a05d050');
INSERT INTO `ts_uidp_org` VALUES ('dbf05d13-76c4-48a5-84aa-f2c6b1bdb583', '100003022004002', '大港油田公司所属单位信息中心机关科室党群工作部', '党群工作部', '100003022004', null, '1', '1', '', 'f80d8103-bda3-498b-a915-9efe2a05d050');
INSERT INTO `ts_uidp_org` VALUES ('4fa7e098-c0e9-4681-899e-5c3ac8f83ff2', '100003022004003', '大港油田公司所属单位信息中心机关科室财务资产科', '财务资产科', '100003022004', null, '1', '1', '', 'f80d8103-bda3-498b-a915-9efe2a05d050');
INSERT INTO `ts_uidp_org` VALUES ('072b7712-fe6c-4eb6-b34f-c4bbae69d51f', '100003022004004', '大港油田公司所属单位信息中心机关科室企业管理科', '企业管理科', '100003022004', null, '1', '1', '', 'f80d8103-bda3-498b-a915-9efe2a05d050');
INSERT INTO `ts_uidp_org` VALUES ('93c61930-5fbe-49ad-b767-49d644d8b45d', '100003022004005', '大港油田公司所属单位信息中心机关科室人事劳资科', '人事劳资科', '100003022004', null, '1', '1', '', 'f80d8103-bda3-498b-a915-9efe2a05d050');
INSERT INTO `ts_uidp_org` VALUES ('5145c113-dafd-44e4-a73b-676db56f817e', '100003022004006', '大港油田公司所属单位信息中心机关科室运行管理科', '运行管理科', '100003022004', null, '1', '1', '', 'f80d8103-bda3-498b-a915-9efe2a05d050');
INSERT INTO `ts_uidp_org` VALUES ('8475c918-2f01-488b-bdfe-868caf15fc8b', '100003022004007', '大港油田公司所属单位信息中心机关科室安全保卫科', '安全保卫科', '100003022004', null, '1', '1', '', 'f80d8103-bda3-498b-a915-9efe2a05d050');
INSERT INTO `ts_uidp_org` VALUES ('8ce59f73-cf0a-4651-b9b5-da614286a06f', '100003022005', '大港油田公司所属单位信息中心直属部门', '直属部门', '100003022', null, '1', '1', '', '1967f63a-c96b-455d-a99c-8fbf5370a2cc');
INSERT INTO `ts_uidp_org` VALUES ('87e90bfa-66d0-4fa7-88ba-9cf67c1213bc', '100003022005001', '大港油田公司所属单位信息中心直属部门市场部', '市场部', '100003022005', null, '1', '1', '', '8ce59f73-cf0a-4651-b9b5-da614286a06f');
INSERT INTO `ts_uidp_org` VALUES ('0e15e993-7750-4383-80e5-66fe04532ce5', '100003022005002', '大港油田公司所属单位信息中心直属部门管控中心', '管控中心', '100003022005', null, '1', '1', '', '8ce59f73-cf0a-4651-b9b5-da614286a06f');
INSERT INTO `ts_uidp_org` VALUES ('27c3e3cc-6243-4c20-aac8-51e1e4f35db8', '100003022005003', '大港油田公司所属单位信息中心直属部门业务运营部', '业务运营部', '100003022005', null, '1', '1', '', '8ce59f73-cf0a-4651-b9b5-da614286a06f');
INSERT INTO `ts_uidp_org` VALUES ('9d41e9ff-ed10-4e8b-b65a-6b68dbd9d088', '100003022005004', '大港油田公司所属单位信息中心直属部门服务安全监督部', '服务安全监督部', '100003022005', null, '1', '1', '', '8ce59f73-cf0a-4651-b9b5-da614286a06f');
INSERT INTO `ts_uidp_org` VALUES ('04f62aae-a30f-41aa-9792-11281b8f3984', '100003022005005', '大港油田公司所属单位信息中心直属部门基建物资管理部', '基建物资管理部', '100003022005', null, '1', '1', '', '8ce59f73-cf0a-4651-b9b5-da614286a06f');
INSERT INTO `ts_uidp_org` VALUES ('2b99c856-d25b-4c7a-9172-84ef20c34317', '100003022006', '大港油田公司所属单位信息中心所属单位', '所属单位', '100003022', null, '1', '1', '', '1967f63a-c96b-455d-a99c-8fbf5370a2cc');
INSERT INTO `ts_uidp_org` VALUES ('63bc4496-7650-4921-b0a5-6bc4ca4ea5cf', '100003022006001', '大港油田公司所属单位信息中心所属单位大数据技术部', '大数据技术部', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('c44fa0b8-29ac-414c-8a63-c87d38b16fa5', '100003022006002', '大港油田公司所属单位信息中心所属单位物联网技术部', '物联网技术部', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('4be396e8-672f-4f04-8747-231c9811b3a0', '100003022006003', '大港油田公司所属单位信息中心所属单位勘探开发信息部', '勘探开发信息部', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('4d2b45ff-c727-4ece-aff7-e77ef175520a', '100003022006004', '大港油田公司所属单位信息中心所属单位办公信息化部', '办公信息化部', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('b5a823c8-45b5-4983-9729-9b66943956ea', '100003022006004001', '大港油田公司所属单位信息中心所属单位办公信息化部驻外人员', '驻外人员', '100003022006004', null, '1', '1', '', '4d2b45ff-c727-4ece-aff7-e77ef175520a');
INSERT INTO `ts_uidp_org` VALUES ('5d4bb604-ee98-43c3-bed2-cef4f0248fc7', '100003022006005', '大港油田公司所属单位信息中心所属单位软件工程部', '软件工程部', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('822a7cf1-3197-450c-b832-81127c41964d', '100003022006006', '大港油田公司所属单位信息中心所属单位云计算技术部', '云计算技术部', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('c44687e8-1a63-4c0a-a623-226fa797cd15', '100003022006007', '大港油田公司所属单位信息中心所属单位网络技术部', '网络技术部', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('95a144bd-bd52-44af-b696-4227d8704162', '100003022006008', '大港油田公司所属单位信息中心所属单位社区信息化部', '社区信息化部', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('1b6e9987-f7cd-4a66-8dc1-8b4b578f380b', '100003022006009', '大港油田公司所属单位信息中心所属单位北京信息服务部', '北京信息服务部', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('01f5eb2f-15c7-4070-bbe8-e5c0db175aa3', '100003022006010', '大港油田公司所属单位信息中心所属单位中心通信站', '中心通信站', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('49d05b36-ad62-4d0a-84e9-bdeb61e29464', '100003022006010001', '大港油田公司所属单位信息中心所属单位中心通信站中心营业厅', '中心营业厅', '100003022006010', null, '1', '1', '', '01f5eb2f-15c7-4070-bbe8-e5c0db175aa3');
INSERT INTO `ts_uidp_org` VALUES ('587cdae0-0ca4-4ee8-bec2-321901fa447a', '100003022006011', '大港油田公司所属单位信息中心所属单位港西通信站', '港西通信站', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('59bf5389-b051-4feb-a7f9-03d89f46eff8', '100003022006012', '大港油田公司所属单位信息中心所属单位南部通信站', '南部通信站', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('2a87d414-c345-4ea1-8c6e-6129a53f8dcd', '100003022006013', '大港油田公司所属单位信息中心所属单位综合服务部', '综合服务部', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('c4647f6a-90b7-41c2-bc86-4fbcc14a1690', '100003022006014', '大港油田公司所属单位信息中心所属单位盛通通信工程有限公司', '盛通通信工程有限公司', '100003022006', null, '1', '1', '', '2b99c856-d25b-4c7a-9172-84ef20c34317');
INSERT INTO `ts_uidp_org` VALUES ('61e8339b-976e-4c8f-9a41-35ce13ad3777', '100003023', '大港油田公司所属单位物资供销公司', '物资供销公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('652fe177-09c4-4537-9d3b-191112543f73', '100003023001', '大港油田公司所属单位物资供销公司公司领导', '公司领导', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('c80b35e2-43d7-4cfa-af04-6f4ef4cc388b', '100003023002', '大港油田公司所属单位物资供销公司经理办公室', '经理办公室', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('fbaa8dbc-f6af-4b18-b0d0-60f648b56f6f', '100003023003', '大港油田公司所属单位物资供销公司党群工作科', '党群工作科', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('b864edba-0bb0-4898-aaab-9e4639aa90bc', '100003023004', '大港油田公司所属单位物资供销公司维稳安保管理中心', '维稳安保管理中心', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('6019835b-f73c-4994-a5cd-dfa49d915fee', '100003023005', '大港油田公司所属单位物资供销公司人事劳资科', '人事劳资科', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('f5e77754-5cd0-4a8a-a1e2-5210de2f8d4d', '100003023006', '大港油田公司所属单位物资供销公司财务经营科', '财务经营科', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('d4f14497-ff97-4d54-a553-6cd2c9b28894', '100003023007', '大港油田公司所属单位物资供销公司经营计划科', '经营计划科', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('c55d5f8a-73b9-4340-b02c-cb1f1e8a6f86', '100003023008', '大港油田公司所属单位物资供销公司生产运行科', '生产运行科', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('2ff836fd-2621-435e-9d0e-e25eb515eba9', '100003023009', '大港油田公司所属单位物资供销公司监察审计部', '监察审计部', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('a32ff713-4922-4236-93e5-d62253229d0d', '100003023010', '大港油田公司所属单位物资供销公司群众工作科', '群众工作科', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('09646bdd-a9a6-45d4-95c0-83795e35d031', '100003023011', '大港油田公司所属单位物资供销公司仓储质量管理中心', '仓储质量管理中心', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('5b1cbeae-014e-4c16-af00-9728c83eb5a8', '100003023012', '大港油田公司所属单位物资供销公司保卫科', '保卫科', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('1629abd5-1496-4bb0-8bec-35173d238889', '100003023013', '大港油田公司所属单位物资供销公司冀东项目部', '冀东项目部', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('d9198917-e284-4c53-84ee-b6f5fa58c9fa', '100003023014', '大港油田公司所属单位物资供销公司质量安全环保科', '质量安全环保科', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('f00ac9ac-7737-4e61-8f33-3dc221db36e3', '100003023015', '大港油田公司所属单位物资供销公司行政管理中心', '行政管理中心', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('d493b01b-36dd-40f7-869e-014b76667d77', '100003023016', '大港油田公司所属单位物资供销公司车务管理站', '车务管理站', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('a13cc317-6267-4b2d-8946-9f839da89a98', '100003023017', '大港油田公司所属单位物资供销公司港中分公司', '港中分公司', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('d40a8637-8249-4ea5-916d-5b36fa582e8e', '100003023018', '大港油田公司所属单位物资供销公司外部市场服务中心', '外部市场服务中心', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('e5b70d06-e08a-4328-a298-0566765aca6a', '100003023019', '大港油田公司所属单位物资供销公司HSE监督中心', 'HSE监督中心', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('674f874f-09bb-4c22-9343-16921c7f1c23', '100003023020', '大港油田公司所属单位物资供销公司港东分公司', '港东分公司', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('37d389f6-69af-4449-b32a-026fa1b97d42', '100003023021', '大港油田公司所属单位物资供销公司港骅分公司', '港骅分公司', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('f271554b-b019-442d-ba44-b13564147ed6', '100003023022', '大港油田公司所属单位物资供销公司油区供销分公司', '油区供销分公司', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('ddeb0fe3-8785-4b9f-9981-cb982a8d9b20', '100003023023', '大港油田公司所属单位物资供销公司港狮分公司', '港狮分公司', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('b16f3f60-0fa1-416e-9483-5d223e7e840f', '100003023024', '大港油田公司所属单位物资供销公司港西分公司', '港西分公司', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('f8335af1-a58b-4fab-904a-679913f4dbdf', '100003023025', '大港油田公司所属单位物资供销公司矿区分公司', '矿区分公司', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('fd5ce84c-cba5-424f-ab35-99857b335a5f', '100003023026', '大港油田公司所属单位物资供销公司物资采购服务中心', '物资采购服务中心', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('fa30aff7-4f76-4ae4-82ce-912050366364', '100003023027', '大港油田公司所属单位物资供销公司炼化分公司', '炼化分公司', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('b0093667-1c9c-4756-bace-adeb4472415e', '100003023028', '大港油田公司所属单位物资供销公司质量监督中心', '质量监督中心', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('987bad57-6e6c-4c01-bf38-c650a5d7fd39', '100003023029', '大港油田公司所属单位物资供销公司油品分公司', '油品分公司', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('81b104a5-8116-4bf2-aad9-e874b5a94974', '100003023030', '大港油田公司所属单位物资供销公司专用管分公司', '专用管分公司', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('e3590fcc-f0af-423e-ac31-63a932c7aa97', '100003023031', '大港油田公司所属单位物资供销公司中心库', '中心库', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('2b5945ab-2975-4186-a72e-2fba21b435f2', '100003023032', '大港油田公司所属单位物资供销公司转运库', '转运库', '100003023', null, '1', '1', '', '61e8339b-976e-4c8f-9a41-35ce13ad3777');
INSERT INTO `ts_uidp_org` VALUES ('424f5047-fee5-4d2d-beb7-15508842197c', '100003024', '大港油田公司所属单位天津工程职业技术学院', '天津工程职业技术学院', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('0b1832d2-c260-4cde-8a8c-0312be57f850', '100003024001', '大港油田公司所属单位天津工程职业技术学院院领导', '院领导', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('8d05c0a1-c418-4177-8399-17a0736ef677', '100003024002', '大港油田公司所属单位天津工程职业技术学院办公室', '办公室', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('25016425-8316-45ba-86c1-ce68dfdc6d57', '100003024002001', '大港油田公司所属单位天津工程职业技术学院办公室档案室', '档案室', '100003024002', null, '1', '1', '', '8d05c0a1-c418-4177-8399-17a0736ef677');
INSERT INTO `ts_uidp_org` VALUES ('b2ac670e-c62c-4211-96da-c7c9a2fb9a74', '100003024002002', '大港油田公司所属单位天津工程职业技术学院办公室网络与电教中心', '网络与电教中心', '100003024002', null, '1', '1', '', '8d05c0a1-c418-4177-8399-17a0736ef677');
INSERT INTO `ts_uidp_org` VALUES ('3475a278-4230-4451-a457-b7968146b886', '100003024003', '大港油田公司所属单位天津工程职业技术学院党办', '党办', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('80101848-8dc6-42de-950c-ccebade0134f', '100003024004', '大港油田公司所属单位天津工程职业技术学院安委办', '安委办', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('69fc82cd-3f39-45ce-a6d3-55a79d7fca61', '100003024005', '大港油田公司所属单位天津工程职业技术学院思政课教研部', '思政课教研部', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('cf57904b-1580-4959-8020-128ad670b1c6', '100003024006', '大港油田公司所属单位天津工程职业技术学院维稳办(工会)', '维稳办(工会)', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('71eedc5f-67d7-438d-b646-8895d1396df6', '100003024007', '大港油田公司所属单位天津工程职业技术学院教务处（国际交流处）', '教务处（国际交流处）', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('b6c78162-d13e-44f2-90a8-ee1ebf6ed115', '100003024008', '大港油田公司所属单位天津工程职业技术学院财务处', '财务处', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('fce67321-6786-4627-aafd-20fecb5ee98d', '100003024009', '大港油田公司所属单位天津工程职业技术学院科研处', '科研处', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('d5f28297-6803-4958-aca6-c5c746cc20ac', '100003024010', '大港油田公司所属单位天津工程职业技术学院学生处（团委）', '学生处（团委）', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('374b9388-f8ce-4a70-9938-30e6470fe570', '100003024011', '大港油田公司所属单位天津工程职业技术学院保卫处', '保卫处', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('bd5ef78b-ca29-411d-ae06-9c15034393b1', '100003024012', '大港油田公司所属单位天津工程职业技术学院管理系', '管理系', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('a05cad0e-5623-4a6e-ae85-2f8f0a55644e', '100003024013', '大港油田公司所属单位天津工程职业技术学院机电系', '机电系', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('2b59134b-a3bf-4204-89bb-e8c70e0066f2', '100003024014', '大港油田公司所属单位天津工程职业技术学院建工系', '建工系', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('1e810941-59e2-4061-a320-c75b051a3c96', '100003024015', '大港油田公司所属单位天津工程职业技术学院石化系', '石化系', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('759e37d6-233b-4321-adcd-6253ce0d55ec', '100003024016', '大港油田公司所属单位天津工程职业技术学院艺术系', '艺术系', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('709e6644-7789-44f6-abb2-567d0b3fa597', '100003024017', '大港油田公司所属单位天津工程职业技术学院图书馆', '图书馆', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('0eaa9e64-b68e-4cef-ba6c-2a6f18a3195c', '100003024018', '大港油田公司所属单位天津工程职业技术学院人事劳资处', '人事劳资处', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('bdbbf7cb-58ee-42fc-91cb-c3667845c688', '100003024019', '大港油田公司所属单位天津工程职业技术学院成人教育处', '成人教育处', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('ba65ba4c-c9c1-445a-b38b-bc55a6dad416', '100003024020', '大港油田公司所属单位天津工程职业技术学院教学办公室', '教学办公室', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('be914e94-c554-4888-8cd1-c27a2c4bedab', '100003024021', '大港油田公司所属单位天津工程职业技术学院信息工程系', '信息工程系', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('a94a771f-2c7d-41fc-b0de-07dd59eb8ca7', '100003024022', '大港油田公司所属单位天津工程职业技术学院招生与就业办公室', '招生与就业办公室', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('b43bb018-1b14-4f3a-9fdb-71f86c74e0f3', '100003024023', '大港油田公司所属单位天津工程职业技术学院总务处(校产办)', '总务处(校产办)', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('1d5aafa1-2fe3-4c2c-8f9b-d9b48d8c9f89', '100003024024', '大港油田公司所属单位天津工程职业技术学院培训处', '培训处', '100003024', null, '1', '1', '', '424f5047-fee5-4d2d-beb7-15508842197c');
INSERT INTO `ts_uidp_org` VALUES ('3bb7fb24-66a0-4a16-9389-4d360602be61', '100003025', '大港油田公司所属单位接待服务中心', '接待服务中心', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('b343ab12-aeaa-411e-ac9e-82421ae57920', '100003025001', '大港油田公司所属单位接待服务中心中心领导', '中心领导', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('1caaef84-d5c5-417a-baa3-5f77a9127079', '100003025002', '大港油田公司所属单位接待服务中心主任助理', '主任助理', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('92c4cc4d-e575-4c67-9a0e-951fdd05c4f7', '100003025003', '大港油田公司所属单位接待服务中心综合办公室', '综合办公室', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('5dde084e-f134-497c-9115-dfd4f61e229d', '100003025004', '大港油田公司所属单位接待服务中心财务资产科', '财务资产科', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('1d4ced6e-63ad-4a4a-a66e-1753013f35ef', '100003025005', '大港油田公司所属单位接待服务中心安全生产科', '安全生产科', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('d7027f4b-a336-4ff3-a0ee-60b9d17b5e51', '100003025006', '大港油田公司所属单位接待服务中心人事经营科', '人事经营科', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('33fdcb06-b4b0-4a2a-81cf-eb89fdb76dcc', '100003025007', '大港油田公司所属单位接待服务中心安全监督站', '安全监督站', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('d4908efc-670a-4732-a2eb-7d11df146d3e', '100003025008', '大港油田公司所属单位接待服务中心市场服务部', '市场服务部', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('0918f0c4-1760-429c-a55d-3e966de5784d', '100003025009', '大港油田公司所属单位接待服务中心油田宾馆总务部', '油田宾馆总务部', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('1ff303cc-63b1-4389-b66d-96326feb62a8', '100003025010', '大港油田公司所属单位接待服务中心油田宾馆客房部', '油田宾馆客房部', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('d165acfb-78f2-4b38-8432-0c0f6cf633b9', '100003025011', '大港油田公司所属单位接待服务中心油田宾馆餐饮部', '油田宾馆餐饮部', '100003025', null, '1', '1', '', '3bb7fb24-66a0-4a16-9389-4d360602be61');
INSERT INTO `ts_uidp_org` VALUES ('9a42a9d5-763a-4424-b05b-01811fda2ce0', '100003026', '大港油田公司所属单位车务管理中心(客运公司)', '车务管理中心(客运公司)', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('e9eb3f71-aedd-4884-9030-51676dc6ff0d', '100003026001', '大港油田公司所属单位车务管理中心(客运公司)中心领导', '中心领导', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('27811a3d-178a-41cb-b4a0-5a3dfdcbfa31', '100003026002', '大港油田公司所属单位车务管理中心(客运公司)经理办公室', '经理办公室', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('ff105c32-1c6e-4001-b949-ee59e22bbc1b', '100003026003', '大港油田公司所属单位车务管理中心(客运公司)党群工作科', '党群工作科', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('f60aeebd-529c-41cb-96e5-7573b89d6355', '100003026004', '大港油田公司所属单位车务管理中心(客运公司)人事劳资科', '人事劳资科', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('fd35b42d-64ba-4fbc-a239-1857c802252e', '100003026005', '大港油田公司所属单位车务管理中心(客运公司)生产运行科', '生产运行科', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('d32996ce-bac1-4abe-8ba8-8439efa9473c', '100003026006', '大港油田公司所属单位车务管理中心(客运公司)质量安全环保科', '质量安全环保科', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('39330780-7199-4335-94a9-549b5011d7df', '100003026007', '大港油田公司所属单位车务管理中心(客运公司)财务资产科', '财务资产科', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('9c6ec76b-5421-4372-9525-fad19dd1b399', '100003026008', '大港油田公司所属单位车务管理中心(客运公司)物资装备科', '物资装备科', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('dc3b4468-b4b6-48cf-8fe3-0eb3222707ae', '100003026009', '大港油田公司所属单位车务管理中心(客运公司)安全监督站', '安全监督站', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('baf10b5e-303b-4849-a17c-7df9c6398bcc', '100003026010', '大港油田公司所属单位车务管理中心(客运公司)第一分公司', '第一分公司', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('64e48af9-6e60-4654-adfa-77214057e813', '100003026011', '大港油田公司所属单位车务管理中心(客运公司)第二分公司', '第二分公司', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('ee490b3a-2961-4933-9d93-403e84c845c0', '100003026012', '大港油田公司所属单位车务管理中心(客运公司)第三分公司', '第三分公司', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('eac413cd-bae4-4701-afaf-35c08cba7efe', '100003026013', '大港油田公司所属单位车务管理中心(客运公司)第四分公司', '第四分公司', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('2ff8e811-0036-459c-b662-c28655713c2c', '100003026014', '大港油田公司所属单位车务管理中心(客运公司)第五分公司', '第五分公司', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('8e04c6d2-aadd-40c0-bed1-cc79c5f5d596', '100003026015', '大港油田公司所属单位车务管理中心(客运公司)第六分公司', '第六分公司', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('fd9505f9-d7f7-44e8-9a50-b7c3017d3770', '100003026016', '大港油田公司所属单位车务管理中心(客运公司)综合服务队', '综合服务队', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('09483748-0a2e-408f-a77c-8fa1cbcc5e81', '100003026017', '大港油田公司所属单位车务管理中心(客运公司)多种经营企业', '多种经营企业', '100003026', null, '1', '1', '', '9a42a9d5-763a-4424-b05b-01811fda2ce0');
INSERT INTO `ts_uidp_org` VALUES ('093840f6-e9a2-44b2-9678-47ce0e79cb26', '100003026017001', '大港油田公司所属单位车务管理中心(客运公司)多种经营企业华安顺达公司', '华安顺达公司', '100003026017', null, '1', '1', '', '09483748-0a2e-408f-a77c-8fa1cbcc5e81');
INSERT INTO `ts_uidp_org` VALUES ('2ef024fe-51cd-49de-8f69-e21f3e23b6af', '100003027', '大港油田公司所属单位物业服务公司', '物业服务公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('4ecabf29-71d2-4e44-92b8-946098fe7669', '100003027001', '大港油田公司所属单位物业服务公司第一矿区管理服务公司', '第一矿区管理服务公司', '100003027', null, '1', '1', '', '2ef024fe-51cd-49de-8f69-e21f3e23b6af');
INSERT INTO `ts_uidp_org` VALUES ('089695c1-b39b-4293-95f5-0c49e5e5070c', '100003027001001', '大港油田公司所属单位物业服务公司第一矿区管理服务公司公司领导', '公司领导', '100003027001', null, '1', '1', '', '4ecabf29-71d2-4e44-92b8-946098fe7669');
INSERT INTO `ts_uidp_org` VALUES ('cdf85561-8e69-42cc-8a35-80b47e55adf4', '100003027001002', '大港油田公司所属单位物业服务公司第一矿区管理服务公司公司助理', '公司助理', '100003027001', null, '1', '1', '', '4ecabf29-71d2-4e44-92b8-946098fe7669');
INSERT INTO `ts_uidp_org` VALUES ('5784e432-adb2-48d5-86f7-c2706f4e1b2a', '100003027001003', '大港油田公司所属单位物业服务公司第一矿区管理服务公司机关科室', '机关科室', '100003027001', null, '1', '1', '', '4ecabf29-71d2-4e44-92b8-946098fe7669');
INSERT INTO `ts_uidp_org` VALUES ('6e7cc3e2-8218-42e8-b820-6685a971cc83', '100003027001003001', '大港油田公司所属单位物业服务公司第一矿区管理服务公司机关科室经理办公室', '经理办公室', '100003027001003', null, '1', '1', '', '5784e432-adb2-48d5-86f7-c2706f4e1b2a');
INSERT INTO `ts_uidp_org` VALUES ('f9b05c67-c099-48d8-8851-5f35cc14d992', '100003027001003002', '大港油田公司所属单位物业服务公司第一矿区管理服务公司机关科室党群工作科', '党群工作科', '100003027001003', null, '1', '1', '', '5784e432-adb2-48d5-86f7-c2706f4e1b2a');
INSERT INTO `ts_uidp_org` VALUES ('b44bb034-9681-4db4-b515-5de3d4de1110', '100003027001003003', '大港油田公司所属单位物业服务公司第一矿区管理服务公司机关科室经营计划科', '经营计划科', '100003027001003', null, '1', '1', '', '5784e432-adb2-48d5-86f7-c2706f4e1b2a');
INSERT INTO `ts_uidp_org` VALUES ('adc1810f-88e9-44e5-ad28-e77ac9da71f6', '100003027001003004', '大港油田公司所属单位物业服务公司第一矿区管理服务公司机关科室生产运行科', '生产运行科', '100003027001003', null, '1', '1', '', '5784e432-adb2-48d5-86f7-c2706f4e1b2a');
INSERT INTO `ts_uidp_org` VALUES ('0ab2d14d-ae44-4b2e-9021-cbfbe21e84c6', '100003027001003005', '大港油田公司所属单位物业服务公司第一矿区管理服务公司机关科室质量安全环保科', '质量安全环保科', '100003027001003', null, '1', '1', '', '5784e432-adb2-48d5-86f7-c2706f4e1b2a');
INSERT INTO `ts_uidp_org` VALUES ('4d2ec13e-3fc3-4dc7-b7d4-06e36cf1bfed', '100003027001003006', '大港油田公司所属单位物业服务公司第一矿区管理服务公司机关科室财务资产科', '财务资产科', '100003027001003', null, '1', '1', '', '5784e432-adb2-48d5-86f7-c2706f4e1b2a');
INSERT INTO `ts_uidp_org` VALUES ('c633009d-5c45-46f9-85df-7cf8ab71b5f5', '100003027001003007', '大港油田公司所属单位物业服务公司第一矿区管理服务公司机关科室人事劳资科', '人事劳资科', '100003027001003', null, '1', '1', '', '5784e432-adb2-48d5-86f7-c2706f4e1b2a');
INSERT INTO `ts_uidp_org` VALUES ('052e0612-78aa-4efa-886c-86a9ebc7498c', '100003027001003008', '大港油田公司所属单位物业服务公司第一矿区管理服务公司机关科室物业管理科', '物业管理科', '100003027001003', null, '1', '1', '', '5784e432-adb2-48d5-86f7-c2706f4e1b2a');
INSERT INTO `ts_uidp_org` VALUES ('e6a79516-909b-4c16-b1fe-730235b2c64a', '100003027001004', '大港油田公司所属单位物业服务公司第一矿区管理服务公司直附属部门', '直附属部门', '100003027001', null, '1', '1', '', '4ecabf29-71d2-4e44-92b8-946098fe7669');
INSERT INTO `ts_uidp_org` VALUES ('43150508-1006-4ff8-9e2f-67a9bea88597', '100003027001004001', '大港油田公司所属单位物业服务公司第一矿区管理服务公司直附属部门矿区服务鉴定站', '矿区服务鉴定站', '100003027001004', null, '1', '1', '', 'e6a79516-909b-4c16-b1fe-730235b2c64a');
INSERT INTO `ts_uidp_org` VALUES ('1be41024-449b-4e41-bb4d-c2856f95f922', '100003027001004002', '大港油田公司所属单位物业服务公司第一矿区管理服务公司直附属部门信息档案室', '信息档案室', '100003027001004', null, '1', '1', '', 'e6a79516-909b-4c16-b1fe-730235b2c64a');
INSERT INTO `ts_uidp_org` VALUES ('da841feb-91b8-4291-b132-82d86fd1d7b2', '100003027001004003', '大港油田公司所属单位物业服务公司第一矿区管理服务公司直附属部门基建管理站', '基建管理站', '100003027001004', null, '1', '1', '', 'e6a79516-909b-4c16-b1fe-730235b2c64a');
INSERT INTO `ts_uidp_org` VALUES ('81f71dcf-8079-4704-8371-eebe546ae4a6', '100003027001004004', '大港油田公司所属单位物业服务公司第一矿区管理服务公司直附属部门维护稳定办公室', '维护稳定办公室', '100003027001004', null, '1', '1', '', 'e6a79516-909b-4c16-b1fe-730235b2c64a');
INSERT INTO `ts_uidp_org` VALUES ('9c388390-0e00-4cfb-9def-2df52618fa8a', '100003027001004005', '大港油田公司所属单位物业服务公司第一矿区管理服务公司直附属部门安全监督站', '安全监督站', '100003027001004', null, '1', '1', '', 'e6a79516-909b-4c16-b1fe-730235b2c64a');
INSERT INTO `ts_uidp_org` VALUES ('fa9aea99-7c35-49b7-8afd-03f8cadc5ff0', '100003027001004006', '大港油田公司所属单位物业服务公司第一矿区管理服务公司直附属部门服务监督站', '服务监督站', '100003027001004', null, '1', '1', '', 'e6a79516-909b-4c16-b1fe-730235b2c64a');
INSERT INTO `ts_uidp_org` VALUES ('28cbc1cc-3f53-492d-b7fc-0fc4225da12e', '100003027001005', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位', '所属单位', '100003027001', null, '1', '1', '', '4ecabf29-71d2-4e44-92b8-946098fe7669');
INSERT INTO `ts_uidp_org` VALUES ('e418356e-8091-4c66-9622-aa2c8d65a261', '100003027001005001', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位车务管理站', '车务管理站', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('7aac96fb-0959-4f9a-97a9-0cc366fdae66', '100003027001005002', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位治安管理中心', '治安管理中心', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('560a2682-b6a3-4a9b-8e72-90d35d9a8749', '100003027001005003', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位高层楼宇物业管理公司', '高层楼宇物业管理公司', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('3475a541-5e80-4e46-97c6-365c6b3b9404', '100003027001005004', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位东苑物业管理公司', '东苑物业管理公司', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('a44030e9-168b-4918-983e-0624a00495a6', '100003027001005005', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位园林绿化公司', '园林绿化公司', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('49d603c1-f4f6-46e3-8ecb-94e0af077cf8', '100003027001005006', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位西苑物业管理公司', '西苑物业管理公司', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('e718f2fa-bb07-4000-a09f-1fceb460e278', '100003027001005007', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位托幼服务中心', '托幼服务中心', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('49a7f8f1-e20b-4038-b8be-cbf2ab3a8219', '100003027001005008', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位北苑物业管理公司', '北苑物业管理公司', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('9d518bfc-29eb-42c3-b2ed-5d465be27a4f', '100003027001005009', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位公共物业管理公司', '公共物业管理公司', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('e88291a6-52a6-41e8-9d24-3f609b1ae1bf', '100003027001005010', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位隆达实业公司', '隆达实业公司', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('f4049ddd-67f5-4174-bd5a-c47fc430585d', '100003027001005011', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位房屋管理中心', '房屋管理中心', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('46471e0e-c06a-4c7e-8110-f0e2e5230203', '100003027001005012', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位收费服务中心', '收费服务中心', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('4420d8c9-985a-4752-b9c7-93462403e6aa', '100003027001005013', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位北区项目部', '北区项目部', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('9bc8e0db-7cbb-441b-b558-3292195f5ae7', '100003027001005014', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位中区项目部', '中区项目部', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('2e929b66-54ec-4f36-9280-070e049d07a5', '100003027001005015', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位西苑项目部', '西苑项目部', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('f4a540dd-8322-410e-ba17-410e74e36f3e', '100003027001005016', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位团结项目部', '团结项目部', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('0582ff49-604f-4a40-bfb1-2a065cfb79a8', '100003027001005017', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位新兴项目部', '新兴项目部', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('85d8ee78-c119-44aa-9f3d-33237c2d4fe1', '100003027001005018', '大港油田公司所属单位物业服务公司第一矿区管理服务公司所属单位北苑项目部', '北苑项目部', '100003027001005', null, '1', '1', '', '28cbc1cc-3f53-492d-b7fc-0fc4225da12e');
INSERT INTO `ts_uidp_org` VALUES ('9fdc3fb5-02de-4266-b9e9-a8f062c969fe', '100003027002', '大港油田公司所属单位物业服务公司第四矿区管理服务公司', '第四矿区管理服务公司', '100003027', null, '1', '1', '', '2ef024fe-51cd-49de-8f69-e21f3e23b6af');
INSERT INTO `ts_uidp_org` VALUES ('e4724280-1355-4c8c-8d52-60764dcef46d', '100003027002001', '大港油田公司所属单位物业服务公司第四矿区管理服务公司公司领导', '公司领导', '100003027002', null, '1', '1', '', '9fdc3fb5-02de-4266-b9e9-a8f062c969fe');
INSERT INTO `ts_uidp_org` VALUES ('50707f9d-daac-4037-bbb0-99ac0b605374', '100003027002002', '大港油田公司所属单位物业服务公司第四矿区管理服务公司机关科室', '机关科室', '100003027002', null, '1', '1', '', '9fdc3fb5-02de-4266-b9e9-a8f062c969fe');
INSERT INTO `ts_uidp_org` VALUES ('c9fe7752-6438-409a-8a81-ef866c6d8606', '100003027002002001', '大港油田公司所属单位物业服务公司第四矿区管理服务公司机关科室综合办公室', '综合办公室', '100003027002002', null, '1', '1', '', '50707f9d-daac-4037-bbb0-99ac0b605374');
INSERT INTO `ts_uidp_org` VALUES ('d3a4454f-b156-43b0-9d7c-fc7b487a7205', '100003027002002002', '大港油田公司所属单位物业服务公司第四矿区管理服务公司机关科室安全环保科', '安全环保科', '100003027002002', null, '1', '1', '', '50707f9d-daac-4037-bbb0-99ac0b605374');
INSERT INTO `ts_uidp_org` VALUES ('7ecb3b9f-19e2-40d8-9d8a-b49335440ce4', '100003027002002003', '大港油田公司所属单位物业服务公司第四矿区管理服务公司机关科室财务资产科', '财务资产科', '100003027002002', null, '1', '1', '', '50707f9d-daac-4037-bbb0-99ac0b605374');
INSERT INTO `ts_uidp_org` VALUES ('e831183c-b9d2-495b-a6a8-985faa9bb932', '100003027002002004', '大港油田公司所属单位物业服务公司第四矿区管理服务公司机关科室生产计划科', '生产计划科', '100003027002002', null, '1', '1', '', '50707f9d-daac-4037-bbb0-99ac0b605374');
INSERT INTO `ts_uidp_org` VALUES ('82e6c11a-afe9-402c-85f2-f736c79a413c', '100003027002002004001', '大港油田公司所属单位物业服务公司第四矿区管理服务公司机关科室生产计划科热线服务中心', '热线服务中心', '100003027002002004', null, '1', '1', '', 'e831183c-b9d2-495b-a6a8-985faa9bb932');
INSERT INTO `ts_uidp_org` VALUES ('806238fa-c0a7-4048-a9a5-579dd729099f', '100003027002002005', '大港油田公司所属单位物业服务公司第四矿区管理服务公司机关科室人事劳资科', '人事劳资科', '100003027002002', null, '1', '1', '', '50707f9d-daac-4037-bbb0-99ac0b605374');
INSERT INTO `ts_uidp_org` VALUES ('4a2221e1-9280-4a39-b7a5-8a74b680c9d7', '100003027002003', '大港油田公司所属单位物业服务公司第四矿区管理服务公司直属单位', '直属单位', '100003027002', null, '1', '1', '', '9fdc3fb5-02de-4266-b9e9-a8f062c969fe');
INSERT INTO `ts_uidp_org` VALUES ('4cdf4354-edc0-44aa-beef-0f7325212935', '100003027002003001', '大港油田公司所属单位物业服务公司第四矿区管理服务公司直属单位安全服务监督站', '安全服务监督站', '100003027002003', null, '1', '1', '', '4a2221e1-9280-4a39-b7a5-8a74b680c9d7');
INSERT INTO `ts_uidp_org` VALUES ('5971ee9f-3a74-4525-9496-94694ea241ac', '100003027002004', '大港油田公司所属单位物业服务公司第四矿区管理服务公司基层单位', '基层单位', '100003027002', null, '1', '1', '', '9fdc3fb5-02de-4266-b9e9-a8f062c969fe');
INSERT INTO `ts_uidp_org` VALUES ('0f8ddd9d-8e97-4f77-968e-ebb0078e25db', '100003027002004001', '大港油田公司所属单位物业服务公司第四矿区管理服务公司基层单位物业管理公司', '物业管理公司', '100003027002004', null, '1', '1', '', '5971ee9f-3a74-4525-9496-94694ea241ac');
INSERT INTO `ts_uidp_org` VALUES ('abae2d21-d544-4c61-ae65-335e1c696be2', '100003027002004002', '大港油田公司所属单位物业服务公司第四矿区管理服务公司基层单位综合车队', '综合车队', '100003027002004', null, '1', '1', '', '5971ee9f-3a74-4525-9496-94694ea241ac');
INSERT INTO `ts_uidp_org` VALUES ('754b2423-716b-457d-baec-198115708f60', '100003028', '大港油田公司所属单位市政服务公司', '市政服务公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('80732be4-b936-4b67-8448-8f3a8d792ee3', '100003028001', '大港油田公司所属单位市政服务公司公司领导', '公司领导', '100003028', null, '1', '1', '', '754b2423-716b-457d-baec-198115708f60');
INSERT INTO `ts_uidp_org` VALUES ('26c3513f-9a04-4c52-b7c5-1c49ffe3939a', '100003028002', '大港油田公司所属单位市政服务公司老领导', '老领导', '100003028', null, '1', '1', '', '754b2423-716b-457d-baec-198115708f60');
INSERT INTO `ts_uidp_org` VALUES ('206eb142-cb51-4159-b97b-2d409cec6154', '100003028003', '大港油田公司所属单位市政服务公司经理助理', '经理助理', '100003028', null, '1', '1', '', '754b2423-716b-457d-baec-198115708f60');
INSERT INTO `ts_uidp_org` VALUES ('13641149-f434-46de-bdf9-71db19b81080', '100003028004', '大港油田公司所属单位市政服务公司机关科室', '机关科室', '100003028', null, '1', '1', '', '754b2423-716b-457d-baec-198115708f60');
INSERT INTO `ts_uidp_org` VALUES ('00e9705d-1c59-4953-89a2-b4d02972e539', '100003028004001', '大港油田公司所属单位市政服务公司机关科室经理办公室', '经理办公室', '100003028004', null, '1', '1', '', '13641149-f434-46de-bdf9-71db19b81080');
INSERT INTO `ts_uidp_org` VALUES ('5c192725-3c0d-41fd-840e-82bc82e1d696', '100003028004002', '大港油田公司所属单位市政服务公司机关科室党群工作科', '党群工作科', '100003028004', null, '1', '1', '', '13641149-f434-46de-bdf9-71db19b81080');
INSERT INTO `ts_uidp_org` VALUES ('58fe91cd-ac13-4be4-83d1-cda7b995ff83', '100003028004003', '大港油田公司所属单位市政服务公司机关科室人事劳资科', '人事劳资科', '100003028004', null, '1', '1', '', '13641149-f434-46de-bdf9-71db19b81080');
INSERT INTO `ts_uidp_org` VALUES ('43f2ae77-af76-4b16-a28a-ee989e6ed658', '100003028004004', '大港油田公司所属单位市政服务公司机关科室财务资产科', '财务资产科', '100003028004', null, '1', '1', '', '13641149-f434-46de-bdf9-71db19b81080');
INSERT INTO `ts_uidp_org` VALUES ('e6a3dea4-5ad6-4c25-8e7e-909f8e0b2c51', '100003028004005', '大港油田公司所属单位市政服务公司机关科室经营计划科', '经营计划科', '100003028004', null, '1', '1', '', '13641149-f434-46de-bdf9-71db19b81080');
INSERT INTO `ts_uidp_org` VALUES ('6e080435-d4f5-4ebc-bfbc-ca5ab65afc63', '100003028004006', '大港油田公司所属单位市政服务公司机关科室生产运行科', '生产运行科', '100003028004', null, '1', '1', '', '13641149-f434-46de-bdf9-71db19b81080');
INSERT INTO `ts_uidp_org` VALUES ('c4e684fe-f0c5-4426-b282-56ddc28c3069', '100003028004007', '大港油田公司所属单位市政服务公司机关科室质量安全环保科', '质量安全环保科', '100003028004', null, '1', '1', '', '13641149-f434-46de-bdf9-71db19b81080');
INSERT INTO `ts_uidp_org` VALUES ('80bb5e87-46fd-403e-bec0-cc0f040db480', '100003028004008', '大港油田公司所属单位市政服务公司机关科室市政管理科', '市政管理科', '100003028004', null, '1', '1', '', '13641149-f434-46de-bdf9-71db19b81080');
INSERT INTO `ts_uidp_org` VALUES ('c65ddc92-ad23-4b0b-aa8f-9fddeee79d82', '100003028004009', '大港油田公司所属单位市政服务公司机关科室托幼管理科', '托幼管理科', '100003028004', null, '1', '1', '', '13641149-f434-46de-bdf9-71db19b81080');
INSERT INTO `ts_uidp_org` VALUES ('1d845efa-536d-4e39-921b-afb21777d814', '100003028005', '大港油田公司所属单位市政服务公司直属单位', '直属单位', '100003028', null, '1', '1', '', '754b2423-716b-457d-baec-198115708f60');
INSERT INTO `ts_uidp_org` VALUES ('3eac88e2-8f6a-4ef5-80f4-9d1bfd95a2ec', '100003028005001', '大港油田公司所属单位市政服务公司直属单位基建管理站', '基建管理站', '100003028005', null, '1', '1', '', '1d845efa-536d-4e39-921b-afb21777d814');
INSERT INTO `ts_uidp_org` VALUES ('9d558f22-f1c0-4e59-84d1-57ffa33ed3b5', '100003028005002', '大港油田公司所属单位市政服务公司直属单位信息档案室', '信息档案室', '100003028005', null, '1', '1', '', '1d845efa-536d-4e39-921b-afb21777d814');
INSERT INTO `ts_uidp_org` VALUES ('19f25e7e-513f-43f2-9461-9914833db5e1', '100003028005003', '大港油田公司所属单位市政服务公司直属单位维护稳定办公室', '维护稳定办公室', '100003028005', null, '1', '1', '', '1d845efa-536d-4e39-921b-afb21777d814');
INSERT INTO `ts_uidp_org` VALUES ('b061b4dc-3644-4c3f-87e5-d016772822be', '100003028005004', '大港油田公司所属单位市政服务公司直属单位安全服务监督站', '安全服务监督站', '100003028005', null, '1', '1', '', '1d845efa-536d-4e39-921b-afb21777d814');
INSERT INTO `ts_uidp_org` VALUES ('935698e8-213f-4833-8094-9b39670ce54c', '100003028006', '大港油田公司所属单位市政服务公司所属单位', '所属单位', '100003028', null, '1', '1', '', '754b2423-716b-457d-baec-198115708f60');
INSERT INTO `ts_uidp_org` VALUES ('d1e59e3e-387f-4e0f-8948-45a3c0b171a5', '100003028006001', '大港油田公司所属单位市政服务公司所属单位房屋管理中心', '房屋管理中心', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('4cc8e2e7-675a-4baa-b6b8-628171d7f8c7', '100003028006002', '大港油田公司所属单位市政服务公司所属单位公共物业公司', '公共物业公司', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('48497a9f-4482-486c-9a98-9be208887191', '100003028006003', '大港油田公司所属单位市政服务公司所属单位市政园林一公司', '市政园林一公司', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('b1c89c42-89f2-471d-b23c-a2f593a8f6e5', '100003028006004', '大港油田公司所属单位市政服务公司所属单位市政园林二公司', '市政园林二公司', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('40b490d2-da9e-4833-ba4d-7a8451f61f5c', '100003028006005', '大港油田公司所属单位市政服务公司所属单位市政园林三公司', '市政园林三公司', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('2ae2d039-93eb-43eb-bc8b-bb2ff0a0728b', '100003028006006', '大港油田公司所属单位市政服务公司所属单位车务管理一站', '车务管理一站', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('445e36d8-e36a-4064-a632-958f7e819605', '100003028006007', '大港油田公司所属单位市政服务公司所属单位车务管理二站', '车务管理二站', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('e103ba69-d188-4acb-8067-6106d4f3398a', '100003028006008', '大港油田公司所属单位市政服务公司所属单位治安管理一中心', '治安管理一中心', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('ee0c936b-a150-4089-b262-dca85d4501a7', '100003028006009', '大港油田公司所属单位市政服务公司所属单位治安管理二中心', '治安管理二中心', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('c116754f-fb79-4144-99d6-575bc94abe42', '100003028006010', '大港油田公司所属单位市政服务公司所属单位托幼服务一中心', '托幼服务一中心', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('63a6fdde-ef0f-4e1d-a05f-5435dffc9c64', '100003028006011', '大港油田公司所属单位市政服务公司所属单位托幼服务二中心', '托幼服务二中心', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('82594707-d27f-47c0-ad87-8e2da8883c44', '100003028006012', '大港油田公司所属单位市政服务公司所属单位托幼服务三中心', '托幼服务三中心', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('65a64407-04bd-4d2c-bd24-614ea627b40d', '100003028006013', '大港油田公司所属单位市政服务公司所属单位工贸中心(滨海福利厂)', '工贸中心(滨海福利厂)', '100003028006', null, '1', '1', '', '935698e8-213f-4833-8094-9b39670ce54c');
INSERT INTO `ts_uidp_org` VALUES ('0e220e70-dd67-4806-96ce-e35cbd0c363f', '100003028007', '大港油田公司所属单位市政服务公司第二矿区管理服务公司', '第二矿区管理服务公司', '100003028', null, '1', '1', '', '754b2423-716b-457d-baec-198115708f60');
INSERT INTO `ts_uidp_org` VALUES ('755cf8cf-871c-4cf9-b7da-983dfb7c5651', '100003028007001', '大港油田公司所属单位市政服务公司第二矿区管理服务公司公司领导', '公司领导', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('f292cf83-5998-4c79-b58b-39a6a4c31e7a', '100003028007002', '大港油田公司所属单位市政服务公司第二矿区管理服务公司经理助理', '经理助理', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('7574020d-e36c-42d2-898a-52cf48358d2b', '100003028007003', '大港油田公司所属单位市政服务公司第二矿区管理服务公司经理办公室', '经理办公室', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('d231c006-8c52-4e5a-93be-e900128fea23', '100003028007004', '大港油田公司所属单位市政服务公司第二矿区管理服务公司党群工作科', '党群工作科', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('e68fd2c0-be10-46e7-b70a-a80d35f5061b', '100003028007005', '大港油田公司所属单位市政服务公司第二矿区管理服务公司人事劳资科', '人事劳资科', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('4d8757c8-da75-4d13-b101-a701c083e1c6', '100003028007006', '大港油田公司所属单位市政服务公司第二矿区管理服务公司财务资产科', '财务资产科', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('91e94c3b-44dc-4077-9046-9e0d104cb490', '100003028007007', '大港油田公司所属单位市政服务公司第二矿区管理服务公司物业管理科', '物业管理科', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('d59abc23-f4fc-4465-af7f-e222ed223dcf', '100003028007008', '大港油田公司所属单位市政服务公司第二矿区管理服务公司安全服务监督站', '安全服务监督站', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('51733b4f-587c-4972-aa02-607eeb9365c9', '100003028007009', '大港油田公司所属单位市政服务公司第二矿区管理服务公司经营计划科', '经营计划科', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('095a3312-3def-4a57-b7a0-30c7f9a51b3d', '100003028007010', '大港油田公司所属单位市政服务公司第二矿区管理服务公司质量安全环保科', '质量安全环保科', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('b5c380bd-5c04-4c78-b932-3b0b857edae4', '100003028007011', '大港油田公司所属单位市政服务公司第二矿区管理服务公司维护稳定办公室', '维护稳定办公室', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('937d6744-79ab-48ad-aa03-1b3626d1e807', '100003028007012', '大港油田公司所属单位市政服务公司第二矿区管理服务公司生产运行科', '生产运行科', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('a8aee274-61a6-401c-a144-1e9285cb3f51', '100003028007013', '大港油田公司所属单位市政服务公司第二矿区管理服务公司治安管理中心', '治安管理中心', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('bb54573b-4f2a-4537-ba02-6ffd556adcd7', '100003028007014', '大港油田公司所属单位市政服务公司第二矿区管理服务公司金百邦物业管理公司', '金百邦物业管理公司', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('5bb71cd8-b940-4d67-8182-5c4874b8fcae', '100003028007014001', '大港油田公司所属单位市政服务公司第二矿区管理服务公司金百邦物业管理公司心港项目部', '心港项目部', '100003028007014', null, '1', '1', '', 'bb54573b-4f2a-4537-ba02-6ffd556adcd7');
INSERT INTO `ts_uidp_org` VALUES ('c153369c-dc4f-4ed9-b8d6-d3fe9c966bc6', '100003028007015', '大港油田公司所属单位市政服务公司第二矿区管理服务公司房屋管理中心', '房屋管理中心', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('2ee5d88d-d282-4d51-9dd4-f022332a85c7', '100003028007016', '大港油田公司所属单位市政服务公司第二矿区管理服务公司花园物业管理公司', '花园物业管理公司', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('2baaed38-8680-4ad6-9c2a-0f2467a4a498', '100003028007017', '大港油田公司所属单位市政服务公司第二矿区管理服务公司车务管理站', '车务管理站', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('92f2f91f-c282-499d-88fd-48d833e9c800', '100003028007018', '大港油田公司所属单位市政服务公司第二矿区管理服务公司托幼服务中心', '托幼服务中心', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('628ddddb-13a5-4320-abc2-dd81ef37dd6f', '100003028007019', '大港油田公司所属单位市政服务公司第二矿区管理服务公司安泰物业管理公司', '安泰物业管理公司', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('ac64f764-3b71-40ac-b374-4e9992102c17', '100003028007020', '大港油田公司所属单位市政服务公司第二矿区管理服务公司幸福物业管理公司', '幸福物业管理公司', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('cf2f1f6a-e811-435a-a70c-6f069573c434', '100003028007021', '大港油田公司所属单位市政服务公司第二矿区管理服务公司信息档案室', '信息档案室', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('6ec69a50-f58c-4913-bfbd-86eb4a67e5ab', '100003028007022', '大港油田公司所属单位市政服务公司第二矿区管理服务公司基建管理站', '基建管理站', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('f69ab127-163e-4012-b382-d202b8d9ecdd', '100003028007023', '大港油田公司所属单位市政服务公司第二矿区管理服务公司市政园林管理公司', '市政园林管理公司', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('6cbd6c7e-e356-4bd7-a284-0cf7f274fa20', '100003028007024', '大港油田公司所属单位市政服务公司第二矿区管理服务公司收费服务中心', '收费服务中心', '100003028007', null, '1', '1', '', '0e220e70-dd67-4806-96ce-e35cbd0c363f');
INSERT INTO `ts_uidp_org` VALUES ('f8991617-a818-4637-8f48-c46be4d6bc72', '100003028008', '大港油田公司所属单位市政服务公司第三矿区管理服务公司', '第三矿区管理服务公司', '100003028', null, '1', '1', '', '754b2423-716b-457d-baec-198115708f60');
INSERT INTO `ts_uidp_org` VALUES ('72b8a854-67b0-44d5-bba9-394f5439233a', '100003028008001', '大港油田公司所属单位市政服务公司第三矿区管理服务公司公司领导', '公司领导', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('9f7fb200-ac12-4394-9ce4-9950a9e3f477', '100003028008002', '大港油田公司所属单位市政服务公司第三矿区管理服务公司老领导', '老领导', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('5ec672be-1046-4202-8450-1a10feffdc0c', '100003028008003', '大港油田公司所属单位市政服务公司第三矿区管理服务公司经理助理', '经理助理', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('ac8e493f-421c-4e99-a150-e4956a5cb021', '100003028008004', '大港油田公司所属单位市政服务公司第三矿区管理服务公司经理办公室', '经理办公室', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('463769d7-3221-45dd-8a5d-1a08d2150f89', '100003028008005', '大港油田公司所属单位市政服务公司第三矿区管理服务公司党群工作科', '党群工作科', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('7bd2c133-59c2-44e0-b3c2-3750471b675b', '100003028008006', '大港油田公司所属单位市政服务公司第三矿区管理服务公司人事劳资科', '人事劳资科', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('b535b959-e5ea-44a6-8b2f-608604726d2f', '100003028008007', '大港油田公司所属单位市政服务公司第三矿区管理服务公司财务资产科', '财务资产科', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('dd91e22f-6812-44df-9423-0ea1fb85540a', '100003028008008', '大港油田公司所属单位市政服务公司第三矿区管理服务公司生产运行科', '生产运行科', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('7b27e1d0-d79d-4e23-9e69-a27b15b42a7a', '100003028008009', '大港油田公司所属单位市政服务公司第三矿区管理服务公司经营计划科', '经营计划科', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('a350865f-c3e1-4cc1-acd9-c57b7353c3da', '100003028008010', '大港油田公司所属单位市政服务公司第三矿区管理服务公司基建管理站', '基建管理站', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('3e7c6649-09c2-4cbc-839e-c4232c811a01', '100003028008011', '大港油田公司所属单位市政服务公司第三矿区管理服务公司物业管理科', '物业管理科', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('ac6c8642-99c7-42df-a72b-84fc2c27fe79', '100003028008012', '大港油田公司所属单位市政服务公司第三矿区管理服务公司质量安全环保科', '质量安全环保科', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('e33f6d32-c38d-4e3b-9b11-d6acb62081e0', '100003028008013', '大港油田公司所属单位市政服务公司第三矿区管理服务公司信息档案室', '信息档案室', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('65f5087b-4f93-4df9-ae75-88aa7901bc51', '100003028008014', '大港油田公司所属单位市政服务公司第三矿区管理服务公司安全服务监督站', '安全服务监督站', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('73716c7a-50d8-430a-8d35-1bd7dae31bd5', '100003028008015', '大港油田公司所属单位市政服务公司第三矿区管理服务公司治安管理中心', '治安管理中心', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('66db7594-02d7-41ac-be75-dd986741c1fc', '100003028008016', '大港油田公司所属单位市政服务公司第三矿区管理服务公司工贸中心（滨海福利厂）', '工贸中心（滨海福利厂）', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('7642d817-7184-4f61-b2e2-06d11688b585', '100003028008017', '大港油田公司所属单位市政服务公司第三矿区管理服务公司鼎盛物业管理公司', '鼎盛物业管理公司', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('f69cc030-eb0c-48e7-ab01-90c3aca8f4bb', '100003028008018', '大港油田公司所属单位市政服务公司第三矿区管理服务公司福幸物业管理公司', '福幸物业管理公司', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('5bc449da-62f1-4102-8d15-00940120491c', '100003028008019', '大港油田公司所属单位市政服务公司第三矿区管理服务公司同盛物业管理公司', '同盛物业管理公司', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('c1d11dda-46da-4373-85f8-73da98460a8a', '100003028008020', '大港油田公司所属单位市政服务公司第三矿区管理服务公司新盛物业管理公司', '新盛物业管理公司', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('23df6b17-c67c-4f47-8bf2-a627ead27095', '100003028008021', '大港油田公司所属单位市政服务公司第三矿区管理服务公司市政园林管理公司', '市政园林管理公司', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('509f5cfa-db41-461f-a0eb-b4e70442fe54', '100003028008022', '大港油田公司所属单位市政服务公司第三矿区管理服务公司车务管理站', '车务管理站', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('4d1d0f1e-6f58-42ea-83a4-a2b1210a4ce0', '100003028008023', '大港油田公司所属单位市政服务公司第三矿区管理服务公司托幼服务中心', '托幼服务中心', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('6496bd9c-0136-435e-a583-77b7dd7de6a6', '100003028008024', '大港油田公司所属单位市政服务公司第三矿区管理服务公司维护稳定办公室', '维护稳定办公室', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('52cb565d-8b62-48a5-8d23-5fb9bab5f741', '100003028008025', '大港油田公司所属单位市政服务公司第三矿区管理服务公司收费服务中心', '收费服务中心', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('c00a888d-7275-4a1e-a588-cf193ac9e779', '100003028008026', '大港油田公司所属单位市政服务公司第三矿区管理服务公司房屋管理中心', '房屋管理中心', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('ea5deb06-17f4-45a4-9103-713a54d28245', '100003028008027', '大港油田公司所属单位市政服务公司第三矿区管理服务公司餐饮公司', '餐饮公司', '100003028008', null, '1', '1', '', 'f8991617-a818-4637-8f48-c46be4d6bc72');
INSERT INTO `ts_uidp_org` VALUES ('cae1cef6-7684-4154-8115-6f0d6cdfe194', '100003029', '大港油田公司所属单位供水公司', '供水公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('1f8b6551-e9c2-478f-a2be-8f44d42c182e', '100003029001', '大港油田公司所属单位供水公司公司领导', '公司领导', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('f011472b-dc3e-4271-8fa7-f89a6369b951', '100003029002', '大港油田公司所属单位供水公司经理办公室', '经理办公室', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('f6eebf61-8279-4193-91d2-6903cfa4caba', '100003029003', '大港油田公司所属单位供水公司党群工作科', '党群工作科', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('230cbfe8-d917-42dc-b01d-5d360db802f3', '100003029004', '大港油田公司所属单位供水公司人事劳资科', '人事劳资科', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('e378833e-a929-4488-90b7-58b044aa6792', '100003029005', '大港油田公司所属单位供水公司财务资产科', '财务资产科', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('6508a92b-1beb-415f-a225-2f0c597e6af0', '100003029006', '大港油田公司所属单位供水公司经营计划科', '经营计划科', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('7bbe537e-c2be-4e89-9583-45e32d82713f', '100003029007', '大港油田公司所属单位供水公司生产协调科', '生产协调科', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('7732b2b7-dc72-40a4-8524-bc32d044c203', '100003029008', '大港油田公司所属单位供水公司安全环保科', '安全环保科', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('38aa4521-bb44-4e51-b8f1-2cd315d3af97', '100003029009', '大港油田公司所属单位供水公司基建项目管理中心', '基建项目管理中心', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('e8b94ce7-a63c-4b63-8562-310d254efc7d', '100003029010', '大港油田公司所属单位供水公司行政服务中心（供应站）', '行政服务中心（供应站）', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('11443ffb-47ce-4443-882f-ec36aeb4ce8d', '100003029011', '大港油田公司所属单位供水公司技术研发中心（质量监督中心）', '技术研发中心（质量监督中心）', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('07b44cb9-81b3-4dd0-805c-5685aa353bd4', '100003029012', '大港油田公司所属单位供水公司供水销售分公司', '供水销售分公司', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('486ef01e-2d2f-4628-a0bd-bb6a334c8aea', '100003029013', '大港油田公司所属单位供水公司滨海水厂', '滨海水厂', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('5c7cc131-1838-4cc3-91c8-785b9d63f21c', '100003029014', '大港油田公司所属单位供水公司港东污水处理厂', '港东污水处理厂', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('5f9397f6-b326-4ca7-8ed6-a4dc29728d38', '100003029015', '大港油田公司所属单位供水公司港西污水处理厂', '港西污水处理厂', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('9fbab714-ca4d-45e8-aba6-2b44bf0b8195', '100003029016', '大港油田公司所属单位供水公司供排水分公司', '供排水分公司', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('99a409ec-4b62-40ea-b03e-7c43ac221a8a', '100003029017', '大港油田公司所属单位供水公司检维修分公司', '检维修分公司', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('565590ec-fe1a-4c73-be3f-4d92f1b72a0d', '100003029018', '大港油田公司所属单位供水公司供水技术服务分公司', '供水技术服务分公司', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('fabf7e96-606a-45c4-be6d-e9d741b0a74f', '100003029019', '大港油田公司所属单位供水公司车队', '车队', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('a76d006d-e711-485c-8428-8a7982cc00b8', '100003029020', '大港油田公司所属单位供水公司天津润沃供水安装工程有限公司', '天津润沃供水安装工程有限公司', '100003029', null, '1', '1', '', 'cae1cef6-7684-4154-8115-6f0d6cdfe194');
INSERT INTO `ts_uidp_org` VALUES ('b882d4cd-90dc-4bba-8bc0-8a4cf15268f0', '100003030', '大港油田公司所属单位供热公司', '供热公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('cee98e00-5dd6-44bc-9b88-e38525eaee20', '100003030001', '大港油田公司所属单位供热公司公司领导', '公司领导', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('159bae95-ba39-4c1a-af62-05c2566df49f', '100003030002', '大港油田公司所属单位供热公司综合办公室', '综合办公室', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('a34cb52a-49c2-44ae-aab8-958c1a907792', '100003030003', '大港油田公司所属单位供热公司人事劳资科', '人事劳资科', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('df8709cb-a6c3-4706-8549-162807ae7252', '100003030004', '大港油田公司所属单位供热公司财务资产科', '财务资产科', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('c3f4382a-6ef8-4934-83de-90171bd5b2c2', '100003030005', '大港油田公司所属单位供热公司生产运行科', '生产运行科', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('eff2781b-1bb7-429b-925c-d163228f4cfb', '100003030006', '大港油田公司所属单位供热公司经营计划科', '经营计划科', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('590399de-b51d-4764-b62e-77184fe54333', '100003030007', '大港油田公司所属单位供热公司质量安全环保科', '质量安全环保科', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('956fde56-a6ba-4abc-89c6-e441b37e2f69', '100003030008', '大港油田公司所属单位供热公司供热调度中心', '供热调度中心', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('1234908e-5fe0-404f-bd39-a8f9c8888d84', '100003030009', '大港油田公司所属单位供热公司安全服务监督站', '安全服务监督站', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('44790d3d-09d3-4559-b95b-801a3ffeda8e', '100003030010', '大港油田公司所属单位供热公司基建管理中心', '基建管理中心', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('91b0949e-cae8-411b-a6f6-6b3ac292c249', '100003030011', '大港油田公司所属单位供热公司物资装备中心', '物资装备中心', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('bf82a22a-ac1c-4c06-8a5b-3217ee13154d', '100003030012', '大港油田公司所属单位供热公司供热销售分公司', '供热销售分公司', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('a55edf56-53a5-442d-8a77-a8d7c69a64f5', '100003030013', '大港油田公司所属单位供热公司热能动力分公司', '热能动力分公司', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('6612b330-eec9-4a74-9868-fc30aef1c270', '100003030014', '大港油田公司所属单位供热公司供热第一分公司', '供热第一分公司', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('172d87d2-d118-4b3c-bc47-517586470a75', '100003030015', '大港油田公司所属单位供热公司供热第二分公司', '供热第二分公司', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('7a12c7b9-59f5-417e-ac4a-e9de92ba6377', '100003030016', '大港油田公司所属单位供热公司供热第三分公司', '供热第三分公司', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('22ad4c25-5370-4a56-b7ec-8f7b9864dc5f', '100003030017', '大港油田公司所属单位供热公司供热第四分公司', '供热第四分公司', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('696673fd-4986-417a-af8a-1cfdb9629d28', '100003030018', '大港油田公司所属单位供热公司综合服务队（综合车队）', '综合服务队（综合车队）', '100003030', null, '1', '1', '', 'b882d4cd-90dc-4bba-8bc0-8a4cf15268f0');
INSERT INTO `ts_uidp_org` VALUES ('0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25', '100003031', '大港油田公司所属单位天津海滨人民医院', '天津海滨人民医院', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('aacdc791-f60b-4d68-86e2-ee6c2401e005', '100003031001', '大港油田公司所属单位天津海滨人民医院院领导', '院领导', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('423bba1e-a2c1-432d-bbdf-60676653eada', '100003031002', '大港油田公司所属单位天津海滨人民医院综合办公室（安全环保科）', '综合办公室（安全环保科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('1350d3fe-00de-4ba6-a566-bd46d387c4a8', '100003031003', '大港油田公司所属单位天津海滨人民医院中医科', '中医科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('6f1d15f7-a974-4676-b19c-b10267a2195f', '100003031004', '大港油田公司所属单位天津海滨人民医院医务科教部', '医务科教部', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('1103efdf-a38e-45e7-83a0-0ccda83b641c', '100003031004001', '大港油田公司所属单位天津海滨人民医院医务科教部病案室', '病案室', '100003031004', null, '1', '1', '', '6f1d15f7-a974-4676-b19c-b10267a2195f');
INSERT INTO `ts_uidp_org` VALUES ('b98b2089-0450-4475-91aa-50df67aab9f0', '100003031005', '大港油田公司所属单位天津海滨人民医院护理部', '护理部', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('86925186-f1e6-4093-907f-b7c919a945eb', '100003031006', '大港油田公司所属单位天津海滨人民医院财务资产科', '财务资产科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('17496e88-9d18-4cba-9fd3-783e88ef4871', '100003031007', '大港油田公司所属单位天津海滨人民医院计划装备科', '计划装备科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('c9389d1c-20f6-42e0-933b-b70c3119a35b', '100003031008', '大港油田公司所属单位天津海滨人民医院人事劳资科', '人事劳资科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('4def97c6-48e9-4530-8544-a9ba9e4fa34f', '100003031009', '大港油田公司所属单位天津海滨人民医院医疗保险与物价管理科', '医疗保险与物价管理科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('ad0fac94-e585-4b5f-8696-403d6bc7232a', '100003031010', '大港油田公司所属单位天津海滨人民医院B2西病区', 'B2西病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('44d66ec7-3ab2-4893-bf73-86d56923e161', '100003031011', '大港油田公司所属单位天津海滨人民医院耳鼻咽喉科', '耳鼻咽喉科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('cc55a4cc-4a0f-4ed9-b76d-806d87b6d114', '100003031012', '大港油田公司所属单位天津海滨人民医院门诊办公室（投诉处理中心）', '门诊办公室（投诉处理中心）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('7d2a5ead-153e-4d90-a105-ae6db39c8a62', '100003031013', '大港油田公司所属单位天津海滨人民医院医院感染管理部（公共卫生管理部）', '医院感染管理部（公共卫生管理部）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('ecf7b87f-65b4-4052-beb4-cd1bdad1ea68', '100003031014', '大港油田公司所属单位天津海滨人民医院保健医学科（职业病科）', '保健医学科（职业病科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('71511520-64ce-4c60-8123-711e3d5c2ced', '100003031015', '大港油田公司所属单位天津海滨人民医院放射技术科', '放射技术科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('db860c67-c438-4edf-b82c-afc24a37b44e', '100003031016', '大港油田公司所属单位天津海滨人民医院医学检验科（输血科）', '医学检验科（输血科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('82b48442-de60-46af-bbb6-dccde9e0025f', '100003031017', '大港油田公司所属单位天津海滨人民医院病理科', '病理科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('568112a1-a72b-45b9-9561-765fd9da232a', '100003031018', '大港油田公司所属单位天津海滨人民医院超声影像一科', '超声影像一科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('f440aa6b-54df-493c-87f8-ad6b027fef55', '100003031019', '大港油田公司所属单位天津海滨人民医院药械科', '药械科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('d9bb8485-4429-4219-bed6-78d78d55a9b9', '100003031020', '大港油田公司所属单位天津海滨人民医院心血管内科', '心血管内科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('25138452-cb6c-46b8-9598-2efd123e8b1b', '100003031021', '大港油田公司所属单位天津海滨人民医院甲状腺外科（乳腺外科血管外科）', '甲状腺外科（乳腺外科血管外科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('47a8fa7d-ff28-4e76-a769-09c260d1affb', '100003031022', '大港油田公司所属单位天津海滨人民医院内分泌科', '内分泌科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('66356b06-18a8-4552-9359-888a73fd8482', '100003031023', '大港油田公司所属单位天津海滨人民医院血液净化科（肾内科）', '血液净化科（肾内科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('6da874bb-874b-4074-90ae-6980504a12ff', '100003031024', '大港油田公司所属单位天津海滨人民医院肛肠外科（烧伤科普通外科）', '肛肠外科（烧伤科普通外科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('a44ea998-efd5-4563-b5dd-2bee34ce5b64', '100003031025', '大港油田公司所属单位天津海滨人民医院产科', '产科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('7ec2bf58-cfa8-460c-9665-f5490dc16929', '100003031026', '大港油田公司所属单位天津海滨人民医院康复医学科', '康复医学科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('2164586d-0eb4-4d2f-b83a-8265c9c16ad1', '100003031027', '大港油田公司所属单位天津海滨人民医院手术麻醉与疼痛医学部', '手术麻醉与疼痛医学部', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('6f60ebbb-1fd4-4c88-85c2-ca9217d2a542', '100003031028', '大港油田公司所属单位天津海滨人民医院急诊医学科', '急诊医学科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('e6743f8e-fe69-4131-b788-c196517f57a5', '100003031029', '大港油田公司所属单位天津海滨人民医院A4东病区', 'A4东病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('9dffe3ed-fe74-4b7a-8e2c-50192e845bfe', '100003031030', '大港油田公司所属单位天津海滨人民医院B4东病区', 'B4东病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('89804ff5-dc20-4a1c-87d7-0295d4401a3d', '100003031031', '大港油田公司所属单位天津海滨人民医院A5区', 'A5区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('07f8b65b-0f54-488c-bfa9-e7bb9f20bc96', '100003031032', '大港油田公司所属单位天津海滨人民医院内窥镜护理单元', '内窥镜护理单元', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('351e98ed-5f59-476e-915f-493fec76421c', '100003031033', '大港油田公司所属单位天津海滨人民医院专科护理单元', '专科护理单元', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('ad922b97-6a98-4ef6-aef6-42f1429376a5', '100003031034', '大港油田公司所属单位天津海滨人民医院A3东病区', 'A3东病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('b6415153-9300-42f0-beaf-1652a842a4e6', '100003031035', '大港油田公司所属单位天津海滨人民医院血液透析护理单元', '血液透析护理单元', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('2a705ab5-d0c1-4430-994d-52ec4caf195f', '100003031036', '大港油田公司所属单位天津海滨人民医院门诊护理单元', '门诊护理单元', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('1878229b-8272-466b-9d9f-db68105f5208', '100003031037', '大港油田公司所属单位天津海滨人民医院急诊护理单元', '急诊护理单元', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('09ef3086-9818-462a-a0bc-8611959f2fb5', '100003031038', '大港油田公司所属单位天津海滨人民医院花园里社区卫生服务中心', '花园里社区卫生服务中心', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('8f1f6817-f63c-4e99-8e5e-769f56e7a361', '100003031039', '大港油田公司所属单位天津海滨人民医院华幸社区卫生服务中心（港狮医院）', '华幸社区卫生服务中心（港狮医院）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('4e28b1e3-b343-4f27-9df1-80ba2a2b48ec', '100003031040', '大港油田公司所属单位天津海滨人民医院三号院社区卫生服务中心', '三号院社区卫生服务中心', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('98f702b6-ca0c-4164-b69b-f54d11f610ec', '100003031041', '大港油田公司所属单位天津海滨人民医院幸福社区卫生服务中心', '幸福社区卫生服务中心', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('0a7c4bcc-b49a-42e4-a34e-5250f0920793', '100003031042', '大港油田公司所属单位天津海滨人民医院老年医学病科（感染性疾病科）', '老年医学病科（感染性疾病科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('510ffe88-d0f4-447d-90d9-6bc04a9a1b74', '100003031043', '大港油田公司所属单位天津海滨人民医院呼吸与危重症医学部（肾病科）', '呼吸与危重症医学部（肾病科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('11d4cc4c-fb82-4f47-991d-fef501aee7e9', '100003031044', '大港油田公司所属单位天津海滨人民医院设备信息科', '设备信息科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('5b25cb59-074b-452e-a75d-ffc013b22f51', '100003031044001', '大港油田公司所属单位天津海滨人民医院设备信息科人事档案室', '人事档案室', '100003031044', null, '1', '1', '', '11d4cc4c-fb82-4f47-991d-fef501aee7e9');
INSERT INTO `ts_uidp_org` VALUES ('98d68e84-9460-43df-8653-5b0f91998244', '100003031044002', '大港油田公司所属单位天津海滨人民医院设备信息科综合档案室', '综合档案室', '100003031044', null, '1', '1', '', '11d4cc4c-fb82-4f47-991d-fef501aee7e9');
INSERT INTO `ts_uidp_org` VALUES ('a040f3b4-ca27-41b6-a1c7-38980b54c304', '100003031045', '大港油田公司所属单位天津海滨人民医院放射诊断科', '放射诊断科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('20814c74-496d-47f1-b939-0b3b5e03767b', '100003031046', '大港油田公司所属单位天津海滨人民医院康健实业公司', '康健实业公司', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('079d3cfc-455c-45b3-a213-412cdc883adb', '100003031047', '大港油田公司所属单位天津海滨人民医院妇科', '妇科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('684242fc-3f63-4e69-8b56-9498b3b686ff', '100003031048', '大港油田公司所属单位天津海滨人民医院胸外科（普通外科）', '胸外科（普通外科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('b7b9e824-de2a-4f78-a440-ba61578f01d7', '100003031049', '大港油田公司所属单位天津海滨人民医院B2东病区', 'B2东病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('b7aa80db-b94e-40f1-9643-2e07279c98a4', '100003031050', '大港油田公司所属单位天津海滨人民医院A2西病区', 'A2西病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('64c9605a-0a0e-45da-b52c-766e3b1d5cd9', '100003031051', '大港油田公司所属单位天津海滨人民医院儿科', '儿科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('6d019a20-1077-412f-9023-46df1313feac', '100003031052', '大港油田公司所属单位天津海滨人民医院综合服务队', '综合服务队', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('33b02f59-4b24-443d-96e9-06f759bd94a6', '100003031053', '大港油田公司所属单位天津海滨人民医院消化内科', '消化内科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('393173af-c451-4eab-a416-ba6fad18e563', '100003031054', '大港油田公司所属单位天津海滨人民医院A2东病区', 'A2东病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('c75fc29e-a745-42d6-b682-2e15249be1fe', '100003031055', '大港油田公司所属单位天津海滨人民医院A4西病区', 'A4西病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('810f943f-7d17-4b26-a6d4-f9df1a0191ce', '100003031056', '大港油田公司所属单位天津海滨人民医院B3东病区', 'B3东病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('f8b9de0b-8246-4c57-87f9-4fbce3725bec', '100003031057', '大港油田公司所属单位天津海滨人民医院B3西病区', 'B3西病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('f06dd18d-1ea0-4df8-b232-331d4416d62b', '100003031058', '大港油田公司所属单位天津海滨人民医院眼科（医疗美容科）', '眼科（医疗美容科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('07dde9d8-a69c-4784-8745-1c5a2fc5f996', '100003031059', '大港油田公司所属单位天津海滨人民医院肿瘤科（血液内科）', '肿瘤科（血液内科）', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('1f2e3cfa-ed7a-46b6-8eff-d93e4a976348', '100003031060', '大港油田公司所属单位天津海滨人民医院神经医学部', '神经医学部', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('910693d2-ecd1-4b0e-ab5f-1ff593aabb12', '100003031061', '大港油田公司所属单位天津海滨人民医院口腔科', '口腔科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('3da9b484-d1f2-4915-8a9e-23b1a4c9ca40', '100003031062', '大港油田公司所属单位天津海滨人民医院超声影像二科', '超声影像二科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('ad9d75de-2c41-4da5-b47c-c41d375a5405', '100003031063', '大港油田公司所属单位天津海滨人民医院B1东病区', 'B1东病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('69278635-4ae4-45f3-83fe-2ad8778337ad', '100003031064', '大港油田公司所属单位天津海滨人民医院临床营养科', '临床营养科', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('da3935b5-b5f3-447d-9a36-2026421d576f', '100003031065', '大港油田公司所属单位天津海滨人民医院A3西病区', 'A3西病区', '100003031', null, '1', '1', '', '0c4a7dd2-5c84-4ee4-b860-5bfd8b770a25');
INSERT INTO `ts_uidp_org` VALUES ('5d974f1e-3c7a-4a6a-b3d3-cba8935534d1', '100003032', '大港油田公司所属单位新闻文化中心', '新闻文化中心', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('2d5f2a9b-febc-4808-a8d1-1a6f0a7fd570', '100003032001', '大港油田公司所属单位新闻文化中心中心领导', '中心领导', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('62c50d4b-6dc0-4181-b9b6-3cc357be8b4b', '100003032002', '大港油田公司所属单位新闻文化中心老领导、助理', '老领导、助理', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('92b3e3b6-ed54-403e-a4e8-121dcf90a5d8', '100003032003', '大港油田公司所属单位新闻文化中心综合办公室（新闻协调科）', '综合办公室（新闻协调科）', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('175a7a34-03d0-4236-bbf8-e1dc06b0e72a', '100003032004', '大港油田公司所属单位新闻文化中心党群工作科', '党群工作科', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('2a7c52bb-c326-4bc2-90e8-426206dca117', '100003032005', '大港油田公司所属单位新闻文化中心财务资产科', '财务资产科', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('b19b7e53-3333-4ef6-a0be-2b4d244e7be2', '100003032006', '大港油田公司所属单位新闻文化中心人事劳资科', '人事劳资科', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('5162aab9-82d9-45fa-80bc-9bfd3627990c', '100003032007', '大港油田公司所属单位新闻文化中心经营计划科', '经营计划科', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('816e54b8-4c43-4054-9a26-18a41d6e1970', '100003032008', '大港油田公司所属单位新闻文化中心文联体协办公室', '文联体协办公室', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('fd6b4b1a-8fa0-4647-80dc-3665c629664e', '100003032009', '大港油田公司所属单位新闻文化中心质量安全环保科', '质量安全环保科', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('6e083313-0c89-48bc-a9ad-c50069cf6042', '100003032010', '大港油田公司所属单位新闻文化中心报社总编室', '报社总编室', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('0d495e34-aaf4-44af-97b4-f14be1a94c3c', '100003032011', '大港油田公司所属单位新闻文化中心报社记者部', '报社记者部', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('c3bdd4c2-3847-4478-8a0d-5a284579ecd5', '100003032012', '大港油田公司所属单位新闻文化中心报社专刊部', '报社专刊部', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('2b6c93aa-3b66-4eef-a1e3-030a04aaa172', '100003032013', '大港油田公司所属单位新闻文化中心报社摄影部（中国石油画报大港记者站）', '报社摄影部（中国石油画报大港记者站）', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('9f5540ca-1a84-4c13-b764-078fcc67a2cd', '100003032014', '大港油田公司所属单位新闻文化中心报社编辑室', '报社编辑室', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('fd32d2d2-a900-44d3-98b3-12ffcf53d14b', '100003032015', '大港油田公司所属单位新闻文化中心中国石油报大港记者站采访部', '中国石油报大港记者站采访部', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('cbc2be83-4322-4194-a25a-f63fbf866ce7', '100003032016', '大港油田公司所属单位新闻文化中心电视综合办公室（展览馆）', '电视综合办公室（展览馆）', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('176c37a2-3bf3-4994-8f98-c4c8329e132d', '100003032017', '大港油田公司所属单位新闻文化中心电视总编室', '电视总编室', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('c66c38a3-9fe5-40d2-a92f-b9086bfeb346', '100003032018', '大港油田公司所属单位新闻文化中心电视新闻部', '电视新闻部', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('2f4550e1-abbf-46cd-b102-23cb258448a1', '100003032019', '大港油田公司所属单位新闻文化中心电视专题广告部', '电视专题广告部', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('58b7f6ab-78af-4fc0-8820-a19280a9a297', '100003032020', '大港油田公司所属单位新闻文化中心体育活动中心', '体育活动中心', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('e810bbe5-ca74-481d-a152-a22430e05988', '100003032021', '大港油田公司所属单位新闻文化中心中国石油美协办公室', '中国石油美协办公室', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('2bdbbc0c-6193-4982-a013-113ebf837724', '100003032022', '大港油田公司所属单位新闻文化中心作协办公室', '作协办公室', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('78b58248-7bf3-49d8-b6d4-0513151af4b1', '100003032023', '大港油田公司所属单位新闻文化中心艺泉公司', '艺泉公司', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('3e111a80-f5f0-4f9a-8320-e2a35873c23f', '100003032024', '大港油田公司所属单位新闻文化中心俱乐部', '俱乐部', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('557e5611-264f-48c6-926f-fda75452fd0a', '100003032025', '大港油田公司所属单位新闻文化中心印刷厂', '印刷厂', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('c94dd2c9-8a7c-4447-b4a3-748cd9ab1320', '100003032026', '大港油田公司所属单位新闻文化中心信息档案室（图书馆）', '信息档案室（图书馆）', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('23c7eecb-131f-4346-a805-b0b62eecca0e', '100003032027', '大港油田公司所属单位新闻文化中心综合服务队', '综合服务队', '100003032', null, '1', '1', '', '5d974f1e-3c7a-4a6a-b3d3-cba8935534d1');
INSERT INTO `ts_uidp_org` VALUES ('898bc5ff-379a-44aa-8588-1bc7e4336890', '100003033', '大港油田公司所属单位离退休管理中心', '离退休管理中心', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('b5664fa1-7b41-4115-a5ab-e01464db6db4', '100003033001', '大港油田公司所属单位离退休管理中心中心领导', '中心领导', '100003033', null, '1', '1', '', '898bc5ff-379a-44aa-8588-1bc7e4336890');
INSERT INTO `ts_uidp_org` VALUES ('efeb5a1a-691f-4e79-9af8-dddf5b42983b', '100003033002', '大港油田公司所属单位离退休管理中心综合管理科', '综合管理科', '100003033', null, '1', '1', '', '898bc5ff-379a-44aa-8588-1bc7e4336890');
INSERT INTO `ts_uidp_org` VALUES ('c8408a0b-df18-4038-b492-4fb8e1878165', '100003033003', '大港油田公司所属单位离退休管理中心财务科', '财务科', '100003033', null, '1', '1', '', '898bc5ff-379a-44aa-8588-1bc7e4336890');
INSERT INTO `ts_uidp_org` VALUES ('60f8a7d7-3201-454d-b836-d4070cd40c0b', '100003033004', '大港油田公司所属单位离退休管理中心离退休管理科', '离退休管理科', '100003033', null, '1', '1', '', '898bc5ff-379a-44aa-8588-1bc7e4336890');
INSERT INTO `ts_uidp_org` VALUES ('b09d0342-82d6-425c-8a1d-74a46c16d861', '100003033005', '大港油田公司所属单位离退休管理中心有偿解除管理科', '有偿解除管理科', '100003033', null, '1', '1', '', '898bc5ff-379a-44aa-8588-1bc7e4336890');
INSERT INTO `ts_uidp_org` VALUES ('2a784ab5-f36c-472f-8609-1d20a82912ff', '100003033006', '大港油田公司所属单位离退休管理中心家属工管理科', '家属工管理科', '100003033', null, '1', '1', '', '898bc5ff-379a-44aa-8588-1bc7e4336890');
INSERT INTO `ts_uidp_org` VALUES ('f3c4a523-3807-47f3-a668-560c74ada3cb', '100003033007', '大港油田公司所属单位离退休管理中心中心所属', '中心所属', '100003033', null, '1', '1', '', '898bc5ff-379a-44aa-8588-1bc7e4336890');
INSERT INTO `ts_uidp_org` VALUES ('1f49da5b-a01b-4c85-99f5-d71acea8e0fd', '100003033007001', '大港油田公司所属单位离退休管理中心中心所属第一退休服务分中心', '第一退休服务分中心', '100003033007', null, '1', '1', '', 'f3c4a523-3807-47f3-a668-560c74ada3cb');
INSERT INTO `ts_uidp_org` VALUES ('a7ff2a9b-fad9-411a-aad6-07d5755fbc9b', '100003033007002', '大港油田公司所属单位离退休管理中心中心所属第二退休服务分中心', '第二退休服务分中心', '100003033007', null, '1', '1', '', 'f3c4a523-3807-47f3-a668-560c74ada3cb');
INSERT INTO `ts_uidp_org` VALUES ('d9ef330b-d5a7-42b7-a4e6-4dac19225e28', '100003033007003', '大港油田公司所属单位离退休管理中心中心所属第三退休服务分中心', '第三退休服务分中心', '100003033007', null, '1', '1', '', 'f3c4a523-3807-47f3-a668-560c74ada3cb');
INSERT INTO `ts_uidp_org` VALUES ('23ce1eb4-0d60-4d12-bb1f-5246164dec6c', '100003033007004', '大港油田公司所属单位离退休管理中心中心所属第四退休服务分中心', '第四退休服务分中心', '100003033007', null, '1', '1', '', 'f3c4a523-3807-47f3-a668-560c74ada3cb');
INSERT INTO `ts_uidp_org` VALUES ('2d830b5a-bc87-4f33-838b-3f52ba88a500', '100003033007005', '大港油田公司所属单位离退休管理中心中心所属老干部服务分中心', '老干部服务分中心', '100003033007', null, '1', '1', '', 'f3c4a523-3807-47f3-a668-560c74ada3cb');
INSERT INTO `ts_uidp_org` VALUES ('ed34f7ec-f737-488f-b24e-c49ec1ad1fb7', '100003033007006', '大港油田公司所属单位离退休管理中心中心所属离退休活动分中心', '离退休活动分中心', '100003033007', null, '1', '1', '', 'f3c4a523-3807-47f3-a668-560c74ada3cb');
INSERT INTO `ts_uidp_org` VALUES ('e4753b66-8fa9-40f8-b4d5-005314e08ae8', '100003034', '大港油田公司所属单位社会保险管理中心', '社会保险管理中心', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('fd59f015-f7c0-47d7-b1d1-96fe31b4c89f', '100003034001', '大港油田公司所属单位社会保险管理中心部门领导', '部门领导', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('1012829c-b828-4b07-8e57-2f9833a0d12b', '100003034002', '大港油田公司所属单位社会保险管理中心综合科', '综合科', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('b5f010b9-2c8a-46f9-9cbe-bb84c874635c', '100003034003', '大港油田公司所属单位社会保险管理中心服务监督部', '服务监督部', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('b41f2b05-7612-45d5-9c27-a0848a8fcb7e', '100003034004', '大港油田公司所属单位社会保险管理中心财务科', '财务科', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('53484621-dea8-434e-86e0-04b4dc729d0a', '100003034005', '大港油田公司所属单位社会保险管理中心基金征缴科', '基金征缴科', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('c838fba3-c7c2-458d-9f97-ee8470793e89', '100003034006', '大港油田公司所属单位社会保险管理中心养老保险科', '养老保险科', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('92a85212-d82b-47d4-8c9f-37f661492078', '100003034007', '大港油田公司所属单位社会保险管理中心医疗保险科', '医疗保险科', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('aeb13238-3c00-419c-91e5-b1e696407a00', '100003034008', '大港油田公司所属单位社会保险管理中心工伤保险科', '工伤保险科', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('e3571e1b-c185-4ec7-b53b-0f93c7cfd090', '100003034009', '大港油田公司所属单位社会保险管理中心中心区保险所', '中心区保险所', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('f12b2f78-e2a0-4f2f-8ceb-bd263b1f7f9e', '100003034010', '大港油田公司所属单位社会保险管理中心港中保险所', '港中保险所', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('fe5d3c83-8929-40b2-a7fb-2b09e303075a', '100003034011', '大港油田公司所属单位社会保险管理中心港西保险所（油区办）', '港西保险所（油区办）', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('c1c6d68b-3830-40a1-913d-448c1803c7be', '100003034012', '大港油田公司所属单位社会保险管理中心港东保险所', '港东保险所', '100003034', null, '1', '1', '', 'e4753b66-8fa9-40f8-b4d5-005314e08ae8');
INSERT INTO `ts_uidp_org` VALUES ('4b8827cf-2ecd-4f96-b0fd-c9aec1801b63', '100003035', '大港油田公司所属单位港油资本运营中心', '港油资本运营中心', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('66ebead1-ae07-4063-a568-73fb01a3bd9f', '100003035001', '大港油田公司所属单位港油资本运营中心部门领导', '部门领导', '100003035', null, '1', '1', '', '4b8827cf-2ecd-4f96-b0fd-c9aec1801b63');
INSERT INTO `ts_uidp_org` VALUES ('575a6c96-ba1f-484b-82a2-e89d3aa87331', '100003035002', '大港油田公司所属单位港油资本运营中心企业管理科', '企业管理科', '100003035', null, '1', '1', '', '4b8827cf-2ecd-4f96-b0fd-c9aec1801b63');
INSERT INTO `ts_uidp_org` VALUES ('5d55d870-77dc-4dad-af66-e27d17201863', '100003035003', '大港油田公司所属单位港油资本运营中心财务资产科', '财务资产科', '100003035', null, '1', '1', '', '4b8827cf-2ecd-4f96-b0fd-c9aec1801b63');
INSERT INTO `ts_uidp_org` VALUES ('ecccc6f1-45e6-4a48-99c7-d30fc0ae5410', '100003035004', '大港油田公司所属单位港油资本运营中心市场开发科', '市场开发科', '100003035', null, '1', '1', '', '4b8827cf-2ecd-4f96-b0fd-c9aec1801b63');
INSERT INTO `ts_uidp_org` VALUES ('97befff5-242e-4d3c-99db-7e9cacd53d3d', '100003035005', '大港油田公司所属单位港油资本运营中心综合管理科', '综合管理科', '100003035', null, '1', '1', '', '4b8827cf-2ecd-4f96-b0fd-c9aec1801b63');
INSERT INTO `ts_uidp_org` VALUES ('913d9b51-2faa-4861-8133-729b72880754', '100003036', '大港油田公司所属单位团泊洼开发公司', '团泊洼开发公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('2d23382b-b5a3-4edb-973b-1462f7394a03', '100003036001', '大港油田公司所属单位团泊洼开发公司公司领导', '公司领导', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('72b1bb55-2321-49a4-9ef6-85667557e62d', '100003036002', '大港油田公司所属单位团泊洼开发公司综合办公室', '综合办公室', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('a6f3110c-08ea-4a26-92da-b60fde8f4099', '100003036003', '大港油田公司所属单位团泊洼开发公司经营管理科', '经营管理科', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('0522407c-00aa-4595-a716-27dac1e6ec01', '100003036004', '大港油田公司所属单位团泊洼开发公司人事劳资科', '人事劳资科', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('8de3520f-787d-4b29-9977-2f8f221bf35e', '100003036005', '大港油田公司所属单位团泊洼开发公司生产管理科', '生产管理科', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('906c7e27-ae42-42f6-9d35-c0eed5affa40', '100003036006', '大港油田公司所属单位团泊洼开发公司质量安全环保科(保卫科)', '质量安全环保科(保卫科)', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('b749e0b1-f7f5-43b6-ad01-84c9bd85af0f', '100003036007', '大港油田公司所属单位团泊洼开发公司财务资产科', '财务资产科', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('d028bb7f-f156-4afa-821a-ae780b371885', '100003036008', '大港油田公司所属单位团泊洼开发公司供电服务公司', '供电服务公司', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('85d09283-05ad-448e-b7f7-b59e5de78fe4', '100003036009', '大港油田公司所属单位团泊洼开发公司资源管理公司', '资源管理公司', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('c4e032e3-5a74-456e-acab-d62e528e2f58', '100003036010', '大港油田公司所属单位团泊洼开发公司金秋酒业公司（园林绿化公司）', '金秋酒业公司（园林绿化公司）', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('83a23e25-07f2-45ea-9a7f-1d5b722ef37b', '100003036010001', '大港油田公司所属单位团泊洼开发公司金秋酒业公司（园林绿化公司）综合管理部', '综合管理部', '100003036010', null, '1', '1', '', 'c4e032e3-5a74-456e-acab-d62e528e2f58');
INSERT INTO `ts_uidp_org` VALUES ('10d8b84b-8068-496c-a74b-9b9b94df794d', '100003036010002', '大港油田公司所属单位团泊洼开发公司金秋酒业公司（园林绿化公司）财务部', '财务部', '100003036010', null, '1', '1', '', 'c4e032e3-5a74-456e-acab-d62e528e2f58');
INSERT INTO `ts_uidp_org` VALUES ('3d36693b-78de-4f02-ab2e-c80779b8152b', '100003036011', '大港油田公司所属单位团泊洼开发公司综合服务公司', '综合服务公司', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('e4c604a4-9df1-4be3-828e-dea38eb66e58', '100003036012', '大港油田公司所属单位团泊洼开发公司基建管理中心', '基建管理中心', '100003036', null, '1', '1', '', '913d9b51-2faa-4861-8133-729b72880754');
INSERT INTO `ts_uidp_org` VALUES ('8334ebc4-d82b-477e-aeec-52ed60169cf3', '100003037', '大港油田公司所属单位天津炼达集团有限公司', '天津炼达集团有限公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('9ba3345a-883a-41d1-9091-0e784f2acf2b', '100003037001', '大港油田公司所属单位天津炼达集团有限公司公司领导', '公司领导', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('f5454ea5-28d0-405b-8ac8-77fb0bc5eed1', '100003037002', '大港油田公司所属单位天津炼达集团有限公司综合办公室', '综合办公室', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('7c5c9dfa-4e92-44b4-8369-87cf0c16f787', '100003037003', '大港油田公司所属单位天津炼达集团有限公司人事劳资科', '人事劳资科', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('33843b9b-481a-464f-9037-5842e305ff08', '100003037004', '大港油田公司所属单位天津炼达集团有限公司财务资产科', '财务资产科', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('b6af6e39-e8cc-401c-b7f3-ae3fe865dac4', '100003037005', '大港油田公司所属单位天津炼达集团有限公司企业管理科', '企业管理科', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('cc86a1dc-befa-43c0-bf1b-d190c7daedc7', '100003037006', '大港油田公司所属单位天津炼达集团有限公司安全环保科', '安全环保科', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('a4bfeabc-6125-4707-8236-488f98dbdd91', '100003037007', '大港油田公司所属单位天津炼达集团有限公司施工管理科', '施工管理科', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('be5aebbd-35f9-4d93-993f-049955f0d943', '100003037008', '大港油田公司所属单位天津炼达集团有限公司物资管理中心', '物资管理中心', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('9e21baae-2024-411e-b7ab-dfe82f21c9a8', '100003037008001', '大港油田公司所属单位天津炼达集团有限公司物资管理中心物资回收项目部', '物资回收项目部', '100003037008', null, '1', '1', '', 'be5aebbd-35f9-4d93-993f-049955f0d943');
INSERT INTO `ts_uidp_org` VALUES ('8e0cbcd3-9165-4888-a9ec-0b6d8ee0ff2f', '100003037009', '大港油田公司所属单位天津炼达集团有限公司工程结算中心', '工程结算中心', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('da02c100-146d-4110-b6e2-f903fca02d8a', '100003037010', '大港油田公司所属单位天津炼达集团有限公司安全监督站', '安全监督站', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('c4fb3c35-df8c-4e53-bbcf-1fdbadeacbf7', '100003037011', '大港油田公司所属单位天津炼达集团有限公司国际合作部（对外经济贸易公司）', '国际合作部（对外经济贸易公司）', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('d033c809-f573-4ded-8a42-40299977a9d4', '100003037012', '大港油田公司所属单位天津炼达集团有限公司幸福广场购物中心', '幸福广场购物中心', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('102fcd85-8dae-4547-a7a0-16e05f0598c0', '100003037012001', '大港油田公司所属单位天津炼达集团有限公司幸福广场购物中心炼达超市', '炼达超市', '100003037012', null, '1', '1', '', 'd033c809-f573-4ded-8a42-40299977a9d4');
INSERT INTO `ts_uidp_org` VALUES ('4ccacef1-5d75-45f8-bd32-dec1f1011c0b', '100003037013', '大港油田公司所属单位天津炼达集团有限公司炼达石化', '炼达石化', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('9862b888-a9ac-4566-812f-ad0e9e53e211', '100003037014', '大港油田公司所属单位天津炼达集团有限公司建安分公司', '建安分公司', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('0d7bfed3-8d37-4a89-bf7e-e80030e9dabc', '100003037015', '大港油田公司所属单位天津炼达集团有限公司电仪分公司', '电仪分公司', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('58f97693-c63f-44e9-b953-ccf18913c763', '100003037016', '大港油田公司所属单位天津炼达集团有限公司防腐土建分公司', '防腐土建分公司', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('72991054-3a23-4466-be5b-54bbade41707', '100003037017', '大港油田公司所属单位天津炼达集团有限公司机械施工分公司', '机械施工分公司', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('e1295319-a908-4f80-84d2-090a03b00a25', '100003037018', '大港油田公司所属单位天津炼达集团有限公司工程项目部', '工程项目部', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('c791eeca-adb8-46d1-bf2b-e6c77bcaa505', '100003037019', '大港油田公司所属单位天津炼达集团有限公司综合服务中心', '综合服务中心', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('6a0b4ee1-b54f-4bf8-9993-4bf3e38b2838', '100003037020', '大港油田公司所属单位天津炼达集团有限公司福利厂', '福利厂', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('3e840dce-0904-407b-a0e0-84cc00059192', '100003037021', '大港油田公司所属单位天津炼达集团有限公司餐饮公司', '餐饮公司', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('bb156c41-6ace-4a09-8e85-a4a2c4c0758f', '100003037022', '大港油田公司所属单位天津炼达集团有限公司加油站', '加油站', '100003037', null, '1', '1', '', '8334ebc4-d82b-477e-aeec-52ed60169cf3');
INSERT INTO `ts_uidp_org` VALUES ('59131782-4d27-403c-b3e5-3a77b05340fa', '100003038', '大港油田公司所属单位滨港公司', '滨港公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('d3c1f00e-9741-443e-90f8-c45f959ec5a3', '100003038001', '大港油田公司所属单位滨港公司公司领导', '公司领导', '100003038', null, '1', '1', '', '59131782-4d27-403c-b3e5-3a77b05340fa');
INSERT INTO `ts_uidp_org` VALUES ('4a9cc552-5191-4ac3-80fb-ef789529fc36', '100003038002', '大港油田公司所属单位滨港公司公司老领导', '公司老领导', '100003038', null, '1', '1', '', '59131782-4d27-403c-b3e5-3a77b05340fa');
INSERT INTO `ts_uidp_org` VALUES ('12aca031-1992-4cc7-b21a-b9c31339b29a', '100003038003', '大港油田公司所属单位滨港公司滨港机关', '滨港机关', '100003038', null, '1', '1', '', '59131782-4d27-403c-b3e5-3a77b05340fa');
INSERT INTO `ts_uidp_org` VALUES ('236b91c2-c962-4233-acd9-a3cf8bc88be4', '100003038003001', '大港油田公司所属单位滨港公司滨港机关综合管理科', '综合管理科', '100003038003', null, '1', '1', '', '12aca031-1992-4cc7-b21a-b9c31339b29a');
INSERT INTO `ts_uidp_org` VALUES ('0657d16c-8d7a-4d48-8003-817d39484e84', '100003038003002', '大港油田公司所属单位滨港公司滨港机关财务资产科', '财务资产科', '100003038003', null, '1', '1', '', '12aca031-1992-4cc7-b21a-b9c31339b29a');
INSERT INTO `ts_uidp_org` VALUES ('51ed7927-b524-4bca-93a1-f00a803c5084', '100003038003003', '大港油田公司所属单位滨港公司滨港机关人事劳资科', '人事劳资科', '100003038003', null, '1', '1', '', '12aca031-1992-4cc7-b21a-b9c31339b29a');
INSERT INTO `ts_uidp_org` VALUES ('6ad0c2b0-d167-46f6-bfac-fc8e0104f1d4', '100003038003004', '大港油田公司所属单位滨港公司滨港机关质量安全环保科', '质量安全环保科', '100003038003', null, '1', '1', '', '12aca031-1992-4cc7-b21a-b9c31339b29a');
INSERT INTO `ts_uidp_org` VALUES ('aa67e2d4-abbf-4621-8739-b1fccaf9292f', '100003038003005', '大港油田公司所属单位滨港公司滨港机关生产运行科', '生产运行科', '100003038003', null, '1', '1', '', '12aca031-1992-4cc7-b21a-b9c31339b29a');
INSERT INTO `ts_uidp_org` VALUES ('f1e23da6-d37a-46e8-a710-3aa7fc38e534', '100003038003006', '大港油田公司所属单位滨港公司滨港机关经营管理科', '经营管理科', '100003038003', null, '1', '1', '', '12aca031-1992-4cc7-b21a-b9c31339b29a');
INSERT INTO `ts_uidp_org` VALUES ('1c993857-7c44-4910-9cf3-b388a8047f41', '100003038004', '大港油田公司所属单位滨港公司滨港直附属', '滨港直附属', '100003038', null, '1', '1', '', '59131782-4d27-403c-b3e5-3a77b05340fa');
INSERT INTO `ts_uidp_org` VALUES ('a59bb1d9-6110-44b9-b3b8-dc13d8ddbd2c', '100003038004001', '大港油田公司所属单位滨港公司滨港直附属HSE监督站', 'HSE监督站', '100003038004', null, '1', '1', '', '1c993857-7c44-4910-9cf3-b388a8047f41');
INSERT INTO `ts_uidp_org` VALUES ('c43f3cef-c1bc-4b8f-b58c-04e88806b644', '100003038005', '大港油田公司所属单位滨港公司滨港所属', '滨港所属', '100003038', null, '1', '1', '', '59131782-4d27-403c-b3e5-3a77b05340fa');
INSERT INTO `ts_uidp_org` VALUES ('e0f78752-e12d-4bc0-806c-fe4ae3253c58', '100003038005001', '大港油田公司所属单位滨港公司滨港所属油气销售分公司', '油气销售分公司', '100003038005', null, '1', '1', '', 'c43f3cef-c1bc-4b8f-b58c-04e88806b644');
INSERT INTO `ts_uidp_org` VALUES ('0a7abb4f-9670-4149-b54c-9ae3a1dbb372', '100003038005001001', '大港油田公司所属单位滨港公司滨港所属油气销售分公司公司领导', '公司领导', '100003038005001', null, '1', '1', '', 'e0f78752-e12d-4bc0-806c-fe4ae3253c58');
INSERT INTO `ts_uidp_org` VALUES ('da0b77a6-b685-4368-9a71-346b803c816e', '100003038005001002', '大港油田公司所属单位滨港公司滨港所属油气销售分公司综合办公室', '综合办公室', '100003038005001', null, '1', '1', '', 'e0f78752-e12d-4bc0-806c-fe4ae3253c58');
INSERT INTO `ts_uidp_org` VALUES ('cc37873b-d60a-43c7-ac50-95b6e64761b4', '100003038005001003', '大港油田公司所属单位滨港公司滨港所属油气销售分公司经营管理部', '经营管理部', '100003038005001', null, '1', '1', '', 'e0f78752-e12d-4bc0-806c-fe4ae3253c58');
INSERT INTO `ts_uidp_org` VALUES ('58103033-6f52-4e9f-9e1d-3f4aeec97687', '100003038005001004', '大港油田公司所属单位滨港公司滨港所属油气销售分公司安全生产管理部', '安全生产管理部', '100003038005001', null, '1', '1', '', 'e0f78752-e12d-4bc0-806c-fe4ae3253c58');
INSERT INTO `ts_uidp_org` VALUES ('8aa09fbf-bb91-46a4-9854-d9f75dc7a2ff', '100003038005001005', '大港油田公司所属单位滨港公司滨港所属油气销售分公司专家', '专家', '100003038005001', null, '1', '1', '', 'e0f78752-e12d-4bc0-806c-fe4ae3253c58');
INSERT INTO `ts_uidp_org` VALUES ('70760bd3-90e0-413f-b899-eef96334c278', '100003038005001006', '大港油田公司所属单位滨港公司滨港所属油气销售分公司监事', '监事', '100003038005001', null, '1', '1', '', 'e0f78752-e12d-4bc0-806c-fe4ae3253c58');
INSERT INTO `ts_uidp_org` VALUES ('13d597f5-6ef0-4131-a40c-98721b44bd4b', '100003038005002', '大港油田公司所属单位滨港公司滨港所属燃气销售分公司', '燃气销售分公司', '100003038005', null, '1', '1', '', 'c43f3cef-c1bc-4b8f-b58c-04e88806b644');
INSERT INTO `ts_uidp_org` VALUES ('dbe870b6-80e0-4a74-b416-73d852cae7ff', '100003038005002001', '大港油田公司所属单位滨港公司滨港所属燃气销售分公司公司领导', '公司领导', '100003038005002', null, '1', '1', '', '13d597f5-6ef0-4131-a40c-98721b44bd4b');
INSERT INTO `ts_uidp_org` VALUES ('2f0e9e38-224e-4d9c-b56f-995baa5e0fda', '100003038005002002', '大港油田公司所属单位滨港公司滨港所属燃气销售分公司综合办公室', '综合办公室', '100003038005002', null, '1', '1', '', '13d597f5-6ef0-4131-a40c-98721b44bd4b');
INSERT INTO `ts_uidp_org` VALUES ('3a9cb514-3893-40cd-ac32-ff885c9474e3', '100003038005002003', '大港油田公司所属单位滨港公司滨港所属燃气销售分公司经营管理部', '经营管理部', '100003038005002', null, '1', '1', '', '13d597f5-6ef0-4131-a40c-98721b44bd4b');
INSERT INTO `ts_uidp_org` VALUES ('5dd4e7fa-4832-4bbf-8d1a-89ee60359b2a', '100003038005002004', '大港油田公司所属单位滨港公司滨港所属燃气销售分公司销售部', '销售部', '100003038005002', null, '1', '1', '', '13d597f5-6ef0-4131-a40c-98721b44bd4b');
INSERT INTO `ts_uidp_org` VALUES ('a9be5eef-7b21-4f99-a766-e1d89a13ba1d', '100003038005002005', '大港油田公司所属单位滨港公司滨港所属燃气销售分公司安全环保部', '安全环保部', '100003038005002', null, '1', '1', '', '13d597f5-6ef0-4131-a40c-98721b44bd4b');
INSERT INTO `ts_uidp_org` VALUES ('c87b3a5b-7677-4f95-93eb-25e44a7c03b0', '100003038005002006', '大港油田公司所属单位滨港公司滨港所属燃气销售分公司LNG运营中心', 'LNG运营中心', '100003038005002', null, '1', '1', '', '13d597f5-6ef0-4131-a40c-98721b44bd4b');
INSERT INTO `ts_uidp_org` VALUES ('968a08a3-93d0-4755-8148-bdc84874f48d', '100003038005002007', '大港油田公司所属单位滨港公司滨港所属燃气销售分公司监事', '监事', '100003038005002', null, '1', '1', '', '13d597f5-6ef0-4131-a40c-98721b44bd4b');
INSERT INTO `ts_uidp_org` VALUES ('c5a7c3e0-0abc-459e-affb-f026061fa356', '100003038005003', '大港油田公司所属单位滨港公司滨港所属油化技服分公司', '油化技服分公司', '100003038005', null, '1', '1', '', 'c43f3cef-c1bc-4b8f-b58c-04e88806b644');
INSERT INTO `ts_uidp_org` VALUES ('0f8a01c6-c911-4592-b930-9dab6f76dc5d', '100003038005003001', '大港油田公司所属单位滨港公司滨港所属油化技服分公司公司领导', '公司领导', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('6f3a218b-85c0-4100-bc26-b3576c035d12', '100003038005003002', '大港油田公司所属单位滨港公司滨港所属油化技服分公司综合管理部', '综合管理部', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('d2531b34-ff8b-4683-85df-f7a47e7bbec0', '100003038005003003', '大港油田公司所属单位滨港公司滨港所属油化技服分公司财务资产部', '财务资产部', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('74b34045-2a6d-4c27-ad69-c58c1d6bf022', '100003038005003004', '大港油田公司所属单位滨港公司滨港所属油化技服分公司市场生产部', '市场生产部', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('d09f8ac4-b0d5-4626-8e5a-f28d44b59caf', '100003038005003005', '大港油田公司所属单位滨港公司滨港所属油化技服分公司经营管理部', '经营管理部', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('a86860e0-d779-4327-970c-158af97a41c1', '100003038005003006', '大港油田公司所属单位滨港公司滨港所属油化技服分公司研究发展部', '研究发展部', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('6b6e5835-31d9-4ca7-b9ea-72fc3d2c0cd4', '100003038005003007', '大港油田公司所属单位滨港公司滨港所属油化技服分公司质安环保部', '质安环保部', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('b1e2c69d-0e57-4063-86c1-e3cacbacaebd', '100003038005003008', '大港油田公司所属单位滨港公司滨港所属油化技服分公司技术服务队', '技术服务队', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('0cdca126-2eb0-47d6-8ef5-66a83a9e4eb6', '100003038005003009', '大港油田公司所属单位滨港公司滨港所属油化技服分公司安装维修队', '安装维修队', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('af8633d8-ea0f-444d-bd0c-ba682028cb95', '100003038005003010', '大港油田公司所属单位滨港公司滨港所属油化技服分公司南港项目部', '南港项目部', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('05333473-43a9-4949-a36f-b352d2a8b50c', '100003038005003011', '大港油田公司所属单位滨港公司滨港所属油化技服分公司第一化工厂', '第一化工厂', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('074eb450-5ca0-4b7a-a36c-3ab815f6e45c', '100003038005003012', '大港油田公司所属单位滨港公司滨港所属油化技服分公司第二化工厂', '第二化工厂', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('fd3bf12e-77d7-4569-9f9b-0555f63fc9ba', '100003038005003013', '大港油田公司所属单位滨港公司滨港所属油化技服分公司人事劳资部', '人事劳资部', '100003038005003', null, '1', '1', '', 'c5a7c3e0-0abc-459e-affb-f026061fa356');
INSERT INTO `ts_uidp_org` VALUES ('41ac3c3e-b80f-418d-802d-a262cf445101', '100003038005004', '大港油田公司所属单位滨港公司滨港所属中雅公司', '中雅公司', '100003038005', null, '1', '1', '', 'c43f3cef-c1bc-4b8f-b58c-04e88806b644');
INSERT INTO `ts_uidp_org` VALUES ('abb6d920-b099-4c1d-891d-003ce177f992', '100003038005004001', '大港油田公司所属单位滨港公司滨港所属中雅公司阴极保护项目部', '阴极保护项目部', '100003038005004', null, '1', '1', '', '41ac3c3e-b80f-418d-802d-a262cf445101');
INSERT INTO `ts_uidp_org` VALUES ('d2d2aef2-873b-4840-9085-35a7a249283b', '100003038005005', '大港油田公司所属单位滨港公司滨港所属综合服务队', '综合服务队', '100003038005', null, '1', '1', '', 'c43f3cef-c1bc-4b8f-b58c-04e88806b644');
INSERT INTO `ts_uidp_org` VALUES ('5f147be6-b2bd-4faf-a4ed-c2eec381faf0', '100003038005006', '大港油田公司所属单位滨港公司滨港所属工艺所', '工艺所', '100003038005', null, '1', '1', '', 'c43f3cef-c1bc-4b8f-b58c-04e88806b644');
INSERT INTO `ts_uidp_org` VALUES ('c12212d1-2b4c-4fdf-9da1-a3b319afb083', '100003038005006001', '大港油田公司所属单位滨港公司滨港所属工艺所所领导', '所领导', '100003038005006', null, '1', '1', '', '5f147be6-b2bd-4faf-a4ed-c2eec381faf0');
INSERT INTO `ts_uidp_org` VALUES ('2264367e-b435-442a-bee0-c87bbc8fce1d', '100003038005006002', '大港油田公司所属单位滨港公司滨港所属工艺所综合室', '综合室', '100003038005006', null, '1', '1', '', '5f147be6-b2bd-4faf-a4ed-c2eec381faf0');
INSERT INTO `ts_uidp_org` VALUES ('c0463d21-4055-4711-addd-c9d4862fd0a9', '100003038005006003', '大港油田公司所属单位滨港公司滨港所属工艺所化学室', '化学室', '100003038005006', null, '1', '1', '', '5f147be6-b2bd-4faf-a4ed-c2eec381faf0');
INSERT INTO `ts_uidp_org` VALUES ('9f99e976-b7e3-4b75-ba2f-ea4f785e866c', '100003038005006004', '大港油田公司所属单位滨港公司滨港所属工艺所工艺室', '工艺室', '100003038005006', null, '1', '1', '', '5f147be6-b2bd-4faf-a4ed-c2eec381faf0');
INSERT INTO `ts_uidp_org` VALUES ('11a1821d-36c2-4040-bbc6-e5f14fcfba5c', '100003038005006005', '大港油田公司所属单位滨港公司滨港所属工艺所检验中心', '检验中心', '100003038005006', null, '1', '1', '', '5f147be6-b2bd-4faf-a4ed-c2eec381faf0');
INSERT INTO `ts_uidp_org` VALUES ('2fc29167-4873-4efd-a5b6-0b2f7ed705a5', '100003038006', '大港油田公司所属单位滨港公司滨海新能油气有限公司', '滨海新能油气有限公司', '100003038', null, '1', '1', '', '59131782-4d27-403c-b3e5-3a77b05340fa');
INSERT INTO `ts_uidp_org` VALUES ('4df9f41e-5b38-4d27-91f6-b5c5f65c9004', '100003038006001', '大港油田公司所属单位滨港公司滨海新能油气有限公司公司领导', '公司领导', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('2a966abf-7211-4254-8e10-5d4b6cb57e8c', '100003038006002', '大港油田公司所属单位滨港公司滨海新能油气有限公司综合管理部', '综合管理部', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('1051789b-6e18-4347-ab24-f72d8a2424f0', '100003038006003', '大港油田公司所属单位滨港公司滨海新能油气有限公司计划财务部', '计划财务部', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('d8073f12-d716-4304-aacb-ab9c0ce9df3e', '100003038006004', '大港油田公司所属单位滨港公司滨海新能油气有限公司安全管理部', '安全管理部', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('62678148-a486-4d82-b71c-999a02aa8a60', '100003038006005', '大港油田公司所属单位滨港公司滨海新能油气有限公司市场管理部', '市场管理部', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('d2636690-9a73-49c8-a81f-b0b0cdcd9b7d', '100003038006006', '大港油田公司所属单位滨港公司滨海新能油气有限公司生产管理部', '生产管理部', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('bdbca9b1-2e47-462d-92ad-4dd8d8cab4cc', '100003038006007', '大港油田公司所属单位滨港公司滨海新能油气有限公司燃气分公司', '燃气分公司', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('86a5b19a-fc2c-4497-8f8c-4f3a9033367d', '100003038006008', '大港油田公司所属单位滨港公司滨海新能油气有限公司贸易事业部', '贸易事业部', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('0190015a-dd39-4136-990c-c956e7118055', '100003038006009', '大港油田公司所属单位滨港公司滨海新能油气有限公司司机班', '司机班', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('44d7467c-049b-4335-922f-57d93e98fd69', '100003038006010', '大港油田公司所属单位滨港公司滨海新能油气有限公司LNG唐山分公司', 'LNG唐山分公司', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('28b948b6-f463-4412-a6ee-54810f308c83', '100003038006011', '大港油田公司所属单位滨港公司滨海新能油气有限公司LNG滨海分公司', 'LNG滨海分公司', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('2ac64ef1-ab47-4750-a2ff-8ddb3ad7c7d8', '100003038006012', '大港油田公司所属单位滨港公司滨海新能油气有限公司LNG蓟县分公司', 'LNG蓟县分公司', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('20d10c6a-a55f-4a6b-952a-cc14601b5962', '100003038006013', '大港油田公司所属单位滨港公司滨海新能油气有限公司LNG静海分公司', 'LNG静海分公司', '100003038006', null, '1', '1', '', '2fc29167-4873-4efd-a5b6-0b2f7ed705a5');
INSERT INTO `ts_uidp_org` VALUES ('38ccad2c-a4b2-4e6c-9b31-5965062c87d5', '100003039', '大港油田公司所属单位天津普丰建设集团有限公司', '天津普丰建设集团有限公司', '100003', null, '1', '1', '', 'c1b6fe38-f991-45f7-9424-76887da7675a');
INSERT INTO `ts_uidp_org` VALUES ('7df8cd8f-ef33-437a-881d-817d6eecca7a', '100003039001', '大港油田公司所属单位天津普丰建设集团有限公司公司领导', '公司领导', '100003039', null, '1', '1', '', '38ccad2c-a4b2-4e6c-9b31-5965062c87d5');
INSERT INTO `ts_uidp_org` VALUES ('a412fc1f-dfbd-4e19-8966-7d767e672057', '100003039002', '大港油田公司所属单位天津普丰建设集团有限公司经理助理', '经理助理', '100003039', null, '1', '1', '', '38ccad2c-a4b2-4e6c-9b31-5965062c87d5');
INSERT INTO `ts_uidp_org` VALUES ('b06147ef-a1bc-41e8-bf00-6142dce42066', '100003039003', '大港油田公司所属单位天津普丰建设集团有限公司公司机关', '公司机关', '100003039', null, '1', '1', '', '38ccad2c-a4b2-4e6c-9b31-5965062c87d5');
INSERT INTO `ts_uidp_org` VALUES ('7a62f501-a682-4c9e-b496-beccd52c2710', '100003039003001', '大港油田公司所属单位天津普丰建设集团有限公司公司机关综合办公室', '综合办公室', '100003039003', null, '1', '1', '', 'b06147ef-a1bc-41e8-bf00-6142dce42066');
INSERT INTO `ts_uidp_org` VALUES ('14b2ba3c-6b59-48a6-9245-63d7ffbb55c3', '100003039003002', '大港油田公司所属单位天津普丰建设集团有限公司公司机关市场管理科', '市场管理科', '100003039003', null, '1', '1', '', 'b06147ef-a1bc-41e8-bf00-6142dce42066');
INSERT INTO `ts_uidp_org` VALUES ('694750fa-14ee-4c34-acd2-889c6e5e9c1b', '100003039003003', '大港油田公司所属单位天津普丰建设集团有限公司公司机关经营管理科', '经营管理科', '100003039003', null, '1', '1', '', 'b06147ef-a1bc-41e8-bf00-6142dce42066');
INSERT INTO `ts_uidp_org` VALUES ('370d2e9a-5969-45de-a5a6-cd4c35ae4a8a', '100003039003004', '大港油田公司所属单位天津普丰建设集团有限公司公司机关财务资产科', '财务资产科', '100003039003', null, '1', '1', '', 'b06147ef-a1bc-41e8-bf00-6142dce42066');
INSERT INTO `ts_uidp_org` VALUES ('f8935c96-0341-4d38-9178-53bd66ca133d', '100003039003005', '大港油田公司所属单位天津普丰建设集团有限公司公司机关安全环保科', '安全环保科', '100003039003', null, '1', '1', '', 'b06147ef-a1bc-41e8-bf00-6142dce42066');
INSERT INTO `ts_uidp_org` VALUES ('fcba2df3-96fe-41e4-9fa8-e410f7c63257', '100003039003006', '大港油田公司所属单位天津普丰建设集团有限公司公司机关技术质量科', '技术质量科', '100003039003', null, '1', '1', '', 'b06147ef-a1bc-41e8-bf00-6142dce42066');
INSERT INTO `ts_uidp_org` VALUES ('8e3aee82-699c-4a1f-8e81-10acc5df47f1', '100003039004', '大港油田公司所属单位天津普丰建设集团有限公司直属单位', '直属单位', '100003039', null, '1', '1', '', '38ccad2c-a4b2-4e6c-9b31-5965062c87d5');
INSERT INTO `ts_uidp_org` VALUES ('6c4f8c9e-9d6b-4bdd-b8e1-0f70515f9c54', '100003039004001', '大港油田公司所属单位天津普丰建设集团有限公司直属单位生产管理部', '生产管理部', '100003039004', null, '1', '1', '', '8e3aee82-699c-4a1f-8e81-10acc5df47f1');
INSERT INTO `ts_uidp_org` VALUES ('bc36a9e3-23bc-40c5-8293-1787e294d725', '100003039004002', '大港油田公司所属单位天津普丰建设集团有限公司直属单位安全监督站', '安全监督站', '100003039004', null, '1', '1', '', '8e3aee82-699c-4a1f-8e81-10acc5df47f1');
INSERT INTO `ts_uidp_org` VALUES ('9870295f-07bc-499f-bdb1-38e504d122e0', '100003039004003', '大港油田公司所属单位天津普丰建设集团有限公司直属单位预算站', '预算站', '100003039004', null, '1', '1', '', '8e3aee82-699c-4a1f-8e81-10acc5df47f1');
INSERT INTO `ts_uidp_org` VALUES ('337057c0-043c-4c75-9593-825a59e927f6', '100003039005', '大港油田公司所属单位天津普丰建设集团有限公司其他', '其他', '100003039', null, '1', '1', '', '38ccad2c-a4b2-4e6c-9b31-5965062c87d5');
INSERT INTO `ts_uidp_org` VALUES ('52489354-98cc-43a8-9430-d36a7591adec', '100003039006', '大港油田公司所属单位天津普丰建设集团有限公司普丰房地产分公司', '普丰房地产分公司', '100003039', null, '1', '1', '', '38ccad2c-a4b2-4e6c-9b31-5965062c87d5');
INSERT INTO `ts_uidp_org` VALUES ('af9b6b53-92f5-4fbe-9bd9-3b4e688f6406', '100003039007', '大港油田公司所属单位天津普丰建设集团有限公司隆达建筑安装分公司', '隆达建筑安装分公司', '100003039', null, '1', '1', '', '38ccad2c-a4b2-4e6c-9b31-5965062c87d5');
INSERT INTO `ts_uidp_org` VALUES ('469bc263-d451-4df8-afae-c7e9184dd77b', '100003039008', '大港油田公司所属单位天津普丰建设集团有限公司宏伟建筑安装分公司', '宏伟建筑安装分公司', '100003039', null, '1', '1', '', '38ccad2c-a4b2-4e6c-9b31-5965062c87d5');
INSERT INTO `ts_uidp_org` VALUES ('d0baa954-7b30-4f14-906a-535a620b54d5', '100003039009', '大港油田公司所属单位天津普丰建设集团有限公司港发建筑安装分公司', '港发建筑安装分公司', '100003039', null, '1', '1', '', '38ccad2c-a4b2-4e6c-9b31-5965062c87d5');
INSERT INTO `ts_uidp_org` VALUES ('453837bb-0ed4-42a4-8c02-51cd489f558d', '100003039010', '大港油田公司所属单位天津普丰建设集团有限公司物业管理分公司', '物业管理分公司', '100003039', null, '1', '1', '', '38ccad2c-a4b2-4e6c-9b31-5965062c87d5');
INSERT INTO `ts_uidp_org` VALUES ('127cda86-00cc-43d3-b626-59d448cafb3c', '200', '第三方合作企业', '合作企业', '', null, '1', '1', '', '');
INSERT INTO `ts_uidp_org` VALUES ('d406852f-b9a0-4a6c-92ce-8b25fc9412ca', '200001', '创智信息技术(天津)有限公司', '创智信息', '200', null, '1', '1', '', '127cda86-00cc-43d3-b626-59d448cafb3c');
INSERT INTO `ts_uidp_org` VALUES ('af026b38-5278-465e-b7e1-af93ec28582b', '200002', '合作单位002', '合作单位002', '200', null, '1', '1', '', '127cda86-00cc-43d3-b626-59d448cafb3c');

-- ----------------------------
-- Table structure for ts_uidp_org_user
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_org_user`;
CREATE TABLE `ts_uidp_org_user` (
  `ORG_ID` varchar(50) DEFAULT NULL,
  `USER_ID` varchar(50) DEFAULT NULL,
  UNIQUE KEY `idx_orguserinfo` (`ORG_ID`,`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='记录系统中组织机构和用户之间的关系';

-- ----------------------------
-- Records of ts_uidp_org_user
-- ----------------------------
INSERT INTO `ts_uidp_org_user` VALUES ('84e9a85d-38d2-461e-9e2b-b128bb9e188c', '2a474344-0d65-48a4-8735-b8a2371160d4');
INSERT INTO `ts_uidp_org_user` VALUES ('d406852f-b9a0-4a6c-92ce-8b25fc9412ca', 'e0ff3b1e-1ec4-4c06-8b14-97f518731469');

-- ----------------------------
-- Table structure for ts_uidp_post
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_post`;
CREATE TABLE `ts_uidp_post` (
  `POST_ID` varchar(30) DEFAULT NULL,
  `POST_CODE` varchar(20) DEFAULT NULL,
  `POST_NAME` varchar(20) DEFAULT NULL,
  `POST_CODE_UPPER` varchar(20) DEFAULT NULL,
  `REMARK` varchar(120) DEFAULT NULL,
  UNIQUE KEY `Index_postinfo` (`POST_ID`,`POST_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定义平台内的所有岗位信息';

-- ----------------------------
-- Records of ts_uidp_post
-- ----------------------------

-- ----------------------------
-- Table structure for ts_uidp_post_user
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_post_user`;
CREATE TABLE `ts_uidp_post_user` (
  `POST_ID` varchar(30) DEFAULT NULL,
  `USER_ID` varchar(30) DEFAULT NULL,
  UNIQUE KEY `idx_post_userinfo` (`POST_ID`,`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录系统中岗位和用户之间的关系';

-- ----------------------------
-- Records of ts_uidp_post_user
-- ----------------------------

-- ----------------------------
-- Table structure for ts_uidp_powerinfo
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_powerinfo`;
CREATE TABLE `ts_uidp_powerinfo` (
  `USER_ID` varchar(50) DEFAULT NULL,
  `MENU_ID` varchar(50) DEFAULT NULL,
  UNIQUE KEY `Idx_powerinfo` (`USER_ID`,`MENU_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录当前平台下的用户和组权限';

-- ----------------------------
-- Records of ts_uidp_powerinfo
-- ----------------------------

-- ----------------------------
-- Table structure for ts_uidp_synchro_config
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_synchro_config`;
CREATE TABLE `ts_uidp_synchro_config` (
  `SYNC_ID` varchar(20) NOT NULL COMMENT '同步ID',
  `SERVER_IP` varchar(255) DEFAULT NULL COMMENT '服务器地址',
  `SERVER_PORT` varchar(20) DEFAULT NULL COMMENT '服务器端口号',
  `SERVER_URL` varchar(255) DEFAULT NULL COMMENT '服务地址',
  `SYNC_FLAG` int(11) DEFAULT NULL COMMENT '同步标识',
  `REMARK` varchar(1000) DEFAULT NULL COMMENT '备注',
  `IS_DELETE` int(11) DEFAULT NULL COMMENT '是否删除',
  `USER_CODE` varchar(50) DEFAULT NULL COMMENT '账户',
  `USER_PASS` varchar(50) DEFAULT NULL COMMENT '密码',
  `SYNC_TYPE` varchar(20) DEFAULT NULL COMMENT '同步类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ts_uidp_synchro_config
-- ----------------------------
INSERT INTO `ts_uidp_synchro_config` VALUES ('1', '192.168.1.113', '12345', '/Org/syncOrg', '0', null, '0', 'ceshi02', '123456', '0');
INSERT INTO `ts_uidp_synchro_config` VALUES ('2', '192.168.1.116', '12345', '/Org/syncOrg', '0', null, '0', 'ceshi02', '123456', '0');

-- ----------------------------
-- Table structure for ts_uidp_synchro_result
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_synchro_result`;
CREATE TABLE `ts_uidp_synchro_result` (
  `RESULT_ID` varchar(50) DEFAULT NULL,
  `SEND_URL` varchar(255) DEFAULT NULL COMMENT '发送地址',
  `RECEIVE_URL` varchar(255) DEFAULT NULL COMMENT '接收地址',
  `SYNC_CONTENT` varchar(500) DEFAULT NULL COMMENT '同步内容',
  `SYNC_RESULT` int(11) DEFAULT NULL COMMENT '同步结果',
  `ERROR_INFO` varchar(1000) DEFAULT NULL COMMENT '异常信息',
  `REMARK` varchar(1000) DEFAULT NULL COMMENT '备注',
  `FAIL_CONTENT` varchar(2000) DEFAULT NULL COMMENT '失败内容',
  `SYNC_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '同步时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ts_uidp_synchro_result
-- ----------------------------
INSERT INTO `ts_uidp_synchro_result` VALUES ('e5e05b6a-78cd-4420-b69d-9f7ac8e1ade4', '::1', '192.168.1.113', '云组织同步推送成功', '0', '', '', '', '2018-07-24 15:19:04');
INSERT INTO `ts_uidp_synchro_result` VALUES ('541ddd5c-5924-4979-998a-282d7dcbae5b', '::1', '192.168.1.113', '云组织同步推送失败！INSERT 语句中行值表达式的数目超出了允许的最大行值数 1000。', '0', '', '', '', '2018-07-30 15:42:14');
INSERT INTO `ts_uidp_synchro_result` VALUES ('358aeb93-4c43-47ca-a80f-4fcca2621ccd', '192.168.1.107', '127.0.0.1', '云组织同步接收成功', '0', '', '', '', '2018-08-03 16:10:19');
INSERT INTO `ts_uidp_synchro_result` VALUES ('4c5ecf30-c0f4-417d-87b4-adbeed9b9e79', '192.168.1.107', '127.0.0.1', '云组织同步接收成功', '0', '', '', '', '2018-08-03 16:11:11');
INSERT INTO `ts_uidp_synchro_result` VALUES ('045d351f-ac23-4b2b-88de-a688ccd3ed7b', '192.168.1.107', '127.0.0.1', '云组织同步接收成功', '0', '', '', '', '2018-08-03 16:14:41');

-- ----------------------------
-- Table structure for ts_uidp_sysinfo
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_sysinfo`;
CREATE TABLE `ts_uidp_sysinfo` (
  `SYS_ID` varchar(50) DEFAULT NULL COMMENT '系统唯一标识',
  `SYS_CODE` varchar(20) DEFAULT NULL,
  `SYS_NAME` varchar(40) DEFAULT NULL,
  `SYS_STYLE` varchar(20) DEFAULT NULL,
  `SYS_LOGO` varchar(300) DEFAULT NULL,
  `SYS_URL` varchar(300) DEFAULT NULL,
  `SYS_ORDER` int(11) DEFAULT NULL COMMENT '用于系统显示时的缺省顺序',
  `SYS_ADMIN` varchar(30) DEFAULT NULL COMMENT '将系统中的某个用户设置为管理员，用于系统的管理',
  UNIQUE KEY `idx_sysinfo` (`SYS_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='记录平台在建的系信信息';

-- ----------------------------
-- Records of ts_uidp_sysinfo
-- ----------------------------

-- ----------------------------
-- Table structure for ts_uidp_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_userinfo`;
CREATE TABLE `ts_uidp_userinfo` (
  `USER_ID` varchar(50) DEFAULT NULL COMMENT '系统自动生成的用户唯一ID',
  `USER_CODE` varchar(50) DEFAULT NULL,
  `USER_NAME` varchar(20) DEFAULT NULL,
  `USER_ALIAS` varchar(20) DEFAULT NULL,
  `USER_PASS` varchar(20) DEFAULT NULL,
  `USER_SEX` int(11) DEFAULT '0' COMMENT '0：男性；1：女性',
  `PHONE_MOBILE` varchar(20) DEFAULT NULL,
  `PHONE_OFFICE` varchar(20) DEFAULT NULL,
  `PHONE_ORG` varchar(10) DEFAULT NULL,
  `USER_EMAIL` varchar(100) DEFAULT NULL,
  `EMAIL_OFFICE` varchar(100) DEFAULT NULL,
  `USER_IP` varchar(100) DEFAULT NULL COMMENT '分配的IP地址，多个地址用逗号分隔',
  `REG_TIME` datetime DEFAULT NULL,
  `FLAG` int(11) DEFAULT '0' COMMENT '1：激活；0：未激活',
  `USER_DOMAIN` varchar(30) DEFAULT NULL COMMENT '对应的域账户',
  `REMARK` varchar(120) DEFAULT NULL,
  `USER_ERP` varchar(30) DEFAULT NULL,
  `ASSOCIATED_ACCOUNT` varchar(150) DEFAULT NULL,
  `AUTHENTICATION_TYPE` int(11) DEFAULT NULL,
  UNIQUE KEY `idx_userinfo` (`USER_ID`) USING BTREE,
  KEY `idx_userinfo2` (`USER_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='平台用户信息表，包括所有应用系统的用户信息';

-- ----------------------------
-- Records of ts_uidp_userinfo
-- ----------------------------
INSERT INTO `ts_uidp_userinfo` VALUES ('2a474344-0d65-48a4-8735-b8a2371160d4', '', '管理员001', null, '123456', '1', '', '', null, '', null, '', '2018-08-20 13:19:15', '1', 'admin001', '', null, null, '0');
INSERT INTO `ts_uidp_userinfo` VALUES ('e0ff3b1e-1ec4-4c06-8b14-97f518731469', '', '合作单位001', null, '123456', '1', '', '', null, '', null, '', '2018-08-20 13:20:00', '1', 'czxx001', '', null, null, '0');

-- ----------------------------
-- Table structure for ts_uidp_useronline
-- ----------------------------
DROP TABLE IF EXISTS `ts_uidp_useronline`;
CREATE TABLE `ts_uidp_useronline` (
  `USER_ID` varchar(30) DEFAULT NULL,
  `USER_NAME` varchar(20) DEFAULT NULL,
  `USER_IPADDR` varchar(20) DEFAULT NULL,
  `DATE_ONLINE` datetime DEFAULT NULL,
  `DATE_OFFLINE` datetime DEFAULT NULL,
  `REMARK` varchar(120) DEFAULT NULL,
  UNIQUE KEY `Index_useronline` (`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录所在用户时候在线';

-- ----------------------------
-- Records of ts_uidp_useronline
-- ----------------------------
