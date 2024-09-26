VENV:=.venv
WEST:=$(VENV)/bin/west

.PHONY: all initial-setup build-os run-os-qemu

all: build-os

$(VENV):
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install -U pip west

initial-setup: $(VENV)
	[ -d .west ] || $(WEST) init -l zephyr-manifest
	$(WEST) update
	$(WEST) zephyr-export
	$(VENV)/bin/pip install -r zephyr/scripts/requirements.txt

build-os: $(VENV)
	$(WEST) build -p -b qemu_x86 myos

run-os-qemu: $(VENV)
	$(WEST) build -t run

