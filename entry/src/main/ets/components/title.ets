import router from '@ohos.router'

@Component
struct Title {
  @Link showTypeLink: boolean
  @Prop title: string

  build() {
    Row() {
      Row() {
        Image($r('app.media.fanhui'))
          .width('60px')
          .objectFit(ImageFit.Cover)
          .margin({
            right: '20px'
          })
          .onClick(() => {
            router.back()
          })
        Text(this.title)
          .fontWeight(500)
          .fontSize(20)
      }
      Image($r('app.media.shuaxin'))
        .width('60px')
        .objectFit(ImageFit.Cover)
        .onClick(() => {
          this.showTypeLink = !this.showTypeLink
        })
    }
    .width('100%')
    .padding('50px')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

export default Title