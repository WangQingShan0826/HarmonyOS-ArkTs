class GridItemData {
  title: Resource
  img: Resource

  constructor(img: Resource, title: Resource) {
    this.title = title
    this.img = img
  }
}

@Entry
@Component
struct Home {
  // private readonly controller: VideoController = new VideoController()
  @State GridData: GridItemData[] = [
    new GridItemData($r('app.media.like'), $r('app.string.home_grid_love')),
    new GridItemData($r('app.media.lishijilu'), $r('app.string.home_grid_history')),
    new GridItemData($r('app.media.xiaoxi'), $r('app.string.home_grid_messgae')),
    new GridItemData($r('app.media.gouwuche'), $r('app.string.home_grid_shop')),
    new GridItemData($r('app.media.mubiao'), $r('app.string.home_grid_target')),
    new GridItemData($r('app.media.quanzi'), $r('app.string.home_grid_group')),
    new GridItemData($r('app.media.shoucang'), $r('app.string.home_grid_collect')),
    new GridItemData($r('app.media.huishouzhan'), $r('app.string.home_grid_recycleBin')),
  ]

  @Builder settingCall(item: GridItemData) {
    Column({ space: 8 }) {
      Image(item.img)
        .width(26)
        .height(26)
        .objectFit(ImageFit.Cover)
      Text(item.title)
        .fontSize(12)
    }
  }

  private readonly scroller: Scroller = new Scroller()

  build() {
    Row() {
      Column() {
        Grid(this.scroller) {
          ForEach(this.GridData, (item: GridItemData) => {
            GridItem() {
              this.settingCall(item)
            }
          }, item => JSON.stringify(item))
        }
        .rowsTemplate('1fr 1fr')
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .height(144)
        .width('90%')
        .backgroundColor('#FFFFFF')
        .borderRadius(34)
        .padding({
          top: 6,
          bottom: 6
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({
        top: 20
      })
    }
    .backgroundColor('#EFEFEF')
  }
}

export default Home