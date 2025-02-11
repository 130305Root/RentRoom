import { getServiceDataApi } from '../../api/home';
import Card from '../../components/Card/Index'
import { IHomeServiceItem, IHomeServiceList } from '../../model/ServiceData';
import rvp from '../../utils/responsive'

@Component
export default struct DomesticService {
  @State homeServiceList: IHomeServiceList = [];
  aboutToAppear() {
    this.getServiceData()
  }
  async getServiceData() {
    const serviceData = await getServiceDataApi();
    this.homeServiceList = serviceData.homeServiceList;
  }

  // 家庭服务插槽
  @Builder
  renderBuilder() {
    Row() {
      Text('家庭服务').fontSize(rvp(16)).fontWeight(700)
      Row({ space: rvp(10) }) {
        Text('全部服务').fontSize(rvp(12)).fontColor($r('app.color.gray'))
        Image($r('app.media.arrow_right')).width(rvp(4))
      }
    }.justifyContent(FlexAlign.SpaceBetween).width('100%')

    Grid() {
      ForEach(this.homeServiceList, (nav: IHomeServiceItem) => {
        GridItem() {
          Column({ space: rvp(10) }) {
            Image(nav.icon).width(rvp(24)).height(rvp(24)).objectFit(ImageFit.Fill)
            Text(nav.title).fontSize(rvp(12))
          }
        }.width(rvp(60))
      }, (nav: IHomeServiceItem) => nav.title)
    }
    .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr')
    .rowsGap(rvp(22))
    .columnsGap(rvp(18))
    .margin({ top: rvp(20), bottom: rvp(9) })
    .width('100%')
    .height(rvp(188))
  }

  build() {
    Column() {
      Card({
        cardPadding: rvp(8),
        render: () => {
          this.renderBuilder()
        }
      })
    }.margin({ top: rvp(43) })
  }
}