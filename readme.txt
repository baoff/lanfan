Git
# git 配置
git config --global user.name ""
git config --global user.email ""
# 初始化仓库
git init
# 仓库区分
工作区working tree
暂存区 index/stage
仓库 respository 
# 添加文件
git add filename
# 提交到仓库,多次添加后一次提交
git commit -m "说明"
# 查看当前仓库状态
git status
# 查看文件不同,查看的是工作区和index 的区别
git diff filename 
# 查看文件不同,查看的是index和respository的区别
git diff --cached filename
# 查看文件不同,查看的是working tree和respository的区别
git diff HEAD -- filename
# 提交修改
git add filename
git commit -m ""
#版本库提交日志
git log
# commit id 
# HEAD 最新的提交
# HEAD^ 上一个版本，HEAD^^上上个版本，依次类推/ HEAD~10往上10个版本
# 版本回退
git reset --hard HEAD^
git reset commit id 到指定版本
# 查看文件内容
cat filename
#查看 git 操作命令记录
git reflog 
#撤销工作区修改,回到最近依次add 或commit 状态
git checkout -- filename 
# 撤销暂存区修改,撤销add 命令
git reset HEAD filename

-------------------------------------
GitHub
git 和GitHub传输是通过SSH加密的
git 生成秘钥对
ssh-keygen -t rsa -C "email" 生成.ssh 目录(id_rsa 私钥,id_rsa.pub 公钥)
添加id_rsa.pub文件内容到github 添加ssh keys 
本地仓库和远程仓库关联
git remote add origin(远程仓库名称) https://github.com/baoff/lanfan.git
把本地推送到远程
git push -u origin master

克隆远程仓库
git clone https://github.com/baoff/lanfan.git  (https 协议，慢，需要输入密码)
git clone git@github.com:baoff/lanfan.git  ssh 协议




