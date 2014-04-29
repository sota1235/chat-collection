var Ajax = function(url) {
  this.url = url;
  var self = this;

  // インスタンス生成後,オーバライド
  this.on_get = null;

  this.start = function() {
    self.get();
  };

  this.post = function(param){
    $.post(self.url, param);
  };

  this.get = function() {
    $.ajax(
        {
          url : self.url,
          success : function(data) {
            if(data) {
              if(self.on_get && typeof self.on_get == 'function') self.on_get(data);
            };
            self.get();
          },
          error : function(req, stat, e) {
            setTimeout(self.get, 10000);
          },
          complete : function(e){
          },
          type : 'GET',
          timeout : 60000
        });
  };
};
