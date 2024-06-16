import Title from '../components/title'

@Entry
@Component
struct Second {
  @State fruitData: object[] = [
    {
      id: '12312312',
      title: '苹果',
      votesNumber: '12'
    },
    {
      id: '12342312',
      title: '香蕉',
      votesNumber: '10'
    },
    {
      id: '43312312',
      title: '梨',
      votesNumber: '9'
    }
  ]
  @State fruitData2: object[] = [
    {
      id: '1231252',
      title: '西瓜',
      votesNumber: '12'
    },
    {
      id: '12348312',
      title: '葡萄',
      votesNumber: '10'
    },
    {
      id: '12492312',
      title: '桃',
      votesNumber: '9'
    }
  ]
  @State showType: boolean = true
  @State isSelect: number = 0


  @Builder RankList() {
    List() {
      ForEach(this.showType ? this.fruitData : this.fruitData2, (item, index) => {
        ListItem() {
          Row() {
            Row() {
              Text(`${index + 1}`)
                .margin({
                  right: '100px'
                })
                .backgroundColor(!index ? '#409EFF' : '')
                .fontColor(!index ? '#FFFFFF' : '')
                .width('50px')
                .height('50px')
                .borderRadius(50)
                .fontSize(12)
                .textAlign(TextAlign.Center)
              Text(item.title)
                .fontWeight(600)
                .fontSize(14)
                .fontColor(this.isSelect === index ? '#409EFF' : '#000000')
                .onClick(() => {
                  this.isSelect = index
                })
            }
            Text(item.votesNumber)
              .fontSize(14)
          }
          .width('100%')
          .height('100px')
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)
          .border({
            style: BorderStyle.Solid,
            color: '#EFEFEF',
            width: {
              bottom: index === this.fruitData.length - 1 ? '0px' : '3px'
            }
          })
        }
      }, (item, index) => item.id)
    }
    .backgroundColor('#FFFFFF')
    .margin({
      left: '50px',
      right: '50px'
    })
    .padding({
      top: '10px',
      left: '30px',
      right: '30px',
      bottom: '10px'
    })
    .borderRadius(10)
  }

  build() {
    Row() {
      Column() {
        Title({ showTypeLink: $showType, title: '排行榜' })
        this.RankList()
      }
      .width('100%')
    }
    .height('100%')
    .alignItems(VerticalAlign.Top)
    .backgroundColor('#EFEFEF')
  }
}