#!/usr/bin/ruby
require "summarizer"

url = ARGV[0]
#if url is invalid raise assertion 
raise "Invalid URL" unless url.match(/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix)

summarydir = "/home/hmlatapie/sshfs_share/ebooks_consolidated/gpt3/summaries"
#check if directory summarydir exists
raise "Summary directory is not writable" unless File.writable?(summarydir)

#change directory to summarydir
Dir.chdir(summarydir)

puts url

#extract filename from url
filename = url.split("/").last
puts filename

#concatenate extension ".summary" to filename
filename_summary = filename + ".summary"
puts filename_summary

#download file from url
`wget -U NoSuchBrowser/1.0 #{url}`

if File.exist?(filename_summary)
  #print file filename_summary to stdout
  File.open(filename_summary, "r") do |f|
    f.each_line do |line|
      puts line
      end
    end
    puts "Summary file already exists"
    exit
end

# get first parameter and pass it to the summarize method
summary = Summarizer.summarize(url)

#print summary 
puts summary

#save summary to file 
File.open(filename_summary, 'w') { |file| file.write(summary) }
