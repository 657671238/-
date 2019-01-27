create database `bountytack`;
use `bountytack`;

drop table if exists `users`;
/*用户信息表*/
create table `users`(
	`phoneNumber` char(12) NOT NULL primary key,
	`pwd` char(32) NOT NULL,
	`name` char(10) default NULL,
	`school` char(32) default NULL,
	`birth` date default NULL
)ENGING=InnoDB default CHARSET=utf-8;

drop table if exists `tasks`;
/*发布任务表*/
create table `tasks`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`taskTitle` NOT NULL ,/* 任务标题*/
	`taskBody` NOT NULL,/* 任务类容*/
	`publishDate` date NOT NULL,/* 发布时间*/
	`pushPhone` char(12) NOT NULL,/* 发布人电话*/
	`state` char(10) NOT NULL,/* 任务状态*/
	`bounty` int(10) NOT NULL,/* 赏金*/
	primary key(`id`),
	foreign key(`pushPhone`) references users(`phoneNumber`)
	on update cascade on delete cascade
)ENGING=InnoDB AUTO_INCREMENT=1 default CHARSET=utf-8;

drop table if exists `requests`;
/*请求任务表*/
create table `requests`(
	`task_ID` int(11) NOT NULL,
	`requestPhone` char(12) NOT NULL,
	`requestDate` date NOT NULL,
	foreign key(`task_ID`) references tasks(`id`),	
	foreign key(`requestPhone`) references users(`phoneNumber`)
)ENGING=InnoDB default CHARSET=utf-8;



















