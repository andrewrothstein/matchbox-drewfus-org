pxe-config.ign: pxe-config.yml
	ct -in-file pxe-config.yml -out-file pxe-config.ign

coreos.ipxe.usb: coreos.ipxe
	docker pull quay.io/andrewrothstein/ansible-ipxe:alpine_3.6
	docker run --rm -it -v ${CURDIR}:/ipxe-stuff quay.io/andrewrothstein/ansible-ipxe:alpine_3.6 /usr/local/bin/make-ipxe-usb /ipxe-stuff/coreos.ipxe /ipxe-stuff/coreos.ipxe.usb

rancheros.ipxe.usb: rancheros.ipxe cloud-config.yml
	docker pull quay.io/andrewrothstein/ansible-ipxe:alpine_3.6
	docker run --rm -it -v ${CURDIR}:/ipxe-stuff quay.io/andrewrothstein/ansible-ipxe:alpine_3.6 /usr/local/bin/make-ipxe-usb /ipxe-stuff/rancheros.ipxe /ipxe-stuff/rancheros.ipxe.usb

clean:
	rm *.usb
