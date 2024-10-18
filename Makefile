SRC_DIR ?= ~/Uni/OS/menna-real/
BACKUP_DIR ?= ~/Uni/OS/menna-backup/
INTERVAL ?= 3
MAX_BACKUPS ?= 4

prebuild:
	mkdir -p $(BACKUP_DIR)

backup: prebuild
	./backupd.sh $(SRC_DIR) $(BACKUP_DIR) $(INTERVAL) $(MAX_BACKUPS)
	
restore:
	./restore.sh $(SRC_DIR) $(BACKUP_DIR)

.PHONY: prebuild backup restore