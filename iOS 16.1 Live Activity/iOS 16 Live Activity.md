## iOS 16.1 Live Activity

### 官方资料

> - [live-activities](https://developer.apple.com/design/human-interface-guidelines/components/system-experiences/live-activities)
> - [activitykit](https://developer.apple.com/documentation/activitykit)

### 工程配置

- info.plist添加NSSupportsLiveActivities=YES
- 创建widget extension

### 数据更新

- 远程推送通知
- ActivityKit

### 实时活动限制

- 最多保持12小时（8+4）
- 不能发起网络请求
- 不能接收位置更新
- 数据更新不能超过4k

### 相关博客

[iOS 16 Live Activity](https://mp.weixin.qq.com/s/aKD-WBYHsepg96zOC378cg)

[iOS灵动岛开发实践](https://juejin.cn/post/7153236337074634788)

