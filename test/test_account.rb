require 'test_helper' 

class AccountTest < ActiveSupport::TestCase 
    test 'should not save user' do 
        account = Account.new 
        assert_not account.save 
    end 
        
    test 'should save user' do 
        account = Account.new(email: 'example@mail.ru', password: 'password') 
        assert account.save! 
    end 
        
    test 'should find user' do 
        assert Account.find_by(email: 'test1@test.com') 
    end 
end