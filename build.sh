#!/bin/bash
version=$(cat VERSION|tr -d "\n")
newversion=$(echo "$version + .01"|bc)
filename=BrettsPopclipExtensions$newversion.zip
for file in *.popclipext; do zip ${file}z $file/* &> /dev/null; done
zip $filename *.popclipextz README.md &> /dev/null
rm *.popclipextz
[[ $USER == "ttscoff" ]] && mv BrettsPopclipExtensions$newversion.zip ~/Sites/dev/bt/source/downloads/

if [[ $1 == "pub" ]]; then
	res=$(/usr/bin/env ruby -rcsv -rfileutils <<EORUBY
csvfile = File.expand_path("~/Sites/dev/bt/downloads.csv")
FileUtils.cp(csvfile, csvfile+".bak")
downloads = CSV.read(csvfile)
t = Time.now
updated = t.strftime("%a %b %d %H:%M:%S %z %Y")
updated_short = t.strftime("%Y-%m-%d")
f = File.open(csvfile,"wb")
downloads.map! {|row|
  if row[0] == "78"
    answers = {"id" => "78", "version" => "$newversion", "filename" => "$filename"}
    row[2] = %Q{/downloads/#{answers["filename"]}}
    row[3] = answers["version"]
    row[7] = updated
  end
  f.puts row.to_csv
}
project_file = File.expand_path("~/Sites/dev/bt/source/_projects/bretts-popclip-extensions.md")
project_text = IO.read(project_file)
project_text.sub!(/^updated: [\d\-]+.*$/,"updated: #{updated_short}")
readme_text = IO.read("README.md")
new_version_link=%Q{_Current release version: **[$newversion](https://github.com/ttscoff/popclipextensions/releases/tag/$newverion)**_}
readme_text.sub!(/^_Current release version:.*?$/,new_version_link)
new_descriptions = readme_text.match(/<\!-- EXTENSIONS -->(.*?)<\!-- END EXTENSIONS -->/m)[1]
project_text.sub!(/<\!-- EXTENSIONS -->(.*?)<\!-- END EXTENSIONS -->/m,"<\!-- EXTENSIONS -->#{new_descriptions}<\!-- END EXTENSIONS -->")
new_changelog = readme_text.match(/<\!-- CHANGELOG -->(.*?)<\!-- END CHANGELOG -->/m)[1]
project_text.sub!(/<\!-- CHANGELOG -->(.*?)<\!-- END CHANGELOG -->/m,"<\!-- CHANGELOG -->#{new_changelog}<\!-- END CHANGELOG -->")

File.open(project_file,'w+') do |f|
	f.puts(project_text)
end
File.open("README.md", 'w+') do |f|
	puts readme_text
done

puts "OK"
EORUBY
);
	[[ $res == "OK" ]] && echo $newversion > VERSION
	git commit -am "Preparing for $newversion release"
	git release $newversion
fi
