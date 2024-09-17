import { createApp } from 'vue'
import '@xzx-design/theme-chalk/src/index.scss'
import * as Comps from '@xzx-design/components'
;(async () => {
  const apps = import.meta.glob('./src/*.vue')
  const name = location.pathname.replace(/^\//, '') || 'App'
  const file = apps[`./src/${name}.vue`]
  if (!file) {
    location.pathname = 'App'
    return
  }
  const App = (await file()).default
  const app = createApp(App)
  Object.values(Comps).forEach((plugin) => app.use(plugin))

  app.mount('#play')
})()
