class Invoice
  # Class method (can be called outside the class)
  def self.print_out
    "Printed out invoice"
  end

  # Instance method (only available if an instance is created)
  def convert_to_pdf
    "Converted to PDF"
  end
end

Invoice.print_out

i = Invoice.new
i.convert_to_pdf