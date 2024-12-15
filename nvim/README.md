# neovim

Репозиторий содержит конфигурацию neovim для работы с golang, python и markdown на базе фрейморвка NvChad.

## Особенности

- Поддержка golang
    - Поддержка golangci-lint
    - Поддержка тестирования и отладки
- Поддержка python
- Поддержка markdown

## Установка

1. Установите [neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)

2. Установите [NvChad v2.0](https://nvchad.com):

```sh
$ git clone --branch v2.0 https://github.com/NvChad/NvChad ~/.config/nvim
```

3. Создайте символическую ссылку:

```sh
$ ln -s ~/.dotfiles/nvim ~/.config/nvim/lua/custom
```

4. Выполните установку плагинов при помощи `:Lazy`

5. Выполните установку LSP при помощи `:MasonInstallAll`
