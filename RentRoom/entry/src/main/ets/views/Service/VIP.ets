import { IVipServiceItem, IVipServiceList } from '../../model/ServiceData'
import rvp from '../../utils/responsive'
import { getServiceDataApi } from '../../api/home';
@Component
export default struct VIP {
  @StorageProp('topHeight') topHeight: number = 0
  @State vipServiceList: IVipServiceList = []
  getServiceData = async () => {
    console.log('发送请求')
    const serviceData = await getServiceDataApi();
    this.vipServiceList = serviceData.vipServiceList;

    console.log('shuju'+JSON.stringify(serviceData.vipServiceList))
  }
  // 生命周期函数：初始化渲染时触发
  aboutToAppear(): void {
    this.getServiceData()
  }

  getUnit(name: string): string {
    console.log(name)
    switch (name) {
      case '余额':
        return ' 元';
      case '优惠券':
        return ' 张';
      case '会员特权':
        return ' 项';
      case '会员福利':
        return ' 个';
      default:
        return '';
    }
  }

  build() {
    Stack() {
      Image($r('app.media.vip_bg')).width(rvp(328)).height('100%').objectFit(ImageFit.Fill)
      Column({ space: rvp(14) }) {
        Row() {
          Image($r('app.media.crown')).width(rvp(18)).height(rvp(18)).objectFit(ImageFit.Fill)
          Text('开通谷粒卡享特权').fontSize(rvp(16)).fontColor($r('app.color.white')).margin({
            left: rvp(8),
            right: rvp(52)
          })
          Image($r('app.media.vip')).width(rvp(42)).height(rvp(19)).objectFit(ImageFit.Fill)
        }

        Row({ space: rvp(32) }) {
          ForEach(this.vipServiceList, (vip: IVipServiceItem) => {
            Column({ space: rvp(5) }) {
              Text(vip.name).fontColor($r('app.color.white')).fontSize(rvp(14))
              Text() {
                Span(vip.content + '').fontSize(rvp(18)).fontWeight(700).fontColor($r('app.color.white'))
                Span(this.getUnit(vip.name)).fontSize(rvp(12)).fontColor($r('app.color.white'))
              }
            }
          }, (vip: IVipServiceItem) => vip.name)
        }
      }.height('100%').justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height(rvp(99))
    .margin({ top: rvp(49) + this.topHeight })
  }
}