pxe-config.ign: pxe-config.yml
	ct -in-file pxe-config.yml -out-file pxe-config.ign

ipxe.usb: coreos-stable.ipxe
	docker run --rm -it -v ${CURDIR}:/ipxe-stuff quay.io/andrewrothstein/ansible-ipxe:alpine_3.6 /usr/local/bin/make-ipxe-usb /ipxe-stuff/coreos-stable.ipxe /ipxe-stuff

clean:
	rm ipxe.usb
