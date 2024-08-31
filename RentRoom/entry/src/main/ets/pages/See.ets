import NavBar from '../views/See/NavBar';
import { window } from '@kit.ArkUI';
import FindRoom from '../views/See/FindRoom';

@Component
export default struct See {

  build() {
    Column() {
      NavBar()
      FindRoom()
    }
    .height('100%')
    .width('100%')
    .linearGradient({
      direction: GradientDirection.Bottom,
      colors: [['#DEFBE5', 0], ['#FFFFFF', 0.2]]
    })
  }
}