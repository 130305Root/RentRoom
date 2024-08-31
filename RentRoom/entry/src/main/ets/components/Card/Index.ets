import { BORDER_RADIUS } from '../../constant/size'
import rvp from '../../utils/responsive'

@Component
export default struct Index {
  @Prop cardPadding: number = 8;
  @BuilderParam render: () => void

  build() {
    Column() {
      this.render()
    }
    .padding(this.cardPadding)
    .backgroundColor($r('app.color.white'))
    .borderRadius(rvp(BORDER_RADIUS))
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}