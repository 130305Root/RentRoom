import Bg from '../views/My/Bg';
import ScrollContainer from '../components/ScrollContainer/Index'
import { IColor } from '../model/HomeData';
import NavBar from '../views/My/NavBar';
import rvp from '../utils/responsive';
import UserInfo from '../views/My/UserInfo';
import { PADDING } from '../constant/size';
import TimePlan from '../views/My/TimePlan';
import Order from '../views/My/Order';
import PlanList from '../views/My/PlanList';

@Component
export default struct My {
  @StorageProp('topHeight') topHeight: number = 0
  @Builder
  navBuilder($$: IColor) {
    NavBar({ fontColor: $$.fontColor })
  }

  @Builder
  contentBuilder() {
    Stack() {
      Bg()
      Column() {
        UserInfo()
        TimePlan()
        Order()
        PlanList()
      }.padding({ left: rvp(PADDING), right: rvp(PADDING), top: rvp(44) + this.topHeight })
    }.width('100%').align(Alignment.TopStart)
  }

  build() {
    ScrollContainer({
      contentBuildParam: () => {
        this.contentBuilder()
      },
      navBuildParam: this.navBuilder,
    })
  }
}