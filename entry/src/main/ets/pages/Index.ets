import Btn from '../components/btn'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State index: number = 1

  build() {
    Row() {
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
      Column() {
        Btn({ message: $message, index: this.index })
      }
    }
    .alignItems(VerticalAlign.Bottom)
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    // .height('100%')
    .padding('30px')
  }
}