import installer from './defaults'
export * from '@xzx-design/components'
export * from '@xzx-design/constants'
export * from '@xzx-design/directives'
export * from '@xzx-design/hooks'
export * from './make-installer'

export const install = installer.install
export const version = installer.version
export default installer

export { default as dayjs } from 'dayjs'
