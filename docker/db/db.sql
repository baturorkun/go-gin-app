/*
Database       : blog
Type           : MYSQL
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS blog CHARACTER SET utf8;
CREATE USER 'blog_usr'@'%' IDENTIFIED BY 'blog_usr';
GRANT ALL PRIVILEGES ON accounting.* TO 'blog_usr'@'%';
FLUSH PRIVILEGES;


USE blog;

-- ----------------------------
-- Table structure for blog_auth
-- ----------------------------
DROP TABLE IF EXISTS `blog_auth`;
CREATE TABLE `blog_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '',
  `password` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `blog_auth` (`id`, `username`, `password`) VALUES (1, 'testuser', 'testpwd');


-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `created_on` int(10) unsigned DEFAULT '0',
  `created_by` varchar(100) DEFAULT '',
  `modified_on` int(10) unsigned DEFAULT '0',
  `modified_by` varchar(100) DEFAULT '',
  `deleted_on` int(10) unsigned DEFAULT '0',
  `state` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `blog_tag` (`id`, `name`) VALUES (1, 'golang');
INSERT INTO `blog_tag` (`id`, `name`) VALUES (2, 'python');
INSERT INTO `blog_tag` (`id`, `name`) VALUES (3, 'php');


-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned DEFAULT '0',
  `title` varchar(100) DEFAULT '',
 -- `desc` varchar(255) DEFAULT '' COMMENT 'description',
  `content` text COMMENT 'content',
  `created_on` int(10) unsigned DEFAULT '0',
  `created_by` varchar(100) DEFAULT '',
  `modified_on` int(10) unsigned DEFAULT '0',
  `modified_by` varchar(255) DEFAULT '',
  `deleted_on` int(10) unsigned DEFAULT '0',
  `state` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `blog_article` (`id`, `tag_id`, `title`, `content`) VALUES (1,1, 'go programming language', 'Go is a statically typed, compiled programming language designed at Google by Robert Griesemer, Rob Pike, and Ken Thompson. Go is syntactically similar to C, but with the added benefits of memory safety, garbage collection, structural typing, and CSP-style concurrency.');
INSERT INTO `blog_article` (`id`, `tag_id`, `title`, `content`) VALUES (2,2, 'python programming language', 'Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python has a design philosophy that emphasizes code readability, notably using significant whitespace. It provides constructs that enable clear programming on both small and large scales');
INSERT INTO `blog_article` (`id`, `tag_id`, `title`, `content`) VALUES (3,3, 'PHP Programming', 'PHP: Hypertext Preprocessor is a general-purpose programming language originally designed for web development. It was originally created by Rasmus Lerdorf in 1994; the PHP reference implementation is now produced by The PHP Group.');
