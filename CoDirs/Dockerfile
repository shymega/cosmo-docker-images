FROM rustembedded/cross:thumbv7em-none-eabihf-0.2.1

ENV DEP_LV_CONFIG_PATH

RUN apt-get update \
    && apt-get install -y libclang-dev llvm-dev clang \
         g++-multilib libc6-dev-i386
