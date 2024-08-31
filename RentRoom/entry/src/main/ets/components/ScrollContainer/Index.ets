import { IColor } from '../../model/HomeData';
import { WindowManager } from '@kit.SpeechKit';
import { window } from '@kit.ArkUI';

@Component
export default struct Index {
  @StorageProp('topHeight') topHeight: number = 0
  windowClass?: window.Window
  getWindowClass = async () => {
    this.windowClass = await window.getLastWindow(getContext(this))
  }

  aboutToAppear(): void {
    this.getWindowClass()
  }

  @Builder
  customBuilder() {
  }

  @BuilderParam navBuildParam: ($$: IColor) => void = this.customBuilder
  @BuilderParam contentBuildParam: () => void = this.customBuilder
  // 存储滚动条的位置（y轴滚动距离）
  scrollY: number = 0;
  // 处理滚动事件
  handleScroll = (xOffset: number, yOffset: number) => {
    // 更新滚动距离
    this.scrollY += yOffset
    // 计算颜色
    this.calColor()
  }
  @State bgColor: string = 'rgba(0,0,0,0)'
  @State fontColor: string = 'rgb(255,255,255)'
  calColor = () => {

    if (this.scrollY < 10) {
      // 到达顶部，开始渐变
      this.bgColor = 'rgba(255,255,255,0)'
      this.fontColor = 'rgb(255,255,255)'
      this.windowClass?.setWindowSystemBarProperties({
        statusBarContentColor:'#FFFFFF'
      })
    } else if (this.scrollY <= 100) {
      // 渐变中（透明度 0 -> 1）
      const colorOpacity = (this.scrollY - 10) / (100 - 10)
      this.bgColor = `rgba(255,255,255,${colorOpacity})`
      this.fontColor = `rgba(0,0,0,${colorOpacity})`
    } else {
      //渐变全部完成
      this.bgColor = 'rgb(255,255,255)'
      this.fontColor = 'rgb(0,0,0)'
      this.windowClass?.setWindowSystemBarProperties({
        statusBarContentColor:'#000000'
      })
    }
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          this.contentBuildParam()
        }
        .width('100%')

      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .onDidScroll(this.handleScroll)

      // 搜索栏
      Column() {
        this.navBuildParam({ fontColor: this.fontColor })
      }.backgroundColor(this.bgColor).padding({ top: this.topHeight })
    }
    .width('100%').alignContent(Alignment.TopStart)
  }
}