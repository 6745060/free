-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-05-26 15:33:40
-- 服务器版本： 5.6.50-log
-- PHP 版本： 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `chatgpt`
--

-- --------------------------------------------------------

--
-- 表的结构 `admins`
--

CREATE TABLE `admins` (
  `id` int(11) UNSIGNED NOT NULL,
  `root` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否超级管理员 0-否 1-是',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `multipoint_login` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '是否支持多处登录：1-是；0-否；',
  `disable` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '是否禁用：0-否；1-是；',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

--
-- 转存表中的数据 `admins`
--

INSERT INTO `admins` (`id`, `root`, `name`, `avatar`, `account`, `password`, `login_time`, `login_ip`, `multipoint_login`, `disable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '系统管理员', 'https://chatgpt-web.oss-cn-beijing.aliyuncs.com/avatar/admin1.jpg', 'admin', '$argon2id$v=19$m=65536,t=4,p=1$1WHi3hqbHD7AwGgMISmc9g$iCtzTTt/IHR0EAoh2vJfRs1YoKC++/f2TNyv4xwFqQU', NULL, '', 1, 0, '2023-03-16 00:00:00', '2023-05-18 17:56:49', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `key_id` int(11) NOT NULL DEFAULT '0' COMMENT 'key池id',
  `model` varchar(20) NOT NULL COMMENT '所用模型',
  `charge_mode` varchar(10) DEFAULT NULL COMMENT '计费模式',
  `charge_rate` int(11) DEFAULT '0' COMMENT '换算倍数',
  `role` varchar(20) DEFAULT NULL COMMENT '角色',
  `prompt` varchar(250) NOT NULL COMMENT '问题',
  `content` text COMMENT '回答',
  `prompt_tokens` int(11) NOT NULL DEFAULT '0',
  `completion_tokens` int(11) DEFAULT '0',
  `total_tokens` int(11) NOT NULL DEFAULT '0' COMMENT '消耗总tokens',
  `total_points` int(11) NOT NULL DEFAULT '0' COMMENT '消耗总积分',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 表的结构 `chat_sessions`
--

CREATE TABLE `chat_sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_uuid` varchar(64) DEFAULT NULL,
  `chat_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_message_id` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 表的结构 `chat_titles`
--

CREATE TABLE `chat_titles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(255) DEFAULT NULL,
  `session_uuid` varchar(255) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对话窗口表';

--
-- 表的结构 `configs`
--

CREATE TABLE `configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL COMMENT '名字',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述信息',
  `value` text,
  `created_at` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配置表';

--
-- 转存表中的数据 `configs`
--

INSERT INTO `configs` (`id`, `type`, `name`, `desc`, `value`, `created_at`, `updated_at`) VALUES
(90, 'register', 'register_way', '注册方式', '10', NULL, NULL),
(94, 'register', 'register_code', '注册码', '68823095', NULL, NULL),
(95, 'register', 'default_avatar', '默认头像', 'https://chatgpt-web.oss-cn-beijing.aliyuncs.com/avatar/default.png', NULL, NULL),
(96, 'register', 'enable_ercode', '是否启用二维码', '0', NULL, NULL),
(97, 'register', 'enable_verify_code', '是否启用验证码', '1', NULL, NULL),
(100, 'website', 'name', '网站名', 'chatgpt管理系统', 1660620367, 1679191955),
(120, 'website', 'favicon', '图标', 'https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230425/avatart.jpg', 1660620367, 1679191955),
(130, 'website', 'email', '官方联系邮箱', '245629560@qq.com', 1660620367, 1679191955),
(150, 'website', 'copyright', NULL, '[{\"name\":\"LikeAdmin开源系统\",\"link\":\"http://www.beian.gov.cn\"}]', 1660620367, 1660620367),
(160, 'website', 'qq', '客服QQ', '245629560', NULL, NULL),
(170, 'website', 'logo', 'logo', 'https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230425/avatart.jpg', 1660620367, 1679191955),
(200, 'chatgpt', 'baseUrl', NULL, 'https://open2.aiproxy.xyz', NULL, NULL),
(210, 'chatgpt', 'proxyUrl', NULL, 'https://open2.aiproxy.xyz', NULL, NULL),
(220, 'chatgpt', 'model', NULL, 'gpt-3.5-turbo', NULL, NULL),
(230, 'chatgpt', 'topP', NULL, '20', NULL, NULL),
(240, 'chatgpt', 'memoryMemo', NULL, '36', NULL, NULL),
(250, 'chatgpt', 'isSerial', NULL, '1', NULL, NULL),
(260, 'chatgpt', 'timeout', NULL, '60', NULL, NULL),
(300, 'storage', 'default', '默认存储', 'oss', 1660620367, 1662620927),
(310, 'storage', 'local', '本地存储', '{\"isDefault\":false,\"name\":\"本地存储\"}', 1660620367, 1662620927),
(320, 'storage', 'oss', '阿里云云存储', '{\"isDefault\":false,\"name\":\"阿里云存储\",\"bucket\":\"chatgpt-web\",\"secretKey\":\"TrMSMf9fTKQfhT2OgdOyfxVrrT1p8m\",\"accessKey\":\"LTAI4Fy1JARZrdPGSDL2xSQi\",\"domain\":\"https://chatgpt-web.oss-cn-beijing.aliyuncs.com\",\"endpoint\":\"oss-cn-beijing.aliyuncs.com\"}', 1660620367, 1662620071),
(330, 'storage', 'qiniu', '七牛云存储', '{\"name\":\"七牛云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\"}', 1660620367, 1660620367),
(340, 'storage', 'cos', '腾讯云存储', '{\"name\":\"腾讯云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\",\"region\":\"\"}', 1660620367, 1660620367),
(400, 'sms', 'default', NULL, 'aliyun', 1660620367, 1660620367),
(410, 'sms', 'aliyun', '阿里云', '{\"name\":\"阿里云短信\",\"alias\":\"aliyun\",\"sign\":\"\",\"appKey\":\"\",\"secretKey\":\"\"}', 1660620367, 1660620367),
(420, 'sms', 'tencent', '腾讯', '{\"name\":\"腾讯云短信\",\"alias\":\"tencent\",\"sign\":\"\",\"appId\":\"\",\"secretId\":\"\",\"secretKey\":\"\"}', 1660620367, 1660620367),
(430, 'sms', 'huawei', '华为', '{\"name\":\"华为云短信\",\"alias\":\"huawei\"}', 1660620367, 1660620367),
(500, 'point', 'register', '注册获取积分', '1000', NULL, NULL),
(510, 'point', 'inviter', '邀请者获取积分', '1200', NULL, NULL),
(520, 'point', 'invitee', '受邀者获取积分', '1500', NULL, NULL),
(521, 'mail', 'host', '邮箱地址', 'smtp.qq.com', NULL, NULL),
(522, 'mail', 'port', '邮箱端口', '465', NULL, NULL),
(523, 'mail', 'user_name', '邮箱用户名', 'service@kuaijinpay.com', NULL, NULL),
(524, 'mail', 'password', '邮箱密码或授权码', 'afkfbbwgpykubhce', NULL, NULL),
(525, 'mail', 'nick_name', '显示名称', 'chatgpt-web-plus', NULL, NULL),
(526, 'mail', 'test_email', '测试收件人地址', '245629560@qq.com', NULL, NULL),
(527, 'website', 'card_bind_tip', '卡券核销提示语', '购买卡密后请在下面进行核销，如遇问题请联系客服QQ：245629560~', NULL, NULL),
(528, 'website', 'no_chat_tip', '没有聊天记录时的提示文案', '你当前还没有提出过问题，欢迎提出你的问题', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `diy_reply`
--

CREATE TABLE `diy_reply` (
  `id` int(11) NOT NULL,
  `keywords` varchar(50) NOT NULL,
  `content` text,
  `is_disable` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `diy_reply`
--

INSERT INTO `diy_reply` (`id`, `keywords`, `content`, `is_disable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, '你是谁', '我是一个聊天机器人，被用来与用户交互并回答各种问题。我使用自然语言处理技术来理解用户的问题，并尽可能准确和有用地回答它们。我可以讨论各种主题，包括科学、历史、文化、娱乐等等。', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `key_id` int(11) DEFAULT '0' COMMENT 'key池id',
  `model` varchar(20) DEFAULT NULL COMMENT '所用模型',
  `charge_mode` varchar(10) DEFAULT NULL COMMENT '计费模式',
  `charge_rate` int(11) DEFAULT '0' COMMENT '换算倍数',
  `prompt` varchar(250) DEFAULT NULL COMMENT '提示词',
  `status` varchar(255) DEFAULT NULL COMMENT '当前状态',
  `reason` text COMMENT '出错原因',
  `image_url` text COMMENT '图片URL',
  `total_points` int(11) DEFAULT '0' COMMENT '消耗总积分',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- 表的结构 `inviters`
--

CREATE TABLE `inviters` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL,
  `invitee_id` int(11) DEFAULT '0' COMMENT '被邀请者id',
  `invitee_name` varchar(50) DEFAULT NULL,
  `user_points` int(11) NOT NULL DEFAULT '0' COMMENT '邀请者获得积分',
  `invitee_points` int(11) NOT NULL DEFAULT '0' COMMENT '被邀请者获得积分',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='邀请者表';

--
-- 表的结构 `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `key` varchar(250) NOT NULL COMMENT '密钥内容',
  `model` varchar(50) DEFAULT NULL COMMENT '所属模型',
  `proxy_url` varchar(250) DEFAULT NULL COMMENT '代理地址',
  `status` tinyint(3) NOT NULL DEFAULT '10' COMMENT '状态{10:正常, 20:余额或次数不足, 30:被封禁 40:已过期}',
  `tokens` int(10) UNSIGNED ZEROFILL NOT NULL DEFAULT '0000000000',
  `times` int(11) DEFAULT '0' COMMENT '有效次数',
  `is_plus` tinyint(2) DEFAULT '0' COMMENT '是否是plus{0:否, 1:是}',
  `is_disable` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否禁用 {0:否,1:是}',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `keys`
--

INSERT INTO `keys` (`id`, `key`, `model`, `proxy_url`, `status`, `tokens`, `times`, `is_plus`, `is_disable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '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', 'gpt-3.5-turbo', NULL, 10, 0000000000, 0, 0, 1, '2023-03-23 20:51:32', '2023-03-23 20:51:37', '2023-05-15 13:13:40'),
(2, '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', 'gpt-3.5-turbo', '', 20, 0000000000, 0, 0, 0, NULL, '2023-05-17 16:18:01', NULL),
(8, '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', 'gpt-3.5-turbo', '', 10, 0000323604, 0, 0, 0, '2023-04-12 00:41:33', '2023-05-25 17:08:53', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `driver` varchar(50) NOT NULL COMMENT 'AI驱动',
  `name` varchar(50) DEFAULT NULL COMMENT '模型',
  `alias` varchar(50) DEFAULT NULL,
  `max_tokens` int(11) NOT NULL DEFAULT '0',
  `min_points` int(11) NOT NULL DEFAULT '0',
  `charge_mode` varchar(10) NOT NULL COMMENT '计费模式，times:次数 tokens:流量',
  `charge_rate` int(11) DEFAULT '1' COMMENT '计费比率',
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_disable` tinyint(3) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `models`
--

INSERT INTO `models` (`id`, `driver`, `name`, `alias`, `max_tokens`, `charge_mode`, `charge_rate`, `sort`, `is_disable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'openai', 'gpt-3.5-turbo', 'gpt-3.5-turbo', 4096, 'times', 100, 900, 0, '2023-05-14 19:22:02', '2023-05-22 10:55:46', NULL),
(2, 'openai', 'gpt-4', 'gpt-4', 8192, 'tokens', 6, 800, 0, '2023-05-14 19:23:16', '2023-05-22 14:06:50', NULL),
(3, 'openai', 'gpt-4-0314', 'gpt-4-0314', 8192, 'tokens', 10, 700, 1, '2023-05-19 00:09:45', '2023-05-22 10:03:53', NULL),
(4, 'midjourney', 'midjourney', 'midjourney', 4096, 'times', 500, 100, 0, '2023-05-20 21:50:35', '2023-05-22 10:39:50', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '公告标题',
  `content` text COMMENT '公告内容',
  `is_disable` tinyint(3) DEFAULT '0' COMMENT '使用禁用',
  `expired_at` date DEFAULT NULL COMMENT '失效日期',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公告表';

--
-- 转存表中的数据 `notices`
--

INSERT INTO `notices` (`id`, `title`, `content`, `is_disable`, `expired_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '公告标题', '<p>这里是公告内容</p>', 0, '2023-05-12', '2023-05-12 15:46:50', '2023-05-12 19:58:00', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `type` varchar(10) DEFAULT 'tokens' COMMENT '套餐类型:{times:次数，tokens：流量}',
  `name` varchar(250) DEFAULT NULL COMMENT '套餐名',
  `icon` varchar(250) DEFAULT NULL COMMENT '套餐图标',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `price` decimal(10,2) DEFAULT NULL COMMENT '优惠价',
  `desc` text COMMENT '套餐描述',
  `total_points` int(11) DEFAULT '0' COMMENT '包含总积分',
  `duration` int(11) DEFAULT '0' COMMENT '有效时长，单位天，0代表永久',
  `buy_method` varchar(50) NOT NULL DEFAULT 'jump' COMMENT '购买方式:{online:在线，jump:跳转}',
  `jump_url` varchar(250) NOT NULL DEFAULT '' COMMENT '跳转链接',
  `sort` int(11) DEFAULT '0' COMMENT '排序字段，越大越靠前',
  `is_disable` tinyint(4) DEFAULT '0' COMMENT '是否禁用',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='套餐表';

--
-- 转存表中的数据 `packages`
--

INSERT INTO `packages` (`id`, `type`, `name`, `icon`, `market_price`, `price`, `desc`, `total_points`, `duration`, `buy_method`, `jump_url`, `sort`, `is_disable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'tokens', '日卡', NULL, '6.00', '5.00', '无使用期限', 1000, 1, 'jump', 'http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95', 444, 0, NULL, '2023-03-30 20:17:49', NULL),
(2, 'tokens', '周卡', '', '31.00', '30.00', '不限次数', 8000, 7, 'jump', 'http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95', 555, 0, NULL, '2023-05-12 11:57:26', NULL),
(3, 'tokens', '月卡', NULL, '105.00', '100.00', '不限次数', 31000, 30, 'jump', 'http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95', 777, 0, NULL, '2023-03-30 20:17:40', NULL),
(4, 'tokens', '季卡', '', '152.00', '150.00', '不限时间', 94000, 90, 'jump', 'http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95', 666, 0, NULL, '2023-05-12 11:57:21', NULL),
(5, 'tokens', '年卡', '', '310.00', '300.00', '不限时间', 400000, 360, 'jump', 'http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95', 888, 0, NULL, '2023-05-15 09:59:20', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `package_cards`
--

CREATE TABLE `package_cards` (
  `id` int(11) NOT NULL,
  `card_no` varchar(250) NOT NULL COMMENT '卡密号',
  `package_id` int(11) DEFAULT '0' COMMENT '套餐id',
  `package_name` varchar(50) DEFAULT NULL COMMENT '套餐名',
  `price` decimal(10,2) DEFAULT NULL COMMENT '卡券价格',
  `duration` int(11) DEFAULT '0' COMMENT '有效时长，单位天，0代表永久',
  `total_points` int(11) NOT NULL DEFAULT '0' COMMENT '包含总积分',
  `batch_id` int(11) DEFAULT '0' COMMENT '批次ID',
  `batch_size` int(11) DEFAULT '0' COMMENT '批次导出数量',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述信息',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `binded_at` datetime DEFAULT NULL COMMENT '绑定时间',
  `expired_at` datetime DEFAULT NULL COMMENT '失效时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='卡券表';

--
-- 表的结构 `points`
--

CREATE TABLE `points` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户',
  `from` varchar(10) NOT NULL COMMENT '来源',
  `points` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `desc` varchar(250) DEFAULT NULL COMMENT '描述',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL COMMENT '失效时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='积分表';

--
-- 表的结构 `prompts`
--

CREATE TABLE `prompts` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT '0' COMMENT '分类id',
  `key` varchar(50) NOT NULL COMMENT 'prompt提示词',
  `value` text NOT NULL COMMENT 'prompt内容',
  `desc` varchar(250) DEFAULT NULL COMMENT '描述信息',
  `icon` varchar(250) DEFAULT NULL COMMENT '图标',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT '0' COMMENT '排序数字，越大越靠前',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `prompts`
--

INSERT INTO `prompts` (`id`, `type_id`, `key`, `value`, `desc`, `icon`, `is_disable`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 1, 'Linux 终端', '我想让你充当 Linux 终端。我将输入命令，您将回复终端应显示的内容。我希望您只在一个唯一的代码块内回复终端输出，而不是其他任何内容。不要写解释。除非我指示您这样做，否则不要键入命令。当我需要用英语告诉你一些事情时，我会把文字放在中括号内[就像这样]。', '选择此角色后，输入Linux命令，将回复终端应显示的内容', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230525222547/ed4999d8b62abd9968c2c654b5cb9278.jpg', 0, 1, '2023-05-25 05:56:30', '2023-05-25 18:43:40', NULL),
(4, 1, '英语翻译和改进者', '我希望你能担任英语翻译、拼写校对和修辞改进的角色。我会用任何语言和你交流，你会识别语言，将其翻译并用更为优美和精炼的英语回答我。请将我简单的词汇和句子替换成更为优美和高雅的表达方式，确保意思不变，但使其更具文学性。请仅回答更正和改进的部分，不要写解释。', ' 选择此角色后，输入任何语言，将翻译为英语并改进', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230525223027/2db0945b75db1807817a93063e69cbec.jpg', 0, 2, '2023-05-25 06:29:07', '2023-05-25 18:43:45', NULL),
(5, 1, '英文翻中文', '下面我让你来充当翻译家，你的目标是把任何语言翻译成中文，请翻译时不要带翻译腔，而是要翻译得自然、流畅和地道，使用优美和高雅的表达方式。', ' 选择此角色后，输入英文，将翻译为中文', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230525223823/5e7bcfb9ce3ad8ff53506eb9471a9478.jpg', 0, 3, '2023-05-25 06:36:32', '2023-05-25 18:43:51', NULL),
(6, 1, '英语词典(附中文解释)', '我想让你充当英语词典，对于给出的英文单词，你要给出其中文意思以及英文解释，并且给出一个例句，此外不要有其它反馈。', '选择此角色后，输入英文单词，将给出中文意思以及解释', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230525224333/1357c1aad6cd4cc221027e541090575d.jpg', 0, 4, '2023-05-25 06:42:14', '2023-05-25 18:44:04', NULL),
(7, 1, '前端智能思路助手', '我想让你充当前端开发专家。我将提供一些关于Js、Node等前端代码问题的具体信息，而你的工作就是想出为我解决问题的策略。这可能包括建议代码、代码逻辑思路策略。', '选择此角色后，输入前端代码问题，将回复具体建议以及思路', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230525224956/0e109f0d3a60f708cc45cd181fe3333d.jpg', 0, 5, '2023-05-25 06:44:47', '2023-05-25 18:44:13', NULL),
(8, 1, 'Android开发工程师面试官', '我想让你担任Android开发工程师面试官。我将成为候选人，您将向我询问Android开发工程师职位的面试问题。我希望你只作为面试官回答。不要一次写出所有的问题。我希望你只对我进行采访。问我问题，等待我的回答。不要写解释。像面试官一样一个一个问我，等我回答。', '选择此角色后，将作为面试官，向你提出一些面试问题', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230525225409/53e8b7f74b4e3507265f807ebe1efd42.jpg', 0, 6, '2023-05-25 06:52:51', '2023-05-25 18:44:23', NULL),
(9, 1, 'JavaScript 控制台', '我希望你充当 javascript 控制台。我将键入命令，您将回复 javascript 控制台应显示的内容。我希望您只在一个唯一的代码块内回复终端输出，而不是其他任何内容。不要写解释。除非我指示您这样做。', '选择此角色后，输入javascript命令，将回复控制台应显示内容', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230525225906/3280915d73fc54acb8fa1a740312edc0.jpg', 0, 7, '2023-05-25 06:58:48', '2023-05-25 18:45:05', NULL),
(11, 1, '旅游指南', '我想让你做一个旅游指南。我会把我的位置写给你，你会推荐一个靠近我的位置的地方。在某些情况下，我还会告诉您我将访问的地方类型。您还会向我推荐靠近我的第一个位置的类似类型的地方。', '选择此角色后，输入具体位置，将推荐附近的位置以及类似类型的地方', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230526101205/db4cbd4a158529f367176576ad426e08.jpg', 0, 8, '2023-05-25 18:12:35', '2023-05-25 18:45:14', NULL),
(12, 1, '剽窃检查员', '我想让你充当剽窃检查员。我会给你写句子，你只会用给定句子的语言在抄袭检查中未被发现的情况下回复，别无其他。不要在回复上写解释。', '选择此角色后，输入句子，将检查内容是否存在抄袭情况', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230526104751/19856fd094cd3036e8e950b6dd5d36b3.jpg', 0, 9, '2023-05-25 18:43:33', '2023-05-25 18:43:33', NULL),
(13, 1, '广告策划', '我想让你充当广告商。您将创建一个活动来推广您选择的产品或服务。您将选择目标受众，制定关键信息和口号，选择宣传媒体渠道，并决定实现目标所需的任何其他活动。', '选择此角色后，输入请求，将为其创建一个广告活动', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230526105311/6f1ce156ece4ddd294451be21a1f1203.jpg', 0, 10, '2023-05-25 18:51:38', '2023-05-25 18:51:38', NULL),
(14, 1, '故事讲述人', '我想让你扮演讲故事的角色。您将想出引人入胜、富有想象力和吸引观众的有趣故事。它可以是童话故事、教育故事或任何其他类型的故事，有可能吸引人们的注意力和想象力。根据目标受众，您可以为讲故事环节选择特定的主题或主题，例如，如果是儿童，则可以谈论动物；如果是成年人，那么基于历史的故事可能会更好地吸引他们等等。', '选择此角色后，将作为一个讲故事的角色，讲述有趣的故事', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230526105734/f13bdff37f0669c5758178c913a1748d.jpg', 0, 11, '2023-05-25 18:56:42', '2023-05-25 18:56:42', NULL),
(15, 1, 'PHP 解释器', '我希望你表现得像一个 php 解释器。我会把代码写给你，你会用 php 解释器的输出来响应。我希望您只在一个唯一的代码块内回复终端输出，而不是其他任何内容。不要写解释。除非我指示您这样做，否则不要键入命令。当我需要用英语告诉你一些事情时，我会把文字放在大括号内{like this}。', '选择此角色后，将作为PHP解释器输出代码响应', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230526110421/58a34e9ae3fe1e22ab1c249e9722d02c.jpg', 0, 12, '2023-05-25 19:03:07', '2023-05-25 19:03:07', NULL),
(16, 1, '创意生成器', '根据人们的意愿产生数字创业点子。例如，当我说“我希望在我的小镇上有一个大型购物中心”时，你会为数字创业公司生成一个商业计划，其中包含创意名称、简短的一行、目标用户角色、要解决的用户痛点、主要价值主张、销售和营销渠道、收入流来源、成本结构、关键活动、关键资源、关键合作伙伴、想法验证步骤、估计的第一年运营成本以及要寻找的潜在业务挑战。将结果写在降价表中。', '选择此角色后，将根据你输入的意愿生成创意点子以及计划等', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230526111111/b3df4a36ecd533a67212cd4cd6c77754.jpg', 0, 13, '2023-05-25 19:07:47', '2023-05-25 19:07:47', NULL),
(17, 1, 'IT 专家', '我希望你充当 IT 专家。我会向您提供有关我的技术问题所需的所有信息，而您的职责是解决我的问题。你应该使用你的计算机科学、网络基础设施和 IT 安全知识来解决我的问题。在您的回答中使用适合所有级别的人的智能、简单和易于理解的语言将很有帮助。用要点逐步解释您的解决方案很有帮助。尽量避免过多的技术细节，但在必要时使用它们。我希望您回复解决方案，而不是写任何解释。', '选择此角色后，输入有关电脑的问题，将给出解决方案', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230526111557/3c28d5a696ba5f8dcdd70333fe3dd31a.jpg', 0, 14, '2023-05-25 19:14:01', '2023-05-25 19:14:01', NULL),
(18, 1, '时间旅行指南', '我要你做我的时间旅行向导。我会为您提供我想参观的历史时期或未来时间，您会建议最好的事件、景点或体验的人。不要写解释，只需提供建议和任何必要的信息。', '选择此角色后，输入想参观的历史时期或未来时间，将给出建议景点以及事件等', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230526112042/43b8cb35cba20a19331fed5313408cb4.jpg', 0, 15, '2023-05-25 19:18:43', '2023-05-25 19:18:43', NULL),
(19, 1, '人才教练', '我想让你担任面试的人才教练。我会给你一个职位，你会建议在与该职位相关的课程中应该出现什么，以及候选人应该能够回答的一些问题。', '选择此角色，输入职位，将建议与该职位相关的课程以及问题', 'https://wxalbum-10001658.image.myqcloud.com//wxalbum/70892/20230526122529/f9c3e5e7b9a9e573068c6b20ce1c8d91.jpg', 0, 16, '2023-05-25 20:24:24', '2023-05-25 20:24:24', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `prompt_types`
--

CREATE TABLE `prompt_types` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '场景名',
  `desc` varchar(250) DEFAULT NULL COMMENT '场景描述',
  `icon` varchar(250) DEFAULT NULL COMMENT '场景图标',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否禁用',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='prompt场景表';

--
-- 转存表中的数据 `prompt_types`
--

INSERT INTO `prompt_types` (`id`, `title`, `desc`, `icon`, `sort`, `is_disable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '通用', '这里是描述信息', '', 999, 0, '2023-05-12 10:46:55', '2023-05-14 10:39:04', NULL),
(2, '客服', '这里是描述信息', '', 777, 0, '2023-05-13 10:47:00', '2023-05-14 10:39:18', NULL),
(3, '工作', '这里是描述信息', '', 888, 0, '2023-05-12 10:47:04', '2023-05-14 10:39:12', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sn` varchar(100) DEFAULT NULL COMMENT '用户编号',
  `account` varchar(50) DEFAULT NULL COMMENT '用户账号',
  `name` varchar(255) NOT NULL COMMENT '用户昵称',
  `avatar` varchar(250) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `device` tinyint(4) DEFAULT '0' COMMENT '注册设备: [10:微信小程序 20:微信公众号 30:手机H5 40:电脑PC 50:苹果APP 60:安卓APP]',
  `invite_code` varchar(50) DEFAULT NULL COMMENT '邀请码',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否禁用: [0=否, 1=是]',
  `level` int(3) NOT NULL DEFAULT '10' COMMENT '会员等级，备用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- 转储表的索引
--

--
-- 表的索引 `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_index` (`account`),
  ADD KEY `root_index` (`root`);

--
-- 表的索引 `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chats_user_id_index` (`user_id`),
  ADD KEY `chats_key_id_index` (`key_id`),
  ADD KEY `chats_model_index` (`model`),
  ADD KEY `chats_prompt_index` (`prompt`(191)),
  ADD KEY `chats_total_tokens_index` (`total_tokens`);

--
-- 表的索引 `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `chat_titles`
--
ALTER TABLE `chat_titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_titles_message_id_index` (`message_id`(191)),
  ADD KEY `chat_titles_user_id_index` (`user_id`);

--
-- 表的索引 `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_index` (`type`),
  ADD KEY `name_index` (`name`),
  ADD KEY `type_name_index` (`type`,`name`);

--
-- 表的索引 `diy_reply`
--
ALTER TABLE `diy_reply`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `diy_reply_keywords_uindex` (`keywords`);

--
-- 表的索引 `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `inviters`
--
ALTER TABLE `inviters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inviters_id_uindex` (`id`),
  ADD UNIQUE KEY `inviters_invitee_id_uindex` (`invitee_id`),
  ADD KEY `inviters_user_id_index` (`user_id`);

--
-- 表的索引 `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keys_id_uindex` (`id`),
  ADD KEY `type_index` (`is_plus`),
  ADD KEY `keys_status_index` (`status`),
  ADD KEY `keys_is_disable_index` (`is_disable`),
  ADD KEY `keys_model_index` (`model`);

--
-- 表的索引 `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `package_models_id_uindex` (`id`),
  ADD KEY `models_deleted_at_index` (`deleted_at`),
  ADD KEY `models_driver_index` (`driver`),
  ADD KEY `models_name_index` (`name`),
  ADD KEY `models_charge_mode_index` (`charge_mode`);

--
-- 表的索引 `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `notices_id_uindex` (`id`),
  ADD KEY `notices_deleted_at_index` (`deleted_at`),
  ADD KEY `notices_is_disable_index` (`is_disable`);

--
-- 表的索引 `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `packages_id_uindex` (`id`),
  ADD KEY `packages_is_disable_index` (`is_disable`),
  ADD KEY `packages_type_index` (`type`);

--
-- 表的索引 `package_cards`
--
ALTER TABLE `package_cards`
  ADD UNIQUE KEY `package_cards_id_uindex` (`id`),
  ADD KEY `cards_card_no_index` (`card_no`(191)),
  ADD KEY `cards_package_id_index` (`package_id`),
  ADD KEY `package_cards_deleted_at_index` (`deleted_at`),
  ADD KEY `package_cards_user_id_index` (`user_id`);

--
-- 表的索引 `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `points_id_uindex` (`id`),
  ADD KEY `points_from_index` (`from`),
  ADD KEY `points_points_index` (`points`),
  ADD KEY `points_user_id_index` (`user_id`);

--
-- 表的索引 `prompt_types`
--
ALTER TABLE `prompt_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prompt_scenes_is_disable_index` (`is_disable`),
  ADD KEY `prompt_scenes_title_index` (`title`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id_uindex` (`id`),
  ADD UNIQUE KEY `users_sn_uindex` (`sn`),
  ADD KEY `users_device_index` (`device`),
  ADD KEY `users_is_disable_index` (`is_disable`),
  ADD KEY `users_level_index` (`level`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_mobile_index` (`mobile`),
  ADD KEY `users_deleted_at_index` (`deleted_at`),
  ADD KEY `users_name_index` (`name`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- 使用表AUTO_INCREMENT `chat_sessions`
--
ALTER TABLE `chat_sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- 使用表AUTO_INCREMENT `chat_titles`
--
ALTER TABLE `chat_titles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=529;

--
-- 使用表AUTO_INCREMENT `diy_reply`
--
ALTER TABLE `diy_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `inviters`
--
ALTER TABLE `inviters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `package_cards`
--
ALTER TABLE `package_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- 使用表AUTO_INCREMENT `prompt_types`
--
ALTER TABLE `prompt_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
