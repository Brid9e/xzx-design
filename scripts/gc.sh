#! /bin/bash

NAME=$1

FILE_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")/../packages" && pwd)

re="[[:space:]]+"

if [ "$#" -ne 1 ] || [[ $NAME =~ $re ]] || [ "$NAME" == "" ]; then
  echo "Usage: pnpm gc \${name} with no space"
  exit 1
fi

DIRNAME="$FILE_PATH/components/$NAME"
INPUT_NAME=$NAME

if [ -d "$DIRNAME" ]; then
  echo "$NAME component already exists, please change it"
  exit 1
fi

NORMALIZED_NAME=""
for i in $(echo $NAME | sed 's/[_|-]\([a-z]\)/\ \1/;s/^\([a-z]\)/\ \1/'); do
  C=$(echo "${i:0:1}" | tr "[:lower:]" "[:upper:]")
  NORMALIZED_NAME="$NORMALIZED_NAME${C}${i:1}"
done
NAME=$NORMALIZED_NAME

mkdir -p "$DIRNAME"
mkdir -p "$DIRNAME/src"
mkdir -p "$DIRNAME/__tests__"

cat >$DIRNAME/src/$INPUT_NAME.vue <<EOF
<template>
  <div>
    <slot />
  </div>
</template>

<script lang="ts" setup>
import { ${NORMALIZED_NAME}Props } from './$INPUT_NAME'

defineOptions({
  name: 'Xzx$NAME',
})

const props = defineProps(${NORMALIZED_NAME}Props)

// init here
</script>
EOF

cat >$DIRNAME/src/$INPUT_NAME.ts <<EOF
import { buildProps } from '@xzx-design/utils'

import type { ExtractPropTypes } from 'vue'
import type $NAME from './$INPUT_NAME.vue'

export const ${NORMALIZED_NAME}Props = buildProps({})

export type ${NAME}Props = ExtractPropTypes<typeof ${NORMALIZED_NAME}Props>
export type ${NAME}Instance = InstanceType<typeof $NAME>
EOF

cat <<EOF >"$DIRNAME/index.ts"
import { withInstall } from '@xzx-design/utils'
import $NAME from './src/$INPUT_NAME.vue'

export const Xzx$NAME = withInstall($NAME)
export default Xzx$NAME

export * from './src/$INPUT_NAME'
EOF

cat >$DIRNAME/__tests__/$INPUT_NAME.test.tsx <<EOF
import { mount } from '@vue/test-utils'
import { describe, expect, test } from 'vitest'
import $NAME from '../src/$INPUT_NAME.vue'

const AXIOM = 'Rem is the best girl'

describe('$NAME.vue', () => {
  test('render test', () => {
    const wrapper = mount(() => <$NAME>{AXIOM}</$NAME>)

    expect(wrapper.text()).toEqual(AXIOM)
  })
})
EOF
