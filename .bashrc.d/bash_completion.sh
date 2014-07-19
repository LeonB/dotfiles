for file in ~/.bashrc.d/bash_completion.d/*
do
    if [ -f "$file" ]
    then
        source $file
    fi
done
