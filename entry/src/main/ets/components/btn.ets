import router from '@ohos.router'

class BtnWidth {
  width: string

  constructor(width: string) {
    this.width = width
  }
}

@Component
struct Child {
  @State btnWidth: BtnWidth = new BtnWidth('30%')
  @Link message: string
  @Prop index: number

  build() {
    Button() {
      Text('Next').fontSize(20).fontWeight(FontWeight.Bold)
    }
    .type(ButtonType.Capsule)
    .width(this.btnWidth.width)
    .height('100px')
    .onClick(() => {
      // router.pushUrl({ url: 'pages/Second' })
      // this.btnWidth = new BtnWidth('40%')
      this.message = this.message === 'Hello ArkTs' ? 'Hello World' : 'Hello ArkTs'
    })
  }
}

export default Child