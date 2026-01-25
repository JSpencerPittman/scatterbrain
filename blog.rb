def handle_new
    print "Title: "
    title = STDIN.gets.chomp
    date = Time.now.strftime("%Y-%m-%d")
    filename = "#{Time.now.strftime("%Y-%m-%d")}-#{title}.md"
    filepath = "_posts/#{filename}"

    File.open(filepath, "w") do |f|
        f.write("---\nlayout: post\ntitle: #{title}\n---\n")
    end
end

def handle_post
    `git add _posts`
    `git commit -m "Post blog"`
    `git push`
end

def handle_local
    `bundle exec jekyll serve --port 4001`
end

operation = ARGV[0]

case operation
when "new"
    handle_new
when "post"
    handle_post
when "local"
    handle_local
else
    puts "Invalid operation \"#{operation}\"."
end
