# Mengecek apakah OS adalah Windows
ifdef OS
    TOOLCHAIN = +stable-i686-pc-windows-msvc
    BINARYNAME = cef_ui.dll
    OUPUTNAME = cef_ui.dll
    # Menggunakan 'copy' untuk Windows
    CP_RELEASE = copy .\target\release\$(BINARYNAME) .\plugins\$(OUPUTNAME)
    CP_DEBUG = copy .\target\debug\$(BINARYNAME) .\plugins\$(OUPUTNAME)
else
    # Jika bukan Windows, cek apakah Linux
    ifeq ($(shell uname), Linux)
        TOOLCHAIN = +stable-i686-unknown-linux-gnu
        BINARYNAME = libcef_ui.so
        OUPUTNAME = cef_ui.so
        # Tetap menggunakan 'cp' untuk Linux/Unix
        CP_RELEASE = cp target/release/$(BINARYNAME) plugins/$(OUPUTNAME)
        CP_DEBUG = cp target/debug/$(BINARYNAME) plugins/$(OUPUTNAME)
    endif
endif

# ---

# Target 'release' untuk membuat build rilis dan menyalinnya
release:
	cargo $(TOOLCHAIN) build --release
	$(CP_RELEASE)

# ---

# Target 'debug' untuk membuat build debug dan menyalinnya
debug:
	cargo $(TOOLCHAIN) build
	$(CP_DEBUG)

# ---

# Target 'setup' untuk memastikan dependensi dan membangun proyek
setup:
	sampctl ensure
	sampctl build

# ---

# Target 'ensure' untuk memastikan dependensi sampctl
ensure:
	sampctl ensure

# ---

# Target 'run' untuk membangun dan menjalankan proyek
run:
	sampctl build
	sampctl run

# ---

# Target 'clean' untuk membersihkan hasil build
clean:
	cargo clean