# nvim

ssh-keygen:

```bash
ssh-keygen -t ed25519
```

install nvim:

```bash
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git

git clone https://github.com/neovim/neovim

cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

git checkout stable

sudo make install

```


install packer:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

clone this repo:

```bash
git clone git@github.com:Blacktea1501/nvim.git ~/.config/nvim
```
