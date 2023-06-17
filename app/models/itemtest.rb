class Itemtest < ApplicationRecord
  belongs_to :responsetype
  belongs_to :onetest
  #belongs_to :tagtest
  
  has_many :paragraphtests
  has_many :responserights

  accepts_nested_attributes_for :paragraphtests, allow_destroy: true
  accepts_nested_attributes_for :responserights, allow_destroy: true

  def title_full
    onetest.title + " [" + title + "]"
  end

  def to_s
    onetest.title + " [" + title + "]"
  end

  def questions
    paragraphtests.filter do |paragraphtest|
      paragraphtest.paragraphtype_id == 2
    end
    .sort_by { |p| p.ordernum }
  end

  def questions_order_next
    questions.size + 1
  end

  def responses
    paragraphtests.filter do |paragraphtest|
      paragraphtest.paragraphtype_id == 3
    end
    .sort_by { |p| p.ordernum }
  end

  def response_prompt
    responses.first ? responses.first.body : 'Внесите значение'
  end

  def responseright_one
    if responserights.first
      responserights.first.response
    else 
      0
    end
  end

  def responseright_to_str
    if response_is_checkbox || responsetype.id == 3
      rr = responserights.sort_by { |p| p.response }
      result = ''
      rr.each do |p|
        result = result + (result != '' ? ',' : '') + p.response
      end
      result
    else 
      responseright_one
    end
  end

  def responses_order_next
    responses.size + 1
  end

  def response_is_checkbox
    responsetype.id == 2
  end

  def right_responses(responseright)
    responses.filter do |paragraphtest|
      paragraphtest.id == Integer(responseright.response)
    end
  end

  def responserights_size
    responserights.size
  end

  def test_response(response)
    if response_is_checkbox
      logger.debug "responseright_to_str=#{responseright_to_str}"
      logger.debug "response=#{response}"
      responseright_to_str == response
    else
      result = responserights.filter do |responseright|
        responseright.response == response
      end
      result.size > 0
    end
  end

end
