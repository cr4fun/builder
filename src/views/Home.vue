<template>
  <div class="home">
    <img alt="Vue logo" width="80" src="../assets/logo.png">
    <el-form :model="blockchain" label-width="80px">
      <el-form-item label="区块链名称" label-width="100">
        <el-input v-model="blockchain.name"></el-input>
      </el-form-item>
      <el-form-item label="区块链logo" label-width="100">
        <el-input v-model="blockchain.logo"></el-input>
      </el-form-item>
      <el-form-item label="Token发行总量" label-width="100">
        <el-input v-model="blockchain.total"></el-input>
      </el-form-item>
      <el-form-item label="基金会地址" label-width="100">
        <el-input v-model="blockchain.address"></el-input>
      </el-form-item>
      <el-button type="primary" @click="build" plain>build</el-button>
    </el-form>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";
var FileSaver = require("file-saver");
export default {
  name: "home",
  data() {
    return {
      blockchain: {}
    };
  },
  components: {
    HelloWorld
  },
  methods: {
    build() {
      var file = new File([JSON.stringify(this.blockchain)], "config.json", {
        type: "application/json;charset=utf-8"
      });
      FileSaver.saveAs(file);
    }
  }
};
</script>
