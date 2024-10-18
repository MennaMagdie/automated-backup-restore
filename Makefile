SRC_DIR ?= ~/Uni/OS/menna-real/
DEST_DIR ?= ~/Uni/OS/menna-backup/
INTERVAL_SEC ?= 3
MAX_BACKUPS ?= 4

prebuild:
	mkdir -p $(DEST_DIR)

backup: prebuild
	./backupd.sh $(SRC_DIR) $(DEST_DIR) $(INTERVAL_SEC) $(MAX_BACKUPS)
	
restore:
	./restore.sh $(SRC_DIR) $(DEST_DIR)

.PHONY: prebuild backup restore