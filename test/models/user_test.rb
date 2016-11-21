require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	def setup 
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")

	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "    "
		assert_not @user.valid?
	end 

	test "email should be present" do
		@user.email = "    "
		assert_not @user.valid?
	end 

		test "name should not be too long" do
		@user.name = "a"*51
		assert_not @user.valid?
		end


		test "email should not be too long" do
		@user.name = "a"*256
		assert_not @user.valid?
		end

		test "email validation should accept valid addresses" do
		valid_addresses = %w[user@example.com DILBERT_2020@uppercaseunderscore.com name.name@dots.com japan+plus@smalldomainsplus.jp]
		valid_addresses.each do | valid_address |
			@user.email = valid_address
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
		end


		

		test "email validation should reject invalid addresses" do
		invalid_addresses = %w[logan@logan,com bar@ba_z.com logan.com]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?
		end
		end
		
	
		test "email addresses should be unique" do
    	duplicate_user = @user.dup
    	@user.save
   		 assert_not duplicate_user.valid?
 	 	end

 	 	test "password should be long enough" do
		@user.password = @user.password_confirmation = "a"*3
		assert_not @user.valid?
		end

  end


