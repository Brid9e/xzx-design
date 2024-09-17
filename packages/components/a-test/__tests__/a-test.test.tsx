import { mount } from '@vue/test-utils'
import { describe, expect, test } from 'vitest'
import ATest from '../src/a-test.vue'

const AXIOM = 'Rem is the best girl'

describe('ATest.vue', () => {
  test('render test', () => {
    const wrapper = mount(() => <ATest>{AXIOM}</ATest>)

    expect(wrapper.text()).toEqual(AXIOM)
  })
})
