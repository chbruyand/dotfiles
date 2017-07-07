for file in ~/.profile ~/.bashrc ; do
    if [ -f ${file} ] ; then
        . ${file}
    fi
done
