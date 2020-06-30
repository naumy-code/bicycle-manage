/*
SQLyog Ultimate v8.32 
MySQL - 5.5.40 : Database - itcaststore
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`itcaststore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `itcaststore`;

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `n_time` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`n_id`,`title`,`details`,`n_time`) values (1,'暂停当日达业务','尊敬的网上书城用户， 　　<br>\r\n　　为了让大家有更好的购物体验，3月25日起，当日达业务关小黑屋回炉升级！<br>具体开放时间请留意公告，感谢大家的支持与理解，祝大家购物愉快！<br>\r\n3月23日<br>\r\n传智播客 网上书城系统管理部<br>','20160111113420'),(2,'年货礼包兑换时间通知','尊敬的网上书城用户：\r\n    非常抱歉，因为年后部分供应商工厂开工较晚，导致个别商品到货延迟。\r\n    基于此，15年年货礼包的兑换入口会延期到3月17日，请您在有效期内完成兑换。\r\n    以下礼包预计本周四，即3月12日到货。造成不便深表歉意，敬请谅解。','20160111113411');

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL DEFAULT '',
  `product_id` varchar(100) NOT NULL DEFAULT '',
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`order_id`,`product_id`,`buynum`) 
values ('0c0796f2-0124-4a13-a891-5efbb63b04f9','26ddd0c6-d7f2-4a83-b01b-286bb8c38420',1),
('305a7870-3820-4079-b6f9-5d2b63cbcd2a','26ddd0c6-d7f2-4a83-b01b-286bb8c38420',1),
('611f80fa-4273-4674-be09-9530b6276e15','26ddd0c6-d7f2-4a83-b01b-286bb8c38420',1),
('677a7314-0e16-4e18-8aec-552f848e0d75','26ddd0c6-d7f2-4a83-b01b-286bb8c38420',1),
('677a7314-0e16-4e18-8aec-552f848e0d75','72c52302-cd1e-4a22-8ac8-dc300a915be5',1),
('6f591522-7a2a-4a31-899d-ef1181c72f5f','26ddd0c6-d7f2-4a83-b01b-286bb8c38420',1),
('7ae96e6d-4600-41a5-bc5d-143b34ba61db','3cdd01d2-95d4-4077-b512-ff4c3b340d6b',1),
('a5bfb13d-9085-4374-94d9-4864b4d618ab','3cdd01d2-95d4-4077-b512-ff4c3b340d6b',1),
('c4b2bfff-1694-4e28-bcf8-fa7169bfc978','3cdd01d2-95d4-4077-b512-ff4c3b340d6b',2),
('c4b2bfff-1694-4e28-bcf8-fa7169bfc978','72c52302-cd1e-4a22-8ac8-dc300a915be5',2),
('d88d75cd-15e3-4622-801d-4cad902aeaa1','72c52302-cd1e-4a22-8ac8-dc300a915be5',1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int(11) DEFAULT '0',
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`money`,`receiverAddress`,`receiverName`,`receiverPhone`,`paystate`,`ordertime`,`user_id`) 
values ('0c0796f2-0124-4a13-a891-5efbb63b04f9',44.5,'四川省广元市剑阁县剑门关镇888号','hanyongmeng','15207545526',1,'2016-05-18 10:36:36',4),
('305a7870-3820-4079-b6f9-5d2b63cbcd2a',59,'四川省绵阳市南山中学','huangyun','13041019968',0,'2016-03-13 15:14:54',3),
('611f80fa-4273-4674-be09-9530b6276e15',89,'四川省成都市锦江区四川大学锦江学院','huangyun','13041019968',1,'2016-04-10 18:00:36',3),
('677a7314-0e16-4e18-8aec-552f848e0d75',65,'广西壮族自治区南宁市西乡塘区','hanyongmeng','15207545526',0,'2016-05-18 11:33:25',4),
('6f591522-7a2a-4a31-899d-ef1181c72f5f',1399,'四川省德阳市四川建筑职业技术学院','madan','13269219270',0,'2016-01-10 18:00:36',2),
('7ae96e6d-4600-41a5-bc5d-143b34ba61db',658,'北京市昌平区建材城西路','madan','13269219270',0,'2016-02-25 10:44:56',2),
('a5bfb13d-9085-4374-94d9-4864b4d618ab',25,'海淀区圆明园西路','hanyongmeng','13455260812',1,'2016-05-25 10:43:40',4),
('c4b2bfff-1694-4e28-bcf8-fa7169bfc978',129,'北京市昌平区北七家镇','hanyongmeng','15207545526',1,'2016-05-18 10:36:22',4),
('d88d75cd-15e3-4622-801d-4cad902aeaa1',25,'广西壮族自治区南宁市朝阳区东路88号','hanyongmeng','13848399998',1,'2016-02-25 10:44:23',4);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`price`,`category`,`pnum`,`imgurl`,`description`) 
values ('26ddd0c6-d7f2-4a83-b01b-286bb8c38420','永久山地车',1399,'山地车',300,'/Commoditymanagement/img/6.jpg','这辆山地车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧'),
('3a0196b2-71c1-4d4d-a4e8-d1f875096f00','永久自行车',899,'折叠车',400,'/Commoditymanagement/img/7.jpg','这辆自行车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧'),
('3cdd01d2-95d4-4077-b512-ff4c3b340d6b','凤凰自行车',658,'折叠车',600,'/Commoditymanagement/img/9.jpg','这辆自行车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧'),
('4dbac6bb-ac2a-4ea0-a62f-ea5a2fc2b3c2','捷安自行车',998,'公路车',700,'/Commoditymanagement/img/4.jpg','这辆自行车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧'),
('67a44950-935a-4dac-953d-515fd92d8174','捷安自行车',798,'公路车',700,'/Commoditymanagement/img/2.jpg','这辆自行车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧'),
('72c52302-cd1e-4a22-8ac8-dc300a915be5','捷安自行车',598,'公路车',100,'/Commoditymanagement/img/16.jpg','这辆自行车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧');

CREATE TABLE `groupproducts` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `groupmax` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert  into `groupproducts`(`id`,`name`,`price`,`category`,`pnum`,`groupmax`,`imgurl`,`description`) 
values ('26ddd0c6-d7f2-4a83-b01b-286bb8c38420','永久山地车',1399,'山地车',300,5,'/Commoditymanagement/img/6.jpg','这辆山地车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧'),
('3a0196b2-71c1-4d4d-a4e8-d1f875096f00','永久自行车',899,'折叠车',400,4,'/Commoditymanagement/img/7.jpg','这辆自行车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧'),
('3cdd01d2-95d4-4077-b512-ff4c3b340d6b','凤凰自行车',658,'折叠车',600,3,'/Commoditymanagement/img/9.jpg','这辆自行车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧'),
('4dbac6bb-ac2a-4ea0-a62f-ea5a2fc2b3c2','捷安自行车',998,'公路车',700,15,'/Commoditymanagement/img/4.jpg','这辆自行车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧'),
('67a44950-935a-4dac-953d-515fd92d8174','捷安自行车',798,'公路车',700,7,'/Commoditymanagement/img/2.jpg','这辆自行车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧'),
('72c52302-cd1e-4a22-8ac8-dc300a915be5','捷安自行车',598,'公路车',100,6,'/Commoditymanagement/img/16.jpg','这辆自行车很棒，耐久力超强，配备超强减震，舒适感极佳，相信能给你带来不一样的体验，赶快拥有它吧');


/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `activeCode` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `role` varchar(10) DEFAULT '普通用户',
  `registTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`PASSWORD`,`gender`,`email`,`telephone`,`introduce`,`activeCode`,`state`,`role`,`registTime`) 
values (1,'admin','123456','男','huan9yun@163.com','13041019968','我是超级管理员，我可以登录后台管理系统','49338fdc-d8c9-46fa-8391-0fac7bf09707',1,'超级用户','2015-03-19 16:16:40'),
(2,'madan','123456','女','huan9yun@163.com','13269219270','我是一个课程设计师','c1cc1229-f0ac-41b4-920c-dfef9f8a96a3',1,'普通用户','2015-03-19 18:12:36'),
(3,'huangyun','123456','男','huan9yun@163.com','13041019968','大家好，我是黄云','d0827d1d-dc0d-4cdc-8710-678ce917880e',1,'普通用户','2015-03-20 17:36:38'),
(4,'hanyongmeng','123456','男','itcast_hym@163.com','15207545526','课程设计师','da483412-1e34-43cf-aef2-4925748c811d',1,'普通用户','2016-01-21 15:19:32'),
(5,'tianjiao','123456','男','hanyongmeng@126.cn','15207545526','da483412-1e34-43cf-aef2-4925748c811d','f8173f4f-debe-4d32-8117-b228d555d822',0,'普通用户','2016-02-18 15:32:01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


create table message(
	id int primary key auto_increment,
    productid varchar(100) NOT NULL DEFAULT '',
	title varchar(50) not null,
	name  varchar(10),
	time datetime not null,
	content varchar(2000),
	mail varchar(50),
    imgurl varchar(100) DEFAULT NULL,
    user_id int(11) DEFAULT NULL
);

insert into message
values ('1','26ddd0c6-d7f2-4a83-b01b-286bb8c38420','捷安自行车','madan','2012-11-11','这辆自行车很不错','3111544162@qq.com','/Commoditymanagement/img/6.jpg','1'),
		(null,'3a0196b2-71c1-4d4d-a4e8-d1f875096f00','捷安自行车','madan','2012-11-11','这辆车是真的很不错，太爱这辆车了','3111544162@qq.com','/Commoditymanagement/img/6.jpg','1'),
        (null,'3a0196b2-71c1-4d4d-a4e8-d1f875096f00','捷安自行车','小兆','2012-11-11','我想口吐芬芳！哈哈','3111544162@qq.com','/Commoditymanagement/img/6.jpg','2'),
        (null,'3a0196b2-71c1-4d4d-a4e8-d1f875096f00','捷安自行车','huangyun','2012-11-11','我觉的这辆车有很多不足','3111544162@qq.com','/Commoditymanagement/img/6.jpg','3'),
        (null,'3a0196b2-71c1-4d4d-a4e8-d1f875096f00','捷安自行车','huangyun','2012-11-11','我觉的这辆车有很多不足，刹车不灵活。差点把我摔了','3111544162@qq.com','/Commoditymanagement/img/6.jpg','4'),
		(null,'3cdd01d2-95d4-4077-b512-ff4c3b340d6b','捷安自行车','huangyun','2012-11-11','垃圾商家，做的是什么玩意儿！！！差评！','3111544162@qq.com','/Commoditymanagement/img/6.jpg','2'),
        (null,'3cdd01d2-95d4-4077-b512-ff4c3b340d6b','捷安自行车','小丁','2012-11-11','垃圾商家，做的是什么玩意儿！！！差评！','3111544162@qq.com','/Commoditymanagement/img/6.jpg','3'),
        (null,'3cdd01d2-95d4-4077-b512-ff4c3b340d6b','捷安自行车','小丁','2012-11-11','做尼玛的什么鬼东西，垃圾商家坑钱！','3111544162@qq.com','/Commoditymanagement/img/6.jpg','4'),
        (null,'3cdd01d2-95d4-4077-b512-ff4c3b340d6b','捷安自行车','18877165','2012-11-11','我太喜欢这辆车了，收到之后迫不及待的想骑它！','3111544162@qq.com','/Commoditymanagement/img/6.jpg','5'),
        (null,'4dbac6bb-ac2a-4ea0-a62f-ea5a2fc2b3c2','捷安自行车','小黄','2012-11-11','这辆车还是挺不错的呢，现在上班下班都在使用这辆车。太开心了','3111544162@qq.com','/Commoditymanagement/img/6.jpg','4'),
        (null,'4dbac6bb-ac2a-4ea0-a62f-ea5a2fc2b3c2','捷安自行车','黄远','2012-11-11','这辆车还是挺不错的呢，现在上班下班都在使用这辆车。太开心了','3111544162@qq.com','/Commoditymanagement/img/6.jpg','3'),
        (null,'4dbac6bb-ac2a-4ea0-a62f-ea5a2fc2b3c2','捷安自行车','黄葆琳','2012-11-11','这辆车还是挺不错的呢，现在上班下班都在使用这辆车。太开心了','3111544162@qq.com','/Commoditymanagement/img/6.jpg','4'),
        (null,'67a44950-935a-4dac-953d-515fd92d8174','捷安自行车','最爱这片风景','2012-11-11','我都服了！客户是怎么回事','3111544162@qq.com','/Commoditymanagement/img/6.jpg','5'),
        (null,'72c52302-cd1e-4a22-8ac8-dc300a915be5','捷安自行车','小黄','2012-11-11','这辆车后劲十足呢！','3111544162@qq.com','/Commoditymanagement/img/6.jpg','3');
        
        
DROP TABLE IF EXISTS `grouporders`;

CREATE TABLE `grouporders` (
  `id` varchar(100) NOT NULL,
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int(11) DEFAULT '0',
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `grouporders`(`id`,`money`,`receiverAddress`,`receiverName`,`receiverPhone`,`paystate`,`ordertime`,`user_id`) 
values ('0c0796f2-0124-4a13-a891-5efbb63b04f9',44.5,'四川省广元市剑阁县剑门关镇888号','hanyongmeng','15207545526',1,'2016-05-18 10:36:36',4),
('305a7870-3820-4079-b6f9-5d2b63cbcd2a',59,'四川省绵阳市南山中学','huangyun','13041019968',0,'2016-01-13 15:14:54',3),
('611f80fa-4273-4674-be09-9530b6276e15',89,'四川省成都市锦江区四川大学锦江学院','huangyun','13041019968',1,'2016-01-10 18:00:36',3),
('677a7314-0e16-4e18-8aec-552f848e0d75',65,'广西壮族自治区南宁市西乡塘区广西大学行健文理学院','hanyongmeng','15207545526',0,'2016-05-18 11:33:25',4),
('6f591522-7a2a-4a31-899d-ef1181c72f5f',1399,'四川省德阳市四川建筑职业技术学院','madan','13269219270',0,'2016-01-10 18:00:36',2),
('7ae96e6d-4600-41a5-bc5d-143b34ba61db',658,'北京市昌平区建材城西路','madan','13269219270',0,'2016-02-25 10:44:56',2),
('a5bfb13d-9085-4374-94d9-4864b4d618ab',25,'海淀区圆明园西路','hanyongmeng','13455260812',1,'2016-02-25 10:43:40',4),
('c4b2bfff-1694-4e28-bcf8-fa7169bfc978',129,'北京市昌平区北七家镇','hanyongmeng','15207545526',1,'2016-05-18 10:36:22',4),
('d88d75cd-15e3-4622-801d-4cad902aeaa1',25,'广西壮族自治区南宁市朝阳区东路88号','hanyongmeng','13848399998',1,'2016-02-25 10:44:23',4);


CREATE TABLE `grouporderitem` (
  `order_id` varchar(100) NOT NULL DEFAULT '',
  `product_id` varchar(100) NOT NULL DEFAULT '',
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert  into `grouporderitem`(`order_id`,`product_id`,`buynum`) 
values ('0c0796f2-0124-4a13-a891-5efbb63b04f9','26ddd0c6-d7f2-4a83-b01b-286bb8c38420',1),
('305a7870-3820-4079-b6f9-5d2b63cbcd2a','26ddd0c6-d7f2-4a83-b01b-286bb8c38420',1),
('611f80fa-4273-4674-be09-9530b6276e15','26ddd0c6-d7f2-4a83-b01b-286bb8c38420',1),
('677a7314-0e16-4e18-8aec-552f848e0d75','26ddd0c6-d7f2-4a83-b01b-286bb8c38420',1),
('677a7314-0e16-4e18-8aec-552f848e0d75','72c52302-cd1e-4a22-8ac8-dc300a915be5',1),
('6f591522-7a2a-4a31-899d-ef1181c72f5f','26ddd0c6-d7f2-4a83-b01b-286bb8c38420',1),
('7ae96e6d-4600-41a5-bc5d-143b34ba61db','3cdd01d2-95d4-4077-b512-ff4c3b340d6b',1),
('a5bfb13d-9085-4374-94d9-4864b4d618ab','3cdd01d2-95d4-4077-b512-ff4c3b340d6b',1),
('c4b2bfff-1694-4e28-bcf8-fa7169bfc978','3cdd01d2-95d4-4077-b512-ff4c3b340d6b',2),
('c4b2bfff-1694-4e28-bcf8-fa7169bfc978','72c52302-cd1e-4a22-8ac8-dc300a915be5',2),
('d88d75cd-15e3-4622-801d-4cad902aeaa1','72c52302-cd1e-4a22-8ac8-dc300a915be5',1);


use itcaststore;

create table users(
    id int(10) auto_increment primary key,
    ip varchar(20) not null,
    lastTime char(8) not null
);
create table vote(
    id int(10) auto_increment primary key,
    title varchar(50) not null,
    num int not null
);
insert into users(ip, lastTime) values
    ('001',1),
    ('002',2),
    ('003',3),
    ('004',4);
insert into vote(title, num) values
    ('永久自行车',20),
    ('捷安自行车',30),
    ('凤凰自行车',40),
    ('老牌自行车',25);
