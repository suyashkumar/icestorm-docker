FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y build-essential clang bison flex libreadline-dev \
                     gawk tcl-dev libffi-dev git mercurial graphviz   \
                     xdot pkg-config python python3 libftdi-dev
RUN git clone https://github.com/cliffordwolf/icestorm.git icestorm
RUN cd icestorm; make -j$(nproc); make install
RUN git clone https://github.com/cseed/arachne-pnr.git arachne-pnr
RUN cd arachne-pnr; make -j$(nproc); sudo make install
RUN git clone https://github.com/cliffordwolf/yosys.git yosys
RUN cd yosys; make -j$(nproc); sudo make install 
