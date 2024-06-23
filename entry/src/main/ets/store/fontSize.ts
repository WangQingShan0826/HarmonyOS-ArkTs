
import preferences from '@ohos.data.preferences';

class FontSizeSetting {
  private pname: string

  constructor(name) {
    this.pname = name
  }

  async putFontSize(key: string, value: number, moduleContext) {
    const promise = await preferences.getPreferences(moduleContext, this.pname);
    promise.put(key, value)
    // // 把内存中的数据写入磁盘,完成持久化
    promise.flush()
  }

  async getFontSize(key: string, value: number, moduleContext) {
    const promise = await preferences.getPreferences(moduleContext, this.pname);
    const data = await promise.get(key, value)
    return data
  }
}

export const fontSizeSetting = new FontSizeSetting('FontSize')