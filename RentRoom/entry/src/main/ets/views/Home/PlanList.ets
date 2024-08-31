import { IPlanItem, IPlanList } from '../../model/HomeData';
import rvp from '../../utils/responsive';

@Component
export default struct PlanList {
  @Prop planList: IPlanList

  build() {
    Row({ space: rvp(5) }) {
      ForEach(this.planList, (plan: IPlanItem) => {
        Image(plan.imageURL).width(rvp(78)).height(rvp(60)).objectFit(ImageFit.Fill)
      }, (plan: IPlanItem) => plan.id + '')
    }
    .margin({ top: rvp(18) })
    .width('100%')
  }
}