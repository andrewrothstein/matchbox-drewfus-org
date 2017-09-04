pxe-config.ign: pxe-config.yml
	ct -in-file pxe-config.yml -out-file pxe-config.ign

ipxe.usb:
	docker run --rm -it -e EMBED=/ipxe-stuff -v ${CURDIR}:/ipxe-stuff quay.io/andrewrothstein/ansible-ipxe:alpine_3.6 /usr/local/bin/make-ipxe-usb /ipxe-stuff

clean:
	rm ipxe.usb
