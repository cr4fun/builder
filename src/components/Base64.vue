<template>
<div class="base64-upload">
  <img :src="src"
    :style="imageStyle"/>
  <input class="el-input__inner" type="file"
    accept="image/*"
    @change="onChange" />
</div>
</template>

<script>
export default {
  props: {
    imageSrc: String,
    imageStyle: Object
  },
  data() {
    return {
      src: this.imageSrc
    }
  },
  methods: {
    onChange(event) {
      if (event.target.files && event.target.files[0]) {
        let file = event.target.files[0]
        let reader = new FileReader()
        reader.addEventListener('load', e => {
          this.src = e.target.result
          let [, base64] = this.src.split(',')
          this.$emit('change', {
            size: file.size,
            type: file.type,
            name: file.name,
            base64: base64
          })
        })
        reader.readAsDataURL(file)
      }
    }
  }
}
</script>

<style scoped>
.base64-upload {
  position: relative;
}
img {
  width: 40px;
  height: 40px;
  float: left;
  clear: left;
}
input {
  float: left;
  clear: left;
}
</style>