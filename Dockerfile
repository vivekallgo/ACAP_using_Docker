From ubuntu:18.10

#Install dependencies
RUN apt-get update && apt-get install -y \
    gdb\
    curl\
    libpython2.7\
    perl\
    make\
    libtinfo-dev\
    libglib2.0-dev\
    openssh-server\
	libtinfo5\
	libncurses5\
    openssh-client

#Create Folder and extract the SDK in it
RUN mkdir acap
ADD AXIS_Embedded_Development_SDK_2_0_3.tar.gz /acap

#Install the SDK
RUN chmod a+x /acap/install-sdk-2_0_3.bin
RUN yes | ./acap/install-sdk-2_0_3.bin

#Install the compilers
RUN dpkg -i  /axis/emb-app-sdk_2_0_3/tools/compiler/arm/comptools-arm-r21_1.21-1_amd64.deb && \
    dpkg -i  /axis/emb-app-sdk_2_0_3/tools/compiler/armhf/comptools-armhf-r27_1.27-1+debian7~1_amd64.deb && \
    dpkg -i  /axis/emb-app-sdk_2_0_3/tools/compiler/mips/comptools-mips-r23_1.23-3_amd64.deb

#Create a folder and add the libreadline6_6 required by the gdb
RUN mkdir /axis/debug
ADD libreadline6_6.3-8ubuntu2_amd64.deb /axis/debug/

#Install the libreadline6_6
RUN dpkg -i /axis/debug/libreadline6_6.3-8ubuntu2_amd64.deb

#Add and extract the debug tools to the debug folder
ADD Axis_acap_debug_tools_150525.tar.gz /axis/debug

#Install the debug tools (gdb)
RUN dpkg -i  /axis/debug/Axis_acap_debug_tools/host/gdb-arm_7.5-1_amd64_wheezy.deb && \
    dpkg -i  /axis/debug/Axis_acap_debug_tools/host/gdb-cris_7.5-1_amd64_wheezy.deb && \
    dpkg -i  /axis/debug/Axis_acap_debug_tools/host/gdb-mips_7.5-1_amd64_wheezy.deb

#Make the gdbserver excutable and ready to be upload to the Axis device
RUN chmod a+x /axis/debug/Axis_acap_debug_tools/target/gdbserver_arm && \
    chmod a+x /axis/debug/Axis_acap_debug_tools/target/gdbserver_crisv32 && \
    chmod a+x /axis/debug/Axis_acap_debug_tools/target/gdbserver_mips32

#Delete the acap folder
RUN rm -rf /acap
