// 设计稿总宽度
const DRAFT_WIDTH = 360

const windowWidth = AppStorage.get('windowWeight') as number || 360
// 将元素设计稿大小转化为真机中的大小
export default function rvp(val: number) {
  /**
   * 计算元素真正的大小：
   *      x = 设计稿的大小  /  设计稿总宽度  *  真机宽度
   */

  return val / DRAFT_WIDTH * windowWidth
}