import { buildProps } from '@xzx-design/utils'

import type { ExtractPropTypes } from 'vue'
import type ATest from './a-test.vue'

export const ATestProps = buildProps({
  /**
   * @description title
   * */
  title: {
    type: String,
    default: 'A Test',
  },
})

export type ATestProps = ExtractPropTypes<typeof ATestProps>
export type ATestInstance = InstanceType<typeof ATest>
