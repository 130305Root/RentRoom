import { IBannerItem, BannerListDataSource } from '../../model/HomeData';
import rvp from '../../utils/responsive';

@Component
export default struct SwiperLayout {
  @StorageProp('topHeight') topHeight: number = 0
  @ObjectLink bannerList: BannerListDataSource
  build() {
      Swiper() {
        LazyForEach(this.bannerList,(banner: IBannerItem) => {
          Image(banner.imageURL).width('100%').height('100%').objectFit(ImageFit.Fill)
        },(banner: IBannerItem) => banner.id + '')
      }
    .width('100%')
    .height(rvp(211-36 + this.topHeight)) // 暂时减去状态栏高度
    // .autoPlay(true) // 自动轮播
    .indicator(
      new DotIndicator()
        .color($r('app.color.indicator_color'))
        .selectedColor($r('app.color.indicator_active_color'))
    )
    // .interval(1000) // 控制轮播速度

  }
}