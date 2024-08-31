import { getHomeDataApi } from '../api/home';
import { PADDING, SHADOW_RADIUS } from '../constant/size';
import { BannerListDataSource, IColor, INavList, IPlanList, ITileList } from '../model/HomeData';
import NavList from '../views/Home/NavList';
import PlanList from '../views/Home/PlanList';
import RomeRecommend from '../views/Home/RoomRecommend';
import SearchBar from '../views/Home/SearchBar';
import SwiperLayout from '../views/Home/SwiperLayout';
import TileList from '../views/Home/TileList';
import ScrollContainer from '../components/ScrollContainer/Index'
import rvp from '../utils/responsive';

@Component
export default struct Home {
  @State bannerList: BannerListDataSource = new BannerListDataSource()
  @State navList: INavList = []
  @State tileList: ITileList = []
  @State planList: IPlanList = []
  @State adPicture: string = '';
  // 获取首页数据函数
  getHomeData = async () => {
    const result = await getHomeDataApi()
    this.bannerList.setList(result.bannerList)
    this.navList = result.navList
    this.tileList = result.tileList
    this.planList = result.planList
    this.adPicture = result.adPicture
  }

  // 生命周期函数：初始化渲染时触发
  aboutToAppear(): void {
    this.getHomeData()
  }

  @Builder
  navBuilder($$: IColor) {
    // 搜索栏
    SearchBar({ fontColor: $$.fontColor })
  }

  @Builder
  contentBuilder() {
    SwiperLayout({ bannerList: this.bannerList })
    Column() {
      // 导航栏
      NavList({ navList: this.navList })
      // tileList
      TileList({ tileList: this.tileList })
      // planList
      PlanList({ planList: this.planList })
      // 广告
      Image(this.adPicture)
        .width('100%')
        .height(rvp(60))
        .objectFit(ImageFit.Fill)
        .margin({ top: rvp(10) })
        .shadow({
          offsetX: 0,
          offsetY: 0,
          radius: rvp(SHADOW_RADIUS),
          color: 'rgba(0,0,0,0.14)'
        })
    }
    .width('100%').padding({ left: rvp(PADDING), right: rvp(PADDING) })

    // 房源推荐
    RomeRecommend()
  }

  build() {
    ScrollContainer({
      navBuildParam: this.navBuilder,
      contentBuildParam: () => {
        this.contentBuilder()
      }
    })
  }
}