CREATE TABLE `sys_user` (
	`user_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '�û�id',
	`user_code` varchar(32) NOT NULL COMMENT '�û��˺�',
	`user_name` varchar(64) NOT NULL COMMENT '�û�����',
	`user_password` varchar(32) NOT NULL COMMENT '�û�����',
	`user_state` char(1) NOT NULL COMMENT '1:����,0:��ͣ',
	PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
