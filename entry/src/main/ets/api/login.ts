import http from '@ohos.net.http'
import httpRequest from '../utils/http'

const loginApi = {
  loginToken: (extraData) => {
    return httpRequest.request('https://admin-api-club-test.aimer.com.cn/club-admin/fissions/user/list?TIMESTAMP=' + new Date().getTime(), {
      // 请求方式
      method: http.RequestMethod.POST,
      extraData: {
        limit: 5,
        page: 1
      },
      // 可选，默认为60s
      connectTimeout: 60000,
      // 可选，默认为60s
      readTimeout: 60000,
      // 开发者根据自身业务需要添加header字段
      header: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Authorization': 'Bearer b14ac233-f5ba-474d-989c-5cfc6a80975c'
      }
    })
  }
}

export default loginApi

