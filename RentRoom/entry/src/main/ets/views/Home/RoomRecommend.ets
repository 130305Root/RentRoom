import { getRoomRecommendApi } from '../../api/home'
import { BORDER_RADIUS, PADDING, PADDING_S } from '../../constant/size'
import { IRoomRecommendItem, ITagItem, RoomRecommendDataSource } from '../../model/HomeData'
import rvp from '../../utils/responsive'
import { router } from '@kit.ArkUI'


@Component
export default struct RomeRecommend {
  @State roomRecommendList: RoomRecommendDataSource = new RoomRecommendDataSource()
  // 获取房源推荐列表
  getRoomRecommendList = async () => {
    this.roomRecommendList.setList(await getRoomRecommendApi())
    // console.log(JSON.stringify(this.roomRecommendList))

  }

  // 生命周期函数：初始化渲染时触发
  aboutToAppear(): void {
    this.getRoomRecommendList()
  }

  build() {
    Column() {
      Row() {
        Text() {
          Span('周边房源')
          Span('推荐').fontColor($r('app.color.primary'))
        }.fontSize(rvp(16)).fontWeight(rvp(700)).fontColor($r('app.color.black'))

        Row({ space: 6 }) {
          Text('更多推荐').fontSize(rvp(10)).fontColor($r('app.color.gray_second'))
          Image($r('app.media.arrow_right')).width(rvp(4)).height(rvp(8))
        }.onClick(() => {
          router.pushUrl({
            url: 'pages/RentRoom/RentRoomList'
          })
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: rvp(PADDING), right: rvp(PADDING), bottom: rvp(PADDING_S) })
      .backgroundColor($r('app.color.white'))

      Grid() {
        LazyForEach(this.roomRecommendList, (room: IRoomRecommendItem) => {
          GridItem() {
            Column() {
              Stack() {
                Image(room.housePicture).width('100%').height('100%').objectFit(ImageFit.Fill).borderRadius({
                  topLeft: rvp(BORDER_RADIUS), topRight: rvp(BORDER_RADIUS)
                })
                Image($r('app.media.room_text_bg')).width('100%').height('100%').objectFit(ImageFit.Fill).borderRadius({
                  topLeft: rvp(BORDER_RADIUS), topRight: rvp(BORDER_RADIUS)
                })
                Row({ space: rvp(6) }) {
                  Image($r('app.media.location'))
                    .width(rvp(12))
                    .height(rvp(14))
                    .objectFit(ImageFit.Fill)
                    .fillColor($r('app.color.white'))
                  Text(room.address).fontSize(rvp(10)).fontColor($r('app.color.white'))
                }.margin({ left: rvp(8), bottom: rvp(6) })
              }.width('100%').height(rvp(120)).alignContent(Alignment.BottomStart)

              Column() {
                Row() {
                  Text() {
                    Span(room.rentPriceListing).fontSize(rvp(14))
                    Span(room.rentPriceUnit).fontSize(rvp(12))
                  }.fontSize(rvp(14)).fontColor($r('app.color.red_text'))

                  Text(room.rentArea + '㎡').fontSize(rvp(10)).fontColor($r('app.color.gray'))
                }.width('100%').justifyContent(FlexAlign.SpaceBetween).height(rvp(22))

                Text(room.houseTitle)
                  .fontSize(rvp(12))
                  .fontColor($r('app.color.black'))
                  .width('100%')
                  .maxLines(1)
                  .margin({ top: rvp(2) })
                  .textOverflow({
                    overflow: TextOverflow.Ellipsis,
                  })
                Row({ space: rvp(6) }) {
                  ForEach(room.tags.slice(0, 2), (tag: ITagItem, index) => {
                    Text(tag.name)
                      .fontSize(rvp(10))
                      .fontColor(index === 1 ? $r('app.color.gray_text') : $r('app.color.white'))
                      .backgroundColor(index === 1 ? $r('app.color.bg_gray') : $r('app.color.primary'))
                      .height(rvp(16))
                      .padding({ left: rvp(6), right: rvp(6) })
                      .borderRadius(rvp(2))
                  }, (tag: ITagItem) => tag.name)
                }.width('100%').margin({ top: rvp(10) })

              }.width('100%').padding(rvp(PADDING_S))
            }.width(rvp(160)).height(rvp(210)).borderRadius(rvp(BORDER_RADIUS)).backgroundColor($r('app.color.white'))
          }
        }, (room: IRoomRecommendItem) => room.id + '')
      }
      .width('100%')
      .height(rvp(210 * 4 + 16 * 2 + 8 * 3))
      .backgroundColor($r('app.color.bg_gray'))
      .columnsTemplate('1fr 1fr')
      .columnsGap(rvp(8))
      .rowsGap(rvp(8))
      .padding(rvp(PADDING))
    }
    .width('100%')
    .margin({ top: rvp(32) })
  }
}