import { componentSizeMap } from '@xzx-design/constants'

import type { ComponentSize } from '@xzx-design/constants'

export const getComponentSize = (size?: ComponentSize) => {
  return componentSizeMap[size || 'default']
}
