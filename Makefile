BOARD ?=
BUILD_DIR := $(abspath build/${BOARD})
SHIM_OUTPUT 	:= shim.bin
RECOVERY_OUTPUT := recovery.bin
MINIOS_OUTPUT 	:= minios.bin

ifeq ($(strip $(BOARD)),)
$(error no board passed. re-run with BOARD=target_board)
endif

ifeq ($(VERBOSE),1)
Q := 
DEBUG_FLAGS := --debug
else
Q := @ 
DEBUG_FLAGS := 
endif

all: $(BUILD_DIR)/$(SHIM_OUTPUT) $(BUILD_DIR)/$(MINIOS_OUTPUT) $(BUILD_DIR)/$(RECOVERY_OUTPUT)

# shorthands
shim: $(BUILD_DIR)/$(SHIM_OUTPUT)
minios: $(BUILD_DIR)/$(MINIOS_OUTPUT)
recovery: $(BUILD_DIR)/$(RECOVERY_OUTPUT)

# echo formatting:
# "[two-space padding][12-character buffer for the action we're doing][two-space padding][extra stuff, e.g: file, board]"
$(BUILD_DIR)/$(SHIM_OUTPUT):
	${Q}mkdir -p $(BUILD_DIR)
	${Q}echo "  SHIM          $(BOARD)"
	${Q}bash shim/builder.sh --board $(BOARD) $(DEBUG_FLAGS) --output $@

$(BUILD_DIR)/$(MINIOS_OUTPUT):
	${Q}mkdir -p $(BUILD_DIR)
	${Q}echo "  MINIOS        $(BOARD)"
	${Q}bash minios/builder.sh --board $(BOARD) $(DEBUG_FLAGS) --output $@

$(BUILD_DIR)/$(RECOVERY_OUTPUT):
	${Q}mkdir -p $(BUILD_DIR)
	${Q}echo "  RECOVERY      $(BOARD)"
	${Q}bash recovery/builder.sh --board $(BOARD) $(DEBUG_FLAGS) --output $@

clean:
	${Q}echo "  CLEAN"
	rm -rf build/kefka
