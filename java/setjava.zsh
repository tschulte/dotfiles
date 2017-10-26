# set the java version for the current shell
# usage: setjava 9
function setjava {
    # locally set java version for the current bash
    JINFO_FILE=/usr/lib/jvm/.$1.jinfo
    if [[ ! -f $JINFO_FILE ]]
    then
        JINFO_FILE=/usr/lib/jvm/.java-$1-oracle.jinfo
    fi
    if [[ ! -f $JINFO_FILE ]]
    then
        echo "Java Version $1 not found"
    else
        export JAVA_HOME=`echo $JINFO_FILE | sed -r 's/[.](jinfo)?//g'`
        echo "New JAVA_HOME: $JAVA_HOME"
        `cat $JINFO_FILE | sed -r -e '/^(jdk|jre)/!d' -e 's/\S+ (\S+) (.*)/alias \1=\2/' | sort | uniq`
    fi
}
