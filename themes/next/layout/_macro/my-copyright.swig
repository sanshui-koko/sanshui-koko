{% if page.copyright %}
<div class="my_post_copyright">
  <script src="https://cdn.bootcss.com/clipboard.js/1.5.10/clipboard.min.js"></script>

  <!-- JS库 sweetalert 可修改路径 -->
  <script src="https://cdn.bootcss.com/jquery/1.7.1/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet">

  <p><span>本文标题:</span>{{ page.title }}</a></p>
  <p><span>文章作者:</span>{{ theme.author }}</a></p>
  <p><span>发布时间:</span>{{ page.date.format("YYYY年MM月DD日 - HH:mm:ss") }}</p>
  <p><span>最后更新:</span>{{ page.updated.format("YYYY年MM月DD日 - HH:mm:ss") }}</p>
  <p><span>原始链接:</span><a href="{{ url_for(page.path) }}" title="{{ page.title }}">{{ page.permalink }}</a>
    <span class="copy-path"  title="点击复制文章链接"><i class="fa fa-clipboard" data-clipboard-text="{{ page.permalink }}"  aria-label="复制成功！"></i></span>
  </p>
  <p><span>许可协议:</span><i class="fa fa-creative-commons"></i> <a rel="license" href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank" title="Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)"> BY-NC-ND 4.0 </a> 转载请保留原文链接及作者。</p>
</div>
<script>
    var clipboard = new Clipboard('.fa-clipboard');
    clipboard.on('success', $(function(){
      $(".fa-clipboard").click(function(){
        swal({
          toast: true,
          position: 'top-end',
          title: "复制成功",
          timer: 1100,
          button: false,
          icon: 'success',
        });
      });
    }));
</script>
{% endif %}
