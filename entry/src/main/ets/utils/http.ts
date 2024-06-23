import http from '@ohos.net.http'

const httpRequest = http.createHttp()

// httpRequest.on('headersReceive', (header) => {
//   console.info('header: ' + JSON.stringify(header))
// });

export default httpRequest