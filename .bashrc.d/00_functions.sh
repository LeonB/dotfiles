function smart_append {
    var=$1 #PATH for example
    new_path=$2
    old_path=${!var}
    # old_path=eval \$$var
    echo ${old_path:+$old_path:}${new_path}
}

function smart_prepend {
    var=$1 #PATH for example
    new_path=$2
    old_path=${!var}
    # old_path=eval \$$var
    echo ${new_path}${old_path:+:$old_path}
}

