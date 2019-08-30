---
title: vue.js图片转Base64上传图片并预览
tags: vue.js
categories: vue.js-Base64
copyright: true
date: 2019-08-29 16:30:00
---

# vue.js图片转Base64上传图片并预览

------

>&emsp;&emsp;对于前端人员来说，图片处理是一个很常见的需求，由于图片稍微特殊，现在多数做法都是使用调用ajax接口通过http方法来提交，例如post方法提交，后台处理后返回一个图片路径给前端，前端根据这个路径写入img标签，但是基于当前的前后端分离的开发模式下，前后端代码往往不在同一个系统目录下，而且部署时可能liunx路径与windows路径不一样，这样后期路径更改可能会导致维护困难问题出现。  
>&emsp;&emsp;针对这种问题，这里使用图片转base64格式，再发给后端，后端只需将转码结果存入数据库即可，前端调用接口直接获取到base64数据直接写入img src 标签即可。 


*下面是代码实现思路：*
<!--more-->
```javascript
uploadFiles(){ 
 var That=this; 
 let file=this.$refs.upload.$refs['upload-inner'].$refs.input; //获取文件数据 
 let fileList=file.files;   
 var imgFile; 
 let reader = new FileReader();     //html5读文件 
 reader.readAsDataURL(fileList[0]); //转BASE64    
 reader.onload=function(e) {        //读取完毕后调用接口  
  imgFile = e.target.result;  
  let obj={    
    id: "loginLogo",  
    configGroup: "logo",  
    configItem: "loginLogo", 
    itemValue: imgFile   
  }  
  return BaseApi.uploadFiles(obj).then((res)=>{   
   if (res.status=='SUCCESS') {    
    AlertBox('图片上传成功！','success',true).then(()=>{      
  	return That.getSysLogo();   //调用获取数据接口     
   });   
   }else{    
    Alert('图片上传失败',res);   
   }  
  }) 
 }; 
 }
```
