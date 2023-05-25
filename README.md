# ChatGPT Web Plus 体验版

> 提示：此版本是编译后的非开源版本，可以正常部署体验，部署不成功认真看 `readme.md` 文档或者加QQ群 `145225165` 找管理员协助部署
## 系统截图

客户端
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/f001.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/f002.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/f003.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/f004.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/f005.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/f006.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/f007.png)

![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/f008.png)

管理端
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a001.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a002.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a003.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a004.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a005.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a006.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a007.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a008.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a009.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a010.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a011.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a012.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a014.png)
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230516/a015.png)



为了方便大家沟通交流，同步消息，建了QQ群，群号 `145225165`，申请入群后请及时回复验证码，否则360秒后会被群机器人自动移除群。

![image](https://user-images.githubusercontent.com/13517412/230753075-0d815446-3e24-4a09-bee4-e3fa59dec76e.png)
<img width="679" alt="image" src="https://user-images.githubusercontent.com/13517412/230753144-0c5ea0ee-55a6-4d5d-8282-53fcbc9355c7.png">

## 功能列表
[✓] 部署简单，只需要运行服务端文件，不依赖于任何语言环境

[✓] 支持最新模型 `GPT4.0` 以及后续推出的最新模型

[✓] 支持 `Midjourney` 绘图

[✓] 支持多 `key` 轮询池，一个 `key` 被封或者流量耗尽自动切换下一个有效的 `key`，支持模型绑定

[✓] 支持上下文对话

[✓] 精确统计每次对话消耗的实际 `tokens`

[✓] 支持百度敏感词过滤

[✓] 支持自定义回复内容，比如提问当前使用 `GPT` 版本，可以自定义回复内容为 4.0 版本

[✓] 支持角色（`prompt` 提示词）和角色分类

[✓] 卡密支持次卡和流量卡(tokens卡) 两种付费模式，支持自定义卡密有效期

[✓] 支持邀请注册获取免费次数，后台可以分别指定邀请者和被邀请者赠送的积分

[✓] 支持卡密批量生成和导出 `txt` 格式

[✓] 管理后台可以配置会员注册时是否需要强制邮箱或者手机号实名验证

[✓] 管理后台可以配置套餐购买时跳转到第三方发卡平台或者是在线支付

[✗] 支持不同会员等级走不同 `key` 通道，如 `VIP`  会员走专属 `gpt4.0` 通道，普通付费会员走普通 `key` 通道

[✗] 支持多支付渠道，如微信、支付宝

[✗] 支持第三方登录，如QQ、微信扫码登录、关注公众号获取登录验证码

[✗] 公告管理，可以在管理后台配置是否开启公告以及公告是否可以关闭

[✗] 实现联网搜索

[✗] 支持分销

[✗] 支持代理商

## 手动部署
> 服务器无需安装任何环境，只需要安装 nginx 来配置域名，nginx 修改配置后需要重启才能生效

将源码上传到服务器，服务器放行 `3000` 端口，将数据库文件 `db.sql` 导入到 `mysql`，修改网站根目录下 `.env` 里数据库配置信息、百度文本审核配置信息，其他配置信息无需改动

根据自己的系统选择对应的服务端，下面以 `linux` 环境为例，
进入根目录，运行 `nohup ./amd64.linux>gpt.log &` 启动后端服务
运行 `curl http://127.0.0.1:3000/ping`，如果出现
```shell
恭喜您服务端启动成功~
```
说明后端服务启动成功

将服务端绑定域名，如 `chat.baidu.com`，`nginx` 主要配置如下：
```shell
listen 80;
server_name chat.baidu.com;
index index.html index.htm default.htm default.html;
root /www/wwwroot/chagpt-plus/amd64.linux;
    
location / {
    proxy_pass http://127.0.0.1:3000;
    proxy_set_header Host 127.0.0.1:$server_port;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header REMOTE-HOST $remote_addr;
    add_header X-Cache $upstream_cache_status;
    proxy_set_header X-Host $host:$server_port;
    proxy_set_header X-Scheme $scheme;
    proxy_connect_timeout 3600s;
    proxy_read_timeout 86400s;
    proxy_send_timeout 3600s;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
}

```
前台：`chat.baidu.com`
后台：`chat.baidu.com/admin`  默认账号/密码 admin/123456

## 宝塔部署
- 上传源码

  点击宝塔左侧 `文件` 菜单，将源码上传到 `www/wwwroot` 目录，如下图
  ![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230515/image.png)

- 导入数据库

  点击宝塔左侧 `数据库` 菜单，点击添加数据库，填写数据库信息，并记下数据库密码，如下图
  ![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230515/0001.png)
  点击提交后找到新添加的数据库，点击 `导入` 按钮弹出上传框，点击从本地上传，选择 `db.sql` 文件进行上传
  ![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230515/0002.png)

  ![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230515/0003.png)

- 修改配置信息

  在根目录下找到 `env` 配置文件，修改里面的数据库配置信息、百度文本审核配置信息
  ![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230515/0004.png)

- 启动服务端

  点击宝塔左侧 `网站` 菜单，选择 `go项目`，添加 `go项目`，选择要运行的二进制文件，选择开机启动和域名，如下图
  ![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230515/0005.png)
  ![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230515/0006.png)
  点击网站右侧`设置`按钮，选择右侧 `配置文件` 修改配置
```
location / {
    proxy_pass http://127.0.0.1:3000;
    proxy_set_header Host 127.0.0.1:$server_port;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header REMOTE-HOST $remote_addr;
    add_header X-Cache $upstream_cache_status;
    proxy_set_header X-Host $host:$server_port;
    proxy_set_header X-Scheme $scheme;
    proxy_connect_timeout 3600s;
    proxy_read_timeout 86400s;
    proxy_send_timeout 3600s;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_cache off;
    proxy_buffering off;
}
    
```
![](https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230515/0009.png)

前台：`chat.baidu.com`
后台：`chat.baidu.com/admin`  默认账号/密码 admin/123456

## 关联链接
openai独享账号推荐购买渠道：https://tomfk.top/buy/14 、 https://tomfk.top/buy/26

海外稳定服务器推荐购买渠道：https://cloud.juxw.com/?aff=1651c

自建代理开源项目：https://github.com/easychen/openai-api-proxy/

百度敏感词过滤接口申请：https://console.bce.baidu.com/ai/?fromai=1#/ai/antiporn/overview/resource/getFree

## 更新日志
### v2.0.1
- [fix]修复前台选择 `gpt4` 模型时无法记录对话内容以及没有扣除积分的 bug
- [fix]修复个人中心邀请积分不展示的 bug
- [fix]修复在管理后台删除角色后前端依然显示的 bug
- [fix]修复管理后台部分搜索项搜索无效的 bug
- [add]前台个人中心积分列表获取途径返回中文
- [add]管理后台模型新增 `maxTokens` 输入项
- [add]管理后台用户列表新增`添加用户`按钮
- [add]管理后台用户列表新增修改`用户昵称`、`用户状态`和`重置密码`功能
- [add]管理后台用户列表新增`剩余积分`字段，点击积分可以对该用户的积分进行充值或者扣减
- [add]管理后台卡券和积分列表新增`失效时间`字段
- [add]管理后台角色全部禁用时前台输入框左侧不显示角色选择图标
- [add]管理后台套餐购买方式新增 `线下购买` 选项(第三方发卡网站、线上购买、线下购买)
- [add]管理后台新增 `邮箱配置` 功能
- [add]管理后台新增 `阿里云存储配置` 功能
- [add]管理后台新增 `卡券批量导出` 功能
- [add]新增 `Midjourney` 绘图功能

## 鸣谢
[chatgpt-web 原项目](https://github.com/Chanzhaoyu/chatgpt-web)
