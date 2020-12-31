import axios from 'axios'
export default{
  name: "short_url",
  data(){
    return{
      baseUrl: window.location.origin,
      url_text: '',
      shortUrlList: []
    }
  },
  created(){
    this.showAllUrls();
  },
  methods: {
    createShortLink(){
      console.log('freferf')
      if(this.url_text === null || this.url_text === ""){
        this.$notify.error({
          title: 'Error',
          message: 'Input is empty',
          offset: 100
        });
      }else{
        return axios
        .post(`${this.baseUrl}/api/short_urls`,{
          url: this.url_text
        })
        .then(response => {
          if (response.data.status_code){
            this.url_text = null
            this.$notify({
              title: 'Success',
              message: 'Short url created',
              type: 'success',
              offset: 100
            });
            this.showAllUrls();
          }
        })
        .catch(e => {
          this.$notify.error({
            title: 'Error',
            message: 'Something went wrong',
            offset: 100
          });
          
        });
        
      }
    },
    showAllUrls(){
      return axios
        .get(`${this.baseUrl}/api/short_urls`)
        .then(response => {
          this.shortUrlList = response.data.data
          this.shortUrlList.forEach((element,index) => {
            // console.log(element)
            element["short_url_link"] = `${this.baseUrl}/s/${element.short_url}`
          });
          console.log(this.shortUrlList)
        })
        .catch(e => {
          console.log(e)
        });
    },
    createShortUrl(){

    }
  }
}