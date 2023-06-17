class Testexecstep < ApplicationRecord
  belongs_to :testexec
  belongs_to :itemtest

  def responsetype_id
    itemtest.responsetype.id
  end

  def response_to_str(str_response)
    if !str_response
      ''
    elsif responsetype_id == 3 || responsetype_id == 4
      str_response
    elsif responsetype_id == 1 || responsetype_id == 2
      r = ''
      str_response.split(',').each do |s|
        body = Paragraphtest.find(Integer(s)).body
        r = r + (r != '' ? ',' : '') + body
      end
      r
    end
  end

end
