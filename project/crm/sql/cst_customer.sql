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


CREATE TABLE `cst_customer` (
  `cust_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '�ͻ����(����)',
  `cust_name` varchar(32) NOT NULL COMMENT '�ͻ�����(��˾����)',
  cust_source bigint(32) not null,
	cust_industry bigint(32) not null,
	cust_level bigint(32) not null,
  `cust_phone` varchar(64) DEFAULT NULL COMMENT '�̶��绰',
  `cust_mobile` varchar(16) DEFAULT NULL COMMENT '�ƶ��绰',
  `cust_image` varchar(255) DEFAULT NULL COMMENT '�ƶ��绰'
  PRIMARY KEY (`cust_id`),
	FOREIGN key(cust_source) REFERENCES base_dict(dict_id),
	FOREIGN key(cust_industry) REFERENCES base_dict(dict_id),
	FOREIGN key(cust_level) REFERENCES base_dict(dict_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;