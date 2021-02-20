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
-------------------------
#撤销修改,回到最近依次add 或commit 状态
git checkout -- filename 
# 撤销暂存区修改
git reset HEAD filename
