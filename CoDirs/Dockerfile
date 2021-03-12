FROM rustembedded/cross:thumbv7em-none-eabihf-0.2.1

RUN apt-get update \
    && apt-get install --no-install-recommends -y libclang-dev llvm-dev clang \
         g++-multilib libc6-dev-i386 \
    && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
