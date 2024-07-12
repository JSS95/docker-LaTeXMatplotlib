FROM python:latest

LABEL repository="https://github.com/JSS95/docker-latex-matplotlib" \
      maintainer="Jisoo Song <jeesoo9595@snu.ac.kr>"

RUN apt-get update && \
    apt-get install -y \
        ffmpeg \
        inkscape

# Install TeXLive
RUN cd /tmp && \
    wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    zcat < install-tl-unx.tar.gz | tar xf - && \
    cd $(ls | grep install-tl-[0-9]*) && \
    perl ./install-tl --no-interaction --no-doc-install --no-src-install --scheme=scheme-basic && \
    ln -s $(find /usr/local/texlive/[0-9]*/bin/ -mindepth 1 | head -1) /usr/local/texlive/bin
ENV PATH="/usr/local/texlive/bin:${PATH}"

# Setup TeXLive
RUN tlmgr update --self && \
    tlmgr install \
        type1cm \
        cm-super \
        underscore \
        dvipng \
        svg

RUN pip install matplotlib
RUN python3 -c "import matplotlib.font_manager"
