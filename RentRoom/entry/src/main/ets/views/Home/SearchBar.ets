import { PADDING, PADDING_S } from '../../constant/size'
import rvp from '../../utils/responsive';
import { router } from '@kit.ArkUI';

@Component
export default struct SearchBar {
  @Prop fontColor: string;

  build() {
    Row({ space: rvp(16) }) {
      Text('北京').fontSize(rvp(14)).fontColor(this.fontColor)

      Stack() {
        TextInput().width('100%').height('100%').backgroundColor($r('app.color.white')).border({
          width: 1,
          color: $r('app.color.gray')
        })
        Row() {
          Image($r('app.media.search')).width(rvp(18)).height(rvp(18))
          Text('公司/地铁/小区，马上搜索')
            .fontSize(rvp(10))
            .fontColor($r('app.color.gray'))
            .layoutWeight(1)
            .margin({ left: PADDING_S, right: PADDING_S })
          Column() {
          }.width(rvp(1)).height(rvp(18)).backgroundColor($r('app.color.line_color')).margin({ right: PADDING })

          Image($r('app.media.position')).width(rvp(18)).height(rvp(18))
        }.width('100%').padding({ left: rvp(PADDING), right: rvp(PADDING) })
      }.width(rvp(244)).onClick(() => {
        router.pushUrl({
          url: 'pages/RentRoom/RentRoomList'
        })
      })

      Image($r('app.media.message')).width(rvp(24)).height(rvp(24)).fillColor(this.fontColor)
    }
    .width('100%')
    .height(rvp(38))
    .padding({
      left: rvp(PADDING),
      right: rvp(PADDING),
      top: rvp(4),
      bottom: rvp(4)
    })
  }
}