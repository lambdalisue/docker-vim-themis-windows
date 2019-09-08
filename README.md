# vim-themis-windows

A docker image for running [vim-themis][] on [Vim][] (Windows).

## Usage

```
docker run --rm --volume $(pwd):C:\\volume -it lambdalisue/vim-themis-windows
```

If you are using [StefanScherer/windows-docker-machine](https://github.com/StefanScherer/windows-docker-machine), you would probably need to add `C:` prefix on volume like

```
docker run --rm --volume C:$(pwd):C:\\volume -it lambdalisue/vim-themis-windows
```

[vim-themis]: https://github.com/thinca/vim-themis
[Vim]: https://github.com/vim/vim
