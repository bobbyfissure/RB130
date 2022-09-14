require 'minitest/autorun'
require_relative 'transaction'

# class TransactionTest < MiniTest::Test 
  
#   def test_prompt_for_payment
#     transaction = Transaction.new(30)
#     input = StringIO.new("30\n")
#     transaction.prompt_for_payment(input: input)

#     assert_equal(30, transaction.amount_paid)
#      assert_output("You owe $50.\nHow much are you paying?") do
#        transaction.prompt_for_payment(input:input)
#     end
#   end


# end


class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end

