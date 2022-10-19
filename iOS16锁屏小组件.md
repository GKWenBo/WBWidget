## iOS16锁屏小组件

### 依赖环境

- 硬件设备

  > iPhone
  >
  > Apple Watch

- 最低支持系统版本

  > iOS16+
  >
  > WatchOS9+

### iPhone支持样式

> - accessoryCircular
> - accessoryRectangular
> - accessoryInline

锁屏界面展示，有添加数量限制，accessoryRectangular一屏最多展示2个，accessoryInline一屏最多展示1个，accessoryCircular一屏最多展示4个。


### 小组件支持渲染模式

- **fullColor**：全色

  > 开发者设置的任意颜色

- #### **accented**：强调色

  > 设置成强调色后会根据用户的设置，渲染成用户选择的颜色

- **vibrant**：半透明效果

  > 忽略开发者设置的颜色，渲染成半透明效果

**目前锁屏小组件只支持半透明效果渲染模式。**

### 小组件数据来源

- 宿主app同步数据到小组件
- 支持发送网络请求获取数据

### 参考资料

[人机交互指南](https://developer.apple.com/design/human-interface-guidelines/components/system-experiences/complications)

[Creating Activity Rings in SwiftUI](https://medium.com/@frankjia/creating-activity-rings-in-swiftui-11ef7d336676)

[iOS16锁屏小组件：Creating Lock Screen Widgets and Watch Complications](https://www.jianshu.com/p/6b77f3fcea0a)

[【iOS16】锁屏小组件总结](https://blog.csdn.net/dolacmeng/article/details/125720420)