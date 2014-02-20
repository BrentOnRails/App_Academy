post_body = {
  :post => {
    :body => "body from restclient"
  }
}
p RestClient.post("http://localhost:3000/posts", post_body).body
