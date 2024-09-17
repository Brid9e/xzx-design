<template>
  <div>
    <h1>这是一个测试组件</h1>
    <slot />
  </div>
</template>
<script lang="ts" setup>
import { ATestProps } from './a-test'

defineOptions({
  name: 'XzxATest',
})

defineProps(ATestProps)

// init here
</script>
