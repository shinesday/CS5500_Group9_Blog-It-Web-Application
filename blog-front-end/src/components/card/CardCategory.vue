<template>

  <el-card :body-style="{ padding: '8px 18px' }">
    <div slot="header" class="me-category-header">
      <span>Newest Articles</span>
    </div>

    <ul class="me-category-list">
      <li class="me-category-item" v-for="l in 3" :key="l"><a>Title 1 Title 1</a></li>
      <li class="me-category-item" v-for="l in 3" :key="l"><a>Built element-ui using Vue as front-end</a></li>

    </ul>
  </el-card>

</template>

<script>
  export default {
    name: 'CardCategory',
    data() {
      return {}
    },
    methods: {}
  }
</script>

<style scoped>
  .me-category-header {
    font-weight: 600;
  }

  .me-category-list {
    list-style-type: none;
  }

  .me-category-item {
    padding: 4px;
    font-size: 14px;
    color: #5FB878;
  }

  .me-category-item a:hover {
    text-decoration: underline;
  }
</style>
