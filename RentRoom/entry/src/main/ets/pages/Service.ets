import { getServiceDataApi } from '../api/home';
import ScrollContainer from '../components/ScrollContainer/Index';
import { PADDING } from '../constant/size';
import { IColor } from '../model/HomeData';
import { IHomeServiceList, IVipServiceList } from '../model/ServiceData';
import rvp from '../utils/responsive';
import Bg from '../views/Service/Bg';
import DomesticService from '../views/Service/DomesticService';
import NavBar from '../views/Service/NavBar';
import ServiceCalendar from '../views/Service/ServiceCalendar';
import ServiceTabs from '../views/Service/ServiceTabs';
import VIP from '../views/Service/VIP';

@Component
export default struct Service {
  @State homeServiceList: IHomeServiceList = [];
  @State vipServiceList: IVipServiceList = []
  aboutToAppear() {
    this.getServiceData()
  }
  async getServiceData() {
    const serviceData = await getServiceDataApi();
    this.vipServiceList = serviceData.vipServiceList;
    this.homeServiceList = serviceData.homeServiceList;
  }

  @Builder
  navBuilder($$: IColor) {
    NavBar({ fontColor: $$.fontColor })
  }

  @Builder
  contentBuilder() {
    Stack() {
      Bg()
      Column() {
        VIP()
        DomesticService()
        ServiceCalendar()
        ServiceTabs()
      }.width('100%').padding({
        left: rvp(PADDING),
        right: rvp(PADDING)
      })
    }.width('100%').alignContent(Alignment.TopStart).backgroundColor($r('app.color.bg_gray_second'))

  }

  build() {
    ScrollContainer({
      navBuildParam: this.navBuilder,
      contentBuildParam: this.contentBuilder
    })
  }
}