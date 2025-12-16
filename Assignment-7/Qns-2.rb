html = <<~HTML
  <a href="https://example.com/file.pdf">Download</a>
  <a href="/docs/manual.pdf">Manual</a>
  <a href="https://example.com/file.txt">Text</a>
HTML

pdf_links = html.scan(/<a\s+[^>]*href=["']([^"']+\.pdf)(?:\?[^"']*)?["']/i).flatten
puts "PDF Links found:"
pdf_links.each { |link| puts link }