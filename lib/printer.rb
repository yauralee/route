class Printer
  def self.print_result(result_array)
    result_array.each_with_index do |result, counter|
      puts 'Output #' + counter.to_s + ' : ' + result
    end
  end
end
