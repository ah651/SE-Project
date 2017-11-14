-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017-11-06 14:53:53
-- 服务器版本: 5.5.54-0ubuntu0.14.04.1
-- PHP 版本: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `myNews`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin` 管理员用户
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `authority`
--

CREATE TABLE IF NOT EXISTS `authority` (
  `newsId` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`newsId`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `authority`
--

INSERT INTO `authority` (`newsId`, `username`) VALUES
('20170407122745user', 'guoyinjie'),
('20170407122745user', 'liyongzhi');

-- --------------------------------------------------------

--
-- 表的结构 `check_pending`
--

CREATE TABLE IF NOT EXISTS `check_pending` (
  `newsId` varchar(30) NOT NULL,
  `head` varchar(100) NOT NULL,
  `content` varchar(8000) NOT NULL,
  `publish_time` varchar(30) NOT NULL,
  `issueuser` varchar(30) NOT NULL,
  `newstype` varchar(30) NOT NULL,
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `check_pending`
--

INSERT INTO `check_pending` (`newsId`, `head`, `content`, `publish_time`, `issueuser`, `newstype`) VALUES
('20170517110412', 'rtew', 'qwdsdafd', '2017-05-17 11:04:12', '', 'asdfsa');

-- --------------------------------------------------------

--
-- 表的结构 `dustbin`
--

CREATE TABLE IF NOT EXISTS `dustbin` (
  `newsId` varchar(30) NOT NULL,
  `head` varchar(100) NOT NULL,
  `content` varchar(8000) NOT NULL,
  `publish_time` varchar(30) NOT NULL,
  `issueuser` varchar(30) NOT NULL,
  `newstype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dustbin`
--

INSERT INTO `dustbin` (`newsId`, `head`, `content`, `publish_time`, `issueuser`, `newstype`) VALUES
('20170407144919liyongzhi', '审核测试通过', '测试', '2017-04-07 14:49:19', 'liyongzhi', '审核测试'),
('20170407123942liyongzhi', '李勇志的第二篇文章', 'sql 如何嵌套查询_百度知道\n4个回答 - 提问时间: 2008年06月16日\n最佳答案: select a.username,numa,numb from (select username,count(username) as numa from a where isdel=0 group by username order by numa desc) a,...\nzhidao.baidu.com/link?...  - 评价', '2017-04-07 12:39:42', 'liyongzhi', '测试文章');

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `newsId` varchar(30) CHARACTER SET utf8 NOT NULL,
  `head` varchar(200) CHARACTER SET utf8 NOT NULL,
  `content` varchar(8000) CHARACTER SET utf8 NOT NULL,
  `publish_time` varchar(30) CHARACTER SET utf8 NOT NULL,
  `issueuser` varchar(32) CHARACTER SET utf8 NOT NULL,
  `newstype` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`newsId`)
) DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`newsId`, `head`, `content`, `publish_time`, `issueuser`, `newstype`) VALUES
('20171030220853user', '2017ceshier', 'qweqweqweqweqwwe', '2017-10-30 22:11:51', 'user', '123'),
('20170407124100liyongzhi', '如何使用Tomcat', 'Tomcat是Apache 软件基金会（Apache Software Foundation）的Jakarta 项目中的一个核心项目，由Apache、Sun 和其他一些公司及个人共同开发而成。由于有了Sun 的参与和支持，最新的Servlet 和JSP 规范总是能在Tomcat 中得到体现，Tomcat 5支持最新的Servlet 2.4 和JSP 2.0 规范。因为Tomcat 技术先进、性能稳定，而且免费，因而深受Java 爱好者的喜爱并得到了部分软件开发商的认可，成为目前比较流行的Web 应用服务器。\nTomcat 服务器是一个免费的开放源代码的Web 应用服务器，属于轻量级应用服务器，在中小型系统和并发访问用户不是很多的场合下被普遍使用，是开发和调试JSP 程序的首选。对于一个初学者来说，可以这样认为，当在一台机器上配置好Apache 服务器，可利用它响应HTML（标准通用标记语言下的一个应用）页面的访问请求。实际上Tomcat 部分是Apache 服务器的扩展，但它是独立运行的，所以当你运行tomcat 时，它实际上作为一个与Apache 独立的进程单独运行的。\n诀窍是，当配置正确时，Apache 为HTML页面服务，而Tomcat 实际上运行JSP 页面和Servlet。另外，Tomcat和IIS等Web服务器一样，具有处理HTML页面的功能，另外它还是一个Servlet和JSP容器，独立的Servlet容器是Tomcat的默认模式。不过，Tomcat处理静态HTML的能力不如Apache服务器。目前Tomcat最新版本为9.0。', '2017-04-07 12:41:00', 'liyongzhi', '个人博客'),
('20170410112718liyongzhi', '审核文章演示', 'n.	过程; 工序; 做事方法; 工艺流程;\nvt.	处理; 加工; 审阅; 审核;\nvi.	列队行进;\n[例句]There was total agreement to start the peace process as soon as possible\n全体一致同意尽快开始和平进程。\n[其他]	第三人称单数：processes 复数：processes 现在分词：processing 过去式：processed 过去分词：processed', '2017-04-10 11:27:18', 'liyongzhi', '审核测试'),
('20170407125424guoyinjie', '郭银杰的测试', '简单的测试而已', '2017-04-07 12:54:24', 'guoyinjie', '多用户测试'),
('20170407124320liyongzhi', '修改测试文章', '这是用于修改测试的文章', '2017-04-07 12:43:20', 'liyongzhi', '修改测试'),
('20170407124353liyongzhi', '审核测试文章', '这是一篇用于审核测试的文章', '2017-04-07 12:43:53', 'liyongzhi', '审核测试'),
('20170407124145liyongzhi', '授权测试文章', '这是用户授权测试的文章', '2017-04-07 12:41:45', 'liyongzhi', '授权测试'),
('20170407124225liyongzhi', '回收站测试文章', '这是用于测试回收站功能的文章', '2017-04-07 12:42:25', 'liyongzhi', '回收站测试'),
('20170407154355liyongzhi', '测试发布', '独守空房萨克的房间立刻束带结发', '2017-04-07 15:43:55', 'liyongzhi', '下课'),
('20170407145209liyongzhi', '审核测试通过', '审核测试通过', '2017-04-07 14:52:09', 'liyongzhi', '审核测试'),
('20170407122745user', '测试用户第一篇测试文章', 'SQL嵌套SELECT语句又称为子查询，子查询不但能够出现在Where子句中，也能够出现在from子句中，作为一个临时表使用，也能够出现在select list中，作为一个字段值来返回。111\nAD：51CTO 网  第十二期沙龙：大话数据之美_如何用数据驱动用户体验\nSQL嵌套SELECT语句是很常见的SQL语句，下面就为您详细介绍SQL嵌套SELECT语句的语法，并附相关示例，供您参考学习之用。\n\n嵌套SELECT语句也叫子查询，一个SELECT 语句的查询结果能够作为另一个语句的输入值。子查询不但能够出现在Where子句中，也能够出现在from子句中，作为一个临时表使用，也能够出现在select list中，作为一个字段值来返回。\n\n1、单行子查询 ：单行子查询是指子查询的返回结果只有一行数据。当主查询语句的条件语句中引用子查询结果时可用单行比较符号（＝, >, <, >=, <=, <>）来进行比较。\n\n例：\n\nselect ename,deptno,sal   \nfrom emp   \nwhere deptno=(select deptno from dept where loc=''NEW YORK'')；  \n2、多行子查询：多行子查询即是子查询的返回结果是多行数据。当主查询语句的条件语句中引用子查询结果时必须用多行比较符号（IN，ALL,ANY）来进行比较。其中，IN的含义是匹配子查询结果中的任一个值即可（"IN" 操作符，能够测试某个值是否在一个列表中），ALL则必须要符合子查询的所有值才可，ANY要符合子查询结果的任何一个值即可。而且须注意ALL 和ANY 操作符不能单独使用，而只能与单行比较符（=、>、< 、>= 、<= 、<>）结合使用。\n\n例：\n\n1）.多行子查询使用IN操作符号例子：查询选修了老师名叫Rona(假设唯一)的学生名字', '2017-10-30 22:01:34', 'user', '测试文章');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

--CREATE TABLE IF NOT EXISTS `user` (
  --`username` varchar(32) CHARACTER SET utf8 NOT NULL,
  --`password` varchar(32) CHARACTER SET utf8 NOT NULL,
  --PRIMARY KEY (`username`)
--) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(32) CHARACTER SET utf8 NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 NOT NULL,
 `sex` varchar(12) CHARACTER SET utf8 NOT NULL, 
 `birthday` varchar(12) CHARACTER SET utf8 NOT NULL, 
 `email` varchar(20) CHARACTER SET utf8 NOT NULL, 
 PRIMARY KEY (`username`)
) DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('liyongzhi', 'liyongzhi'),
('user', 'user'),
('guoyinjie', 'guoyinjie');

-- --------------------------------------------------------

--
-- 表的结构 `userAuthor`
--

CREATE TABLE IF NOT EXISTS `userAuthor` (
  `username` varchar(32) CHARACTER SET utf8 NOT NULL,
  `newsId` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`username`,`newsId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `article` (
  `category` varchar(15) CHARACTER SET utf8 NOT NULL,
  `title` varchar(30) CHARACTER SET utf8 NOT NULL,
  `author` varchar(30) CHARACTER SET utf8 NOT NULL,
  `filepath` varchar(60) CHARACTER SET utf8 NOT NULL,
  `uploadtime` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`title`)
) DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
