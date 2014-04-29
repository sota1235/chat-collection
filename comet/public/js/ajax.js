var Ajax = function(url) {
  this.url = url;

  // インスタンス生成後,オーバライド
  this.on_get = null;

  this.start() {
    this.get();
  };

  this.post = function(param){
    $.post(this.url, param, this.on_get(data));
  };

  this.get = function() {
    $.ajax(
        {
          url : this.url,
          success : function(data) {
            if(data) {
              if(this.on_get && typeof this.on_get == 'function') this.on_get(data);
            }
            this.get();
          },
          error : function(req, stat, e) {
            setTimeout(this.get, 10000);
          },
          complete : function(e){
          },
          type : 'GET',
          timeout : 60000
        }
        );
  };
};
