FROM ubuntu:22.04

RUN apt-get update \
    # && apt install software-properties-common apt-transport-https wget \
    # && wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - \
    # && sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" \
    # && sudo apt install code
    && apt-get install --assume-yes make gcc g++ cmake clang git libssl-dev libxml2 libxml2-dev openssl sudo curl r-base python3 wget\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/

RUN curl -fsSL https://code-server.dev/install.sh | sh
# install VS Code extensions
RUN code-server --install-extension redhat.vscode-yaml \
                --install-extension ms-python.python \
                --install-extension reditorsupport.r \
                --install-extension rdebugger.r-debugger \
                --install-extension eamodio.gitlens \
                --install-extension ms-azuretools.vscode-docker \
                --install-extension github.vscode-github-actions \
                --install-extension github.vscode-pull-request-github \
                --install-extension ms-vsliveshare.vsliveshare \
                --install-extension tomoki1207.pdf

# FROM rocker/rstudio:4

# RUN apt-get update \
#     && apt-get install -y make gcc g++ cmake clang git libssl-dev libxml2 libxml2-dev openssl sudo wget curl \
#     && apt-get install --assume-yes make gcc g++ cmake clang git libssl-dev libxml2 libxml2-dev openssl sudo wget curl \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/

# # set CRAN repo to the RStudio mirror
# RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'))" >> /usr/local/lib/R/etc/Rprofile.site
# RUN R -e 'options(download.file.method = "libcurl")'
# RUN R -e 'Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")'
# RUN R -e "install.packages(c('remotes', 'parallel', 'snowfall', 'purrr', 'furrr', 'pak', 'devtools', 'dplyr', 'ggplot2', 'data.table', 'magrittr', 'mvtnorm', 'scales', 'plyr', 'grid', 'png', 'utf8', 'tidyverse', 'httr'))"

# RUN R -e 'pak::pkg_install("r4ss/r4ss")' \
#     && R -e 'pak::pkg_install("jabbamodel/ss3diags")' \
#     && R -e 'pak::pkg_install("ss3sim/ss3sim")'
#  #   && R -q -e "pak::pkg_intall('flr/FLCore')" \
#  #   && R -q -e "pak::pkg_intall('flr/ggplotFL')" \
#  #   && R -q -e "pak::pkg_intall('flr/kobe')"

# # CMD ["/bin/bash"]
