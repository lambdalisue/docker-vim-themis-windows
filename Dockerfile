# escape=`
ARG TAG="latest"
FROM lambdalisue/vim-ci-windows:${TAG}
MAINTAINER lambdalisue <lambdalisue@hashnote.net>

# Install scoop
RUN Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# Install git
RUN scoop install git --global; `
    git clone --depth 1 --single-branch https://github.com/thinca/vim-themis C:\ProgramData\github.com\thinca\vim-themis; `
    git clone --depth 1 --single-branch https://github.com/vim-jp/vital.vim C:\ProgramData\github.com\vim-jp\vital.vim

ENV THEMIS_HOME=C:\\ProgramData\\github.com\\thinca\\vim-themis `
    THEMIS_VIM=vim

RUN $env:PATH = 'C:\ProgramData\github.com\thinca\vim-themis\bin;' + $env:PATH; `
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine); `
    Get-Command themis | Format-List

ENTRYPOINT ["C:\\ProgramData\\github.com\\thinca\\vim-themis\\bin\\themis.bat"]
CMD ["--runtimepath", "C:\\ProgramData\\github.com\\vim-jp\\vital.vim"]
