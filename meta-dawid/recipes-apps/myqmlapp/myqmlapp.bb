SUMMARY = "Simple QML app"
LICENSE = "CLOSED"

SRC_URI = "file://hello.qml"

S = "${WORKDIR}"

inherit allarch

do_install() {
    install -d ${D}/opt/myqmlapp
    install -m 0644 ${WORKDIR}/hello.qml ${D}/opt/myqmlapp/
}

FILES:${PN} += "/opt/myqmlapp"
