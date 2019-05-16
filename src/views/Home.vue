<template>
  <div class="home">
    <h2>SDAG 区块链生成器</h2>
    <p>点击“立刻生成”按钮后，会下载一个config.json文件。在config.json文件的同级目录下打开终端，输入：</p>
    <p>
      <pre>
      curl -fsSL https://raw.githubusercontent.com/smart-dag/builder/master/install.sh | bash </pre>即可快速启动你自己的区块链。</p>
    <!-- <img alt="Vue logo" width="80" src="../assets/logo.png"> -->
    <el-form :model="blockchain" label-width="80px">
      <el-form-item label="区块链名称" label-width="100">
        <el-input v-model="blockchain.name"></el-input>
      </el-form-item>
      <el-form-item label="区块链logo（点击选择图片）" label-width="100">
        <base64-upload
          imageSrc="data:image/png;base64,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"
          @change="onChangeImage"
        ></base64-upload>
      </el-form-item>
      <el-form-item label="Token发行总量" label-width="100">
        <el-input v-model="blockchain.total"></el-input>
      </el-form-item>
      <el-form-item label="基金会地址（你的SDAG钱包地址）" label-width="100">
        <el-input v-model="blockchain.address"></el-input>
      </el-form-item>
      <el-button type="primary" @click="build" plain>立刻生成</el-button>
    </el-form>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";
// import VueBase64FileUpload from "vue-base64-file-upload";
import Base64Upload from "@/components/Base64.vue";
var FileSaver = require("file-saver");
export default {
  name: "home",
  data() {
    return {
      blockchain: {
        name: "我的区块链",
        total: 100000,
        address: "INP2VBII4B3Y7KRAVLUBU6DIPMLUFXT2"
      },
      customImageMaxSize: 1
    };
  },
  components: {
    HelloWorld,
    Base64Upload
  },
  methods: {
    build() {
      var file = new File([JSON.stringify(this.blockchain)], "config.json", {
        type: "application/json;charset=utf-8"
      });
      FileSaver.saveAs(file);
    },
    onChangeImage(img) {
      console.log(img.base64);
      this.blockchain.logo = img.base64.toString();
    }
  }
};
</script>
<style scoped>
p {
  text-align: left;
}
</style>

