
possible_arguments=( 'files' 'merge' 'tag' 'untag' 'copy' 'delete' 'rename' )

if [[ ${possible_arguments[@]} != *"$1"* ]]
then
	tmsu "$@"
	exit
fi

tags=($(tmsu tags))

add_tag=$(printf '%s\n' ${tags[@]} | fzf --height=50% --print-query --margin=1 --border=rounded | tail -1)
selected_tags=( $add_tag )
tags=( "${tags[@]/$add_tag}" )

echo -e 'Selected tags:'
echo -ne "\r${selected_tags[@]}"


while [ $add_tag ]
do
	add_tag=$(printf '%s\n' ${tags[@]} | fzf --height=50% --print-query --margin=1 --border=rounded | tail -1)
	selected_tags=( ${selected_tags[@]} $add_tag )
	tags=( "${tags[@]/$add_tag}" )

	echo -ne "\r${selected_tags[@]}"
done


echo -e "\r${selected_tags[@]}"

echo -e "Executing:\n\$tmsu $@ ${selected_tags[@]}"

tmsu "$@" "${selected_tags[@]}"
