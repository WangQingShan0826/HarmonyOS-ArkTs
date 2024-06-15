import router from '@ohos.router'

@Entry
@Component
struct Second {
  @State message: string = 'Hi there'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Back')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .width('40%')
        .height('50em')
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          // router.pushUrl({ url: 'pages/Index' })
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}