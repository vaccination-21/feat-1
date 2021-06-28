

use spring;

CREATE TABLE userTBL
(
    `tid`           integer            NOT NULL    AUTO_INCREMENT COMMENT '프라이머리 키', 
    `email`         VARCHAR(45)    NOT NULL    COMMENT '아이디', 
    `pwd`           VARCHAR(100)    NOT NULL    COMMENT '비밀번호', 
    `name`          VARCHAR(45)    NOT NULL    COMMENT '이름', 
    `nickname`      VARCHAR(45)    NOT NULL    COMMENT '닉네임',
	`birth`         DATE           NOT NULL    COMMENT '생년월일', 
    `phone`         VARCHAR(45)    NOT NULL    COMMENT '휴대폰번호', 
    `creationDate`  TIMESTAMP      NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '생성일', 
    CONSTRAINT  PRIMARY KEY (tid)
);

select * from userTBL;