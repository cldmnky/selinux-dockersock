.PHONY: load
load: dockersock.pp
	semodule -i $^

dockersock.mod: dockersock.te
	checkmodule -M -m $< -o $@

dockersock.pp: dockersock.mod
	semodule_package -m $< -o $@

.PHONY: clean
clean::
	rm -f dockersock.pp dockersock.mod
