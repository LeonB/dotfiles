# export JAVA_HOME=$HOME/bin/tuxjdk
export JAVA_HOME=$HOME/bin/jre1.8.0_72/
export PATH=`smart_prepend PATH $JAVA_HOME/bin`
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on \
                      -Dswing.aatext=true \
                      -Dsun.java2d.xrender=true \
                      -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
