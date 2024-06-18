import router from '@ohos.router'

@Entry
@Component
struct Login {
  @State account: string = ''
  @State password: string = ''
  @State Loading: boolean = false

  @Builder SubmitBtn() {
    if (this.Loading) {
      LoadingProgress()
        .color(Color.White)
        .height(40)
        .width(40)
    } else {
      Text('登录')
        .fontColor(Color.White)
        .height(40)
    }
  }

  build() {
    Row() {
      Column() {
        Image($r('app.media.hua'))
          .width($r('app.float.login_logo_size'))
          .height($r('app.float.login_logo_size'))
          .borderRadius(16)
          .margin({
            bottom: 10
          })
        Text('登录界面')
          .fontWeight(FontWeight.Medium)
          .fontSize($r('app.float.login_title_text_size'))
          .margin({
            bottom: 5
          })
        Text('登录账号以使用更多服务')
          .fontWeight(FontWeight.Medium)
          .fontSize($r('app.float.login_memo_text_size'))
          .fontColor($r('app.color.login_memo_text_color'))
          .margin({
            bottom: 30
          })
        TextInput({ placeholder: '账号' })
          .maxLength(11)
          .type(InputType.Number)
          .enterKeyType(EnterKeyType.Next)
          .width($r('app.float.login_input_width'))
          .margin({
            bottom: 10
          })
          .onChange((value: string) => {
            this.account = value
          })
        TextInput({ placeholder: '密码' })
          .type(InputType.Password)
          .enterKeyType(EnterKeyType.Done)
          .width($r('app.float.login_input_width'))
          .onChange((value: string) => {
            this.password = value
          })
          .margin({
            bottom: 10
          })
        Row() {
          Text('短信验证码登录')
            .fontColor($r('app.color.primary_color'))
            .fontSize(14)
          Text('忘记密码')
            .fontColor($r('app.color.primary_color'))
            .fontSize(14)
        }
        .width($r('app.float.login_input_width'))
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          top: 6
        })
        Button() {
          this.SubmitBtn()
        }
          .width($r('app.float.login_input_width'))
          .backgroundColor($r('app.color.primary_color'))
          .fontSize(16)
          .margin({
            top: 60,
            bottom: 10
          })
          .onClick(() => {
            this.Loading = true
            setTimeout(() => {
              this.Loading = false
              router.pushUrl({ url: 'pages/Index' })
            }, 2000)
          })
        Text('注册账号')
          .fontColor($r('app.color.primary_color'))
          .fontSize(14)
      }
      .width('100%')
    }
    .height('100%')
    .alignItems(VerticalAlign.Top)
    .padding({
      top: 130
    })
  }
}