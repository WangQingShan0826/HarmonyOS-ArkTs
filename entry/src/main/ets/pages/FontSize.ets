import { fontSizeSetting } from '../store/fontSize'

@Entry
@Component
struct FontSize {
  @State message: string = 'Hello World'
  @State FonSize: number = 24
  @State FonSizeDesc: object = {
    12: '小',
    18: '标准',
    24: '大',
    30: '超大'
  }

  onPageShow() {
    fontSizeSetting.getFontSize('primary_font_size', 0, getContext(this)).then((data: number) => {
      this.FonSize = data
    })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(this.FonSize)
        Row() {
          Column({ space: 2 }) {
            Text(this.FonSizeDesc[this.FonSize]).fontSize(18)
            Row({ space: 10 }) {
              Text('A').fontSize(12)
              Slider({
                value: this.FonSize,
                step: 6,
                style: SliderStyle.InSet,
                max: 30,
                min: 12
              })
                .width('90%')
                .blockColor('#191970')
                .trackColor('#ADD8E6')
                .selectedColor('#4169E1')
                .showSteps(true)
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.FonSize = value
                  fontSizeSetting.putFontSize('primary_font_size', value, getContext(this))
                  fontSizeSetting.getFontSize('primary_font_size', 0, getContext(this))
                })
              Text('A').fontSize(30)
            }
            .width('80%')
          }
          .backgroundColor('#FFFFFF')
          .width(340)
          .borderRadius(24)
          .padding({
            top: 10,
            bottom: 10
          })
        }
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        top: 10,
        bottom: 10
      })
    }
    .height('100%')
    .backgroundColor('#EFEFEF')
  }
}