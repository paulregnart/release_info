class ReleaseInfo
  `git fetch --tags`
  tags = `git tag`.split("\n")

  puts "There are #{tags.count} tags for this repo."
  @rc_hash = Hash.new{|h,k| h[k] = 0 }

  tags.each do |tag|
    if tag.include?(".rc")
      tag_rc = tag.split(".").last
      @rc_hash[tag_rc.to_sym] += 1
    end
  end
  puts Hash[@rc_hash.sort]
end
