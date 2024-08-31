import { PADDING } from '../../constant/size'
import rvp from '../../utils/responsive'

@Component
export default struct FindRoom {
  build() {
    Column() {
      Image($r('app.media.find_room')).width(rvp(60)).height(rvp(23))
      Text('发现你想看的房子').margin({ left: rvp(4), top: rvp(20) }).fontSize(rvp(12)).fontColor($r('app.color.black'))
      Image($r('app.media.blank')).width(rvp(234)).height(rvp(221)).alignSelf(ItemAlign.Center).margin({ top: rvp(7) })
      Text('暂无想看的房源，试试如下找房方式')
        .width('100%')
        .textAlign(TextAlign.Center)
        .margin({ left: rvp(4), top: rvp(20) })
        .fontSize(rvp(12))
        .fontColor($r('app.color.black'))
      Image($r('app.media.see_room'))
        .width(rvp(328))
        .height(rvp(80))
        .alignSelf(ItemAlign.Center)
        .margin({ top: rvp(20) })
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({
      top: rvp(54),
      left: rvp(PADDING),
      right: rvp(PADDING)
    })
  }
}