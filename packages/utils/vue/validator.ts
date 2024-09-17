import { componentSizes, datePickTypes } from '@xzx-design/constants'
import type { ComponentSize, DatePickType } from '@xzx-design/constants'

export const isValidComponentSize = (val: string): val is ComponentSize | '' =>
  ['', ...componentSizes].includes(val)

export const isValidDatePickType = (val: string): val is DatePickType =>
  ([...datePickTypes] as string[]).includes(val)
