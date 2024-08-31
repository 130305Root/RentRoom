import { getDiscoverDataApi } from '../api/home';
import ScrollContainer from '../components/ScrollContainer/Index';
import NavBar from '../views/Discover/NavBar';
import Bg from '../views/Discover/Bg';
import rvp from '../utils/responsive';
import { IBenefits, IDanMuList, IPostZone } from '../model/DiscoverData';
import BannerScroll from '../views/Discover/BannerScroll';
import Ad from '../views/Discover/Ad';
import Welfare from '../views/Discover/Welfare';
import { PADDING } from '../constant/size';

@Component
export default struct Discover {
  @StorageProp('topHeight') topHeight: number = 0
  @State danMuList1: IDanMuList = []
  @State danMuList2: IDanMuList = []
  @State postZone: IPostZone = {
    "mainPost": {
      "followerNum": 0,
      "title": '',
      "userAvatar": '',
      "userName": '',
      "postContent": '',
    },
    "contentBlockList": []
  }
  @State benefits: IBenefits = []

  aboutToAppear(): void {
    this.getDiscoverData()
  }

  async getDiscoverData() {
    const discoverData = await getDiscoverDataApi()
    this.danMuList1 = discoverData.danMuList1
    this.danMuList2 = discoverData.danMuList2
    this.postZone = discoverData.postZone
    this.benefits = discoverData.benefits
    // console.log('postZone'+JSON.stringify(discoverData.benefits))
  }

  @Builder
  navBuilder() {
    NavBar()
  }

  @Builder
  contentBuilder() {
    Stack() {
      Bg()
      Column() {
        Text('与100万用户发现生活').margin({ top: rvp(44), left: rvp(16) }).fontSize(rvp(14))
        Column({ space: rvp(16) }) {
          BannerScroll({ bannerList: this.danMuList1 })
          BannerScroll({ bannerList: this.danMuList2 })
        }.width('100%').margin({ top: rvp(20) })

        Column() {
          Ad({ postZone: this.postZone })
          Welfare({ benefits: this.benefits })
        }.padding({ top: this.topHeight, left: rvp(PADDING), right: rvp(PADDING) })
      }.alignItems(HorizontalAlign.Start).padding({ top: this.topHeight }).width('100%')
    }.alignContent(Alignment.TopStart)
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