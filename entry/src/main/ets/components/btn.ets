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
    Row() {
      Text('水果')
        .fontSize(16)
        .fontWeight(400)
        .decoration({
          type: TextDecorationType.Underline
        })
        .fontColor('#409EFF')
        .margin({
          right: '20px'
        })
        .onClick(() => {
          router.pushUrl({ url: 'pages/Fruit' })
        })
      Text('待办')
        .fontSize(16)
        .fontWeight(400)
        .decoration({
          type: TextDecorationType.Underline
        })
        .fontColor('#409EFF')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Upcoming',
            params: {
              isComplete: ['学习ArkTs']
            }
          })
        })
      Text('首页')
        .fontSize(16)
        .fontWeight(400)
        .decoration({
          type: TextDecorationType.Underline
        })
        .fontColor('#409EFF')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Home'
          })
        })
    }
  }
}

export default Child