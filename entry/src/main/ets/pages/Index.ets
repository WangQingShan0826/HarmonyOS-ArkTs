import Btn from '../components/btn'

@Entry
@Component
struct Index {
  @State message: string = 'Hello ArkTs'
  @State index: number = 1

  build() {
    Column() {
      Column() {
        Image($r('app.media.hua'))
          .width('150px')
          .height('150px')
          .objectFit(ImageFit.Cover)
          .borderRadius(50)
          .margin({
            bottom: '30px'
          })
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .lineHeight(20)
          .height(20)
      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')
      .margin({
        bottom: '30px'
      })
      Row() {
        Btn({ message: $message, index: this.index })
      }
      .width('100%')
    }
    // .alignItems(VerticalAlign.Bottom)
    // .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding('30px')
  }
}