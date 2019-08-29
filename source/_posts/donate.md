---
title: 2019最新版next主题设置捐赠
tags: next主题配置
categories: next主题配置
copyright: true
date: 2019-05-31 16:33:00
---

# 2019最新版next主题设置捐赠方法

------

>&emsp;&emsp;next主题自带打赏功能，之前找了很多网上的例子都没找到出不来的原因.我们需要在next的主题配置文件中找到如下关键词代码 `reward_settings` `reward`，以下是我的设置。

<!--more-->
```python

# Reward (Donate)
reward_settings:
  # If true, reward would be displayed in every article by default.
  # You can show or hide reward in a specific article throuth `reward: true | false` in Front-matter.
  enable: true
  animation: false
  comment: '原创技术分享，您的支持将鼓励我继续创作'

reward:
#  enable: true
#  comment: '原创技术分享，您的支持将鼓励我继续创作'
  wechatpay: /images/donate/wechatpay.png
  alipay: /images/donate/alipay.png
#  bitcoin: /images/bitcoin.png

```
