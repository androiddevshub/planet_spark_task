<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="8">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>Create short url</span>
          </div>
          <el-input
            type="textarea"
            :rows="2"
            placeholder="Enter your url"
            v-model="url_text">
          </el-input>
          <span><button @click="createShortLink()">Short Url</button></span>
        </el-card>
      </el-col>
      <el-col :span="16">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>All links</span>
          </div>
          <div v-for="(value,index) in shortUrlList" :key="index" class="text item">
            <br/>
            <el-card shadow="never">
              <p>Main Url</p>
              <el-link>{{value.url}}</el-link>
              <p>Short Url</p>
              <el-link :href="value.url" target="_blank" type="primary">{{baseUrl + '/s/'+ value.short_url}}</el-link>
              <!-- <el-link href="https://element.eleme.io" target="_blank">default</el-link> -->
            </el-card>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script src="./short_url.js"></script>
<style src="./short_url.css" scoped></style>