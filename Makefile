DIR := /home/sintan/Code/git/my-nvim-config 
LOCKFILE := nvim-pack-lock.json

push: 
	./push_pull.sh push

pull: 
	./push_pull.sh pull

pull-local: 
	./push_pull.sh pull-local

push-clean:
	rm -rf ~/.config/nvim
	git clone --branch private --single-branch $(DIR) ~/.config/nvim
	for server in server vps pi3b pizero; do \
		echo "Cleaning $$server..." \
		ssh -o ConnectTimeout=5 $$server-ts-plain \
		"rm -rf ~/.config/nvim && \
		git clone https://github.com/SinTan1729/my-nvim-config ~/.config/nvim" \
	done

rebuild:
	nvim --headless +ZRestore +w +qa &>/dev/null
	nvim --headless +ZClean +qa &>/dev/null
	for server in server vps pi3b pizero; do \
		echo "Syncing plugins in $$server..."
		ssh -o ConnectTimeout=5 $$server-ts-plain \
		"nvim --headless +ZRestore +w +qa >/dev/null 2>&1 && \
		 nvim --headless +ZClean +qa >/dev/null 2>&1"; \
	done

update-lock:
	nvim --headless +ZUpdate +w +qa &>/dev/null
	cp ~/.config/nvim/$(LOCKFILE) $(DIR)
	git add $(LOCKFILE)
	git commit -m "chore: Updated $(LOCKFILE)"

cherry-pick:
	git switch main
	git cherry-pick private~1..private
	git switch private

push-lock: update-lock cherry-pick
	git push --all

.PHONY: push pull push-local push-clean update-lock rebuild push-lock
