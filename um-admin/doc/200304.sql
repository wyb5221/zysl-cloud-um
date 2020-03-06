ALTER TABLE `um`.`sys_role`
DROP COLUMN `code`,
ADD COLUMN `code` varchar(256) NULL COMMENT '权限说明' AFTER `del_flag`;
ALTER TABLE `um`.`sys_service`
DROP COLUMN `secret`,
ADD COLUMN `secret` varchar(256) NULL COMMENT 'jwt签名' AFTER `del_flag`;