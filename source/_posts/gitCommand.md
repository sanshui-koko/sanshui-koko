title: Git常用命令
tags:
  - 速查手册
categories:
  - 速查手册
copyright: true
date: 2019-06-17 15:00:00

---
![](https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1396549994,3923445978&fm=26&gp=0.jpg)

<!--more-->

## [](#安装-amp-配置 "安装&amp;配置")安装&amp;配置

### [](#install "install")install

安装这里就不再多讲了，网上有许多教程，可以参考：

* [廖雪峰-安装Git](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/00137396287703354d8c6c01c904c7d9ff056ae23da865a000)
* [Git 官方教程](https://git-scm.com/book/zh/v1/%E8%B5%B7%E6%AD%A5-%E5%AE%89%E8%A3%85-Git)



### [](#config "config")config
```python
git config --global user.name "Your Name"
git config --global user.email "email@example.com"
```
> 注意 git config 命令的 –global 参数，用了这个参数，表示你这台机器上所有的 Git 仓库都会使用这个配置，当然也可以对某个仓库指定不同的用户名和 Email 地址。

## [](#获取-amp-创建项目 "获取&amp;创建项目")获取&amp;创建项目

### [](#init "init")init
```python
git init
```
> 初始化一个仓库，可以在任意目录中执行，表示对该目录使用 git 进行版本控制

### [](#clone "clone")clone
```python
git clone [url]
```

## [](#基本的快照 "基本的快照")基本的快照

### [](#add "add")add
```python
git add <path>
```
> 可以添加一个文件如 `git add README.md` 或一个目录 `git add config` 或使用通配符添加所有文件 `git add *`   — 添加到暂存区。

### [](#status "status")status
```python
git status
```
> 查看你的文件在暂存区和工作目录的状态，默认是较为详细的显示，并提示你可以用何种命令完成你接下来可能要做的事情。
```python
$ git status -s
```

较为简单的输出当前的状态，如：

```python
$ git status -s
M  README.md
 D hello.rb
?? world.java
```
> 你可以看到，在简短输出中，有两栏。第一栏是暂存区的，第二栏则是工作目录的。这里表示： 
> 
> *   `README.md` 在暂存区中的状态是 `modify`
> *   `hello.rd` 在工作目录中的状态是 `delete`
> *   `world.java` 还未添加到版本控制。

### [](#diff "diff")diff
```python
git diff            # 工作目录和暂存区
git diff --cached   # 暂存区和本地仓库
git diff HEAD 	    # 工作目录和本地仓库
git diff --stat     # 显示信息摘要
```
> 执行 git diff 来查看执行 git status 的结果的详细信息 —— 一行一行地显示这些文件是如何被修改或写入缓存的。

### [](#commit "commit")commit
```python
git commit -m "commit message"    ## 将暂存区中的内容提交到本地仓库
git commit -am "commit message"   ## 免去了 git add 进行 commit，需要 tracked 状态
```
> 执行 git commit 记录缓存区的快照到本地仓库。

### [](#reset "reset")reset
```python
git reset HEAD -- file    # 将本地仓库的当前版本恢复到暂存区
git reset HEAD~1 -- file  # 将本地仓库的上个版本恢复到暂存区
```
> `git reset HEAD -- file` 也可以理解为放弃暂存区中的修改

### [](#rm-mv "rm, mv")rm, mv
```python
git rm           # 将文件从暂存区和工作目录删除，-f 为强制删除
git rm --cached <path> # 将文件从暂存区中删除
git mv <old_path> <new_path>
```
> git rm 用来删除文件、目录。git mv 命令用于移动或重命名一个文件、目录。

## [](#分支和合并 "分支和合并")分支和合并

### [](#branch "branch")branch
```python
git branch                 # 列出所有分支
git branch (branchname)    # 创建新分支。
git branch -d (branchname) # 删除分支
```

### [](#checkout "checkout")checkout
```python
git checkout (branch) # 切换分支
git checkout -b (branchname) # 创建新分支，并立即切换到它
```

### [](#merge "merge")merge
```python
git merge <branchname>  ## 将分支合并到当前分支  
git merge --no-ff <branchname> ## 不适用 Fast-Forword 方式合并
```
> 使用 git merge 将另一个分支并入当前的分支中去。 关于 `--no-ff` 可参考 [Git 分支管理策略](http://www.ruanyifeng.com/blog/2012/07/git.html)

### [](#log-amp-reflog "log &amp; reflog")log &amp; reflog
```python
git log		   # 当前分支的 log
git log --oneline  # 简要 log
git log --graph    # 查看各种分支之间的日志

git reflog 	   # 查看所有分支的所有操作记录(包括 reset)
```
> 显示一个分支中提交的更改记录

### [](#tag "tag")tag
```python
git tag 		       # 查看所有标签
git tag -a <tagname> -m "blablabla..."  # 创建一个标签，并附上信息
git tag -d <tagname>    		       # 删除本地标签
```

## [](#远程仓库 "远程仓库")远程仓库

### [](#remote "remote")remote
```python
git remote -v 			# 查看已关联的所有的远程仓库
git remote add  [alias] [url]   # 添加一个新的远程仓库
git remote rm [alias] 		# 删除远程仓库的管理
```

### [](#fetch-pull "fetch, pull")fetch, pull
```python
# 将 origin 仓库的 master 分支与本地的 next 分支进行合并
git pull origin master:next

# 将 origin 仓库的 next 分支与本地的 master 分支进行合并
git pull origin next:master
```

### [](#push "push")push
```python
# 推到 origin 仓库的 master 分支
git push origin master
# 将本地仓库的 master 与远程仓库进行关联，以后 push 就不用指定分支了。
git push -u origin master
```

## [](#拓展 "拓展")拓展

### [](#git-分支合并策略 "git 分支合并策略")git 分支合并策略

在 Git 中有三种分支合并方式：

*   `git merge fast-forword`： 当条件允许时，git 直接把 HEAD 指针指向合并分支的头（默认）
*   `git merge --no-ff`：不适用 `fast-forward` 方式合并，保留分支的 commit 历史
*   `git merge --squash`：使用 `squash` 方式合并，将多次分支的 commit 历史记录压缩为一次

![图例](https://cdn.jun6.net/201801201231_759.png)

