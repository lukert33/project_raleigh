require 'docx'
doc = Docx::Document.open('nash_thru_p73.docx')

doc.paragraphs[0..40].each_with_index do |p, i|
  p "#{i}: #{p}"
end
