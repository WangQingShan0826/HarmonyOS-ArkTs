import Main from './Main'
import Home from './Home'
import Upcoming from './Upcoming'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  private readonly tabsController: TabsController = new TabsController();

  @Builder TabBuilder(title: string, index: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .width(30)
        .height(30)
        .objectFit(ImageFit.Cover)
        .margin({
          bottom: 5
        })
      Text(title)
        .fontSize(12)
        .fontColor(this.currentIndex === index ? $r('app.color.primary_color') : '#000000')
    }
    .onClick(() => {
      this.currentIndex = index
      this.tabsController.changeIndex(index)
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        Home()
      }
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.shouye'), $r('app.media.shouye')))
      TabContent() {
        Upcoming()
      }
      .tabBar(this.TabBuilder('待办', 1, $r('app.media.daiban'), $r('app.media.daiban')))
      TabContent() {
        Main()
      }
      .tabBar(this.TabBuilder('我的', 2, $r('app.media.yonghu'), $r('app.media.yonghu')))
    }
    .barWidth('100%')
    .barHeight(60)
    .barMode(BarMode.Fixed)
    .vertical(false)
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }
}