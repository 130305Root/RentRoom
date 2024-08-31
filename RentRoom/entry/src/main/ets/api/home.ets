import { IDiscoverData } from '../model/DiscoverData'
import { IHomeData, IRoomRecommendList } from '../model/HomeData'
import { IServiceData } from '../model/ServiceData'
import { http } from '../utils/http'

// 获取首页数据
export const getHomeDataApi = (): Promise<IHomeData> => {
  return http.get<IHomeData>('/home/info')
}

// 获取房源推荐数据
export const getRoomRecommendApi = (): Promise<IRoomRecommendList> => {
  return http.get<IRoomRecommendList>('/house/nearbyHouses')
}

// 获取租房列表数据
export const getServiceDataApi = (): Promise<IServiceData> => {
  return http.get<IServiceData>('/service/info')
}

// 获取发现列表数据
export const getDiscoverDataApi = (): Promise<IDiscoverData> => {
  return http.get<IDiscoverData>('/discover/info')
}