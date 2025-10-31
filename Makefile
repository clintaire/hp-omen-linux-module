install:
	dkms install --force .

uninstall:
	dkms remove hp-omen-wmi/0.6.2 --all

all: install
