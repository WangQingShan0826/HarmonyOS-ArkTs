@Component
struct UpcomingItem {
  private title: string
  @Prop isComplete: boolean

  build() {
    Row() {
      Image(this.isComplete ? $r('app.media.wanchengdise') : $r('app.media.weiwancheng'))
        .width('60px')
        .height('60px')
        .margin({
          right: '30px'
        })
      Text(this.title)
        .fontSize(16)
        .fontWeight(500)
        .decoration({
          type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None
        })
        .opacity(this.isComplete ? 0.4 : 1)
    }
    .width('100%')
    .height('170px')
    .backgroundColor('#FFFFFF')
    .margin({
      bottom: 14
    })
    .borderRadius(24)
    .padding({
      left: 20
    })
    .onClick(() => {
      this.isComplete = !this.isComplete
      console.log('isComplete', this.isComplete)
    })
  }
}

export default UpcomingItem