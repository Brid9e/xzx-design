import { withInstall } from '@xzx-design/utils'
import ATest from './src/a-test.vue'
import type { SFCWithInstall } from '@xzx-design/utils'

export const XzxATest: SFCWithInstall<typeof ATest> = withInstall(ATest)
export default XzxATest

export * from './src/a-test'
