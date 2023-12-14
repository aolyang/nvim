# Nvim config

some of code in this repo of nvim config come from `NvChad`, to improve more cutomization.

## folder structure

```
├── doc # somethings better than nothing
│   ├── deps.md
│   └── memos.md
├── init.lua
├── lazy-lock.json
├── lua
│   ├── core  # core configs, default configs
│   └── plugins # plugins folder
│         └── plugin-name
│               ├─ config.lua # plugin config
│               └─ init.lua # plugin init setup
│ 
└── README.md
```

## requirements

1. A nerd font, https://www.nerdfonts.com/font-downloads
2. gcc or clang and make
    eg: [fzf](https://github.com/nvim-telescope/telescope-fzf-native.nvim?tab=readme-ov-file#installation) lazy build  
    recommend  [msys2](https://www.msys2.org/) for windows
3. install tree-sitter global excutable command:
    ```bash
    > yarn global add tree-sitter-cli
    > cargo install tree-sitter-cli
    ```
4. rely on your environment, recommend `winget`, `yarn` or `npm` or `pnpm`, rust `cargo`


