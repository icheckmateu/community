/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : community

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 14/04/2021 16:42:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL COMMENT '父类id',
  `type` int(11) NOT NULL COMMENT '父类类型\n',
  `commentator` bigint(20) NOT NULL COMMENT '评论人id',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '更新时间',
  `like_count` bigint(20) NULL DEFAULT 0 COMMENT '点赞数',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment_count` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 1, 1, 1618280346335, 1618280346335, 0, '这是一条回复', 0);
INSERT INTO `comment` VALUES (2, 1, 1, 1, 1618280552476, 1618280552476, 0, '这是一条新回复', 1);
INSERT INTO `comment` VALUES (3, 2, 2, 1, 1618280698279, 1618280698279, 0, '我回复你了', 0);
INSERT INTO `comment` VALUES (4, 2, 2, 1, 1618283805238, 1618283805238, 0, 'hhh', NULL);
INSERT INTO `comment` VALUES (5, 4, 1, 1, 1618364017636, 1618364017636, 0, '111', NULL);
INSERT INTO `comment` VALUES (6, 4, 1, 1, 1618364089186, 1618364089186, 0, '222', NULL);
INSERT INTO `comment` VALUES (7, 6, 2, 1, 1618364094115, 1618364094115, 0, '333', NULL);
INSERT INTO `comment` VALUES (8, 4, 1, 1, 1618364331188, 1618364331188, 0, '1', NULL);
INSERT INTO `comment` VALUES (9, 8, 2, 1, 1618364335333, 1618364335333, 0, '1', NULL);
INSERT INTO `comment` VALUES (10, 4, 1, 1, 1618364961405, 1618364961405, 0, '333', NULL);
INSERT INTO `comment` VALUES (11, 10, 2, 1, 1618364966361, 1618364966361, 0, '333', NULL);
INSERT INTO `comment` VALUES (12, 4, 1, 1, 1618365881126, 1618365881126, 0, 'd', NULL);
INSERT INTO `comment` VALUES (13, 12, 2, 1, 1618365885746, 1618365885746, 0, 'd', NULL);
INSERT INTO `comment` VALUES (14, 12, 2, 1, 1618365900963, 1618365900963, 0, 'd', NULL);
INSERT INTO `comment` VALUES (15, 6, 1, 1, 1618381112998, 1618381112998, 0, '你做得好啊！', 1);
INSERT INTO `comment` VALUES (16, 15, 2, 1, 1618381123283, 1618381123283, 0, '不错。', NULL);
INSERT INTO `comment` VALUES (17, 6, 1, 1, 1618381328433, 1618381328434, 0, '点赞', 1);
INSERT INTO `comment` VALUES (18, 17, 2, 1, 1618381357683, 1618381357683, 0, '点赞', NULL);

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notifier` bigint(20) NOT NULL,
  `receiver` bigint(20) NOT NULL,
  `outerId` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `gmt_create` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `notifier_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outer_title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification
-- ----------------------------
INSERT INTO `notification` VALUES (1, 1, 1, 4, 1, 1618364017673, 1, 'littleliu', 'Java');
INSERT INTO `notification` VALUES (2, 1, 1, 4, 1, 1618364089196, 1, 'littleliu', 'Java');
INSERT INTO `notification` VALUES (3, 1, 1, 4, 2, 1618364094125, 1, 'littleliu', 'Java');
INSERT INTO `notification` VALUES (4, 1, 1, 4, 1, 1618364331223, 1, 'littleliu', 'Java');
INSERT INTO `notification` VALUES (5, 1, 1, 4, 2, 1618364335349, 1, 'littleliu', 'Java');
INSERT INTO `notification` VALUES (6, 1, 1, 4, 1, 1618364961435, 1, 'littleliu', 'Java');
INSERT INTO `notification` VALUES (7, 1, 1, 4, 2, 1618364966369, 1, 'littleliu', 'Java');
INSERT INTO `notification` VALUES (8, 1, 1, 4, 1, 1618365881160, 1, 'littleliu', 'Java');
INSERT INTO `notification` VALUES (9, 1, 1, 4, 2, 1618365886564, 1, 'littleliu', 'Java');
INSERT INTO `notification` VALUES (10, 1, 1, 4, 2, 1618365900980, 1, 'littleliu', 'Java');
INSERT INTO `notification` VALUES (11, 1, 1, 6, 1, 1618381113048, 1, 'littleliu', '试试上传图片');
INSERT INTO `notification` VALUES (12, 1, 1, 6, 2, 1618381123295, 1, 'littleliu', '试试上传图片');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gmt_create` bigint(20) NULL DEFAULT NULL,
  `gmt_modified` bigint(20) NULL DEFAULT NULL,
  `creator` bigint(20) NULL DEFAULT NULL,
  `comment_count` int(11) NULL DEFAULT 0,
  `view_count` int(11) NULL DEFAULT 0,
  `like_count` int(11) NULL DEFAULT 0,
  `tag` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '1', '1', 1618280328391, 1618280328391, 1, 2, 25, 0, '1');
INSERT INTO `question` VALUES (2, 'Spring Boot', 'Spring Boot', 1618288544959, 1618288544959, 1, 0, 49, 0, 'Spring Boot,Spring,Java');
INSERT INTO `question` VALUES (3, 'Spring MVC', 'Spring MVC', 1618288572377, 1618288572377, 1, 0, 7, 0, 'Spring MVC,Spring,Java');
INSERT INTO `question` VALUES (4, 'Java', 'Java', 1618288582708, 1618288582708, 1, 5, 35, 0, 'Java');
INSERT INTO `question` VALUES (5, '帮忙看一下我这段代码是否有问题', '[TOC]\r\n\r\n#### Disabled options\r\n\r\n- TeX (Based on KaTeX);\r\n- Emoji;\r\n- Task lists;\r\n- HTML tags decode;\r\n- Flowchart and Sequence Diagram;\r\n\r\n#### Editor.md directory\r\n\r\n    editor.md/\r\n            lib/\r\n            css/\r\n            scss/\r\n            tests/\r\n            fonts/\r\n            images/\r\n            plugins/\r\n            examples/\r\n            languages/     \r\n            editormd.js\r\n            ...\r\n\r\n```html\r\n<!-- English -->\r\n<script src=\"../dist/js/languages/en.js\"></script>\r\n\r\n<!-- 繁體中文 -->\r\n<script src=\"../dist/js/languages/zh-tw.js\"></script>\r\n```', 1618368408240, 1618369592976, 1, 0, 16, 0, 'java');
INSERT INTO `question` VALUES (6, '试试上传图片', '![](/images/wechat.png)', 1618373659427, 1618373659427, 1, 2, 17, 0, 'java');
INSERT INTO `question` VALUES (7, 'Spring1', 'Spring1', 1618384280071, 1618384280071, 1, 0, 0, 0, 'spring');
INSERT INTO `question` VALUES (8, 'Spring2', 'Spring2', 1618384291905, 1618384291905, 1, 0, 0, 0, 'spring');
INSERT INTO `question` VALUES (9, 'Spring3', 'Spring3', 1618384303296, 1618384303296, 1, 0, 0, 0, 'spring');
INSERT INTO `question` VALUES (10, 'Spring4', 'Spring4', 1618384315992, 1618384315992, 1, 0, 2, 0, 'spring');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` bigint(20) NULL DEFAULT NULL,
  `gmt_modified` bigint(20) NULL DEFAULT NULL,
  `bio` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '54837502', 'littleliu', 'd529a385-3676-4ef9-b0b5-4ec4abdab186', 1618280318339, 1618381084132, NULL, 'https://avatars.githubusercontent.com/u/54837502?v=4');

SET FOREIGN_KEY_CHECKS = 1;
