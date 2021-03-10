CREATE TABLE `sale_visit` (
	`visit_id` bigint(32) NOT NULL AUTO_INCREMENT,
	`visit_cust_id` bigint(32) DEFAULT NULL COMMENT '�ͻ�id',
	`visit_user_id` bigint(32) DEFAULT NULL COMMENT '������id',
	`visit_time` date DEFAULT NULL COMMENT '�ݷ�ʱ��',
	`visit_addr` varchar(128) DEFAULT NULL COMMENT '�ݷõص�',
	`visit_detail` varchar(256) DEFAULT NULL COMMENT '�ݷ�����',
	`visit_nexttime` date DEFAULT NULL COMMENT '�´ΰݷ�ʱ��',
	PRIMARY KEY (`visit_id`),
	KEY `FK_sale_visit_cust_id` (`visit_cust_id`),
	KEY `FK_sale_visit_user_id` (`visit_user_id`),
	CONSTRAINT `FK_sale_visit_cust_id` FOREIGN KEY (`visit_cust_id`) REFERENCES `cst_customer` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT `FK_sale_visit_user_id` FOREIGN KEY (`visit_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
