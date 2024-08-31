import { ITileItem, ITileList } from '../../model/HomeData';
import rvp from '../../utils/responsive';

@Component
export default struct TileList {
  @Prop tileList: ITileList

  build() {
    Row({ space: rvp(12) }) {
      ForEach(this.tileList, (tile: ITileItem) => {
        Column({ space:rvp(8) }) {
          Image(tile.imageURL).width('100%').height(rvp(58)).objectFit(ImageFit.Fill)
          Row({ space: rvp(5) }) {
            Text(tile.title).fontSize(rvp(12)).fontColor($r('app.color.black'))
            Text(tile.sub_title).fontSize(rvp(10)).fontColor($r('app.color.gray'))
          }.width('100%').justifyContent(FlexAlign.Start)
        }.width(rvp(148))
      }, (tile: ITileItem) => tile.id + '')
    }
    .width('100%')
    .margin({ top: rvp(12) })
  }
}