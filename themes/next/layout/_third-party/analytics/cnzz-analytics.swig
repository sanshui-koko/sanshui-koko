{% if theme.cnzz_siteid %}
  {% if theme.cnzz_siteid %}
    <div style="display:none">
      var cnzz_s_tag = document.createElement('script');
      cnzz_s_tag.type = 'text/javascript';
      cnzz_s_tag.async = true;
      cnzz_s_tag.charset = "utf-8";
      cnzz_s_tag.src = "http://w.cnzz.com/c.php?id={{ theme.cnzz_siteid }}&async=1";
      var root_s = document.getElementsByTagName('script')[0];root_s.parentNode.insertBefore(cnzz_s_tag, root_s);
    </div>
  {% endif %}
{% endif %}
