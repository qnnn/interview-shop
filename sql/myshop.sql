/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : myshop

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 14/01/2021 10:32:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `product_id` bigint(0) NOT NULL COMMENT '商品id',
  `number` int(0) NOT NULL COMMENT '商品数量',
  `flag` tinyint(0) NOT NULL COMMENT '是否选中',
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_cart
-- ----------------------------
INSERT INTO `tb_cart` VALUES (27, 10010, 69, 1, 0, '2021-01-12 22:35:40', '2021-01-12 22:36:42');
INSERT INTO `tb_cart` VALUES (58, 10007, 30, 2, 0, '2021-01-13 11:22:16', '2021-01-14 09:06:03');

-- ----------------------------
-- Table structure for tb_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_content`;
CREATE TABLE `tb_content`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(0) NOT NULL COMMENT '内容类目ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容标题',
  `sub_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `title_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题描述',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `pic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片绝对路径',
  `pic2` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片2',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `created` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `updated`(`updated`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_content
-- ----------------------------
INSERT INTO `tb_content` VALUES (44, 135, '全新升级小米10', '买一送一', '买到赚到', 'http://i1.mifile.cn/a4/xmad_1560592743757_kGyBr.jpg', 'http://i1.mifile.cn/a4/xmad_1560592743757_kGyBr.jpg', 'http://i1.mifile.cn/a4/xmad_1560592743757_kGyBr.jpg', '<p><br></p>', NULL, '2021-01-13 21:29:44');

-- ----------------------------
-- Table structure for tb_content_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_content_category`;
CREATE TABLE `tb_content_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` int(0) NULL DEFAULT 1 COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序',
  `is_parent` tinyint(1) NULL DEFAULT 1 COMMENT '该类目是否为父类目，1为true，0为false',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`, `status`) USING BTREE,
  INDEX `sort_order`(`sort_order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_content_category
-- ----------------------------
INSERT INTO `tb_content_category` VALUES (108, 0, '商品分类', 0, 1, 1, '2021-01-03 13:51:44', '2021-01-03 13:52:20');
INSERT INTO `tb_content_category` VALUES (126, 108, '男装', 1, 1, 0, '2021-01-08 19:08:56', '2021-01-12 16:06:18');
INSERT INTO `tb_content_category` VALUES (127, 108, '女装', 1, 2, 0, '2021-01-08 19:09:48', '2021-01-12 16:06:31');
INSERT INTO `tb_content_category` VALUES (128, 108, '智能 显示器', 1, 3, 0, '2021-01-08 19:10:46', '2021-01-12 16:06:36');
INSERT INTO `tb_content_category` VALUES (129, 108, '智能 路由器', 1, 4, 0, '2021-01-08 19:12:26', '2021-01-08 19:12:33');
INSERT INTO `tb_content_category` VALUES (130, 108, '笔记本', 1, 5, 0, '2021-01-08 19:13:11', '2021-01-12 16:06:46');
INSERT INTO `tb_content_category` VALUES (131, 108, '洗衣机', 1, 6, 0, '2021-01-08 19:13:24', '2021-01-12 16:07:00');
INSERT INTO `tb_content_category` VALUES (132, 108, '冰箱', 1, 7, 0, '2021-01-08 19:13:36', '2021-01-12 16:08:41');
INSERT INTO `tb_content_category` VALUES (133, 108, '智能 手机', 1, 8, 0, '2021-01-08 19:13:45', '2021-01-08 19:13:45');
INSERT INTO `tb_content_category` VALUES (134, 0, '广告分类', NULL, 2, 1, '2021-01-13 21:25:38', '2021-01-13 21:25:38');
INSERT INTO `tb_content_category` VALUES (135, 134, '大广告', NULL, 1, 0, '2021-01-13 21:25:57', '2021-01-13 21:26:04');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `product_id` bigint(0) NOT NULL COMMENT '商品ID',
  `total_price` decimal(10, 2) NOT NULL COMMENT '总价',
  `number` int(0) NOT NULL COMMENT '数量',
  `receiving_info_id` bigint(0) NULL DEFAULT NULL COMMENT '收货信息ID',
  `pay_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付方式',
  `tracking_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '快递单号',
  `status` tinyint(0) NOT NULL COMMENT '订单状态(1未支付;2已支付;3运输中;4订单结束）',
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (31, '2021011219055035L181', 69, 6799.00, 1, 1, '支付宝', 'fwqfwf5qw1f6w1g6w', 4, '2021-01-12 19:05:50', '2021-01-14 09:34:43');
INSERT INTO `tb_order` VALUES (32, '2021011219055035L181', 27, 460.00, 1, 1, '支付宝', '51444156514148115', 4, '2021-01-12 19:05:50', '2021-01-14 09:34:43');
INSERT INTO `tb_order` VALUES (34, '20210112223645GUD723', 46, 8999.00, 1, 2, '支付宝', '44554afg598tr4e6q', 2, '2021-01-12 22:36:45', '2021-01-12 22:41:48');
INSERT INTO `tb_order` VALUES (35, '20210112224226L19549', 70, 4299.00, 1, 2, '支付宝', NULL, 2, '2021-01-12 22:42:26', '2021-01-13 01:24:42');
INSERT INTO `tb_order` VALUES (36, '20210112224226L19549', 43, 299.00, 1, 2, '支付宝', NULL, 2, '2021-01-12 22:42:26', '2021-01-13 01:24:43');
INSERT INTO `tb_order` VALUES (41, '20210112231859M79941', 19, 238.00, 1, 2, '支付宝', NULL, 2, '2021-01-12 23:18:59', '2021-01-13 01:24:55');
INSERT INTO `tb_order` VALUES (42, '20210113010019MLD289', 73, 1099.00, 1, 1, '支付宝', '837837837838737378', 4, '2021-01-13 01:00:19', '2021-01-13 10:32:01');
INSERT INTO `tb_order` VALUES (43, '20210113010019MLD289', 43, 299.00, 1, 1, '支付宝', '378378378378353783', 4, '2021-01-13 01:00:19', '2021-01-13 10:32:01');
INSERT INTO `tb_order` VALUES (44, '20210113012329MEW156', 54, 4398.00, 2, 1, '支付宝', NULL, 2, '2021-01-13 01:23:29', '2021-01-13 01:24:52');
INSERT INTO `tb_order` VALUES (45, '20210113012329MEW156', 47, 4599.00, 1, 1, '支付宝', NULL, 2, '2021-01-13 01:23:29', '2021-01-13 01:24:47');
INSERT INTO `tb_order` VALUES (46, '20210113012343TYY362', 23, 2999.00, 1, 1, '支付宝', NULL, 1, '2021-01-13 01:23:43', '2021-01-13 01:23:43');
INSERT INTO `tb_order` VALUES (47, '20210113012343TYY362', 74, 3699.00, 1, 1, '支付宝', NULL, 1, '2021-01-13 01:23:43', '2021-01-13 01:23:43');
INSERT INTO `tb_order` VALUES (48, '20210113012401UK3938', 37, 199.00, 1, 1, '支付宝', NULL, 2, '2021-01-13 01:24:01', '2021-01-13 01:24:58');
INSERT INTO `tb_order` VALUES (49, '20210113012401UK3938', 41, 189.00, 1, 1, '支付宝', NULL, 2, '2021-01-13 01:24:01', '2021-01-13 01:25:00');
INSERT INTO `tb_order` VALUES (50, '20210113012536A8V867', 54, 2199.00, 1, 1, '支付宝', NULL, 1, '2021-01-13 01:25:36', '2021-01-13 01:25:36');
INSERT INTO `tb_order` VALUES (51, '20210113012536A8V867', 66, 6099.00, 1, 1, '支付宝', NULL, 1, '2021-01-13 01:25:36', '2021-01-13 01:25:36');
INSERT INTO `tb_order` VALUES (52, '20210113012543XBU343', 71, 2999.00, 1, 1, '支付宝', NULL, 1, '2021-01-13 01:25:43', '2021-01-13 01:25:43');
INSERT INTO `tb_order` VALUES (53, '20210113012601JL0270', 48, 8299.00, 1, 1, '支付宝', NULL, 2, '2021-01-13 01:26:01', '2021-01-13 01:26:11');
INSERT INTO `tb_order` VALUES (54, '20210113090352AQD858', 70, 4299.00, 1, 1, '支付宝', NULL, 1, '2021-01-13 09:03:52', '2021-01-13 09:03:52');
INSERT INTO `tb_order` VALUES (55, '2021011309041177R647', 40, 109.00, 1, 1, '支付宝', NULL, 1, '2021-01-13 09:04:11', '2021-01-13 13:50:23');
INSERT INTO `tb_order` VALUES (56, '20210113092108VBJ841', 18, 168.00, 1, 2, '支付宝', NULL, 1, '2021-01-13 09:21:08', '2021-01-13 09:21:08');
INSERT INTO `tb_order` VALUES (61, '20210113115949T1J742', 70, 4299.00, 1, 3, '支付宝', NULL, 1, '2021-01-13 11:59:49', '2021-01-13 11:59:49');
INSERT INTO `tb_order` VALUES (62, '20210113120010ZE8576', 54, 2199.00, 1, 3, '支付宝', NULL, 1, '2021-01-13 12:00:10', '2021-01-13 12:00:10');
INSERT INTO `tb_order` VALUES (63, '20210114092242LMS440', 70, 4299.00, 1, 1, '支付宝', NULL, 1, '2021-01-14 09:22:42', '2021-01-14 09:22:42');
INSERT INTO `tb_order` VALUES (64, '202101140932148R1563', 17, 388.00, 1, 1, '支付宝', '4d515161wqd5dwd', 4, '2021-01-14 09:32:14', '2021-01-14 09:34:36');

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名',
  `img1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片1-首页展示',
  `img2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片2',
  `img3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片3',
  `img4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片4',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品描述',
  `category_id` bigint(0) NOT NULL COMMENT '分类ID',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `sold_num` int(0) NULL DEFAULT NULL COMMENT '已售数量',
  `stock_num` int(0) NULL DEFAULT NULL COMMENT '库存数量',
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES (13, 'T恤', 'http://localhost:8081/uploadImg/e87a64ac-abbe-4856-a143-fde107a3fd58.jpg', 'http://localhost:8081/uploadImg/69dac825-38e5-4c1f-b8bc-2764797bc1c4.jpg', 'http://localhost:8081/uploadImg/57661627-3cfc-4438-acac-7eba31401141.jpg', 'http://localhost:8081/uploadImg/509c0d37-55eb-4882-8920-d8d21522d6ba.jpg', '<p>美国保罗柏琳奢侈品牌男装 春季男士纯色翻领短袖T恤polo衫 绣标带领大码保罗衫体恤丅血高端进口衣服 粉色 190/104A/XXXL</p>', 126, 698.00, 26, 100, '2021-01-12 16:14:05', '2021-01-12 18:48:41');
INSERT INTO `tb_product` VALUES (14, 'T恤', 'http://localhost:8081/uploadImg/a81589d6-89d0-4070-962a-78f5d9310dbe.jpg', 'http://localhost:8081/uploadImg/76b2f1a9-9916-48c6-8142-f09435f1ce24.jpg', 'http://localhost:8081/uploadImg/b4454d56-d4b3-4dff-8ec8-aed144d994e9.jpg', 'http://localhost:8081/uploadImg/4df87bca-d819-4ffe-a1c6-c40679a344b4.jpg', '<p>意大利轻奢侈品牌男装NANEBANG男士秋冬半高领长袖T恤衫纯棉百搭光板打底衫双面保暖厚中领秋衣高端 藏青色 4XL</p>', 126, 728.00, 25, 100, '2021-01-12 16:15:34', '2021-01-12 18:48:42');
INSERT INTO `tb_product` VALUES (15, 'T恤', 'http://localhost:8081/uploadImg/8809b9f1-34f1-4611-895d-e64a468d83ba.jpg', 'http://localhost:8081/uploadImg/398805f2-7224-4ca9-bd5d-3e2f8942fee8.jpg', 'http://localhost:8081/uploadImg/7e8022e1-aba7-48a9-8495-c441ca574e09.jpg', 'http://localhost:8081/uploadImg/1d421d32-ed6f-4dad-afd5-fe9176e3fb70.jpg', '<p>stayle IT 意大利国际奢侈品牌男装中年男士长袖恤秋装上衣秋衣外穿丅体桖设计感潮流打底衫土 黑色 180/2XL</p>', 126, 858.00, 14, 100, '2021-01-12 16:17:43', '2021-01-12 18:48:43');
INSERT INTO `tb_product` VALUES (16, '羽绒服', 'http://localhost:8081/uploadImg/c7e9b01d-34d9-4a69-bc41-8dd18b030479.jpg', 'http://localhost:8081/uploadImg/1da6765a-7d6c-4f5d-aa53-ff36e4054f22.jpg', 'http://localhost:8081/uploadImg/2be49390-db47-4faa-9ccd-76c216c132bf.jpg', 'http://localhost:8081/uploadImg/ac446ce7-54c5-44f7-8b22-d3f78cf7fc7c.jpg', '<p>袋鼠羽绒服男2020年新款冬天外套轻薄中长款男款潮流帅气休闲外套 黑色 L</p>', 126, 498.00, 85, 100, '2021-01-12 16:19:58', '2021-01-12 18:48:43');
INSERT INTO `tb_product` VALUES (17, '羽绒服', 'http://localhost:8081/uploadImg/f7977fe4-0bc7-412c-963b-6a580fc1779f.jpg', 'http://localhost:8081/uploadImg/80d01231-d208-4d78-83fe-5f70bce99b2a.jpg', 'http://localhost:8081/uploadImg/cd169619-b45c-4456-b56b-22b3ebe8725e.jpg', 'http://localhost:8081/uploadImg/3cf2d9ef-5474-4462-9a86-280b406d93e9.jpg', '<p>袋鼠中老年羽绒服男商务休闲羽绒服爸爸装拼色连帽可脱卸内胆中长款 黑色 160/S</p>', 126, 388.00, 62, 100, '2021-01-12 16:21:09', '2021-01-12 18:48:44');
INSERT INTO `tb_product` VALUES (18, '棉服', 'http://localhost:8081/uploadImg/012dee39-84a1-496d-bfc4-b5aec2b13dc1.jpg', 'http://localhost:8081/uploadImg/d4429e37-7558-447d-b8c5-527313f6d8d2.jpg', 'http://localhost:8081/uploadImg/6975ee09-3a6e-4161-9c34-7b9f20d77801.jpg', 'http://localhost:8081/uploadImg/f02a930f-3d46-4dfd-933c-f2a08a198082.jpg', '<p>袋鼠冬季加厚棉衣男韩版修身青年短款棉服男士羽绒棉袄潮工装 黑色 XL</p>', 126, 168.00, 41, 100, '2021-01-12 16:22:54', '2021-01-12 18:48:44');
INSERT INTO `tb_product` VALUES (19, '棉服', 'http://localhost:8081/uploadImg/abea8acb-1f58-47cf-a7f1-1d73861a850c.jpg', 'http://localhost:8081/uploadImg/2869ba42-0464-4fa4-b8ce-caab32b621d0.jpg', 'http://localhost:8081/uploadImg/99b4cfd2-2d98-4f04-9603-7047bd70fb1a.jpg', 'http://localhost:8081/uploadImg/b5e69060-8fd8-42e5-9175-9328ba1c28fe.jpg', '<p>袋鼠棉服男士棉袄秋冬装外套潮牌2020韩版潮流羽绒加厚短款棉衣 绿色 2XL</p>', 126, 238.00, 62, 100, '2021-01-12 16:25:09', '2021-01-12 18:48:45');
INSERT INTO `tb_product` VALUES (20, '夹克', 'http://localhost:8081/uploadImg/51baf12d-dbd5-4290-95b6-74f7260a880b.jpg', 'http://localhost:8081/uploadImg/d7fd92ca-7ca7-43e4-994a-456cf2efebd8.jpg', 'http://localhost:8081/uploadImg/1542bcd0-a46e-4e5f-a108-3d9a1ed3e709.jpg', 'http://localhost:8081/uploadImg/b8e08258-6e0f-4d6d-bf66-e92e49434d92.jpg', '<p>皮尔卡丹针2020春秋季新款韩流工装薄款男休闲夹克男士外套春夏装翻领百搭棒球服织 拉链款-黑色 XL 体重130至140</p>', 126, 308.00, 52, 100, '2021-01-12 16:27:07', '2021-01-12 18:48:46');
INSERT INTO `tb_product` VALUES (21, 'T恤', 'http://localhost:8081/uploadImg/562dcc55-c5de-4a92-8c66-d206f54a9924.jpg', 'http://localhost:8081/uploadImg/9a90066c-1e75-4593-a06d-5d3955f73b24.jpg', 'http://localhost:8081/uploadImg/f5d48939-6320-4c5b-86f7-2f1a2d12ffd6.jpg', 'http://localhost:8081/uploadImg/2d63d97d-9876-4f56-9cc3-cac3384d7770.jpg', '<p>南极人 长袖t恤女2020秋冬季新款韩版女装大码学生中长款女士卫衣打底衫棉上衣t恤衫秋衣女 8220白色 XL</p>', 127, 89.00, 48, 100, '2021-01-12 16:29:21', '2021-01-12 18:48:46');
INSERT INTO `tb_product` VALUES (22, 'T恤', 'http://localhost:8081/uploadImg/8d19c153-a874-4401-8c34-87271f877f72.jpg', 'http://localhost:8081/uploadImg/d7d96932-cc9d-493d-ae6e-50ee7ffa686c.jpg', 'http://localhost:8081/uploadImg/67744e45-9dad-4712-90de-33a6b5c9d25f.jpg', 'http://localhost:8081/uploadImg/d37f9ca4-3a11-47a9-8ca1-b986e996a0e3.jpg', '<p>南极人 长袖t恤女2020秋冬季新款韩版女装大码学生修身紧身中长款女士卫衣打底衫纯棉上衣t恤衫秋衣女 红色 L</p>', 127, 89.10, 522, 100, '2021-01-12 16:30:59', '2021-01-12 18:48:47');
INSERT INTO `tb_product` VALUES (23, '羽绒服', 'http://localhost:8081/uploadImg/957e09cb-ecd9-4250-b0d8-e7e05fb55397.jpg', 'http://localhost:8081/uploadImg/6a7dacac-2f0f-4bfc-8ad4-c5a0d758e818.jpg', 'http://localhost:8081/uploadImg/17df30d7-c15a-4a13-801c-b8c807e39870.jpg', 'http://localhost:8081/uploadImg/eb0259dc-f5df-4cd3-98bc-af3d56dccc40.jpg', '<p>【商场同款】影儿十二篮20冬新款刺绣潮玩鼠抽绳设计宽松连帽羽绒服女 紫色 36</p>', 127, 2999.00, 25, 100, '2021-01-12 16:32:37', '2021-01-12 18:49:41');
INSERT INTO `tb_product` VALUES (24, '羽绒服', 'http://localhost:8081/uploadImg/54c8f56e-0231-48b3-9626-4bce972810f1.jpg', 'http://localhost:8081/uploadImg/e65b0de3-037f-4994-8f2e-055688751756.jpg', 'http://localhost:8081/uploadImg/af42e1c5-aeb8-49af-9035-4d13e5754ec2.jpg', 'http://localhost:8081/uploadImg/666097c2-2683-40b8-9e4f-1a1243b66b7d.jpg', '<p>【商场同款】影儿十二篮20冬新款率性拉链立领短款宽松米色羽绒服女 米色 38</p>', 127, 2569.00, 52, 100, '2021-01-12 16:34:06', '2021-01-12 18:48:48');
INSERT INTO `tb_product` VALUES (25, '连衣裙', 'http://localhost:8081/uploadImg/b10ebefb-c3bc-4306-b5cc-53948343465e.jpg', 'http://localhost:8081/uploadImg/38669609-8f62-4683-902e-cff79a4ddbda.jpg', 'http://localhost:8081/uploadImg/850dd215-6ee1-45e3-a4b6-87735bf34757.jpg', 'http://localhost:8081/uploadImg/d62814bd-e4ca-4e26-832e-ccbdcc49c989.jpg', '<p>SongofSong歌中歌 秋冬新款粗花呢拼接排扣西装连衣裙 粉色 M/38</p>', 127, 8890.00, 5, 100, '2021-01-12 16:35:43', '2021-01-12 18:48:49');
INSERT INTO `tb_product` VALUES (26, '连衣裙', 'http://localhost:8081/uploadImg/99c8d0bc-d241-4204-9dee-6b02dd8a2052.jpg', 'http://localhost:8081/uploadImg/d7dc216d-75ef-449f-8ec3-9572ae844a36.jpg', 'http://localhost:8081/uploadImg/6df9531b-42cf-47fe-b728-9462aaced627.jpg', 'http://localhost:8081/uploadImg/e0682036-07d4-46b4-98d9-143c605b50b6.jpg', '<p>SongofSong歌中歌2020秋冬高定系列重工喇叭袖羊毛礼服 红色 M/38</p>', 127, 15900.00, 5, 100, '2021-01-12 16:36:47', '2021-01-12 18:48:56');
INSERT INTO `tb_product` VALUES (27, '短外套', 'http://localhost:8081/uploadImg/3ee91df7-075b-4b92-bf73-f0341bf6c2b0.jpg', 'http://localhost:8081/uploadImg/ebe59cfb-1a74-41a8-ba7d-1af276b55a9c.jpg', 'http://localhost:8081/uploadImg/39962a8e-8ffb-491d-a9b4-fdf752ace392.jpg', 'http://localhost:8081/uploadImg/566edad1-2f5f-461e-bf1b-8ba32314f1ac.jpg', '<p>新颖 阿玛施正女装专柜正品短外套女秋冬韩版棒球服圆领时尚夹克外套 黑色 5码</p>', 127, 460.00, 5, 100, '2021-01-12 16:38:49', '2021-01-12 18:48:56');
INSERT INTO `tb_product` VALUES (28, '棉服', 'http://localhost:8081/uploadImg/e31e940f-9a87-4f04-a491-8f9fd33c7fae.jpg', 'http://localhost:8081/uploadImg/57c286be-f20c-4af7-973a-80255f660265.jpg', 'http://localhost:8081/uploadImg/f5580682-fb00-46b8-afde-9490bddcb615.jpg', 'http://localhost:8081/uploadImg/e5d3120b-8c20-43da-8c55-939b9c50c9e1.jpg', '<p>奥丽嘉朵冬新款可拆卸兔毛皮内胆施华洛水钻派克服 焦糖 M/38</p>', 127, 15120.00, 1, 100, '2021-01-12 16:40:20', '2021-01-12 18:48:56');
INSERT INTO `tb_product` VALUES (29, '飞利浦', 'http://localhost:8081/uploadImg/dd399f65-1021-43f9-bf6e-4120dd7b1cb9.jpg', 'http://localhost:8081/uploadImg/b2f6794b-5920-4f50-a5b3-cc71cfcc7074.jpg', 'http://localhost:8081/uploadImg/1a39dbbf-73b0-4bbb-bb35-c1cb78f99161.jpg', 'http://localhost:8081/uploadImg/67007d08-3f1d-4930-bf0b-5de6160ed178.jpg', '<p>飞利浦 345M2R 34英寸准4K超清带鱼屏 144Hz电竞IPS显示器 21:9升降滤蓝光屏幕 IPS/144Hz/HDR10 345M2R</p>', 128, 3199.00, 5, 100, '2021-01-12 16:43:07', '2021-01-12 18:48:57');
INSERT INTO `tb_product` VALUES (30, '夏新（Amoi）', 'http://localhost:8081/uploadImg/f95e587e-df80-4ebf-945d-aa5ed66ca4d5.jpg', 'http://localhost:8081/uploadImg/8a6a6d2a-5919-429e-98ac-6a91fbe649b3.jpg', 'http://localhost:8081/uploadImg/332e15ee-ca9b-4554-b6ba-8ea4f1aa5c03.jpg', 'http://localhost:8081/uploadImg/713f9247-a0fd-42fc-ba3f-897c617f49b1.jpg', '<p>夏新（Amoi）28英寸直面电脑4k显示器144hz高清护眼2k家用办公液晶监控显示屏幕游戏电竞 27英寸2K-144Hz/4K-60Hz</p>', 128, 799.00, 0, 100, '2021-01-12 16:45:47', '2021-01-12 16:45:47');
INSERT INTO `tb_product` VALUES (31, '长城集团WESCOM', 'http://localhost:8081/uploadImg/b850403d-6990-41d1-b2a7-6809bc292db6.jpg', 'http://localhost:8081/uploadImg/ab5c559e-b810-4756-a748-46f90a3825cf.jpg', 'http://localhost:8081/uploadImg/95f6e962-a555-41e2-acec-b6684af7bd6f.jpg', 'http://localhost:8081/uploadImg/64d4aa57-c82f-4e0c-93ed-72067ee6bf82.jpg', '\r\n长城集团WESCOM 28英寸4K/2K 144Hz电脑245显示器165电竞27设计32曲面液晶屏 28英寸4K/2K 144Hz电竞设计直屏\r\n\r\n', 128, 1199.00, 15, 100, '2021-01-12 16:47:47', '2021-01-12 18:48:57');
INSERT INTO `tb_product` VALUES (32, '泰坦军团34英寸IPS', 'http://localhost:8081/uploadImg/0def8949-068e-44d1-94bd-a341ebfaca94.jpg', 'http://localhost:8081/uploadImg/6c735ff2-2c9e-490e-b5a4-d0d1eeff767f.jpg', 'http://localhost:8081/uploadImg/2f712678-5f83-4f2a-9914-9d4ac590813b.jpg', 'http://localhost:8081/uploadImg/96e2ff88-f68c-4c17-a3ea-5a60abf1540a.jpg', '<p>泰坦军团34英寸IPS 2K 144Hz HDR400 QD量子点 Type-C 65W 1ms电脑显示器 旋转升降 准4K屏幕电竞带鱼屏P34UG</p>', 128, 3499.00, 5, 100, '2021-01-12 16:49:31', '2021-01-12 18:48:57');
INSERT INTO `tb_product` VALUES (33, '泰坦军团27英寸4K超高清IPS', 'http://localhost:8081/uploadImg/97eed45a-91a4-4248-94f3-e7743cd78419.jpg', 'http://localhost:8081/uploadImg/a90947a6-fc34-4e63-a0fc-e25947c224ee.jpg', 'http://localhost:8081/uploadImg/1055bd45-d37f-4f9a-8a24-5216ebf388d5.jpg', 'http://localhost:8081/uploadImg/a75d9f8e-246f-46fc-bd12-35ed594a5726.jpg', '<p>泰坦军团27英寸4K超高清IPS Type-C HDR技术 1ms 144Hz电竞显示屏 旋转升降 双翼遮光罩 电脑显示器 T27UG</p>', 128, 4599.00, 1, 100, '2021-01-12 16:51:20', '2021-01-12 18:48:50');
INSERT INTO `tb_product` VALUES (34, '华硕', 'http://localhost:8081/uploadImg/0861fb8d-4303-4475-8263-15df7704cba5.jpg', 'http://localhost:8081/uploadImg/095ff377-9218-45b1-bb4d-c24709adbd5b.jpg', 'http://localhost:8081/uploadImg/bb8f6521-7f9a-4b4e-80a3-5c4d184e91d2.jpg', 'http://localhost:8081/uploadImg/60ea8cc1-cfdb-4ae3-9b74-e4a91c24de65.jpg', '<p>华硕 玩家国度ROG 电竞显示器 游戏显示屏 27英寸 4K 144Hz刷新率 IPS HDR400 G-SYNC 神光同步 XG27UQ绝影&nbsp;&nbsp;&nbsp; <br></p>', 128, 7999.00, 515, 100, '2021-01-12 16:52:42', '2021-01-12 18:48:58');
INSERT INTO `tb_product` VALUES (35, '外星人（Alienware）37.5英寸准4K', 'http://localhost:8081/uploadImg/451a716b-3990-4dce-a565-25c9de80952a.jpg', 'http://localhost:8081/uploadImg/cfe8eef9-fd86-4ba6-8d99-1f9dcd501aba.jpg', 'http://localhost:8081/uploadImg/5b0c3914-1533-467e-9172-d9e05e1b5e0e.jpg', 'http://localhost:8081/uploadImg/a97f2e61-91ac-4f7b-916c-177d685dc8a8.jpg', '<p>外星人（Alienware）37.5英寸准4K Nano IPS 曲面 144Hz 1ms HDR600 德国iF设计奖 2300R电竞显示器 AW3821DW</p>', 128, 14999.00, 1, 100, '2021-01-12 16:54:16', '2021-01-12 18:48:58');
INSERT INTO `tb_product` VALUES (36, '小米', 'http://localhost:8081/uploadImg/27ca9fae-c452-4bfb-8098-01169a078c68.jpg', 'http://localhost:8081/uploadImg/d36205cb-fdf0-45ca-b147-9ed05ea63c9e.jpg', 'http://localhost:8081/uploadImg/75fd88a9-c033-4cb1-b2be-5e68f2a301e9.jpg', 'http://localhost:8081/uploadImg/d37f06d1-84c1-40cf-9078-7077c4e5bf4f.jpg', '<p>小米 34英寸显示器 144Hz曲面带鱼屏 游戏电竞电脑屏幕21:9准4K高清LED广视角液晶显示屏 升降旋转底座 支持挂壁分屏</p>', 128, 2399.00, 5, 100, '2021-01-12 16:55:46', '2021-01-12 18:48:58');
INSERT INTO `tb_product` VALUES (37, 'Redmi', 'http://localhost:8081/uploadImg/f8699d73-77a2-438e-b47f-44d4164c27d5.jpg', 'http://localhost:8081/uploadImg/d2e84ee0-7c68-4a23-83b3-147bfcde4d4b.jpg', 'http://localhost:8081/uploadImg/3287f568-9556-4976-82ff-e40be19fdb48.jpg', 'http://localhost:8081/uploadImg/9c0bb73f-1a7d-44f8-b062-8e3743af5bb4.jpg', '<p>Redmi 路由器AX5 高通5核处理器 WIFI6 5G双频 游戏路由 无线家用穿墙 小米路由器</p>', 129, 199.00, 5, 100, '2021-01-12 16:57:27', '2021-01-12 18:48:58');
INSERT INTO `tb_product` VALUES (38, '华为路由AX3', 'http://localhost:8081/uploadImg/96e8b8b6-04d7-4500-a5f3-645df83c961f.jpg', 'http://localhost:8081/uploadImg/355a9057-228e-4299-817b-505b51ec57ec.jpg', 'http://localhost:8081/uploadImg/4e84af25-e78f-4b3b-bacf-3fc2ca5416bc.jpg', 'http://localhost:8081/uploadImg/8a8eea71-742f-4b22-b611-8772e486e390.jpg', '<p>华为路由AX3 Pro 千兆路由器 无线路由器 wifi6/凌霄四核/智能分频/多连不卡/无线家用穿墙/3000M/高速路由</p><p><br></p>', 129, 349.00, 5, 100, '2021-01-12 16:58:57', '2021-01-12 18:48:59');
INSERT INTO `tb_product` VALUES (39, 'TP-LINK双千兆路由器', 'http://localhost:8081/uploadImg/450b7c68-67d0-460e-aa61-bd321a2ff161.jpg', 'http://localhost:8081/uploadImg/528e70f7-cccb-4291-9c9c-b6763fd11dd9.jpg', 'http://localhost:8081/uploadImg/6d11951b-2b26-41fa-a3b0-9c95c7044e39.jpg', 'http://localhost:8081/uploadImg/889e74de-7b32-43a5-bca0-38aff660233d.jpg', '<p>TP-LINK双千兆路由器 1900M无线家用5G双频 WDR7660千兆 六信号放大器 高速路由WIFI穿墙IPv6</p><p><br></p>', 129, 179.00, 5, 100, '2021-01-12 17:00:13', '2021-01-12 18:48:59');
INSERT INTO `tb_product` VALUES (40, '小米路由器4A千兆版', 'http://localhost:8081/uploadImg/012a6540-3922-4d63-ab12-59072b266cb5.jpg', 'http://localhost:8081/uploadImg/0eb1aecc-c3d4-4ab7-a0fd-606e7f7e5dbb.jpg', 'http://localhost:8081/uploadImg/f938664b-6e0a-4f32-b201-94bb4d8b213e.jpg', 'http://localhost:8081/uploadImg/6d163849-efc8-4a05-afb4-c265caf00ae9.jpg', '<p>小米路由器4A千兆版 双核CPU 双千兆 1200M双频无线速率 5G 家用智能路由器 四天线穿墙 双频合一 光纤适用</p>', 129, 109.00, 5, 100, '2021-01-12 17:01:41', '2021-01-12 18:48:59');
INSERT INTO `tb_product` VALUES (41, '华为路由', 'http://localhost:8081/uploadImg/d0f95ee3-2e9d-48f1-bbda-defffe7e5ea3.jpg', 'http://localhost:8081/uploadImg/f51d616b-97c6-4072-8ce7-cb1c4bb8c010.jpg', 'http://localhost:8081/uploadImg/d585d83c-d92f-4ec7-86fc-cde7d2308e61.jpg', 'http://localhost:8081/uploadImg/58d7a4b1-2480-4fc6-b6f1-2e66bcaa263c.jpg', '<p>华为路由 WS5200 四核版 双千兆智能路由器 凌霄四核CPU/5G双频/无线家用穿墙/四信号放大器/高速路由</p><p><br></p>', 129, 189.00, 51, 100, '2021-01-12 17:03:09', '2021-01-12 18:48:59');
INSERT INTO `tb_product` VALUES (42, '华为路由器Q2S（1母1子）无线路由器', 'http://localhost:8081/uploadImg/78089652-f353-4687-ba40-4483184b2be6.jpg', 'http://localhost:8081/uploadImg/f7e56672-a531-4ec9-b922-10e783e8b1a1.jpg', 'http://localhost:8081/uploadImg/f05f9803-1909-4ce8-8db8-49e876cb5ffc.jpg', 'http://localhost:8081/uploadImg/e6f54336-faad-43ca-a69f-c6a3ce6172d3.jpg', '<p>华为路由器Q2S（1母1子）无线路由器 千兆路由器 分布式子母路由/即插即用/超级组网/最大支持一拖15</p>', 129, 599.00, 15, 100, '2021-01-12 17:04:30', '2021-01-12 18:49:00');
INSERT INTO `tb_product` VALUES (43, 'TP-LINK', 'http://localhost:8081/uploadImg/c4a5c77d-5fc9-45d6-b16e-a04e1c9b8bdc.jpg', 'http://localhost:8081/uploadImg/7b414e0f-498e-42a2-b0cf-c34f7dddd7c6.jpg', 'http://localhost:8081/uploadImg/40ce5039-d42d-4d30-8e24-e1a541556876.jpg', 'http://localhost:8081/uploadImg/98a16e0c-d82d-4f30-a2d4-48dfb9b35b2d.jpg', '<p>TP-LINK AX3200千兆无线路由器 WiFi6 5G双频高速网络 Mesh路由 游戏路由 智能家用穿墙 XDR3230易展版</p>', 129, 299.00, 5, 100, '2021-01-12 17:05:49', '2021-01-12 18:49:00');
INSERT INTO `tb_product` VALUES (44, '腾达（Tenda）AC11', 'http://localhost:8081/uploadImg/1e1b1809-e7ea-458e-8e32-ec88d4d3a2d0.jpg', 'http://localhost:8081/uploadImg/f6f041c7-3443-4dba-8b43-68c7e0911b83.jpg', 'http://localhost:8081/uploadImg/77a2e8f3-5f60-4c06-8f5d-08cc2ddaf11a.jpg', 'http://localhost:8081/uploadImg/80a45404-ca73-429d-94a5-3ffea92fdd89.jpg', '<p>腾达（Tenda）AC11 双千兆路由器穿墙增强型 家用游戏无线路由器 智能5G双频1200M 千兆端口光纤适用</p>', 129, 129.00, 51, 100, '2021-01-12 17:07:15', '2021-01-12 18:49:00');
INSERT INTO `tb_product` VALUES (45, '联想（Lenovo）小新Pro14', 'http://localhost:8081/uploadImg/4bb54b53-8826-48f4-b56d-2e04cee7e2bd.jpg', 'http://localhost:8081/uploadImg/8bd4d684-c3ea-48cb-86a3-5293ca184447.jpg', 'http://localhost:8081/uploadImg/d0a99687-432c-48ce-9764-e6a12fddaf25.jpg', 'http://localhost:8081/uploadImg/b49f7064-9d1d-4085-a4e8-db0fed95f4d2.jpg', '<p>联想（Lenovo）小新Pro14 2021款 英特尔酷睿 高性能全面屏超轻薄笔记本电脑 i5-1135G7 16G 512G 锐炬显卡 2.2K全面屏高色域</p>', 130, 5046.00, 5, 100, '2021-01-12 17:08:52', '2021-01-12 18:49:04');
INSERT INTO `tb_product` VALUES (46, '联想(Lenovo)拯救者Y7000P英特尔酷睿i7', 'http://localhost:8081/uploadImg/25008e34-8ee9-4228-9fad-dd2b1ed73a47.jpg', 'http://localhost:8081/uploadImg/92216ce2-9f32-43db-8956-5598134ac035.jpg', 'http://localhost:8081/uploadImg/839eda83-fe6a-4407-9eb3-75d00880fd1d.jpg', 'http://localhost:8081/uploadImg/2a55afbd-1c4c-4579-8a40-a622d01b3def.jpg', '<p>联想(Lenovo)拯救者Y7000P英特尔酷睿i7 15.6英寸游戏笔记本电脑(8核i7-10875H 16G 512G RTX2060 144Hz)灰</p>', 130, 8999.00, 562, 100, '2021-01-12 17:10:02', '2021-01-12 18:49:48');
INSERT INTO `tb_product` VALUES (47, '联想(Lenovo)小新Air14锐龙版性能轻薄本', 'http://localhost:8081/uploadImg/d70eb922-ad59-4328-a85b-4f904a999083.jpg', 'http://localhost:8081/uploadImg/6e08ae78-f731-426b-b53a-b6ce5067adab.jpg', 'http://localhost:8081/uploadImg/429a76ae-43b3-4dfc-a5fd-48c96195fde6.jpg', 'http://localhost:8081/uploadImg/809d79f8-65d2-4360-980e-3345c5cb545e.jpg', '<p>联想(Lenovo)小新Air14锐龙版性能轻薄本 14英寸全面屏办公笔记本电脑(6核R5-4600U 16G 512G 高色域)深空灰</p>', 130, 4599.00, 1, 100, '2021-01-12 17:11:10', '2021-01-12 18:49:01');
INSERT INTO `tb_product` VALUES (48, '联想(Lenovo)拯救者R7000P', 'http://localhost:8081/uploadImg/d243a88e-4934-40d7-af01-2da78fe80963.jpg', 'http://localhost:8081/uploadImg/249bf182-18b0-4e57-9a52-ec6ff7865efb.jpg', 'http://localhost:8081/uploadImg/e8b84fa8-c6ea-4223-a452-d8b069b0e22d.jpg', 'http://localhost:8081/uploadImg/8665a172-e5b4-4b1f-b9da-dcc1a5cb72cf.jpg', '<p>联想(Lenovo)拯救者R7000P 15.6英寸游戏笔记本电脑(R7-4800H 16G 512G SSD RTX2060 144Hz100%sRGB)钛晶灰</p>', 130, 8299.00, 15, 100, '2021-01-12 17:12:33', '2021-01-12 18:49:02');
INSERT INTO `tb_product` VALUES (49, '华为笔记本电脑', 'http://localhost:8081/uploadImg/13bfd11a-ec0e-4a4f-b2b1-48c00664d6da.jpg', 'http://localhost:8081/uploadImg/2aaceb4a-e9c3-4324-afcc-8639471eb384.jpg', 'http://localhost:8081/uploadImg/30feeb92-ad3a-433c-aee0-5a61140d525b.jpg', 'http://localhost:8081/uploadImg/405c912e-5764-43af-92cf-eb6633b222b0.jpg', '<p>华为笔记本电脑 MateBook D 14 2021款 14英寸 11代酷睿 I5 16G+512G 轻薄本/护眼全面屏/多屏协同/Wifi 6 银</p>', 130, 4999.00, 5, 100, '2021-01-12 17:15:20', '2021-01-12 18:47:12');
INSERT INTO `tb_product` VALUES (50, '戴尔DELL灵越5000', 'http://localhost:8081/uploadImg/fdf8ceb3-f53b-4e55-837d-ee4674683c04.jpg', 'http://localhost:8081/uploadImg/d08325f7-df15-42f5-94f3-1c304ef884d5.jpg', 'http://localhost:8081/uploadImg/1e55e1e0-1712-49f9-b57f-0e076c8d135f.jpg', 'http://localhost:8081/uploadImg/622852ac-ebce-481b-a5f2-e9de75904bb4.jpg', '<p>戴尔DELL灵越5000 14英寸酷睿i5网课学习轻薄笔记本电脑(十代i5-1035G1 8G 512G MX230 2G独显)银</p>', 130, 3789.00, 3, 100, '2021-01-12 17:16:19', '2021-01-12 18:47:14');
INSERT INTO `tb_product` VALUES (51, 'Apple', 'http://localhost:8081/uploadImg/5c716024-6530-4b6f-80a0-0d747f75cdb5.jpg', 'http://localhost:8081/uploadImg/05f90f61-548a-4521-8106-36434f93b12e.jpg', 'http://localhost:8081/uploadImg/5e37a0a8-88b9-4227-800b-c32c21baefee.jpg', 'http://localhost:8081/uploadImg/bd9160c0-faf2-4bd0-88e0-e36ad10dc9de.jpg', '<p>Apple MacBook Air 13.3 新款八核M1芯片(7核图形处理器) 8G 256G SSD 深空灰 笔记本电脑 MGN63CH/A</p>', 130, 7999.00, 15, 100, '2021-01-12 17:17:29', '2021-01-12 18:47:16');
INSERT INTO `tb_product` VALUES (52, '联想(Lenovo)YOGA', 'http://localhost:8081/uploadImg/504a2e5e-b800-4b87-b5b8-3aeab140eb0c.jpg', 'http://localhost:8081/uploadImg/02a13e8a-75fd-49cc-a93c-d7f7e0aa621f.jpg', 'http://localhost:8081/uploadImg/d069babf-d9b5-4313-92a8-72669886b049.jpg', 'http://localhost:8081/uploadImg/ab0c90c8-aaac-4d41-9bd1-42f4eed82c0e.jpg', '<p>联想(Lenovo)YOGA 14s 英特尔Evo平台 14英寸全面屏笔记本电脑(i5-1135G7 16G 512G 2.8K 90Hz 锐炬显卡)灰</p>', 130, 6199.00, 50, 100, '2021-01-12 17:19:24', '2021-01-12 18:47:17');
INSERT INTO `tb_product` VALUES (53, '美的', 'http://localhost:8081/uploadImg/5b222421-eaaf-4eab-a394-18ca0ad392bc.jpg', 'http://localhost:8081/uploadImg/fc9ff53b-4f16-4e6e-9f30-763f8daf0838.jpg', 'http://localhost:8081/uploadImg/7ec955a9-c2e9-47f2-bc5e-557c2a9dc9e6.jpg', 'http://localhost:8081/uploadImg/b37c2a82-5fd5-42e7-821b-22bd730f4bbf.jpg', '<p>美的 Midea 波轮洗衣机全自动 8公斤专利免清洗十年桶如新 立方内桶 水电双宽 MB80ECO1</p>', 131, 799.00, 62, 100, '2021-01-12 17:21:05', '2021-01-12 18:47:18');
INSERT INTO `tb_product` VALUES (54, '海尔（Haier)', 'http://localhost:8081/uploadImg/299bd025-86b6-4f45-9c33-64887d1f3f9a.jpg', 'http://localhost:8081/uploadImg/36064cca-9917-4076-b8fa-530240ebd525.jpg', 'http://localhost:8081/uploadImg/c3e95d96-7d8d-4405-9fc0-a2b18da19d36.jpg', 'http://localhost:8081/uploadImg/dc1c0b53-5422-4ad5-924d-849b7c01c3b8.jpg', '<p>海尔（Haier) 10KG全自动BLDC变频滚筒洗衣机 EG10014B39GU1</p>', 131, 2199.00, 15, 100, '2021-01-12 17:22:11', '2021-01-12 18:47:19');
INSERT INTO `tb_product` VALUES (55, '小天鹅（LittleSwan）8公斤', 'http://localhost:8081/uploadImg/c40422cf-89e0-4d36-b7c5-c455111afcd0.jpg', 'http://localhost:8081/uploadImg/1cdc860b-e743-45a8-9c4c-8725a05fb31d.jpg', 'http://localhost:8081/uploadImg/8c939a79-e82f-4bcc-9792-b02ecfa2dc2c.jpg', 'http://localhost:8081/uploadImg/b8e69c69-128b-4538-a369-c282a81edfd2.jpg', '<p>小天鹅（LittleSwan）8公斤 波轮洗衣机全自动 健康免清洗 一键脱水 品质电机 TB80V20</p>', 131, 899.00, 24, 100, '2021-01-12 17:23:00', '2021-01-12 18:47:20');
INSERT INTO `tb_product` VALUES (56, '小天鹅（LittleSwan）10公斤变频', 'http://localhost:8081/uploadImg/b8f2c9f9-aee3-49e0-8f46-60672a63d101.jpg', 'http://localhost:8081/uploadImg/9b3e1ae7-4862-492b-b4ba-542933da7d12.jpg', 'http://localhost:8081/uploadImg/ecef66c6-e22d-4407-87a9-d99d670f1433.jpg', 'http://localhost:8081/uploadImg/6c98eabc-508e-4853-8e93-98d00ccf8310.jpg', '<p>小天鹅（LittleSwan）10公斤变频 滚筒洗衣机全自动 智能家电 特色高温洗 BLDC变频电机 静音 TG100PURE</p>', 131, 1998.00, 6, 100, '2021-01-12 17:24:06', '2021-01-12 18:47:22');
INSERT INTO `tb_product` VALUES (57, '海尔（Haier）10KG全自动波轮洗衣机', 'http://localhost:8081/uploadImg/f8768b56-5359-49e8-b597-f00aecdc2481.jpg', 'http://localhost:8081/uploadImg/ed1fbbdc-a9b7-4035-91ac-3bf16f1cbb44.jpg', 'http://localhost:8081/uploadImg/368bd273-5b65-4883-ba49-a78b17843c9e.jpg', 'http://localhost:8081/uploadImg/79c91a13-6b93-4d95-b2ad-cafc3d26778f.jpg', '<p>海尔（Haier）10KG全自动波轮洗衣机 大容量 让衣物自由舒展 全新升级内桶 XQB100-M21JDB</p>', 131, 1199.00, 54, 100, '2021-01-12 17:25:14', '2021-01-12 18:47:24');
INSERT INTO `tb_product` VALUES (58, '美的（Midea）滚筒洗衣机全自动', 'http://localhost:8081/uploadImg/22dca8b5-3a5f-427f-b473-c84a8b4e00c1.jpg', 'http://localhost:8081/uploadImg/0c02b199-a354-489b-8267-e8f59ac750b9.jpg', 'http://localhost:8081/uploadImg/5b6f1953-26f3-4bdd-8d5b-75b36076d9ee.jpg', 'http://localhost:8081/uploadImg/f327f8a7-f0fa-4c04-a7b9-500bcf14e16a.jpg', '<p>美的（Midea）滚筒洗衣机全自动 10公斤变频除螨洗烘一体 双蒸汽恒温洗 祛味空气洗 深层除螨 MD100A5</p>', 131, 3299.00, 23, 100, '2021-01-12 17:26:24', '2021-01-12 18:47:24');
INSERT INTO `tb_product` VALUES (59, '西门子(SIEMENS)', 'http://localhost:8081/uploadImg/91b37cab-6e0a-4da1-8c7e-77cc84ed0b49.jpg', 'http://localhost:8081/uploadImg/c2ec0508-c891-4f4d-9117-843acbe31c65.jpg', 'http://localhost:8081/uploadImg/6ca50528-d8ac-4a48-b33c-70fd0fbbe5ca.jpg', 'http://localhost:8081/uploadImg/63a6fa8d-f17c-4db2-b8f3-d7c207668b06.jpg', '<p>西门子(SIEMENS) 10公斤 变频滚筒洗衣机 降噪节能 快洗15\' 筒清洁（白色） XQG100-WM12P2602W</p>', 131, 3999.00, 19, 100, '2021-01-12 17:27:32', '2021-01-12 18:47:25');
INSERT INTO `tb_product` VALUES (60, '西门子(SIEMENS)', 'http://localhost:8081/uploadImg/f7d47852-37ce-492e-99e5-73ec0e0ab685.jpg', 'http://localhost:8081/uploadImg/e20dbf1d-6749-4ec5-938a-9b66a8daff39.jpg', 'http://localhost:8081/uploadImg/9ad74f45-a953-4adf-8591-799f3ed91151.jpg', 'http://localhost:8081/uploadImg/c0c60f22-cb5f-40e3-9e6c-5e2b08ca9ec5.jpg', '<p>西门子(SIEMENS) 10公斤变频滚筒洗衣机 快洗15\' 羽绒服洗涤 XQG100-WM12P2692W</p><p><br></p>', 131, 4099.00, 25, 105, '2021-01-12 17:28:28', '2021-01-12 19:00:21');
INSERT INTO `tb_product` VALUES (61, '海尔（Haier）', 'http://localhost:8081/uploadImg/828d7ec4-8519-480b-89b6-d104cb77ddb4.jpg', 'http://localhost:8081/uploadImg/c825bace-0fdb-45ba-88cb-d55d6c1509b4.jpg', 'http://localhost:8081/uploadImg/8e715196-218a-426c-8750-d5852853dbd8.jpg', 'http://localhost:8081/uploadImg/16e018b9-67fd-46dd-a316-87c5eab97e6e.jpg', '<p>海尔（Haier）520升双变频风冷无霜对开门双开门冰箱多路送风90°自动悬停门纤薄机身BCD-520WDPD</p>', 132, 3499.00, 36, 100, '2021-01-12 17:30:51', '2021-01-12 18:47:26');
INSERT INTO `tb_product` VALUES (62, '美的(Midea)606升', 'http://localhost:8081/uploadImg/4af295e6-19a2-495f-94ee-d3d48ec42e53.jpg', 'http://localhost:8081/uploadImg/ce039a79-1564-4d19-a7e0-f5f00e8b8766.jpg', 'http://localhost:8081/uploadImg/3844a8da-a32c-4eee-a411-07709737ea55.jpg', 'http://localhost:8081/uploadImg/358bdcb3-eaed-45f9-90d2-c47423f2551d.jpg', '<p>美的(Midea)606升 对开电冰箱双开门智能家电双变频风冷一级能效冰箱独立风冷大容积节能BCD-606WKPZM(E)</p>', 132, 3299.00, 27, 100, '2021-01-12 17:31:52', '2021-01-12 18:47:27');
INSERT INTO `tb_product` VALUES (63, '美的(Midea)', 'http://localhost:8081/uploadImg/081342a4-a4d1-4d30-aacd-36b0c5d9d3ca.jpg', 'http://localhost:8081/uploadImg/2b02f3f8-7c0d-4bd7-b58b-c42ff4f73d59.jpg', 'http://localhost:8081/uploadImg/d27f9632-45bd-4909-bebb-6b8c1a02c5bc.jpg', 'http://localhost:8081/uploadImg/0391c383-b288-4f7c-a959-5765c18deee3.jpg', '<p>美的(Midea) 213升 三门三温家用冰箱冷藏冷冻大容量保鲜节能省电静音 BCD-213TM(E)</p>', 132, 1269.00, 28, 100, '2021-01-12 17:33:04', '2021-01-12 18:47:28');
INSERT INTO `tb_product` VALUES (64, '海尔', 'http://localhost:8081/uploadImg/a5528a07-e0f3-4fcb-b631-f2dc0dbea405.jpg', 'http://localhost:8081/uploadImg/b14e0869-9bb5-4aed-96e3-dcdaa5d0e717.jpg', 'http://localhost:8081/uploadImg/2bf86885-c321-4c86-9b44-88c1a7740913.jpg', 'http://localhost:8081/uploadImg/1b92eea8-73a4-46ba-807e-45d801c6fd7d.jpg', '<p>海尔 (Haier )223升变频风冷无霜三门冰箱 干湿分储中门全温区变温DEO净味系统BCD-223WDPT</p><p><br></p>', 132, 2399.00, 36, 568, '2021-01-12 17:34:08', '2021-01-12 19:04:25');
INSERT INTO `tb_product` VALUES (65, '美的(Midea)535升', 'http://localhost:8081/uploadImg/df0ef1fe-6847-475c-ad90-d651fd78f003.jpg', 'http://localhost:8081/uploadImg/ae951e19-ee92-487f-bf4d-8911a036803f.jpg', 'http://localhost:8081/uploadImg/2d8334da-2d6d-4994-b35b-c22c6769a729.jpg', 'http://localhost:8081/uploadImg/69c32434-401c-4d23-90dc-34d1879843cf.jpg', '<p>美的(Midea)535升 对开电冰箱双开门智能家电双变频风冷无霜冷藏冷冻电脑控温节能省电 BCD-535WKPZM(E)</p>', 132, 2899.00, 24, 100, '2021-01-12 17:35:26', '2021-01-12 18:47:29');
INSERT INTO `tb_product` VALUES (66, '西门子(SIEMENS)', 'http://localhost:8081/uploadImg/f92758ed-9a19-4db9-be66-c77d6dd6459c.jpg', 'http://localhost:8081/uploadImg/678f0f9f-d842-4cc8-8506-0fed50e2bca9.jpg', 'http://localhost:8081/uploadImg/e426713b-b205-4e3b-a0de-9a0d66c4bd01.jpg', 'http://localhost:8081/uploadImg/d3ce8121-55b7-4e00-b0ce-fef92448140a.jpg', '<p>西门子(SIEMENS) 502升 变频风冷无霜冰箱双开门对开门冰箱 超薄 简约设计（白色） BCD-502W(KA50NE20TI)</p>', 132, 6099.00, 25, 100, '2021-01-12 17:36:37', '2021-01-12 18:47:29');
INSERT INTO `tb_product` VALUES (67, '海尔(Haier)', 'http://localhost:8081/uploadImg/e71027a7-b7cd-4f7c-8232-8fd17d20d6bd.jpg', 'http://localhost:8081/uploadImg/e6eaa34a-5bae-4e06-8c81-5b6f188479d8.jpg', 'http://localhost:8081/uploadImg/5c5837b0-e73d-4c72-a920-cf14e3e2c6bd.jpg', 'http://localhost:8081/uploadImg/bf7a7c15-bed4-4198-9e37-406b9f4087d0.jpg', '<p>海尔(Haier)545升星蕴旗舰系列风冷无霜双变频十字门四门冰箱干湿分储母婴食材T·ABT除菌纤薄箱体BCD-545WFPB</p>', 132, 5799.00, 25, 100, '2021-01-12 17:37:34', '2021-01-12 18:47:30');
INSERT INTO `tb_product` VALUES (68, '容声(Ronshen)', 'http://localhost:8081/uploadImg/a5c34356-0d52-4771-b281-b49a55e99edc.jpg', 'http://localhost:8081/uploadImg/22994dff-d6fc-4fcb-a559-932a3a775d8e.jpg', 'http://localhost:8081/uploadImg/cbfa041a-e86f-41cd-9235-32b99976cd9f.jpg', 'http://localhost:8081/uploadImg/5ddd93f2-a1e0-4add-ab2a-3150298d412f.jpg', '<p>容声(Ronshen) 636升双门冰箱 双开门冰箱 对开门冰箱 一级风冷无霜 双变频 大容量 节能静音BCD-636WD11HPA</p>', 132, 3529.00, 26, 100, '2021-01-12 17:38:36', '2021-01-12 18:47:31');
INSERT INTO `tb_product` VALUES (69, 'Apple iPhone 12', 'http://localhost:8081/uploadImg/9083581a-eddd-4d2e-81b4-56d2c262a33d.png', 'http://localhost:8081/uploadImg/http://localhost:8081/uploadImg/395c9bae-5662-4484-b879-1110a31d4886.jpg', 'http://localhost:8081/uploadImg/http://localhost:8081/uploadImg/a566e291-4ab8-47bc-b014-210d352b589b.jpg', 'http://localhost:8081/uploadImg/http://localhost:8081/uploadImg/e406c962-dc1b-4a9c-8778-665ff6549b5f.jpg', '<p>Apple iPhone 12 (A2404) 128GB 白色 支持移动联通电信5G 双卡双待手机</p><p><br></p>', 133, 6799.00, 3, 100, '2021-01-12 17:40:25', '2021-01-14 09:12:47');
INSERT INTO `tb_product` VALUES (70, '小米11', 'http://localhost:8081/uploadImg/81870765-127e-420f-af5a-584aa746d0a8.jpg', 'http://localhost:8081/uploadImg/91d386d4-6b5c-4151-8a30-18d90e090dac.jpg', 'http://localhost:8081/uploadImg/9b52baa8-ff84-4d08-8518-9611f0948cf9.jpg', 'http://localhost:8081/uploadImg/f4a5050b-dec2-45e9-968b-092fece4ba90.jpg', '<p>小米11 5G 骁龙888 2K AMOLED四曲面柔性屏 1亿像素 55W有线闪充 50W无线闪充 8GB+256GB 蓝色 游戏</p>', 133, 4299.00, 4, 100, '2021-01-12 17:41:22', '2021-01-12 18:47:32');
INSERT INTO `tb_product` VALUES (71, 'OPPO Reno5 5G ', 'http://localhost:8081/uploadImg/1db846a8-8e8f-4fb2-972b-f1d5bbce6d08.jpg', 'http://localhost:8081/uploadImg/605723a8-ab34-4335-926f-a4f9ed4af9d4.jpg', 'http://localhost:8081/uploadImg/1a509d47-6226-4957-82fe-fe76193139f1.jpg', 'http://localhost:8081/uploadImg/de81b193-7334-44b0-9ae6-c7d515cb5ac4.jpg', '<p>OPPO Reno5 5G 6400万水光人像四摄 65W超级闪充 12+256GB 星河入梦 全网通</p>', 133, 2999.00, 25, 100, '2021-01-12 17:42:45', '2021-01-12 18:47:32');
INSERT INTO `tb_product` VALUES (72, 'Apple iPhone 12 Pro Max', 'http://localhost:8081/uploadImg/70c96a99-235c-471b-b080-d121a495ae55.jpg', 'http://localhost:8081/uploadImg/cb13494c-1807-4466-a168-1de827aea5a2.jpg', 'http://localhost:8081/uploadImg/20fd2050-3bbc-4b71-b9cb-f6795845bc87.jpg', 'http://localhost:8081/uploadImg/20597c29-7da3-401a-90af-47426cc06817.jpg', '<p>Apple iPhone 12 Pro Max (A2412) 256GB 海蓝色 支持移动联通电信5G 双卡双待手机</p>', 133, 10099.00, 25, 100, '2021-01-12 17:43:37', '2021-01-12 18:47:33');
INSERT INTO `tb_product` VALUES (73, 'Redmi Note 9 ', 'http://localhost:8081/uploadImg/d5074888-45dc-4426-8a83-502f2cdd1405.jpg', 'http://localhost:8081/uploadImg/e3fbda2a-6cbe-4fdc-ace2-81877abfe31e.jpg', 'http://localhost:8081/uploadImg/3dd21733-dbf2-424a-8b29-6a97d31ba2e8.jpg', 'http://localhost:8081/uploadImg/4cf7942e-6b9d-40f5-83bf-bcadf6971bb5.jpg', '<p>Redmi Note 9 4G 6000mAh大电池 骁龙662处理器 18W快充 羽墨黑 6GB+128GB 游戏智能 小米 红米</p>', 133, 1099.00, 35, 100, '2021-01-12 17:44:27', '2021-01-12 18:47:34');
INSERT INTO `tb_product` VALUES (74, '一加手机OnePlus', 'http://localhost:8081/uploadImg/ba8c62de-59fb-4b96-91e2-ff105677536c.jpg', 'http://localhost:8081/uploadImg/479d283d-0f9f-49e6-a70a-cfa96c1d0cb7.jpg', 'http://localhost:8081/uploadImg/1b87c36c-b787-4bbf-813f-9a41a3682ef9.jpg', 'http://localhost:8081/uploadImg/afd45ce8-42fc-4339-9999-1533a9044e9a.jpg', '<p>一加手机OnePlus 8T 5G旗舰 120Hz柔性直屏 65W闪充 高通骁龙865 超清四摄 12GB+256GB 银时 拍照游戏</p>', 133, 3699.00, 31, 100, '2021-01-12 17:45:22', '2021-01-12 18:47:35');
INSERT INTO `tb_product` VALUES (75, '华为 HUAWEI Mate 40', 'http://localhost:8081/uploadImg/2b8066e2-8c15-455a-bece-a766c96c6a0a.jpg', 'http://localhost:8081/uploadImg/76a8e43a-b87d-4014-b20c-ca62f7fd8959.jpg', 'http://localhost:8081/uploadImg/66dd9bfb-1274-40cc-87cb-0aa4502585ee.jpg', 'http://localhost:8081/uploadImg/fc12f07a-26be-418c-b4ad-63599ab63198.jpg', '<p>华为 HUAWEI Mate 40 麒麟9000E SoC芯片 5000万超感知徕卡电影影像 有线无线双超级快充8GB+128GB亮黑色5G</p>', 133, 4999.00, 26, 100, '2021-01-12 17:46:22', '2021-01-12 18:47:36');
INSERT INTO `tb_product` VALUES (76, '华为 HUAWEI Mate 40 Pro', 'http://localhost:8081/uploadImg/d1c0273a-1a86-4280-a69c-8d988ca6aa60.jpg', 'http://localhost:8081/uploadImg/daa304c8-865b-4215-8d68-004a80543b35.jpg', 'http://localhost:8081/uploadImg/dab953f8-97f9-4b40-8a6e-7451f4728b3d.jpg', 'http://localhost:8081/uploadImg/9406e9f1-f2db-45ec-b08d-52515b645687.jpg', '<p>华为 HUAWEI Mate 40 Pro麒麟9000 SoC芯片 超感知徕卡电影影像 有线无线双超级快充8GB+256GB亮黑色5G全网通</p>', 133, 6999.00, 2, 100, '2021-01-12 17:47:14', '2021-01-12 18:47:36');

-- ----------------------------
-- Table structure for tb_receiving_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_receiving_info`;
CREATE TABLE `tb_receiving_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '收货信息ID',
  `user_id` bigint(0) NOT NULL COMMENT '客户ID',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户名',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户电话',
  `user_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户收货地区',
  `user_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户收货详细地址',
  `user_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户订单留言',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_receiving_info
-- ----------------------------
INSERT INTO `tb_receiving_info` VALUES (1, 10007, 'lin', '15914965214', '安徽省/芜湖市/弋江区', '广州大学', '1深度');
INSERT INTO `tb_receiving_info` VALUES (2, 10010, '723彭于晏', '15914965874', '安徽省/芜湖市/镜湖区', '呼呼呼', '都纷纷为非无法访问');
INSERT INTO `tb_receiving_info` VALUES (3, 10011, 't', '19924545263', '安徽省/芜湖市/弋江区', 'ttt', 'tt');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10019 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '15914968547', 'admin@admin.com', '2021-01-06 15:33:54', '2021-01-06 15:33:56');
INSERT INTO `tb_user` VALUES (4, '欧阳', '123456', '15811111111', 'test11@test.com', '2020-08-10 17:27:16', '2020-08-11 16:07:19');
INSERT INTO `tb_user` VALUES (5, '黎明', 'e10adc3949ba59abbe56e057f20f883e', '15844444444', 'test2@test.com', '2020-08-10 17:28:11', '2020-08-10 17:28:11');
INSERT INTO `tb_user` VALUES (7, '曾志伟', 'e10adc3949ba59abbe56e057f20f883e', '15811111111', 'daixiahu1@qq.com', '2020-08-10 17:36:59', '2020-08-10 17:36:59');
INSERT INTO `tb_user` VALUES (17, '111', '123456', '15811111111', 'test116@test.com', '2020-08-10 17:52:56', '2020-08-10 17:52:56');
INSERT INTO `tb_user` VALUES (18, '111', '123456', '15811111111', 'test117@test.com', '2020-08-10 17:52:58', '2020-08-10 17:52:58');
INSERT INTO `tb_user` VALUES (19, '1111', '12345678', '15811111111', 'test118@test.com', '2020-08-10 17:53:01', '2020-08-29 22:00:47');
INSERT INTO `tb_user` VALUES (21, 'd', 'e10adc3949ba59abbe56e057f20f883e', '15811111111', 'daixiahu99@qq.com', '2020-08-11 21:52:51', '2020-08-11 21:52:51');
INSERT INTO `tb_user` VALUES (22, '123', 'e10adc3949ba59abbe56e057f20f883e', '15811111111', 'daixiahu11@qq.com', '2020-08-22 18:57:28', '2020-08-22 18:57:28');
INSERT INTO `tb_user` VALUES (25, '1234567', 'e10adc3949ba59abbe56e057f20f883e', '15811111111', 'daixiahu1111@qq.com', '2020-08-22 19:10:07', '2020-08-22 19:10:07');
INSERT INTO `tb_user` VALUES (26, '1234567', 'e10adc3949ba59abbe56e057f20f883e', '15811111111', 'daixiahu22@qq.com', '2020-08-22 19:12:04', '2020-08-22 19:12:04');
INSERT INTO `tb_user` VALUES (27, '1234567', 'e10adc3949ba59abbe56e057f20f883e', '15811111111', 'daixiahu222@qq.com', '2020-08-22 19:52:51', '2020-08-22 19:52:51');
INSERT INTO `tb_user` VALUES (28, '1234567', 'e10adc3949ba59abbe56e057f20f883e', '15811111111', 'daixiahu2222@qq.com', '2020-08-22 19:53:56', '2020-08-22 19:53:56');
INSERT INTO `tb_user` VALUES (29, '123456', 'e10adc3949ba59abbe56e057f20f883e', '15811111111', 'daixiahu12@qq.com', '2020-08-22 22:19:33', '2020-08-22 22:19:33');
INSERT INTO `tb_user` VALUES (30, '1234', 'e10adc3949ba59abbe56e057f20f883e', '15811111111', 'daixiahu789@qq.com', '2020-08-22 22:22:50', '2020-08-22 22:22:50');
INSERT INTO `tb_user` VALUES (31, '大啊啊啊啊', '25d55ad283aa400af464c76d713c07ad', '15811111111', 'kimi45@qq.com', '2020-09-02 00:47:00', '2020-09-02 00:47:00');
INSERT INTO `tb_user` VALUES (10001, '王祖蓝', 'e10adc3949ba59abbe56e057f20f883e', '10086', 'kimi@qq.com', '2020-08-02 14:42:30', '2020-08-02 14:42:30');
INSERT INTO `tb_user` VALUES (10003, '刘德华', 'e10adc3949ba59abbe56e057f20f883e', '100861', 'kimi1@qq.com', '2020-08-02 14:54:34', '2020-08-02 14:54:34');
INSERT INTO `tb_user` VALUES (10006, '郭富城', 'e10adc3949ba59abbe56e057f20f883e', '15822222222', 'daixiahu@qq.com', '2020-08-04 19:21:08', '2020-08-04 19:21:08');
INSERT INTO `tb_user` VALUES (10007, 'arlin', 'e10adc3949ba59abbe56e057f20f883e', '15914938758', 'arlin@163.com', '2021-01-06 21:19:40', '2021-01-13 11:11:45');
INSERT INTO `tb_user` VALUES (10010, '彭于晏', 'e10adc3949ba59abbe56e057f20f883e', '19927576541', '906336724@qq.com', '2021-01-07 02:15:27', '2021-01-13 09:25:33');
INSERT INTO `tb_user` VALUES (10011, '123456@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '', '123456@qq.com', '2021-01-13 10:05:10', '2021-01-13 10:14:22');

SET FOREIGN_KEY_CHECKS = 1;
