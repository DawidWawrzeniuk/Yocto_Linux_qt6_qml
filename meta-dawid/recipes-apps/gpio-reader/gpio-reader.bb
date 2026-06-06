SUMMARY = "GPIO reader using libgpiod"
DESCRIPTION = "Simple GPIO polling application for Yocto"
LICENSE = "CLOSED"

SRC_URI = "file://main.cpp"

S = "${WORKDIR}"

DEPENDS = "libgpiod"

do_compile() {
    ${CXX} ${CXXFLAGS} ${LDFLAGS} main.cpp -o gpio-reader -lgpiod
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 gpio-reader ${D}${bindir}/gpio-reader
}
