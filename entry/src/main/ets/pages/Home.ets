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
  @State GridData: GridItemData[] = [
    new GridItemData($r('app.media.like'), $r('app.string.home_grid_love')),
    new GridItemData($r('app.media.lishijilu'), $r('app.string.home_grid_history')),
    new GridItemData($r('app.media.xiaoxi'), $r('app.string.home_grid_messgae')),
    new GridItemData($r('app.media.gouwuche'), $r('app.string.home_grid_shop')),
    new GridItemData($r('app.media.mubiao'), $r('app.string.home_grid_target')),
    new GridItemData($r('app.media.quanzi'), $r('app.string.home_grid_group')),
    new GridItemData($r('app.media.shoucang'), $r('app.string.home_grid_collect')),
    new GridItemData($r('app.media.huishouzhan'), $r('app.string.home_grid_recycleBin'))
  ]

  @Builder settingCall(item: GridItemData) {
    Column({ space: 8 }) {
      Image(item.img)
        .width(32)
        .height(32)
        .objectFit(ImageFit.Cover)
      Text(item.title)
        .fontSize(12)
    }
  }

  build() {
    Row() {
      Column() {
        Grid() {
          ForEach(this.GridData, (item: GridItemData) => {
            GridItem() {
              this.settingCall(item)
            }
          }, item => JSON.stringify(item))
        }
        .rowsTemplate('1fr 1fr')
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .height(144)
        .width(330)
        .backgroundColor('#FFFFFF')
        .borderRadius(34)
        .padding(10)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding(20)
    }
    .height('100%')
    .backgroundColor('#EFEFEF')
  }
}