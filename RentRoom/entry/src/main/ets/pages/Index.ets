import Home from "./Home"
import See from "./See"
import Service from "./Service"
import My from "./My"
import Discover from './Discover'
import rvp from '../utils/responsive'
import { window } from '@kit.ArkUI'


@Entry
@Component
struct Index {
  @State currentTabBarIndex: number = 0;

  @Builder
  tabBarBuilder(image: Resource, activeImage: Resource, text: string, index: number) {
    Column() {
      Image(this.currentTabBarIndex === index ? activeImage : image).width(rvp(28)).height(rvp(28))
      Text(text)
        .fontSize(rvp(10))
        .fontColor(this.currentTabBarIndex === index ? $r('app.color.black') : $r('app.color.gray_text'))
    }
  }

  setNavBarColor = async (color: string) => {
    const windowClass = await window.getLastWindow(getContext(this))
    windowClass?.setWindowSystemBarProperties({
      statusBarContentColor: color
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentTabBarIndex }) {
      TabContent() {
        Home()
      }.tabBar(this.tabBarBuilder($r('app.media.tabbar_home'), $r('app.media.tabbar_home_active'), '首页', 0))

      TabContent() {
        See()
      }.tabBar(this.tabBarBuilder($r('app.media.tabbar_see'), $r('app.media.tabbar_see_active'), '想看', 1))

      TabContent() {
        Service()
      }.tabBar(this.tabBarBuilder($r('app.media.tabbar_service'), $r('app.media.tabbar_service_active'), '服务', 2))

      TabContent() {
        Discover()
      }.tabBar(this.tabBarBuilder($r('app.media.tabbar_discover'), $r('app.media.tabbar_discover_active'), '发现', 3))

      TabContent() {
        My()
      }.tabBar(this.tabBarBuilder($r('app.media.tabbar_my'), $r('app.media.tabbar_my_active'), '我的', 4))
    }
    .barHeight(rvp(50))
    .scrollable(false)
    .onChange((index: number) => {
      this.currentTabBarIndex = index;

      if (index === 1) {
        this.setNavBarColor('#000000')
      }else {
        this.setNavBarColor('#FFFFFF')
      }
    })
  }
}