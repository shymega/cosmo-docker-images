FROM rustembedded/cross:thumbv7em-none-eabihf-0.2.1

RUN apt-get update \
    && apt-get install --no-install-recommends -y libclang-dev llvm-dev clang \
         g++-multilib libc6-dev-i386 gcc-arm-none-eabi
