CREATE TABLE `base_dict` (
	`dict_id` bigint(32) NOT NULL COMMENT '�����ֵ�id(����)',
	`dict_type_code` varchar(10) NOT NULL COMMENT '�����ֵ�������',
	`dict_type_name` varchar(64) NOT NULL COMMENT '�����ֵ��������',
	`dict_item_name` varchar(64) NOT NULL COMMENT '�����ֵ���Ŀ����',
	`dict_item_code` varchar(10) DEFAULT NULL COMMENT '�����ֵ���Ŀ���(��Ϊ��)',
	`dict_sort` int(10) DEFAULT NULL COMMENT '�����ֶ�',
	`dict_enable` char(1) NOT NULL COMMENT '1:ʹ�� 0:ͣ��',
	`dict_memo` varchar(64) DEFAULT NULL COMMENT '��ע',
	PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
