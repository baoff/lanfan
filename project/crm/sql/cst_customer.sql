CREATE TABLE `cst_customer` (
	`cust_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '�ͻ����(����)',
	`cust_name` varchar(32) NOT NULL COMMENT '�ͻ�����(��˾����)',
	`cust_source` varchar(32) DEFAULT NULL COMMENT '�ͻ���Ϣ��Դ',
	`cust_industry` varchar(32) DEFAULT NULL COMMENT '�ͻ�������ҵ',
	`cust_level` varchar(32) DEFAULT NULL COMMENT '�ͻ�����',
	`cust_phone` varchar(64) DEFAULT NULL COMMENT '�̶��绰',
	`cust_mobile` varchar(16) DEFAULT NULL COMMENT '�ƶ��绰',
	PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
