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
);

drop table if exists `tasks`;
/*发布任务表*/
create table `tasks`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`taskTitle` varchar(10) NOT NULL ,/* 任务标题*/
	`taskBody` varchar(50) NOT NULL,/* 任务类容*/
	`publishDate` varchar(20) NOT NULL,/* 发布时间*/
	`pushPhone` char(12) NOT NULL,/* 发布人电话*/
	`state` int(30) NOT NULL,/* 任务状态*/
	`bounty` int(10) NOT NULL,/* 赏金*/
	`place` char(15) NOT NULL,/*  任务地点*/
	primary key(`id`)
)AUTO_INCREMENT=1;

drop table if exists `requests`;
/*请求任务表*/
create table `requests`(
	`task_ID` int(11) NOT NULL,
	`requestPhone` char(12) NOT NULL,
	`requestDate` varchar(20) NOT NULL
);



















