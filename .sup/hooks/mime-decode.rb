unless sibling_types.member? "text/plain"
  case content_type
  when "text/html"
    `/usr/bin/lynx -dump '#{filename}'`
  end
end
