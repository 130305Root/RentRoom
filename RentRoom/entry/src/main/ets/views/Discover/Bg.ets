import rvp from '../../utils/responsive'

@Component
export default struct Bg {
  @StorageProp('topHeight') topHeight: number = 0

  build() {

    Image($r('app.media.discover_bg'))
      .width('100%')
      .height(rvp(322 - 36) + this.topHeight)
      .objectFit(ImageFit.Fill)
  }
}