version=$(cat VERSION|tr -d "\n")
newversion=$(echo "$version + .1"|bc)
for file in *.popclipext; do zip ${file}z $file/*; done
zip BrettsPopclipExtensions$newversion.zip *.popclipextz README.md
rm *.popclipextz
echo $newversion > VERSION
[[ $1 == "pub" ]] && git release $newversion
[[ $USER == "ttscoff" ]] && mv BrettsPopclipExtensions$newversion.zip ~/Sites/dev/bt/source/downloads/
