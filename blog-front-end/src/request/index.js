import axios from 'axios'
import {Message} from 'element-ui'
import store from '@/store'
import {getToken} from '@/request/token'

const service = axios.create({
  baseURL: process.env.BASE_API,
  timeout: 10000
})

//request interceptor
service.interceptors.request.use(config => {

  if (store.state.token) {
    config.headers['Oauth-Token'] = getToken()
  }
  return config
}, error => {

  Promise.reject(error)
})

// respone interceptor
service.interceptors.response.use(
  response => {

    //global Session timeout
    if (response.headers['session_time_out'] == 'timeout') {
      store.dispatch('fedLogOut')
    }

    const res = response.data;

    //0 -> succcess
    if (res.code !== 200) {

      //90001 Session timeout
      if (res.code === 90001) {
        return Promise.reject('error');
      }

      //20001 not logged in
      if (res.code === 90002) {

        Message({
          type: 'warning',
          showClose: true,
          message: 'Not logged in or login timeout, please log in again!'
        })

        return Promise.reject('error');
      }


      if (res.code === 70001) {
        console.info('Permission authentication error')
        Message({
          type: 'warning',
          showClose: true,
          message: 'No permission to access it'
        })
        return Promise.reject('error');
      }

      return Promise.reject(res.msg);
    } else {
      return response.data;
    }
  },
  error => {
    Message({
      type: 'warning',
      showClose: true,
      message: 'Connection timeout'
    })
    return Promise.reject('error')
  })

export default service
