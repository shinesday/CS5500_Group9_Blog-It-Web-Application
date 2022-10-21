<template>
  <div v-title :data-title="title">
    <el-container class="me-area">
      <el-main class="me-main">
        <!--<el-steps class="me-log-box" :space="100"  direction="vertical">
                 <el-step title="Step 1" status="process"  icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 2" status="process" icon="el-icon-time"></el-step>
                 <el-step title="Step 3" status="process" icon="el-icon-time" description="test"></el-step>
                   <el-step title="Step 3" status="process" icon="el-icon-time" description="test"></el-step>

                 <el-step title="Step 3" status="process" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" status="process" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" status="process" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" status="process" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" icon="el-icon-time" description="test"></el-step>
                 <el-step title="Step 3" icon="el-icon-time" description="test"></el-step>

              </el-steps>-->
        <pre>

      ```
      # nothing

      ```
			 </pre>
      </el-main>
    </el-container>
  </div>
</template>

<script>
  export default {
    name: 'Log',
    data() {
      return {}
    },
    computed: {
      title (){
        return 'Blog - Group 9'
      }
    }
  }
</script>

<style scoped>
  .el-container {
    width: 700px;
  }

  .me-main {
    overflow: hidden;
  }

  .me-log-box {
    margin-left: 30%;
    margin-top: 20px;
  }

</style>
