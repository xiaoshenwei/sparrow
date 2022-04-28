# 安装

```shell
	git clone https://github.com/xiaoshenwei/sparrow.git
	cd sparrow
	echo "export SPARROW_SRC=$PWD" >> $HOME/.${SHELL##*/}rc
    echo "PATH=$PATH:$PWD/sbin:$PWD/bin" >> $HOME/.${SHELL##*/}rc
```

## 以下为可选

使用 root 账户运行

```shell
sh $SPARROW_SRC/bin/install
```

## zsh + tmux + vim

```shell
cd $SPARROW_SRC/share/etc/skel
cp -r . ~
```
