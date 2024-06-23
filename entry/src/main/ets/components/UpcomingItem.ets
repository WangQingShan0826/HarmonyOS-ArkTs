@Component
struct UpcomingItem {
  private title: string
  @State isComplete: boolean = false
  @Link @Watch('isCompleteChange') completeData: string[]

  isCompleteChange() {
    animateTo({ duration: 300 }, () => {
      this.isComplete = this.completeData.includes(this.title)
    })
  }

  build() {
    Row() {
      Image(this.isComplete ? $r('app.media.wanchengdise') : $r('app.media.weiwancheng'))
        // .width(this.isComplete ? 20 : 0)
        .height(20)
        .margin({
          right: '30px'
        })
        .transition({ type: TransitionType.All })
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
      const index = this.completeData.findIndex(e => e === this.title)
      if (index > -1) {
        this.completeData.splice(index, 1)
      } else {
        this.completeData.push(this.title)
      }
    })
  }
}

export default UpcomingItem