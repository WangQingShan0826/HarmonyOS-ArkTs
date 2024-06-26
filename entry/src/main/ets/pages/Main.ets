import router from '@ohos.router'
import { fontSizeSetting } from '../store/fontSize'

class ItemData {
  title: Resource
  img: Resource
  others?: Resource
  url: string

  constructor(title: Resource, img: Resource, others: Resource, url: string) {
    this.title = title
    this.img = img
    this.others = others
    this.url = url
  }
}

@Entry
@Component

struct Main {
  @State PrimaryFontSize: number = 18
  @State ListData: ItemData[] = [
    new ItemData($r('app.string.main_list_news'), $r('app.media.xiaoxitongzhi'), $r('app.string.main_list_toggle'), ''),
    new ItemData($r('app.string.main_list_data'), $r('app.media.shuju'), null, 'pages/Fruit'),
    new ItemData($r('app.string.main_list_font_size'), $r('app.media.zitidaxiao'), null, 'pages/FontSize')
  ]

  onPageShow() {
    fontSizeSetting.getFontSize('primary_font_size', 0, getContext(this)).then((data: number) => {
      this.PrimaryFontSize = data
    })
  }

  @Builder settingCell(item: ItemData) {
    Row() {
      Row({ space: 12 }) {
        Image(item.img)
          .width(22)
          .height(22)
          .objectFit(ImageFit.Cover)
          .borderRadius(50)
        Text(item.title)
          .fontSize(this.PrimaryFontSize)
      }

      if (item.others) {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .height(22)
      } else {
        Image($r('app.media.you'))
          .width(16)
          .height(16)
          .objectFit(ImageFit.Cover)
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(34)
    .onClick(() => {
      router.pushUrl({
        url: item.url
      })
    })
  }

  build() {
    Row() {
      Column() {
        Column() {
          Row() {
            Text('我的')
              .fontSize(28)
              .fontWeight(FontWeight.Bold)
              .margin({
                left: '5%',
                top: '30',
                bottom: '20'
              })
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          Row({ space: 10 }) {
            Image($r('app.media.yonghu'))
              .width(50)
              .height(50)
              .objectFit(ImageFit.Cover)
            Column({ space: 6 }) {
              Text('花花')
                .fontSize(20)
                .fontWeight(FontWeight.Medium)
              Text('18849035026')
                .fontSize(12)
                .fontColor('#ff8a8a8a')
            }
            .alignItems(HorizontalAlign.Start)
          }
          .width('90%')
          .backgroundColor('#FFFFFF')
          .padding(18)
          .borderRadius(20)
          .margin({
            bottom: 10
          })
          List({ space: 10 }) {
            ForEach(this.ListData, (item: ItemData) => {
              ListItem() {
                this.settingCell(item)
              }
            }, item => JSON.stringify(item))
          }
          .divider({ strokeWidth: 2, startMargin: 52 })
          .width('90%')
          .backgroundColor('#FFFFFF')
          .padding(10)
          .borderRadius(20)
        }
        Button('退出登录')
          .backgroundColor('#E0E0E0')
          .fontColor(Color.Red)
          .fontSize(18)
          .width('90%')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        bottom: 20
      })
    }
    .height('100%')
    .alignItems(VerticalAlign.Top)
    .backgroundColor('#EFEFEF')
  }
}

export default Main