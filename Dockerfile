FROM frolvlad/alpine-glibc:alpine-3.10_glibc-2.30

ENV PATH /usr/local/texlive/2019/bin/x86_64-linux:$PATH

RUN apk add --no-cache perl fontconfig-dev freetype-dev && \
    apk add --no-cache --virtual .fetch-deps wget xz tar && \
    mkdir /tmp/install-tl-unx && \
    wget -qO - ftp://tug.org/historic/systems/texlive/2019/install-tl-unx.tar.gz | \
    tar -xz -C /tmp/install-tl-unx --strip-components=1 && \
    printf "%s\n" \
      "selected_scheme scheme-basic" \
      "option_doc 0" \
      "option_src 0" \
      > /tmp/install-tl-unx/texlive.profile && \
    /tmp/install-tl-unx/install-tl \
      --profile=/tmp/install-tl-unx/texlive.profile && \
    tlmgr install \
      collection-basic collection-latex \
      collection-latexrecommended collection-latexextra \
      collection-fontsrecommended collection-langjapanese \
      latexmk dvipdfmx && \
    rm -fr /tmp/install-tl-unx && \
    apk del .fetch-deps

WORKDIR /workdir
