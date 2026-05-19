<template>
  <div class="layout-container">
    <Main/>
  </div>
</template>

<script setup lang="ts">
import {defineAsyncComponent} from 'vue'

const Main = defineAsyncComponent(() => import('@/layout/component/main.vue'))
</script>

<style scoped></style>
