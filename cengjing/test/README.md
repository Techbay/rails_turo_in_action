How to update file(s) to Github
1. git status
2. git add -A
3. git commit -a -m "Commit" 
4. git push
5. rails server -b $IP -p $POR 启动
简单介绍下github上贡献代码的流程:http://caok1231.com/git/2013/05/06/fork-in-github.html
1.fork

从你看中的项目中fork一份到你自己的github中。

比如：

source/web6ey   ----fork--->     you/web6ey

2.clone到本地

git clone git@github.com:you/web6ey.git

3.更新自己代码，与原项目保持一致

git remote add upstream https://github.com/source/web6ey.git

使用 git remote -v 查看下 origin 和 upstream 对应的是否正确

    origin 对应的应该是自己github上的地址，即you/web6ey
    upstream 对应的应该是原项目的地址，即source/web6ey

更新自己代码

从原项目 source/web6ey 取最新的代码合并到自己本地的master分支上

git pull upstream master

自己觉得这么来最简单些，也可以参考我写的另一篇github-fork,那个更加正规。
4.在本地修改代码，开发

每次开发新的功能前和开发完pull之前，都建议从原项目中取一下最新的代码，这样能最大程度的减少代码冲突

git pull upstream master
处理冲突(若有冲突)
修改代码，开发....
git pull upstream master
处理冲突(若有冲突)

如果处理新的功能，或者自己没把握的功能话建议把修改的代码放在一个新建的分支上，比如下面这样

1.本地新建分支
git checkout -b add_sth
2.把本地的 add_sth 分支保存的 github 上
git push origin add_sth
3.删除本地 add_sth 分支
git branch -D add_sth
4.删除 github 上的 add_sth 分支
git push origin :add_sth

5.上传代码到自己的github

git push origin master
#如果是分支的话
git push origin add_sth(分支名)

pull功能后，上自己的github上确认下自己刚才的修改
6.pull request

将自己的代码(you/web6ey)pull至原项目(source/web6ey)

source/web6ey       <--------      you/web6ey
master                             master(或者你修改的分支)

增加自己修改的描述，再确认一遍自己的修改，再“确定”
7.等待原项目(source/web6ey)主人的merge
# rails_turo_in_action
rails tutorial in action
