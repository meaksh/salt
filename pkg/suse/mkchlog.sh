echo "Generating changelog entry for Salt package"
if ! osc vc _temp.changes;
then
    exit 1;
fi

echo "Update changelog files"
echo >> _temp.changes
echo "$(cat _temp.changes salt.changes)" > salt.changes
git add salt.changes

for i in $(ls changelogs/*/salt.changes); do
    echo "$(cat _temp.changes $i)" > $i
    git add $i
done

rm _temp.changes
