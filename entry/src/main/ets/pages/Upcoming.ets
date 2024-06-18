import router from '@ohos.router'

import UpcomingItem from '../components/UpcomingItem'

@Entry
@Component

struct Upcoming {
  scroller: Scroller = new Scroller()
  @State isComplete: string[] = router.getParams()?.['isComplete']

  build() {
    Column() {
      Text('待办')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin(30)
      Scroll(this.scroller) {
        Column() {
          UpcomingItem({ title: '学习ArkTs', isComplete: !!this.isComplete.includes('学习ArkTs') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
          UpcomingItem({ title: '买菜', isComplete: !!this.isComplete.includes('买菜') })
        }
        .padding({
          left: 8,
          right: 8,
          bottom: 20
        })
      }
      .scrollable(ScrollDirection.Vertical)  // 滚动方向纵向
      // .scrollBar(BarState.On)  // 滚动条常驻显示
      .scrollBarColor(Color.Gray)  // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .edgeEffect(EdgeEffect.None)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
    .alignItems(HorizontalAlign.Start)
  }
}