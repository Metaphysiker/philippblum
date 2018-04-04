require 'pathname'


namespace :insert do

  desc "inserts teachings from directory"
  task teaching: :environment do
    rails runner 'Pdf.create({
               title: "wittgen",
               file: File.new("/home/sandro/Downloads/wittgensteinmoralrealism.pdf")
           })'
  end


  desc "it does a thing"
  task :work, [:path] => [:environment] do |t, args|


    Pathname.new(args.path).children.each do |path|
      puts path
    end

  end



end