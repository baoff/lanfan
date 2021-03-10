CREATE TABLE `cst_linkman` (
	`lkm_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '��ϵ�˱��(����)',
	`lkm_name` varchar(16) DEFAULT NULL COMMENT '��ϵ������',
	`lkm_cust_id` bigint(32) NOT NULL COMMENT '�ͻ�id',
	`lkm_gender` char(1) DEFAULT NULL COMMENT '��ϵ���Ա�',
	`lkm_phone` varchar(16) DEFAULT NULL COMMENT '��ϵ�˰칫�绰',
	`lkm_mobile` varchar(16) DEFAULT NULL COMMENT '��ϵ���ֻ�',
	`lkm_email` varchar(64) DEFAULT NULL COMMENT '��ϵ������',
	`lkm_qq` varchar(16) DEFAULT NULL COMMENT '��ϵ��qq',
	`lkm_position` varchar(16) DEFAULT NULL COMMENT '��ϵ��ְλ',
	`lkm_memo` varchar(512) DEFAULT NULL COMMENT '��ϵ�˱�ע',
	PRIMARY KEY (`lkm_id`),
	KEY `FK_cst_linkman_lkm_cust_id` (`lkm_cust_id`),
	CONSTRAINT `FK_cst_linkman_lkm_cust_id` FOREIGN KEY (`lkm_cust_id`) REFERENCES `cst_customer` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
