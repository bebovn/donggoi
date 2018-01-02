TEMPLATE = aux

INSTALLER = installer
win32 {
    EXTRA_FILES ~= s,/,\\,g
    BUILD_DIR ~= s,/,\\,g
    DESTDIR = $${DEST_LIBS}
    DEST_DIR = $$DESTDIR/include
    RC_FILE = nhansu.rc
    #DEST_DIR ~= s,/,\\,g
    DEST_INCLUDE_DIR ~= s,/,\\,g
    LIBS += -L$${DEST_LIBS}
    target.path = $${DEST_DIR}
    for(FILE,EXTRA_FILES){
        QMAKE_POST_LINK += $$QMAKE_COPY \"$$FILE\" \"$${DEST_INCLUDE_DIR}\" $$escape_expand(\\n\\t)
    }
    QMAKE_POST_LINK += $$QMAKE_COPY_DIR \"$${DEST_INCLUDE_DIR}\" \"$${DEST_DIR}\"
    INSTALLS = target
}
#message($$PWD)
INPUT = $$PWD/config/config.xml #$$PWD/../build/5.8.0/win32/release/lib
message($$INPUT)
example.input = INPUT
example.output = $$INSTALLER
#example.commands = ../../Qt/QtIFW2.0.5/bin/binarycreator --online-only -c $$PWD/config/config.xml -p $$PWD/packages ${QMAKE_FILE_OUT}
example.commands = ../../Qt/QtIFW2.0.5/bin/repogen --update-new-components -p packages_update kinhdoanh
example.CONFIG += target_predeps no_link combine
QMAKE_EXTRA_COMPILERS += example
OTHER_FILES = README

DISTFILES += \
    packages/QtCoreLib/meta/package.xml \
    packages/QtCoreLib/meta/installscript.qs \
    packages/report/meta/package.xml \
    packages/report/meta/installscript.qs
