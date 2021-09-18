class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value) 
    splited_value = value.split

    if splited_value.size < 3
      record.errors[attribute] << (options[:message] || "amount mustn't be less than 3")
    elsif splited_value.size.even?
      record.errors[attribute] << (options[:message] || "amount must be odd")
    elsif splited_value.uniq.size != splited_value.size
      record.errors[attribute] << (options[:message] || "mustn't have duplicates")
    end
  end
end