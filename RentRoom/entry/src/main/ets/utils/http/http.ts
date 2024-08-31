import axios from '@ohos/axios';
import { promptAction } from '@kit.ArkUI';
import type { AnyObject } from '../../model/HttpModel.ts';

const request = axios.create({
  baseURL: 'http://127.0.0.1:6060'
})

// 请求拦截器
request.interceptors.request.use(
  (config) => {
    // 将来会添加token参数
    return config;
  }
)

request.interceptors.response.use(
  (response) => {
    if (response.data.code === 200) {
      return response.data.data
    } else {
      promptAction.showToast(response.data.message);
      return Promise.reject(response.data.message);
    }
  },
  (error) => {
    console.log('jiazaishuju'+error.message)
    promptAction.showToast(error.message);
    return Promise.reject(error.message);
  }
)

export default class Http {
  get<T>(url: string, params?: AnyObject) {
    return request.get<any, T>(url, {
      params
    })
  }

  post<T>(url: string, data?: AnyObject) {
    return request.post<any, T>(url, data)
  }

  put<T>(url: string, data?: AnyObject) {
    return request.put<any, T>(url, data)
  }

  delete<T>(url: string, params?: AnyObject) {
    return request.delete<any, T>(url, {
      params
    })
  }
}